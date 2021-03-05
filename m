Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: anhZCx/r5ZwdpGe0QOerdjvv56ETsBs1Q1cIkE6QjuuQayIxspfWGT4RmT+WnEduZLR55ZTYuS
 s+3aodEf8VUg==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671061"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671061"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:33 -0800
IronPort-SDR: GODcTifRJPLcshdtejbqalBtSFqHACIOYvN0u1RNKhchDA1l5ZlTgifAIMttfoi/wbn8t+y70Y
 3e5GLBX6jZFg==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408128942"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:32 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 26/52] libevdev: Update patch status to backport
Date: Fri,  5 Mar 2021 12:21:02 +0800
Message-Id: <523802ff2ff69471eba311449cafd622c78e47da.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The patch was submitted and merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 871bce0703ca9d14e5c44f6ee0b66fcb13cfb630)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/libevdev/libevdev/determinism.patch | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/libevdev/libevdev/determinism.patch b/meta/recipes-support/libevdev/libevdev/determinism.patch
index f6b7fc82d3..71cbd876eb 100644
--- a/meta/recipes-support/libevdev/libevdev/determinism.patch
+++ b/meta/recipes-support/libevdev/libevdev/determinism.patch
@@ -9,7 +9,8 @@ Sort to remove this inconsistency.
 RP 2020/2/7
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-Upstream-Status: Pending
+Submitted: https://lists.freedesktop.org/archives/input-tools/2021-February/001560.html
+Upstream-Status: Backport [https://gitlab.freedesktop.org/libevdev/libevdev/-/commit/8d70f449892c6f7659e07bb0f06b8347677bb7d8]
 
 ---
  libevdev/make-event-names.py | 6 +++---
-- 
2.29.2

