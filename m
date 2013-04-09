Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UPZfi-0003vx-AZ
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 16:37:19 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 09 Apr 2013 07:18:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,439,1363158000"; d="scan'208";a="315364298"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.195])
	by orsmga002.jf.intel.com with ESMTP; 09 Apr 2013 07:19:23 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Apr 2013 15:19:16 +0100
Message-Id: <9e0bc9865d480ff5b9704485007842ea0b54c8e4.1365517068.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1365517068.git.paul.eggleton@linux.intel.com>
References: <cover.1365517068.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1365517068.git.paul.eggleton@linux.intel.com>
References: <cover.1365517068.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] meta/recipes.txt: add recipes-lsb4
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
X-List-Received-Date: Tue, 09 Apr 2013 14:37:22 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes.txt |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes.txt b/meta/recipes.txt
index c3aa018..705386d 100644
--- a/meta/recipes.txt
+++ b/meta/recipes.txt
@@ -7,6 +7,7 @@ recipes-extended     - Applications which whilst not essential add features comp
 recipes-gnome        - All things related to the GTK+ application framework
 recipes-graphics     - X and other graphically related system libraries  
 recipes-kernel       - The kernel and generic applications/libraries with strong kernel dependencies
+recipes-lsb4         - Recipes added for the sole purpose of supporting the Linux Standard Base (LSB) 4.x
 recipes-multimedia   - Codecs and support utilties for audio, images and video
 recipes-rt           - Provides package and image recipes for using and testing the PREEMPT_RT kernel
 recipes-qt           - All things related to the Qt application framework
-- 
1.7.10.4



