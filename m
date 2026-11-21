Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13646.1795251603901382196
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 01:00:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=muttNple;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=aTbLtDjx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL8BhDK2262299
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 09:00:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dk+D51k/Fwd
	/y0ckngKBDo/xfT+GWYK/8927r7SMSgk=; b=muttNplereTACr/oKfXKzPtbP7l
	ucJMhB76Xavnpay0oNsWgqd5s890/3Xbs2BHg3E4ZleQwtzrQd+4+HqfNHXfKhYl
	QSzPQYCnrIVww/08JXpcDZ7w+SqjBasTvI4mLwQBBiQEl9D04/RvI8JfgsW5QY4b
	+aINQ2GaET20mo+QVZPJsVSUbqkTw6ExkdJwPQu9uC9DRP8rjbTI9XwiclglOjMl
	FEaArnY3pZbqo5AdpMiWUsVNxuKWJSNmmhgtEYhcr6Ew/CfWn85eNTFuVsPA5rVn
	o+RqtRjdIjdBUAA9e6x6bWynu+mfl5R+LGYakWecvGXzeFRw7w3BTKkFWdw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j30nnrxud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 09:00:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38355b03cb8so1683159eec.0
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 01:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795251600; x=1795856400; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dk+D51k/Fwd/y0ckngKBDo/xfT+GWYK/8927r7SMSgk=;
        b=aTbLtDjx/PU5lW/Wb+F4t+LEYPvOWAq7W8qGYoYca3xpd1I2xS7N5V/sLRkodKfRT2
         qfSuGRfcoqhGeN5WDcvo7ntGPqzjWOTpVgOwRq6zEHa9GSN4NKJ0GDBT+Y0YLpOIe6m7
         Y3y9eck5lmMmSE4y2VjMS8hm2W/LPL8EPjOEP+ztUbDQFMfbHAoRxxv+/1OAKtxfkd8F
         mKc5GM+QRpd0i/6c/p7UXPcF2E+XrLcpLdmxp5XqNEY0yruP0tIEfH8xps3V4Gzrid1I
         jVdgd/osszYL0BtAJxFC3TTxlU6rhGlJoLgJzuoWv8YsnK37CutL7I254Ro3kPhaUfSX
         FqPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795251600; x=1795856400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dk+D51k/Fwd/y0ckngKBDo/xfT+GWYK/8927r7SMSgk=;
        b=hhFqSrtarmpAbZdg/f5hwGVQpCFa4FuwMkCEY4s7hEcHDa2Q5OlQKNatIyYNFzNPNH
         wsJh/kskKWnAKsp4TO+H0QNAJpsg/MNWgY4BUp7up7QfPNP5gVGi3Pe6o6bzgYOQBEny
         ienJbJH6Rstv50AVFZ26/EnnMDAy6JlJZ/aBTOjin1ww/ilM7IljNTOQvExdu5eJwvTN
         oNkAS7HQMwMywcKBDIsbHYPdIY1uMWAXYUhn241pOJGfOX22DjvkEMHcan4t3VxAhe3k
         RvdW7DpgQrRuy41s1UH3o76krgmXzAja8bJBMNuGtcYwMG8HxQrt2awkJ4hYvnTlr4lN
         HgeQ==
X-Gm-Message-State: APuU4Z9CU0oLl9vwNOnLRYWUJJqd0W10Y3zfJrN1u/55hvnztqm3hY92
	vuPIwInd1jQShFx1w+kfBUoimnSmchiIyKnTMM09V8vY2Wcxncq3KcPBIwF+SETpARZqdmODnBl
	hH1Ze7Wic9kbC3beaZXlldiOZNm3f/ExguDRlp+sfPsoMgsSYpG5i6NFR43P00maS7kVkrMwLNc
	/HTVCducyPItt5kJ6H0g==
