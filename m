Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13645.1795251600282560822
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2026 01:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GQuBEYeh;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=ED2Wc7Gp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: viswanath.kraleti@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AL8Au3P064178
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 08:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Tye4JhmvF8U
	cmTwaTwQ+IS10CLjCNYYRF5KVR4efjM8=; b=GQuBEYeh9Esmea6HoXVxI7dqoOz
	lbv8K/jvT6RH+dQhD0pDfFZvs+sox10Ws0M/o0qNbNmxWL6CxJYM/61ckMs9Eqgf
	r/OZtJgT1sqO/hLYZsK6AQ4PqXnEOPtnTv2WnsYKkGRQqaxVw1brwKpmnhN9Ug2U
	twvyea5vnNU0+NgIFfyddSjjM62nsoaK4I93pTuLUZ6RtnpcUjPjIYOELLDS0Hzf
	XXSWBJJ+W22NqOy7ZKK+YbK8XpxCQKLp42hwRGZ34aqHhh6NcpAmrft/hTcCokYq
	GoNRcjLfkZRP5POBPCTVvSkf97GITSUj+R7v+rHivpF03koecaWhtLmHZdg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu0k58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 08:59:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-383ec96a7deso1933939eec.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 00:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795251598; x=1795856398; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tye4JhmvF8UcmTwaTwQ+IS10CLjCNYYRF5KVR4efjM8=;
        b=ED2Wc7Gpyl4yp1P0XqlOmSxb8nf53BMHDQwt+zgSD/EMOkt417OjjG47XQ2nFvexOl
         sKYlZVofy0/4h4PLsYvkN9r8b7uKZkrqZ2I1ab9J9RJdUO0OqXSrcffsNQUfASDGU8Ht
         XAufxF0gMKBF0wvr3IkGaz0c+i0gFAoaCOa+ssYQya1+eloReMxM+K0IQd0bHO0StP9l
         zk5UCNiF0qMwrt61kvxjkt0wFF8YjrdMTFNQWbYu9QqoPPAM2JdOUAwWXB9Hr3mDmxTO
         wv4aYxx4dUGELibPrNPQTOZyzL+h19CHoE3VRBAlnBm3ELIFtQmeh6tNXdZTWw3NQ0Qz
         tGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795251598; x=1795856398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tye4JhmvF8UcmTwaTwQ+IS10CLjCNYYRF5KVR4efjM8=;
        b=mRdG8aRgFn0QsEDokv/S6DXShQiD8IDSygMkjycYZgkaXj3fKrzsOJCgFllj7dKp4K
         PlrFBemtnTbVcD6r3tORNEO6t38nai3ijZSD9piaExmzYiB2gTR4vmAb/WJluHa9d+0X
         dIxHjyskDgpPEGjUy+td4rgzLlYKAGIpxOPE4ODIU4GxmrxjuX/vvB2omqw9rHBZdo+b
         BSUR0P4AoRPS85e10BJ74QSP7Cm4AKxcvGAh+hMoFRUhmnkZPvp79F1QK51lVXvPUpGy
         JEynYIALGfPLUNzdNi8AWCUTMktg5YJYJEINOe/j89QK2KVPIi97An5Q0XhJUbRUE0GS
         h8UQ==
X-Gm-Message-State: APuU4Z+G+/EeM//7NEcxuM2MGTRfmcNTUsZStIncIxKiseD9SYrF4ZeM
	U6wkw1ZbGrVdxXYQi93gozQfxxFIm1cJZnTnAtlT5SWdiakkn3uu8xi5Tzj8PGFnEVrYUXXKl3R
	dX65Em4O55nLYdEUTG0jEDzDOyydpKZQplgB9Kr1xqUX0PVAYNjEHTLHy0nLogiyci8BI5AfPxy
	tH6Hu4VD7Eq1p8ChX70Q==
