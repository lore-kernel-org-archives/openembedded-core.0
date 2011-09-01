Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QzGoY-00060e-Hc
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 01:36:54 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Sep 2011 16:31:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="44313352"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.3])
	by orsmga002.jf.intel.com with ESMTP; 01 Sep 2011 16:31:55 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Sep 2011 16:31:52 -0700
Message-Id: <7ffeebb534149c8408833db5de39d4e0c8649347.1314919495.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1314919495.git.sgw@linux.intel.com>
References: <cover.1314919495.git.sgw@linux.intel.com>
In-Reply-To: <cover.1314919495.git.sgw@linux.intel.com>
References: <cover.1314919495.git.sgw@linux.intel.com>
Subject: [PATCH 2/3] sato recipes: Update PR because of libowl conversion to git
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
X-List-Received-Date: Thu, 01 Sep 2011 23:36:54 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb |    2 +-
 meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb    |    2 +-
 meta/recipes-sato/pimlico/contacts_0.9.bb     |    2 +-
 meta/recipes-sato/pimlico/contacts_git.bb     |    2 +-
 meta/recipes-sato/pimlico/dates_0.4.8.bb      |    2 +-
 meta/recipes-sato/pimlico/dates_git.bb        |    2 +-
 meta/recipes-sato/pimlico/tasks_0.19.bb       |    2 +-
 meta/recipes-sato/pimlico/tasks_git.bb        |    2 +-
 meta/recipes-sato/web/web_git.bb              |    2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
index f2b3a7c..68402c5 100644
--- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
+++ b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
@@ -14,7 +14,7 @@ SRC_URI = "http://savannah.nongnu.org/download/${BPN}/${BPN}-${PV}.tar.gz \
 
 SRC_URI[md5sum] = "254a72fc67505e3aa52884c729cd7b97"
 SRC_URI[sha256sum] = "959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c"
-PR = "r0"
+PR = "r1"
 
 SRC_URI_append_poky += " file://owl-menu.patch;apply=yes "
 
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb
index 4925231..f48bb67 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb
@@ -11,7 +11,7 @@ SECTION = "x11"
 DEPENDS = "gtk+ startup-notification libfm"
 DEPENDS_append_poky = " libowl"
 
-PR = "r0"
+PR = "r1"
 
 COMPATIBLE_HOST = '(x86_64.*|i.86.*|arm.*|mips.*|powerpc.*)-(linux|freebsd.*)'
 
diff --git a/meta/recipes-sato/pimlico/contacts_0.9.bb b/meta/recipes-sato/pimlico/contacts_0.9.bb
index df87ac5..84fd941 100644
--- a/meta/recipes-sato/pimlico/contacts_0.9.bb
+++ b/meta/recipes-sato/pimlico/contacts_0.9.bb
@@ -1,5 +1,5 @@
 require contacts.inc
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI =+ "http://pimlico-project.org/sources/${BPN}/${BPN}-${PV}.tar.gz"
diff --git a/meta/recipes-sato/pimlico/contacts_git.bb b/meta/recipes-sato/pimlico/contacts_git.bb
index 57ee3b7..14ade46 100644
--- a/meta/recipes-sato/pimlico/contacts_git.bb
+++ b/meta/recipes-sato/pimlico/contacts_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SRCREV = "19853893fdb595de6aa59db0d9dc2f9451ed2933"
 PV = "0.12+git${SRCPV}"
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/pimlico/dates_0.4.8.bb b/meta/recipes-sato/pimlico/dates_0.4.8.bb
index ca88a73..6eab228 100644
--- a/meta/recipes-sato/pimlico/dates_0.4.8.bb
+++ b/meta/recipes-sato/pimlico/dates_0.4.8.bb
@@ -1,5 +1,5 @@
 require dates.inc
 
-PR = "r4"
+PR = "r5"
 
 SRC_URI = "http://pimlico-project.org/sources/dates/dates-${PV}.tar.gz"
diff --git a/meta/recipes-sato/pimlico/dates_git.bb b/meta/recipes-sato/pimlico/dates_git.bb
index 094ef30..2abb12d 100644
--- a/meta/recipes-sato/pimlico/dates_git.bb
+++ b/meta/recipes-sato/pimlico/dates_git.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe \
 
 SRCREV = "514185dc1f6588085fda41eb59898b93d0487dd4"
 PV = "0.4.11+git${SRCPV}"
-PR = "r4"
+PR = "r5"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta/recipes-sato/pimlico/tasks_0.19.bb b/meta/recipes-sato/pimlico/tasks_0.19.bb
index 8326643..d79f7c8 100644
--- a/meta/recipes-sato/pimlico/tasks_0.19.bb
+++ b/meta/recipes-sato/pimlico/tasks_0.19.bb
@@ -12,4 +12,4 @@ SRC_URI[sha256sum] = "1a7fdc5f95a2193a1a25fdb13f071867fb7e42245ce19ccee4bcccb69e
 
 OWL_poky = "--with-owl"
 
-PR = "r0"
+PR = "r1"
diff --git a/meta/recipes-sato/pimlico/tasks_git.bb b/meta/recipes-sato/pimlico/tasks_git.bb
index 2cab47d..728b5e5 100644
--- a/meta/recipes-sato/pimlico/tasks_git.bb
+++ b/meta/recipes-sato/pimlico/tasks_git.bb
@@ -4,6 +4,6 @@ SRC_URI = "git://git.gnome.org/${BPN};protocol=git"
 
 SRCREV = "ea52d46d691c5fce4473ea4e24a35411381f3a65"
 PV = "0.13+git${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-sato/web/web_git.bb b/meta/recipes-sato/web/web_git.bb
index 8868bc6..c1a1334 100644
--- a/meta/recipes-sato/web/web_git.bb
+++ b/meta/recipes-sato/web/web_git.bb
@@ -2,7 +2,7 @@ LICENSE = "GPLv2"
 SECTION = "x11"
 DEPENDS = "libxml2 glib-2.0 gtk+ libglade gtkhtml2 curl gconf js libowl"
 DESCRIPTION = "Web is a multi-platform web browsing application."
-PR = "r1"
+PR = "r2"
 
 SRCREV = "96da839f65e17ecc6d5261c1d74accd88423dd7a"
 PV = "0.0+git${SRCPV}"
-- 
1.7.6