X-Gm-Gg: AZFdTZdzO8Py2pqXFYbW9bWu09cyzz7GT9wlLYEStA83I4n/fG93mkOaZwO61yt5jEU
	pDUgkx3vnPyCjSotVZzwCZf6qTI0KJplL96YI0ZpQO6SLbHNqdqnG3JbPwjJ0CgbxH7QdrSmACs
	WKka2XmnQBslviZsPQbBf+trBKuCRT73eCTCE9svSJHt+bMahYVlAkazozYAp1LIecop2IHlOSB
	3Ubhb+pTkBA5UXv9eLrjUK7WylqOUfT1w66nTPqOZPIqRkQjo5Elz29K7dzg9omBXQgJEaI+P7o
	Wm3aE2Ok6+ZEbc7SMUhb5I/PC0vfUb8/MNwdfKXyfv2YHTe34Y7nXG65OQgcafqg04yv0XGwbVb
	ZPeArgBJ7DFZB+TwbgKWqcSDsE+iRlrbiADVNPSrxQD2CP9c2Xwa4Xecgbn9puA3g+jwo0P+3JW
	ioULPbIa0iNaakazJpCXdimgkjD83F7x+syhFJA56Hasg=
X-Received: by 2002:a05:693c:881b:10b0:384:b791:6a41 with SMTP id 5a478bee46e88-3857073e4f8mr5636566eec.29.1795251600091;
        Sat, 21 Nov 2026 01:00:00 -0800 (PST)
X-Received: by 2002:a05:693c:881b:10b0:384:b791:6a41 with SMTP id 5a478bee46e88-3857073e4f8mr5636544eec.29.1795251599404;
        Sat, 21 Nov 2026 00:59:59 -0800 (PST)
Received: from hyd-e160-a52-10.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm17887231eec.26.2026.11.21.00.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:59:59 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
        Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH v2 4/4] uboot-sign: add UBOOT_FIT_CONFIGURATIONS
Date: Sat, 21 Nov 2026 14:29:37 +0530
Message-ID: <20261121085937.411140-5-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121085937.411140-1-viswanath.kraleti@oss.qualcomm.com>
References: <20261121085937.411140-1-viswanath.kraleti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAzNSBTYWx0ZWRfXyhujyx97Fpqx
 lvZXN3xgae2PimUkGyDm8uTC97Wn8XE52UHrU6Ji0MpdkJUxoiMrnFAF8ouydgaSSKRoKGDt4N6
 leFVOhU5b+SZWA3OUor5xQMJBTmoArCKf38LEHDSzhdWDeck1PuHwF+DMTe+tCS1jBq2mVi5rXi
 /+w753f7EX9Ey1FyKcd90JaaA0RzM+KcPr2UREdQeigLjac33Frh+pVcq6cCMxuFpV3+q8phJwR
 kn+14u18I2LxoOWeTAx8Mz2TYlwGCs+cIP+jLCy/AyKbQd4NbVKXiWINcc+0FC8mE6f7tIP/JPk
 ZWuBwRWgb1WZnbR+dzL2D0wClQT3GmpgfRhL2L1g9oCq+BMJqdg98ZQt4dJBSlmUInZFoG8E9hg
 tslcxsIUa1WbmOmeg3otZ5aEtX3iWzuNiBNnyzvNvoTMpw/Yct2to8TO+GFt4cF+FXndi77pS+T
 J5SBViWaa54m1mS5WIw==
X-Proofpoint-ORIG-GUID: cgAiJA4GJ3Oyx6ezicj6W5LsWTr5jhJM
X-Authority-Analysis: v=2.4 cv=LITz05W9 c=1 sm=1 tr=0 ts=6b015d91 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=bRHZ-vucfTJdUhQUPqQA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAzNSBTYWx0ZWRfXyXdlFasmPb8O
 A5kR5JU/370ayBZK0B9xVb6CrPMPkrLK0LOj1mZ93Aa9aFVV2mMNhzAlxIXScaagNOBIGdoIDcY
 RuCeiwC77vdkVA+CrU8ye+Ubz3Ggfbc=
X-Proofpoint-GUID: cgAiJA4GJ3Oyx6ezicj6W5LsWTr5jhJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 09:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250846
Content-Type: text/plain; charset="utf-8"

