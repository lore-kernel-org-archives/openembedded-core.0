Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7702.1793976624997595716
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Nov 2026 06:50:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=gRmKzjVZ;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=d18bpzef;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EQ9431047899
	for <openembedded-core@lists.openembedded.org>; Fri, 6 Nov 2026 14:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yqfzYIV+Dpu
	xq1lxWNrFTFpTz/7AHF5Y6p1fDE2xtmo=; b=gRmKzjVZcHOrH9d4hwSN1XsE3Ma
	WsL1BK3eMvu8bPhfViMBc+c0YcGS5orfAwtG8CgGl8RRwblN1+YX86tlZGGnuw+N
	TQQd5qxJGUuxGcEZDLgHcsfyhdlTjwM9dxyHkBCDF8TB4hhKTMdTsg+Q3m+rudNk
	bhEwX1mR+D2p6no95TR3denA6R8zPfBfTgH9nvVe/m0fiaBLQikWkX3V1sRuWkW5
	6zKog/oi1W0d/euDJNI3/6V0iU/e0P22SdG+udkwSG+fBj6eJv3FkIaJ7y6oAUGc
	zrFpl8DE0IBBg0/F5coON5zGDJEVNQURlrgAysWKFl3YxqWuNhCBuaNcoNw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9u7d9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:50:23 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d1353fdcdso67293eec.0
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 06:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793976623; x=1794581423; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yqfzYIV+Dpuxq1lxWNrFTFpTz/7AHF5Y6p1fDE2xtmo=;
        b=d18bpzefkr3T6SMbJYvUdzkBe1iAjSf2a0Ee23LMyRuf0vUu8unKxubO2T0p/85cSf
         5PnJ6R2iCESryW5oEzx/iE+0sv2HuPBkkdUYgSh5GpoPMgEwp47WpHAfXvuymy3Fom4M
         UcnEdaVgM4MDYnLrqPor9oVzgHiqHOKIvUaSmiR1a9xvrIYcKgGqDNtycCWzrMhfFBXZ
         P5mkiZ9nE/1aF/V47AdVOhNRRtv8/avdpQslPmRedJg1rMdxcPe0FKdzFakeFoqWwQ5u
         fC8gMIfe0WMrVCgCpQ0M8NSfDC/zA1wPB9tVW5HEQg8qakBhPCUwkjhpeDtVOi694Syu
         XsSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793976623; x=1794581423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yqfzYIV+Dpuxq1lxWNrFTFpTz/7AHF5Y6p1fDE2xtmo=;
        b=ytucmuYEv3kk+sfJi/vfJWEVgCoSLcOFgA2c3s8eN5gNkgk+H/kXu9WSeD4/wGi22u
         1YXs0NuXsCdhWioQZ0ObB3P57avo46sIIm5p1ua9H8Cnaj1/dpQJgtrsC9tEePvElCXU
         g5zvBWOp+Pzog/Jj+IXe05N9ll380xhEgVR9RdhOJtk997TCxTzme7oTt0HDKW+Jbfis
         H7OleOFxqbCq+UETHSIxY5GgXC7JlvM8ZuwE1MnpkC9rzlX/3zR2vqp9oNTUj3ZYgBJR
         7/pOONAYzb+8RMI2gr/AoW91LFMFmU9CkA1mvGn1vsdXyg44NOHBtJZ3QLsSS07vx7r2
         oZ6A==
X-Gm-Message-State: APuU4Z9K+JOtIM6IvQAbGz3qjlsFzQWl4z9FaXpYgFrLKkiA7nGBdSx0
	Y715f2CNIsjxgEeyu8yvRb8O+BTNXt3VgNY8hm+Pd1MJv89hMsPp6SsIzLpJ44ql9MyqmJtdYHi
	kPJrnEjZeNeEvn13pXSxMeNe9z+cMOafw2ksT2t9rsW6oAIwsglE0heTtVuYpxJ5et7F6sUsTUS
	7ey9fdjFs5W9Zx0eA=
X-Gm-Gg: AYBFou39yyOKEe/kd83j8WzFR51GNLKlVzcX4qbS/r9kRYZn5nVwhoqb1yj9bRA63T2
	rlvNmeWT6ith8jvdMq8BJ2XDb90DY8IJccupNPMUkA6emdBzAEzPI4Sfh0htVWP5qX9OJdeJdD4
	+M8af9cF7ZX9uv9rNzPyuMIoiCSlZWgZzBgnelPYC6CbaVTaZRTCRFVGlLMJuW7OfrdwBIZBWBP
	Sm2eNM8cGKH966cpEfjo+2Y8sLdOs99hE189n/zJrhJnWSA/k2deBKJx5nPNgnhyTM1J3qrI7xx
	XnkUoZYbrD6/cRXRYktfzVuImFKc0PnQ5VNHQFCFAVQXMLTFXEoBhT/DA7/j+udtL+6k0BeUCdc
	E/holrjqa4Q8fR0FkBw1D9zTVOtMbiZ1adiHG1p3mdoM4SeL6SP8ObeNnmbXN4DUM9h9Q8y93cH
	1SZckN76kM5PTvNtZUpaGCWfdbvVKbJiQ9LyDqJGOKcCA=
