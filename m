Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1SXLgA-0001Af-3D
	for openembedded-core@lists.openembedded.org;
	Thu, 24 May 2012 02:13:22 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 23 May 2012 17:03:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="103547430"
Received: from unknown (HELO shamshir.amr.corp.intel.com) ([10.255.12.49])
	by AZSMGA002.ch.intel.com with ESMTP; 23 May 2012 17:03:07 -0700
From: Joshua Lock <josh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 May 2012 17:03:00 -0700
Message-Id: <75b541cf65de1f4befc357bba0535ea8257f36b4.1337816265.git.josh@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337816265.git.josh@linux.intel.com>
References: <cover.1337816265.git.josh@linux.intel.com>
In-Reply-To: <cover.1337816265.git.josh@linux.intel.com>
References: <cover.1337816265.git.josh@linux.intel.com>
Subject: [PATCH 4/7] sanity.bbclass: add newline to check_create_long_filename failure message
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
X-List-Received-Date: Thu, 24 May 2012 00:13:23 -0000

Each failure in the sanity message should be reported on a new line.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 meta/classes/sanity.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 5cf9ea1..39da14b 100644
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