The U-Boot FIT only ever has the one configuration. An SPL that loads
its images in stages, such as one loading firmware from a "pre-ddr"
configuration ahead of DDR init and the rest from a "post-ddr" one,
cannot get the other configurations into it, short of writing them as
ITS text along with their signature nodes.

Add UBOOT_FIT_CONFIGURATIONS, a list of configuration node names written
after the default configuration, each described by
UBOOT_FIT_CONFIGURATION_LOADABLES, _FIRMWARE and _DESCRIPTION varflags
named after the node. Write every configuration, the default one
included, from uboot_fitimage_configuration, so that they are all signed
alike, and run fit_check_sign with -c for each of the additional
configurations, as it otherwise only checks the default one.

Teach the U-Boot FIT selftests about the additional configurations,
have them check every configuration with fit_check_sign, and add a test
signing two additional configurations.

AI-Generated: Uses Claude Code
Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta/classes-recipe/uboot-sign.bbclass   | 150 ++++++++++++++++++-----
 meta/lib/oeqa/selftest/cases/fitimage.py | 119 +++++++++++++++++-
 2 files changed, 234 insertions(+), 35 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 90921c10dd..c46a0d5f04 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -158,6 +158,19 @@ UBOOT_FIT_CONF_USER_LOADABLES ?= ''
 # as a space separated list of node names
 UBOOT_FIT_CONF_LOADABLES ?= ""
 
+# Additional configurations for the U-Boot fitImage, written after the
+# default one, as a space separated list of configuration node names. Each
+# one is described by varflags named after its node:
+#   UBOOT_FIT_CONFIGURATION_LOADABLES[name]  images it loads, as a space
+#                                            separated list of image node
+#                                            names (required)
+#   UBOOT_FIT_CONFIGURATION_FIRMWARE[name]   image to boot first, if any
+#   UBOOT_FIT_CONFIGURATION_DESCRIPTION[name]
+#                                            description, the node name if
+#                                            not set
+# They are signed like the default configuration.
+UBOOT_FIT_CONFIGURATIONS ?= ""
+
 UBOOT_FIT_UBOOT_LOADADDRESS ?= "${UBOOT_LOADADDRESS}"
 UBOOT_FIT_UBOOT_ENTRYPOINT ?= "${UBOOT_ENTRYPOINT}"
 
@@ -490,19 +503,107 @@ def uboot_fitimage_loadables(d):
         cmds.append('uboot_fitimage_loadable ' + ' '.join(shlex.quote(a) for a in args))
     return '\n'.join(cmds)
 
