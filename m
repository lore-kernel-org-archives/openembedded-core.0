Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7529DC77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 04:00:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12743.1682568006758438801
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Apr 2023 21:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=Zfh5MhFb;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3481d59eab=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33R406VD005628
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 04:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=1czOWfze4USDDcrGDwfcPNadkpcqsDCsdoPmaMYqTq4=;
 b=Zfh5MhFbd+vOQVrsnVNWykbBvMxFZOmOtAZ+WbUrX+3koZPJPpQg7pdjRqYu0Eh/Kx6F
 RIX/JtUD7jqnpUMriBSrjyJfJ6WXkEZjYRGkJ1v8wRJ9ut7gPlDdgY0owMYS+lmgNCs5
 H6oF3YyCxQxTLy7Zy39oS3NnqEt0zaLd58Ir6SrnuAtjX07tgdvm3rZ6esLUTeiRxYDs
 kw7s8LwbAuSrVwZXz9DAI99ii1jiwwmGhMoXZr07ZCpYhxE8GOWIX8Zi6lxgJdtYvDmY
 atAwSH6PK1kgTCDJRbX4lb7y+YI50Fp/Ed5nVA8brJvurYegoKGakMUAn1c49z7cvmeT qg== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3q46jbd5sv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 04:00:05 +0000
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 26 Apr 2023 21:00:03 -0700
From: Yogita Urade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <hari.gpillai@windriver.com>
Subject: [oe-core][kirkstone][PATCH 1/1] libxpm: upgrade 3.5.13 -> 3.5.15
Date: Thu, 27 Apr 2023 03:59:45 +0000
Message-ID: <20230427035945.3823758-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: fmSacYH1iw8G48MtcvlqUhSwwViOAwaa
X-Proofpoint-ORIG-GUID: fmSacYH1iw8G48MtcvlqUhSwwViOAwaa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-27_01,2023-04-26_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304270034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Apr 2023 04:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180464

Upgrade libxpm 3.5.13 to 3.5.15

License-update: additional copyright holders
   f0857c0 man pages: Correct Copyright/License notices
The above commit is introduced while upgrading the libxpm 3.5.15.
which is mentioned in below changelog.
Due to this commit LIC_FILES_CHKSUM is changed.

Disable reading compressed files as that requires compress/uncompress executables.
Following the approach in oe-core/master:
   7de4084634 libxpm: upgrade 3.5.14 -> 3.5.15

Changelog:

-------------
-------------
ddd8339 libXpm 3.5.15
8178eb0 Use gzip -d instead of gunzip
c5ab17b Prevent a double free in the error code path
515294b Fix CVE-2022-4883: compression commands depend on $PATH
f80fa6a Fix CVE-2022-44617: Runaway loop with width of 0 and enormous height
f7fbbb9 test: add test cases for CVE-2022-44617 (zero-width w/enormous height)
a3a7c6d Fix CVE-2022-46285: Infinite loop on unclosed comments
f7a167a test: add test case for CVE-2022-46285 (unclosed comments)
0ff2c6a cxpm: getc/ungetc wrappers should not adjust position when c == EOF
501494c test: Add unit tests using glib framework
4841039 configure: add --disable-open-zfile instead of requiring -DNO_ZPIPE
aef0c8d man pages: Apply standard man page style/formatting
5d55a0b man pages: Replace "See Also" entries with more useful ones
392cb8f man pages: Fix typos and other minor editing
08bc174 libXpm 3.5.14
f0857c0 man pages: Correct Copyright/License notices
deb81a9 man pages: Fix typos
2d5fa4c man pages: Add missing word 'function' where needed
2b7357e man pages: Make function synopses more consistent with other pages
fb8590c man pages: Fix shadow man pages
bfaebfd man pages: Make file names consistent with their displayed names
7a138a5 gitlab CI: add a basic build test
3433f43 man: strip trailing whitespace
9612454 Fix spelling/wording issues
fa16fbd Build xz tarballs instead of bzip2
83e5427 update man pages
e48e649 add man pages based on doc/xpm.PS

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../xorg-lib/{libxpm_3.5.13.bb => libxpm_3.5.15.bb}       | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.13.bb => libxpm_3.5.15.bb} (67%)

diff --git a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb b/meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
similarity index 67%
rename from meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
rename to meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
index 4f0a5d7ba0..22e322a9eb 100644
--- a/meta/recipes-graphics/xorg-lib/libxpm_3.5.13.bb
+++ b/meta/recipes-graphics/xorg-lib/libxpm_3.5.15.bb
@@ -11,17 +11,19 @@ an extension of the monochrome XBM bitmap specificied in the X \
 protocol."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=51f4270b012ecd4ab1a164f5f4ed6cf7"
+LIC_FILES_CHKSUM = "file://COPYING;md5=903942ebc9d807dfb68540f40bae5aff"
 DEPENDS += "libxext libsm libxt gettext-native"
 PE = "1"
 
 XORG_PN = "libXpm"
+XORG_EXT = "tar.xz"
+EXTRA_OECONF += "--disable-open-zfile"
 
 PACKAGES =+ "sxpm cxpm"
 FILES:cxpm = "${bindir}/cxpm"
 FILES:sxpm = "${bindir}/sxpm"
 
-SRC_URI[md5sum] = "6f0ecf8d103d528cfc803aa475137afa"
-SRC_URI[sha256sum] = "9cd1da57588b6cb71450eff2273ef6b657537a9ac4d02d0014228845b935ac25"
+SRC_URI[md5sum] = "b3c58c94e284fd6940d3615e660a0007"
+SRC_URI[sha256sum] = "60bb906c5c317a6db863e39b69c4a83fdbd2ae2154fcf47640f8fefc9fdfd1c1"
 
 BBCLASSEXTEND = "native"
-- 
2.40.0


