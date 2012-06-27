Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sjlcg-0003Gz-F0
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jun 2012 08:21:07 +0200
Received: by mail-pz0-f47.google.com with SMTP id h21so894934dal.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Jun 2012 23:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=yTVjqafP9aT9NZ3OFm0MwxUlrDIDu7vtPfBN9F7UDco=;
	b=ziCfGjkDGTujWeZ1ROLfBUCOWF9/makzv1BKT3LV096xHDaIL64hZ37m4AmQlQ5bNz
	VADhw2iO0/2hOHZAjakaXaUjrHEn4evZ3v6JwVThVwvM7hrtCksH9azO1+8n0XUStBL4
	Y98KcwryjrFjwCu2w5Sht6UiTupXFxKtKHYcklwVWq5c/q3PyJikkZGFbjxNpWmZbN85
	HF+t2WbGSg/DP8EnsMM8rc60QDdnlm3TtNYTByyA/1vnlGEndNtAm3CnFVeYPMNINvI9
	yPaU3KIEzO8cjCuAby5gC7LvG9PPMdI8wsPTiEhFeeoEFLFSWGC2I14cGjyd8sO9f4WG
	p/wg==
Received: by 10.68.239.164 with SMTP id vt4mr58454792pbc.166.1340777415335;
	Tue, 26 Jun 2012 23:10:15 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id ob9sm14168304pbb.28.2012.06.26.23.10.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 26 Jun 2012 23:10:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jun 2012 23:09:51 -0700
Message-Id: <cacaf93401cea92e0d8185557131e55e730ce6c2.1340777116.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <55a411d66293b6d2196e98376f0fb9e4487b4bdf.1340777116.git.raj.khem@gmail.com>
References: <55a411d66293b6d2196e98376f0fb9e4487b4bdf.1340777116.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340777115.git.raj.khem@gmail.com>
References: <cover.1340777115.git.raj.khem@gmail.com>
Subject: [PATCH 7/7] glib-2.0: Add missing dependency on virtual/libiconv
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
X-List-Received-Date: Wed, 27 Jun 2012 06:21:09 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb |    2 +-
 meta/recipes-core/glib-2.0/glib.inc           |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
index 6f89f56..08aa897 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.3.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r1"
+PR = "r2"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 1dbd538..e7d547a 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
 
-DEPENDS = "glib-2.0-native gtk-doc-native zip"
+DEPENDS = "glib-2.0-native gtk-doc-native zip virtual/libiconv"
 DEPENDS_virtclass-native = "gtk-doc-native pkgconfig-native gettext-native"
 DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
 PACKAGES =+ "${PN}-utils "
-- 
1.7.9.5



