Return-Path: <swee.aun.khor@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2CA5B771F5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 07:07:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 00:07:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,315,1496127600"; d="scan'208";a="1148285522"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 06 Jul 2017 00:07:17 -0700
From: swee.aun.khor@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Jul 2017 16:56:33 -0700
Message-Id: <43b59e17ab94869b9652c1bf6fd4a1db4dbb634c.1499127835.git.swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1499127835.git.swee.aun.khor@intel.com>
References: <cover.1499127835.git.swee.aun.khor@intel.com>
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
X-List-Received-Date: Thu, 06 Jul 2017 07:07:17 -0000

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


