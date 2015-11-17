Return-Path: <alejandro.joya.cruz@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id D128E60107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 22:13:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 17 Nov 2015 14:13:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,310,1444719600"; d="scan'208";a="853305458"
Received: from afjoyacr-mobl2.zpn.intel.com ([10.219.128.105])
	by fmsmga002.fm.intel.com with ESMTP; 17 Nov 2015 14:13:28 -0800
From: Alejandro Joya <alejandro.joya.cruz@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Nov 2015 16:13:13 -0600
Message-Id: <be34732988c6b7aeabce5904760f770f72dfec8f.1447797811.git.alejandro.joya.cruz@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
References: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
In-Reply-To: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
References: <cover.1447797811.git.alejandro.joya.cruz@intel.com>
Subject: [PATCH 1/4] base-utils:flexible dependency for command utilities
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
X-List-Received-Date: Tue, 17 Nov 2015 22:13:28 -0000

add base-line configuration for command utilities, this will be used instead
of hardcoded uses of busybox around the environment.

Signed-off-by: Alejandro Joya <alejandro.joya.cruz@intel.com>
---
 meta/conf/distro/include/default-providers.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index 9f84d5c..bb382bd 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -13,6 +13,7 @@ PREFERRED_PROVIDER_virtual/mesa ?= "mesa"
 PREFERRED_PROVIDER_virtual/update-alternatives ?= "opkg-utils"
 PREFERRED_PROVIDER_virtual/update-alternatives-native ?= "opkg-utils-native"
 PREFERRED_PROVIDER_virtual/libx11 ?= "libx11"
+PREFERRED_PROVIDER_virtual/base-utils ?= "busybox"
 PREFERRED_PROVIDER_xf86-video-intel ?= "xf86-video-intel"
 
 #
@@ -23,6 +24,8 @@ VIRTUAL-RUNTIME_apm ?= "apm"
 VIRTUAL-RUNTIME_alsa-state ?= "alsa-state"
 VIRTUAL-RUNTIME_getopt ?= "util-linux-getopt"
 VIRTUAL-RUNTIME_wireless-tools ?= "iw wireless-tools"
+VIRTUAL-RUNTIME_base-utils ?= "busybox"
+VIRTUAL-RUNTIME_base-utils-hwclock ?= "busybox-hwclock"
 
 #
 # Default recipe providers
-- 
2.1.0


