Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QY0lD-0006oO-7C
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Jun 2011 21:00:47 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Jun 2011 11:57:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,386,1304319600"; d="scan'208";a="15140028"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.16.245])
	by orsmga002.jf.intel.com with ESMTP; 18 Jun 2011 11:57:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jun 2011 19:56:50 +0100
Message-Id: <3757ba84c9b7cca3933422a58d693420af77a4ed.1308423290.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1308423290.git.paul.eggleton@linux.intel.com>
References: <cover.1308423290.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1308423290.git.paul.eggleton@linux.intel.com>
References: <cover.1308423290.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] qt4-tools-nativesdk: drop freetype include as we build with -no-freetype
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
X-List-Received-Date: Sat, 18 Jun 2011 19:00:47 -0000

Freetype support is disabled so there's no need to point to the freetype
headers.

Prompted by OE commit 4931b37c8faf1eef7322cc82bf979885c770f4e0 from
Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-tools-nativesdk.inc |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
index d1f4b47..114f998 100644
--- a/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
+++ b/meta/recipes-qt/qt4/qt4-tools-nativesdk.inc
@@ -44,7 +44,6 @@ EXTRA_OECONF = "-prefix ${prefix} \
                 -embedded -no-freetype -no-glib -no-iconv \
                 -qt3support \
                 -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include \
-                -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/freetype2 \
                 -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/dbus-1.0 \
                 -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/lib/dbus-1.0/include \
                 -I${STAGING_DIR_HOST}${SDKPATHNATIVE}/usr/include/c++ \
-- 
1.7.4.1



