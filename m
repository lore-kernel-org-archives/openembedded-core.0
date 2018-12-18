Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 729197C0D1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:30:23 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id l9so16506061wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:30:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TgFQTRqjB8/THvcgS6vMEZa0ZkvaMVuwj/SAqjW1x50=;
	b=AGLJ37gjUZPL1MsP3K7k9mfj4Rx5lVkMdg0b81C/fZYqsPNcfVQcI0vBRXXnatOcXR
	8fM8+Eo6H1LuyaicfyOOvIQy7bAtXk2NOnJLsQaQBxqy+kj8KhfmAqHgEfA74jOVZ79a
	MHdkOCnkHhHsedkNsUBaVC6+B1Bn/5diqhK3zCZ/mZHAUzI3Z1hw16BYJ/QBn655LkAi
	i5no7cq/AZO2IXIHNvDO2y+0X86VCoSTXS3yRDbk7A3SkMP8jTD64yOM257yIsYRkpI1
	EunioQcOHgEndQlu+9yeXS7Zc0MjehDbJWCKjAY4+SrCNSbJpC4R7/c22A9o5JqJRMye
	VfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=TgFQTRqjB8/THvcgS6vMEZa0ZkvaMVuwj/SAqjW1x50=;
	b=LlueivFM+trbg5Sk8p+d44TtvJqaSCTMEzNL7F8TPw9+pocC6wRL23Nz0df/AVyh3h
	EViO0ig204fF8RXMAv2L3JqEd0o5StkS+cPgJKKmtRV/j4v1LyQ7kFjBdqwkh4PuTpk7
	di++JCzmw2yU1VZSZBpj+AWudIs1xiY5XK4iZUDN3d4Fa0bW5n+hLKCx2Socp5CUusBs
	eOAjSeyR/t6L39SGZOIAO+HrEGdqDYeWOgP7AWPfZK8Abqz0PKqwlwOnr2OgfDmBDpt7
	0IVUm6R/aE7lGBP6BUN+aWImL320sXcGSCcsbhc594K2B9lpAfwPl6dTiiZG7OB+t86W
	fkoA==
X-Gm-Message-State: AA+aEWbnTjtKzMsZR+6NYRkS+3xWGAieJxBJGQRi6iUUhO/vEkWgSAUb
	sreg9kX8wp8K5jUGIfJFlSGdxQxm
X-Google-Smtp-Source: AFSGD/V2OMF4XoHwjLt4MA8w/SotpxXALiaBPUt7BPQC5upsmWdSGxN24D/fQE8KoYrjwqYyFs457A==
X-Received: by 2002:adf:93e2:: with SMTP id 89mr15954005wrp.129.1545150623719; 
	Tue, 18 Dec 2018 08:30:23 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f18sm2237849wrs.92.2018.12.18.08.30.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 08:30:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 17:30:02 +0100
Message-Id: <20181218163005.1330-10-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218163005.1330-1-alex.kanavin@gmail.com>
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
Subject: [PATCH 10/13] gobject-introspection: upgrade 1.58.1 -> 1.58.2
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
X-List-Received-Date: Tue, 18 Dec 2018 16:30:23 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-Relocate-the-repository-directory-for-native-builds.patch | 2 +-
 ...ntrospection_1.58.1.bb => gobject-introspection_1.58.2.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.58.1.bb => gobject-introspection_1.58.2.bb} (98%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index fdcef3c7140..4017d445f75 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 2882e091e7b905441beef51dbed968f4dd7ffd7c Mon Sep 17 00:00:00 2001
+From 47a596165e253edb45eb48a35e50f488182e13fd Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.2.bb
similarity index 98%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.2.bb
index f4f41b61c0f..242899accc4 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.58.2.bb
@@ -23,8 +23,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0001-Port-cross-compilation-support-to-meson.patch \
            "
 
-SRC_URI[md5sum] = "101b04fb0184f9a0c718d450c056d68c"
-SRC_URI[sha256sum] = "4954681fa5c5ed95451d914de89de1263a5b35158b1ded1a8b870042c0d0df89"
+SRC_URI[md5sum] = "8479d6c543173721ce948484d0cd1d64"
+SRC_URI[sha256sum] = "2a5e0f69459af7ca4c41b8f4e19d9c80ddf877834bb0e7fdd420e2495ae2eda8"
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.17.1


