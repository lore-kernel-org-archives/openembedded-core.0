Return-Path: <sgw@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DEB746AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 16:54:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2015 09:33:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,581,1427785200"; d="scan'208";a="708016314"
Received: from kchoi15-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.252.141.149])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2015 09:33:32 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue,  9 Jun 2015 09:33:29 -0700
Message-Id: <1433867609-26266-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] poky-tiny: Update kernel to 3.19
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
X-List-Received-Date: Tue, 09 Jun 2015 16:54:26 -0000

Additionally, allow both PREFERRED_VERSION and PREFERRED_PROVIDE to be overridden

[YOCTO #7478]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta-yocto/conf/distro/poky-tiny.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
index aa60e77..63bbd88 100644
--- a/meta-yocto/conf/distro/poky-tiny.conf
+++ b/meta-yocto/conf/distro/poky-tiny.conf
@@ -36,8 +36,8 @@ DISTRO = "poky-tiny"
 
 # Distro config is evaluated after the machine config, so we have to explicitly
 # set the kernel provider to override a machine config.
-PREFERRED_PROVIDER_virtual/kernel = "linux-yocto-tiny"
-PREFERRED_VERSION_linux-yocto-tiny = "3.14%"
+PREFERRED_PROVIDER_virtual/kernel ?= "linux-yocto-tiny"
+PREFERRED_VERSION_linux-yocto-tiny ?= "3.19%"
 
 # We can use packagegroup-core-boot, but in the future we may need a new packagegroup-core-tiny
 #POKY_DEFAULT_EXTRA_RDEPENDS += "packagegroup-core-boot"
-- 
2.1.0


