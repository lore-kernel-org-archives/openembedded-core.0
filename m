Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R9g6y-00060y-D7
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 18:38:56 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Sep 2011 09:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="57738518"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.157])
	by orsmga001.jf.intel.com with ESMTP; 30 Sep 2011 09:33:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 17:33:15 +0100
Message-Id: <11423413f0859e6f5e8fa701280ce96c9c2b08e7.1317400021.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1317400021.git.paul.eggleton@linux.intel.com>
References: <cover.1317400021.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1317400021.git.paul.eggleton@linux.intel.com>
References: <cover.1317400021.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/7] qt4(embedded and x11): disable neon for armv6-vfp
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
X-List-Received-Date: Fri, 30 Sep 2011 16:38:57 -0000

From: Denis Carikli <denis@eukrea.com>

without the -no-neon flag, neon is "autodetected"
  by looking if the compiler is capable of compiling
  a neon test, and succeed, and neon is then enabled
  during the compilation.

Signed-off-by: Denis Carikli <denis@eukrea.com>
---
 meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb |    4 ++--
 meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb b/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
index c3f6713..801b45a 100644
--- a/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
+++ b/meta/recipes-qt/qt4/qt4-embedded_4.7.3.bb
@@ -1,9 +1,9 @@
 require qt-${PV}.inc
 require qt4-embedded.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
+QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
 
 QT_CONFIG_FLAGS += " \
  -exceptions \
diff --git a/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb b/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
index 75c6314..413afb4 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
+++ b/meta/recipes-qt/qt4/qt4-x11-free_4.7.3.bb
@@ -1,9 +1,9 @@
 require qt4-x11-free.inc
 require qt-${PV}.inc
 
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 
-QT_CONFIG_FLAGS_append_armv6 = " -no-neon "
+QT_CONFIG_FLAGS_append_armv6-vfp = " -no-neon "
 
 QT_CONFIG_FLAGS += " \
  -no-embedded \
-- 
1.7.4.1



