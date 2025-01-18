Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09DD8C02185
	for <webhook@archiver.kernel.org>; Sat, 18 Jan 2025 12:01:53 +0000 (UTC)
Received: from sonic317-28.consmr.mail.bf2.yahoo.com (sonic317-28.consmr.mail.bf2.yahoo.com [74.6.129.83])
 by mx.groups.io with SMTP id smtpd.web10.9143.1737201706031707266
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Jan 2025 04:01:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=t09I0ld3;
 spf=neutral (domain: yahoo.com, ip: 74.6.129.83, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1737201705; bh=YzOZQsNiFzfacY8F/oJwmXBje9Tr6VFC1RkvCPU+HBw=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=t09I0ld3zLPxzo5ba78FSVSPv3ihqYhkxJ9w05GJB6kQV2CcxBMVnSswOnTwBDjMo2XpGacjf4lN3zeqrPzH91YEn7ZX9b8wyBZmY/dKxqPYo1p16f7sFPGXQg4necWfVTRYj1jCAAKE0wNcPErTT+Ed33QWIq9FTjzeTobPG3cu3e29/UnUhxvP5rAlR9rHFU32XcFzTHw3gfpKNnua1TB+tLOTVzSAxPeXE2iF5BR/1+LOVUmIsvMY1fEW7NLkwyQ5TIYjmxyJGNMEatLlf5/qAIZ0Xp+xhKyzDIDMIKrjIsX4JOY3RBubxLwdD5NQd8agtjSDz8MY/ipQLYy1gA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1737201705; bh=4yo5X2FrwEMrmOeYQAyoh+evNcqywl6nPYwApF/HMB+=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=eyNgm13IPjOPzz7r9zS6N4PAF/3JJpFi2iW3fzxZv/mw/CFoJY+Z03Zmnyc4ItuKSk3cMGW7q43mLAgm1FxVdRL5c3zxrylPojluhpr+uUy3dGKgw65VkBVLVhGSFIP7tsVMoeE3yzJjHuzMnRMbHYKoqTEapJqv7V1fecrDcilMkAMXtAgOrWpTUbfXXHx//IGar1yLL9fuLHZA1PpfSXieqzTdTGdzw/W7+hiFwGdvJnOa6QCT5hpr4acka1f0pdoQUgL3G8B7RgwD2ODEJBfJNEvIUiwht22FqiLKFA55R/nyA+N/wIrhkL3OUMPh7SQlPxBQ0ikP0j5mRhMUdg==
X-YMail-OSG: 0si8BDkVM1kst73RrNmBZNZJOn2wTvSRtUHtB5eSw5WcIBKwADtlWviUKZXu5Ll
 F1Yi6GE0uJaivemPNrh2uLjcdUQB0333vU7TxHlKbXh_GsEBoYWV7Tck9ebuGEd20Mbj6uAEiANL
 SJxciYvPq3wydr6hbUBCjZuN5lwcaNFfxyFXCVGoQ6a06VZIUkgbwWX6JOJj059fj8wLoMBxjqNo
 ZauxZyZJnolxx8UwabOLL8MAyMZgDng8cRVmJWAHCL6JQyFut_T0KE.mvn1APQZ8X6lLmDx2g1sj
 N3QV_F_H0e1UIZk.8BqZVwqzcFNuGyOpvz9e2oE2MuYv_cxttr5q9pS09Pwc9AyrIznWfC9bsHK1
 YMii1kwc5rF4AICLubfwAZOzoFHTMMfce2USXPlHcVgBs9dF8sip0RkZslqJ4ldn3HZfYj3aLbR1
 OsmSzf8UsATQQuYbjI4Wo6j.eDD2AEg.XnrrXaJZHGp00AXGrinx7HtHiwK75CfJLuLXJda8RJFk
 gk._6OBxGtndAvU3xJiCoOxZwaGqK7aSKsU6bAiVudoV2HW0BxwAXhreOsqQlz7jfbOQWU85YcQy
 rL1RKl0bC3BoozMD79zpshz.Es70WMf8tZp2QsKJmeZiWG9UTf45uEOMvoBqWsOKYFG1G_mYd4bu
 rqhnYYm6aB8inX_ZxPCHgIxYAV7Ft4yHlcsxe1.sEuQHrA9p1GAZpozHlEnL4kWGNMkIqeaL8bjK
 vp_XOLDrnTErXel0_VoZah0QLAZD1Gv_T4Vipp_m9CRcSSznqbJ3SehZThwcOqkp0eONS6DHyYEM
 Iv4I13Aa0FEKsJ.KW2C2vz6z6MT3Ijp_3TmUuXrHKoAcIII2eLK1EKin0DcF.GdyjP.fXsq.Zbt6
 8DpqjbYrLikvtm6Pi9oJvfzn1J_KGFq3VdxZmEFJV9_PewzYpPbBn6NTwr31lM_7_0Mvkt5OGzgj
 GG64ZL6almE6YebqENZi21lR3ZvkFNt9gbvZBBcdnsi.O2La1fonjmVrmcDWanyLt0fUia.JNfwt
 lsKdL3WyRsXJM49LuwcP7sQCXG2QujbmZjdAF91pjrTNPhPm0KHhqeqFuOW7pKOcqTb6jLxivc1l
 CZZbmyR7VKoOVT5NTamryX67STkyi_7pobaVQUJFIdZ73F85TtwKdD72SlDdRnBEKvpJdH3VsQuY
 RxI7IYHOV3sNlVruwcav3lY3623t3tq7UUA.M5Rtv_E7nDsKE0HA.zJrom2jl9BdGGQEOYmmNDzl
 f2DZDbNqc9qYMY2dKjujCBINk3IcjxOLBPLw4133QgRdk3vAEuAeLQomY05lG8SO940dn98j.0D6
 Ar7T7eMPYe78rUn2SzTttEx0tdlAdJOu15x.wRCgmZcKBEa3gSo4AlJREg5JbOCgJMYEDN.GQRGT
 TGeaaBmbFu7UYPRdK7TIwKb9S4oT6MD5H2.CbmtuxD379AUD8F8b_DLOCH0oUAOJqPmP0py26G8.
 WthxsGpv0PIeJiM2dBXAQPd33BYh5_6wxKMGP1.vPdb9JGDoQBclUxRVswIM8Y.fXE2AaKWLEWmc
 ulwS0mAgXC_tJF5rMDpGNQmKVnraCpbylVN4dBBQtDU61M1P41GYW7H5nkJPvgHuVEZ1BP.WNNLp
 g5RgsJfYjwHq6CRFuhTWFbvBRO56KZUxFaOnK.R9glofe0POPjjzaeu3y2x9cbTHVG30Mkju1jgH
 MmR.kogLVZidA914BteD5zjoeGo5BnBBZpm9BiF30IEa8fzfqK5PcefiOgYtfDmAN6kKkhVqOSxc
 U38DaMue3Ni84_FloJqe6W_qjpjID9tAUoSHUD4fFDLLeTCJL7RpYcA8lcMO7U9R.ArgalccgIYQ
 Tt7zpc_QD11CHz2MTAkmssij2ID_wxFvI2.oDmWiMfk2ZZVC7dCNS7aBDOOUihNA5w5V8eCk6GRu
 eKFloRh.hu2IqrYzdMkKk5cjMVnI8t9seQZovpzofZX3j5QURZUXyLc0blhZX5ibo8mSlzkHWxWY
 I6GqOxjApQ.nmkA7a.Pz5Ql1ZakNCPssu.7BJeSDBN6_GELseKmsT8fQdLcPV6Qzouw8H8cUL9Rk
 Yl5mUlHwVuIdCS3FCi0IiohQXLYJ8hCT06_dtsSefjWhBUQKcdISebt7mYIrfWpE1hriF6VbE7_B
 y3BAj2U6G2GtWs6Udwnp3lWZTBZ.bJs7kCsFKxKIBesomc45rvExX.tq4kqIbLWPoSUnTt_y.ggV
 Pw9fCM_CghTdgCnDF_wF5vyTQaky_cHOxlX4VGhWNoJyZ3bP7qrny.dlhkvNb
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 215b9c63-25a4-4d09-95b2-cb349287dee5
Received: from sonic.gate.mail.ne1.yahoo.com by sonic317.consmr.mail.bf2.yahoo.com with HTTP; Sat, 18 Jan 2025 12:01:45 +0000
Received: by hermes--production-ir2-c694d79d9-h5tj6 (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 1b8eddf5a7fea877e512616624400f60;
          Sat, 18 Jan 2025 12:01:39 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v3] sanity: test for c toolchain
Date: Sat, 18 Jan 2025 13:01:05 +0100
Message-Id: <20250118120105.11681-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250118120105.11681-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jan 2025 12:01:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210000

Users reported issues caused by missing the right libstdc++-version-dev.
A new function 'check_c_toolchain' added in sanity.bbclass to test linking libstdc++
Fixes [YOCTO #15712]

Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
v2->v3
* whitespaces are removed
* the format for reference to the bug is fixed
* 'Reviewed-by' tag is added
---
 meta/classes-global/sanity.bbclass | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 7b8a497d5a..13f7109eac 100644
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


