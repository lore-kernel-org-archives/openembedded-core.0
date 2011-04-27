Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QEzEY-0005Ph-85
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Apr 2011 09:32:26 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 27 Apr 2011 00:29:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,273,1301900400"; d="scan'208";a="634683311"
Received: from unknown (HELO localhost) ([10.255.12.245])
	by orsmga002.jf.intel.com with ESMTP; 27 Apr 2011 00:29:54 -0700
Message-Id: <ee5a50d3196a22040bfe35fc5840291065761d6b.1303889119.git.sgw@linux.intel.com>
In-Reply-To: <cover.1303889119.git.sgw@linux.intel.com>
References: <cover.1303889119.git.sgw@linux.intel.com>
Old-Date: Fri, 22 Apr 2011 08:31:15 -0700
Date: Wed, 27 Apr 2011  0:29:54 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
X-Mailman-Approved-At: Wed, 27 Apr 2011 09:50:50 +0200
Cc: Darren Hart <dvhart@linux.intel.com>, Chris Larson <clarson@kergoth.com>,
	Antonio Ospite <ospite@studenti.unina.it>
Subject: [PATCH 33/52] logging: remove unused BBDEBUG from local.conf.sample
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
X-List-Received-Date: Wed, 27 Apr 2011 07:32:26 -0000

From: Darren Hart <dvhart@linux.intel.com>

The boolean BBDEBUG described in local.conf.sample is no longer
referenced by any other sources. It also conflicts with the OS
environment variable of the same name which maps to the debug
log level also specified by the -D[D[D]] argument.

Remove the boolean BBDEBUG from local.conf.sample.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
Cc: Chris Larson <clarson@kergoth.com>
---
 meta/conf/local.conf.sample |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index 5ba1b06..ba92df8 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -115,8 +115,6 @@ PACKAGE_DEBUG_SPLIT_STYLE = '.debug'
 # SELECTED_OPTIMIZATION = "${PROFILE_OPTIMIZATION}"
 # LDFLAGS =+ "-pg"
 
-# Uncomment this if you want BitBake to emit debugging output
-# BBDEBUG = "yes"
 # Uncomment this if you want BitBake to emit the log if a build fails.
 BBINCLUDELOGS = "yes"
 
-- 
1.7.1.1



