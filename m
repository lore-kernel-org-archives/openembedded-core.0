Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RcfVV-0003fA-2G
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 16:52:06 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2011 07:45:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="97940421"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.37])
	by fmsmga001.fm.intel.com with ESMTP; 19 Dec 2011 07:45:00 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Dec 2011 15:44:07 +0000
Message-Id: <df18968dc600338cadb1dd2d62aa6b8bed911f67.1324309317.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1324309317.git.paul.eggleton@linux.intel.com>
References: <cover.1324309317.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1324309317.git.paul.eggleton@linux.intel.com>
References: <cover.1324309317.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 8/8] eds-dbus: replace o-hand example contact
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
X-List-Received-Date: Mon, 19 Dec 2011 15:52:06 -0000

Replace the OpenedHand example contact with something a bit more
up-to-date. Also add SRC_URI checksums to 2.20.0 recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../eds/eds-dbus-2.20.0/oh-contact.patch           |  149 ++++++++++++++------
 meta/recipes-sato/eds/eds-dbus/oh-contact.patch    |  149 ++++++++++++++------
 meta/recipes-sato/eds/eds-dbus_2.20.0.bb           |    5 +-
 meta/recipes-sato/eds/eds-dbus_git.bb              |    2 +-
 4 files changed, 221 insertions(+), 84 deletions(-)

diff --git a/meta/recipes-sato/eds/eds-dbus-2.20.0/oh-contact.patch b/meta/recipes-sato/eds/eds-dbus-2.20.0/oh-contact.patch
index fd83b57..cc359ca 100644
--- a/meta/recipes-sato/eds/eds-dbus-2.20.0/oh-contact.patch
+++ b/meta/recipes-sato/eds/eds-dbus-2.20.0/oh-contact.patch
@@ -1,10 +1,12 @@
+Replace the Novell sample contact with something more appropriate
+
 Upstream-Status: Inappropriate [configuration]
 
 Index: addressbook/libedata-book/ximian-vcard.h
 ===================================================================
---- addressbook/libedata-book/ximian-vcard.h	(revision 578)
-+++ addressbook/libedata-book/ximian-vcard.h	(working copy)
-@@ -1,80 +1,40 @@
+--- addressbook/libedata-book/ximian-vcard.h.orig	2008-09-10 15:26:51.000000000 +0100
++++ addressbook/libedata-book/ximian-vcard.h	2011-12-19 15:25:05.846977809 +0000
+@@ -1,80 +1,105 @@
  #define XIMIAN_VCARD \
  "BEGIN:VCARD\n" \
 -"X-EVOLUTION-FILE-AS:Novell Ximian Group\n" \
@@ -85,47 +87,112 @@ Index: addressbook/libedata-book/ximian-vcard.h
 -" euPPNZ2YadfkNsspUp1aglCU8yTyrTSNh9gbCgjfSFjCgl1YyPI8al9PbItP2WamUywkuJ5KOVE\n" \
 -" emeVEVw02ZH9H4YkEqdDYCifE4oqXbaS02lCRhIGBRRF//Z\n" \
 +"VERSION:3.0\n" \
-+"FN:OpenedHand Ltd\n" \
-+"URL:http://www.o-hand.com/\n" \
-+"EMAIL:info@openedhand.com\n" \
-+"TEL;TYPE=VOICE:+44 208 819 6559\n" \
-+"ADR;TYPE=WORK:;216 - 218 Homesdale Road;Unit R\, Homesdale Business Center;\n" \
-+" Bromley;;BR1 2QZ;United Kingdom\n" \
-+"LABEL:Unit R, Homesdale Business Center\\n216 - 218 Homesdale Road\\nBromley\\nBR1 2QZ\\nUnited Kingdom\n" \
-+"PHOTO;ENCODING=b:iVBORw0KGgoAAAANSUhEUgAAAC0AAAA\n" \
-+" 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\n" \
-+" ArmsGAAAAAElFTkSuQmCC\n" \
++"FN:Yocto Project\n" \
++"URL:http://www.yoctoproject.org/\n" \
++"EMAIL:yocto@yoctoproject.org\n" \
++"TEL;TYPE=VOICE:+00 000 000 0000\n" \
++"ADR;TYPE=HOME:;1720 Beaver Creek;Dam #4;Planet Earth\n" \
++"LABEL:1720 Beaver Creek\\nDam #4\\nPlanet Earth\n" \
++"PHOTO;ENCODING=b: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\n" \
  "END:VCARD"
 Index: addressbook/backends/file/Makefile.am
 ===================================================================
---- addressbook/backends/file/Makefile.am	(revision 578)
-+++ addressbook/backends/file/Makefile.am	(working copy)
+--- addressbook/backends/file/Makefile.am.orig	2008-09-10 15:26:50.000000000 +0100
++++ addressbook/backends/file/Makefile.am	2011-12-19 15:23:21.474975428 +0000
 @@ -1,4 +1,5 @@
  INCLUDES =						\
 +	-DCREATE_DEFAULT_VCARD \
diff --git a/meta/recipes-sato/eds/eds-dbus/oh-contact.patch b/meta/recipes-sato/eds/eds-dbus/oh-contact.patch
index 9817991..b746044 100644
--- a/meta/recipes-sato/eds/eds-dbus/oh-contact.patch
+++ b/meta/recipes-sato/eds/eds-dbus/oh-contact.patch
@@ -1,10 +1,12 @@
+Replace the Novell sample contact with something more appropriate
+
 Upstream-Status: Inappropriate [configuration]
 
 Index: addressbook/libedata-book/ximian-vcard.h
 ===================================================================
