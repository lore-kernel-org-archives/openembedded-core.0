Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rq8ew-0006xz-F1
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jan 2012 20:37:30 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 25 Jan 2012 11:29:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="100524976"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.96])
	by orsmga001.jf.intel.com with ESMTP; 25 Jan 2012 11:29:41 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Jan 2012 11:29:37 -0800
Message-Id: <a6020f9ec697254237f1d6a335c49cd53e798c30.1327519635.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1327519635.git.sgw@linux.intel.com>
References: <cover.1327519635.git.sgw@linux.intel.com>
In-Reply-To: <cover.1327519635.git.sgw@linux.intel.com>
References: <cover.1327519635.git.sgw@linux.intel.com>
Subject: [PATCH 2/4] default-providers: add kbd as PREFERRED_PROVIDER for console-tools
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
X-List-Received-Date: Wed, 25 Jan 2012 19:37:30 -0000

kbd is used a primary provider for console-tools

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/conf/distro/include/default-providers.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
index efa8117..667f3ba 100644
--- a/meta/conf/distro/include/default-providers.inc
+++ b/meta/conf/distro/include/default-providers.inc
@@ -32,4 +32,4 @@ PREFERRED_PROVIDER_matchbox-panel ?= "matchbox-panel-2"
 PREFERRED_PROVIDER_opkg ?= "opkg"
 PREFERRED_PROVIDER_opkg-native ?= "opkg-native"
 PREFERRED_PROVIDER_opkg-nativesdk ?= "opkg-nativesdk"
-
+PREFERRED_PROVIDER_console-tools ?= "kbd"
-- 
1.7.6.5