X-Gm-Gg: AZFdTZegUgsiZLZVl/mufvliS7kWvVB7PCyd8QUnBmQIhIadSgG6KD5F1ozZP0Lmah1
	OKnUge/VVLXDVWmUP7E9wctWTiE4rhdjyM3ZO5a04O4tPgurk+E/Gh4xlnWZp1peG9GJBNioaDq
	F9VUbd4Q5OdHfYgIEJ2JmcllP1lM6KgHnwWhT1vrYDSvH6yleAVwUCyzO5GLPAKm8lGMlHhFLLA
	l7R14U1pQ6Pm3ucnb2KSATpyeLd4l5Whxx+OX51Cq97nypXPvE2KUfWFy6FQ1NqToPyvauPt+93
	GLdOA/ACo+o0cmeMqHKVIW0gvz0hlwXiveooRofm5ZBL320zgZUKC9hpKvUFee5pNNFQTUR8uVP
	BB4TNF8KJNO2PjtQsoU2DqC/lcRedosXL6ohiCuikBX8C0FySMpCquRCR+nj86x5+p4p3kdjIRP
	ipcuZZeJbXFtStugSqUr17SBEtwnIT7ABBXrrbn9KE4mM=
X-Received: by 2002:a05:7300:7b26:b0:380:f32e:d257 with SMTP id 5a478bee46e88-3856f6524a1mr5180852eec.13.1795251597693;
        Sat, 21 Nov 2026 00:59:57 -0800 (PST)
X-Received: by 2002:a05:7300:7b26:b0:380:f32e:d257 with SMTP id 5a478bee46e88-3856f6524a1mr5180828eec.13.1795251597015;
        Sat, 21 Nov 2026 00:59:57 -0800 (PST)
Received: from hyd-e160-a52-10.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm17887231eec.26.2026.11.21.00.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 00:59:56 -0800 (PST)
From: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>,
        Ricardo Salveti <ricardo.salveti@oss.qualcomm.com>,
        Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
Subject: [OE-core][PATCH v2 3/4] uboot-sign: add UBOOT_FIT_LOADABLES
Date: Sat, 21 Nov 2026 14:29:36 +0530
Message-ID: <20261121085937.411140-4-viswanath.kraleti@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121085937.411140-1-viswanath.kraleti@oss.qualcomm.com>
References: <20261121085937.411140-1-viswanath.kraleti@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _0X_iY21aKVGcJ8Gna9byl6HG5t9xCgN
X-Proofpoint-ORIG-GUID: _0X_iY21aKVGcJ8Gna9byl6HG5t9xCgN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIxMDAzNSBTYWx0ZWRfX4lOGeideBypq
 oDRQeYbQlwc0j/yeDMHzLSQIcnI1a5Y9ctip2jUbVJh2Jg0rzRGz5/Wgp3aW+CObt7lmdlISde/
 j5dt59tZWyvXKybGPSOCSZfkgQEtkWrs1Kgf2yHW0FRw79QkpVzGKpMiSpTFnGo7MadrNZGyfpK
 BC3XDHq8jD6iiLRjJuZYfkTTJDKTliWMgOp+2njTne6KhO2qcYUNlMRJ4eggc2NZPCUwWGsrcoW
 DG9kcIzfKEeH3w8TbPR0Lg1zoyP0SxcCayohoQKb6Lb94l2XKamWOjfXNuMZmRrRn8v2Vj/sNw5
 0hzuVEw3ihPJ6JZS9e0urGgV/XQLwjpB+UbH/BFWyEbQkFjMRGPdv6pQk2OSZA4mFRLvisVdjCZ
 vggc7apWpBrqYlQy2on0V0CvjENsqiC3gFkz/FI4EDihGDzEqCnpvPsYaZ4N1isQUzqxDZpaICo
 giLLCxXMNiy/tEzkVNQ==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b015d8e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=1S-zBF3sY3yuuNrEChkA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIxMDAzNSBTYWx0ZWRfX+oPf6wYjmD0K
 laPbh3boU7xCKpl2Km02NmXs/PbISOtuzJBszXiJiDeyqQL1Gx0IaJh4T4oUrbCYc53blFIKKZH
 zc5EpTzLO9Jh4TNSq8YbPP+uOqg5A5Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-21_02,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611210035
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2026 09:00:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250845
Content-Type: text/plain; charset="utf-8"

