Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13644.1795251595558521364
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 00:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=bXmzvFkf;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Ywp33Pvt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL8BBvg1648231
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 08:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rvGV45npP26
	MXcGA3A5iKRa2YiNJs/3X2gT5SQnxmrU=; b=bXmzvFkfpVc1fQcA/E7EroJ+jHG
	JOzT73ocDhWJjAPusYvxleqq2M+gArce20WJmuDtzhhGRJqRZWB1VlxxJC7KH+aN
	vBw25gUMMCJCecj3wF9co72VA/5rMebY8+Lm6woK48WkXPgH34MgVfbnAPFsvpw+
	/E9cSQyhU+WdcqwalCdMAFlm3cSraX3jJZFvbdtP4YXX7W3fv2qmt0wBBXSa2u6K
	0wTYrruy0w+FDXR+3O2PjbgDHObSx8OKiuJIxn0c06kadfrgssCfaXG1+lp0//ro
	JCgBwH6Ilhoo2YxGI9ZedbJ/0ngPMi7GiLH0ZpVMFYrYcU6LnBQCMxD204Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32w00mcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 08:59:54 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30bcb065bfdso1900702eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 00:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795251593; x=1795856393; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rvGV45npP26MXcGA3A5iKRa2YiNJs/3X2gT5SQnxmrU=;
        b=Ywp33PvtTZubbplThefOtRvds/fFj1N1neTQttuzs8yCl7O0bslD7h08R40aiRbRiQ
         +V8bFX4Gw6CS+zDRtT2vNfCC0zlDrct98dNd7baivh03NFV31mGlL9jTuM47mvRAEupb
         erZ4UmjLtpVOtOMQcyK0sh4obWTFsvmHWYyXg9DTLj8cZWJRVIS20JOHx41j02RqO3PI
         PNmBXHZK3AW769p+fpYe28QuyM+EvbvOEtXEFU6DkqGl43t551/SfQcBe7JN9LknL0Wc
         IoUzslpTZoLfTcxexCm2BnbndVYweGlgePN0akBfJyRBAbrhY6Qr7EGCGfnjcgLgxPxM
         oxeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795251593; x=1795856393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rvGV45npP26MXcGA3A5iKRa2YiNJs/3X2gT5SQnxmrU=;
        b=nPI57MiRdbTbfYSfWIFSiuByP05PnqZlcpo+XMmuaxKBMZmVPAdfhQMtFx2sc6YNuZ
         uaFdTpu/V+JkvYoth8XZ68k1dT9AJcVhGvCrfnvjFxYoXJNaT4WiyWGmyRvsf/Zayhb9
         r7EcpRj3AhKDzNnZ4vreQA7NctuWqKLjP7K4vK65vTCSVtzGTSe2XmfO3aFzSSHS/4D6
         vDkQFmOELQLeQMZCcyVkZlCL1kLCDyyL7nzgW5E3m/fP2MO7/nbBH5ZKFGZWoke7AuW1
         /cU2psZN7Qz0v2vzCst99B3Ln2MfrFdoaePlkWqodMiMrrCk/bdxje78EqbJDTD+qDWF
         1DRw==
X-Gm-Message-State: APuU4Z/sWWz126uy4z1kgCk/BfYMxgbHyyUt/C3sSpBOm/0drGdSaA+M
	yDEe6aeai4cGZPvEDmx1Yg29WaHaoZVIJPnbqkX1YBO+simTvPFlYplEHe28dEsyn+P3gyNeUv2
	p8o/gtPpCTDhoPJ8A6vGayXku1emgbWGrR4iDjaB+jiW7/BXcCsksB571+pm9EAWUOscm8kJHwd
	OTyt+rA/nLGcU+pYI/4w==
X-Gm-Gg: AZFdTZd+kl6WpBWxBCvkawZ3mHzUiXqCrXuJUGY0wfq24YFlgFelt44AI0k5NTB9tFJ
	julZ7RdaMqZt1GO4eXDawA6bIi/1UE9pCIcdfgGM6cRhHMCPVaM9/3ewjLZSZksN3SYq9m5woWV
	5b2kdc8SyqAobcGC5c1S6aFqfb7XErtXEbB8WYc5VmQIDYUZu9MzRQRfbZsk+QuEIUIL6zRSdrw
	bL6wMFDHkndvFoJZVmQN4P1Jf33Cvf/tMAQkqxc8E2IlZNvA5pt0TgE15iuHaw/AVpaRb4hvqxg
	dmEmoLgCb8gISLyuHZU4fDX5ROzRN7bT8Hl0NcbfxGDGzlE58c/q1zCW35+boGbJr0RNHXNyWVb
	lDRToimsdhAsDPClYghVzr820Pl1YhwZTQIEa7dyR/epxKNbMlQbnRzhnuuAYPFP8g1FwwNhBJm
	mQqoDb7feoACkVZ0JQg5Tkk10EMXE/QcQHryx/LJGG7L0=
