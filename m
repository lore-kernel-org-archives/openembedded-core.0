Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
	[209.85.128.52])
	by mail.openembedded.org (Postfix) with ESMTP id 11B587FBAC
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 18:10:01 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id b11so8755108wmj.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Dec 2019 10:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HXr2QygjLy+RabazXmCN0MQ7yiR2dD8271/SEfzlKco=;
	b=EleBL3n7725ZxVGZf4jw2p5TIJHLG+kG+6He+P9EGAdmLbuy/IPmgVr4MLzyKrxIwY
	HWuOtQaSLcgdVT+D78IAYxW6/vK8H5EW7F7juLcPwbn1WqpdmFeTH4Tx/arjbnq805jK
	vs2PtlpyPzqxRwItKdIS2grolu6sZq9jvbBN7jjLNsJ5mFtI54n88smP9t9sRYo4pdfB
	hyE6JQI7PcZrtJTzPb7evs2enxi0YxXhPSfYtJC2xVnF+0oZWygdZWpM7/MQ3FttyCPX
	ZuUOmicrZO0bpt1jHf/hHpx8lXbzPyvY0VGgNsO2wdvJmzWoTZXcQG75Qd2ySz5TzFM0
	eHfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HXr2QygjLy+RabazXmCN0MQ7yiR2dD8271/SEfzlKco=;
	b=PKGdwhX1agV+evRTEH8bmDpVdE5gpqhNijrleq6dFCvKSBS68iE4oNL41VqcdLU1wt
	EzEQXeQSGfEz6GsZS8wVobmcysQ2MuvAWEmOVzjR5bCfGofAeTq8MC8NxhBtkeQm7Teh
	kTFFfOt/bR903FcfeYg5+fUPRvHl2sfZNeuk+MCK6BHy2iB2VdnzhNHilxhrDeovXhTh
	t6/VJnd0/sy/kV5eRB5ozNViUf/FQNZAL5cWQ/XYR/19XCvh9XvKjLxZtvD3iziVbcrx
	UmM423HEadpIBVdjyPhTUHXRYTvHojJE8Gtt7x5DvHea5M3QK2LpmqhNqYtgMZbC/GbC
	Shvw==
X-Gm-Message-State: APjAAAWcB/C9tC1RTitxQJdC1ojv2n5ku6HnQwZ2skpByd4Q2in1JwY8
	C89iTrLvxqlRPEzeSns7640OO+rz
X-Google-Smtp-Source: APXvYqwQOTZvTKFDi46PyW1FbHT3jjChHiHFmE6fkM4PSQSkWGtpjpde5976Hih5Iqclg/8C7OrM/g==
X-Received: by 2002:a7b:c24c:: with SMTP id b12mr11788646wmj.16.1575655802388; 
	Fri, 06 Dec 2019 10:10:02 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id
	v14sm17011347wrm.28.2019.12.06.10.10.01
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 06 Dec 2019 10:10:01 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 19:09:46 +0100
Message-Id: <20191206180949.59953-7-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191206180949.59953-1-alex.kanavin@gmail.com>
References: <20191206180949.59953-1-alex.kanavin@gmail.com>
Subject: [PATCH 07/10] atk: update to 2.34.1
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
X-List-Received-Date: Fri, 06 Dec 2019 18:10:02 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...able-introspection-for-cross-compile.patch | 29 -------------------
 .../atk/{atk_2.32.0.bb => atk_2.34.1.bb}      |  5 ++--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
 rename meta/recipes-support/atk/{atk_2.32.0.bb => atk_2.34.1.bb} (73%)

diff --git a/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch b/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
deleted file mode 100644
index d1b08bc04b6..00000000000
--- a/meta/recipes-support/atk/atk/0001-meson.build-enable-introspection-for-cross-compile.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 44d46baa5e1519c6c3df7e4d34fb333e247b5bc8 Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Fri, 6 Apr 2018 12:04:00 +0800
-Subject: [PATCH] meson.build: enable introspection for cross-compile
-
-It works fine in OE-core and doesn't need to be disabled. Let the user decide
-if it should be disabled or not.
-
-Upstream-Status: Pending
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
-
----
- atk/meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/atk/meson.build b/atk/meson.build
-index 0ad67e5..1d2a49c 100644
---- a/atk/meson.build
-+++ b/atk/meson.build
-@@ -137,7 +137,7 @@ libatk_dep = declare_dependency(link_with: libatk,
-                                 dependencies: glib_dep,
-                                 sources: atk_enum_h)
- 
--if not meson.is_cross_build() and get_option('introspection')
-+if get_option('introspection')
-   gnome.generate_gir(libatk,
-                      sources: atk_sources + atk_headers + [ atk_enum_h ] + [ atk_version_h ],
-                      namespace: 'Atk',
diff --git a/meta/recipes-support/atk/atk_2.32.0.bb b/meta/recipes-support/atk/atk_2.34.1.bb
similarity index 73%
rename from meta/recipes-support/atk/atk_2.32.0.bb
rename to meta/recipes-support/atk/atk_2.34.1.bb
index 67223729e93..277397c6943 100644
--- a/meta/recipes-support/atk/atk_2.32.0.bb
+++ b/meta/recipes-support/atk/atk_2.34.1.bb
@@ -14,9 +14,8 @@ DEPENDS = "gettext-native glib-2.0"
 GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
 
-SRC_URI += " file://0001-meson.build-enable-introspection-for-cross-compile.patch"
-SRC_URI[archive.md5sum] = "c10b0b2af3c199e42caa6275b845c49d"
-SRC_URI[archive.sha256sum] = "cb41feda7fe4ef0daa024471438ea0219592baf7c291347e5a858bb64e4091cc"
+SRC_URI[archive.md5sum] = "f60bbaf8bdd08b93d98736b54b2fc8e9"
+SRC_URI[archive.sha256sum] = "d4f0e3b3d21265fcf2bc371e117da51c42ede1a71f6db1c834e6976bb20997cb"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.17.1


