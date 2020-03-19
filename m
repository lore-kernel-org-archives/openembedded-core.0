Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id EF6CA60AF7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Mar 2020 01:12:16 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id 11so261509wmo.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Mar 2020 18:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=lJUUFMX3pqPeKqz0MDeWBmJqEPa9h7jxealWzWBZxlY=;
	b=n2zXuGvTkV+bRQBjTiW74zstA4tMoTq9hqwBCxOwET6dmEcd9zwKrUadTjVNnLFAc9
	URwV/kkLqsz2xP8xmnZ62ECoubJiU4DI1MLch7IYU3ipx5Ren/wOJdc6TyW4lgbkZff/
	k+Pnz2gPGG7O9ZuGQFt6Fov6a0ZXO282xCpg3SkEi/iO142XTk28+DydsPa/6J6DkmWL
	eXHRSJ2v/UQ/r+YqApUTdgfs/3MOSaVKRCEqSqIDY/nJPTAu3R729qoo3wI67xBnMjpG
	52It0nfOV+vGYWrV/GzKVcH4YXXqOT/9qXr898BoOsFfauYEl98wSc5LVETg5EhqqVPa
	356w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=lJUUFMX3pqPeKqz0MDeWBmJqEPa9h7jxealWzWBZxlY=;
	b=CgHuhC/9QoQ/il0NhU24PZYHHZdwyqJ5QVCFle1H+NDmtVwt7OADuLqwFgeBt9+W+6
	QJe47esKVBkFzIvlx+m7kvt9mI48178hQQy8C5qJ0qYv4KmP+22tpdLaYqtSLAX/kxtp
	lv4wZV7cSAzqBdEYy/N3wOq/Yl0sd+P4Jfn6PYhL8hDqNtaZXfrspjkfLyrTY0cL7jCj
	Vs4Gsd5+tgvDm/9/AqF8RrXvSUtQpG+/m6xy1Im4k1Zr00+pOYcUYN/hiZIl9K6LoIsd
	QdEBffK+AJAcqV7bXK2iMOEQpT66J9MYsCcVUNS9mJQgziMOKrK+8w9yFP6+zi6djKj2
	2U4g==
X-Gm-Message-State: ANhLgQ3Sj1Vgvjk/DAYkkdT2WkRDs3ThcrIwR5csNmX39LH/3G9IEyV1
	lTKZ9l0f7g07dvUuB1P+MqcYlM2aB/8=
X-Google-Smtp-Source: ADFU+vuM4ikwgr3UaH5Bp3imL5DJn9Ptbxc2tlHJWn4p4pf6dCh+5qb7CD02HGvycgakk1QGKQw4WQ==
X-Received: by 2002:a1c:6385:: with SMTP id x127mr489159wmb.141.1584580337379; 
	Wed, 18 Mar 2020 18:12:17 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F0E8C3838FF9D0BB177A6DE.dip0.t-ipconnect.de.
	[2003:f0:7f0e:8c38:38ff:9d0b:b177:a6de])
	by smtp.gmail.com with ESMTPSA id f15sm926249wrt.9.2020.03.18.18.12.16
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Mar 2020 18:12:16 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Mar 2020 02:12:06 +0100
Message-Id: <20200319011206.14726-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200319011206.14726-1-schnitzeltony@gmail.com>
References: <20200319011206.14726-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libsecret: upgrade 0.20.1 -> 0.20.2 / port to meson
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
X-List-Received-Date: Thu, 19 Mar 2020 01:12:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From [1]:

0.20.2
 * secret-file-collection: force little-endian in GVariant [!49, #42]
 * Prefer g_info() over g_message() [!48, #40]
 * meson: Don't specify shared_library() [!47]
 * docs: Make sure to set install: true [!46]

[1] http://ftp.gnome.org/pub/gnome/sources/libsecret/0.20/libsecret-0.20.2.news

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...an-subdir-only-if-manpage-is-enabled.patch | 30 +++++++++++++++++++
 ...ibsecret_0.20.1.bb => libsecret_0.20.2.bb} | 20 ++++++++-----
 2 files changed, 42 insertions(+), 8 deletions(-)
 create mode 100644 meta/recipes-gnome/libsecret/libsecret/0001-docs-Add-man-subdir-only-if-manpage-is-enabled.patch
 rename meta/recipes-gnome/libsecret/{libsecret_0.20.1.bb => libsecret_0.20.2.bb} (59%)

diff --git a/meta/recipes-gnome/libsecret/libsecret/0001-docs-Add-man-subdir-only-if-manpage-is-enabled.patch b/meta/recipes-gnome/libsecret/libsecret/0001-docs-Add-man-subdir-only-if-manpage-is-enabled.patch
new file mode 100644
index 0000000000..f434e6ae01
--- /dev/null
+++ b/meta/recipes-gnome/libsecret/libsecret/0001-docs-Add-man-subdir-only-if-manpage-is-enabled.patch
@@ -0,0 +1,30 @@
+From a2037bfcf14a0b5b81f5160b69b5ff94a6096584 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
+Date: Thu, 19 Mar 2020 01:42:22 +0100
+Subject: [PATCH] docs: Add man subdir only if manpage is enabled
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsecret/-/merge_requests/51]
+
+Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
+---
+ docs/meson.build | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/docs/meson.build b/docs/meson.build
+index cc8d964..aa7cfbc 100644
+--- a/docs/meson.build
++++ b/docs/meson.build
+@@ -1,4 +1,6 @@
+-subdir('man')
++if with_manpage
++  subdir('man')
++endif
+ if with_gtkdoc
+   subdir('reference/libsecret')
+ endif
+-- 
+2.21.1
+
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.2.bb
similarity index 59%
rename from meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
rename to meta/recipes-gnome/libsecret/libsecret_0.20.2.bb
index 72511af02d..0effd492fd 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.1.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.2.bb
@@ -7,21 +7,25 @@ LICENSE = "LGPLv2.1"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libsecret/issues"
 LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
+GNOMEBASEBUILDCLASS = "meson"
+
 inherit gnomebase gtk-doc vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-PACKAGECONFIG[manpages] = "--enable-manpages, --disable-manpages, libxslt-native xmlto-native"
+SRC_URI[archive.md5sum] = "f24f82e49d360ff742901d6c387e2bc9"
+SRC_URI[archive.sha256sum] = "81e9143833785cdcf96c1da5d0357a8bcf0cd2b0119f15aa0cae775d1f19ffc3"
+SRC_URI += "file://0001-docs-Add-man-subdir-only-if-manpage-is-enabled.patch"
+
+GTKDOC_MESON_OPTION = 'gtk_doc'
 
-SRC_URI[archive.md5sum] = "d2dd660a8d502099317bc8af9f30302e"
-SRC_URI[archive.sha256sum] = "57f73e94ec6263a17a077fb809cf8cf424637a897a7f15b4eec42ce4aef52447"
+# gobject-introspection is mandatory and cannot be configured
+REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
+UNKNOWN_CONFIGURE_WHITELIST_append = " introspection"
+
+PACKAGECONFIG[manpages] = "-Dmanpage=true,-Dmanpage=false,libxslt-native xmlto-native"
 
 # http://errors.yoctoproject.org/Errors/Details/20228/
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_armv6 = "arm"
-
-# vapigen.m4 bundled with the tarball does not yet have our cross-compilation fixes
-do_configure_prepend() {
-    rm -f ${S}/build/m4/vapigen.m4
-}
-- 
2.21.1