X-Received: by 2002:a05:7301:dc2:b0:368:2548:c08b with SMTP id 5a478bee46e88-36f76023a8bmr3954238eec.21.1793976622778;
        Fri, 06 Nov 2026 06:50:22 -0800 (PST)
X-Received: by 2002:a05:7301:dc2:b0:368:2548:c08b with SMTP id 5a478bee46e88-36f76023a8bmr3954187eec.21.1793976621836;
        Fri, 06 Nov 2026 06:50:21 -0800 (PST)
Received: from hu-vkraleti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9be7077sm7466502eec.17.2026.11.06.06.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 06:50:21 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH 3/4] uboot-sign: make the separate fdt image optional
Date: Fri,  6 Nov 2026 20:19:56 +0530
Message-Id: <20261106144957.3818987-4-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106144957.3818987-1-viswanath.kraleti@oss.qualcomm.com>
References: <20261106144957.3818987-1-viswanath.kraleti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX7veB02MapgWa
 eojwLUTq1Uqh4f17ziqNG1GJITwIVQZdUv31Us5PYg/Oo+WVMU2AH7TGPsI/zyd2b0PHfdvtiD4
 2nnyK3aDeX+p4PWwTTe7/cQ+Tz1bxRI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX1WAvdF7Py3MN
 oMXxnkz4J4qQKsY3r6beMM082pOWCDQgLqH6Y96a1dXAwDKGroFSrILC2TZ3+D9voVslooqK5RU
 +PZpSNITEuKI+SJQ0wBvRkG88KQegx54KeesGcKnjME7EZK2GZTclV157JdCHGRnlKhRQrrPLGZ
 9iSuxcncNSs5B3XR+FLJJTKPcFEocTDZI+sDBNfOgZcvZEMobcC4K6RY9q6QpqViEz94hD+TVz8
 uCYsq1jc3WnZV7M88GxqVhoBq6Rwh6baranwWHyVwHetd33eSTi/P7dbgJroKfKgKl5oxCrKnvE
 fZs3SuAbsohurOiX7SslyNeHjT3pRlD50QGWs7vdZorrLXMipfMClT5zPqsE1YE+CPT7JDseIUx
 4tqeVWnJbBmPKVwV/n71P9Hcz8CezVI7EitQMUfn0f84+Y09AgOozpUjEZzEF++t5YytbwsHAVo
 i6rCD5G+j8pvi8CSwAg==
X-Proofpoint-ORIG-GUID: -jFZ-ugYfD_E3W5qIsrF89W6ixDQk4yu
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aede92f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=tfjGJdk0KLHn_bEoCD4A:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: -jFZ-ugYfD_E3W5qIsrF89W6ixDQk4yu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 06 Nov 2026 14:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249694
Content-Type: text/plain; charset="utf-8"

The U-Boot FIT always carries the U-Boot device tree as an "fdt" image
next to u-boot-nodtb.bin, and its configuration points at it. An SPL
that loads U-Boot with the device tree already appended, as the
Qualcomm one does, has no use for the extra image.

Add UBOOT_FIT_FDT, defaulting to "1". With "0" the fdt image, the
configuration's fdt property and its entry in sign-images are left
out, and the uboot image defaults to ${UBOOT_BINARY}. The new
UBOOT_FIT_UBOOT_IMAGE sets the uboot image data explicitly.

Assisted-by: Claude Code:claude-opus-5-5
Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta/classes-recipe/uboot-sign.bbclass   | 35 +++++++++++++++-------
 meta/lib/oeqa/selftest/cases/fitimage.py | 38 ++++++++++++++++--------
 2 files changed, 51 insertions(+), 22 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 368888707d..4a7872074a 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -137,6 +137,11 @@ UBOOT_FIT_CONF_USER_LOADABLES ?= ''
 UBOOT_FIT_UBOOT_LOADADDRESS ?= "${UBOOT_LOADADDRESS}"
 UBOOT_FIT_UBOOT_ENTRYPOINT ?= "${UBOOT_ENTRYPOINT}"
 
