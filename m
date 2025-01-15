Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC836C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 19:39:55 +0000 (UTC)
Received: from sonic308-2.consmr.mail.bf2.yahoo.com (sonic308-2.consmr.mail.bf2.yahoo.com [74.6.130.41])
 by mx.groups.io with SMTP id smtpd.web11.31128.1736969991385261004
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jan 2025 11:39:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=dZAze0Fg;
 spf=neutral (domain: yahoo.com, ip: 74.6.130.41, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1736969990; bh=EGaoSKzPjDjKLrdMMqvsS3jhWTh+4PujjujTDVZcP8E=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=dZAze0FgFoTd27/k1Jyk4RoiaKKAVIlbu/JpdCDuT/3mXVdYJaNiQv+FTuyLZxysVU5SiMf5ff3lsbIvkHvAdIGtn5TmnirJauKgJoLQJZxVmkXYAvtduEBgyOqb09RbJZ4++6K0hvvVdN5OOoq5t3T6P68Bc8Pz3tCA+2n7hnGhjSzNSC3OM3eZLwoEfHwZptAkMiAtIwvSKJzYjF1JVBiLT/61CnHtgDRjaltfgCMFI54CbcYx1OqoqBZiwD7Ba4PMPZPGihJcD/PEJLp5yRyRZ/UZmRATd9z+k1WB9XqwN+/OKfPOZkNMt9nWMCTKyz+kwt8kuz92yljOb7NzRA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1736969990; bh=araE1N5j1JDyKmd3wiQB8fHVoqIrraPmuuVwndy/mnn=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=F8FJizHzolT0zJ9IXoqe+VPaLjF05z+f1v+NwRUQ210vEBFDSwfMYOWVLkCRvqDX4j08pPhYPB3I5lCgKZ8Pjfc4USsLDYk+1GxIbY9CL12d4X0GGa2mp6w8ticXzDXcuEO0CDbcbwMPZoqgwoynx4/ZHGP/FIoRkAPn249Nf+q5WONMVBe0Q8dZaVT2qqdyPCoG8Xy2cmAdm3g9/M/xOiJe5EmML4MhbVUCv7arhA/dvSA8ksCPUOYES/UY7vXZVJSPIoBXzRAYKERxnBUpouXlgWZYGZvRVBK8RN0l9XLzzQlDa7eZVyvYdSIfmarmxX3sMKQGt9/d8jDZaQIFNg==
X-YMail-OSG: xKr.cTUVM1nj1rETn7VdvasDqzyFw3k_TLgnLVKqhQrAyRnahxJzM3H7iS6oucq
 2kmFgr6kMxoHCBSeiK91NSna78ZpbrD2md3QxmE_RbxM5UMEnxhqbcisw6ZxznLDZ4zTPnqvLqTr
 JB3rTjjcbNSMUM8.fL6a61Lzk1aD87OcV3P079sQYWBYCHXF5qFLuxtKOBGVApdzkXoE3C0fh1iq
 7cX6mh4LsIDVF1taY5BkIjNNSnRBGrdjIvArZVqrSlgmVS.BQ8JTEmmX3_EZ50mZ9aSGyVi_VENc
 wd5zQYCJALq5mIoJbFfmu_J49lKzYT6WZ5OgCJquPPvWTkvJL0_ao8E9yuJ4miC4EUqrFthuo1ZZ
 YPXmnkhvW9RNbHrcHMfKKZvsUHi3l0LlatbsTHverqMDseJgaLMdu5aOz0cdHGJwLFgz713cJ_6O
 DLz1Wchs6z9LbMm2DHTTSZiBWVyn8RFtTg5fOlz24bj8C_KuBK0Y5_1EBUB5vCw9inOggkQ77n.3
 cdDoIXTxSQZogC0hUuoSI7GRRFQwBZOvbNqHL9GmdzswG1ul08KRQnLgEBK8OzpLXlUEPEoWNjBM
 7K1QW43XmAOPIPpPp5WN6vFY8HAL93pE6DSgukt.luK8YKhIzaQH79AifGJJ77zleFpF02GgC9j2
 OdKdtM.anwjmrNEkTPOmQH1qeK3uEAyVzl7vyyfvvG7EYMQpyxeiSjCHQtB2G9R6HIj2Hppk_Qe1
 3Ago.zdNaSzpu8L8kWZ3Rw37YIXWhFmc5XyzuvSR786v3P8.vhs8qVqfqWQ.g0rjrqM_0zYHVKZB
 P0zRYXhLCmxJiC2.hiDvCXIKhY1onZe5RA58JJE2FL2np9bkAlS649VxDdWmdllP45c.eb9kGaM7
 KTLGXwJyg_38Dcf_dhTPbuwLEl9thU5TyynrVXWRu6DzdIDF48Y3KcOkVtGt0AJ2TLf6Ehq.LAgq
 MqDgQQaxzSM5q0cp8Q7jvhqBCqI1Hz_szULAJseBuAdeQfCozR3nLSrmOSprcVO6f5fOv1wBAiZp
 SoIwgRE6TETwB8WniGp02H7HfZ7ttMHBqxZ4CQ40fzIk2vs9krDSVfh4nCFSK_MPE2xlSFlXC7eu
 pCnWU9ZbXdm8.iR5ToO.q7W0dyTFig5c6NgOwWjkHpyhv5Ccx9DJREVk_tTx5Ea5NF0SSAAtKGsR
 dKmT4fCoeC_74hqXTqFk5DtZwrJr11J4LsL__X3NemWDFxh6Goh2F8emySKZMut0cdIY3z3cGN2C
 J37AaHlBH2XxEhEZDYdHOgsupj17A23N1oNSs5dAO4oTyCK9.s_2SGlyVjj1UsrfDjiHhEdbZI2r
 qR26ajaxeUPmT8FVfR1TXLZdlo8rkeEatfJ36zORpZihREIokM7pevt.13PiEP.6BCfyoAtySUah
 DT6T.OF6RloDR_XQXth_bHb23Qfr0yjhszSxip.SsCvaZFw3Lk9wLUnQYXKkkW4ISvDA3NIswixY
 rdAwTYZfWv277h7eZOOwLQrwjjpB_RGQKm6gtUA7y4bSxEEtBRT7h6ppCg7RZz4OQRk9miRKD26f
 0P.rIrYx9Dc3j6p9rayZACxL5ROzKjySflweCngAI63J8WD1jG2v9EMXdw.PxsmN2vbPSBO3MLFP
 .SN9ABZp4E_2JwMsashM62fi_u7aoXJfv6dTkMKXd_1SzYtc7C8pcZTokmnht.atwne9GmBN6WgY
 _ZnDVXaeYMbZ_GLxchZoyg2GeNgtNawx3xiGZy.nvTA1l_1.RggnXcNN0HqLxLtYgM2Kt3hFJLpp
 AraAfE94R1H15iec5PheoKM3ii.qsbPP9AsVa2lJM6hrWYL5tk8K3BCJX2lTaRMPlLdGkrSpucHL
 jt2tfx9CAdv0Y.RfAG5BGMbDptpNpARiKsSHust5GALXaCT9ohdLh_3iGKQGzDB2_Bu2u19TGhIU
 VeTHDmW7iGwDY7CTQ_jh3mgL2VlhAa_2MvnINBk8Wjc9qqui1wHoUq9MDUNOd7LisPp9c3rOtwP2
 .QEDEsTrym9yhHLmNTLWNOQEzhrTLnPwII0nFeEvCYvHAIDdGS.mR3uj_Q1rUubbIyKXfGUjbUVC
 eglLf9KzUrXlFTamISIlLF_FXlkBuoUbGfKcSqCf3w9ApArjWN2SGhbVY3bJkCSXo41P6ocMCSba
 J4T7psSoaZbZp6NPbWMS7rOcJyQZ360kNbjU2gRz_67uNp.ysXmbxfwYPUdUwYJ_m_jDakFwoiYO
 1UZiJESMmTApNP7mLXbhYmvWCRXSDeM5vpZUcFUuJjKWPyjir_Pdh2y5YCNb3giJE
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 28f724a4-07a9-42d0-aa2e-0d2ec0d67cac
Received: from sonic.gate.mail.ne1.yahoo.com by sonic308.consmr.mail.bf2.yahoo.com with HTTP; Wed, 15 Jan 2025 19:39:50 +0000
Received: by hermes--production-ir2-c694d79d9-zzg9t (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID facd77a35afdb9d458ec8d7114295858;
          Wed, 15 Jan 2025 19:39:48 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>
Subject: [PATCH v2] sanity: test for c toolchain
Date: Wed, 15 Jan 2025 20:39:17 +0100
Message-Id: <20250115193917.8133-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250115193917.8133-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jan 2025 19:39:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209924

Users reported issues caused by missing the right libstdc++-version-dev.
A new function 'check_c_toolchain' added in sanity.bbclass to test linking libstdc++
Fixes [YOCTO #<15712>]

Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
v1->v2
* use shortlog
* drop the meta-oe prefix
* fix format for bug reference
* change function description including libstdc++
* use BUILD_CC instead of specific compiler
* lines in comments are removed
* patch message less than 200 char
* bb.fatal is removed
* follow pattern of other functions in class
* use docstring instead of # in functions description
* make the print out message more clear
* fix comment style where the function is called
* change "hello world" from C++ to C program
* use gcc instead of g++
---
 meta/classes-global/sanity.bbclass | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 7b8a497d5a..3a5a1f5d66 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -780,6 +780,43 @@ def sanity_check_locale(d):
     except locale.Error:
         raise_sanity_error("Your system needs to support the en_US.UTF-8 locale.", d)
 
+def check_c_toolchain(d):
+    """
+    it checks if the c compiling and linking to libstdc++ works properly in the native system
+    """
+    import os
+    import subprocess
+    from tempfile import NamedTemporaryFile
+    
+    try:
+        with NamedTemporaryFile(delete=False, suffix=".c") as c_file:
+            c_code = """
+            #include <stdio.h>
+            int main() {
+                printf(\"Hello, World!\\n\");
+                return 0;
+            }
+            """
+            c_file.write(c_code.encode('utf-8'))
+            c_file_name = c_file.name
+
+        build_cc = d.getVar('BUILD_CC').strip()
+        output_binary = c_file_name + ".out"
+        compile_command = [build_cc, c_file_name, '-o', output_binary,'-lstdc++']
+        result = subprocess.run(compile_command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
+
+        if result.returncode == 0:
+            return None
+        else:
+            return f"C toolchain check failed to link against libstdc++. Please ensure libstdc++ and headers are installed. Error:\n{result.stderr.decode()}"
+    except Exception as e:
+        return f"An unexpected issue occurred during the C toolchain check: {str(e)}"
+    finally:
+        if c_file_name and os.path.exists(c_file_name):
+            os.remove(c_file_name)
+        if output_binary and os.path.exists(output_binary):
+            os.remove(output_binary)
+
 def check_sanity_everybuild(status, d):
     import os, stat
     # Sanity tests which test the users environment so need to run at each build (or are so cheap
@@ -976,6 +1013,9 @@ def check_sanity_everybuild(status, d):
         if '/dash' not in real_sh and '/bash' not in real_sh:
             status.addresult("Error, /bin/sh links to %s, must be dash or bash\n" % real_sh)
 
+    # Check if linking with lstdc++ is failing 
+    status.addresult(check_c_toolchain(d))
+
 def check_sanity(sanity_data):
     class SanityStatus(object):
         def __init__(self):
-- 
2.34.1


