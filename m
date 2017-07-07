Return-Path: <swee.aun.khor@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5801077D74
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 10:54:27 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jul 2017 03:54:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,322,1496127600"; d="scan'208";a="876375116"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2017 03:54:27 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 20:43:48 -0700
Message-Id: <ab02b90355ba3e0ec315995ec88f7086457b29ff.1499394173.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1499394173.git.swee.aun.khor@intel.com>
References: <cover.1499394173.git.swee.aun.khor@intel.com>
Subject: [PATCH 2/7] siteinfo.bbclass: Support musl-x32
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Jul 2017 10:54:27 -0000

From: sweeaun <swee.aun.khor@intel.com>

Modified targetinfo and osinfo to support musl-x32.

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 meta/classes/siteinfo.bbclass | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index 90ea5ba..20b4704 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -63,6 +63,7 @@ def siteinfo_data(d):
         "linux-gnueabi": "common-linux common-glibc",
         "linux-gnuspe": "common-linux common-glibc",
         "linux-musl": "common-linux common-musl",
+        "linux-muslx32": "common-linux common-musl",
         "linux-musleabi": "common-linux common-musl",
         "linux-muslspe": "common-linux common-musl",
         "uclinux-uclibc": "common-uclibc",
@@ -99,6 +100,7 @@ def siteinfo_data(d):
         "x86_64-darwin9": "bit-64",
         "x86_64-linux": "bit-64",
         "x86_64-linux-musl": "x86_64-linux bit-64",
+        "x86_64-linux-muslx32": "bit-32 ix86-common x32-linux",
         "x86_64-elf": "bit-64",
         "x86_64-linux-gnu": "bit-64 x86_64-linux",
         "x86_64-linux-gnux32": "bit-32 ix86-common x32-linux",
-- 
2.7.4


