Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web08.5579.1614217729205255132
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 17:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: randy.macleod@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id 11P1mbCQ006948
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Feb 2021 17:48:44 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Wed, 24 Feb 2021 17:48:32 -0800
Received: from vme.wrs.com (172.25.44.2) by ala-exchng01.corp.ad.wrs.com
 (147.11.82.252) with Microsoft SMTP Server id 15.1.2106.2 via Frontend
 Transport; Wed, 24 Feb 2021 17:48:32 -0800
From: "Randy MacLeod" <randy.macleod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 7/7] maintainers: Add myself as maintainer for rust pkgs
Date: Wed, 24 Feb 2021 20:48:23 -0500
Message-ID: <20210225014823.397741-8-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210225014823.397741-1-Randy.MacLeod@windriver.com>
References: <16668FEB024AAA5B.31532@lists.openembedded.org>
 <20210225014823.397741-1-Randy.MacLeod@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

I'm willing to do the rust package maintenance but
if anyone else wants to sign up, that would be welcome.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/conf/distro/include/maintainers.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 3d8e3d5de0..bb76d5412a 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -89,6 +89,7 @@ RECIPE_MAINTAINER_pn-busybox-inittab = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-bzip2 = "Denys Dmytriyenko <denis@denix.org>"
 RECIPE_MAINTAINER_pn-ca-certificates = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-cairo = "Anuj Mittal <anuj.mittal@intel.com>"
+RECIPE_MAINTAINER_pn-cargo = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER_pn-cantarell-fonts = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ccache = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-cdrtools-native = "Yi Zhao <yi.zhao@windriver.com>"
@@ -382,6 +383,7 @@ RECIPE_MAINTAINER_pn-libsndfile1 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER_pn-libsolv = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libsoup-2.4 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libssp-nonshared = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER_pn-libstd-rs = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER_pn-libtasn1 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-libtest-needs-perl = "Tim Orling <timothy.t.orling@linux.intel.com>"
 RECIPE_MAINTAINER_pn-libtheora = "Alexander Kanavin <alex.kanavin@gmail.com>"
@@ -649,6 +651,11 @@ RECIPE_MAINTAINER_pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-rt-tests = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-ruby = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-run-postinsts = "Ross Burton <ross.burton@arm.com>"
+RECIPE_MAINTAINER_pn-rustc = "Randy MacLeod <Randy.MacLeod@windriver.com>"
+RECIPE_MAINTAINER_pn-rustfmt = "Randy MacLeod <Randy.MacLeod@windriver.com>"
+RECIPE_MAINTAINER_pn-rust-cross = "Randy MacLeod <Randy.MacLeod@windriver.com>"
+RECIPE_MAINTAINER_pn-rust-hello-world = "Randy MacLeod <Randy.MacLeod@windriver.com>"
+RECIPE_MAINTAINER_pn-rust-llvm = "Randy MacLeod <Randy.MacLeod@windriver.com>"
 RECIPE_MAINTAINER_pn-rxvt-unicode = "Armin Kuster <akuster808@gmail.com>"
 RECIPE_MAINTAINER_pn-sato-screenshot = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER_pn-sbc = "Unassigned <unassigned@yoctoproject.org>"
-- 
2.27.0

