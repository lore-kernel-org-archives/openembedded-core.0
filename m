Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8wPq-0005u4-NN
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 18:55:54 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 04 Sep 2012 09:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,367,1344236400"; d="scan'208";a="141382023"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.161])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Sep 2012 09:43:30 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 17:43:25 +0100
Message-Id: <88079495fb9e1020951ed23ab54cf17c45f89f06.1346776916.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346776916.git.paul.eggleton@linux.intel.com>
References: <cover.1346776916.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346776916.git.paul.eggleton@linux.intel.com>
References: <cover.1346776916.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] packagegroup-core-standalone-gmae-sdk-target: allow dbg package
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 16:55:54 -0000

meta-toolchain-gmae is still referring to the dbg package so we still
need to create this.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 ...packagegroup-core-standalone-gmae-sdk-target.bb |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
index 69c5340..3f322a0 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-core-standalone-gmae-sdk-target.bb
@@ -4,14 +4,12 @@
 
 SUMMARY = "GNOME Mobile And Embedded SDK (target tools)"
 LICENSE = "MIT"
-PR = "r14"
+PR = "r15"
 
 inherit packagegroup
 
 require packagegroup-sdk-gmae.inc
 
-PACKAGEGROUP_DISABLE_COMPLEMENTARY = "1"
-
 # For backwards compatibility after rename
 RPROVIDES_${PN} = "task-core-standalone-gmae-sdk-target"
 
-- 
1.7.9.5



