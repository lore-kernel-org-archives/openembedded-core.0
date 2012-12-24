Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tn4HP-0006yq-Gd
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 10:25:05 +0100
Received: from mail-we0-f198.google.com ([74.125.82.198])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 24 Dec 2012 01:10:11 -0800
Received: by mail-we0-f198.google.com with SMTP id r1so4416279wey.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Dec 2012 01:10:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:date:from:to:cc:message-id:in-reply-to
	:references:subject:x-mailer:mime-version:content-type
	:content-transfer-encoding:content-disposition:x-gm-message-state;
	bh=FktNffs5wWfL9GsOav8LqenK47yoxr9IzsZJb1BxRKY=;
	b=dRfLplojtrHnjhB6Jn31T2KYl50903UrvkhhZ8fGG8rcZNJVHhXuUs2s+OA+d/3Xdw
	F0ZTodeOhsi+FWqeD6LkeTWBeps7mvzDQDkY870q6l59RppSPxLeVAdUX93gSLhB8exd
	JpdsXdmZqs+i3N9xtXiP07BZwoopDX8+3kqjfI87a3XnepkDil7dSXLQqQCLkdO+2iOs
	EJsamo2lmgPcgJGGTtZlp08jTIXPNVK8a9AFZGlKZd7UIdG3YTuX1kwZewRcLmIWCf0a
	dFatk1EssjcsV1SaMBphoVjOer4VLgUQvwiVKkL63h+iOzn4K/guSW8mgBSQWAXYK/P2
	TVuw==
X-Received: by 10.180.90.106 with SMTP id bv10mr33218124wib.12.1356340210404; 
	Mon, 24 Dec 2012 01:10:10 -0800 (PST)
X-Received: by 10.180.90.106 with SMTP id bv10mr33218109wib.12.1356340210183; 
	Mon, 24 Dec 2012 01:10:10 -0800 (PST)
Received: from [192.168.1.13] (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id s16sm37548137wii.0.2012.12.24.01.10.08
	(version=SSLv3 cipher=OTHER); Mon, 24 Dec 2012 01:10:08 -0800 (PST)
Date: Mon, 24 Dec 2012 09:10:11 +0000
From: Ross Burton <ross.burton@intel.com>
To: Constantin Musca <constantinx.musca@intel.com>
Message-ID: <4BD5ED8AEDE64D59A298CAFA9B1D3BAB@intel.com>
In-Reply-To: <a248e5ee5a24449477456470912a96c0f032c022.1356337650.git.constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
	<a248e5ee5a24449477456470912a96c0f032c022.1356337650.git.constantinx.musca@intel.com>
X-Mailer: sparrow 1.6.4 (build 1178)
MIME-Version: 1.0
X-Gm-Message-State: ALoCoQnxvkfqull9rhCUiPKFAM9HFSp5jPizOP2FIKmUMDVtfpl7ifJbs9rQeMZDoUc8MXadXKeNDy3Z3YlHl3Fk5Uv0eeVhQxsEgW0Us6eIpnhUdggyRZ5ZOfCTaGzeMw+taqvm+t5tiowKKv5gtNaxd7BcF0Z07eQND0yifg5kMoecZWs3+S5Xj572bvvvQtdu9eJzzVMo
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/15] gthumb: remove recipe
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
X-List-Received-Date: Mon, 24 Dec 2012 09:25:07 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Just in case people think Constantin has gone remove mad :) 

Signed-off-by: Ross Burton <ross.burton@intel.com> 


On Monday, 24 December 2012 at 08:34, Constantin Musca wrote:

