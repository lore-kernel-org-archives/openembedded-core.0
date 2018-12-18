Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B0107C0E0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 16:30:16 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id u4so15588183wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 08:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UF7MoG3KthljKmdqoAMVhc4glwj+TUzBTFppkv53Twk=;
	b=Hu4yBa73YG/gqWPRqbLzh7yjf2x/YqHZ/f5kbOCawAWoz/4LQya4fO1y60+R/Oykd/
	+p20Jhz1/u89Q7xFdHT5kYQisx/cGCGwSTO/2w+Et0+nYx56+/Bx30uiiXhRXT0aTc/c
	htNXHzDu2WJ71e5uKPOKK+WzAVuviq3uDHHxpNd3R/IKg/80MaW3xmg4N3dHuVlwUV47
	YFgsp882q6v4NbRbIkvYmehq1I8s/uyOaK989TxH8TpcKtTaAlIFZB8X2+tE3aC1DANo
	Pc1pMr2S4jlkI94kny029MVOJVCzBfunudd5thFQwwZ850LmHUjyf4TBF3uJvc1c6ZGg
	2GVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UF7MoG3KthljKmdqoAMVhc4glwj+TUzBTFppkv53Twk=;
	b=p4th5rGtkrarMjW4YQYStKMzPhpYp5qbWqgL7I42wV5nQNVCR+ayb0ySVRL5q7254s
	xGwaUrfRcE1Z+CF7S1vbjv8N0WJ4SUrv3wRIfe8sLYcvjNxQb2iD9QhHyVpOBGKFi8EP
	3Vtd1k9Lz5TNYk0xntzAV6J4LlOoYtUZZvuLXqA9bO9NzS+ZhlWEglJQmwbMseJjPs3k
	QYHT55AyK24EC9EuU8VIqwAlvV3xNeadVyNFrrh1gic139XyaDcbKAOQ8S4Ba+8MqR4W
	nrPFxEMisz5eelGlmt/1uub7QdRD9eQGcK8wV3Z0VWH+2Rph97TBgvvo90Nzgk87hu+v
	hKVg==
X-Gm-Message-State: AA+aEWZjGURsTbejk80IRBa/dU92GSSM1Ua1cpjskzvxBeuND4rPiKKB
	hoTALnqK6NuAYPhNXBCIqcIxY7p9
X-Google-Smtp-Source: AFSGD/XvSLnh6GZfD40XU4Pdfluu5+93f9QOgqJ0hSKWW8vzfAZSrMq6CGfijXir2js/EYgrcS5mzA==
X-Received: by 2002:a5d:5351:: with SMTP id t17mr15293529wrv.288.1545150617419;
	Tue, 18 Dec 2018 08:30:17 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	f18sm2237849wrs.92.2018.12.18.08.30.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 08:30:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2018 17:29:56 +0100
Message-Id: <20181218163005.1330-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181218163005.1330-1-alex.kanavin@gmail.com>
References: <20181218163005.1330-1-alex.kanavin@gmail.com>
Subject: [PATCH 04/13] libdazzle: fix a build issue with meson 0.49.0
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
X-List-Received-Date: Tue, 18 Dec 2018 16:30:17 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ine-so-that-gir-compilation-succeeds.patch | 26 +++++++++++++++++++
 .../libdazzle/libdazzle_3.30.2.bb             |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta/recipes-gnome/libdazzle/libdazzle/0001-Add-a-define-so-that-gir-compilation-succeeds.patch

diff --git a/meta/recipes-gnome/libdazzle/libdazzle/0001-Add-a-define-so-that-gir-compilation-succeeds.patch b/meta/recipes-gnome/libdazzle/libdazzle/0001-Add-a-define-so-that-gir-compilation-succeeds.patch
new file mode 100644
index 00000000000..c959d43972f
--- /dev/null
+++ b/meta/recipes-gnome/libdazzle/libdazzle/0001-Add-a-define-so-that-gir-compilation-succeeds.patch
@@ -0,0 +1,26 @@
+From 546d53c3515e8a488a204763437d1fa0917097e5 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Tue, 11 Dec 2018 12:39:30 +0100
+Subject: [PATCH] Add a define so that gir compilation succeeds
+
+For some reason meson 0.49.0 does not anymore pass global arguments to gir compiler.
+
+Upstream-Status: Pending
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 6ff8a6a..f0b2887 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -132,7 +132,7 @@ if get_option('with_introspection')
+         install_dir_gir: girdir,
+     install_dir_typelib: typelibdir,
+         export_packages: libdazzle_package,
+-             extra_args: [ '--c-include=dazzle.h', '--quiet' ],
++             extra_args: [ '--c-include=dazzle.h', '--quiet', '-DDAZZLE_COMPILATION' ],
+   )
+ 
+   if get_option('with_vapi')
diff --git a/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb b/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
index 029adddb9ee..5441c10f990 100644
--- a/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
+++ b/meta/recipes-gnome/libdazzle/libdazzle_3.30.2.bb
@@ -7,6 +7,7 @@ inherit gnomebase upstream-version-is-even vala gobject-introspection
 
 DEPENDS = "glib-2.0-native glib-2.0 gtk+3"
 
+SRC_URI += " file://0001-Add-a-define-so-that-gir-compilation-succeeds.patch"
 SRC_URI[archive.md5sum] = "24e2e1b914a34f5b8868a9507d1f3c4c"
 SRC_URI[archive.sha256sum] = "78770eae9fa15ac5acb9c733d29459330b2540affbf72933119e36dbd90b36d5"
 
-- 
2.17.1


