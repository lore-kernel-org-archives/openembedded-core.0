Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id A25FE7F9AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 13:12:11 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id g17so3111821wro.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Nov 2019 05:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bGnofXxd8EOmVb0YDfPnqvzlT0uGiX+zNuvxbompkMM=;
	b=pOgRReCjB2JwTicWedbs0vSARP0XG55zqqfDV5WYHgOX9gtv42v9CM8to7tl1IR4Fj
	w8Xad+pZkH7h40vIbCAFuNaSHFtb1LVjwVb1nZC/dtpsrrhaGTOxpMrfybTPp/Z5jlic
	rGWwcDFjAJ/PnUWWStTaOxYacNKqWoLoUY3BiS8UmHiTuHgN4Kto4pyk2zoJ+/eXPN9u
	J+a7e4F9bs1dY+Coav4K0UVdZmpme0yl5IYXrexDAqMiBEYbPRF7dX4DdETlYo/Ztvj3
	cACWToy6R3IvfiAdq5Dz1UytoXUADDt0A4Hy6DFrWw2BKpCMb00oPPm8ra8LfIPBN40+
	t9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bGnofXxd8EOmVb0YDfPnqvzlT0uGiX+zNuvxbompkMM=;
	b=k9KGCw9C7+s/EHqPG+KTqyU1NhmbA5k00kgln53NJScqIbGfpB1qwaLqx0YHzfncCl
	YgwqRhfUSLb/B8pfNzC2LsIiP6eSWVNv/r9oKPC2B1FduM8f+K1a3sWYFXsJhQ0RM9c3
	Po3Ml2/Q1u56G/uYBj4vnZDg6CUt+ZIVZYNOloGfPZsDDOqz/ebPJMpCEU/UtyG0PYij
	eq5Sh/r2g5Hsb8Uet5mbjOJjQjzgRvAwe70SaKUXWHT9te/uojyo85XvxDeEp1vL4OlJ
	4BXMQyZvqVsQSdD7g9MYMG6bHdUbiNfBUbmX3zfd0TSXzswotizvtzC0acu8oreA0cKR
	LKYw==
X-Gm-Message-State: APjAAAXvyZv8WflZo5GT1tyUj3Dw++GUi3ZnwH0EnTCquIcmIL9GXYlX
	2x8jUkqXG1WdGdvGCXAb8mvAIpsA
X-Google-Smtp-Source: APXvYqxAer79MGLKzGhTpK8Zg0PRqggzbEToZx0DCv0hURFnDitlOtrhFA8hCfzo4zsexsI7rPFn3Q==
X-Received: by 2002:adf:e40e:: with SMTP id g14mr33307638wrm.264.1575033131751;
	Fri, 29 Nov 2019 05:12:11 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id v17sm637224wrt.91.2019.11.29.05.12.09
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 29 Nov 2019 05:12:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Nov 2019 14:11:44 +0100
Message-Id: <20191129131152.128311-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191129131152.128311-1-alex.kanavin@gmail.com>
References: <20191129131152.128311-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/15] p11-kit: convert to meson
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
X-List-Received-Date: Fri, 29 Nov 2019 13:12:13 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../p11-kit/p11-kit_0.23.18.1.bb              | 30 ++++---------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
index 9193a06ea80..7037f6a639f 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
@@ -2,38 +2,20 @@ SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
 
-inherit autotools gettext pkgconfig gtk-doc
+inherit meson gettext pkgconfig gtk-doc
 
 DEPENDS = "libtasn1 libffi"
 
+DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
+
 SRC_URI = "git://github.com/p11-glue/p11-kit"
 SRCREV = "b0ebe7555c291808db29377ba79cb8326301f0a6"
 S = "${WORKDIR}/git"
 
-AUTOTOOLS_AUXDIR = "${S}/build/litter"
-
 PACKAGECONFIG ??= ""
-PACKAGECONFIG[trust-paths] = "--with-trust-paths=/etc/ssl/certs/ca-certificates.crt,--without-trust-paths,,ca-certificates"
-
-# This recipe does not use the standard gtk-doc m4 macros, and so the ./configure flags
-# that control gtk-doc build are non-standard
-EXTRA_OECONF_prepend_class-target = "${@bb.utils.contains('GTKDOC_ENABLED', 'True', '--enable-doc --enable-doc-html --disable-doc-pdf', \
-                                                                                    '--disable-doc', d)} "
-
-# When building native recipes, disable gtkdoc, as it is not necessary,
-# pulls in additional dependencies, and makes build times longer
-EXTRA_OECONF_prepend_class-native = "--disable-doc "
-EXTRA_OECONF_prepend_class-nativesdk = "--disable-doc "
-
-UNKNOWN_CONFIGURE_WHITELIST_append = " --enable-gtk-doc-html --disable-gtk-doc-pdf --enable-gtk-doc --disable-gtk-doc"
-
-# p11-kit relies on these two being copied from source tree
-# instead of being regenerated by gtkdoc-scan, but doesn't setup
-# dependencies correctly when there is a parallel build. Let's pre-copy
-# them instead.
-do_compile_prepend () {
-        cp ${S}/doc/manual/p11-kit-overrides.txt ${S}/doc/manual/p11-kit-sections.txt ${B}/doc/manual/
-}
+PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
+
+GTKDOC_MESON_OPTION = 'gtk_doc'
 
 FILES_${PN} += " \
     ${libdir}/p11-kit-proxy.so \
-- 
2.17.1