A machine adding firmware images to the U-Boot FIT has to write their
nodes itself, as ITS text in UBOOT_FIT_USER_SETTINGS, together with the
hash and signature nodes the class would give them. Those copies of the
signing logic go stale: they miss SPL_SIGN_INDIVIDUAL, or keep their
hash nodes when signing is off.

Add UBOOT_FIT_LOADABLES, a list of image node names, each described by
UBOOT_FIT_LOADABLE_FILENAME, _LOADADDRESS, _ENTRYPOINT, _TYPE, _ARCH,
_OS, _COMPRESSION and _DESCRIPTION varflags named after the node, as
FIT_LOADABLES does for the kernel FIT image, and UBOOT_FIT_CONF_LOADABLES
to load them from the configuration. The class writes their nodes like
its own, hash and signature nodes included.

The varflags are read as the task runs, so a prefunc can still set
addresses only known once a dependency has deployed.

Teach the U-Boot FIT selftests about the loadable images, and add tests
for them both unsigned and individually signed.

AI-Generated: Uses Claude Code
Signed-off-by: Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
---
 meta/classes-recipe/uboot-sign.bbclass   |  98 ++++++++++++
 meta/lib/oeqa/selftest/cases/fitimage.py | 189 ++++++++++++++++++++++-
 2 files changed, 284 insertions(+), 3 deletions(-)

diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
index 1c738f7f9d..90921c10dd 100644
--- a/meta/classes-recipe/uboot-sign.bbclass
+++ b/meta/classes-recipe/uboot-sign.bbclass
@@ -121,6 +121,28 @@ UBOOT_FIT_TEE_IMAGE ?= "tee-raw.bin"
 # User specific settings
 UBOOT_FIT_USER_SETTINGS ?= ""
 
+# Additional images for the U-Boot fitImage, as a space separated list of
+# image node names, like FIT_LOADABLES for the kernel FIT image. Each one is
+# described by varflags named after its node, e.g.:
+#
+#   UBOOT_FIT_LOADABLES = "fw"
+#   UBOOT_FIT_LOADABLE_FILENAME[fw] = "fw.bin"
+#   UBOOT_FIT_LOADABLE_LOADADDRESS[fw] = "0x80400000"
+#   UBOOT_FIT_LOADABLE_ENTRYPOINT[fw] = "0x80400000"
+#   UBOOT_FIT_LOADABLE_TYPE[fw] = "firmware"
+#   UBOOT_FIT_LOADABLE_ARCH[fw] = "arm64"
+#   UBOOT_FIT_LOADABLE_OS[fw] = "elf"
+#   UBOOT_FIT_LOADABLE_COMPRESSION[fw] = "none"
+#   UBOOT_FIT_LOADABLE_DESCRIPTION[fw] = "Firmware image"
+#
+# FILENAME and LOADADDRESS are required. FILENAME is absolute or relative to
+# the U-Boot build directory, as the images are packed from there rather than
+# from DEPLOY_DIR_IMAGE. ENTRYPOINT and OS are left out if not set, TYPE
+# defaults to "firmware", ARCH to ${UBOOT_ARCH}, COMPRESSION to "none" and
+# DESCRIPTION to "<name> loadable". The nodes get the same hash and signature
+# nodes as the class's own.
+UBOOT_FIT_LOADABLES ?= ""
+
 # U-Boot fitImage configuration description
 UBOOT_FIT_CONF_DESC ?= "Boot with signed U-Boot FIT"
 
@@ -132,6 +154,10 @@ UBOOT_FIT_CONF_FIRMWARE ?= ""
 # It is a comma-separated list of strings.
 UBOOT_FIT_CONF_USER_LOADABLES ?= ''
 
