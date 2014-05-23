Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (unknown [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EECB06ABDB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 May 2014 18:16:23 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2014 11:16:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,895,1392192000"; d="scan'208";a="544050651"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.174])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2014 11:16:06 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 May 2014 11:16:05 -0700
Message-Id: <1400868965-6748-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] poky-tiny: ensure that both poky and poky-tiny distro overrides are used
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
X-List-Received-Date: Fri, 23 May 2014 18:16:24 -0000

[YOCTO #6353]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-yocto/conf/distro/poky-tiny.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
index 2548d79..5b67e32 100644
--- a/meta-yocto/conf/distro/poky-tiny.conf
+++ b/meta-yocto/conf/distro/poky-tiny.conf
@@ -30,6 +30,8 @@
 
 require conf/distro/poky.conf
 DISTRO = "poky-tiny"
+DISTROOVERRIDES = "poky:poky-tiny"
+
 
 # FIXME: consider adding a new "tiny" feature
 #DISTRO_FEATURES_append = " tiny"
-- 
1.8.3.1


