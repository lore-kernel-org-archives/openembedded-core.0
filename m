Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 600457FC9A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 16:40:17 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id s14so1495881wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2019 08:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=bGnofXxd8EOmVb0YDfPnqvzlT0uGiX+zNuvxbompkMM=;
	b=aQIl0NtTAlI3ipQSK7W2DiG4lg0C6xYAgYvfu9bXMa6dFMr9iaolnRKToLBzdp+KM0
	U8mgsfm29XtPKwCq340E2rRVGIMgQ/xPEidoWlUtYHWN5zDZzMy73dZ7OCmG2o2HOUzh
	e2as1jFaj8MQmmOlYGC1ga/QFloVRUYdPJ6BpmdgG6Am/Ekmv7oXzsc3rhQu8Fi/soQU
	qmU7QtpwlWpZoR0pXOCQyxwaR9gi7uXiRomBBQz0X7NCGMioDe9LPLbZGy6B6Go87b4l
	6gyRfQ/BOm3HgkO3pA1V9ugw/tWl+zr9eeqUEIXpNU6KsFUN4CQ2yeyk/HEWge3UJTaI
	8M/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=bGnofXxd8EOmVb0YDfPnqvzlT0uGiX+zNuvxbompkMM=;
	b=mlTMtSRFhEyjCpYM6Asf0CRy/Jm+OfvYZ+r3QiNvKrj0+0tRBBz75MEF+V8DVuLL5m
	qDVoRmzTnSXjyzunJVXL1/p6sQ0/lmQoyGO02M0KVhLx4HsSkiAwnZpDJuV4IqHjZ22r
	22lOEbfv3GHCeo2sxIi67r0/ZcrsNhskwUUk8ZE5yxsAmwzJY7o8jy6/njjPKuFKyLeF
	3/H2AU1UEPFOPsCZsvdUy8tp9Fc7U2PlOxAEuJ7JKd2Uqr2PgdiJAZacGyg/CTYT6nA9
	ES0FcZNCVlZMiZHUUwk5rdq4Q55xUxoMLKZ7D3XNOQInx53uKEs1PumXtMBUFMh0TgWD
	tbpw==
X-Gm-Message-State: APjAAAWyJ+QIehEsGEwCRUAm6XwE08uOR0aWqYT/ojAT5T+VyuIKeJr7
	Aeilx0HgwkEFLpc6AqYyj/zDieqf
X-Google-Smtp-Source: APXvYqyHwfH5mTLAr6/VPq0WTTW8GwxZL8dxHyWbk4ynzNumyhwOze7Fey0S3A1Y6Z25tMXistzNSA==
X-Received: by 2002:a7b:cd83:: with SMTP id y3mr5613695wmj.168.1574872817892; 
	Wed, 27 Nov 2019 08:40:17 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id w4sm19743067wrs.1.2019.11.27.08.40.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 27 Nov 2019 08:40:17 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Nov 2019 17:39:59 +0100
Message-Id: <20191127164003.115980-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127164003.115980-1-alex.kanavin@gmail.com>
References: <20191127164003.115980-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/14] p11-kit: convert to meson
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
X-List-Received-Date: Wed, 27 Nov 2019 16:40:18 -0000

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


