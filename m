Received: from gate.crashing.org ([63.228.1.57]
	ident=[U2FsdGVkX18ofd8Fwgn71fyw9PAnj3YPnn5L6qPXIRc=])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <galak@kernel.crashing.org>) id 1QqrEe-0004BG-3H
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Aug 2011 20:41:04 +0200
Received: from localhost (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.13.8) with ESMTP id p79IaZfp029934
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Aug 2011 13:36:35 -0500
From: Kumar Gala <galak@kernel.crashing.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Aug 2011 13:36:32 -0500
Message-Id: <1312914992-18260-5-git-send-email-galak@kernel.crashing.org>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1312914992-18260-4-git-send-email-galak@kernel.crashing.org>
References: <1312914992-18260-1-git-send-email-galak@kernel.crashing.org>
	<1312914992-18260-2-git-send-email-galak@kernel.crashing.org>
	<1312914992-18260-3-git-send-email-galak@kernel.crashing.org>
	<1312914992-18260-4-git-send-email-galak@kernel.crashing.org>
Subject: [PATCH 4/4] gnome-doc-utils: respect python-dir setting EXTRA_OECONF
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
X-List-Received-Date: Tue, 09 Aug 2011 18:41:04 -0000

Don't just assign but append to EXTRA_OECONF so we maintain python-dir
setting fo EXTRA_OECONF.

This fixes issue if libdir is set to something like '/usr/lib64'.

Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils.inc b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
index bd7c615..b92b565 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils.inc
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils.inc
@@ -4,7 +4,7 @@ DEPENDS_virtclass-native = "libxml2-native libxslt-native intltool-native"
 
 inherit gnome gettext python-dir
 
-EXTRA_OECONF = "--disable-scrollkeeper"
+EXTRA_OECONF += "--disable-scrollkeeper"
 
 do_install_append() {
 	mkdir -p  ${D}${datadir}/xml/gnome/xslt/
diff --git a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
index 1ec1076..c65cf64 100644
--- a/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
+++ b/meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb
@@ -1,7 +1,7 @@
 require gnome-doc-utils.inc
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=eb723b61539feef013de476e68b5c50a \
 		    file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343"
-PR = "r4"
+PR = "r5"
 
 SRC_URI += "file://xsltproc_nonet.patch \
 	    file://use-usr-bin-env-for-python-in-xml2po.patch"
-- 
1.7.3.4



