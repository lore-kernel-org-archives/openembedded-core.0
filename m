Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 999CF770CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 17:36:28 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id i5so4047975pag.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 May 2016 10:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=xNeodsDQMg+/JY0dCkzq/HDuh4SH5dRbeRlzthcERH8=;
	b=FrVI6cjLeSDDEm6Ng03vDpPJLvr3D52fBYeEsESAyZiCAywpCYKeJ1DFAxtqKDMsgp
	8EURT0dy+Tii65YRrR3MQyM3eppVf/JQ60o0ISNFLyERupRurHRVNzSuFdgLuhHjhcC0
	A4V3t1erBDahP7EExlmRIGIFDYnMZM6D3A5RPKlHAqCMGXIn8fMv89maBIw+Lz1Z6/xF
	hFARv+HjvQMNstmobeFvw5qsR564OYP7wes4IjpGrH3PPBhjlVeJ8NTXKhuG/VPinL0h
	RE5XCr2EBCNOd4PW45A9X8D3t6rnXHMefn1bwBuGt3oPndGi0tHzMrNVd3OYOhSq1IOR
	vuQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:in-reply-to:references;
	bh=xNeodsDQMg+/JY0dCkzq/HDuh4SH5dRbeRlzthcERH8=;
	b=YwyGU7+FJxuOg1nPjBw/1ImwQyNMw1c1Lb+SF7F0xGIK2WSjJb050fLFzXuZO3S1w7
	a3yLYBhzi6FN3fWX5KoOupY1pS2iHiuxfxLDIqRciE+zdRPBFo+NEak9FsTzZ+I9GZ1F
	SwpDRHgJI8CPxLa0IwNvOtqXj1Ls6uoEp85+LnR0nts+IQRkGpq36fJ5YDY+lzq5e/YX
	OfaqHw/ITLlR4PxgxVfp72K2fYI/498TDJ7Gr4a8eP0ovmQ196j69e8fDcutGk0br+CW
	xhR+A/XKTTQo4k3ZLYAwwmr9DxCmYwjvw/y9XT7TgDgAf5NJ0wRymtbpDjCO/bImjF/8
	P9rA==
X-Gm-Message-State: AOPr4FXoBz7ko+IIWeEaVO05Y+cC9pSEOCpRtz3xdY+AYsP4bd6JQ2P3i5DO3yO5bMvw8A==
X-Received: by 10.66.33.1 with SMTP id n1mr6772139pai.65.1462988189649;
	Wed, 11 May 2016 10:36:29 -0700 (PDT)
Received: from haswell.localdomain (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	a5sm13669903pat.19.2016.05.11.10.36.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 May 2016 10:36:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 10:35:42 -0700
Message-Id: <10250cc81c08bc1bde2ceea15028608faa3b27d1.1462987863.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.8.2
In-Reply-To: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
References: <2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
In-Reply-To: <cover.1462987863.git.raj.khem@gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
Subject: [PATCH 39/42] distcc: Upgrade to 3.2
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
X-List-Received-Date: Wed, 11 May 2016 17:36:29 -0000

Helps compiling with clang as a side effect

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../distcc/{distcc_3.1.bb => distcc_3.2.bb}                |  8 ++++----
 meta/recipes-devtools/distcc/files/separatebuilddir.patch  | 14 +++++++-------
 2 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/distcc/{distcc_3.1.bb => distcc_3.2.bb} (91%)

diff --git a/meta/recipes-devtools/distcc/distcc_3.1.bb b/meta/recipes-devtools/distcc/distcc_3.2.bb
similarity index 91%
rename from meta/recipes-devtools/distcc/distcc_3.1.bb
rename to meta/recipes-devtools/distcc/distcc_3.2.bb
index f8879c8..600ec96 100644
--- a/meta/recipes-devtools/distcc/distcc_3.1.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.2.bb
@@ -5,7 +5,7 @@ SECTION = "devel"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-DEPENDS = "avahi"
+DEPENDS = "avahi binutils"
 
 GTKCONFIG = "gtk"
 GTKCONFIG_libc-uclibc = ""
@@ -17,19 +17,19 @@ PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
 
 RRECOMMENDS_${PN} = "avahi-daemon"
 
-SRC_URI = "git://github.com/distcc/distcc.git \
+SRC_URI = "git://github.com/distcc/distcc.git;branch=${PV} \
            file://separatebuilddir.patch \
            file://0001-zeroconf-Include-fcntl.h.patch \
            file://default \
            file://distccmon-gnome.desktop \
            file://distcc \
            file://distcc.service"
-SRCREV = "9a172d3d20042754a30c0cd9a5d63fd1a8120c31"
+SRCREV = "d8b18df3e9dcbe4f092bed565835d3975e99432c"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d useradd systemd
 
-EXTRA_OECONF += "--disable-Werror PYTHON=/dev/null"
+EXTRA_OECONF += "--disable-Werror PYTHON='' --disable-pump-mode"
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system \
diff --git a/meta/recipes-devtools/distcc/files/separatebuilddir.patch b/meta/recipes-devtools/distcc/files/separatebuilddir.patch
index b9e3e42..7580b55 100644
--- a/meta/recipes-devtools/distcc/files/separatebuilddir.patch
+++ b/meta/recipes-devtools/distcc/files/separatebuilddir.patch
@@ -6,16 +6,16 @@ RP 2013/3/8
 
 Upstream-Status: Pending
 
-Index: distcc-3.1/Makefile.in
+Index: git/Makefile.in
 ===================================================================
---- distcc-3.1.orig/Makefile.in	2008-12-02 21:50:31.000000000 +0000
-+++ distcc-3.1/Makefile.in	2013-03-08 10:49:24.224400937 +0000
-@@ -1088,7 +1088,7 @@
+--- git.orig/Makefile.in
++++ git/Makefile.in
+@@ -1117,7 +1117,7 @@ install-example: $(example_DOCS)
  install-gnome-data: $(gnome_data)
  	$(mkinstalldirs) "$(DESTDIR)$(pkgdatadir)"
- 	for p in $(gnome_data); do				\
--	$(INSTALL_DATA) "$$p" "$(DESTDIR)$(pkgdatadir)" || exit 1; \
-+	$(INSTALL_DATA) "$(srcdir)/$$p" "$(DESTDIR)$(pkgdatadir)" || exit 1; \
+ 	for p in $(gnome_data); do \
+-	  $(INSTALL_DATA) "$$p" "$(DESTDIR)$(pkgdatadir)" || exit 1; \
++	  $(INSTALL_DATA) "$(srcdir)/$$p" "$(DESTDIR)$(pkgdatadir)" || exit 1; \
  	done
  
  install-conf: $(conf_files) $(default_files)
-- 
2.8.2