-# The calls to uboot_fitimage_loadable only appear once the image list is
+# Create a ITS configuration node, given its name, description, firmware,
+# loadables and fdt image, signed as SPL_SIGN_CONF asks for it
+uboot_fitimage_configuration() {
+	conf_firmware=""
+	conf_fdt=""
+	conf_sign_images="\"loadables\""
+
+	if [ -n "$3" ] ; then
+		conf_firmware="firmware = \"$3\";"
+		conf_sign_images="\"firmware\", ${conf_sign_images}"
+	fi
+
+	if [ -n "$5" ] ; then
+		conf_fdt="fdt = \"$5\";"
+		conf_sign_images="${conf_sign_images}, \"fdt\""
+	fi
+
+	cat << EOF >> ${UBOOT_ITS}
+        $1 {
+            description = "$2";
+            ${conf_firmware}
+            loadables = $4;
+            ${conf_fdt}
+EOF
+
+	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
+		cat << EOF >> ${UBOOT_ITS}
+            signature {
+                algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
+                key-name-hint = "${SPL_SIGN_KEYNAME}";
+                sign-images = ${conf_sign_images};
+            };
+EOF
+	fi
+
+	cat << EOF >> ${UBOOT_ITS}
+        };
+EOF
+}
+
+# Create a ITS configuration node for a configuration from
+# UBOOT_FIT_CONFIGURATIONS, given its name, description, firmware and
+# loadables
+uboot_fitimage_user_configuration() {
+	images="uboot fdt ${UBOOT_FIT_LOADABLES}"
+	if [ "${UBOOT_FIT_TEE}" = "1" ] ; then
+		images="$images tee"
+	fi
+	if [ "${UBOOT_FIT_ARM_TRUSTED_FIRMWARE}" = "1" ] ; then
+		images="$images atf"
+	fi
+
+	if [ -z "$4" ] ; then
+		bbfatal "UBOOT_FIT_CONFIGURATIONS: $1 needs UBOOT_FIT_CONFIGURATION_LOADABLES[$1]"
+	fi
+
+	loadables=""
+	for image in $3 $4 ; do
+		case " $images " in
+		*" $image "*)
+			;;
+		*)
+			bbfatal "UBOOT_FIT_CONFIGURATIONS: $1 has no $image image to load"
+			;;
+		esac
+	done
+	for image in $4 ; do
+		loadables="${loadables}${loadables:+, }\"$image\""
+	done
+
+	uboot_fitimage_configuration "$1" "$2" "$3" "$loadables" ""
+}
+
+# The uboot_fitimage_user_configuration calls for UBOOT_FIT_CONFIGURATIONS
+def uboot_fitimage_user_configurations(d):
+    import shlex
+    cmds = []
+    for name in (d.getVar('UBOOT_FIT_CONFIGURATIONS') or '').split():
+        args = [name,
+                d.getVarFlag('UBOOT_FIT_CONFIGURATION_DESCRIPTION', name) or name,
+                d.getVarFlag('UBOOT_FIT_CONFIGURATION_FIRMWARE', name) or '',
+                ' '.join((d.getVarFlag('UBOOT_FIT_CONFIGURATION_LOADABLES', name) or '').split())]
+        cmds.append('uboot_fitimage_user_configuration ' + ' '.join(shlex.quote(a) for a in args))
+    return '\n'.join(cmds)
+
+# The calls to uboot_fitimage_loadable and
+# uboot_fitimage_user_configuration only appear once the lists are
 # expanded, and the varflags are read through a name
 uboot_fitimage_assemble[vardeps] += "uboot_fitimage_loadable \
+    uboot_fitimage_user_configuration \
     UBOOT_FIT_LOADABLE_FILENAME UBOOT_FIT_LOADABLE_LOADADDRESS \
     UBOOT_FIT_LOADABLE_ENTRYPOINT UBOOT_FIT_LOADABLE_TYPE \
     UBOOT_FIT_LOADABLE_ARCH UBOOT_FIT_LOADABLE_OS \
-    UBOOT_FIT_LOADABLE_COMPRESSION UBOOT_FIT_LOADABLE_DESCRIPTION"
+    UBOOT_FIT_LOADABLE_COMPRESSION UBOOT_FIT_LOADABLE_DESCRIPTION \
+    UBOOT_FIT_CONFIGURATION_LOADABLES UBOOT_FIT_CONFIGURATION_FIRMWARE \
+    UBOOT_FIT_CONFIGURATION_DESCRIPTION"
 
 # Create a ITS file for the U-boot FIT, for use when
 # we want to sign it so that the SPL can verify it
 uboot_fitimage_assemble() {
 	conf_loadables="\"uboot\""
-	conf_firmware=""
 	rm -f ${UBOOT_ITS} ${UBOOT_FITIMAGE_BINARY}
 
 	# First we create the ITS script
@@ -576,45 +677,19 @@ EOF
 		esac
 	done
 
-	conf_sign_images=""
-	conf_sign_images_sep=""
-
-	if [ -n "${UBOOT_FIT_CONF_FIRMWARE}" ] ; then
-		conf_firmware="firmware = \"${UBOOT_FIT_CONF_FIRMWARE}\";"
-		conf_sign_images="${conf_sign_images}${conf_sign_images_sep}\"firmware\""
-		conf_sign_images_sep=", "
-	fi
-
-	if [ -n "${conf_loadables}" ] ; then
-		conf_sign_images="${conf_sign_images}${conf_sign_images_sep}\"loadables\""
-		conf_sign_images_sep=", "
-	fi
-	conf_sign_images="${conf_sign_images}${conf_sign_images_sep}\"fdt\""
-
 	cat << EOF >> ${UBOOT_ITS}
     };
 
     configurations {
         default = "conf";
-        conf {
-            description = "${UBOOT_FIT_CONF_DESC}";
-            ${conf_firmware}
-            loadables = ${conf_loadables};
-            fdt = "fdt";
 EOF
 
-	if [ "${SPL_SIGN_ENABLE}" = "1" ] && [ "${SPL_SIGN_CONF}" = "1" ] ; then
-		cat << EOF >> ${UBOOT_ITS}
-            signature {
-                algo = "${UBOOT_FIT_HASH_ALG},${UBOOT_FIT_SIGN_ALG}";
-                key-name-hint = "${SPL_SIGN_KEYNAME}";
-                sign-images = ${conf_sign_images};
-            };
-EOF
-	fi
+	uboot_fitimage_configuration "conf" "${UBOOT_FIT_CONF_DESC}" \
+		"${UBOOT_FIT_CONF_FIRMWARE}" "${conf_loadables}" "fdt"
+
+	${@uboot_fitimage_user_configurations(d)}
 
 	cat << EOF >> ${UBOOT_ITS}
-        };
     };
 };
 EOF
