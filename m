Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SXQ2p-00056b-7f
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 06:53:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 23 May 2012 21:42:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="144034693"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.24])
	by orsmga001.jf.intel.com with ESMTP; 23 May 2012 21:42:45 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 21:42:28 -0700
Message-Id: <f5c529408075d5066819e4c0dc3b13381233e7e4.1337834073.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337834073.git.sgw@linux.intel.com>
References: <cover.1337834073.git.sgw@linux.intel.com>
Subject: [Consolidated Pull 25/28] sanity.bbclass: add newline to check_create_long_filename failure message
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
X-List-Received-Date: Thu, 24 May 2012 04:53:15 -0000

From: Joshua Lock <josh@linux.intel.com>

Each failure in the sanity message should be reported on a new line.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 5cf9ea13..39da14b 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -150,7 +150,7 @@ def check_create_long_filename(filepath, pathname):
         if errno == 36: # ENAMETOOLONG
             return "Failed to create a file with a long name in %s. Please use a filesystem that does not unreasonably limit filename length.\n" % pathname
         else:
-            return "Failed to create a file in %s: %s" % (pathname, strerror)
+            return "Failed to create a file in %s: %s.\n" % (pathname, strerror)
     return ""
 
 def check_connectivity(d):
-- 
1.7.7.6



