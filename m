Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2E9466B5EF
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Dec 2013 22:30:15 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Dec 2013 14:30:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,567,1384329600"; d="scan'208";a="457010077"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.113])
	by fmsmga002.fm.intel.com with ESMTP; 28 Dec 2013 14:30:15 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Dec 2013 22:29:18 +0000
Message-Id: <ab69f037707ed97ac2ebddd7495cdaa38241a794.1388269205.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1388269205.git.paul.eggleton@linux.intel.com>
References: <cover.1388269205.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 22/38] xf86-input-vmmouse: set SUMMARY and DESCRIPTION
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Dec 2013 22:30:15 -0000

Set these consistent with other X.org input driver recipes.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.0.0.bb | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.0.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.0.0.bb
index 3290ed5..35ef599 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.0.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-vmmouse_13.0.0.bb
@@ -1,6 +1,11 @@
 require xorg-driver-input.inc
 
-DESCRIPTION = "X.Org X server -- VMWare mouse input driver"
+SUMMARY = "X.Org X server -- VMWare mouse input driver"
+DESCRIPTION = "The vmmouse driver enables support for the special VMMouse \
+protocol that is provided by VMware virtual machines to give absolute \
+pointer positioning. The vmmouse driver is capable of falling back to the \
+standard 'mouse' driver if a VMware virtual machine is not detected."
+
 PR = "${INC_PR}.0"
 
 SRC_URI[md5sum] = "34f9f64ee6a1a51fc8266a9af24e1e07"
-- 
1.8.1.2


