Return-Path: <gavrosc@yahoo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA84CC02181
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 10:03:12 +0000 (UTC)
Received: from sonic309-13.consmr.mail.bf2.yahoo.com (sonic309-13.consmr.mail.bf2.yahoo.com [74.6.129.123])
 by mx.groups.io with SMTP id smtpd.web10.27637.1737885785932444476
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Jan 2025 02:03:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yahoo.com header.s=s2048 header.b=W7763zU+;
 spf=neutral (domain: yahoo.com, ip: 74.6.129.123, mailfrom: gavrosc@yahoo.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1737885785; bh=mt+gFxQ3dBgb8AAjacVeI1n4XLnVVUflLMF/VTd7Dp4=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=W7763zU+Tvaebqsv2KGOigE/Vtb8ISQXRFf2nWoaCIO8BHuq+Z5/rQC2NK5dmOOE6+CiluO7hLvG+V8P6wPpLiDibG+won1sheF1UF98vKzva4KGA35WMro++71IvruvQP0DU35cEzYg7vL2gMKa+lv7+MlvIrPsymVw0E4eheuKNifZxL1uZZ/nU4VS17iRXoObrW9fxTheiLFw7BL98jjTRsjRDQdBjbNGgvrpFzd+I38B+IPiSwKwDgfwqgjiJUuHx/eFmUoRGZ1d0z2uScW/ZTURGO7AUftlIxdiBtN4+7nxDbcKEVWFbjr37I3ZI1UQAJByjbMZn9dINdCueA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1737885785; bh=0eP37qXXBQ4gma+xewzpaLHKYnIqMQRznBGw56JAWn7=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=TONtVmqEedyVXzTlavwNlMWqjI7m6ZFLcrGPmHcqKlAHQJ5nNFFuknP1Bs+rXqixGCZ7N1nT8f1+6Bs2eomNPFs5dzaP4k6JjI6ZU+q2vuZcnytd1+Z5SMx53I2EHkLTfGNe36csFCkORaJF1MfNXdvXanvt1lr/w6riBMUYytK223g9fc2uJcdu+KCpN43z8w590qsW3xLlaZoFLZ9m1kXCxLkIbajEAhXom+rZx2MTh0T3sBSfi9jjSx78/adKXXjWGoTz5StidRvrdhQrwljl2m0jV8iDtrErMMKz2XMrDeftW+yVMnIlCHD0gGKZLYCzv7ggeK9BZACotmrFSQ==
X-YMail-OSG: IRNDlNcVM1mSpGq4il1bO.DEiciBfbsihZsupXQ7gpc_MbWia1RpkAg54fKCkd0
 qO9xxPATYBLxsmflbfhlBxkJLVAYRqJhoBZRQc0lUcxXpTD96NFbpYGn9JwB8xoz2fTcQn4ADgkO
 IW4hNntaFQnY2m6wVAQsrO4N3caEAIrRA.AosCUeITn5mrcU4J6grMJYXawioJ11O6Sooa9l1n4u
 qEH.qqPOl.CFAHh7n78w15YyrwpO4a8E2E5RTOX88G8sh9BBA6iuXlGt.drD_wxAr_MXfhfWrTsD
 QOAlVodnZREEyjzF2oUxuFfyq2VqMQdHf5xEj_Wsi9b6du5yq6Sn5tNlGtmyKC_SrR_QEYFhJeYH
 PICvWN.w1VP9vK.fZiCEJgO1t4RFq9yYnC1dGUABSSE0QFiTr6Y1MLM_te7tVKKfKNa0X.uIsChk
 0EbwyhQpaOsU3UT_uqZr28kiDNphNulM1rucTYtYgWgN0Mmn6ZyU9xWEcYDQCXTcBUpRweXYNDE2
 zwEEB2y2zht5JQoiumChwOs062PmenGK0gxOgc9FR6HBDWJUNvAw1_RFyEX8d4jVPYT_IoEz_MAZ
 1vIrm8r50i5JqJpqXUc5ILA7JhxKtPY46F2PcgKT2lXp2vu_3Dtz3MUEU8UAsL1h3ezTxyycRhP3
 PbgW1BYV4QQUhxvt0rB9NPd95rIIPGFfGFu32.c8He.Zu25ft3FT5h243I4DDghsSr1h2eXLFy26
 bbqSZci5Owv7SGa2uhVpVrRRBcs55wIOVK6.Y8WO1pkMrx3jCIggLc2BbKuyc5mWLevkJt5.XGQg
 MK_Y._Hbi13Xq4g.I9MUP8nBNXfrViJwpMQEgdh7RJW2gJ0hagXvx2p8V7W3QQlrLxdp3vHBWoxN
 uYfpMp4eEMDtk23SKy2GB3S7kF1uqdBQa.tJUS02ioQaWGM728UDoxL39ydhdDx92sVYt3RlN1OK
 OzbDjCIFH3gCNLUWnnGp1lxnJi3.tXbqYYIUSYNruVfw9KvzrynfNCFU1Z6u5UNVRS6AzdiHnOGd
 nHhLpl40YDOcv3dZs4n4tjzoZfNNDGT54aBX7G_yel_rwYu2fD.UjIaN.eVrXFJnJ_6SR0x2AExA
 aJQiyxJ9aadOpuEzby3QuvShnFPBHx8_2YM9HazeKBzB4QPi3zALqdnpOIzFmP2uE2zIfOAnmabu
 L5nERLsmcVbRBlq5Vtthf35A1xuigpp460fKymTPjLo8sKpBEW5gmGUTjhj_blMhsJ6NN3ALZY8L
 VPR6KdDSDG3r587XGCw4bKY0HEFOzdvOdAQAZ4qWw2AWkC.i8uoBUWTftCg2tm4ELAjjtnxaPFrR
 2RKERw02a6QTFuoQ_MVFLyd4snkplHlmdwK3hCTMD0wCbYCzxgRPbYMhmaLtmfRf55e6Ksk1aSyQ
 4htHNNL762BvpmzhOcOs7LHOSn5Oz8toZxxxGBlaTodXne9KvRPKKPSuuHKPJJfwub.Zj3cJtjO0
 zHvwSZWdujWcuYAXKgGutwLYr_TBPabr356nr340KaPpRPy64CVnxV.mDb70gdudT2vV4HlYGytu
 HHaaktow2EOuuuvG66uyfxsox0KeA.yaRm15cqaJ4E986aOZZxbsdOTd0Z4gDEDb2Ey.fPElMsnE
 5VpHZIwDMt5PgcWxObwSRo7eFuDwibWdd9FZs9as82t7iz0IzDa_dcF1cqF.oNrD3Jbm6f_GjrT8
 qtM5jH7JQMrWvUycFBQk8Kt_Ox8I4tQY7N89M.dpob2CWsHNwDy9XEKG6hpIoWX7XfUlG3v9dE.Q
 .d4RC3T3mOxXR312IhBTRMzCAED7343GINw7ceP3bqMm6TQgOYZBCdnTne.DeEagY8RvuXjcW26l
 eTK8YrFQsoQTkXdcGP1Hk2EhdFz.sp9odsLFDqPZ3wQLALQQsayoibShk6PRN3NEO2Vio9U8NE5u
 e1PJUvY1mDoGyjIroLpyIWa2J33IEzv2OnbCfSNotbojG9bCrFXydKHIJ5UfJW65WKWpITEET_Gz
 naCGDmtAxrS2n8wf.rluTHBGRGswK5WzENn1_X_CdkXL1WPejBhY.cqn.WX_s0_NLmDDakX7fjc4
 Y0Hpe.oEHIAUbeAwxNfs.Bi2C5_Z7UMu79EjnOI9843uWiCs.hWk4o6g0AlHFbxsiZHy4E69AMa4
 YG1qbEaC4GiIHZw4_dxTF1PmFwcVuTztkVR3Bmmy8hg13BAFGGpv8XomTTeFrYhb.CG4XTmjse5d
 PjdUpzzXMvL2iGLSG8ooPX8CxnTEQ0lnzEQcIbJMBA82VnPf2zyi7y3AkgGA2mA--
X-Sonic-MF: <gavrosc@yahoo.com>
X-Sonic-ID: 50b19ebb-973b-4697-9500-30ed17a78a4f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.bf2.yahoo.com with HTTP; Sun, 26 Jan 2025 10:03:05 +0000
Received: by hermes--production-ir2-c694d79d9-f7l2b (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID d452eee8c37b8280141a82789bb85563;
          Sun, 26 Jan 2025 10:03:03 +0000 (UTC)
From: Christos Gavros <gavrosc@yahoo.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	randy.macleod@windriver.com,
	ross.burton@arm.com,
	Christos Gavros <gavrosc@yahoo.com>
Subject: [PATCH v5] sanity: test for cpp toolchain
Date: Sun, 26 Jan 2025 11:02:25 +0100
Message-Id: <20250126100225.4147-1-gavrosc@yahoo.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20250126100225.4147-1-gavrosc.ref@yahoo.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Jan 2025 10:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210272

Users reported issues caused by missing the right libstdc++-version-dev.
A new function 'check_cpp_toolchain' added in sanity.bbclass to test linking libstdc++
Fixes [YOCTO #15712]

Signed-off-by: Christos Gavros <gavrosc@yahoo.com>
---
v4->v5
* change function name
* change shortlog
* use BUILD_CXX instead of BUILD_CC
* testing linkage with C++ instead of C
* change the way of testing by using stdin
---
 meta/classes-global/sanity.bbclass | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/classes-global/sanity.bbclass b/meta/classes-global/sanity.bbclass
index 7b8a497d5a..66693fc9b9 100644
--- a/meta/classes-global/sanity.bbclass
+++ b/meta/classes-global/sanity.bbclass
@@ -602,6 +602,28 @@ def drop_v14_cross_builds(d):
                 bb.utils.remove(stamp + "*")
                 bb.utils.remove(workdir, recurse = True)
 
+def check_cpp_toolchain(d):
+    """
+    it checks if the c++ compiling and linking to libstdc++ works properly in the native system
+    """
+    import shlex
+    import subprocess
+
+    cpp_code = """
+    #include <iostream>
+    int main() {
+        std::cout << "Hello, World!" << std::endl;
+        return 0;
+    }
+    """
+
+    cmd = shlex.split(d.getVar("BUILD_CXX")) + ["-x", "c++","-", "-o", "/dev/null", "-lstdc++"]
+    try:
+        subprocess.run(cmd, input=cpp_code, capture_output=True, text=True, check=True)
+        return None
+    except subprocess.CalledProcessError as e:
+        return f"An unexpected issue occurred during the C++ toolchain check: {str(e)}"
+
 def sanity_handle_abichanges(status, d):
     #
     # Check the 'ABI' of TMPDIR
@@ -770,6 +792,9 @@ def check_sanity_version_change(status, d):
     # macOS with default HFS+ file system)
     status.addresult(check_case_sensitive(tmpdir, "TMPDIR"))
 
+    # Check if linking with lstdc++ is failing
+    status.addresult(check_cpp_toolchain(d))
+
 def sanity_check_locale(d):
     """
     Currently bitbake switches locale to en_US.UTF-8 so check that this locale actually exists.
-- 
2.34.1


