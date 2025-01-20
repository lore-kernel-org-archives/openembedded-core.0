Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE5DCC02181
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 19:47:25 +0000 (UTC)
Received: from sonic302-3.consmr.mail.bf2.yahoo.com (sonic302-3.consmr.mail.bf2.yahoo.com [74.6.135.42])
 by mx.groups.io with SMTP id smtpd.web11.44841.1737402444218668809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jan 2025 11:47:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=sCc1POG0;
 spf=neutral (domain: yahoo.com, ip: 74.6.135.42, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1737402443; bh=lCOZ8U5VOlj6cvVkA4bg4RVvJ5wxtKe0TiZiBsLOeO4=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=sCc1POG0s12a7Ec/2YBPbsXDtd4spgJk76eAXra+wLSnvc6lIUG9L9ruKazpbIiqEmbBJIy/eFXdjfYw27x6k4ZnsFyhYzV63sHSKLwl8vpTBBqEaiCG1veNSxvwkpRafTth5i4WVw+fB7QhVzlBdCOMqMmhTCSo33BHtQomwb/LgTABXmYY0jerl2NbvSctYfYf4+MBZ3pfWorN1zp0ZbTznBvhLzhFVkB4Wh3ki2WNzRyY4IALeMr6BmcmrIlLkt52zVFNqD5OKTWT9G0HwQEIBvXE/fi41R4dVsaaYP4UQrfUA6mGaktAdjQ+cfZ7e0h4KC/t7nJcb5CE8wx1XA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1737402443; bh=ql2UOtIpoPRBor9tzHGgwSuNxyUqH4QVmTBdN9Jhet1=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=gBGBWwxXj5ppB3fn5t1hcNUiAHPUDb03kfV0oI0Y8XFM8y2K3+Xx1mLK4DWz3torm9KOFOR+VyCpddktZIEvBfReG2Ci+2KLt30fjYm46hg2A1NDidIgrF9QywX1u+t0EZUMXdtjZOw+yBYOv86rpseubPLik9bS1yvBZDppi0fv2pMZddK8MRQ+kKjv3rgla0BmT2KUjPiqUm1UtHtI6KkFsnw8Av4FvLZEDrSwhUcK7klxiJyj9QaD/GKR5FkFkMDgrd7HCC4nF2eiJbJMezz7TAkoBlXU9nT3NVH/P/piEwAofuMj0RGr2T2iYUadYw2IioeQ3tmwuzj/7kG1Ug==
X-YMail-OSG: ZTSm8d0VM1nL_zgYLA5YS7V.QRocNfHhmK_THwLHMtjQsK3HDXCJUQuwkff3zwl
 XfyjRzLlYhDP7nQ14wx5vuK1pD4jlMSo_.92NfWNmIt3a_VMrA_T47tGM_qblZD3XNbXh2zY.oi.
 R5cTsBbgrxyVfDUTX0R05nJMvBUI_fVC6sOvhm0jMGRrCeN7k9jVo3dboH_eioqFf5TfrX1OzzJy
 d6QojFPBlQKm.f8ob6w0kg6PbEtFtU16euqnvVdA_YumOLE6Rc0rMa5Fu9gxArdO_Zmhgg3KJWIF
 _Rihl4Wu069WZncQBgREbywjVaiBCJa_bH4ljj9sukSQ4f2n6mbz7YBfUlAyK44UJ7XNLDfYR751
 qCh1ePKOENGFeQxD8vMiYxOnaZSZWK6CICn0lmkbT5dJltrZJ2xpkarRyz_2hs5TWF9k3eWiq0hu
 yThWVhsOvUovSjj_1fewTbngGQDF4ybQDGeLgsmmYecL1a.oERFErU00etEBYVJMG_DVWlnubtW6
 VCwVwh402DHzEyX11InnLpnNBMnR3eZLEB6Och3lJ37Uo6ZFcJcn_FmjoBWuU_6U.NypeTpXCXJa
 vRIfw94Yo9QQ4m4IdKB5iF5DMk0QGxvsO1ZSn9SU1wQ2gpTSanK5IwP_JV0sc1_jOLvKa0kJm7UF
 ZaUTNJWtJd3pawn42At0KqsyLNmtFihA60NSaL8.YqfhrVXSIxtEttgBy2AOGSsEoYoXBzm9jK0B
 0LMG56UunDC5H3UYF9_MV3p3PZblIXm2UFgIbJfIzOacEnEjRtD9k_l_CGIsF0_WGcd8GCjRccdl
 0jxS_7REMxwSenKNmYcoYPpDo26JMstMGyJWvjJsT3Uae9Ac9BMNHNNytYqvWt9MJEEc0k0e0WEe
 FJrD7.HZdTEVQ50_tHRheZ3s6qPPEm9l0ZQxLSTeMdBAbimbj7iHTiFyb2ZfQ71JO21_3RH4ALMq
 oWOpdXxH7cSF6EXDYKR1SiVEwgdIGuC2cbndwyEHtjw1SFbzvN0GtxUVumLXbv5Dfn85GZtEr_eX
 BaOKY7f8FrfsibFPZWBjgWweaoxEkfRwsNtJ5rdTaLYETylkANBvXZJxUkXOpt6Zgvy4NSFjSaU0
 C.RplGeVrFQAUKUQ6MQtaPfGLOpdSWQrRW8MooRvXTzuPvf..uKfe_xpGt3NUBLM8A_m3SWPbiJW
 CSRsFG3bgyiKL.O9fQlByIUCGpfQzT6FIdfpdPws0iJjNUGWhjjPlyMYStkW2p9yjhqNn0MmrCJ7
 ZkeNBurgknNkTIoyzNKx1ffukSfpY0CNHSELWBFpnlwaRaM43Os_Qt.R2RE_zVmUpsO2FEw1v_rR
 6kyEPwPcDBWX2l6t3ZIrn._4dW2y4FxqKae3pQ9ZuBufRwvQMwJDs3jN40bcu87xkqSDc0SUQuhE
 _315YkH9kJ2DHr3qMdQRD8qxOzK7okX5LXIBMcAbbQr_lb1d9uhTAWVwM1yupbIoceOlSuzYcpDp
 GKNBXdoHJg5yoxogj9VXE0Efe8EuV64qRuZe65W08MDZZEZWfeGuCIwYz.T_ZjygacuqMEwT7ICU
 RTSeU9P7ZekEfnZzPOYsLPd9dh7MhErt7XqdjNgA7xbxtI8UWGtlAf3FlN3FnMExKUrMx1viCVa9
 fs4OaR9b8mB3kVy7hA.hKr744ViBtSZs3oSNafh4pP4Q9BCodcdMuebzQKVY.QvEt5eav.R_930K
 5RXMqnYC7JEFw8LDE5zyjYt.1A6X5VCynoN6ovs64KPcwL_W7Q_L_A_apIJrFxzhjWy7GpZjSUrz
 yHLcDTtx41E4lNRZLQHrrqs2ZBVCZ0aiqvMHDwl0rmlmtGFZ5RIU.FmAEvVOowl7CNRKB.RhMCNy
 0rJOyRqTBXdqPtK2DoBA3AVkLtU78eFqW74rZICEaPenu0pjeVYWZ304Ay4eEsMXOMlz_G4Q3be0
 GRWEkJA1h4kHAacRjKdTj_SWGEXzcKK83ecZrd7YB2_.6Sg1zolGnfMHkkN41tb_VjbELF4DrtlN
 4UHP2RJ8U4kGOzKq1XQ1hLclNMvqy_uYeMqkuOyqju6GMnHrxyZsPI00vrVa4HdYwcsDdql2pwZ3
 vWPBAjr3ppDCU4Z_56xVQ1cu5CD68Ig1kO7lhWiApuB2RC9_upuNa17uyydcKnY.r0T.ygH32hbv
 yWa98Xsr4NVwKnd57LcRdu4hn0cY0_tv3QVfAc6buFqCmVW0jNl05OZbCt4JyX4iUprXRl5_NzKV
 _0EVHQacRfy9wG1fvRKszn8QKDI47WD0vEnVX1zt7DJz3FgeqTZD0NZn1F49u
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: b527eb6c-d196-4dd9-a23e-b5c0ac862318
Received: from sonic.gate.mail.ne1.yahoo.com by sonic302.consmr.mail.bf2.yahoo.com with HTTP; Mon, 20 Jan 2025 19:47:23 +0000
Received: by hermes--production-ir2-c694d79d9-qm6ds (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 595647bfaca4c766a75b4fe68581591b;
          Mon, 20 Jan 2025 19:47:21 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: Christos Gavros <gavrosc@yahoo.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v4] sanity: test for c toolchain
Date: Mon, 20 Jan 2025 20:46:36 +0100
Message-Id: <20250120194636.22297-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250120194636.22297-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jan 2025 19:47:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210061

Users reported issues caused by missing the right libstdc++-version-dev.
A new function 'check_c_toolchain' added in sanity.bbclass to test linking libstdc++
Fixes [YOCTO #15712]

Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
Reviewed-by: Yoann Congal <yoann.congal@smile.fr>
---
v3->v4
* move new function call in 'check_sanity_version_change()'
---
 meta/classes-global/sanity.bbclass | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 7b8a497d5a..26ce5fbc09 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -602,6 +602,43 @@ def drop_v14_cross_builds(d):
                 bb.utils.remove(stamp + "*")
                 bb.utils.remove(workdir, recurse = True)
 
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
 def sanity_handle_abichanges(status, d):
     #
     # Check the 'ABI' of TMPDIR
@@ -770,6 +807,9 @@ def check_sanity_version_change(status, d):
     # macOS with default HFS+ file system)
     status.addresult(check_case_sensitive(tmpdir, "TMPDIR"))
 
+    # Check if linking with lstdc++ is failing
+    status.addresult(check_c_toolchain(d))
+
 def sanity_check_locale(d):
     """
     Currently bitbake switches locale to en_US.UTF-8 so check that this locale actually exists.
-- 
2.34.1