@@ -663,6 +738,15 @@ EOF
 			${UBOOT_FIT_CHECK_SIGN} \
 				-k "${SPL_DIR}/${SPL_DTB_SIGNED}" \
 				-f ${UBOOT_FITIMAGE_BINARY}
+
+			# fit_check_sign only checks the default configuration
+			# unless told otherwise, so check the others too
+			for conf in ${UBOOT_FIT_CONFIGURATIONS} ; do
+				${UBOOT_FIT_CHECK_SIGN} \
+					-k "${SPL_DIR}/${SPL_DTB_SIGNED}" \
+					-f ${UBOOT_FITIMAGE_BINARY} \
+					-c "$conf"
+			done
 		else
 			# Sign the U-boot FIT image
 			${UBOOT_MKIMAGE_SIGN} \
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index e3d078ed78..5db1f0940a 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1710,6 +1710,7 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_FIT_CONF_FIRMWARE',
             'UBOOT_FIT_CONF_LOADABLES',
             'UBOOT_FIT_CONF_USER_LOADABLES',
+            'UBOOT_FIT_CONFIGURATIONS',
             'UBOOT_FIT_DESC',
             'UBOOT_FIT_HASH_ALG',
             'UBOOT_FIT_LOADABLES',
@@ -1773,6 +1774,29 @@ class UBootFitImageTests(FitImageTestCase):
             'description': flag('UBOOT_FIT_LOADABLE_DESCRIPTION', '%s loadable' % loadable),
         }
 
+    # The varflags describing each UBOOT_FIT_CONFIGURATIONS entry
+    UBOOT_FIT_CONFIGURATION_FLAGS = [
+        'UBOOT_FIT_CONFIGURATION_DESCRIPTION',
+        'UBOOT_FIT_CONFIGURATION_FIRMWARE',
+        'UBOOT_FIT_CONFIGURATION_LOADABLES',
+    ]
+
+    @staticmethod
+    def _get_uboot_configurations(bb_vars):
+        """Return the configuration node names: the default one, then UBOOT_FIT_CONFIGURATIONS"""
+        return ['conf'] + (bb_vars.get('UBOOT_FIT_CONFIGURATIONS') or '').split()
+
+    @staticmethod
+    def _get_uboot_configuration_settings(bb_vars, configuration):
+        """Return the settings of an UBOOT_FIT_CONFIGURATIONS entry, defaults applied as by the class"""
+        def flag(var, default=None):
+            return (bb_vars.get(var) or {}).get(configuration) or default
+        return {
+            'description': flag('UBOOT_FIT_CONFIGURATION_DESCRIPTION', configuration),
+            'firmware': flag('UBOOT_FIT_CONFIGURATION_FIRMWARE'),
+            'loadables': flag('UBOOT_FIT_CONFIGURATION_LOADABLES', '').split(),
+        }
+
     def _gen_uboot_loadable_dummy_images(self, bb_vars):
         """Generate dummy files for the UBOOT_FIT_LOADABLES images"""
         for loadable in UBootFitImageTests._get_uboot_loadables(bb_vars):
