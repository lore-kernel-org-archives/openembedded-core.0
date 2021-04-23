Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.5858.1619156466343861343
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 22:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13N5f50s027369
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 22:41:05 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 22 Apr 2021 22:41:04 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 22 Apr 2021 22:41:04 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] rpm: Upgrade to 4.16.1.3
Date: Fri, 23 Apr 2021 13:41:03 +0800
Message-ID: <20210423054103.37908-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Fixes some security vulnerabilities such as CVE-2021-3421 and
CVE-2021-20271.

Rebase 0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
to avoid fuzz warnings.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...ot-hardcode-lib-rpm-as-the-installation-path-for.patch | 8 ++++----
 .../rpm/{rpm_4.16.1.2.bb => rpm_4.16.1.3.bb}              | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/rpm/{rpm_4.16.1.2.bb => rpm_4.16.1.3.bb} (99%)

diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index 38d755205c..d8fcc16729 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -1,4 +1,4 @@
-From 9bbe3f8564705aafcdcc5f2f033f9241a97f47c6 Mon Sep 17 00:00:00 2001
+From 7b2dd83d8fcd06af8e583b53da79ed0033793d46 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 09:43:30 +0200
 Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
@@ -14,7 +14,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  3 files changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index 6c78568e4..76b1d40e4 100644
+index fe35a90fa..b2faec6f3 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -966,7 +966,7 @@ else
@@ -40,7 +40,7 @@ index 35c8cf9df..9d8b2825c 100644
  %_infodir		%{_datadir}/info
  %_mandir		%{_datadir}/man
 diff --git a/rpm.am b/rpm.am
-index cd40a16be..e6941e09f 100644
+index 8e1dc2184..3d889ec86 100644
 --- a/rpm.am
 +++ b/rpm.am
 @@ -1,10 +1,10 @@
@@ -55,4 +55,4 @@ index cd40a16be..e6941e09f 100644
 +rpmconfigdir = $(libdir)/rpm
  
  # Libtool version (current-revision-age) for all our libraries
- rpm_version_info = 10:2:1
+ rpm_version_info = 10:3:1
diff --git a/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
similarity index 99%
rename from meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
rename to meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
index d369c706a2..7c03b41fc8 100644
--- a/meta/recipes-devtools/rpm/rpm_4.16.1.2.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.16.1.3.bb
@@ -43,7 +43,7 @@ SRC_URI = "git://github.com/rpm-software-management/rpm;branch=rpm-4.16.x \
            "
 
 PE = "1"
-SRCREV = "278883a704ea36c97974d0f2d65d41abe78b0e2a"
+SRCREV = "3659b8a04f5b8bacf6535e0124e7fe23f15286bd"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.1

