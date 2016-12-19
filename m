Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id BF43F770A6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Dec 2016 06:40:11 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 144so7062436pfv.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2016 22:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UQ5ChITtv32bo077nUBSkZEnoSNTXmuSK8zrVAu7qTE=;
	b=KSJffHwegEaoYaOsfp6FvVj3hztHUKtcufaeljxc5Iq0ADQSLaIesh4pcvT7/YHR5i
	C7C4h708JPZNcBT0DKBdmTq7bFO70i8K5YJNIWT2gV+Nb2NVcA6GtIJZ4riuRh9PXgO6
	BHmb8c7fpqnSC7AfQBjOwkpjByvrfCA7kHP9SiX2hR7TUrLe/BcNdq1POggahZ5q5ZcN
	MPr8Br/QzmgzO80vUdtFYwEfqOHkEGdJhvc5/ATuHQUscohBVL3z1dKBf450WXgSL0k2
	hHcXTskV8bNrGd8/ofJvA1CbgpYYt+TM6wLMFnIK1Q5rISogvrAydjDoxrbaWPrbGy0M
	+oDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UQ5ChITtv32bo077nUBSkZEnoSNTXmuSK8zrVAu7qTE=;
	b=EexbD0TRwal5Ld/OW8JjWCpNVBbngWwlcvTBryF++PkdZQGXKXASjfpBQmxUd0k9yi
	URNEeqgF17zGD8eNRNbe04Sh2xY29+1pLBzovbIeYDRz7Q8DWrMCEUjtL4BEBeHjpC7T
	2lnLBVGAWmnQlAzsr27KhPr4ZcfTF84MheIdVvOV3I1cO2XAU1yXIBpJmd+Czt1P3wdv
	NFruC7Hrg/A9q+lJGW49STeUBDITdjfBsnAQ7A+/4sUVfHQwUlgQqqVCqjMVA/b043ag
	qiZ3B5s2+qnsvDYWbLkvgqmBXEeZrgHhKnsrex4x8BRQSDjDc0QiHsuqFbDb78OPRIsH
	Jy/g==
X-Gm-Message-State: AKaTC00S9XIn4WbU6qrpCSqyy8PLizmZnyX7nNyFrF8zK+CcLLqFB3kIZS3sLNdO9j4Aag==
X-Received: by 10.99.116.25 with SMTP id p25mr26274286pgc.161.1482129613209;
	Sun, 18 Dec 2016 22:40:13 -0800 (PST)
Received: from localhost.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	72sm28238304pfw.37.2016.12.18.22.40.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Dec 2016 22:40:12 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2016 22:39:57 -0800
Message-Id: <20161219063957.18716-10-raj.khem@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20161219063957.18716-1-raj.khem@gmail.com>
References: <20161219063957.18716-1-raj.khem@gmail.com>
Subject: [V2 10/10] gdk-pixbuf: Update to 2.36.1
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
X-List-Received-Date: Mon, 19 Dec 2016 06:40:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.36.0.bb => gdk-pixbuf_2.36.1.bb}      | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.36.0.bb => gdk-pixbuf_2.36.1.bb} (95%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
similarity index 95%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
index 9efe374c0d..debc2d706a 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.36.1.bb
@@ -18,9 +18,8 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://run-ptest \
            file://fatal-loader.patch \
            "
-
-SRC_URI[md5sum] = "1a3baf91956c7923dab49ee3de100ce1"
-SRC_URI[sha256sum] = "85ab52ce9f2c26327141b3dcf21cca3da6a3f8de84b95fa1e727d8871a23245c"
+SRC_URI[md5sum] = "fe30b0420e013f2c4590ae6226d895d4"
+SRC_URI[sha256sum] = "9d5ba72070460c1b5b74115d395a3e33daeb7b7b67fb256cdccc9d7187c42a38"
 
 inherit autotools pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gtk-doc
 
@@ -46,7 +45,7 @@ PACKAGES =+ "${PN}-xlib"
 FILES_${PN}-xlib = "${libdir}/*pixbuf_xlib*${SOLIBS}"
 ALLOW_EMPTY_${PN}-xlib = "1"
 
-FILES_${PN} += "${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders"
+FILES_${PN} += "${libdir}/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders ${datadir}/thumbnailers"
 
 FILES_${PN}-dev += " \
 	${bindir}/gdk-pixbuf-csource \
-- 
2.11.0


