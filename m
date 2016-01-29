Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 783CE77168
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 22:09:00 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id y78so4301154oif.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 14:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=vCU6gWhJ5LJ5Tv21N3fr6p4B3kQxx/EbsPEq8fsuGJA=;
	b=BiemPNohEitANIhaLY0W15NucOxDNJ3byAQNKjcL9/otYy0/ZfL0S9XPnh2C9MhUYC
	IK9msuaprFvx63ysY7oP2DYMfArcN2U96CHXBAR+oDL9WKlNM4Lf6JdOUGv8ZVJfNzJN
	yDKw0HdA64ZrGhaBlaiPDmgPISRVNlVVwg4PMfb5D3sM7qZSqTbkmS5V+Pi5mKJtex2O
	ogssV00j/fcVXwW5zSL/D7lw1EeRR2VkIdDlvre5+S0LckTje8lwrI61f5cjBYRoLb4h
	XEBI6sK7apVXWIZfXMIikBjNwgolo5j5qW1YCNAu5V9Lfyxi1M8y4EHp5fDIWDP6lgec
	ZHaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=vCU6gWhJ5LJ5Tv21N3fr6p4B3kQxx/EbsPEq8fsuGJA=;
	b=PHJ5JaMiyGv7Jp0XPFPMWHknsy+48FCmE1QVN2qP8eBvbjQguXZKVcpUgEc7qcHC6s
	6pIwmDMi/SZlCf2PfYbKuQP5Pli+48kqvsDEpyeviGtoyfxcW+7OMCNkWCTjIw3d+bNZ
	vFAFRSZlAlNtpNEvbFF/NilsC6FG3BB2dc3HFiIP3fFW2VfikAgsmngSl7zMfTPutxVE
	4phSJ+CHuhnOli0hXE5duZalrGkALVjNBI0bgLircNDvrPA6BgiQZZcxGJq7SA9CCAgL
	7pjjeXWAbw2wgcDulfl3iuxr5mvwMdtHRpso01jVr9UBIfzWhwrcXp+9dO5IPVo1LFXk
	hYXw==
X-Gm-Message-State: AG10YOSD7xBovoEhnFDbCIBwSCh+Lt+eNryn5wIwvenIkUnGJCi2y9rSK/NVjdgc2IYWQA==
X-Received: by 10.202.173.151 with SMTP id w145mr8135200oie.32.1454105341907; 
	Fri, 29 Jan 2016 14:09:01 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id f2sm2724302oig.2.2016.01.29.14.09.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 Jan 2016 14:09:01 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jan 2016 14:08:49 -0800
Message-Id: <1454105329-11302-3-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454105329-11302-1-git-send-email-armccurdy@gmail.com>
References: <1454105329-11302-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] pango.inc: misc dependency fixes
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
X-List-Received-Date: Fri, 29 Jan 2016 22:09:03 -0000

 - Add glib-2.0-native dependency for target
 - Add fontconfig-native and freetype-native dependencies for native
 - Drop unnecessary dependency on zlib for all

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/pango/pango.inc | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-graphics/pango/pango.inc b/meta/recipes-graphics/pango/pango.inc
index 63c7d1e..ffa38d8 100644
--- a/meta/recipes-graphics/pango/pango.inc
+++ b/meta/recipes-graphics/pango/pango.inc
@@ -9,14 +9,10 @@ BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
 LICENSE = "LGPLv2.0+"
 
-X11DEPENDS = "virtual/libx11 libxft"
-DEPENDS = "glib-2.0 fontconfig freetype zlib virtual/libiconv cairo harfbuzz"
+DEPENDS = "glib-2.0 glib-2.0-native fontconfig freetype virtual/libiconv cairo harfbuzz"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
-PACKAGECONFIG[x11] = "--with-xft,--without-xft,${X11DEPENDS}"
-
-BBCLASSEXTEND = "native"
-DEPENDS_class-native = "glib-2.0-native cairo-native harfbuzz-native"
+PACKAGECONFIG[x11] = "--with-xft,--without-xft,virtual/libx11 libxft"
 
 inherit gnomebase gtk-doc ptest-gnome upstream-version-is-even
 
@@ -43,3 +39,5 @@ RDEPENDS_${PN}-ptest += "liberation-fonts"
 
 RPROVIDES_${PN} += "pango-modules pango-module-indic-lang \
                     pango-module-basic-fc pango-module-arabic-lang"
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