+# Images from UBOOT_FIT_LOADABLES loaded by the configuration, after its own,
+# as a space separated list of node names
+UBOOT_FIT_CONF_LOADABLES ?= ""
+
 UBOOT_FIT_UBOOT_LOADADDRESS ?= "${UBOOT_LOADADDRESS}"
 UBOOT_FIT_UBOOT_ENTRYPOINT ?= "${UBOOT_ENTRYPOINT}"
 
@@ -413,6 +439,65 @@ EOF
 EOF
 }
 
+# Create a ITS image node for an image from UBOOT_FIT_LOADABLES, given its
+# name, file, load address, entry point, type, arch, os, compression and
+# description
+uboot_fitimage_loadable() {
+	if [ -z "$2" ] || [ -z "$3" ] ; then
+		bbfatal "UBOOT_FIT_LOADABLES: $1 needs UBOOT_FIT_LOADABLE_FILENAME[$1] and UBOOT_FIT_LOADABLE_LOADADDRESS[$1]"
+	fi
+
+	cat << EOF >> ${UBOOT_ITS}
+        $1 {
+            description = "$9";
+            data = /incbin/("$2");
+            type = "$5";
+            arch = "$6";
+EOF
+	if [ -n "$7" ] ; then
+		echo "            os = \"$7\";" >> ${UBOOT_ITS}
+	fi
+	echo "            load = <$3>;" >> ${UBOOT_ITS}
+	if [ -n "$4" ] ; then
+		echo "            entry = <$4>;" >> ${UBOOT_ITS}
+	fi
+	echo "            compression = \"$8\";" >> ${UBOOT_ITS}
+
+	uboot_fitimage_image_signing
+
+	cat << EOF >> ${UBOOT_ITS}
+        };
+EOF
+}
+
+# The uboot_fitimage_loadable calls for UBOOT_FIT_LOADABLES. The varflags are
+# read as the task runs, so that a prefunc can still set them.
+def uboot_fitimage_loadables(d):
+    import shlex
+    cmds = []
+    for name in (d.getVar('UBOOT_FIT_LOADABLES') or '').split():
+        def flag(var, default=''):
+            return d.getVarFlag(var, name) or default
+        args = [name,
+                flag('UBOOT_FIT_LOADABLE_FILENAME'),
+                flag('UBOOT_FIT_LOADABLE_LOADADDRESS'),
+                flag('UBOOT_FIT_LOADABLE_ENTRYPOINT'),
+                flag('UBOOT_FIT_LOADABLE_TYPE', 'firmware'),
+                flag('UBOOT_FIT_LOADABLE_ARCH', d.getVar('UBOOT_ARCH')),
+                flag('UBOOT_FIT_LOADABLE_OS'),
+                flag('UBOOT_FIT_LOADABLE_COMPRESSION', 'none'),
+                flag('UBOOT_FIT_LOADABLE_DESCRIPTION', '%s loadable' % name)]
+        cmds.append('uboot_fitimage_loadable ' + ' '.join(shlex.quote(a) for a in args))
+    return '\n'.join(cmds)
+
+# The calls to uboot_fitimage_loadable only appear once the image list is
+# expanded, and the varflags are read through a name
+uboot_fitimage_assemble[vardeps] += "uboot_fitimage_loadable \
+    UBOOT_FIT_LOADABLE_FILENAME UBOOT_FIT_LOADABLE_LOADADDRESS \
+    UBOOT_FIT_LOADABLE_ENTRYPOINT UBOOT_FIT_LOADABLE_TYPE \
+    UBOOT_FIT_LOADABLE_ARCH UBOOT_FIT_LOADABLE_OS \
+    UBOOT_FIT_LOADABLE_COMPRESSION UBOOT_FIT_LOADABLE_DESCRIPTION"
+
 # Create a ITS file for the U-boot FIT, for use when
 # we want to sign it so that the SPL can verify it
 uboot_fitimage_assemble() {
@@ -474,10 +559,23 @@ EOF
 		printf "%b" "${UBOOT_FIT_USER_SETTINGS}" >> ${UBOOT_ITS}
 	fi
 
+	${@uboot_fitimage_loadables(d)}
+
 	if [ -n "${UBOOT_FIT_CONF_USER_LOADABLES}" ] ; then
 		conf_loadables="${conf_loadables}${UBOOT_FIT_CONF_USER_LOADABLES}"
 	fi
 
+	for image in ${UBOOT_FIT_CONF_LOADABLES} ; do
+		case " ${UBOOT_FIT_LOADABLES} " in
+		*" $image "*)
+			conf_loadables="${conf_loadables}, \"$image\""
+			;;
+		*)
+			bbfatal "UBOOT_FIT_CONF_LOADABLES: $image is not in UBOOT_FIT_LOADABLES"
+			;;
+		esac
+	done
+
 	conf_sign_images=""
 	conf_sign_images_sep=""
 