+# Add the U-Boot device tree as a separate "fdt" image and point the
+# configuration at it. Set to "0" for an SPL that expects U-Boot with its
+# device tree appended in the uboot image.
+UBOOT_FIT_FDT ?= "1"
+UBOOT_FIT_UBOOT_IMAGE ?= "${@'${UBOOT_NODTB_BINARY}' if d.getVar('UBOOT_FIT_FDT') == '1' else '${UBOOT_BINARY}'}"
 
 DEPENDS:append = " ${@'kernel-signing-keys-native' if d.getVar('FIT_GENERATE_KEYS') == '1' else ''}"
 
@@ -429,6 +434,7 @@ EOF
 uboot_fitimage_assemble() {
 	conf_loadables="\"uboot\""
 	conf_firmware=""
+	conf_fdt=""
 	rm -f ${UBOOT_ITS} ${UBOOT_FITIMAGE_BINARY}
 
 	# First we create the ITS script
@@ -442,7 +448,7 @@ uboot_fitimage_assemble() {
     images {
         uboot {
             description = "U-Boot image";
-            data = /incbin/("${UBOOT_NODTB_BINARY}");
+            data = /incbin/("${UBOOT_FIT_UBOOT_IMAGE}");
             type = "standalone";
             os = "u-boot";
             arch = "${UBOOT_ARCH}";
@@ -470,6 +476,11 @@ EOF
 
 	cat << EOF >> ${UBOOT_ITS}
         };
+EOF
+
+	if [ "${UBOOT_FIT_FDT}" = "1" ] ; then
+		conf_fdt="fdt = \"fdt\";"
+		cat << EOF >> ${UBOOT_ITS}
         fdt {
             description = "U-Boot FDT";
             data = /incbin/("${UBOOT_DTB_BINARY}");
@@ -478,26 +489,28 @@ EOF
             compression = "none";
 EOF
 
-	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
-		cat << EOF >> ${UBOOT_ITS}
+		if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
+			cat << EOF >> ${UBOOT_ITS}
             hash-1 {
                 algo = "${UBOOT_FIT_HASH_ALG}";
             };
 EOF
-	fi
+		fi
 
-	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_INDIVIDUAL}" = "1" ] ; then
-		cat << EOF >> ${UBOOT_ITS}
+		if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_INDIVIDUAL}" = "1" ] ; then
+			cat << EOF >> ${UBOOT_ITS}
             signature {
                 algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
                 key-name-hint = "${SPL_SIGN_KEYNAME}";
             };
 EOF
-	fi
+		fi
 
-	cat << EOF >> ${UBOOT_ITS}
+		cat << EOF >> ${UBOOT_ITS}
         };
 EOF
+	fi
+
 	if [ "${UBOOT_FIT_TEE}" = "1" ] ; then
 		# Listed behind U-Boot: an SPL handing off to the ARM Trusted
 		# Firmware only describes the images it loaded to the next stage
@@ -532,7 +545,9 @@ EOF
 		conf_sign_images="${conf_sign_images}${conf_sign_images_sep}\"loadables\""
 		conf_sign_images_sep=", "
 	fi
-	conf_sign_images="${conf_sign_images}${conf_sign_images_sep}\"fdt\""
+	if [ -n "${conf_fdt}" ] ; then
+		conf_sign_images="${conf_sign_images}${conf_sign_images_sep}\"fdt\""
+	fi
 
 	cat << EOF >> ${UBOOT_ITS}
     };
@@ -543,7 +558,7 @@ EOF
             description = "${UBOOT_FIT_CONF_DESC}";
             ${conf_firmware}
             loadables = ${conf_loadables};
-            fdt = "fdt";
+            ${conf_fdt}
 EOF
 
 	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 15b3de04d8..b17e84f765 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1708,6 +1708,7 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_FIT_CONF_FIRMWARE',
             'UBOOT_FIT_CONF_USER_LOADABLES',
             'UBOOT_FIT_DESC',
+            'UBOOT_FIT_FDT',
             'UBOOT_FIT_HASH_ALG',
             'UBOOT_FIT_SIGN_ALG',
             'UBOOT_FIT_TEE_ENTRYPOINT',
@@ -1716,6 +1717,7 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_FIT_TEE_TYPE',
             'UBOOT_FIT_TEE',
             'UBOOT_FIT_UBOOT_ENTRYPOINT',
+            'UBOOT_FIT_UBOOT_IMAGE',
             'UBOOT_FIT_UBOOT_LOADADDRESS',
             'UBOOT_FIT_USER_SETTINGS',
             'UBOOT_FITIMAGE_ENABLE',
@@ -1759,7 +1761,9 @@ class UBootFitImageTests(FitImageTestCase):
 
     def _get_req_its_paths(self, bb_vars):
         # image nodes
