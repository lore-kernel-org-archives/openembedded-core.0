Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1T8U8I-0004vH-Fj
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 12:43:54 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 03 Sep 2012 03:31:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,359,1344236400"; d="scan'208";a="217497241"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.155])
	by fmsmga001.fm.intel.com with ESMTP; 03 Sep 2012 03:31:24 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Sep 2012 11:30:43 +0100
Message-Id: <52c14fa52376dba04fe99ce9aa99500f65478a9b.1346668109.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1346668109.git.paul.eggleton@linux.intel.com>
References: <cover.1346668109.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 23/28] ofono: add runtime dependency on dbus
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
X-List-Received-Date: Mon, 03 Sep 2012 10:43:54 -0000

ofono's sole configuration interface is its dbus interface, so it really
requires it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-connectivity/ofono/ofono.inc    |    2 ++
 meta/recipes-connectivity/ofono/ofono_git.bb |    2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ofono/ofono.inc b/meta/recipes-connectivity/ofono/ofono.inc
index 573c778..48513b2 100644
--- a/meta/recipes-connectivity/ofono/ofono.inc
+++ b/meta/recipes-connectivity/ofono/ofono.inc
@@ -19,6 +19,8 @@ do_install_append() {
 
 PACKAGES =+ "${PN}-tests"
 
+RDEPENDS_${PN} += "dbus"
+
 FILES_${PN} += "${base_libdir}/udev ${systemd_unitdir}"
 FILES_${PN}-tests = "${libdir}/ofono"
 RDEPENDS_${PN}-tests = "python python-pygobject"
diff --git a/meta/recipes-connectivity/ofono/ofono_git.bb b/meta/recipes-connectivity/ofono/ofono_git.bb
index 0a69fff..f79f34f 100644
--- a/meta/recipes-connectivity/ofono/ofono_git.bb
+++ b/meta/recipes-connectivity/ofono/ofono_git.bb
@@ -3,7 +3,7 @@ require ofono.inc
 S	 = "${WORKDIR}/git"
 SRCREV = "14544d5996836f628613c2ce544380ee6fc8f514"
 PV	 = "0.12-git${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 SRC_URI  = "git://git.kernel.org/pub/scm/network/ofono/ofono.git;protocol=git \
 	    file://ofono"
-- 
1.7.9.5



