Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1US82k-0007SG-36
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Apr 2013 17:43:52 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 16 Apr 2013 08:25:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,486,1363158000"; d="scan'208";a="227838026"
Received: from unknown (HELO helios.amr.corp.intel.com) ([10.255.14.4])
	by AZSMGA002.ch.intel.com with ESMTP; 16 Apr 2013 08:25:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Apr 2013 16:25:08 +0100
Message-Id: <c321211412ffb39903d8fb3b4915afcfcbc8e033.1366125772.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1366125772.git.paul.eggleton@linux.intel.com>
References: <cover.1366125772.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1366125772.git.paul.eggleton@linux.intel.com>
References: <cover.1366125772.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 2/3] qt4-embedded: bump PR to allow removal of meta-oe bbappend
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
X-List-Received-Date: Tue, 16 Apr 2013 15:43:55 -0000

The meta-oe bbappend only increments PRINC, if we bump INC_PR here we
can remove that.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-qt/qt4/qt4-embedded.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4-embedded.inc b/meta/recipes-qt/qt4/qt4-embedded.inc
index f231e98..7c8876b 100644
--- a/meta/recipes-qt/qt4/qt4-embedded.inc
+++ b/meta/recipes-qt/qt4/qt4-embedded.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is
 SECTION = "libs"
 HOMEPAGE = "http://qt.nokia.com"
 DEPENDS += "directfb tslib"
-INC_PR = "r50"
+INC_PR = "r52"
 
 QT4EDEPENDS = ""
 QT_BASE_LIB  ?= "libqt-embedded"
-- 
1.7.10.4



