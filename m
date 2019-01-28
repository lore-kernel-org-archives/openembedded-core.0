Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0AF207C4AC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 12:47:32 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id u4so17907650wrp.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2019 04:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=6LOq25/es5UybHcO7Zg2qBSu3bzqLHix8grQqw4qZbo=;
	b=uqlxsCM7ccNJzxEC2cP0P50T0316KReFpJoCcS3SUXTEZyQtsvmO1PG+nfB3UT+lRN
	C64zfd7AQMn0NxHCB8kOvYNvawKOiMIuaXfTBgYXniBeqZOqEIc5wNMl8ZCAj7q2uNA9
	pXlAtV1McRbkoIAgKzMwaXS2V2e9hpftNksixqCn3yP/FAV4SVoVlHUz55EKeaFjYzsH
	8uyCN34B4tFRIUa88TDTAjP53vFR4xfl8aHS5pKMYHAV8VgSofhv45VQki5QxnY5E9/2
	cSev+0kURG2vKoWVQ5jJO+tvXbAiQNujP3DWklDkn2dGA1DamXBQ0OA1z7Qu7tZi19vc
	EmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=6LOq25/es5UybHcO7Zg2qBSu3bzqLHix8grQqw4qZbo=;
	b=tVYS4FptglOXtqT65t7RMnHx7sEgWskbE51jDBPG7GyObL3h1JLBnnniZEtlRuePfW
	itRMRV6e/eO3cuFB2lgdYLDOf3ybONwpHDHVsNcFUNszeN7u1UmdeSz0MNPVkH6SQprz
	2mu8dv7HpVqhBsyvwTp3eDIZK5qP8qexJES4cPkbJROO7Z7+/FyU2zxGZLfaxu+MHlIb
	OPzXXKxAMjjUUW6867YvvrtGgVec1KBwHzNBv7Cjr+xlGFMYOFASQadb+Mir4fKhimfz
	v9RwBxASZvgXD8+6gJHufloo5c6nGJ7SO0I0RUfXWUhpP5E7BRA3Uk4cO0xYBeLio+TY
	BdBw==
X-Gm-Message-State: AJcUukfeH6O5bVdnGRK1VT0JeXxFaC/nGmQTjAyE1kN4Whr2tTYmx5nk
	2tQd2qIoTRY7w0S3MQ7DqjbEw1H+
X-Google-Smtp-Source: ALg8bN6E0DihxCPx4a6aBRH70eK+JA9TW41oO/ZFlnYRpS14uqlEZrKtpAXpXyGN/iMn/wYURvv8+w==
X-Received: by 2002:adf:fdc2:: with SMTP id i2mr22420139wrs.117.1548679653115; 
	Mon, 28 Jan 2019 04:47:33 -0800 (PST)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	j33sm186026218wre.91.2019.01.28.04.47.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Jan 2019 04:47:31 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Jan 2019 13:46:55 +0100
Message-Id: <e5725a863ac3f610e91c0f242eb7b10307250be6.1548679462.git.alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1548679462.git.alex.kanavin@gmail.com>
References: <cover.1548679462.git.alex.kanavin@gmail.com>
Subject: [PATCH 24/24] vte: allow building vte-native with gcc 4.8
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
X-List-Received-Date: Mon, 28 Jan 2019 12:47:33 -0000

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


