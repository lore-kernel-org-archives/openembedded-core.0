Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SAICp-0005rG-OM
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 10:51:47 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 21 Mar 2012 02:42:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="123319414"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by orsmga002.jf.intel.com with ESMTP; 21 Mar 2012 02:42:52 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2012 17:41:07 +0800
Message-Id: <001944ced2e6b01e387bf129a4c95ebbb46f5bdb.1332315222.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1332315222.git.lianhao.lu@intel.com>
References: <cover.1332315222.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] lttng-2.0/lttng-ust: Change recipe name to lttng2-ust.
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Mar 2012 09:51:48 -0000

Change the recipe name lttng-ust from lttng-2.0 to lttng2-ust so that
that both the lttng-ust of the old framework and of the new framework
lttng-2.0 can coexist.

Fixed bug [YOCTO #2062].

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 .../lttng-2.0/lttng-tools_2.0-pre16.bb             |    2 +-
 .../{lttng-ust_1.9.4.bb => lttng2-ust_1.9.4.bb}    |    0
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename meta/recipes-kernel/lttng-2.0/{lttng-ust_1.9.4.bb => lttng2-ust_1.9.4.bb} (100%)

diff --git a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
index fdebc0e..d3a6a30 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng-tools_2.0-pre16.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=ab682a4729389c3f11913d758affe98e \
                     file://gpl-2.0.txt;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://lgpl-2.1.txt;md5=0f0d71500e6a57fd24d825f33242b9ca"
 
-DEPENDS = "liburcu popt lttng-ust"
+DEPENDS = "liburcu popt lttng2-ust"
 
 SRCREV = "9beed4cb465347c778e4f982c330cef78f2628b7"
 PV = "v2.0.pre16+git${SRCREV}"
diff --git a/meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb b/meta/recipes-kernel/lttng-2.0/lttng2-ust_1.9.4.bb
similarity index 100%
rename from meta/recipes-kernel/lttng-2.0/lttng-ust_1.9.4.bb
rename to meta/recipes-kernel/lttng-2.0/lttng2-ust_1.9.4.bb
-- 
1.7.0.4



