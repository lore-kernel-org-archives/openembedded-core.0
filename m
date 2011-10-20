Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RGnUy-0002qQ-Ny
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 09:57:10 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Oct 2011 00:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="64982236"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.6])
	by orsmga001.jf.intel.com with ESMTP; 20 Oct 2011 00:51:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Oct 2011 00:51:00 -0700
Message-Id: <d8576ddb57e76547ea35d98160cac534e810eb8b.1319096633.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.2
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
In-Reply-To: <cover.1319096633.git.sgw@linux.intel.com>
References: <cover.1319096633.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL - v2 24/26] tzcode-native: update SRC_URI to new IANA location
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
X-List-Received-Date: Thu, 20 Oct 2011 07:57:14 -0000

From: Joshua Lock <josh@linux.intel.com>

The TZ database has moved, it's now hosted by IANA.

Signed-off-by: Joshua Lock <josh@linux.intel.com>
---
 .../recipes-extended/tzcode/tzcode-native_2011i.bb |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/tzcode/tzcode-native_2011i.bb b/meta/recipes-extended/tzcode/tzcode-native_2011i.bb
index 0cdf400..b8ccff0 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2011i.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2011i.bb
@@ -4,8 +4,8 @@ PR = "r0"
 
 LIC_FILES_CHKSUM = "file://${WORKDIR}/README;md5=3ae8198f82258417ce29066d3b034035"
 
-SRC_URI = "ftp://elsie.nci.nih.gov/pub/tzcode${PV}.tar.gz;name=tzcode \
-           ftp://elsie.nci.nih.gov/pub/tzdata2011i.tar.gz;name=tzdata"
+SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
+           http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
 
 SRC_URI[tzcode.md5sum] = "cf7f4335b7c8682899fa2814e711c1b2"
 SRC_URI[tzcode.sha256sum] = "f0dd991de3f8d6c599c104e294377c9befa1ef40aa5a1d09e2e295a453f3c1ec"
-- 
1.7.6.2



