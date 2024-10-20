Return-Path: <quic_vpuar@quicinc.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D58CDD3C92A
	for <webhook@archiver.kernel.org>; Sun, 20 Oct 2024 10:05:29 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.web11.22248.1729418721863738448
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Oct 2024 03:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@quicinc.com header.s=qcppdkim1 header.b=UUeehr3G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: quicinc.com, ip: 205.220.180.131, mailfrom: quic_vpuar@quicinc.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49K9iF03019783;
	Sun, 20 Oct 2024 10:05:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=a4JINT9nzrY2TKPUpxbBrN
	6uCpeEJn9W8Vm/E0MN3QY=; b=UUeehr3GTn7ZdST/ob58ZG72dPeZgmxalmy5fT
	LTC7toKLNaSWSn+k0zEn3Du481Bni4B2VOhm3t2ZHj6za7ItI+mHa3VFbW0FP8YU
	1EMMQb2jm72w2mhwZV6Y/VR7CyfQjCSIA8eb7NLWxAtfC9pKxMOzz8pT245giOsA
	8luwKRAn9ivHom3P4ZwE/vloddD+swnE6ol3Cms7h7kMV8DE0DG4XAIC98LedlHQ
	2HFbC/fxxpxerUGN1N7JpcE4GHrRn+O3B+MukngKuMY+6XkNwq6uK/69Uiszjev2
	pkpmd29VU+/fv5eGzq+IFJ7qNmxN5w2NqhRJNQVu7a32ReYQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6s59xbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Oct 2024 10:05:20 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49KA5J3n030843
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Oct 2024 10:05:19 GMT
Received: from hyd-e160-a01-2-02.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 20 Oct 2024 03:05:17 -0700
From: Vivek Puar <quic_vpuar@quicinc.com>
To: <openembedded-core@lists.openembedded.org>
CC: Vivek Puar <quic_vpuar@quicinc.com>,
        Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: [PATCH] linux-firmware: upgrade 20240909 -> 20241017
Date: Sun, 20 Oct 2024 15:35:00 +0530
Message-ID: <20241020100500.3217521-1-quic_vpuar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jyjck4pfNnH3XaGbwIOi1563fis3Bfca
X-Proofpoint-GUID: jyjck4pfNnH3XaGbwIOi1563fis3Bfca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 bulkscore=0
 clxscore=1011 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410200066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Oct 2024 10:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206089

License-Update: additional firmwares

The commit [1] fixes the error when people will use
the distribution tarball during compilation, so
adding the commit as a patch.

Installation of firmware and deduplication are
now separate targets, so we can run install. Target
install no more runs de-duplication. De-duplication
is a separate target. Hence, this recipe can rely
on install target.

If de-duplication is desired following can be done
in a bbappend file:

PACKAGECONFIG = "deduplicate"

[1] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=2f0464118f404b8adc4e245a4903c9a1385e00b0

Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...skip-some-validation-if-git-ls-files.patch | 66 +++++++++++++++++++
 ...20240909.bb => linux-firmware_20241017.bb} |  7 +-
 2 files changed, 70 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/0001-check_whence.py-skip-some-validation-if-git-ls-files.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20240909.bb => linux-firmware_20241017.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-check_whence.py-skip-some-validation-if-git-ls-files.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-check_whence.py-skip-some-validation-if-git-ls-files.patch
new file mode 100644
index 0000000000..efcf0cd106
--- /dev/null
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-check_whence.py-skip-some-validation-if-git-ls-files.patch
@@ -0,0 +1,66 @@
+From 2f0464118f404b8adc4e245a4903c9a1385e00b0 Mon Sep 17 00:00:00 2001
+From: Emil Velikov <emil.l.velikov@gmail.com>
+Date: Fri, 18 Oct 2024 13:58:01 +0100
+Subject: [PATCH] check_whence.py: skip some validation if git ls-files fails
+
+Recently we started running check_whence.py to validate WHENCE before
+installing files with copy-firmware.sh. It did not consider the fact
+that people may be using the distribution tarball, which lacks the
+relevant git metadata.
+
+Throw a warning and skip the relevant validation.
+
+Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/commit/?id=2f0464118f404b8adc4e245a4903c9a1385e00b0]
+
+Signed-off-by: Vivek Puar <quic_vpuar@quicinc.com>
+---
+ check_whence.py | 15 +++++++++------
+ 1 file changed, 9 insertions(+), 6 deletions(-)
+
+diff --git a/check_whence.py b/check_whence.py
+index c3d4a2e3..1fece4f4 100755
+--- a/check_whence.py
++++ b/check_whence.py
+@@ -60,9 +60,12 @@ def list_links_list():
+ 
+ 
+ def list_git():
+-    with os.popen("git ls-files") as git_files:
+-        for line in git_files:
+-            yield line.rstrip("\n")
++    git_files = os.popen("git ls-files")
++    for line in git_files:
++        yield line.rstrip("\n")
++
++    if git_files.close():
++        sys.stderr.write("W: git file listing failed, skipping some validation\n")
+ 
+ 
+ def main():
+@@ -135,7 +138,7 @@ def main():
+             )
+             ret = 1
+ 
+-    for name in sorted(list(known_files - git_files)):
++    for name in sorted(list(known_files - git_files) if len(git_files) else list()):
+         sys.stderr.write("E: %s listed in WHENCE does not exist\n" % name)
+         ret = 1
+ 
+@@ -151,10 +154,10 @@ def main():
+                 break
+             valid_targets.add(dirname)
+ 
+-    for link, target in sorted(links_list):
++    for link, target in sorted(links_list if len(git_files) else list()):
+         if target not in valid_targets:
+             sys.stderr.write(
+-                "E: target %s of link %s in WHENCE" " does not exist\n" % (target, link)
++                "E: target %s of link %s in WHENCE does not exist\n" % (target, link)
+             )
+             ret = 1
+ 
+-- 
+2.34.1
+
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
index 4bcda67c8f..f0e6db9a20 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240909.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
@@ -158,7 +158,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "6ae5ffd807c84809977286ad0b37acdb"
+WHENCE_CHKSUM  = "f82849fb6325a8a14e21a4feacc5ebb0" 
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -240,6 +240,7 @@ PE = "1"
 
 SRC_URI = "\
   ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
+  file://0001-check_whence.py-skip-some-validation-if-git-ls-files.patch \
 "
 
 BBCLASSEXTEND = "devupstream:target"
@@ -247,7 +248,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "943fbd19883cf8eadf89e0b22422549db056557b1ecd30a56400615971369671"
+SRC_URI[sha256sum] = "a26c38ef5a83272f2b98ce8bf8ca1865a852a3deea49ce5a8dd804b914351273" 
 
 inherit allarch
 
@@ -256,7 +257,7 @@ CLEANBROKEN = "1"
 # Use PACKAGECONFIG_CONFARGS to set the Makefile target
 PACKAGECONFIG ??= ""
 # Enabling dedup will turn duplicate firmware files into links
-PACKAGECONFIG[deduplicate] = "install,install-nodedup,rdfind-native"
+PACKAGECONFIG[deduplicate] = "install dedup,install,rdfind-native" 
 
 do_compile() {
 	:
-- 
2.34.1


