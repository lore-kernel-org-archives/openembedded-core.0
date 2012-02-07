Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RutvV-0004HU-Oy
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Feb 2012 23:54:18 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 14:46:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122206471"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.116])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 14:46:05 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Feb 2012 14:45:54 -0800
Message-Id: <546a51c8daf3beb966cd23a7985b5205a4642bce.1328654424.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328654424.git.sgw@linux.intel.com>
References: <cover.1328654424.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 34/35] mirrors.bbclass: Add yp.org and oe.org to fallback mirrors
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
X-List-Received-Date: Tue, 07 Feb 2012 22:54:19 -0000

From: Khem Raj <raj.khem@gmail.com>

This should improve the fetching errors users see
when upstream src_uri is unavailable

Signed-off-by: Khem Raj <raj.khem@gmail.com>

mirrors.bbclass: remove empty line

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/mirrors.bbclass |   21 ++++++++++++++++++++-
 1 files changed, 20 insertions(+), 1 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 2146087..c08a3d7 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -52,5 +52,24 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://gd.tuwien.ac.at/utils/adm
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/Mirror/lsof/ \n \
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/ \n \
 http://www.apache.org/dist  http://archive.apache.org/dist \n \
+cvs://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
+svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
+git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
+hg://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \n \
+bzr://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
+svk://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
+p4://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \n \
+osc://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
+https?$://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
+ftp://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
+cvs://.*/.*     http://sources.openembedded.org/ \n \
+svn://.*/.*     http://sources.openembedded.org/ \n \
+git://.*/.*     http://sources.openembedded.org/ \n \
+hg://.*/.*      http://sources.openembedded.org/ \n \
+bzr://.*/.*     http://sources.openembedded.org/ \n \
+svk://.*/.*     http://sources.openembedded.org/ \n \
+p4://.*/.*      http://sources.openembedded.org/ \n \
+osc://.*/.*     http://sources.openembedded.org/ \n \
+https?$://.*/.* http://sources.openembedded.org/ \n \
+ftp://.*/.*     http://sources.openembedded.org/ \n \
 "
-
-- 
1.7.6.5



