Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f194.google.com (mail-ob0-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE44731B9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 23:19:47 +0000 (UTC)
Received: by mail-ob0-f194.google.com with SMTP id o4so3719554obb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Feb 2016 15:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KTnUWY5zF6gMmqoiIvUhgG3syn9k195SzJdVhEclzRA=;
	b=CW7Rm5Y8r1go8K5RI8MT8twcRouBtn4jfqVqVhqoSfB4X+vevulNPOK6cIIaXFqoDO
	m0lmTc0cAIqyOEiSBsB+q3J9FATdpSDFs4EJsatqfqK6cUdERUMdqWnMutOtTT6kVjlc
	peXr8IftjbCan16/p8snj7lYwTV1kzcH1yhNu4g1hpQR4jSh6sX119QE2kyLt/R5ZNZk
	9db0j3vh736JO/Fg2+SPq8DHUJ7tYqEUVqv2sd4OFj+R1J9lIpLgxdDrBvCk4Dilyqae
	umtTrIfnROMe4oprWRzNprRSifEI9x4pS1UQkQ2y+PtjX8um3bQho+8N5AvaG/6EDM/q
	wfaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KTnUWY5zF6gMmqoiIvUhgG3syn9k195SzJdVhEclzRA=;
	b=OCKyDPOCmH5zPmePi+aHwAmJYhkV9PRwPt3kcDkwRCE/X13BFwPcZt6i6jkuaul1xA
	MuXGJ1ZDPsuk3f5D9u0hDi7A8/1+niNvtNkUxisq6GlSVQ+EyfhChKR6TXHnUzW9gPco
	TeKpqkeyO05E6/dR8iRClcAuscdTcH/pn/N2naA8ZpNKRDd1PNCmU+gA4adVUnict2Gu
	CHA+qaSyZv/Bf/FHp+gPWRGgBEEO1r9Stn0IxcN/4ms/yrAJaqGKXojTQRwT8BP+ziCT
	LMI8X80EzsVwLYIbFBzG2/IlXSCmU4s6nJKZFm8Y8LhPRSfYuy0i8xstZJ6W2PEGbmwB
	Fqjw==
X-Gm-Message-State: AG10YOTdV/oXmohbg0QGsnr5d+uXbSf5w3BvmOF3t+1YKOOMVpdBRmJuyN7N5jSdgGjO1A==
X-Received: by 10.60.141.193 with SMTP id rq1mr43165299oeb.19.1455146387895;
	Wed, 10 Feb 2016 15:19:47 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id q10sm2873000obg.1.2016.02.10.15.19.46
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Feb 2016 15:19:46 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Feb 2016 15:19:37 -0800
Message-Id: <1455146378-29690-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455146378-29690-1-git-send-email-armccurdy@gmail.com>
References: <1455146378-29690-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2] freetype: minor formatting improvements
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
X-List-Received-Date: Wed, 10 Feb 2016 23:19:47 -0000

No functional changes.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-graphics/freetype/freetype_2.6.2.bb | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/freetype/freetype_2.6.2.bb b/meta/recipes-graphics/freetype/freetype_2.6.2.bb
index 63e8ff4..a41f5c8 100644
--- a/meta/recipes-graphics/freetype/freetype_2.6.2.bb
+++ b/meta/recipes-graphics/freetype/freetype_2.6.2.bb
@@ -5,32 +5,32 @@ images). It can be used in graphics libraries, display servers, font conversion
 image generation tools, and many other products as well."
 HOMEPAGE = "http://www.freetype.org/"
 BUGTRACKER = "https://savannah.nongnu.org/bugs/?group=freetype"
+SECTION = "libs"
 
 LICENSE = "FreeType | GPLv2+"
 LIC_FILES_CHKSUM = "file://docs/LICENSE.TXT;md5=c017ff17fc6f0794adf93db5559ccd56 \
                     file://docs/FTL.TXT;md5=d479e83797f699fe873b38dadd0fcd4c \
                     file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
 
-SECTION = "libs"
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/freetype/freetype-${PV}.tar.bz2 \
            file://use-right-libtool.patch"
+
 SRC_URI[md5sum] = "86109d0c998787d81ac582bad9adf82e"
 SRC_URI[sha256sum] = "baf6bdef7cdcc12ac270583f76ef245efe936267dbecef835f02a3409fcbb892"
 
-BINCONFIG = "${bindir}/freetype-config"
-
 inherit autotools pkgconfig binconfig-disabled multilib_header
 
-EXTRA_OECONF = "CC_BUILD='${BUILD_CC}'"
-TARGET_CPPFLAGS += "-D_FILE_OFFSET_BITS=64"
-
 PACKAGECONFIG ??= "zlib"
+
 PACKAGECONFIG[bzip2] = "--with-bzip2,--without-bzip2,bzip2"
-PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
-PACKAGECONFIG[pixmap] = "--with-png,--without-png,libpng"
-# This results in a circular dependency so enabling is non-trivial
+# harfbuzz results in a circular dependency so enabling is non-trivial
 PACKAGECONFIG[harfbuzz] = "--with-harfbuzz,--without-harfbuzz,harfbuzz"
+PACKAGECONFIG[pixmap] = "--with-png,--without-png,libpng"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
+
+EXTRA_OECONF = "CC_BUILD='${BUILD_CC}'"
+
+TARGET_CPPFLAGS += "-D_FILE_OFFSET_BITS=64"
 
 do_configure() {
 	# Need this because although the autotools infrastructure is in
@@ -49,4 +49,6 @@ do_install_append() {
 	oe_multilib_header freetype2/freetype/config/ftconfig.h
 }
 
+BINCONFIG = "${bindir}/freetype-config"
+
 BBCLASSEXTEND = "native"
-- 
1.9.1


