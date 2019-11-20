Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id AC3BE7F832
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 13:45:21 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t1so28216922wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2019 05:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Knm6iiQHfSIiFd0z1HAKyH67PmpSJM2aTBk8qHUUaxE=;
	b=mUrP0psTm5QldIdUfQL7g5Eja0r2LYPjwz2MhO3mWzm1CSd1W+Ws2lC3r4CLZVJfdA
	5mx055jqJ9qQknYcpY693JLqAqEXaslySNMaxVl5IRnfXBcqHey5tfB3QuOdpf19oyBe
	oZE+eTy/REmc+R6X2MNXd1u+wy2Fvkayjgl2MjEThIn6ls/YWGvcGRm6JII3lTwHPYl5
	MEtkkNlIX6e90zizkEzSSaww7T++96xzN4YYn3tYi5Nv+Y2NWJe+3pcvPao0LZqwRysu
	gQywHUu2/S6ZDQBaQcpLpKk/1eE2gWKQmZ1vf4K7puPe7nX6/hxaugJ6q3fTDoyk9zh1
	gW0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Knm6iiQHfSIiFd0z1HAKyH67PmpSJM2aTBk8qHUUaxE=;
	b=O5dpHGTif9ZNrunVfM/EVx/4+dvv3J1Ky3on+lt8GSwmJeDrf2x8Nn9WRRIaGhdTVi
	wAoV+ZoQS1vzqj/bj/iyUg0U14H1SZq7IRGESnUMtn8DrLOjasPsBmh7YOpHCC4gk6/Y
	s50RBWlRD03Xm7G9rtHoqR+eR+h30W4pgpWz3aB7aFbn325kN/+bfgtwRPfhUNyrjBAk
	hbC5XqCC34CjdrbNUDEJEwr2/oYuo7N9WsGTISsmh4XC1V678H+PAL0xFwhxvKD0oj1m
	AnAv/z1q8fTF9iu6ykfVN7m10XDsV0QfX8Jd+u+ijcB9+mB7xIema5x0h5hu3p5XUrHP
	N5kQ==
X-Gm-Message-State: APjAAAUkiliWMhUIt75fQKhp80lFykTtrVzXvBULZMjpbtqyDAaCYkoq
	JupaRt3kw6O60YHqmLhbr+7G1Sdh
X-Google-Smtp-Source: APXvYqwFm3cklgCYUbnusb5lzFcLzHh6d2HAEiletzJLGmr22Vrh74Eew6jSngy2bVI8YZZTMGB4bw==
X-Received: by 2002:adf:b686:: with SMTP id j6mr3456823wre.186.1574257522266; 
	Wed, 20 Nov 2019 05:45:22 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	o189sm7031771wmo.23.2019.11.20.05.45.19
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 20 Nov 2019 05:45:21 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Nov 2019 14:44:53 +0100
Message-Id: <20191120134455.125118-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191120134455.125118-1-alex.kanavin@gmail.com>
References: <20191120134455.125118-1-alex.kanavin@gmail.com>
Subject: [PATCH 09/11] p11-kit: convert to meson
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
X-List-Received-Date: Wed, 20 Nov 2019 13:45:23 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../p11-kit/p11-kit_0.23.18.1.bb              | 26 +++----------------
 1 file changed, 3 insertions(+), 23 deletions(-)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
index 9193a06ea80..dbf8fa2c468 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.18.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
 
-inherit autotools gettext pkgconfig gtk-doc
+inherit meson gettext pkgconfig gtk-doc
 
 DEPENDS = "libtasn1 libffi"
 
@@ -10,30 +10,10 @@ SRC_URI = "git://github.com/p11-glue/p11-kit"
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
+PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
 
-# p11-kit relies on these two being copied from source tree
-# instead of being regenerated by gtkdoc-scan, but doesn't setup
-# dependencies correctly when there is a parallel build. Let's pre-copy
-# them instead.
-do_compile_prepend () {
-        cp ${S}/doc/manual/p11-kit-overrides.txt ${S}/doc/manual/p11-kit-sections.txt ${B}/doc/manual/
-}
+GTKDOC_MESON_OPTION = 'gtk_doc'
 
 FILES_${PN} += " \
     ${libdir}/p11-kit-proxy.so \
-- 
2.17.1


