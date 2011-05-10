Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVG-0001SQ-HW
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:02 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 May 2011 22:26:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; 
   d="scan'208";a="163183"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by fmsmga001.fm.intel.com with ESMTP; 09 May 2011 22:26:19 -0700
Message-Id: <48edf52010e1aaffa175824f23a4423d850dabcd.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Thu, 5 May 2011 11:45:14 -0500
Date: Mon, 09 May 2011 22:26:19 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 11/30] image-mklibs: add microblaze arch support
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
X-List-Received-Date: Tue, 10 May 2011 05:29:02 -0000

From: Adrian Alonso <aalonso@secretlab.ca>

* In function mklibs_optimize_image_doit
* Add microblaze arch case for setting the dynamic_loader
  used by "mklibs" call

Signed-off-by: Adrian Alonso <aalonso@secretlab.ca>
---
 meta/classes/image-mklibs.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 0e72b01..9f5a4ea 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -16,7 +16,7 @@ mklibs_optimize_image_doit() {
 		> ${WORKDIR}/mklibs/executables.list
 
 	case ${TARGET_ARCH} in
-		powerpc | mips )
+		powerpc | mips | microblaze )
 			dynamic_loader="/lib/ld.so.1"
 			;;
 		x86_64)
-- 
1.7.1.1



