Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by mx.groups.io with SMTP id smtpd.web10.3755.1604555570970083275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 21:52:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.43, mailfrom: rebecca.swee.fun.chang@intel.com)
IronPort-SDR: j3+dwy8nYUXlS8be4MmqgCb+nlo8IN1XYZiXZqqc4JPz7wB9W4xM9lkHZZOhiTqTM2A8tZWIHC
 0bLA0853h9Kw==
X-IronPort-AV: E=McAfee;i="6000,8403,9795"; a="254039303"
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; 
   d="scan'208";a="254039303"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2020 21:52:48 -0800
IronPort-SDR: Pl+B2NT/Li//kdjgm0Jl17+eJ4ihS8cI3zm/EX8YJ3k6kaS6VEl9mXZMg526cOGtK35RlwejMu
 eAlDChRPT2FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,452,1596524400"; 
   d="scan'208";a="358316316"
Received: from unknown (HELO pg-gsrd-build.png.intel.com) ([10.226.216.131])
  by fmsmga002.fm.intel.com with ESMTP; 04 Nov 2020 21:52:47 -0800
From: "Rebecca Chang Swee Fun" <rebecca.swee.fun.chang@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 2/4] numactl: Remove COMPATIBLE_HOST restrictions
Date: Thu,  5 Nov 2020 13:39:52 +0000
Message-Id: <20201105133954.144390-2-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201105133954.144390-1-rebecca.swee.fun.chang@intel.com>
References: <20201105133954.144390-1-rebecca.swee.fun.chang@intel.com>

From: Randy Witt <randy.e.witt@intel.com>

Since there may be recipes that depend on libnuma, even though the
hardware doesn't support numa, remove the COMPATIBLE_HOST restrictions.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 1d5574645076bc4cbc8b6e7b7a0606a5c9a9f9ae)
Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 meta/recipes-support/numactl/numactl_git.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-support/numactl/numactl_git.bb b/meta/recipes-support/numactl/numactl_git.bb
index 20b7fed862..e45afe9ee8 100644
--- a/meta/recipes-support/numactl/numactl_git.bb
+++ b/meta/recipes-support/numactl/numactl_git.bb
@@ -23,9 +23,6 @@ SRC_URI = "git://github.com/numactl/numactl \
 
 S = "${WORKDIR}/git"
 
-# ARM does not currently support NUMA
-COMPATIBLE_HOST = "^((?!arm).*)$"
-
 do_install() {
     oe_runmake DESTDIR=${D} prefix=${D}/usr install
     #remove the empty man2 directory
-- 
2.17.1

