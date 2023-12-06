Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 731C0C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 08:48:46 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.27316.1701852519973727159
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Dec 2023 00:48:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=jN/lWK8m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0704b166eb=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B65t2Tg014468;
	Wed, 6 Dec 2023 00:48:38 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=wOsh+AX4ZtArrZ+S4kkF0TzohVOTuM8qLifh1m+9D34=; b=
	jN/lWK8mPPe92UES9OxQnTMPmdCZwjBp+7FnYd8RUUhD8P8jHfIR46p2dyQV45OD
	ooPMHd14yB5Qprr456S6jzGy6BU7Wq9M8Zh4CbpH6qvfDFtY7aN3IFqe2EV0EnyL
	SjHZmCo85KDnNsQwx2ZETCtKfnDR5tXcp0HtJv9PzfU3X10lVDHpGUbMHNyYns72
	ahx9AVordEYPuQ2g1AL02TbetQ210AgqTUNbR4bCrbappUWhbAumcxNzV88mv5et
	b9BE4MKqHIZ2CnQeLNiKM6b0uJ6jaMf3H+hJgx6+Z5qzbbZSJSihvHW8kRrQJNjx
	V6i/H89f9dZ9AR49wHF83A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3utd2rrb7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 06 Dec 2023 00:48:37 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Dec 2023 00:48:40 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Wed, 6 Dec 2023 00:48:40 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <alex.kanavin@gmail.com>
Subject: [PATCH 2/2] man-db: 2.11.2 -> 2.12.0
Date: Wed, 6 Dec 2023 00:48:36 -0800
Message-ID: <20231206084836.413144-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231206084836.413144-1-hongxu.jia@windriver.com>
References: <20231206084836.413144-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 00zW9p6B0X0HKuhbMeoL4O8ommmxkdHy
X-Proofpoint-ORIG-GUID: 00zW9p6B0X0HKuhbMeoL4O8ommmxkdHy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 clxscore=1011
 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxlogscore=595
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312060070
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Dec 2023 08:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191872

From: Hongxu Jia <hongxu.jia@eng.windriver.com>

Drop obsolete autoconf-2.73.patch

Signed-off-by: Hongxu Jia <hongxu.jia@eng.windriver.com>
---
 .../man-db/files/autoconf-2.73.patch          | 24 -------------------
 .../{man-db_2.11.2.bb => man-db_2.12.0.bb}    |  4 ++--
 2 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 meta/recipes-extended/man-db/files/autoconf-2.73.patch
 rename meta/recipes-extended/man-db/{man-db_2.11.2.bb => man-db_2.12.0.bb} (95%)

diff --git a/meta/recipes-extended/man-db/files/autoconf-2.73.patch b/meta/recipes-extended/man-db/files/autoconf-2.73.patch
deleted file mode 100644
index 6c997a68e6..0000000000
--- a/meta/recipes-extended/man-db/files/autoconf-2.73.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-The gnulib largefile macro needs updating to work with autoconf 2.73. Rather
-than the full code:
-
-https://git.savannah.gnu.org/cgit/gnulib.git/commit/m4/largefile.m4?id=f91f633858cf132e50924224c50d6264a92caabb
-
-Just tweak the exiting code to work with 2.73. The next man-db upgrade should
-update to new gnulib
-
-Upstream-Status: Inappropriate
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: findutils-4.9.0/gl/m4/largefile.m4
-===================================================================
---- findutils-4.9.0.orig/gl/m4/largefile.m4
-+++ findutils-4.9.0/gl/m4/largefile.m4
-@@ -26,7 +26,7 @@ AC_DEFUN([gl_SET_LARGEFILE_SOURCE],
- # with _TIME_BITS.  Also, work around a problem in autoconf <= 2.69:
- # AC_SYS_LARGEFILE does not configure for large inodes on Mac OS X 10.5,
- # or configures them incorrectly in some cases.
--m4_version_prereq([2.70], [], [
-+m4_version_prereq([2.73], [], [
- 
- # _AC_SYS_LARGEFILE_TEST_INCLUDES
- # -------------------------------
diff --git a/meta/recipes-extended/man-db/man-db_2.11.2.bb b/meta/recipes-extended/man-db/man-db_2.12.0.bb
similarity index 95%
rename from meta/recipes-extended/man-db/man-db_2.11.2.bb
rename to meta/recipes-extended/man-db/man-db_2.12.0.bb
index 8941ffc013..19dbb41d16 100644
--- a/meta/recipes-extended/man-db/man-db_2.11.2.bb
+++ b/meta/recipes-extended/man-db/man-db_2.12.0.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://0001-man-Move-local-variable-declaration-to-function-scop.patch \
-           file://autoconf-2.73.patch"
-SRC_URI[sha256sum] = "cffa1ee4e974be78646c46508e6dd2f37e7c589aaab2938cc1064f058fef9f8d"
+          "
+SRC_URI[sha256sum] = "415a6284a22764ad22ff0f66710d853be7790dd451cd71436e3d25c74d996a95"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS:${PN} += "base-passwd"
-- 
2.42.0


