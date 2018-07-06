Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3047C7894E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Jul 2018 03:49:15 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id v9-v6so7202753pff.9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Jul 2018 20:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=stNkqNVeOSSQu9Xqn2gfb7AUFyr1nQ4U7hBLGJfFw/g=;
	b=QnRI6PQ7mqkSIzmr8td9VfCfAVtxFQ3qfquWZbm05UZZuc5NEPt99dSTj13yWalUf6
	1+PScp+mI++wOO314gCXsiAFjzfbhEiFCkHkECFw9MWwAWUgANF1UFvgS15r/VZkDFNd
	jb3IaZXFyRUbRHp7t0sv4J9bJV305J2hRxf2GPYWIHawi9ICBNpHM3AOMDX/dHCMznJ5
	nAAvdnMpJwE0mAEKPfr0bc0GAeyF8P7W031PU4o87E3kxBbXPP+DP1ByZfxpiworFHPe
	9TSj2u/EcnvKjRwrwCKqnoboEcbfvMn/hiI3Jk1oYpQazxIha55DFxpTngDGM7uPL+I/
	vX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=stNkqNVeOSSQu9Xqn2gfb7AUFyr1nQ4U7hBLGJfFw/g=;
	b=OJxGlEc/fhfHHiaNh1lBLmU3pn6FTtYc2B+bLDb8ciVQNLaP5HMrQ9NF82LvLCx6eI
	+FXQNbns49WA7X6z/bbRLWAXai747vIbhCbb6qt3s2kCuRK8NrUsVzJV2v9+tPKDYrqa
	gJkGg2fD3fxkBU3UElxwCs+25jw2nc85EN4r9iS92dmPubo+feS0nkDvnzMasTAwP7uq
	EUdxSKk3b7ZRdGMv6iwTEqDPezI23PN9Sv4MrI5ySzj25jzEFVnIqGhUsAh8gBgWHoJR
	3M8RwihY9juI/X2uQzdH5NtL/GLzWCidNDjFCmE2zx23WsL0Y6mk2aXyrAd2xnOA5bGo
	Ps8g==
X-Gm-Message-State: APt69E2BewSedh3AQAouE7qhjkJhJ2OBAvu+TCLPfo9+DNChd8QBuTNz
	EUgUrkzfeLQOiXpFtdS4BmGW2A==
X-Google-Smtp-Source: AAOMgpeMhj7anHh7QoRo9fTKUJ7WxPkW9vHb0efLCugHZqXC0lXoccztv4N44QA3p0OPpReqG+A0nw==
X-Received: by 2002:a63:ab0c:: with SMTP id
	p12-v6mr7908779pgf.190.1530848956259; 
	Thu, 05 Jul 2018 20:49:16 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	j23-v6sm11981886pfi.137.2018.07.05.20.49.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Jul 2018 20:49:15 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jul 2018 20:49:06 -0700
Message-Id: <1530848946-3288-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1530848946-3288-1-git-send-email-armccurdy@gmail.com>
References: <1530848946-3288-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/2] quilt.inc: minor recipe formatting tweaks
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
X-List-Received-Date: Fri, 06 Jul 2018 03:49:15 -0000

Minor comment update and re-order variables to align more closely to
the OE style-guide.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/quilt/quilt.inc | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-devtools/quilt/quilt.inc b/meta/recipes-devtools/quilt/quilt.inc
index ff94cc9..48ed9ba 100644
--- a/meta/recipes-devtools/quilt/quilt.inc
+++ b/meta/recipes-devtools/quilt/quilt.inc
@@ -18,15 +18,6 @@ inherit autotools-brokensep ptest
 
 CLEANBROKEN = "1"
 
-PACKAGES += "guards guards-doc"
-FILES_${PN} = "${sysconfdir} ${datadir}/quilt \
-               ${bindir}/quilt ${libdir}/quilt"
-FILES_guards = "${bindir}/guards"
-FILES_${PN}-doc = "${mandir}/man1/quilt.1 ${docdir}/${BPN}"
-FILES_guards-doc = "${mandir}/man1/guards.1"
-
-RDEPENDS_${PN} = "bash"
-
 EXTRA_OECONF = "--with-perl='${USRBINPATH}/env perl' --with-patch=patch"
 
 CACHED_CONFIGUREVARS += "ac_cv_path_BASH=/bin/bash"
@@ -42,7 +33,7 @@ do_configure_append () {
 	sed -e 's,^COMPAT_SYMLINKS.*:=.*,COMPAT_SYMLINKS	:=,' -i ${S}/Makefile
 }
 
-# quilt ignores DESTDIR
+# quilt Makefiles install to BUILD_ROOT instead of DESTDIR
 do_install () {
 	oe_runmake 'BUILD_ROOT=${D}' install
 	# cleanup unpackaged files
@@ -62,6 +53,15 @@ do_install_ptest() {
 	cp ${WORKDIR}/test.sh ${D}${PTEST_PATH}
 }
 
+PACKAGES += "guards guards-doc"
+
+FILES_${PN} = "${sysconfdir} ${datadir}/quilt \
+               ${bindir}/quilt ${libdir}/quilt"
+FILES_guards = "${bindir}/guards"
+FILES_${PN}-doc = "${mandir}/man1/quilt.1 ${docdir}/${BPN}"
+FILES_guards-doc = "${mandir}/man1/guards.1"
+
+RDEPENDS_${PN} = "bash"
 RDEPENDS_${PN}-ptest = "make file sed gawk diffutils findutils ed perl \
                         perl-module-filehandle perl-module-getopt-std \
                         perl-module-posix perl-module-file-temp \
-- 
1.9.1