@@ -1821,7 +1845,7 @@ class UBootFitImageTests(FitImageTestCase):
         # if bb_vars['UBOOT_FIT_USER_SETTINGS']:
 
         # configuration nodes
-        configurations = [ 'conf']
+        configurations = UBootFitImageTests._get_uboot_configurations(bb_vars)
 
         spl_sign_enable = bb_vars['SPL_SIGN_ENABLE'] == "1"
         spl_sign_individual = spl_sign_enable and bb_vars['SPL_SIGN_INDIVIDUAL'] == "1"
@@ -1918,6 +1942,20 @@ class UBootFitImageTests(FitImageTestCase):
                 sign_images.append("firmware")
             sign_images += ["loadables", "fdt"]
             its_field_check.append('sign-images = "%s";' % '", "'.join(sign_images))
+        for configuration in UBootFitImageTests._get_uboot_configurations(bb_vars)[1:]:
+            settings = UBootFitImageTests._get_uboot_configuration_settings(bb_vars, configuration)
+            its_field_check += [
+                '%s {' % configuration,
+                'description = "%s";' % settings['description'],
+            ]
+            sign_images = []
+            if settings['firmware']:
+                its_field_check.append('firmware = "%s";' % settings['firmware'])
+                sign_images.append("firmware")
+            its_field_check.append('loadables = "%s";' % '", "'.join(settings['loadables']))
+            sign_images.append("loadables")
+            if bb_vars['SPL_SIGN_ENABLE'] == "1" and bb_vars['SPL_SIGN_CONF'] == "1":
+                its_field_check.append('sign-images = "%s";' % '", "'.join(sign_images))
         return its_field_check
 
     def _get_req_sigvalues_config(self, bb_vars):
@@ -1982,6 +2020,16 @@ class UBootFitImageTests(FitImageTestCase):
             "FDT": "fdt",
             "Loadables": ','.join(loadables),
         }
+        configurations = UBootFitImageTests._get_uboot_configurations(bb_vars)
+        for configuration in configurations[1:]:
+            settings = UBootFitImageTests._get_uboot_configuration_settings(bb_vars, configuration)
+            req_sections[configuration] = {
+                "Description": settings['description'],
+                "Kernel": "unavailable",
+                "Loadables": ','.join(settings['loadables']),
+            }
+            if settings['firmware']:
+                req_sections[configuration]["Firmware"] = settings['firmware']
 
         # Add signing related properties if needed
         uboot_fit_hash_alg = bb_vars['UBOOT_FIT_HASH_ALG']
@@ -1993,7 +2041,7 @@ class UBootFitImageTests(FitImageTestCase):
         num_signatures = 0
         if spl_sign_enable == "1":
             for section in req_sections:
-                if section.startswith('conf'):
+                if section in configurations:
                     if spl_sign_conf == "1":
                         req_sections[section]['Sign algo'] = "%s,%s:%s" % \
                             (uboot_fit_hash_alg, uboot_fit_sign_alg, spl_sign_keyname)
@@ -2040,6 +2088,11 @@ class UBootFitImageTests(FitImageTestCase):
                                       "%s,%s" % (uboot_fit_hash_alg, uboot_fit_sign_alg))
             self._verify_dtb_property(dtc_bindir, spl_dtb_path, key_dtb_path, "key-name-hint", spl_sign_keyname)
 
+            # Check the signature of each configuration with the key in the SPL DTB
+            if bb_vars['SPL_SIGN_CONF'] == "1":
+                for configuration in UBootFitImageTests._get_uboot_configurations(bb_vars):
+                    self._verify_fit_image_signature(uboot_tools_bindir, fitimage_path, spl_dtb_path, configuration)
+
         # Search for the string passed to mkimage in each signed section of the FIT image.
         # Looks like mkimage supports to add a comment but does not support to read it back.
         a_comment = FitImageTestCase._get_uboot_mkimage_sign_args(bb_vars['SPL_MKIMAGE_SIGN_ARGS'])