---- addressbook/libedata-book/ximian-vcard.h.orig	2010-02-05 14:57:14.000000000 +0000
-+++ addressbook/libedata-book/ximian-vcard.h	2010-02-05 14:58:14.000000000 +0000
-@@ -1,80 +1,40 @@
+--- addressbook/libedata-book/ximian-vcard.h.orig	2011-12-19 13:58:29.058859231 +0000
++++ addressbook/libedata-book/ximian-vcard.h	2011-12-19 14:41:48.678918549 +0000
+@@ -1,80 +1,105 @@
  #define XIMIAN_VCARD \
  "BEGIN:VCARD\n" \
 -"X-EVOLUTION-FILE-AS:Novell Ximian Group\n" \
@@ -85,47 +87,112 @@ Index: addressbook/libedata-book/ximian-vcard.h
 -" euPPNZ2YadfkNsspUp1aglCU8yTyrTSNh9gbCgjfSFjCgl1YyPI8al9PbItP2WamUywkuJ5KOVE\n" \
 -" emeVEVw02ZH9H4YkEqdDYCifE4oqXbaS02lCRhIGBRRF//Z\n" \
 +"VERSION:3.0\n" \
-+"FN:OpenedHand Ltd\n" \
-+"URL:http://www.o-hand.com/\n" \
-+"EMAIL:info@openedhand.com\n" \
-+"TEL;TYPE=VOICE:+44 208 819 6559\n" \
-+"ADR;TYPE=WORK:;216 - 218 Homesdale Road;Unit R\, Homesdale Business Center;\n" \
-+" Bromley;;BR1 2QZ;United Kingdom\n" \
-+"LABEL:Unit R, Homesdale Business Center\\n216 - 218 Homesdale Road\\nBromley\\nBR1 2QZ\\nUnited Kingdom\n" \
-+"PHOTO;ENCODING=b:iVBORw0KGgoAAAANSUhEUgAAAC0AAAA\n" \
-+" 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\n" \
-+" ArmsGAAAAAElFTkSuQmCC\n" \
++"FN:Yocto Project\n" \
++"URL:http://www.yoctoproject.org/\n" \
++"EMAIL:yocto@yoctoproject.org\n" \
++"TEL;TYPE=VOICE:+00 000 000 0000\n" \
++"ADR;TYPE=HOME:;1720 Beaver Creek;Dam #4;Planet Earth\n" \
++"LABEL:1720 Beaver Creek\\nDam #4\\nPlanet Earth\n" \
++"PHOTO;ENCODING=b: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\n" \
  "END:VCARD"
 Index: addressbook/backends/file/Makefile.am
 ===================================================================
---- addressbook/backends/file/Makefile.am.orig	2010-02-05 14:57:14.000000000 +0000
-+++ addressbook/backends/file/Makefile.am	2010-02-05 14:59:10.000000000 +0000
+--- addressbook/backends/file/Makefile.am.orig	2011-12-19 13:58:28.954859229 +0000
++++ addressbook/backends/file/Makefile.am	2011-12-19 13:58:31.442859286 +0000
 @@ -2,6 +2,7 @@
  
  libebookbackendfile_la_CPPFLAGS = \
diff --git a/meta/recipes-sato/eds/eds-dbus_2.20.0.bb b/meta/recipes-sato/eds/eds-dbus_2.20.0.bb
index d129a64..d13476b 100644
--- a/meta/recipes-sato/eds/eds-dbus_2.20.0.bb
+++ b/meta/recipes-sato/eds/eds-dbus_2.20.0.bb
@@ -6,13 +6,16 @@ LICENSE = "LGPLv2 & LGPLv2+"
 
 DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libiconv zlib libsoup libglade"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/mobile/2.23/2.23.92/sources/evolution-data-server-dbus-${PV}.tar.gz  \
            file://oh-contact.patch;striplevel=0 \
            file://no_iconv_test.patch \
            file://iconv-detect.h"
 
+SRC_URI[md5sum] = "69dc1e4eed6041a91aec76eacf7f17fb"
+SRC_URI[sha256sum] = "aa537293c10153dad91aa31b50547e867946d7b937414f2ef734e40967e6ab0a"
+
 S = "${WORKDIR}/evolution-data-server-dbus-${PV}"
 
 inherit autotools pkgconfig
diff --git a/meta/recipes-sato/eds/eds-dbus_git.bb b/meta/recipes-sato/eds/eds-dbus_git.bb
index 9424353..6a8436c 100644
--- a/meta/recipes-sato/eds/eds-dbus_git.bb
+++ b/meta/recipes-sato/eds/eds-dbus_git.bb
@@ -12,7 +12,7 @@ DEPENDS = "intltool-native glib-2.0 gtk+ gconf dbus db gnome-common virtual/libi
 
 SRCREV = "7337d11aed576e7caaa12b4e881ad8d33668799f"
 PV = "2.30+git${SRCPV}"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "git://git.gnome.org/evolution-data-server;protocol=git \
            file://oh-contact.patch;striplevel=0 \
-- 
1.7.5.4