diff --git a/meta/lib/oeqa/selftest/cases/fitimage.py b/meta/lib/oeqa/selftest/cases/fitimage.py
index 73b1d68fcd..e3d078ed78 100644
--- a/meta/lib/oeqa/selftest/cases/fitimage.py
+++ b/meta/lib/oeqa/selftest/cases/fitimage.py
@@ -1674,10 +1674,12 @@ class UBootFitImageTests(FitImageTestCase):
 
     BOOTLOADER_RECIPE = "virtual/bootloader"
 
-    def _fit_get_bb_vars(self, additional_vars=[]):
+    def _fit_get_bb_vars(self, additional_vars=[], flags=None):
         """Get bb_vars as needed by _test_sign_fit_image
 
-        Call the get_bb_vars function once and get all variables needed by the test case.
+        Call the get_bb_vars_flags function once and get all variables needed by
+        the test case. flags maps variable names to lists of flag names. The
+        flags are returned as dict {flag name: value} for their variable name.
         """
         internal_used = {
             'DEPLOY_DIR_IMAGE',
@@ -1706,9 +1708,11 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_FIT_ARM_TRUSTED_FIRMWARE',
             'UBOOT_FIT_CONF_DESC',
             'UBOOT_FIT_CONF_FIRMWARE',
+            'UBOOT_FIT_CONF_LOADABLES',
             'UBOOT_FIT_CONF_USER_LOADABLES',
             'UBOOT_FIT_DESC',
             'UBOOT_FIT_HASH_ALG',
+            'UBOOT_FIT_LOADABLES',
             'UBOOT_FIT_SIGN_ALG',
             'UBOOT_FIT_TEE_ENTRYPOINT',
             'UBOOT_FIT_TEE_IMAGE',
@@ -1724,10 +1728,60 @@ class UBootFitImageTests(FitImageTestCase):
             'UBOOT_SIGN_KEYDIR',
             'UBOOT_SIGN_KEYNAME',
         }
-        bb_vars = get_bb_vars(list(internal_used | set(additional_vars)), UBootFitImageTests.BOOTLOADER_RECIPE)
+        bb_vars, bb_flags = get_bb_vars_flags(list(internal_used | set(additional_vars)), flags,
+                                              UBootFitImageTests.BOOTLOADER_RECIPE)
+        bb_vars.update(bb_flags)
         self.logger.debug("bb_vars: %s" % pprint.pformat(bb_vars, indent=4))
         return bb_vars
 