X-Received: by 2002:a05:7300:2301:b0:385:4c54:3c8c with SMTP id 5a478bee46e88-3856c0c9403mr7859910eec.1.1795251593154;
        Sat, 21 Nov 2026 00:59:53 -0800 (PST)
X-Received: by 2002:a05:7300:2301:b0:385:4c54:3c8c with SMTP id 5a478bee46e88-3856c0c9403mr7859873eec.1.1795251592247;
        Sat, 21 Nov 2026 00:59:52 -0800 (PST)
Received: from hyd-e160-a52-10.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm17887231eec.26.2026.11.21.00.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:59:51 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
        Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH v2 1/4] uboot-sign: add UBOOT_FIT_MKIMAGE_EXTRA_OPTS
Date: Sat, 21 Nov 2026 14:29:34 +0530
Message-ID: <20261121085937.411140-2-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121085937.411140-1-viswanath.kraleti@oss.qualcomm.com>
References: <20261121085937.411140-1-viswanath.kraleti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAzNSBTYWx0ZWRfX5GWteAYvAkDz
 ciaAvfu7AieC879JwN0Tpd98yDZ/G1MDoQnQ/JPnRg8nWkHhDgVskMod9xHYUbpOEXLWwKH/3ES
 3XJBcghXQBSU1nLzp6aZ3yCskQGcbJ4qplf+dsWLWaEkm0dxdXgJeuyHOBQ4UAHx8pH/S2DL6ym
 +KBkbvSlH7BpSG65t48cXh1zuIY7cS57TGGJxmp5gTy5JfjTcrgjlWV3L2dmQrsRS08frWszmJC
 hI9tfHOY5DxBM+Ra8pbUW1quG/MJRkAZHEJnP8uTsWvXrDVzUxNZ73MwISDoBDyhAyyc8c3BHtu
 ygyDoS4iIeR32JkszBxmqxdLfFioct7mBJyvbQULJ5litdDxsTzVbUaDPSR37PO4znnqu3wTYdU
 sXomnkalqOwtRsz33J3uyyQax4ZWxoTcELHJ/7yCFtcC8gwSrYZEXOi5PwnJowSet7EiW2pZLTl
 Y03ztkJkxd+dVNEKOOQ==
X-Proofpoint-ORIG-GUID: yYaVFmzmBQ5GRcHUBdoHzD9pkxkZVktT
X-Proofpoint-GUID: yYaVFmzmBQ5GRcHUBdoHzD9pkxkZVktT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAzNSBTYWx0ZWRfX31uT1jRa8fF2
 IM0X4eijgV0oYooR9vwGHPJhZ7GwXGVyJPL2fY7VW7Ti3EMYaegKSXIP+Ol1ONcdGEuReOR7XZl
 7GdC2nCVDjq8j/wHzbQ82Kc2W6HOagc=
X-Authority-Analysis: v=2.4 cv=S+dMU4sP c=1 sm=1 tr=0 ts=6b015d8a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=GFXrzsOziNBv6lcdXcwA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 08:59:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250843
Content-Type: text/plain; charset="utf-8"

There is no way to pass options such as -E, which places the image
data after the FIT structure, to the mkimage call creating the U-Boot
fitImage. Such an option also has to be repeated when signing, since
mkimage -F moves external data back into the FIT unless -E is given
again.

Add UBOOT_FIT_MKIMAGE_EXTRA_OPTS and pass it to the mkimage calls that
create and sign the U-Boot fitImage, and extend the selftest to check
that -E is kept through signing. It is separate from
FIT_MKIMAGE_EXTRA_OPTS, so that options meant for the kernel FIT image
do not change the U-Boot one.

AI-Generated: Uses Claude Code
Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta/classes-recipe/uboot-sign.bbclass   |  8 +++++
 meta/lib/oeqa/selftest/cases/fitimage.py | 44 ++++++++++++++++++++++++
 2 files changed, 52 insertions(+)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 409f6376b1..c1dae56582 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -75,6 +75,11 @@ SPL_WITH_DTB_BINARY ?= ""
 # U-Boot fitImage description
 UBOOT_FIT_DESC ?= "U-Boot fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
 
