Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0F4337E95B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 13:25:06 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id c66so1805726wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f/S/0Hhn70UMVFmCbpX2kwUj1V4Zu4PL3OPN6sq7oeQ=;
	b=jH2Jov9/lGpbZ16elml20PHSkyvhNFEh3mZ/4vvQasAeiVW3MznfM0g5fwPONl1vvU
	QvnWaify1l2J46XMh1s11ZtO/oKWmXdD4YcCP3CcOSqrncoA6s/YLqGAydUqwKQgyMlI
	lSaXd0po/LlCjhKE27rjPFDmJdpqtcBOBOknOf8nrYQxogv1fxSXbBtHKyx/QTsBNYUR
	RphK9oaAgxRmkB46YxejIsEeCI03m8j7fEhv+UFk7h2R+Bu1/tv8ZKwH/D0LD1sipECs
	LW1VW/XuhJhu/fyotK9F/MsLCxCFTL7qFCTMzu0quy2tCteoR2be9Ir/gpKCJ21tot+j
	/zFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=f/S/0Hhn70UMVFmCbpX2kwUj1V4Zu4PL3OPN6sq7oeQ=;
	b=BTq5RI8NkZRv+2cCvMIJ4eHcSNUtUaGwU4cquzCTg0gxQhORcDj3EW7L5ruxcZzKdw
	6ZMiIR3VrFXwMK7TKTlga2XKkxtM+Ovbv4vaMzTcxbdfQbxfyPRdPLlaO97hXvVbEVCe
	bjL5UpnhluOuIq6ukd9eLNVPjVXeixsDEo04bfT/INWAhkVHsxuXhczknzDnjNBD8igm
	rpWnA/ZwWks25h2yxwgfliRCQ0W7zYtd2FX9Ea9vcyComyeYMj0W0OONxqpW+bcSFnvm
	p6X+OkKfgIm4AdlzZGD+qw3LpM/fkTS8fGYZ6WnGioYeSoQMlqj/TP/C8TBtqw6yCeVj
	hWVA==
X-Gm-Message-State: APjAAAXn17+TSWWXGmhGBZQv2Wa1MLq7bal0vBtaIpm6SlphZtdJ5cj8
	ZYMZdoGXYfehNSb3P85ORL5QQOOz5xU=
X-Google-Smtp-Source: APXvYqxNs2KZjBxgP7JZ65ShhncppwQj6CpEtYVKuXToClj+TrPZdWBj4IQIStHcvmlZePai+glM3A==
X-Received: by 2002:a1c:a508:: with SMTP id o8mr2644964wme.49.1560950707610;
	Wed, 19 Jun 2019 06:25:07 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id q1sm1588953wmq.25.2019.06.19.06.25.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 06:25:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:24:50 +0200
Message-Id: <20190619132450.130226-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190619132450.130226-1-alex.kanavin@gmail.com>
References: <20190619132450.130226-1-alex.kanavin@gmail.com>
Subject: [PATCH 9/9] gobject-introspection: update to 1.60.2
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
X-List-Received-Date: Wed, 19 Jun 2019 13:25:07 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...-Relocate-the-repository-directory-for-native-builds.patch | 2 +-
 ...ntrospection_1.60.1.bb => gobject-introspection_1.60.2.bb} | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-gnome/gobject-introspection/{gobject-introspection_1.60.1.bb => gobject-introspection_1.60.2.bb} (98%)

diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
index a4f45a142dd..f92e7694376 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Relocate-the-repository-directory-for-native-builds.patch
@@ -1,4 +1,4 @@
-From 8f01066e935a7323ff6e53f27ed1b5fb74fa11eb Mon Sep 17 00:00:00 2001
+From 7c8f25a05757174f6271fb0547422e6698f3c181 Mon Sep 17 00:00:00 2001
 From: Sascha Silbe <x-yo17@se-silbe.de>
 Date: Fri, 8 Jun 2018 13:55:10 +0200
 Subject: [PATCH] Relocate the repository directory for native builds
diff --git a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.1.bb b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.2.bb
similarity index 98%
rename from meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.1.bb
rename to meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.2.bb
index 40beab0c413..f46053f4432 100644
--- a/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.1.bb
+++ b/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.60.2.bb
@@ -21,8 +21,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${@oe.utils.trim_version("${PV}", 2)}/${BPN}-$
            file://0001-meson.build-disable-tests-when-cross-compiling.patch \
            "
 
-SRC_URI[md5sum] = "46fc8a98f6563e64947ac3d574632525"
-SRC_URI[sha256sum] = "d844d1499ecd36f3ec8a3573616186d36626ec0c9a7981939e99aa02e9c824b3"
+SRC_URI[md5sum] = "57c1c5dcf3d0a9aa73d06c2d5e6960d7"
+SRC_URI[sha256sum] = "ffdfe2368fb2e34a547898b01aac0520d52d8627fdeb1c306559bcb503ab5e9c"
 
 SRC_URI_append_class-native = " file://0001-Relocate-the-repository-directory-for-native-builds.patch"
 
-- 
2.17.1