+    # The varflags describing each UBOOT_FIT_LOADABLES entry
+    UBOOT_FIT_LOADABLE_FLAGS = [
+        'UBOOT_FIT_LOADABLE_ARCH',
+        'UBOOT_FIT_LOADABLE_COMPRESSION',
+        'UBOOT_FIT_LOADABLE_DESCRIPTION',
+        'UBOOT_FIT_LOADABLE_ENTRYPOINT',
+        'UBOOT_FIT_LOADABLE_FILENAME',
+        'UBOOT_FIT_LOADABLE_LOADADDRESS',
+        'UBOOT_FIT_LOADABLE_OS',
+        'UBOOT_FIT_LOADABLE_TYPE',
+    ]
+
+    # dumpimage names of the image types used by the UBOOT_FIT_LOADABLES tests
+    UBOOT_FIT_LOADABLE_TYPE_NAMES = {
+        'firmware': 'Firmware',
+        'standalone': 'Standalone Program',
+    }
+
+    @staticmethod
+    def _get_uboot_loadables(bb_vars):
+        """Return the image node names in UBOOT_FIT_LOADABLES"""
+        return (bb_vars.get('UBOOT_FIT_LOADABLES') or '').split()
+
+    @staticmethod
+    def _get_uboot_loadable_settings(bb_vars, loadable):
+        """Return the settings of an UBOOT_FIT_LOADABLES image, defaults applied as by the class"""
+        def flag(var, default=None):
+            return (bb_vars.get(var) or {}).get(loadable) or default
+        return {
+            'filename': flag('UBOOT_FIT_LOADABLE_FILENAME'),
+            'loadaddress': flag('UBOOT_FIT_LOADABLE_LOADADDRESS'),
+            'entrypoint': flag('UBOOT_FIT_LOADABLE_ENTRYPOINT'),
+            'type': flag('UBOOT_FIT_LOADABLE_TYPE', 'firmware'),
+            'arch': flag('UBOOT_FIT_LOADABLE_ARCH', bb_vars['UBOOT_ARCH']),
+            'os': flag('UBOOT_FIT_LOADABLE_OS'),
+            'compression': flag('UBOOT_FIT_LOADABLE_COMPRESSION', 'none'),
+            'description': flag('UBOOT_FIT_LOADABLE_DESCRIPTION', '%s loadable' % loadable),
+        }
+
+    def _gen_uboot_loadable_dummy_images(self, bb_vars):
+        """Generate dummy files for the UBOOT_FIT_LOADABLES images"""
+        for loadable in UBootFitImageTests._get_uboot_loadables(bb_vars):
+            filename = UBootFitImageTests._get_uboot_loadable_settings(bb_vars, loadable)['filename']
+            self.assertTrue(os.path.isabs(filename),
+                            "The test images need an absolute UBOOT_FIT_LOADABLE_FILENAME[%s]" % loadable)
+            with open(filename, 'wb') as f:
+                f.write(os.urandom(256))
+
     def _bitbake_fit_image(self, bb_vars):
         """Bitbake the bootloader and return the paths to the its file and the FIT image"""
         machine = bb_vars['MACHINE']
@@ -1763,6 +1817,7 @@ class UBootFitImageTests(FitImageTestCase):
             images.append('tee')
         if bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE'] == "1":
             images.append('atf')
+        images += UBootFitImageTests._get_uboot_loadables(bb_vars)
         # if bb_vars['UBOOT_FIT_USER_SETTINGS']:
 
         # configuration nodes
@@ -1835,6 +1890,22 @@ class UBootFitImageTests(FitImageTestCase):
                 'compression = "none";',
             ]
             loadables.insert(0, "atf")
+        for loadable in UBootFitImageTests._get_uboot_loadables(bb_vars):
+            settings = UBootFitImageTests._get_uboot_loadable_settings(bb_vars, loadable)
+            its_field_check += [
+                '%s {' % loadable,
+                'description = "%s";' % settings['description'],
+                'data = /incbin/("%s");' % settings['filename'],
+                'type = "%s";' % settings['type'],
+                'arch = "%s";' % settings['arch'],
+            ]
+            if settings['os']:
+                its_field_check.append('os = "%s";' % settings['os'])
+            its_field_check.append('load = <%s>;' % settings['loadaddress'])
+            if settings['entrypoint']:
+                its_field_check.append('entry = <%s>;' % settings['entrypoint'])
+            its_field_check.append('compression = "%s";' % settings['compression'])
+        loadables += (bb_vars.get('UBOOT_FIT_CONF_LOADABLES') or '').split()
         its_field_check += [
             'default = "conf";',
             'description = "%s";' % bb_vars['UBOOT_FIT_CONF_DESC'],
@@ -1894,6 +1965,18 @@ class UBootFitImageTests(FitImageTestCase):
                 "Load Address": bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_LOADADDRESS'],
                 # "Entry Point": bb_vars['UBOOT_FIT_ARM_TRUSTED_FIRMWARE_ENTRYPOINT'], not printed by mkimage?
             }