+# Additional mkimage options for the U-Boot fitImage, passed both when
+# creating and when signing it, so that an option such as "-E", which places
+# the image data after the FIT structure, is kept by mkimage -F
+UBOOT_FIT_MKIMAGE_EXTRA_OPTS ?= ""
+
 # U-Boot fitImage Hash Algo
 UBOOT_FIT_HASH_ALG ?= "sha256"
 
@@ -560,6 +565,7 @@ EOF
 	#
 	${UBOOT_MKIMAGE} \
 		${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
+		${UBOOT_FIT_MKIMAGE_EXTRA_OPTS} \
 		-f ${UBOOT_ITS} \
 		${UBOOT_FITIMAGE_BINARY}
 
@@ -588,6 +594,7 @@ EOF
 			cp ${SPL_DIR}/${SPL_DTB_BINARY} ${SPL_DIR}/${SPL_DTB_SIGNED}
 			${UBOOT_MKIMAGE_SIGN} \
 				${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
+				${UBOOT_FIT_MKIMAGE_EXTRA_OPTS} \
 				-F -k "${SPL_SIGN_KEYDIR}" \
 				-K "${SPL_DIR}/${SPL_DTB_SIGNED}" \
 				-r ${UBOOT_FITIMAGE_BINARY} \
@@ -601,6 +608,7 @@ EOF
 			# Sign the U-boot FIT image
 			${UBOOT_MKIMAGE_SIGN} \
 				${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
+				${UBOOT_FIT_MKIMAGE_EXTRA_OPTS} \
 				-F -k "${SPL_SIGN_KEYDIR}" \
 				-r ${UBOOT_FITIMAGE_BINARY} \
 				${SPL_MKIMAGE_SIGN_ARGS}
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 1fad53b16c..73b1d68fcd 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -2133,6 +2133,50 @@ UBOOT_FIT_HASH_ALG = "sha256"
         self._test_fitimage(bb_vars)
 
 
+    def test_sign_uboot_fit_image_extra_opts(self):
+        """
+        Summary:     Check if UBOOT_FIT_MKIMAGE_EXTRA_OPTS is passed to
+                     mkimage both when creating and when signing the U-Boot
+                     fitImage.
+        Expected:    1) U-Boot its and FIT image are built and signed
+                        successfully
+                     2) UBOOT_FIT_MKIMAGE_EXTRA_OPTS = "-E" places the image
+                        data after the FIT structure and signing keeps it
+                        there: the image nodes have data-offset instead of
+                        data
+        Product:     oe-core
+        Author:      Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
+        """
+        machine = self._get_machine_or_skip()
+        config = """
+# Enable creation and signing of the U-Boot fitImage, with external data
+UBOOT_FITIMAGE_ENABLE = "1"
+SPL_SIGN_ENABLE = "1"
+SPL_SIGN_KEYNAME = "spl-oe-selftest"
+SPL_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
+UBOOT_ENTRYPOINT  = "0x80000000"
+UBOOT_LOADADDRESS = "0x80000000"
+UBOOT_DTB_LOADADDRESS = "0x82000000"
+SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
+UBOOT_EXTLINUX = "0"
+UBOOT_FIT_GENERATE_KEYS = "1"
+UBOOT_FIT_HASH_ALG = "sha256"
+UBOOT_FIT_MKIMAGE_EXTRA_OPTS = "-E"
+"""
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["UBOOT_MACHINE", "SPL_BINARY", "UBOOT_DTB_BINARY", "UBOOT_ARCH"])
+        config = self._require_machine_capability(config, machine, '_cap_spl_dtb')
+        self.write_config(config)
+        bb_vars = self._fit_get_bb_vars()
+        self._test_fitimage(bb_vars)
+
+        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "u-boot-fitImage-%s" % bb_vars['MACHINE'])
+        dtc_bindir = FitImageTestCase._setup_native('dtc-native')
+        fdtget_path = os.path.join(dtc_bindir, 'fdtget')
+        for node in ('/images/uboot', '/images/fdt'):
+            self._verify_dtb_property(dtc_bindir, fitimage_path, node, 'data', None, absent=True)
+            result = runCmd('%s %s %s data-offset' % (fdtget_path, fitimage_path, node))
+            self.logger.debug("%s data-offset: %s" % (node, result.output))
+
     def test_sign_cascaded_uboot_fit_image(self):
         """
         Summary:     Check if U-Boot FIT image and Image Tree Source (its) are
