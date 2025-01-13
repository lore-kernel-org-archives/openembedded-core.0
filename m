Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2113C02180
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 20:45:18 +0000 (UTC)
Received: from sonic312-21.consmr.mail.bf2.yahoo.com (sonic312-21.consmr.mail.bf2.yahoo.com [74.6.128.83])
 by mx.groups.io with SMTP id smtpd.web10.28590.1736801117740696487
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Jan 2025 12:45:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=VlAKYqY/;
 spf=neutral (domain: yahoo.com, ip: 74.6.128.83, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1736801116; bh=Ea9uj1noJmn62n4+kblL9uGUdnsTxIZLayYox4VGxPE=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=VlAKYqY/cwMpocPdSZMlI3fgmIf0TZT7MVLZUAuWaFdLuZVHmkzvnqPwyZrmLhA1jk9bhq0TU5YkpBmfjcronPOMygCw+ilb6w6ukiZaFQ5VGC9bGVmW6BBsK+ml2GVKNvIuso3+FmPU5D2l8LbahIkysHMvhHrE3qGN1gTx25xnCml23fTh8ZXymYwJNVENpAK4xoJojCIpVmtIB5uYc2tKM+mdePRXmBY+PcnNuG0ghFx59IBuhYmaTO8ebJ9ALYtd6gbTOWEsRrhiT1yaPGpfJtzxWwVSDbHY3NrhTXb1bH3E11v2KnngEjJzdTpUgWwjKY/nik4m8DFOhG55rw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1736801116; bh=jOSqfx8vX9PehDJYQS6TGxZ7OKzHBx4SgTDqmfCRH3w=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=P9rsdHh8uDmpK9b7i7rHesmxhALUI0+0VhwRZc7poyg2MsqfwZhToFoGjcsi6Tj6U8qjwZKdbJ7LD2B1a2xxQ95kjbQ/wHBbyip5m4KcVUXZdUhgSgklV/l6DHBzT08vzP84LhOB7g5mXSfVBrzuJeOLoLicIn8H1bqZj7NxuiscbUXTsJ6F0O+IkGqo7dhR3NYfHEfWr/EFFv7P8hWnPWNiNP5WTdWtwJHbx45Eoa7E7A2bj9FAnh4/5q1ftck2x5AfoGKVrd/qNqv6P83JBZEyF9kp+3cC1kBOk1Z+EbJxJ06wgwZ9F8shJJP0DkxWCEEsNiJFx2+GjfGUosh04Q==
X-YMail-OSG: kfHcCXAVM1mCCApRBKeiFNNBMGUPOIJpQjtjnyl.nXPsuFomO8S96etVQHNbs1K
 vk67VZ5lPU1esMyeJpQhfnvBu3fXcq.H3xPZrAVFlShhVh613ShJSzC_QxVFUeMhOXmvaTRcF72E
 y26J7yDkCi8NrZUvX8GNWeBzkuqNqj4OPUcpNvylJ3uwTP5uLdA5a7Q_N3pimcWHouOp59wm723m
 td9J27ntMGElelvxqAtj5yRaVNqI8uoQV.abNYDi83uJGo9g4hBXAJaRpPsj4L4FhSI0c0_RpCLh
 OBW3glKtklU6P67J7H9TzshqR5WWgBNJ_L1hHr7dgD0mSMv3_BhNB0qDzUFS89F1bZzae.34zZfv
 gNH7IqFNYRn43Q3So3G7DSUcpFk6O2pn1izw01WZioUbr4U9Jqc2rABUvDU29rpM9GY61.nPCt6B
 G30EOA7844D_XLW0ottY8GfqiirvSjMrQmbjjOm3ZEy3J2qN4UcHkpbbhT0hY.WG3Ov9HkE.F_p0
 lUDbCZyaB2BZmqyY1ZL6vzI9.fqZib8.muZzu2oB_a8GX70QosgF9b5PR7jlWh7mm240sCBug_74
 PN01onGG5_Ddgfu9gaXtoHAgp3FlTzIY2P2t.6GFRvyl7NBs9CJtZ0Ik4R6feujudPziLyEudL5y
 TQy4Oj0_TrdDKGRTfezy1uzjZsnSDg4.XQSgt92iiK6YewFAibCJuAQZQWgDTgasWV.7IUrqaWGf
 8Brv.ozg2zWkcmKzi5wiMInb1eeapb2QuEcgnGI9gU7zPOJ91_OjLkA8UT2aN976uVnDgI8wHWFT
 NTTkTMYOgx72CuAmdi2qpCR8Ie_i1Ug6y3uZvApSbZWwEZiCWZBs1Sl0DJSqwcBlrR8M6cfIvkBV
 edrFpUy1HpvOYmdTljI0rMOxg5qMCtgXGnE7Jp2nK1_7vVjrCN_5lcTUvA3XW226JplrLixhqEGZ
 UR8HTf6vzLDuHH1_EUuAWF57x3B.5H7w1KGQCXRBYlmElHAj4ERQcjAiHdeqRxghZarerLm7Fy_2
 2h6TU1OHoUiCXshXGnTLJPIqUpDdLrpXHR.WJszylL1ZR4jRnCYOU23GELZdQz7QmMEW5wIMNet0
 9anIUmAFGANgDNAWiAJpGgu4fg1v2iu4IWc2FkvWPFZrHG2qpWbN3fItNuvMWAjpGu0eM5WgN6cY
 16Gn9qUMSIuZrSQOfeBjuwQAN2Pm_UVflpj1KcvqkbkeYk5SgGa94J8LWeQt7nYrRbQdX0vBAN48
 HOx.q8DDbuer6WJMR5p1D.Bjd4N7F5a4El8QPBCWZpU5hB.JY1Y3B.V_vNguitIfOtUMHVrlHraE
 NRhwopUrP0aQi8B3TbAyrRPQV0DO98y3o7QlUxluFrz1X814vPDUnWI_ZLw8MzUjOWl8HopQ0mkE
 6iEHCQPrIXMFC9hxmtI8tlTu9U3sn7jI9iqDpWkbXyTUAtd4m2wo2dsAG.Kr1fBNhxX6nPqUhi09
 S.WL5lhywkZOqW6yASf7FoKvrImUPqsl82aRY2Px4KC6SUzjBbmR4zS0aUsyO.nvETHccFruGUfH
 GS5k8Eq53l68Fo..0F9G1h1xJqinr5_j0G9z7UeZ6U6t4mw0oTxX9alVOFuGFyE1GU5GGThyZw.x
 psyoOeDeV2X15xgikHUvw9gkg49FGdIOj4EujDA41eLCihAB7XzaGD0auDKkvMv52E85wmVyR40r
 oeH4.KCpMAbXan8gHvCpXK6FZ7acWyfovFhwUVwg5jsmVqsL8Lo5e9YhjAJ0uBZPp22cd0fbuyG6
 7uD__1JzlEP52tU3CQ3WiwrjNyx.6umJtdIPFIgy7LsbixplE8rW8vmDgYqeLk10jBH57pO5BePF
 AD_7kTAajNhaXAlS5529jaE00nshIiu4KEW5A6_occJsUfN7VPx5112Fdi5B3cg9Q09dUG.tBspX
 Ljb.CnLaKif14GkbseO1ooLW3J_8tYYcYwrh9eeKDVDOIZvzkDsBT4bXeOsmsQOtWHP5_Qd.o6Xu
 9sR0rWWiXrFN.EqOcA56rZEbXdd6.nkB6.FWuWiWqovk7uZMrxvgmEgs0nVqKpcyGDFwdLO13vJh
 y4G6dB6t2qgaKA8hJF57GDl0a5vJnM0m5T5mTI1MRLemTimdd_A2XSBtKwnNoD8OeulBN9iHEK4S
 FfFrtCsPfLgO3Mj7Ne3d6FIoUoAuz.qsuUDezmnZMyiJdePwZLkXKtNY4ejqg0eOrKriQ6_5nKka
 13hhSjYFcY1ndHVG_cn.FvnitJHL4oMRZLcSU.F6FyT9Ik28y974cIbFr7p8-
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 455a4762-36c8-40f1-b95e-6a4564d68e4e
Received: from sonic.gate.mail.ne1.yahoo.com by sonic312.consmr.mail.bf2.yahoo.com with HTTP; Mon, 13 Jan 2025 20:45:16 +0000
Received: by hermes--production-ir2-c694d79d9-h5tj6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 6df41f99f0ccc6c99bf2b10ab434a0bb;
          Mon, 13 Jan 2025 20:45:14 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>
Subject: [meta-oe][PATCH] Sanity test for cpp toolchain
Date: Mon, 13 Jan 2025 21:44:47 +0100
Message-Id: <20250113204447.14948-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250113204447.14948-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Jan 2025 20:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209743

Some users have reported issues which were caused because they were missing the right libstdc++-version-dev in their system.
A new function with the name 'check_cpp_toolchain'  was added in sanity.bbclass in order to verify that the host system can compile and link successfully a 'hello world' c++ code.
In case the test fails , the build will abort
Fixes [YOCTO #bug-15712]

Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
 meta/classes-global/sanity.bbclass | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 7b8a497d5a..ca7f8117d6 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -780,6 +780,44 @@ def sanity_check_locale(d):
     except locale.Error:
         raise_sanity_error("Your system needs to support the en_US.UTF-8 locale.", d)
 
+def check_cpp_toolchain():
+    # it checks if the c++ compiling and linking works properly in the native system
+    import os
+    import subprocess
+    from tempfile import NamedTemporaryFile
+
+    try:
+        with NamedTemporaryFile(delete=False, suffix=".cpp") as cpp_file:
+            cpp_code = """
+            #include <iostream>
+            int main() {
+                std::cout << "Hello, World!" << std::endl;
+                return 0;
+            }
+            """
+            cpp_file.write(cpp_code.encode('utf-8'))
+            cpp_file_name = cpp_file.name
+
+        output_binary = cpp_file_name + ".out"
+        compile_command = ['g++', '-std=c++17', cpp_file_name, '-o', output_binary]
+        result = subprocess.run(compile_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+
+        if result.returncode == 0:
+            #os.remove(cpp_file_name)  
+            #os.remove(output_binary)
+            return False
+        else:
+            bb.fatal(f"C++ toolchain check failed during compilation or linking. Error:\n{result.stderr.decode()}")
+            return True
+    except Exception as e:
+        bb.fatal(f"An unexpected issue occured during the C++ toolchain check {str(e)}")
+        return True
+    finally:
+        if cpp_file_name and os.path.exists(cpp_file_name):
+            os.remove(cpp_file_name)
+        if output_binary and os.path.exists(output_binary):
+            os.remove(output_binary)
+
 def check_sanity_everybuild(status, d):
     import os, stat
     # Sanity tests which test the users environment so need to run at each build (or are so cheap
@@ -975,6 +1013,8 @@ def check_sanity_everybuild(status, d):
         # forms, such as /bin/dash, bin/bash, /bin/bash.bash ...
         if '/dash' not in real_sh and '/bash' not in real_sh:
             status.addresult("Error, /bin/sh links to %s, must be dash or bash\n" % real_sh)
+    
+    check_cpp_toolchain()
 
 def check_sanity(sanity_data):
     class SanityStatus(object):
-- 
2.34.1


