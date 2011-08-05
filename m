Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QpMO5-0000dS-4n
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 17:32:40 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Aug 2011 08:28:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,323,1309762800"; d="scan'208";a="34926387"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2011 08:28:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 08:28:00 -0700
Message-Id: <906e94178313aee3162d3c85b11b6763cd81d1ad.1312557813.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312557813.git.sgw@linux.intel.com>
References: <cover.1312557813.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 10/14] image-mklibs.bbclass: Add powerpc64 arch support
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
X-List-Received-Date: Fri, 05 Aug 2011 15:32:41 -0000

From: Kumar Gala <galak@kernel.crashing.org>

powerp64 dynamic loader is 'ld64.so.1'.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/classes/image-mklibs.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/image-mklibs.bbclass b/meta/classes/image-mklibs.bbclass
index 9f5a4ea..d6630c4 100644
--- a/meta/classes/image-mklibs.bbclass
+++ b/meta/classes/image-mklibs.bbclass
@@ -19,6 +19,9 @@ mklibs_optimize_image_doit() {
 		powerpc | mips | microblaze )
 			dynamic_loader="/lib/ld.so.1"
 			;;
+		powerpc64)
+			dynamic_loader="${base_libdir}/ld64.so.1"
+			;;
 		x86_64)
 			dynamic_loader="/lib/ld-linux-x86-64.so.2"
 			;;
-- 
1.7.3.4