+        for loadable in UBootFitImageTests._get_uboot_loadables(bb_vars):
+            settings = UBootFitImageTests._get_uboot_loadable_settings(bb_vars, loadable)
+            req_sections[loadable] = {
+                "Load Address": settings['loadaddress'],
+            }
+            type_name = UBootFitImageTests.UBOOT_FIT_LOADABLE_TYPE_NAMES.get(settings['type'])
+            if type_name:
+                req_sections[loadable]["Type"] = type_name
+            # dumpimage prints the entry point of standalone images, not of firmware ones
+            if settings['entrypoint'] and settings['type'] == 'standalone':
+                req_sections[loadable]["Entry Point"] = settings['entrypoint']
+        loadables += (bb_vars.get('UBOOT_FIT_CONF_LOADABLES') or '').split()
         req_sections["conf"] = {
             "Kernel": "unavailable",
             "FDT": "fdt",
@@ -2177,6 +2260,106 @@ UBOOT_FIT_MKIMAGE_EXTRA_OPTS = "-E"
             result = runCmd('%s %s %s data-offset' % (fdtget_path, fitimage_path, node))
             self.logger.debug("%s data-offset: %s" % (node, result.output))
 
+    UBOOT_FIT_LOADABLES_CONFIG = """
+# Two images from UBOOT_FIT_LOADABLES: loadable1 with only the required
+# settings, loadable2 with all of them, loaded by the configuration
+UBOOT_FIT_LOADABLES = "loadable1 loadable2"
+UBOOT_FIT_LOADABLE_FILENAME[loadable1] = "${TOPDIR}/loadable1-dummy.bin"
+UBOOT_FIT_LOADABLE_LOADADDRESS[loadable1] = "0x80400000"
+UBOOT_FIT_LOADABLE_FILENAME[loadable2] = "${TOPDIR}/loadable2-dummy.bin"
+UBOOT_FIT_LOADABLE_LOADADDRESS[loadable2] = "0x80500000"
+UBOOT_FIT_LOADABLE_ENTRYPOINT[loadable2] = "0x80500100"
+UBOOT_FIT_LOADABLE_TYPE[loadable2] = "standalone"
+UBOOT_FIT_LOADABLE_ARCH[loadable2] = "arm"
+UBOOT_FIT_LOADABLE_OS[loadable2] = "elf"
+UBOOT_FIT_LOADABLE_COMPRESSION[loadable2] = "gzip"
+UBOOT_FIT_LOADABLE_DESCRIPTION[loadable2] = "The second loadable"
+UBOOT_FIT_CONF_LOADABLES = "loadable2"
+"""
+
+    def _fit_get_bb_vars_loadables(self, loadables=['loadable1', 'loadable2']):
+        """Get bb_vars including the varflags of UBOOT_FIT_LOADABLES_CONFIG"""
+        return self._fit_get_bb_vars(flags={flag: loadables for flag in UBootFitImageTests.UBOOT_FIT_LOADABLE_FLAGS})
+
+    def _check_uboot_loadable_defaults(self, bb_vars):
+        """Check that loadable1 of UBOOT_FIT_LOADABLES_CONFIG has no entry and os property"""
+        fitimage_path = os.path.join(bb_vars['DEPLOY_DIR_IMAGE'], "u-boot-fitImage-%s" % bb_vars['MACHINE'])
+        dtc_bindir = FitImageTestCase._setup_native('dtc-native')
+        for prop in ('entry', 'os'):
+            self._verify_dtb_property(dtc_bindir, fitimage_path, '/images/loadable1', prop, None, absent=True)
+
+    def test_uboot_fit_image_loadables(self):
+        """
+        Summary:     Check if the images from UBOOT_FIT_LOADABLES are added
+                     to the U-Boot FIT image and Image Tree Source (its).
+        Expected:    1) U-Boot its and FIT image are built successfully
+                     2) Each UBOOT_FIT_LOADABLES entry has an image node with
+                        the properties from its UBOOT_FIT_LOADABLE_* varflags,
+                        or their defaults when not set: type "firmware",
+                        arch UBOOT_ARCH, compression "none", description
+                        "<name> loadable" and no entry or os property
+                     3) The configuration loads the images listed in
+                        UBOOT_FIT_CONF_LOADABLES after its own ones
+                     4) Dumping the FIT image shows the image nodes
+        Product:     oe-core
+        Author:      Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
+        """
+        machine = self._get_machine_or_skip()
+        config = """
+# Enable creation of the U-Boot fitImage
+UBOOT_FITIMAGE_ENABLE = "1"
+UBOOT_LOADADDRESS = "0x80080000"
+UBOOT_ENTRYPOINT = "0x80080000"
+""" + UBootFitImageTests.UBOOT_FIT_LOADABLES_CONFIG
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["UBOOT_MACHINE", "SPL_BINARY"])
+        self.write_config(config)
+        bb_vars = self._fit_get_bb_vars_loadables()
+        self._gen_uboot_loadable_dummy_images(bb_vars)
+        self._test_fitimage(bb_vars)
+        self._check_uboot_loadable_defaults(bb_vars)
+
+    def test_sign_uboot_fit_image_loadables_individual(self):
+        """
+        Summary:     Check if the images from UBOOT_FIT_LOADABLES are signed
+                     like the other images of the U-Boot FIT image when the
+                     individual images are signed (SPL_SIGN_INDIVIDUAL = "1").
+        Expected:    1) U-Boot its and FIT image are built and signed
+                        successfully
+                     2) The its file has a signature node in each image node,
+                        those from UBOOT_FIT_LOADABLES included
+                     3) Dumping the FIT image shows signatures for all the
+                        images
+                     4) SPL_MKIMAGE_SIGN_ARGS is passed to mkimage for each
+                        signed image
+        Product:     oe-core
+        Author:      Viswanath Kraleti <viswanath.kraleti@oss.qualcomm.com>
+        """
+        machine = self._get_machine_or_skip()
+        config = """
+# Enable creation and signing of the individual U-Boot fitImage images
+UBOOT_FITIMAGE_ENABLE = "1"
+SPL_SIGN_ENABLE = "1"
+SPL_SIGN_CONF = "0"
+SPL_SIGN_INDIVIDUAL = "1"
+SPL_SIGN_KEYNAME = "spl-loadables-oe-selftest"
+SPL_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
+UBOOT_ENTRYPOINT  = "0x80000000"
+UBOOT_LOADADDRESS = "0x80000000"
+UBOOT_DTB_LOADADDRESS = "0x82000000"
+SPL_MKIMAGE_DTCOPTS = "-I dts -O dtb -p 2000"
+SPL_MKIMAGE_SIGN_ARGS = "-c 'a smart U-Boot loadables comment'"
+UBOOT_EXTLINUX = "0"
+UBOOT_FIT_GENERATE_KEYS = "1"
+UBOOT_FIT_HASH_ALG = "sha256"
+""" + UBootFitImageTests.UBOOT_FIT_LOADABLES_CONFIG
+        config = FitImageTestCase._config_add_machine_settings(config, machine, keys=["UBOOT_MACHINE", "SPL_BINARY", "UBOOT_DTB_BINARY", "UBOOT_ARCH"])
+        config = self._require_machine_capability(config, machine, '_cap_spl_dtb')
+        self.write_config(config)
+        bb_vars = self._fit_get_bb_vars_loadables()
+        self._gen_uboot_loadable_dummy_images(bb_vars)
+        self._test_fitimage(bb_vars)
+        self._check_uboot_loadable_defaults(bb_vars)
+
     def test_sign_cascaded_uboot_fit_image(self):
         """
         Summary:     Check if U-Boot FIT image and Image Tree Source (its) are
