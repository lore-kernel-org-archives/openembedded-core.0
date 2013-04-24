Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1UV47d-0004Ww-Hm
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 20:08:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 24 Apr 2013 10:50:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,545,1363158000"; d="scan'208";a="231632466"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.13.249])
	by AZSMGA002.ch.intel.com with ESMTP; 24 Apr 2013 10:50:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Apr 2013 18:48:45 +0100
Message-Id: <2f0dd392ac5adbd7d6352daa9c59bda5aa9f4844.1366825663.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366825663.git.paul.eggleton@linux.intel.com>
References: <cover.1366825663.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 08/21] icon-naming-utils: add SUMMARY and DESCRIPTION
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
X-List-Received-Date: Wed, 24 Apr 2013 18:09:00 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../icon-naming-utils/icon-naming-utils_0.8.90.bb            |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
index 63a485d..79d5a4e 100644
--- a/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
+++ b/meta/recipes-devtools/icon-naming-utils/icon-naming-utils_0.8.90.bb
@@ -1,3 +1,13 @@
+SUMMARY = "Enables backwards compatibility with current desktop icon themes"
+DESCRIPTION = "A Perl script used for maintaining backwards \
+compatibility with current desktop icon themes, while migrating to the \
+names specified in the Icon Naming Specification. The Icon Naming \
+Utilities map the icon names used by the GNOME and KDE desktops to the \
+icon names proposed in the Icon Naming Specification, and generate the \
+icon files appropriate to the desktop environment you use. The Icon \
+Naming Specification provides a standard list of common icon contexts \
+and names that can be used to make icon themes work in a desktop \
+environment or application that implements the naming specification. "
 LICENSE = "GPLv2"
 DEPENDS = "libxml-simple-perl-native"
 PR = "r4"
-- 
1.7.10.4



