Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AD04C46CA0
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 06:44:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.93773.1701758653105424329
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Dec 2023 22:44:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=o6awLq4t;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0703deebc2=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3B56LceH027775
	for <openembedded-core@lists.openembedded.org>; Tue, 5 Dec 2023 06:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=q35YHR1b0bVHwyQcM4GDxn80+e+i1GNw9Yt8VjZr1iI=; b=
	o6awLq4tsRPNxmiY0QsoDDIxaOuaKDvNRq10KabSW5xHmbuKK+n4s7z7NK2RLxKK
	LMyzHnaJ1H8KW0JtsaKsaBgV1Nj7RXtZKV7Xf4B7q1aZ0CSdEfJtOLTyLxhkYd9P
	NI5Xx1t69Lxi4l9AKvKU8jaY5LwHB55O8TuOUeQ2ZDocnvPhFXd8JgrSwzSnH3DW
	1/v0eIic12aFIiESh00OkrAHJBa8m0/IYl1Jh5SUPuiegzBbXgzaxR4iXr0dLi5/
	ujHijZ7qxmuAXTYjygKW82Ail0oWqkJw2l5UW5OeCvN38Kf1t6LOw4A4n11DQkBw
	RXaKtQ1fFjxlRqpAcX+fIw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3usss487cg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:44:12 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 22:44:14 -0800
Received: from ala-lpggp3.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 4 Dec 2023 22:44:14 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 2/2] nfs-utils: Upgrade 2.6.3 -> 2.6.4
Date: Mon, 4 Dec 2023 22:44:10 -0800
Message-ID: <934ad5f4e633993781ba459bfda8183d95749e00.1701758555.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1701758555.git.liezhi.yang@windriver.com>
References: <cover.1701758555.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qyNuH-EffKb5mEOtJfqqcFp3LjBGWLuD
X-Proofpoint-GUID: qyNuH-EffKb5mEOtJfqqcFp3LjBGWLuD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311060001 definitions=main-2312050053
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Dec 2023 06:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191800

From: Robert Yang <liezhi.yang@windriver.com>

Remove backported patch 0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...event-and-libsqlite3-checked-when-nf.patch | 80 -------------------
 ...{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} |  3 +-
 2 files changed, 1 insertion(+), 82 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_2.6.3.bb => nfs-utils_2.6.4.bb} (97%)

diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch b/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
deleted file mode 100644
index 5afc714f190..00000000000
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils/0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch
+++ /dev/null
@@ -1,80 +0,0 @@
-From b62a3fe424026b73ec6b1934483b16863c7dff23 Mon Sep 17 00:00:00 2001
-From: Wiktor Jaskulski <wjaskulski@adva.com>
-Date: Thu, 11 May 2023 15:28:23 -0400
-Subject: [PATCH] configure.ac: libevent and libsqlite3 checked when nfsv4 is
- disabled
-
-Upstream-Status: Backport
-(http://git.linux-nfs.org/?p=steved/nfs-utils.git;a=commit;h=bc4a5deef9f820c55fdac3c0070364c17cd91cca)
-
-Signed-off-by: Steve Dickson <steved@redhat.com>
-Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
----
- configure.ac | 38 +++++++++++++++-----------------------
- 1 file changed, 15 insertions(+), 23 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4ade528d..519cacbf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -335,42 +335,34 @@ AC_CHECK_HEADER(rpc/rpc.h, ,
-                 AC_MSG_ERROR([Header file rpc/rpc.h not found - maybe try building with --enable-tirpc]))
- CPPFLAGS="${nfsutils_save_CPPFLAGS}"
- 
-+dnl check for libevent libraries and headers
-+AC_LIBEVENT
-+
-+dnl Check for sqlite3
-+AC_SQLITE3_VERS
-+
-+case $libsqlite3_cv_is_recent in
-+yes) ;;
-+unknown)
-+   dnl do not fail when cross-compiling
-+   AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
-+*)
-+   AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
-+esac
-+
- if test "$enable_nfsv4" = yes; then
--  dnl check for libevent libraries and headers
--  AC_LIBEVENT
- 
-   dnl check for the keyutils libraries and headers
-   AC_KEYUTILS
- 
--  dnl Check for sqlite3
--  AC_SQLITE3_VERS
--
-   if test "$enable_nfsdcld" = "yes"; then
- 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
- 		AC_MSG_ERROR([Cannot find header needed for nfsdcld]))
--
--    case $libsqlite3_cv_is_recent in
--    yes) ;;
--    unknown)
--      dnl do not fail when cross-compiling
--      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
--    *)
--      AC_MSG_ERROR([nfsdcld requires sqlite-devel]) ;;
--    esac
-   fi
- 
-   if test "$enable_nfsdcltrack" = "yes"; then
- 	AC_CHECK_HEADERS([libgen.h sys/inotify.h], ,
- 		AC_MSG_ERROR([Cannot find header needed for nfsdcltrack]))
--
--    case $libsqlite3_cv_is_recent in
--    yes) ;;
--    unknown)
--      dnl do not fail when cross-compiling
--      AC_MSG_WARN([assuming sqlite is at least v3.3]) ;;
--    *)
--      AC_MSG_ERROR([nfsdcltrack requires sqlite-devel]) ;;
--    esac
-   fi
- 
- else
--- 
-2.41.0
-
diff --git a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
similarity index 97%
rename from meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
rename to meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
index 35cf6af6d46..31290f6d44c 100644
--- a/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.3.bb
+++ b/meta/recipes-connectivity/nfs-utils/nfs-utils_2.6.4.bb
@@ -30,11 +30,10 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/nfs-utils/${PV}/nfs-utils-${PV}.tar.x
            file://bugfix-adjust-statd-service-name.patch \
            file://0001-Makefile.am-fix-undefined-function-for-libnsm.a.patch \
            file://clang-warnings.patch \
-           file://0001-configure.ac-libevent-and-libsqlite3-checked-when-nf.patch \
 	   file://0001-locktest-Makefile.am-Do-not-use-build-flags.patch \
 	   file://0001-tools-locktest-Use-intmax_t-to-print-off_t.patch \
            "
-SRC_URI[sha256sum] = "38d89e853a71d3c560ff026af3d969d75e24f782ff68324e76261fe0344459e1"
+SRC_URI[sha256sum] = "01b3b0fb9c7d0bbabf5114c736542030748c788ec2fd9734744201e9b0a1119d"
 
 # Only kernel-module-nfsd is required here (but can be built-in)  - the nfsd module will
 # pull in the remainder of the dependencies.
-- 
2.42.0


