Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXoPK-00006T-GQ
	for openembedded-core@lists.openembedded.org;
	Fri, 25 May 2012 08:53:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 May 2012 23:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="157115466"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by fmsmga001.fm.intel.com with ESMTP; 24 May 2012 23:42:33 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 May 2012 23:42:18 -0700
Message-Id: <69db419f188c9c54c32699e5c37ef5d1b6bdd803.1337927956.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337927956.git.sgw@linux.intel.com>
References: <cover.1337927956.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 39/45] lttng2-ust: updated to version 2.0.2
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
X-List-Received-Date: Fri, 25 May 2012 06:53:55 -0000

From: Bogdan Marinescu <bogdan.a.marinescu@intel.com>

Tested with 'lttv' on core-image-lsb.

Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
---
 .../{lttng2-ust_1.9.4.bb => lttng2-ust_2.0.2.bb}   |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-kernel/lttng-2.0/{lttng2-ust_1.9.4.bb => lttng2-ust_2.0.2.bb} (81%)

diff --git a/meta/recipes-kernel/lttng-2.0/lttng2-ust_1.9.4.bb b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
similarity index 81%
rename from meta/recipes-kernel/lttng-2.0/lttng2-ust_1.9.4.bb
rename to meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
index 87d866e..8f650a4 100644
--- a/meta/recipes-kernel/lttng-2.0/lttng2-ust_1.9.4.bb
+++ b/meta/recipes-kernel/lttng-2.0/lttng2-ust_2.0.2.bb
@@ -3,8 +3,8 @@ DESCRIPTION = "The LTTng UST 2.0 package contains the userspace tracer library t
 HOMEPAGE = "http://lttng.org/lttng2.0"
 BUGTRACKER = "n/a"
 
-LICENSE = "LGPLv2.1+ & BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e647752e045a8c45b6f583771bd561ef \
+LICENSE = "LGPLv2.1+ & BSD & GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=c963eb366b781252b0bf0fdf1624d9e9 \
                     file://snprintf/snprintf.c;endline=32;md5=d3d544959d8a3782b2e07451be0a903c \
                     file://snprintf/various.h;endline=31;md5=89f2509b6b4682c4fc95255eec4abe44"
 
@@ -12,8 +12,8 @@ inherit autotools
 
 DEPENDS = "liburcu util-linux"
 
-SRCREV = "eeee05f35f014a8c068e0d29b18629cafbfdfc1d"
-PV = "1.9.4+git${SRCPV}"
+SRCREV = "a367ee66aad3ffd21ef64d1b24efc6f862e09562"
+PV = "2.0.2+git${SRCPV}"
 PR = "r0"
 
 SRC_URI = "git://git.lttng.org/lttng-ust.git;protocol=git"
-- 
1.7.7.6



