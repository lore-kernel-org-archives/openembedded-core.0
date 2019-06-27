Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id C0F5F7E958
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 14:44:30 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id 16so2611950ljv.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2019 07:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=cykSeqUunukC2c7mXN51uxCsTGVvvCJIHz8Xzu8GCuY=;
	b=JFGRGzqSTbFDP9BwLFCBFZ/hS9MbmGGZwbHOl6T1c9OfD2OXMYcs6/8F1ZT2DqSYJz
	VQdxdfZ4yOk1tGEIfqIlmyEe4PsmngOQgb4Lnt2J1btTcrGkbXbvNR9QCygq4huxELFQ
	bWt9En2W36kFYy3nzRjjL39LK9VdnX6MH9K2H4fUmyIAiyKXkKBinuB0RxaLp/l1rgl2
	eEfWrPfnb0HAJUeVc7bZTc6Kj9TBDOdyaO5TXZzzAKMrAQYlEDzd483GCGh4a8J+D1mm
	NSTt0Ev+xJcreONJEuDbPLJ4yTkW7nwMcfIl+CF9iM9roAIMbXChkLQd6JupqHExmhAt
	aLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=cykSeqUunukC2c7mXN51uxCsTGVvvCJIHz8Xzu8GCuY=;
	b=B516VFr8YHTGp9hufnzN/BW0Rdd0UGhRBAP5wqt+fPBR1VjAmLYW1QoRmC7klouFd3
	elgI2T1Typqg1m25yjAhxDqRJ/WCAsfGeELsgiMNJazDnj0kXGCtA10MCSZBZ+oj7PKe
	IbeHrAkjQgzB/FXR8wTyk4FpoNoV0hYrccFeNhhDVzTXh8lRo2DaPQcniHKpA1X3jzHz
	nyWmqPDvx1D0a2wLs9YJeYZN89ErIjJA2slbzNJhZqs/R4EORmOi3w6rjHPI7+/qweBv
	Wo2K9Iv2fqKIt7OG7FWKvXgc22IauRBUcifInK5Ut3Ox7eoaNTRQINUODnewulmz3Rj4
	4tmA==
X-Gm-Message-State: APjAAAX+tvysFAL2Z8XlbE7D7Q1JtlUpZtVPhOYDOpbkpB9/5ZDFLFG7
	fSgRXQ5NQ/3hJXaJ2pivNh0kqxvscHE=
X-Google-Smtp-Source: APXvYqzqtoJUnscaKWhC2hBl15LsX84UUcucJ7inLNPDvxoS+NtYzX+sQzhlT6DpQSxXpPc39HYlCg==
X-Received: by 2002:a2e:5b1b:: with SMTP id p27mr2788501ljb.97.1561646670945; 
	Thu, 27 Jun 2019 07:44:30 -0700 (PDT)
Received: from lund.luxoft.com (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108])
	by smtp.gmail.com with ESMTPSA id h3sm483190lja.93.2019.06.27.07.44.29
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 27 Jun 2019 07:44:30 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Jun 2019 16:44:27 +0200
Message-Id: <20190627144427.32226-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH] encodings: update to 1.0.5
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
X-List-Received-Date: Thu, 27 Jun 2019 14:44:31 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../xorg-font/encodings/nocompiler.patch      | 23 +++++++++++++------
 ...{encodings_1.0.4.bb => encodings_1.0.5.bb} |  5 ++--
 2 files changed, 18 insertions(+), 10 deletions(-)
 rename meta/recipes-graphics/xorg-font/{encodings_1.0.4.bb => encodings_1.0.5.bb} (77%)

diff --git a/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch b/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
index f330c185af..ec7c7d80c1 100644
--- a/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
+++ b/meta/recipes-graphics/xorg-font/encodings/nocompiler.patch
@@ -1,23 +1,32 @@
+From b08c43a0842076e0a94e88ad6456a9326cd7ffc9 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Tue, 17 May 2011 23:03:02 +0000
+Subject: [PATCH] Improve handling of 'all' architecture recipes and their
+
 Upstream-Status: Inappropriate [configuration]
 
 XORG_DEFAULT_OPTIONS pulls in the following dependency chains:
 
 XORG_CWARNFLAGS -> AC_PROG_CC_C99
 XORG_STRICT_OPTION -> AC_PROG_CC_C99, XORG_CWARNFLAGS
-XORG_MANPAGE_SECTIONS -> AC_CANONICAL_HOST -> Checks host 
+XORG_MANPAGE_SECTIONS -> AC_CANONICAL_HOST -> Checks host
 
 each of which triggers the use of the host compiler. As an "all"
 architecture package, it shouldn't need a compiler (and doesn't).
 
 RP 17/5/2011
 
-Index: encodings-1.0.4/configure.ac
-===================================================================
---- encodings-1.0.4.orig/configure.ac	2011-05-17 23:36:19.505095876 +0100
-+++ encodings-1.0.4/configure.ac	2011-05-17 23:54:14.935096128 +0100
-@@ -4,12 +4,12 @@
+---
+ configure.ac | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 622c27b..5ee84ed 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -3,12 +3,12 @@ AC_INIT([encodings], [1.0.5],
+         [https://gitlab.freedesktop.org/xorg/font/encodings/issues])
  AM_INIT_AUTOMAKE([foreign dist-bzip2])
- AM_MAINTAINER_MODE
  
 -# Require xorg-macros: XORG_DEFAULT_OPTIONS
  m4_ifndef([XORG_MACROS_VERSION],
diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
similarity index 77%
rename from meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
rename to meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
index 36766f2f42..a39609b5da 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.4.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
@@ -13,10 +13,9 @@ DEPENDS = "mkfontscale-native mkfontdir-native font-util-native"
 RDEPENDS_${PN} = ""
 
 SRC_URI += "file://nocompiler.patch"
+SRC_URI[md5sum] = "bbae4f247b88ccde0e85ed6a403da22a"
+SRC_URI[sha256sum] = "bd96e16143a044b19e87f217cf6a3763a70c561d1076aad6f6d862ec41774a31"
 
 inherit allarch
 
 EXTRA_OECONF += "--with-encodingsdir=${datadir}/fonts/X11/encodings"
-
-SRC_URI[md5sum] = "0f2d6546d514c5cc4ecf78a60657a5c1"
-SRC_URI[sha256sum] = "ced6312988a45d23812c2ac708b4595f63fd7a49c4dcd9f66bdcd50d1057d539"
-- 
2.17.1


