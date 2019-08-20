Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
	[209.85.128.42])
	by mail.openembedded.org (Postfix) with ESMTP id 01C657ECB9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 15:32:32 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id v15so3019616wml.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2019 08:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=7ZLmBLuzLarDRYz8MluFtUAxHBhA7Xc6tZy3sMMw7cM=;
	b=hI+rLHJro7t7ls9XlIvGX/Y4fQz+AP9+IJ9XeFMfJt4KUoP7iZZrn4lX6vxqVXRfw3
	0OAeOp9119SxDLEMetID177pbcQRzrdRF7/fm0Medubc5mM4e9+0OUyOfIbzFLPhHsuP
	F1watlTO8NDL0O5NhzaLmcc1o6hxrgkQ0xB3B3ONlIh1togyNN7OsSG8QazMXk2ZobCh
	6YzKgSoHepI3segxvDK6DrGnxcJ3GiSGLQqg6gTfOlyPP9M0YAlnR0WAiqcndLBWDHK0
	Do2Qa3UNZBBHL9Ikyvdl5bcgwzJtNGJkZz9EbDYQU6gkJn8cntrCKm4m8EFL2HxWWMP4
	Vd1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=7ZLmBLuzLarDRYz8MluFtUAxHBhA7Xc6tZy3sMMw7cM=;
	b=OzYNWAYqUnhmH+O+wf5oX+izAHfKGH93LiMYP6UMnvGmKIhlOvAGDPtjD1rujPjjtG
	j+IocqF1h/4MPKuUIuG/qsrhDlqZ3kzNOoZHsoyIaXsZ+Wgu9+l0n4s09Y+fmL0CDprW
	+YJvogt1O0Gxua6yJTh4kFsBBSK8nbRYUwmQSa1u45klL+VpCPV0yZhKgE54eDysFxDF
	g91QZbpqChmhc1tgXffBGnRhMrVXomR5nQAfB8bMRnB4Dg1BJ9oRrMfnM1xZEQylohVg
	bE9VGu6Xkyl+CXmnB+P/LR2nMkBh9QRUXj/QhD7oFF3x6kyMb1P1zBPcKAvbjaKr5+lY
	rqcg==
X-Gm-Message-State: APjAAAWPSFpcuBH83CAjnFmt7ARBgk1aC0a+/PcKca0gXMDGDaGdmCPb
	FQVrVLX9crSNwgzcz/l3aNE8gJlF+cQ=
X-Google-Smtp-Source: APXvYqx1gyCVjF/VqbIpyoIU//MMFwRg5BQEh5W140TfCbk8dPOjxwL1mp0hDtRJTIZXcTSQ4caGMQ==
X-Received: by 2002:a7b:ce0b:: with SMTP id m11mr610707wmc.151.1566315152557; 
	Tue, 20 Aug 2019 08:32:32 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id 6sm466700wmf.23.2019.08.20.08.32.31
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 20 Aug 2019 08:32:32 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2019 17:32:15 +0200
Message-Id: <20190820153219.62435-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190820153219.62435-1-alex.kanavin@gmail.com>
References: <20190820153219.62435-1-alex.kanavin@gmail.com>
Subject: [PATCH 08/12] gtk-doc: upgrade 1.30 -> 1.31
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
X-List-Received-Date: Tue, 20 Aug 2019 15:32:33 -0000

Drop backported patch.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...rectly-set-permissions-on-file-to-be.patch | 23 -------------------
 .../gtk-doc/files/pkg-config-native.patch     |  2 +-
 .../{gtk-doc_1.30.bb => gtk-doc_1.31.bb}      |  5 ++--
 3 files changed, 3 insertions(+), 27 deletions(-)
 delete mode 100644 meta/recipes-gnome/gtk-doc/files/0001-highlight.py-correctly-set-permissions-on-file-to-be.patch
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.30.bb => gtk-doc_1.31.bb} (90%)

diff --git a/meta/recipes-gnome/gtk-doc/files/0001-highlight.py-correctly-set-permissions-on-file-to-be.patch b/meta/recipes-gnome/gtk-doc/files/0001-highlight.py-correctly-set-permissions-on-file-to-be.patch
deleted file mode 100644
index bb8f55c41d0..00000000000
--- a/meta/recipes-gnome/gtk-doc/files/0001-highlight.py-correctly-set-permissions-on-file-to-be.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From 63bc4cd1ce2d918c6566a4e0c7d830713432fc82 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 28 Jun 2019 13:08:24 +0200
-Subject: [PATCH] highlight.py: correctly set permissions on file to be written
-
-Upstream-Status: Backport [https://github.com/GNOME/gtk-doc/commit/12d9a698fb58f3d1a840d3bfc0d15a3a9f57afc1]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- gtkdoc/highlight.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/gtkdoc/highlight.py b/gtkdoc/highlight.py
-index 8f6e470..82e11e8 100644
---- a/gtkdoc/highlight.py
-+++ b/gtkdoc/highlight.py
-@@ -47,6 +47,6 @@ def highlight_code(code, lang='c'):
- 
- 
- def append_style_defs(css_file_name):
--    os.chmod(css_file_name, stat.S_IWRITE)
-+    os.chmod(css_file_name, 0o644)
-     with open(css_file_name, 'at', newline='\n', encoding='utf-8') as css:
-         css.write(HTML_FORMATTER.get_style_defs())
diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index 5674a38abd5..8c9bc954420 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,4 +1,4 @@
-From 31254fac614bb6ee28cf6fdd514a9563a5d781a8 Mon Sep 17 00:00:00 2001
+From 9537a7998a220b698b26d926a111bb400ff1ce01 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.31.bb
similarity index 90%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.31.bb
index fce03295341..4f97ce06333 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.31.bb
@@ -18,13 +18,12 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation",
 PACKAGECONFIG[working-scripts] = ",,libxslt-native xmlto-native python3-six python3-pygments"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
-SRC_URI[archive.md5sum] = "1045ba29ca0693ced2045523407aae4c"
-SRC_URI[archive.sha256sum] = "a4f6448eb838ccd30d76a33b1fd095f81aea361f03b12c7b23df181d21b7069e"
+SRC_URI[archive.md5sum] = "6239713011369a4fbdc7619350403772"
+SRC_URI[archive.sha256sum] = "a51687956d0377ac70904d03fdc73c9e116589b4a01453fa92162442b3657011"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
            file://no-clobber.patch \
-           file://0001-highlight.py-correctly-set-permissions-on-file-to-be.patch \
            "
 SRC_URI_append_class-native = " file://pkg-config-native.patch"
 
-- 
2.17.1


