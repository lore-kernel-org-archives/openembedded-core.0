Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f195.google.com (mail-ob0-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9A2FC772F5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 22:12:45 +0000 (UTC)
Received: by mail-ob0-f195.google.com with SMTP id x5so139926obg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Feb 2016 14:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=EFhSwM/gUjzxhhxpKY5u/Ac8ccy8UWbvS1MMCcqSmKk=;
	b=TYozk4C+ekwCIYepIoNdm0AW0d4jqFo8FJT6qOwusYiiXJrdc0dAay3WwHB5eq1//M
	a14/CzCW3Tx4Dexzf08Bs898Gem6R2DnPPKIt6fFBWqZjfN6kcmjXAbLJLtP5gvXxy5A
	azEAIQpsrAJm6FOI86A/KUxbGSH5Tq/CkGIbhU9+4BWmOwL4RSLo2/nnk/eeuiK3ELEx
	CLCRbQfnRMJ2RZ9mZsErpmETql62Pozq/BVP1CbENuh1mBuoFAKc6GswvdzBo3cm4ABc
	PAhdZ/a8nXVB7HzPZedwC6hEYG/bSTDZd/2n9X2m21jBsDz2c6ZDwH4gDFoFM8uHNuJl
	2XQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=EFhSwM/gUjzxhhxpKY5u/Ac8ccy8UWbvS1MMCcqSmKk=;
	b=Fq+ersI6VK5Lu6q58G1Dw3ielNGFXTvstD/AVqU1/aQ2esB96W4wXSiMYK65F2BEYj
	VNmsNONhgZoiahdHgkxW8TB8aYXRc+7PjRxzh48HbniirQIY2D06LwK+LSqDm7lJPsLz
	WQruiuwa1xr/VDv/IDoZYFhy3Dcc5DxX09g1dyw+JSnYJuGpkiR40OAV19ssikFDoiAw
	gOtL5OEwb5DmqAbFPaFdIUoKO9bytFVpoYgtr7LlpaXnH4feUM/sux55sJ4qlVn/Fwjh
	1xnOyQJrU8a3rAHvsTlUFxxgPB6hgqVpFqlQoSQseLL1EBRRM3grydAQ4SrIoee2VRzb
	Nvew==
X-Gm-Message-State: AG10YOQJ6vCRCy6LauoZDpMkAd0LEnL++LjfCVJHYbdXfCBiVDaoE0AFWvHjJuVDB+dP6A==
X-Received: by 10.182.92.234 with SMTP id cp10mr25919110obb.79.1454451166067; 
	Tue, 02 Feb 2016 14:12:46 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id q10sm1726245obg.1.2016.02.02.14.12.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 02 Feb 2016 14:12:45 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 14:12:31 -0800
Message-Id: <1454451153-19783-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454451153-19783-1-git-send-email-armccurdy@gmail.com>
References: <1454451153-19783-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/3] gnutls.inc: minor formatting improvements
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
X-List-Received-Date: Tue, 02 Feb 2016 22:12:46 -0000

Reordering, plus combine two LDFLAGS_append_libc-uclibc lines into one.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/gnutls/gnutls.inc | 41 +++++++++++++++++-----------------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-support/gnutls/gnutls.inc b/meta/recipes-support/gnutls/gnutls.inc
index 90597db..f2d29eb 100644
--- a/meta/recipes-support/gnutls/gnutls.inc
+++ b/meta/recipes-support/gnutls/gnutls.inc
@@ -1,8 +1,6 @@
 SUMMARY = "GNU Transport Layer Security Library"
 HOMEPAGE = "http://www.gnu.org/software/gnutls/"
 BUGTRACKER = "https://savannah.gnu.org/support/?group=gnutls"
-DEPENDS = "nettle libidn virtual/libiconv"
-DEPENDS_append_libc-musl = " argp-standalone "
 
 LICENSE = "GPLv3+ & LGPLv2.1+"
 LICENSE_${PN} = "LGPLv2.1+"
@@ -13,24 +11,33 @@ LICENSE_${PN}-openssl = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.LESSER;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
+DEPENDS = "nettle libidn virtual/libiconv"
+DEPENDS_append_libc-musl = " argp-standalone"
 
-SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV', True).split('.')[0]}.${@d.getVar('PV', True).split('.')[1]}"
 
 SRC_URI = "ftp://ftp.gnutls.org/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz"
 
 inherit autotools texinfo binconfig pkgconfig gettext lib_package
 
-EXTRA_OECONF="--disable-rpath \
-              --with-included-libtasn1 \
-              --enable-local-libopts \
-              --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
-              --disable-guile \
-              --disable-crywrap \
-              --without-p11-kit \
-              --enable-openssl-compatibility \
-              "
-LDFLAGS_append_libc-musl = " -largp "
-LDFLAGS_append_libc-uclibc = " -luargp "
+PACKAGECONFIG ??= "zlib"
+
+PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
+PACKAGECONFIG[zlib] = "--with-zlib,--without-zlib,zlib"
+
+EXTRA_OECONF = " \
+    --disable-crywrap \
+    --disable-guile \
+    --disable-rpath \
+    --enable-local-libopts \
+    --enable-openssl-compatibility \
+    --with-included-libtasn1 \
+    --with-libpthread-prefix=${STAGING_DIR_HOST}${prefix} \
+    --without-p11-kit \
+"
+
+LDFLAGS_append_libc-musl = " -largp"
+LDFLAGS_append_libc-uclibc = " -luargp -pthread"
 
 do_configure_prepend() {
 	for dir in . lib; do
@@ -38,16 +45,10 @@ do_configure_prepend() {
 	done
 }
 
-PACKAGECONFIG ??= "zlib"
-PACKAGECONFIG[tpm] = "--with-tpm, --without-tpm, trousers"
-PACKAGECONFIG[zlib] = "--with-zlib, --without-zlib, zlib"
-
 PACKAGES =+ "${PN}-openssl ${PN}-xx"
 
 FILES_${PN}-dev += "${bindir}/gnutls-cli-debug"
 FILES_${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
 FILES_${PN}-xx = "${libdir}/libgnutlsxx.so.*"
 
-LDFLAGS_append_libc-uclibc += " -pthread"
-
 BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


