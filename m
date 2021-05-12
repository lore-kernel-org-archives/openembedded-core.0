Received: from mga17.intel.com (mga17.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.4081.1620808568509855065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 01:36:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: R0rFJkE5l7VmxHJPJDifQJBG/FRO7w4m1pdDeu2dHRhzyim2e80PRCt9GAU6Rlcq0NWc8CYm9R
 G60OKa7TdEvQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="179917840"
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="179917840"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:23 -0700
IronPort-SDR: 8SKl5IyzlqCgmVQ7cq0txdRr20HOoIKUmnva7bmn2KpIysjUYmNLln1EGbJoQpFMG9ilSYPli7
 ATB8tj92Hd1w==
X-IronPort-AV: E=Sophos;i="5.82,293,1613462400"; 
   d="scan'208";a="430645849"
Received: from tmustofa-mobl1.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.35.122])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2021 01:36:22 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 15/15] puzzles: Upstream changed to main branch for development
Date: Wed, 12 May 2021 16:35:47 +0800
Message-Id: <1cf4d3f44191c3fc2cb4d056b38f98fae4e8b8e1.1620808329.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1620808329.git.anuj.mittal@intel.com>
References: <cover.1620808329.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 943402b25212408a4ddcfa8a146b645509e138dd)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-sato/puzzles/puzzles_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/puzzles/puzzles_git.bb b/meta/recipes-sato/puzzles/puzzles_git.bb
index 16a08585cc..a1788cf684 100644
--- a/meta/recipes-sato/puzzles/puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/puzzles_git.bb
@@ -9,7 +9,7 @@ DEPENDS = "libxt"
 # The libxt requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "git://git.tartarus.org/simon/puzzles.git \
+SRC_URI = "git://git.tartarus.org/simon/puzzles.git;branch=main \
            file://fix-compiling-failure-with-option-g-O.patch \
            file://0001-palisade-Fix-warnings-with-clang-on-arm.patch \
            file://0001-Use-Wno-error-format-overflow-if-the-compiler-suppor.patch \
-- 
2.31.1

