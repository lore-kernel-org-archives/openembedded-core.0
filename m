Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id C912E61227
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 19:49:31 +0000 (UTC)
Received: by mail-we0-f182.google.com with SMTP id q59so5890009wes.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 11:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+PPd1AFj+JApwjpsB8EYMkqG4mri3iN03peEL7LkfUM=;
	b=aLq0u5nwLS0fLfywXtm5g3RmfTlTumJEa9NAixUO99G7s+6faR8eIwnEwwXlGYVeFc
	eu7QLD2jLbvfqEgFigIQss8DlSzpkuDvo0FaM0mieqN4oYdAXU5fLknxhlUqV2zeXNL4
	fIy72k+jHY4WjrYIE2aaLrmNER4w/B4nSRqJXdpC8ttIH8OIZKoEWaeEWaoBieI9247B
	fk/eBxXbiR/v3IDeTWqh9sU4Mt/D584qcdR2x0S//JgDr0jfeEBqo5kOS32+6KYCxAOm
	oIbkEvSmqbWHvzZ7ZtaAeQrna3hipeA1JLVV45JcFvvQ6yuuvUcSKad+x8ow5+cqCuYJ
	ZGdQ==
X-Gm-Message-State: ALoCoQld5dTt67emqtHCFHVsLURyGHiOZvLP2oMDcn0U1mUQaIpTsFsO2glZr2S4UnHlhJO0MtPd
X-Received: by 10.180.12.130 with SMTP id y2mr19773390wib.44.1385495371048;
	Tue, 26 Nov 2013 11:49:31 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id f11sm46512647wic.4.2013.11.26.11.49.29
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 26 Nov 2013 11:49:30 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Nov 2013 19:49:21 +0000
Message-Id: <1385495362-20784-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1385495362-20784-1-git-send-email-ross.burton@intel.com>
References: <1385495362-20784-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] librsvg: upgrade to 2.40.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Nov 2013 19:49:32 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/librsvg/librsvg/local-m4.patch  |   32 --------------------
 .../{librsvg_2.40.0.bb => librsvg_2.40.1.bb}       |   17 +++++------
 2 files changed, 8 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-gnome/librsvg/librsvg/local-m4.patch
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.0.bb => librsvg_2.40.1.bb} (78%)

diff --git a/meta/recipes-gnome/librsvg/librsvg/local-m4.patch b/meta/recipes-gnome/librsvg/librsvg/local-m4.patch
deleted file mode 100644
index e523076..0000000
--- a/meta/recipes-gnome/librsvg/librsvg/local-m4.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-This patch is required to make autoreconf use the local macros (so that it can
-autoreconf without vala being installed).
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 6c3b8eee243204678574e162b7d480f6f83b71e6 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Germ=C3=A1n=20Poo-Caama=C3=B1o?= <gpoo@gnome.org>
-Date: Tue, 29 Oct 2013 13:05:39 -0700
-Subject: [PATCH] build: Use local macros to detect vala
-
-Fixes build when vala < 0.19 is present.
----
- Makefile.am |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index d95f008..e881100 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -3,7 +3,7 @@ SUBDIRS = . gdk-pixbuf-loader tests tools doc
- NULL =
- BUILT_SOURCES =
- 
--ACLOCAL_AMFLAGS = ${ACLOCAL_FLAGS}
-+ACLOCAL_AMFLAGS = ${ACLOCAL_FLAGS} -I m4
- 
- lib_LTLIBRARIES = librsvg-@RSVG_API_MAJOR_VERSION@.la
- 
--- 
-1.7.10.4
-
diff --git a/meta/recipes-gnome/librsvg/librsvg_2.40.0.bb b/meta/recipes-gnome/librsvg/librsvg_2.40.1.bb
similarity index 78%
rename from meta/recipes-gnome/librsvg/librsvg_2.40.0.bb
rename to meta/recipes-gnome/librsvg/librsvg_2.40.1.bb
index de262f0..4fc0e72 100644
--- a/meta/recipes-gnome/librsvg/librsvg_2.40.0.bb
+++ b/meta/recipes-gnome/librsvg/librsvg_2.40.1.bb
@@ -15,11 +15,10 @@ inherit autotools pkgconfig gnomebase gtk-doc pixbufcache
 GNOME_COMPRESS_TYPE = "xz"
 
 SRC_URI += "file://gtk-option.patch \
-            file://local-m4.patch \
             file://vapigen.m4"
 
-SRC_URI[archive.md5sum] = "e16a84e9a86a18e5ca6ba95c512db6c6"
-SRC_URI[archive.sha256sum] = "8f7db31df235813dbd035888035cf862d682e7cc5706c4e7ec05750d3f64a2f9"
+SRC_URI[archive.md5sum] = "a31eb5d66c3fe94d888a6b17a287ea42"
+SRC_URI[archive.sha256sum] = "8813b4fe776d5e7acbce28bacbaed30ccb0cec3734eb3632c711a16ebe2961d7"
 
 EXTRA_OECONF = "--disable-introspection --disable-vala"
 
@@ -29,13 +28,13 @@ PACKAGECONFIG[gdkpixbuf] = "--enable-pixbuf-loader,--disable-pixbuf-loader,gdk-p
 # GTK+ test application (rsvg-view)
 PACKAGECONFIG[gtk] = "--with-gtk3,--without-gtk3,gtk+3"
 
-# 2.40.1 should ship the tarball with local m4 macros, but until then drop a
-# vapigen in there so we don't need to build vala to configure.
+# The tarball doesn't ship with macros, so drop a vapigen in there so we don't
+# need to build vala to configure.
 do_configure_prepend() {
-	if test ! -e ${S}/m4/vapigen.m4; then
-		mkdir --parents ${S}/m4
-		mv ${WORKDIR}/vapigen.m4 ${S}/m4/
-	fi
+       if test ! -e ${S}/m4/vapigen.m4; then
+               mkdir --parents ${S}/m4
+               mv ${WORKDIR}/vapigen.m4 ${S}/m4/
+       fi
 }
 
 do_install_append() {
-- 
1.7.10.4


