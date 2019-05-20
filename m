Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
	[209.85.128.41])
	by mail.openembedded.org (Postfix) with ESMTP id 036907DF5D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 14:11:37 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 198so13474112wme.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 07:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=M0sKSuDnOL+zrtjSm+jQ1zGv3M/+R1210pzqUWvDmQ0=;
	b=Lr+Imo4riAWyJcrxFhj4/la3yZiB9sFQSBgfuYNvT7ooPWg7pOQjdizZcqZeCPI6c3
	4XGGEfIoxtbk3fKfmVpzlFLdEs97mVbYFKTiW6qUhoVtA00VTbugCA6i/9oxjwxOFNM8
	Li3cp7Sc4X1+0yX07dFdUnuZXINY+U+l6Ej8UDNFZCaqkXpt0mB1pCL6R4KLWAd0OL14
	nFBdU2fX9ied0WFCMI1btnRdh+0zVxtkfFPpYX6xTdx3aYijhCsp8kxG1foqXmqgJ2BA
	Sc3+XYLN3KLdbLkBH0Rc3JvWesK3Eu7m00WwUxdUEOk6eVSEbJxBbzfAradMXG4xO1bV
	PgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=M0sKSuDnOL+zrtjSm+jQ1zGv3M/+R1210pzqUWvDmQ0=;
	b=EzAxm8PpdYcsBv7fxOcHhIqCszK2p3SoUKbSXlvbkobIkQ3MMg7NzVrpeJ5h5iOV4X
	hmFfVYZ5oSWkVQhMcDVf8QSS5whuvfvaSCSMk74YcZ/i6HgsH9iBR+zJf4OwSYALFFRl
	2cffS+QzKlpphanOWwjpcm+/eEW0fcVCyvhT2ukTbiMyywKjIuJbMvXISS2s3jxZm23F
	z/njz3pxgHSoZBoVgnb5stzHsiDdke+seKjrEwHGshD2mLqgjoUABxPVHtyCOQzQR558
	0ftWMjQ3wUUieF58r5/3UjH5ZBFf68srOVeKO/9tsYoJYgpkTjbv1hLWfzv83Qvt44l4
	FRHA==
X-Gm-Message-State: APjAAAX6XPTrMd53Hfc6b6fLM9UOkD45X5wHON2tzuEMpt3CvZvpQAY+
	o/H8B1ZLe+zADFv2fPgr53RMV6tf
X-Google-Smtp-Source: APXvYqzhfgvGR8GlRFu2wQvWWvOboijfug63+bFwhGaBDtGJ7CRcnKFtAqdcsDGbPg80OP5OQQfyYg==
X-Received: by 2002:a7b:c001:: with SMTP id c1mr13474535wmb.49.1558361498549; 
	Mon, 20 May 2019 07:11:38 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	v5sm36242015wra.83.2019.05.20.07.11.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 07:11:38 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2019 16:10:49 +0200
Message-Id: <20190520141125.10805-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190520141125.10805-1-alex.kanavin@gmail.com>
References: <20190520141125.10805-1-alex.kanavin@gmail.com>
Subject: [PATCH 06/42] adwaita-icon-theme: upgrade 3.30.1 -> 3.32.0
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
X-List-Received-Date: Mon, 20 May 2019 14:11:38 -0000

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../0001-Don-t-use-AC_CANONICAL_HOST.patch                  | 6 +++---
 ...ta-icon-theme_3.30.1.bb => adwaita-icon-theme_3.32.0.bb} | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.30.1.bb => adwaita-icon-theme_3.32.0.bb} (92%)

diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
index 43abdcd85ac..4a983633139 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme/0001-Don-t-use-AC_CANONICAL_HOST.patch
@@ -1,4 +1,4 @@
-From 499222d95a3d06bc425672d50e8c47868667250b Mon Sep 17 00:00:00 2001
+From 4409423752885f76326d05c1266698155f47c5f9 Mon Sep 17 00:00:00 2001
 From: Jussi Kukkonen <jussi.kukkonen@intel.com>
 Date: Tue, 30 May 2017 14:55:49 +0300
 Subject: [PATCH] Don't use AC_CANONICAL_HOST
@@ -14,12 +14,12 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/configure.ac b/configure.ac
-index 38e64bd..6ed480e 100644
+index 4a84501..52dbb8e 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -3,7 +3,6 @@ AC_PREREQ(2.53)
  
- AC_INIT([adwaita-icon-theme], [3.30.1],
+ AC_INIT([adwaita-icon-theme], [3.32.0],
          [http://bugzilla.gnome.org/enter_bug.cgi?product=adwaita-icon-theme])
 -AC_CANONICAL_HOST
  AC_CONFIG_MACRO_DIR([m4])
diff --git a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
similarity index 92%
rename from meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
rename to meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
index 8eadbd2eef7..02676f44010 100644
--- a/meta/recipes-gnome/gnome/adwaita-icon-theme_3.30.1.bb
+++ b/meta/recipes-gnome/gnome/adwaita-icon-theme_3.32.0.bb
@@ -14,8 +14,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Run-installation-commands-as-shell-jobs.patch \
            "
 
-SRC_URI[md5sum] = "db3fd812821d72fdd9a3c7d622a95b35"
-SRC_URI[sha256sum] = "6d752a2b1bc668483956d4485c39cad1642d9358e133ff689526e43674a4e1ce"
+SRC_URI[md5sum] = "4b16278cfed860a86c8221de62eec151"
+SRC_URI[sha256sum] = "698db6e407bb987baec736c6a30216dfc0317e3ca2403c7adf3a5aa46c193286"
 
 DEPENDS += "librsvg-native"
 
-- 
2.17.1


