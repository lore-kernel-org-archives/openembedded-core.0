Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.917.1619398513291207353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Sa/fR389FRFAYcVmk+gnxgk4RLcEp6OCof0hBZmGY7Bf8yq5hMGeTSDdb9g4cxIGh93g3tmE11
 NlOMDo/qLYJg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="257568896"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="257568896"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:12 -0700
IronPort-SDR: EShoEuwsjD/+to+3Nh7N5P83hfN9KT1pHFWokQCyo2WABhIxa2wg5xKu0/b0stJvQXBEIIS8u1
 oqpBkV6NoFag==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067580"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:11 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 56/64] rpm: Upgrade to 4.16.1.3
Date: Mon, 26 Apr 2021 08:53:27 +0800
Message-Id: <532698a83261e3ce53f03d5b063a6978a7592bd1.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mingli Yu <mingli.yu@windriver.com>

Fixes some security vulnerabilities such as CVE-2021-3421 and
CVE-2021-20271.

Rebase 0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
to avoid fuzz warnings.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
(cherry picked from commit 25fe972c4aa6ea640b1cdcd1624108f70e539586)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
2.30.2

