Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3742B7EB61
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 13:25:11 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id u8so8977874wmm.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2019 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jc6GfBDq3RsPJI5IVVADqBw3hZTqZI4vYPGBLeE2RiU=;
	b=QF0irkqCrBkGXAFGmsFm+2XtfeRz6PQXu/P3mq0u8bQIFzNWJ/Qc3NdjwybzKZ8okv
	6WNk6+H1v8SJigFonnsbqe3F5V3mox3etYd6J2fdaF1cVdyuEhCtOZyIRWMWvja8Z/zG
	8Dghv9px/Rlf/9mvTZUJCILsXBsPa0ROakK1mg89TsWNQMVjI9gWx0BzB5zM/M0GtamW
	ZN3TR50mNgVLi3ejudIPR5vb+7jqDTEyF/cpq57RGz4okam4I+D9nwCaQeRYaDV8DIkM
	7FjdEK55GvG/6snx117el72hUkqZ38GOr4Bn7jkhhcCTV+BahyhckhIch+BRKD+2oY9g
	iv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jc6GfBDq3RsPJI5IVVADqBw3hZTqZI4vYPGBLeE2RiU=;
	b=olGAHeftlDH+pPYzBK/AS/CD73mxi3BzK1g6qsTZtahsij0CYVK8X8gkrv/ydPqX70
	AQtiS+CEXxUenXH4mZH4zxFCiAA4U9pglfQYRMMy5hIH/kudemJrp7JYnNb82LPe7oqS
	bXbD7OMfRZmg9PwYOIGeo2H9BOLmFcIBUPgSEIOoXIhxYN6EcL6vCe18maj+JRB9fqWj
	T1Ht965WxOWo2HZrB/S+nG9oaIzzPzg07eqp100DVI2qW38Zgd+yQUEtuAJncLum0gPK
	iQ7hXXbqTlooo0rdHv1gkvR/mLOWrBWgF66Qbrzy2uTRzvmhrEOebbDeg4P80BVpcQOg
	cZcw==
X-Gm-Message-State: APjAAAV92ZEihjQovAkXuPpTV3yZAC5A2srRsoTv/WLcq2JubXhlxf3P
	f2TnV8gmTk3G62fn/HnNNCKagAhO
X-Google-Smtp-Source: APXvYqyZToSLP+7hY5kyW8Gf5WPRUdY3EgsBAb0cunxtJybI5iiN7dpAbL7aEDKAu1Osf2yOXYz1IQ==
X-Received: by 2002:a1c:7217:: with SMTP id n23mr7455976wmc.47.1561728311687; 
	Fri, 28 Jun 2019 06:25:11 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id z6sm2158338wrw.2.2019.06.28.06.25.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 28 Jun 2019 06:25:11 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2019 15:24:57 +0200
Message-Id: <20190628132457.39465-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190628132457.39465-1-alex.kanavin@gmail.com>
References: <20190628132457.39465-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/6] gtk-doc: correct the style.css permissions
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
X-List-Received-Date: Fri, 28 Jun 2019 13:25:11 -0000

style.css was set to write-only during build which means it wasn't actually
installed or packaged (with only webkitgtk producing a build failure!),
which in turn means generated documentation was broken.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...rectly-set-permissions-on-file-to-be.patch | 23 +++++++++++++++++++
 .../gtk-doc/files/pkg-config-native.patch     |  2 +-
 meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb    |  1 +
 3 files changed, 25 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gtk-doc/files/0001-highlight.py-correctly-set-permissions-on-file-to-be.patch

diff --git a/meta/recipes-gnome/gtk-doc/files/0001-highlight.py-correctly-set-permissions-on-file-to-be.patch b/meta/recipes-gnome/gtk-doc/files/0001-highlight.py-correctly-set-permissions-on-file-to-be.patch
new file mode 100644
index 00000000000..bb8f55c41d0
--- /dev/null
+++ b/meta/recipes-gnome/gtk-doc/files/0001-highlight.py-correctly-set-permissions-on-file-to-be.patch
@@ -0,0 +1,23 @@
+From 63bc4cd1ce2d918c6566a4e0c7d830713432fc82 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 28 Jun 2019 13:08:24 +0200
+Subject: [PATCH] highlight.py: correctly set permissions on file to be written
+
+Upstream-Status: Backport [https://github.com/GNOME/gtk-doc/commit/12d9a698fb58f3d1a840d3bfc0d15a3a9f57afc1]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gtkdoc/highlight.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/gtkdoc/highlight.py b/gtkdoc/highlight.py
+index 8f6e470..82e11e8 100644
+--- a/gtkdoc/highlight.py
++++ b/gtkdoc/highlight.py
+@@ -47,6 +47,6 @@ def highlight_code(code, lang='c'):
+ 
+ 
+ def append_style_defs(css_file_name):
+-    os.chmod(css_file_name, stat.S_IWRITE)
++    os.chmod(css_file_name, 0o644)
+     with open(css_file_name, 'at', newline='\n', encoding='utf-8') as css:
+         css.write(HTML_FORMATTER.get_style_defs())
diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index 3e973a16eb0..5674a38abd5 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,4 +1,4 @@
-From a3f69f2ed45efbdaee47c2dde4df3d78323300e5 Mon Sep 17 00:00:00 2001
+From 31254fac614bb6ee28cf6fdd514a9563a5d781a8 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb
index f16847e40c1..fce03295341 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
            file://no-clobber.patch \
+           file://0001-highlight.py-correctly-set-permissions-on-file-to-be.patch \
            "
 SRC_URI_append_class-native = " file://pkg-config-native.patch"
 
-- 
2.17.1