-        images = [ 'uboot', 'fdt',  ]
+        images = [ 'uboot' ]
+        if bb_vars['UBOOT_FIT_FDT'] == "1":
+            images.append('fdt')
         if bb_vars['UBOOT_FIT_TEE'] == "1":
             images.append('tee')
         if bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE'] == "1":
@@ -1776,6 +1780,8 @@ class UBootFitImageTests(FitImageTestCase):
         # Create a list of paths for all image and configuration nodes
         req_its_paths = []
         not_req_its_paths = []
+        if bb_vars['UBOOT_FIT_FDT'] != "1":
+            not_req_its_paths.append(['/', 'images', 'fdt'])
         for image in images:
             req_its_paths.append(['/', 'images', image])
             if spl_sign_individual:
@@ -1799,19 +1805,22 @@ class UBootFitImageTests(FitImageTestCase):
         its_field_check = [
             'description = "%s";' % bb_vars['UBOOT_FIT_DESC'],
             'description = "U-Boot image";',
-            'data = /incbin/("%s");' % bb_vars['UBOOT_NODTB_BINARY'],
+            'data = /incbin/("%s");' % bb_vars['UBOOT_FIT_UBOOT_IMAGE'],
             'type = "standalone";',
             'os = "u-boot";',
             'arch = "%s";' % bb_vars['UBOOT_ARCH'],
             'compression = "none";',
             'load = <%s>;' % bb_vars['UBOOT_FIT_UBOOT_LOADADDRESS'],
             'entry = <%s>;' % bb_vars['UBOOT_FIT_UBOOT_ENTRYPOINT'],
-            'description = "U-Boot FDT";',
-            'data = /incbin/("%s");' % bb_vars['UBOOT_DTB_BINARY'],
-            'type = "flat_dt";',
-            'arch = "%s";' % bb_vars['UBOOT_ARCH'],
-            'compression = "none";',
         ]
+        if bb_vars['UBOOT_FIT_FDT'] == "1":
+            its_field_check += [
+                'description = "U-Boot FDT";',
+                'data = /incbin/("%s");' % bb_vars['UBOOT_DTB_BINARY'],
+                'type = "flat_dt";',
+                'arch = "%s";' % bb_vars['UBOOT_ARCH'],
+                'compression = "none";',
+            ]
         if bb_vars['UBOOT_FIT_TEE'] == "1":
             its_field_check += [
                 'description = "Trusted Execution Environment";',
@@ -1840,13 +1849,16 @@ class UBootFitImageTests(FitImageTestCase):
             'default = "conf";',
             'description = "%s";' % bb_vars['UBOOT_FIT_CONF_DESC'],
             'loadables = "%s";' % '", "'.join(loadables),
-            'fdt = "fdt";',
         ]
+        if bb_vars['UBOOT_FIT_FDT'] == "1":
+            its_field_check.append('fdt = "fdt";')
         if bb_vars['SPL_SIGN_ENABLE'] == "1" and bb_vars['SPL_SIGN_CONF'] == "1":
             sign_images = []
             if bb_vars.get('UBOOT_FIT_CONF_FIRMWARE'):
                 sign_images.append("firmware")
-            sign_images += ["loadables", "fdt"]
+            sign_images.append("loadables")
+            if bb_vars['UBOOT_FIT_FDT'] == "1":
+                sign_images.append("fdt")
             its_field_check.append('sign-images = "%s";' % '", "'.join(sign_images))
         return its_field_check
 
@@ -1877,10 +1889,11 @@ class UBootFitImageTests(FitImageTestCase):
                 "Load Address": bb_vars['UBOOT_FIT_UBOOT_LOADADDRESS'],
                 "Entry Point": bb_vars['UBOOT_FIT_UBOOT_ENTRYPOINT'],
             },
-            "fdt": {
+        }
+        if bb_vars['UBOOT_FIT_FDT'] == "1":
+            req_sections['fdt'] = {
                 "Type": "Flat Device Tree",
             }
-        }
         if bb_vars['UBOOT_FIT_TEE'] == "1":
             loadables.append("tee")
             tee_types = {
@@ -1901,9 +1914,10 @@ class UBootFitImageTests(FitImageTestCase):
             }
         req_sections["conf"] = {
             "Kernel": "unavailable",
-            "FDT": "fdt",
             "Loadables": ','.join(loadables),
         }
+        if bb_vars['UBOOT_FIT_FDT'] == "1":
+            req_sections["conf"]["FDT"] = "fdt"
 
         # Add signing related properties if needed
         uboot_fit_hash_alg = bb_vars['UBOOT_FIT_HASH_ALG']
