Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U7REx-0000bP-Nh
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 14:59:11 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Feb 2013 05:41:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,688,1355126400"; d="scan'208";a="287168677"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga002.jf.intel.com with ESMTP; 18 Feb 2013 05:42:33 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Feb 2013 15:43:35 +0200
Message-Id: <1361195015-26113-1-git-send-email-constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
Subject: [PATCH v2] gnome-common: upgrade to 3.7.4
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
X-List-Received-Date: Mon, 18 Feb 2013 13:59:12 -0000

- gnome-common finally is GPLv2+
- omf.patch is included in the new version

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch    | 15 ---------------
 .../{gnome-common_2.28.0.bb => gnome-common_3.7.4.bb}     | 13 +++++--------
 2 files changed, 5 insertions(+), 23 deletions(-)
 delete mode 100644 meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch
 rename meta/recipes-gnome/gnome/{gnome-common_2.28.0.bb => gnome-common_3.7.4.bb} (48%)

diff --git a/meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch b/meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch
deleted file mode 100644
index 0f9b13c..0000000
--- a/meta/recipes-gnome/gnome/gnome-common-2.28.0/omf.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Pending
-
---- gnome-common-2.4.0/doc-build/omf.make	2003-05-24 08:16:25.000000000 -0700
-+++ gnome-common-2.4.0.new/doc-build/omf.make	2004-11-15 14:01:12.185155192 -0700
-@@ -43,7 +43,9 @@
- install-data-hook-omf:
- 	$(mkinstalldirs) $(DESTDIR)$(omf_dest_dir)
- 	for file in $(omffile); do \
--		$(INSTALL_DATA) $$file.out $(DESTDIR)$(omf_dest_dir)/$$file; \
-+		if [ -f $$file.out ]; then \
-+			$(INSTALL_DATA) $$file.out $(DESTDIR)$(omf_dest_dir)/$$file; \
-+		fi; \
- 	done
- 	-scrollkeeper-update -p $(DESTDIR)$(scrollkeeper_localstate_dir) -o $(DESTDIR)$(omf_dest_dir)
- 
diff --git a/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb b/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
similarity index 48%
rename from meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
rename to meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
index e094ccf..ebf343e 100644
--- a/meta/recipes-gnome/gnome/gnome-common_2.28.0.bb
+++ b/meta/recipes-gnome/gnome/gnome-common_3.7.4.bb
@@ -3,19 +3,16 @@ HOMEPAGE = "http://www.gnome.org/"
 BUGTRACKER = "https://bugzilla.gnome.org/"
 
 LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SECTION = "x11/gnome"
-PR = "r3"
+PR = "r0"
 inherit gnome allarch
 
-# The omf.make file failed if scrollkeeper doesn't happen to be
-# installed
+GNOME_COMPRESS_TYPE = "xz"
 
-SRC_URI += "file://omf.patch"
-
-SRC_URI[archive.md5sum] = "30daabb0ca4898fea2647999e7813e8f"
-SRC_URI[archive.sha256sum] = "dd4817103d23745d00c735dd137951552ba7b576cb8f68e6a529d06661e9b6a1"
+SRC_URI[archive.md5sum] = "974cd54626f1d1787481288ef26bd4ba"
+SRC_URI[archive.sha256sum] = "2af2d97010d2a9aeb3b99dd2ce07d1ef023e15a27b412ffe4f067f016ff7117b"
 
 EXTRA_AUTORECONF = ""
 DEPENDS = ""
-- 
1.7.11.7