> Part of the sato trimming process
> 
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com (mailto:constantinx.musca@intel.com)>
> ---
> meta/recipes-gnome/gthumb/files/parallel.patch | 158 ---------------------
> meta/recipes-gnome/gthumb/gthumb_2.12.4.bb | 27 ----
> .../packagegroups/packagegroup-core-x11-sato.bb | 1 -
> 3 files changed, 186 deletions(-)
> delete mode 100644 meta/recipes-gnome/gthumb/files/parallel.patch
> delete mode 100644 meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
> 
> diff --git a/meta/recipes-gnome/gthumb/files/parallel.patch b/meta/recipes-gnome/gthumb/files/parallel.patch
> deleted file mode 100644
> index 20ce5c5..0000000
> --- a/meta/recipes-gnome/gthumb/files/parallel.patch
> +++ /dev/null
> @@ -1,158 +0,0 @@
> -From 34969cde1dcb7740b4a7c3b6e3d04d481e5980b5 Mon Sep 17 00:00:00 2001
> -From: Ross Burton <ross.burton@intel.com (mailto:ross.burton@intel.com)>
> -Date: Tue, 31 Jul 2012 17:26:27 +0100
> -Subject: [PATCH] build: Fix parallel build problems with enum generation
> -
> -This is a backport from a patch against master.
> -
> -Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=680925]
> ----
> - extensions/file_tools/Makefile.am (http://Makefile.am) | 10 ++++------
> - extensions/importer/Makefile.am (http://Makefile.am) | 10 ++++------
> - extensions/pixbuf_savers/Makefile.am (http://Makefile.am) | 10 ++++------
> - gthumb/Makefile.am (http://Makefile.am) | 10 ++++------
> - 4 files changed, 16 insertions(+), 24 deletions(-)
> -
> -diff --git a/extensions/file_tools/Makefile.am (http://Makefile.am) b/extensions/file_tools/Makefile.am (http://Makefile.am)
> -index 7785eff..d70a8a5 100644
> ---- a/extensions/file_tools/Makefile.am (http://Makefile.am)
> -+++ b/extensions/file_tools/Makefile.am (http://Makefile.am)
> -@@ -24,17 +24,16 @@ HEADER_FILES = \
> - gth-file-tool-undo.h \
> - preferences.h
> - 
> --enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
> -+enum-types.h: $(HEADER_FILES)
> - $(AM_V_GEN)( $(GLIB_MKENUMS) \
> - --fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
> - --fprod "/* enumerations from \"@filename@\" */\n" \
> - --vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
> - --ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
> - $^> xgen-$(@F) \
> -- && (cmp -s xgen-$(@F) enum-types.h || cp xgen-$(@F) enum-types.h ) \
> -- && rm -f xgen-$(@F) )
> -+ && mv -f xgen-$(@F) enum-types.h )
> - 
> --enum-types.c: $(HEADER_FILES) enum-types.h
> -+enum-types.c: $(HEADER_FILES)
> - $(AM_V_GEN)( $(GLIB_MKENUMS) \
> - --fhead "#include <glib-object.h>\n" \
> - --fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
> -@@ -42,8 +41,7 @@ enum-types.c: $(HEADER_FILES) enum-types.h
> - --vprod " { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
> - --vtail " { 0, NULL, NULL }\n };\n etype = g_@type@_register_static (\"@EnumName@\", values);\n }\n return etype;\n}\n" \
> - $^> xgen-$(@F) \
> -- && (cmp -s xgen-$(@F) enum-types.c || cp xgen-$(@F) enum-types.c ) \
> -- && rm -f xgen-$(@F) )
> -+ && mv -f xgen-$(@F) enum-types.c )
> - 
> - libfile_tools_la_SOURCES = \
> - $(ENUM_TYPES) \
> -diff --git a/extensions/importer/Makefile.am (http://Makefile.am) b/extensions/importer/Makefile.am (http://Makefile.am)
> -index 29e7f2c..07c1eba 100644
> ---- a/extensions/importer/Makefile.am (http://Makefile.am)
> -+++ b/extensions/importer/Makefile.am (http://Makefile.am)
> -@@ -14,17 +14,16 @@ HEADER_FILES = \
> - preferences.h \
> - utils.h
> - 
> --gth-import-enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
> -+gth-import-enum-types.h: $(HEADER_FILES)
> - $(AM_V_GEN)( $(GLIB_MKENUMS) \
> - --fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
> - --fprod "/* enumerations from \"@filename@\" */\n" \
> - --vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
> - --ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
> - $^> xgen-$(@F) \
> -- && (cmp -s xgen-$(@F) gth-import-enum-types.h || cp xgen-$(@F) gth-import-enum-types.h ) \
> -- && rm -f xgen-$(@F) )
> -+ && mv -f xgen-$(@F) gth-import-enum-types.h )
> - 
> --gth-import-enum-types.c: $(HEADER_FILES) gth-import-enum-types.h
> -+gth-import-enum-types.c: $(HEADER_FILES)
> - $(AM_V_GEN)( $(GLIB_MKENUMS) \
> - --fhead "#include <glib-object.h>\n" \
> - --fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
> -@@ -32,8 +31,7 @@ gth-import-enum-types.c: $(HEADER_FILES) gth-import-enum-types.h
> - --vprod " { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
> - --vtail " { 0, NULL, NULL }\n };\n etype = g_@type@_register_static (\"@EnumName@\", values);\n }\n return etype;\n}\n" \
> - $^> xgen-$(@F) \
> -- && (cmp -s xgen-$(@F) gth-import-enum-types.c || cp xgen-$(@F) gth-import-enum-types.c ) \
> -- && rm -f xgen-$(@F) )
> -+ && mv -f xgen-$(@F) gth-import-enum-types.c )
> - 
> - libimporter_la_SOURCES = \
> - $(ENUM_TYPES) \
> -diff --git a/extensions/pixbuf_savers/Makefile.am (http://Makefile.am) b/extensions/pixbuf_savers/Makefile.am (http://Makefile.am)
> -index bfe9f34..4764c32 100644
> ---- a/extensions/pixbuf_savers/Makefile.am (http://Makefile.am)
> -+++ b/extensions/pixbuf_savers/Makefile.am (http://Makefile.am)
> -@@ -10,17 +10,16 @@ ENUM_TYPES = \
> - HEADER_FILES = \
> - preferences.h
> - 
> --enum-types.h: $(HEADER_FILES) $(GLIB_MKENUMS)
> -+enum-types.h: $(HEADER_FILES)
> - $(AM_V_GEN)( $(GLIB_MKENUMS) \
> - --fhead "#ifndef ENUM_TYPES_H\n#define ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
> - --fprod "/* enumerations from \"@filename@\" */\n" \
> - --vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
> - --ftail "G_END_DECLS\n\n#endif /* ENUM_TYPES_H */" \
> - $^> xgen-$(@F) \
> -- && (cmp -s xgen-$(@F) enum-types.h || cp xgen-$(@F) enum-types.h ) \
> -- && rm -f xgen-$(@F) )
> -+ && mv -f xgen-$(@F) enum-types.h )
> - 
> --enum-types.c: $(HEADER_FILES) enum-types.h
> -+enum-types.c: $(HEADER_FILES)
> - $(AM_V_GEN)( $(GLIB_MKENUMS) \
> - --fhead "#include <glib-object.h>\n" \
> - --fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
> -@@ -28,8 +27,7 @@ enum-types.c: $(HEADER_FILES) enum-types.h
> - --vprod " { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
> - --vtail " { 0, NULL, NULL }\n };\n etype = g_@type@_register_static (\"@EnumName@\", values);\n }\n return etype;\n}\n" \
> - $^> xgen-$(@F) \
> -- && (cmp -s xgen-$(@F) enum-types.c || cp xgen-$(@F) enum-types.c ) \
> -- && rm -f xgen-$(@F) )
> -+ && mv -f xgen-$(@F) enum-types.c )
> - 
> - libpixbuf_savers_la_SOURCES = \
> - $(ENUM_TYPES) \
> -diff --git a/gthumb/Makefile.am (http://Makefile.am) b/gthumb/Makefile.am (http://Makefile.am)
> -index e9e385e..2f14e03 100644
> ---- a/gthumb/Makefile.am (http://Makefile.am)
> -+++ b/gthumb/Makefile.am (http://Makefile.am)
> -@@ -296,17 +296,16 @@ gthumb_CFLAGS = \
> - -DGTHUMB_EXTENSIONS_DIR=\"$(extensions_dir)\" \
> - $(NULL)
> - 
> --gth-enum-types.h: $(PUBLIC_HEADER_FILES) $(GLIB_MKENUMS)
> -+gth-enum-types.h: $(PUBLIC_HEADER_FILES)
> - $(AM_V_GEN)( $(GLIB_MKENUMS) \
> - --fhead "#ifndef GTH_ENUM_TYPES_H\n#define GTH_ENUM_TYPES_H\n\n#include <glib-object.h>\n\nG_BEGIN_DECLS\n" \
> - --fprod "/* enumerations from \"@filename@\" */\n" \
> - --vhead "GType @enum_name@_get_type (void);\n#define GTH_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n" \
> - --ftail "G_END_DECLS\n\n#endif /* GTH_ENUM_TYPES_H */" \
> - $^> xgen-$(@F) \
> -- && (cmp -s xgen-$(@F) gth-enum-types.h || cp xgen-$(@F) gth-enum-types.h ) \
> -- && rm -f xgen-$(@F) )
> -+ && mv -f xgen-$(@F) gth-enum-types.h )
> - 
> --gth-enum-types.c: $(PUBLIC_HEADER_FILES) gth-enum-types.h
> -+gth-enum-types.c: $(PUBLIC_HEADER_FILES)
> - $(AM_V_GEN)( $(GLIB_MKENUMS) \
> - --fhead "#include <glib-object.h>\n" \
> - --fprod "\n/* enumerations from \"@filename@\" */\n#include \"@filename@\"" \
> -@@ -314,8 +313,7 @@ gth-enum-types.c: $(PUBLIC_HEADER_FILES) gth-enum-types.h
> - --vprod " { @VALUENAME@, \"@VALUENAME@\", \"@valuenick@\" }," \
> - --vtail " { 0, NULL, NULL }\n };\n etype = g_@type@_register_static (\"@EnumName@\", values);\n }\n return etype;\n}\n" \
> - $^> xgen-$(@F) \
> -- && (cmp -s xgen-$(@F) gth-enum-types.c || cp xgen-$(@F) gth-enum-types.c ) \
> -- && rm -f xgen-$(@F) )
> -+ && mv -f xgen-$(@F) gth-enum-types.c )
> - 
> - gth-marshal.h: gth-marshal.list $(GLIB_GENMARSHAL)
> - $(AM_V_GEN)( $(GLIB_GENMARSHAL) $(srcdir)/gth-marshal.list --header --prefix=gth_marshal > $@ )
> --- 
> -1.7.10.4
> -
> diff --git a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb b/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
> deleted file mode 100644
> index 0414386..0000000
> --- a/meta/recipes-gnome/gthumb/gthumb_2.12.4.bb
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -DESCRIPTION = "gThumb is an image viewer and browser for the GNOME Desktop"
> -SECTION = "x11/gnome"
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
> -DEPENDS = "glib-2.0 gtk+ libxml2 gnome-doc-utils libunique gconf libpng gstreamer jpeg tiff gst-plugins-base"
> -
> -PR = "r4"
> -
> -EXTRA_OECONF = "--disable-gnome-keyring --disable-libsoup --disable-exiv2 --disable-clutter"
> -
> -inherit gnome pkgconfig
> -
> -SRC_URI[archive.md5sum] = "97fc13221b0c5d80c27a2e25a3a3ac6f"
> -SRC_URI[archive.sha256sum] = "cf809695230ab8892a078be454a42ade865754c72ec1da7c3d74d4310de54f1d"
> -
> -SRC_URI += "file://parallel.patch"
> -
> -do_install_append () {
> - rm ${D}${libdir}/${BPN}/extensions/*.a
> -}
> -
> -FILES_${PN} += "${datadir}/icons"
> -FILES_${PN} += "${libdir}/${BPN}/extensions/*.so \
> - ${libdir}/${BPN}/extensions/*.extension"
> -FILES_${PN}-dev += "${libdir}/${BPN}/extensions/*.la"
> -FILES_${PN}-dbg += "${libdir}/${BPN}/extensions/.debug/"
> -
> diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> index f2997a7..057be24 100644
> --- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> +++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
> @@ -53,7 +53,6 @@ WEB ?= ""
> 
> SUMMARY_${PN}-apps = "Sato desktop - applications"
> RDEPENDS_${PN}-apps = "\
> - gthumb \
> leafpad \
> gaku \
> x11vnc \
> -- 
> 1.7.11.7
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org (mailto:Openembedded-core@lists.openembedded.org)
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core





