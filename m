Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58745CD37B6
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 08:14:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2670.1778660047848119943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 May 2026 01:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=I6QTpxmi;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9593f74c6b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D42IFc258937
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:14:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=n94ieNjmYazNOWvnkTOpuToKFaVt/fKW6IJzTW5P+yc=; b=I6QTpxmi7lzE
	a4hTQaB0YYj5/gbfptcEI0VBq5A29tvgeph4jUrIQdK4bFfk/dZDXljeU0VmkXw4
	usSOQnlEuquElBIc4JaiuNEwqmqKZM6CJusVjuxc3lDgVggEkYsClkhOVSrDpMY+
	ZGgg7KM5cUnLUfOQD1uCrTvb2EUo8+eCKBruumUXeOpNTgI6N6ScEWw0C4OMYyZH
	cGYIxV0GavVzRZikjXDiNE1Gzbzd0NGLQFOhiaIBqBeOU0sDIKiIEZkk0mOtpyGn
	hRpCZcYI/kMGPhKVZcD3F5UxNWvbg1/AUHCaNW81HFDn2D6v8Gm73wnn7DlX2pL/
	kyrubOUrKg==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ft78dbb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:14:06 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 13 May 2026 01:14:05 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 13 May 2026 01:14:05 -0700
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/2] nfs-utils: 2.8.7 -> 2.9.1
Date: Wed, 13 May 2026 01:14:04 -0700
Message-ID: <f75801335bf87cd55087a775c7cd10bc6651ec56.1778659781.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1778659781.git.liezhi.yang@windriver.com>
References: <cover.1778659781.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: 4DsS3N23XNHf8U-J_M1K2BTD2Q7h_3Ro
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA4MyBTYWx0ZWRfXwv3VZCTtPWNh
 5IWJOSwz9seTRXWHt6hoNWmR6Y6gfaX1PhJGsrESRBOG+BAiiwMvC77He3NFdCzN7AJjV8LvFya
 PX6YSVyckA2d4ZtkwDx+OM88orhAZ/tsCLcSioeFaMMIy0DZobPSaVlJRWGXAdtL2WV3AjpwE6/
 XryMlSjheZtHK4YV1eNFk54wAiaumADOV6yXfJ8+yq9IPKe5vJ+2KpDEt5I2uCepxT1jXHdL4U3
 JghT2J0/QVypnT9y8cR3SyUUKxffpwTWmBbia6PG3498DhSYy/ylAvw7Jwh0S4kVbbk722uj8rZ
 pyBsochAdrHBNDGR6OeTP2vkAPuD0RlC1VXGTHYRsEdfplhclxHDEbD8ze22OcK7ZFkTpqfWwMo
 x2Wo7KgRncHjthZ9ptCiGxLcXlwK/oLXSGbTvYS6+MuqLXmk3hDclcU/tJRKiRxY+E5viZ7f41O
 nuQNP6tmuXYYETukY5w==
X-Proofpoint-GUID: 4DsS3N23XNHf8U-J_M1K2BTD2Q7h_3Ro
X-Authority-Analysis: v=2.4 cv=G6As1dk5 c=1 sm=1 tr=0 ts=6a0432ce cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=VwQbUJbxAAAA:8 a=SEtKQCMJAAAA:8 a=t7CeM3EgAAAA:8
 a=hAEkhYAcI8YYLMJv7C8A:9 a=kyTSok1ft720jgMXX5-3:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130083
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 May 2026 08:14:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236942

From: Robert Yang <liezhi.yang@windriver.com>

* Add libnl to DEPENDS to fix:
  configure: error: Package requirements (libnl-3.0 >= 3.1) were not met:

* Add 0001-fh_key_file.c-Fix-build-error-for-musl.patch to fix build with musl:
  error: implicit declaration of function 'strerror'

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ..._key_file.c-Fix-build-error-for-musl.patch | 31 +++++++++++++++++++
 ...{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb} |  5 +--
 2 files changed, 34 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file.c-Fix-build-error-for-musl.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.8.7.bb => nfs-utils_2.9.1.bb} (96%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file.c-Fix-build-error-for-musl.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file.c-Fix-build-error-for-musl.patch
new file mode 100644
index 0000000000..6dc48353cb
--- /dev/null
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-fh_key_file.c-Fix-build-error-for-musl.patch
@@ -0,0 +1,31 @@
+From 98048fd9262b3e4e024248ebd07d5ff66175e4ec Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 7 May 2026 03:32:57 -0700
+Subject: [PATCH] fh_key_file.c: Fix build error with musl
+
+Fixed:
+error: implicit declaration of function 'strerror'
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-nfs/CD3EAA3F-F758-4CAF-A692-065CA82917AC@hammerspace.com/T/#t]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ support/nfs/fh_key_file.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/support/nfs/fh_key_file.c b/support/nfs/fh_key_file.c
+index 5f5eafc..89555ce 100644
+--- a/support/nfs/fh_key_file.c
++++ b/support/nfs/fh_key_file.c
+@@ -30,6 +30,8 @@
+ 
+ #include "nfslib.h"
+ 
++#include <string.h>
++
+ #define HASH_BLOCKSIZE  256
+ int hash_fh_key_file(const char *fh_key_file, uuid_t uuid)
+ {
+-- 
+2.49.0
+
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
similarity index 96%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
index 7693a88682..6f00bee0d8 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.8.7.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.9.1.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT & GPL-2.0-or-later & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=95f3a93a5c3c7888de623b46ea085a84"
 
 # util-linux for libblkid
-DEPENDS = "libcap libevent util-linux sqlite3 libtirpc libxml2"
+DEPENDS = "libcap libevent util-linux sqlite3 libtirpc libxml2 libnl"
 RDEPENDS:${PN} = "netbase ${PN}-client"
 RRECOMMENDS:${PN} = "kernel-module-nfsd"
 
@@ -23,9 +23,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://nfscommon \
            file://0004-Use-nogroup-for-nobody-group.patch \
            file://0005-find-OE-provided-Kerberos.patch \
+           file://0001-fh_key_file.c-Fix-build-error-for-musl.patch \
            "
 
-SRC_URI[sha256sum] = "59d0f1e17b18efaa60ea3ccf89a9cad3217f8d3b23c18d2fe34b25c8969d60ae"
+SRC_URI[sha256sum] = "302846343bf509f8f884c23bdbd0fe853b7f7cbb6572060a9082279d13b21a2c"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.49.0


