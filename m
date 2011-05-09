Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJKUE-0003hO-TL
	for openembedded-core@lists.openembedded.org;
	Mon, 09 May 2011 09:02:35 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 08 May 2011 23:59:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,339,1301900400"; d="scan'208";a="744305295"
Received: from unknown (HELO localhost) ([10.255.12.42])
	by orsmga001.jf.intel.com with ESMTP; 08 May 2011 23:59:52 -0700
Message-Id: <74c4c97cda7fbda68f8e6985eaad1c0e20998429.1304924223.git.sgw@linux.intel.com>
In-Reply-To: <cover.1304924223.git.sgw@linux.intel.com>
References: <cover.1304924223.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 22:00:53 -0700
Date: Sun, 08 May 2011 23:59:52 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 13/20] conf/layer.conf: Use .= to append to BBPATH and += for BBFILES
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
X-List-Received-Date: Mon, 09 May 2011 07:02:35 -0000

From: Khem Raj <raj.khem@gmail.com>

This helps bitbake in organising BBPATH and BBFILES with given
BBFILE_PRIORITY order

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/layer.conf |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
index 5287417..3f63c7d 100644
--- a/meta/conf/layer.conf
+++ b/meta/conf/layer.conf
@@ -1,9 +1,8 @@
 BBPATH ?= ""
 # We have a conf and classes directory, add to BBPATH
-BBPATH := "${BBPATH}:${LAYERDIR}"
-
+BBPATH .= ":${LAYERDIR}"
 # We have a packages directory, add to BBFILES
-BBFILES := "${BBFILES} ${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
+BBFILES += "${LAYERDIR}/packages/*/*.bb ${LAYERDIR}/recipes-*/*/*.bb"
 
 BBFILE_COLLECTIONS += "normal"
 BBFILE_PATTERN_normal := "^${LAYERDIR}/"
-- 
1.7.1.1



