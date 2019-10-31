Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 862197F955
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 09:37:09 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 11so5167275wmk.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 02:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6gx8u0uMl4d1t0bk6ujXvmBqyoUvbvMC8zgAG4aC/eU=;
	b=tFsrxP0ui2pWEvFW5mC6qJ5BxFCa9BqnA1wOfypHES9/yCNsJTAmik+o7YkWA+KhjP
	FTOF6UZyBHkiCDKQapTuMeOhiZO6LhvmMG31HpoC02QJEbMMUZKr7q0NZloLxuO9nVVb
	jAn8gh/28eyQUUaFjx9Qoo0HW2GtiWPP4/OIvcCmpL4zRLO+PaT5jufg8PFfUqt+RVzH
	ZzeuBaocP2iubjCkL/LncY+qUxQFjhs71Q/zp7GOJcWezr2EWYQxUKAZfHGmTwY5HfeG
	Re6l5CDs+e1GbxgOxBgz5N1MZ8JKX7DfHqKDHxdedjCGLFoTu84EfA8YLP41ozHqknWW
	WRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6gx8u0uMl4d1t0bk6ujXvmBqyoUvbvMC8zgAG4aC/eU=;
	b=ZsY1Rzv2CioJj5tRfLYDLL/s9UAbhn7JZ3Fve6n2QB5bCuGoQmDRDVx+/u/vo3y9eJ
	mlkxb9lVd9uRJZK0gEIGYeD47+bjPSYMgGF2qrbQ/Dx6ahU6P7eRCLIydz4HTQkpHtgo
	3kDYAo6XXYKC9238AlNvg18GidQzZAPIokX7sf0+orrBQV87Ye2gO/xR9bhUi/hKjvAH
	Yt0GJhcMp+RsyD4si+Z39A5YZi6riTRJ6RmORk8vVuCBaYZdKTyAGg88gqph9YD1uItK
	SEIxpRehRBevAiHQjBOghE7q6RMj87/Gx29t398LcYg5YVgnBM1yFOKJbDNcKA5cqKUe
	WeLA==
X-Gm-Message-State: APjAAAX3LDYuSbBStnMZbc7Eg2SjhI/GuoMl6ZBvxEzZfJn2f+/pPREG
	kDVQcqp4XQeQ6NjGxuL6wj1qp5OxZys=
X-Google-Smtp-Source: APXvYqxfWn4PHUi9ZWBxSOKMfZmsbsx03dsLLv+FjmMya+UUAx880q9rw2Jmg7uAMViBWRq54Q2LlA==
X-Received: by 2002:a7b:c305:: with SMTP id k5mr4393690wmj.90.1572514629914;
	Thu, 31 Oct 2019 02:37:09 -0700 (PDT)
Received: from localhost.localdomain ([91.217.168.176])
	by smtp.gmail.com with ESMTPSA id
	b186sm2950263wmb.21.2019.10.31.02.37.08
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 31 Oct 2019 02:37:09 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 10:36:55 +0100
Message-Id: <20191031093655.14852-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191031093655.14852-1-alex.kanavin@gmail.com>
References: <20191031093655.14852-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/6] libmodulemd-v1: update to 1.8.16
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
X-List-Received-Date: Thu, 31 Oct 2019 09:37:09 -0000

Upstream added support for optional docs, so
0001-Do-not-generate-gtkdoc-or-python-bindings.patch is replaced
with an option to disable gtk-doc (as the modulemd feature is not used
in oe-core anyway).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...t-generate-gtkdoc-or-python-bindings.patch | 60 -------------------
 .../libmodulemd/libmodulemd-v1_git.bb         |  7 +--
 2 files changed, 3 insertions(+), 64 deletions(-)
 delete mode 100644 meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-Do-not-generate-gtkdoc-or-python-bindings.patch

diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-Do-not-generate-gtkdoc-or-python-bindings.patch b/meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-Do-not-generate-gtkdoc-or-python-bindings.patch
deleted file mode 100644
index d950ad5867e..00000000000
--- a/meta/recipes-devtools/libmodulemd/libmodulemd-v1/0001-Do-not-generate-gtkdoc-or-python-bindings.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 71c51206e037c0bb5759e01b307b7ce1d5934703 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 6 Sep 2019 17:07:00 +0200
-Subject: [PATCH] Do not generate gtkdoc or python bindings
-
-All of these really need a configuration option.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- meson.build          | 12 ------------
- modulemd/meson.build |  8 --------
- 2 files changed, 20 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 155c9e7..fe35d5e 100644
---- a/meson.build
-+++ b/meson.build
-@@ -51,25 +51,13 @@ gnome = import('gnome')
- pkg = import('pkgconfig')
- gobject = dependency('gobject-2.0')
- yaml = dependency('yaml-0.1')
--gtkdoc = dependency('gtk-doc')
- 
- glib_prefix = dependency('glib-2.0').get_pkgconfig_variable('prefix')
--glib_docpath = join_paths(glib_prefix, 'share', 'gtk-doc', 'html')
- 
- sh = find_program('sh')
- sed = find_program('sed')
- test = find_program('test')
- 
--ret = run_command ([test, '-e', join_paths(glib_docpath, 'glib/index.html')])
--if ret.returncode() != 0
--  error('Missing documentation for GLib.')
--endif
--
--ret = run_command ([test, '-e', join_paths(glib_docpath, 'gobject/index.html')])
--if ret.returncode() != 0
--  error('Missing documentation for GObject.')
--endif
--
- python_name = get_option('python_name')
- 
- if python_name != ''
-diff --git a/modulemd/meson.build b/modulemd/meson.build
-index 9a164b5..349c982 100644
---- a/modulemd/meson.build
-+++ b/modulemd/meson.build
-@@ -523,11 +523,3 @@ configure_file(
-   configuration : xcdata
- )
- 
--gnome.gtkdoc(
--    'modulemd-1.0',
--    install_dir: 'modulemd-1.0',
--    src_dir : './modulemd',
--    main_xml : 'modulemd-docs.xml',
--    install : true,
--)
--
diff --git a/meta/recipes-devtools/libmodulemd/libmodulemd-v1_git.bb b/meta/recipes-devtools/libmodulemd/libmodulemd-v1_git.bb
index 9790470f4fe..5409051d79f 100644
--- a/meta/recipes-devtools/libmodulemd/libmodulemd-v1_git.bb
+++ b/meta/recipes-devtools/libmodulemd/libmodulemd-v1_git.bb
@@ -4,18 +4,17 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=25a3927bff3ee4f5b21bcb0ed3fcd6bb"
 
 SRC_URI = "git://github.com/fedora-modularity/libmodulemd;protocol=https;branch=1.x-maint \
            file://0001-spec_tmpl.sh-use-bin-sh-not-usr-bin-sh.patch \
-           file://0001-Do-not-generate-gtkdoc-or-python-bindings.patch \
            "
 
-PV = "1.8.15"
-SRCREV = "2d461725f781c6fdcf32893d8dcfa40bcef8dda5"
+PV = "1.8.16"
+SRCREV = "d0dcf7b373b3cf85cd39eb3bc23d31e06195a75a"
 UPSTREAM_CHECK_GITTAGREGEX = "libmodulemd-(?P<pver>1.*\d)"
 
 S = "${WORKDIR}/git"
 
 inherit meson gobject-introspection
 
-EXTRA_OEMESON = "-Ddeveloper_build=false"
+EXTRA_OEMESON = "-Ddeveloper_build=false -Dwith_docs=false"
 
 DEPENDS += "glib-2.0 libyaml glib-2.0-native python3"
 
-- 
2.17.1


