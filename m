Return-Path: <mihai.prica@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 6092D6BD69
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Aug 2013 13:48:56 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Aug 2013 06:48:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,990,1367996400"; d="scan'208";a="388846843"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.155])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2013 06:48:56 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Aug 2013 16:47:35 +0300
Message-Id: <1416b9da514636a084ce5286f8bfce79f7af9d53.1377434794.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377434794.git.mihai.prica@intel.com>
References: <cover.1377434794.git.mihai.prica@intel.com>
In-Reply-To: <cover.1377434794.git.mihai.prica@intel.com>
References: <cover.1377434794.git.mihai.prica@intel.com>
Subject: [PATCH 1/2] packagegroup-self-hosted: integrate midori
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
X-List-Received-Date: Fri, 30 Aug 2013 13:48:57 -0000

Integrate the Midori web browser in Build Appliance. This will allow the
users to get help and file a bug from Hob in Build Appliance.

[YOCTO #3506]

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 .../packagegroups/packagegroup-self-hosted.bb      |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
index 429ade9..a931cb0 100644
--- a/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-self-hosted.bb
@@ -44,6 +44,7 @@ RDEPENDS_packagegroup-self-hosted-host-tools = "\
     mc-helpers \
     mc-helpers-perl \
     mc-helpers-python \
+    midori \
     pcmanfm \
     parted \
     pseudo \
-- 
1.7.9.5