@@ -2360,6 +2413,68 @@ UBOOT_FIT_HASH_ALG = "sha256"
         self._test_fitimage(bb_vars)
         self._check_uboot_loadable_defaults(bb_vars)
 
+    def test_sign_uboot_fit_image_configurations(self):
+        """
+        Summary:     Check if the configurations from UBOOT_FIT_CONFIGURATIONS
+                     are added to the U-Boot FIT image and Image Tree Source
+                     (its) and signed like the default configuration.
+        Expected:    1) U-Boot its and FIT image are built and signed
+                        successfully
+                     2) Each UBOOT_FIT_CONFIGURATIONS entry has a configuration
+                        node after the default one, with the firmware,
+                        loadables and description from its
+                        UBOOT_FIT_CONFIGURATION_* varflags, the description
+                        defaulting to the node name, and no fdt property
+                     3) Each configuration has a signature node covering its
+                        firmware and loadables
+                     4) Dumping the FIT image shows signatures for all the
+                        configurations, and fit_check_sign verifies each of
+                        them with the key in the SPL DTB
+                     5) SPL_MKIMAGE_SIGN_ARGS is passed to mkimage for each
+                        signed configuration
+        Product:     oe-core
+        Author:      Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
+        """
+        machine = self._get_machine_or_skip()
+        config = """
+# Enable creation and signing of the U-Boot fitImage
+UBOOT_FITIMAGE_ENABLE = "1"
+SPL_SIGN_ENABLE = "1"
+SPL_SIGN_KEYNAME = "spl-configurations-oe-selftest"
+SPL_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
+UBOOT_ENTRYPOINT  = "0x80000000"
+UBOOT_LOADADDRESS = "0x80000000"
+UBOOT_DTB_LOADADDRESS = "0x82000000"
+SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
+SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot configurations comment'"
+UBOOT_EXTLINUX = "0"
+UBOOT_FIT_GENERATE_KEYS = "1"
+UBOOT_FIT_HASH_ALG = "sha256"
+
+# Two more configurations: pre-ddr boots loadable1 and loads loadable2,
+# minimal only loads U-Boot and has no description set
+UBOOT_FIT_CONFIGURATIONS = "pre-ddr minimal"
+UBOOT_FIT_CONFIGURATION_FIRMWARE[pre-ddr] = "loadable1"
+UBOOT_FIT_CONFIGURATION_LOADABLES[pre-ddr] = "loadable2"
+UBOOT_FIT_CONFIGURATION_DESCRIPTION[pre-ddr] = "Boot ahead of the DDR init"
+UBOOT_FIT_CONFIGURATION_LOADABLES[minimal] = "uboot"
+""" + UBootFitImageTests.UBOOT_FIT_LOADABLES_CONFIG
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["UBOOT_MACHINE", "SPL_BINARY", "UBOOT_DTB_BINARY", "UBOOT_ARCH"])
+        config = self._require_machine_capability(config, machine, '_cap_spl_dtb')
+        self.write_config(config)
+        configurations = ['pre-ddr', 'minimal']
+        flags = {flag: ['loadable1', 'loadable2'] for flag in UBootFitImageTests.UBOOT_FIT_LOADABLE_FLAGS}
+        flags.update({flag: configurations for flag in UBootFitImageTests.UBOOT_FIT_CONFIGURATION_FLAGS})
+        bb_vars = self._fit_get_bb_vars(flags=flags)
+        self._gen_uboot_loadable_dummy_images(bb_vars)
+        self._test_fitimage(bb_vars)
+
+        # The additional configurations load no device tree
+        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "u-boot-fitImage-%s" % bb_vars['MACHINE'])
+        dtc_bindir = FitImageTestCase._setup_native('dtc-native')
+        for configuration in configurations:
+            self._verify_dtb_property(dtc_bindir, fitimage_path, '/configurations/%s' % configuration, 'fdt', None, absent=True)
+
     def test_sign_cascaded_uboot_fit_image(self):
         """
         Summary:     Check if U-Boot FIT image and Image Tree Source (its) are
