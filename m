Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SqnhV-0006tH-2j
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 17:59:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2012 08:47:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="193443378"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.178])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jul 2012 08:47:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2012 08:47:34 -0700
Message-Id: <c02a3e3df4435318261773dc41d4ccfd38caa032.1342453118.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
In-Reply-To: <cover.1342453118.git.sgw@linux.intel.com>
References: <cover.1342453118.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 28/30] mirrors: Add debian archive snapshot mirrors to search list
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
X-List-Received-Date: Mon, 16 Jul 2012 15:59:09 -0000

From: Khem Raj <raj.khem@gmail.com>

I ran across this problem when apt 0.7.14 was not fetchable
from regular debian mirrors and existing snapshot mirror
did not have it either since we did not use proper syntax
so it was not hitting that.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/mirrors.bbclass |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 86ccd7a..1a9a531 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -1,5 +1,7 @@
 MIRRORS += "\
-${DEBIAN_MIRROR}/main	http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool/ \n \
+${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool \n \
+${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20110127T084257Z/debian/pool \n \
+${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20090802T004153Z/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.de.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.au.debian.org/debian/pool \n \
 ${DEBIAN_MIRROR}	ftp://ftp.cl.debian.org/debian/pool \n \
-- 
1.7.7.6



