Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1ROPOL-0005br-JD
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 08:49:46 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2011 23:43:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,488,1315206000"; d="scan'208";a="83351233"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.14])
	by fmsmga001.fm.intel.com with ESMTP; 09 Nov 2011 23:43:22 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Nov 2011 23:43:07 -0800
Message-Id: <1bd0b42a82557224fbc7bf0b1a303a1a85276600.1320910946.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
In-Reply-To: <cover.1320910946.git.sgw@linux.intel.com>
References: <cover.1320910946.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL (v2) 25/33] useradd-example.bb: update example documentation comments
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
X-List-Received-Date: Thu, 10 Nov 2011 07:49:54 -0000

From: Scott Garman <scott.a.garman@intel.com>

Clarify that only packages listed in USERADD_PACKAGES will
include the user/group creation code.

Signed-off-by: Scott Garman <scott.a.garman@intel.com>
---
 .../recipes-skeleton/useradd/useradd-example.bb    |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
index 02d56f6..b10c1d0 100644
--- a/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
+++ b/meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
@@ -17,13 +17,12 @@ PACKAGES =+ "${PN}-user3"
 
 inherit useradd
 
-# Specify which package(s) should include the user/group code.
-# Make sure that any packages which install files owned by custom
-# users/groups are included here. The code which adds users and
-# groups is idempotent.
+# You must set USERADD_PACKAGES when you inherit useradd. This
+# lists which output packages will include the user/group
+# creation code.
 USERADD_PACKAGES = "${PN} ${PN}-user3"
 
-# You *must* set USERADD_PARAM and/or GROUPADD_PARAM when
+# You must also set USERADD_PARAM and/or GROUPADD_PARAM when
 # you inherit useradd.
 
 # USERADD_PARAM specifies command line options to pass to the
-- 
1.7.6.4



