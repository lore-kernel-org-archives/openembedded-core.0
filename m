Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 2FEEC7C353
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 11:00:12 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id l9so25461020wrt.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Jan 2019 03:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6LOq25/es5UybHcO7Zg2qBSu3bzqLHix8grQqw4qZbo=;
	b=dfei/7PhpijLFSyAti1le8603UKkJDTdUW+SC1ByFQkZcTJCq7M+MqmvYYOb7uduvb
	uXFB5vhoUSaNINPP2SqK2WVMB/QlzaZc1LvpaRDZRTakVEyiY27umbuJE+W1RDPKZVD6
	TWnwfHyFgMLEDCqALGE+FT1DdkCueXxdvmYAmvl1ZJo5wAnf3vWa00fQDT3xOXC6LRYi
	nfH+pOe/AjbGC9Aitb+1Be6eKVIMxFzSH/lEU2mPP+REx9NRvRT/jSPcuFUebvZozzhz
	6jy1C9tEssce1Uq6SstYSwHYCy9+YpMXaL0lkwyIIlLe8AoDO2Yp50g/BOjNRCe2cdf5
	RL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6LOq25/es5UybHcO7Zg2qBSu3bzqLHix8grQqw4qZbo=;
	b=WJAT7LlmPZru/BTAO/0XK19tBTCMuFfElDd78W/STlnqktD3PRHKDuuDxBfuFfxX4G
	QSCrIrmZK0hJG2JmBvDiwwLqKcg0jaBjEl0mCZVzedjrDPRYxxbwmtdgY1uec2lJHV22
	TqAASz3no2t88hAgjpb1j8mCI686XNuLf6kKKmoMYFdEB8ZcicniLIaaha6XzADittUN
	asYRCRby1rnZSP/hkqugChEjz3ULfFbS8OUy23WuKGXqakycgXt96TeTeQSUQ1qmuexZ
	WynBkZmi346Wn2QmcGKwdyslgl3OoMqhpi6QY8wsuFQr1p5ObVhelZYxvl6gJ4Y3nn7e
	veng==
X-Gm-Message-State: AJcUukcvABHhpCeFKi3EqyJ3Gp9gKbacg6+XmcaUh5dHO+PKyhbSWeUC
	LKAfZTww2EjvV55qdpHedGk/RZan
X-Google-Smtp-Source: ALg8bN5uQM6oOWHmJlYrcI/109UTZIEIKLZN9079gW479DJ1FBiUo0V/rjQW4EtRJteZylHKBm8cZg==
X-Received: by 2002:adf:ee46:: with SMTP id w6mr30382634wro.261.1548846012539; 
	Wed, 30 Jan 2019 03:00:12 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	a18sm1127705wrp.13.2019.01.30.03.00.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Jan 2019 03:00:11 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Jan 2019 11:59:43 +0100
Message-Id: <e6260b958fc632333e8bcb65c1a5e90753b3ed0e.1548845917.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548845917.git.alex.kanavin@gmail.com>
References: <cover.1548845917.git.alex.kanavin@gmail.com>
Subject: [PATCH 20/20] vte: allow building vte-native with gcc 4.8
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
X-List-Received-Date: Wed, 30 Jan 2019 11:00:12 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...chool-asignment-to-avoid-gcc-4.8-err.patch | 27 +++++++++++++++++++
 meta/recipes-support/vte/vte_0.52.2.bb        |  5 ++--
 2 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch

diff --git a/meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch b/meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch
new file mode 100644
index 00000000000..9c3f98fa61f
--- /dev/null
+++ b/meta/recipes-support/vte/vte/0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch
@@ -0,0 +1,27 @@
+From 442da9076b52003743ffc6fd7b9d647de6d7aa8f Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 17 Jan 2019 16:37:54 +0100
+Subject: [PATCH] app.cc: use old school asignment to avoid gcc 4.8 error
+
+This is needed to build vte-native on Centos 7,
+and can be dropped once that OS is no longer supported.
+
+Upstream-Status: Inappropriate [ancient compiler fix]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/app/app.cc | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/app/app.cc b/src/app/app.cc
+index d424064..675d789 100644
+--- a/src/app/app.cc
++++ b/src/app/app.cc
+@@ -306,7 +306,7 @@ public:
+                 else
+                         alpha = get_alpha();
+ 
+-                GdkRGBA color{bg_color};
++                GdkRGBA color = bg_color;
+                 color.alpha = alpha;
+                 return color;
+         }
diff --git a/meta/recipes-support/vte/vte_0.52.2.bb b/meta/recipes-support/vte/vte_0.52.2.bb
index 62fb5288fa9..272ae66f134 100644
--- a/meta/recipes-support/vte/vte_0.52.2.bb
+++ b/meta/recipes-support/vte/vte_0.52.2.bb
@@ -9,8 +9,9 @@ inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject
 
 # vapigen.m4 is required when vala is not present (but the one from vala should be used normally)
 SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
-            ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
-            "
+           ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
+           file://0001-app.cc-use-old-school-asignment-to-avoid-gcc-4.8-err.patch \
+           "
 SRC_URI[archive.md5sum] = "de8181350dccb010e915e366bdd06d18"
 SRC_URI[archive.sha256sum] = "0f2657cef52accbfe56feede553155552d7c1984b1291838af3cb8cfc19b26af"
 
-- 
2.17.1


