Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UV47W-0004Uq-Lo
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 20:08:43 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Apr 2013 10:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,545,1363158000"; d="scan'208";a="231632418"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.249])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2013 10:50:16 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 18:48:40 +0100
Message-Id: <95fb0fa7c31f4263647cc3834f1a13ca4a20a39d.1366825663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 03/21] gettext-minimal-native: add SUMMARY and DESCRIPTION
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
X-List-Received-Date: Wed, 24 Apr 2013 18:08:47 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-core/gettext/gettext-minimal-native_0.18.2.bb |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.18.2.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.18.2.bb
index da6d3bc..febad7a 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.18.2.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.18.2.bb
@@ -1,3 +1,8 @@
+SUMMARY = "Minimal gettext for supporting native autoconf/automake"
+DESCRIPTION = "Contains the m4 macros sufficient to support building \
+autoconf/automake. This provides a significant build time speedup by \
+the removal of gettext-native from most dependency chains (now only \
+needed for gettext for the target)."
 SRC_URI = "file://aclocal.tgz \
            file://config.rpath \
            file://Makefile.in.in \
-- 
1.7.10.4



