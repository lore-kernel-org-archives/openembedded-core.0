Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f46.google.com (mail-it0-f46.google.com
	[209.85.214.46])
	by mail.openembedded.org (Postfix) with ESMTP id F3096730BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 14:17:16 +0000 (UTC)
Received: by mail-it0-f46.google.com with SMTP id r185so66479644ita.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jan 2017 06:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+t5Fm7TqGWqOE5TMqqllJXo6Na4YCj+eUf181xs/4Qo=;
	b=s8NMcevMaX8odquwm2SywB1bBl33zax3cHF6NXDKd40vHEG0+OUsza8ISJjGvxDlVo
	xzAQx3oOs/aBurXY59epCszr8xeuBzyGBxI2AfQXv2KLykQfHX2oqOECWHlBMcqAGElL
	pAcbV/kLlyNReLQHoCFs7dIvkjROzwOL7APyUpMXPQWtzW/JcjACZlMi9SIhNsNXO9aH
	D1dvnfkRwpQKikpyfWVUZzgG8ioN11+xiJlFtkI0YXq58qhfoiNkgdO1KpQJVuBrIQue
	vznYTYdP+f9KSmIlu1Oh8QVVQc7FY4D3I78aL2Y2+vMDBSgJRfRydYRGfb5S/oyiBMR8
	eXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+t5Fm7TqGWqOE5TMqqllJXo6Na4YCj+eUf181xs/4Qo=;
	b=MoHfuzILuJ4N3ctEJj5djqDc34mvihwgZowURrS52Nh9qzfA5rAmt4AlP50Rf6DAtE
	Dq4opoRGVbGmTnF6ZcvMxZmc2bLgTbtUJmgTKxx7muWhYnEaNQfNqwg7Gf7F+QpVlkC9
	1gE8AK6tx8lEhKeQ39Pd91GthS/VoiX5nXdQ7bNHHMrkhj5wA+lppbW9WQketaF8+vY/
	+pTDASNWgoIymBMOWrKeo1FgYTWMX/ZLpehoqbt8fxe449W9wEX5phxKe5xPj40Nol9X
	PlrfxPZhwo5tiVfZqMndUjtAcmSz0LUEi6CUf6TLp7QgzzDhftQtbtWytGo8xKwGc+CL
	sc1Q==
X-Gm-Message-State: AIkVDXK9ZMeuIKweOuGpm3P8pGaXqSnwVDVbpW/T1/PiT0LVWvwHgOImyvHY2rDcZn6WJGTo
X-Received: by 10.36.90.194 with SMTP id v185mr14355613ita.85.1485181036802;
	Mon, 23 Jan 2017 06:17:16 -0800 (PST)
Received: from pohly-desktop.fritz.box (p5DE8FC12.dip0.t-ipconnect.de.
	[93.232.252.18]) by smtp.gmail.com with ESMTPSA id
	v68sm9608633ioi.20.2017.01.23.06.17.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 23 Jan 2017 06:17:15 -0800 (PST)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Jan 2017 15:17:03 +0100
Message-Id: <67716074c5e277bd08b6ab194866196addf14b85.1485180970.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.a45e50ea4fcbfdc1b4f78df0b3380d397b353cf6.1485180970.git-series.patrick.ohly@intel.com>
References: <cover.a45e50ea4fcbfdc1b4f78df0b3380d397b353cf6.1485180970.git-series.patrick.ohly@intel.com>
Subject: [PATCH 1/2] expect: support native compilation
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
X-List-Received-Date: Mon, 23 Jan 2017 14:17:17 -0000

This is needed for building the swtpm TPM simulator (recipe
in meta-security).

"nativesdk" is added just in case that someone also wants this
in an SDK.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 meta/recipes-devtools/expect/expect_5.45.bb |  9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/expect/expect_5.45.bb b/meta/recipes-devtools/expect/expect_5.45.bb
index b4dfe15..ab22a61 100644
--- a/meta/recipes-devtools/expect/expect_5.45.bb
+++ b/meta/recipes-devtools/expect/expect_5.45.bb
@@ -43,11 +43,16 @@ do_install_append() {
         sed -e 's|$dir|${libdir}|' -i ${D}${libdir}/expect${PV}/pkgIndex.tcl
 }
 
+# Apparently the public Tcl headers are only in /usr/include/tcl8.6
+# when building for the target.
+TCL_INCLUDE_PATH = ""
+TCL_INCLUDE_PATH_class-target = "--with-tclinclude=${STAGING_INCDIR}/tcl8.6"
+
 EXTRA_OECONF += "--with-tcl=${STAGING_LIBDIR} \
-                 --with-tclinclude=${STAGING_INCDIR}/tcl8.6 \
                  --enable-shared \
                  --enable-threads \
                  --disable-rpath \
+                 ${TCL_INCLUDE_PATH} \
                 "
 EXTRA_OEMAKE_install = " 'SCRIPTS=' "
 
@@ -62,3 +67,5 @@ FILES_${PN}-dev = "${libdir_native}/expect${PV}/libexpect*.so \
 FILES_${PN} += "${libdir}/libexpect${PV}.so \
                 ${libdir}/expect${PV}/* \
                "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
git-series 0.9.1

