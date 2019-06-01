Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id 5FAF67E65C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 11:26:29 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id z23so7446147wma.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 04:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ND+BLJ4ScZj/4Y5d7u1VO1liK+zul77wEn3Rra1vQ90=;
	b=byTpILRTUCTKILVDG+bWVuICcRdS6y4AvhKkFSIH+p9XOea/8r7L8HFo8ZiBsQJZoK
	fOMUdtGIiQpjZSqNudSX4LZ5liFoavtj+FSCF1Wzl0PEAGRn6dQ7FkLX2YiOUBf66XLz
	Gk7ZaVbn3TRp5zPZtfIACaFdFjvMbj0jH7RqDOMRE6HL9fC2o9C8C11DAAz2mMecNKXd
	TLieBes5C142h+MpPK0PqnDHNM6IgddSm9SqH+6baQszS05dE+CMjkV4VQq3wZB3EKtf
	dPgUfBJYB6eMUFQJhfRZnH4wxz/m3YfVqyxwVuPNpXQ0T+BGIAv8d5hhv10iDIRcNE3+
	F6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ND+BLJ4ScZj/4Y5d7u1VO1liK+zul77wEn3Rra1vQ90=;
	b=ewyIJNcstIhLWmCiLq0EBeb21G/FNWE3Xfv02ouRBF9vWehsCajkjHtwpAsiMrufOg
	zRECRQOAxu4XPhgD8sbcxQkBNCHk2nBmTszO42UFtc6W6G/kncAGDSP3MJpbjioQO37a
	4gZCfSiLTBWIr8wr/uhhG3axlYs/ScNG3953rWUG+AKvm5RIW36MzRuvj8C8OZX8+hfK
	zEXsQPcwaGV7ieTCcM4/awluMutvxrag1eLVIwN6urE8AhypHt+ONy/6LsXDyxHRmXks
	eypJxolc8Is9117i8Tl+AnSRPuO/RhkRbyN0NnWOVDaTM2Pc+SSfc4jpMVLI6MXB8mc/
	aGQw==
X-Gm-Message-State: APjAAAVM97Qw4ZHsmuWd1e2H9LezqCLfLGE8/PqDsxEAnLFZFokun47Q
	DBK/uVSF0bXqZBx0uX1+j9/b4pyBJxg=
X-Google-Smtp-Source: APXvYqw1ZIMuaP7Hs0OdmwLsDLGZ4DBDpCRyIaydH3Ic5OjetTZrilxjy32CtekYuHJMZ7x5L0KOUw==
X-Received: by 2002:a1c:ab42:: with SMTP id u63mr8913531wme.130.1559388389878; 
	Sat, 01 Jun 2019 04:26:29 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y2sm16270606wra.58.2019.06.01.04.26.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jun 2019 04:26:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 13:26:20 +0200
Message-Id: <20190601112623.80424-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190601112623.80424-1-alex.kanavin@gmail.com>
References: <20190601112623.80424-1-alex.kanavin@gmail.com>
Subject: [PATCH 2/5] gtk-doc: upgrade 1.29 -> 1.30
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
X-List-Received-Date: Sat, 01 Jun 2019 11:26:29 -0000

Source-highlight support has been replaced upstream with python3-pygments.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch    | 6 +++---
 .../gtk-doc/{gtk-doc_1.29.bb => gtk-doc_1.30.bb}            | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-gnome/gtk-doc/{gtk-doc_1.29.bb => gtk-doc_1.30.bb} (87%)

diff --git a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
index 9b128e1ce12..3e973a16eb0 100644
--- a/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
+++ b/meta/recipes-gnome/gtk-doc/files/pkg-config-native.patch
@@ -1,4 +1,4 @@
-From 04af15322f677db42ecc2acc465334a04de9a871 Mon Sep 17 00:00:00 2001
+From a3f69f2ed45efbdaee47c2dde4df3d78323300e5 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Mon, 5 Sep 2016 22:25:44 +0100
 Subject: [PATCH] Use native pkg-config when looking for gtk-doc.
@@ -7,10 +7,10 @@ Upstream-Status: Inappropriate
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 
 ---
- gtk-doc.m4 | 7 ++++++-
+ buildsystems/autotools/gtk-doc.m4 | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
 
-diff --git a/gtk-doc.m4 b/gtk-doc.m4
+diff --git a/buildsystems/autotools/gtk-doc.m4 b/buildsystems/autotools/gtk-doc.m4
 index 2d12f01..e5afc3f 100644
 --- a/buildsystems/autotools/gtk-doc.m4
 +++ b/buildsystems/autotools/gtk-doc.m4
diff --git a/meta/recipes-gnome/gtk-doc/gtk-doc_1.29.bb b/meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb
similarity index 87%
rename from meta/recipes-gnome/gtk-doc/gtk-doc_1.29.bb
rename to meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb
index 2c4ee175a95..f16847e40c1 100644
--- a/meta/recipes-gnome/gtk-doc/gtk-doc_1.29.bb
+++ b/meta/recipes-gnome/gtk-doc/gtk-doc_1.30.bb
@@ -15,11 +15,11 @@ PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "api-documentation",
 # into its scripts. This means that target gtk-doc package is broken;
 # hopefully no one minds because its scripts are not used for anything during build
 # and shouldn't be used on targets.
-PACKAGECONFIG[working-scripts] = "--with-highlight=source-highlight,--with-highlight=no,libxslt-native xmlto-native source-highlight-native python3-six"
+PACKAGECONFIG[working-scripts] = ",,libxslt-native xmlto-native python3-six python3-pygments"
 PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,glib-2.0"
 
-SRC_URI[archive.md5sum] = "df26a38c209b3d7358f26268fcbdb9e3"
-SRC_URI[archive.sha256sum] = "14578e002496567276d310a62c9ffd6c56ee8806ce5079ffb0b81c4111f586b1"
+SRC_URI[archive.md5sum] = "1045ba29ca0693ced2045523407aae4c"
+SRC_URI[archive.sha256sum] = "a4f6448eb838ccd30d76a33b1fd095f81aea361f03b12c7b23df181d21b7069e"
 SRC_URI += "file://0001-Do-not-hardocode-paths-to-perl-python-in-scripts.patch \
            file://0001-Do-not-error-out-if-xsltproc-is-not-found.patch \
            file://conditionaltests.patch \
-- 
2.17.1


