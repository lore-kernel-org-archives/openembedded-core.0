Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 3A50F74536
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 13:06:35 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id c14-v6so5189407wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id;
	bh=kuDWCv9es68lgtyealUjMgO6y7buZ4Hi72LSrcwp9Yw=;
	b=R4uIQ0o2kmLLwpJT+65Dc0v7/uyFPDgpkHtXnNSqTcl7ZFd9YuV8GS7gW/XKqLOFna
	JlPWCoTDNvJDk0urrrmc0jrTSXDcZETnWU6y51INdtV4GxFBpQx9ahyPZNvcOiPjRLGi
	1i37WdyFie9NBdWxWhNA9ZRmAzH6lAScd3MOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=kuDWCv9es68lgtyealUjMgO6y7buZ4Hi72LSrcwp9Yw=;
	b=fO6T/1dWlfOumd1aDlcA6VseIkCK3Rj88bf4SMczXpnhJLVqD3OX+vKZR8jYfYCbPD
	F9pq5PeyKrEU7CTSQs6dAFBVHxIDiyYViQu3EmeLGoHgPuYKVFrsS0IczVbi2N/oMPNF
	kxd10MGLEZJa1mrOAAFIC8K78Sgr9ip1W22Fsn4d0CrYtZyDLCwXqWMAZqroitqzlYMR
	oL41PijsUqCsvQ5b0eLO9yNOMIX6e01Y61EdS003XGTpK4B7loAz1jfvxNJRY3cZbykf
	JirnEv/Hqw2+W3Cll/l+WbPVTuTzTg+IfbiOiXfYBdXfrP0xZ/D5+SPtgMkar7SbjQuX
	N9nA==
X-Gm-Message-State: APzg51AP/HPevilHuZfQEFJNRT54MT8EgPtaD2iVDGBEkcSY7hCktq2E
	mB4LSjfSLCFoblhd94SmkXkVQ99qfsQ=
X-Google-Smtp-Source: ANB0VdYlITnweLivGhYeyUSY/nkfGwTThd1NjNaXfCmyVbAnYWwYNswQGbR2JwLZ2nqSJbdSq3MCfg==
X-Received: by 2002:a1c:9215:: with SMTP id
	u21-v6mr4716723wmd.106.1535720796376; 
	Fri, 31 Aug 2018 06:06:36 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	204-v6sm6766743wmh.25.2018.08.31.06.06.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 06:06:35 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Aug 2018 14:06:34 +0100
Message-Id: <20180831130634.9602-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] recipes: Update git.gnome.org addresses after upstream changes
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
X-List-Received-Date: Fri, 31 Aug 2018 13:06:36 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/clutter.bbclass                                  | 2 +-
 meta/classes/mirrors.bbclass                                  | 2 +-
 meta/conf/bitbake.conf                                        | 2 +-
 .../mobile-broadband-provider-info_git.bb                     | 2 +-
 meta/recipes-core/glib-networking/glib-networking_2.54.1.bb   | 2 +-
 meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb  | 4 ++--
 .../gnome-desktop-testing/update-output-syntax.patch          | 2 +-
 meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch  | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes/clutter.bbclass b/meta/classes/clutter.bbclass
index 167407dfdcf..f5cd04f97f7 100644
--- a/meta/classes/clutter.bbclass
+++ b/meta/classes/clutter.bbclass
@@ -14,7 +14,7 @@ REALNAME = "${@get_real_name("${BPN}")}"
 
 CLUTTER_SRC_FTP = "${GNOME_MIRROR}/${REALNAME}/${VERMINOR}/${REALNAME}-${PV}.tar.xz;name=archive"
 
-CLUTTER_SRC_GIT = "git://git.gnome.org/${REALNAME}"
+CLUTTER_SRC_GIT = "git://gitlab.gnome.org/GNOME/${REALNAME};protocol=https"
 
 SRC_URI = "${CLUTTER_SRC_FTP}"
 S = "${WORKDIR}/${REALNAME}-${PV}"
diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index ed53dfbca62..87bba41472e 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -69,7 +69,7 @@ ${CPAN_MIRROR}  http://search.cpan.org/CPAN/ \n \
 
 MIRRORS += "\
 git://salsa.debian.org/.*     git://salsa.debian.org/PATH;protocol=https \n \
-git://git.gnome.org/.*        git://git.gnome.org/browse/PATH;protocol=https \n \
+git://git.gnome.org/.*        git://gitlab.gnome.org/GNOME/PATH;protocol=https \n \
 git://git.savannah.gnu.org/.* git://git.savannah.gnu.org/git/PATH;protocol=https \n \
 git://git.yoctoproject.org/.* git://git.yoctoproject.org/git/PATH;protocol=https \n \
 git://.*/.*                   git://HOST/PATH;protocol=https \n \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 1941633a54b..faef77142ab 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -627,7 +627,7 @@ BBLAYERS_FETCH_DIR ??= "${COREBASE}"
 APACHE_MIRROR = "http://archive.apache.org/dist"
 DEBIAN_MIRROR = "http://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
-GNOME_GIT = "git://git.gnome.org"
+GNOME_GIT = "git://gitlab.gnome.org/GNOME"
 GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
 GNU_MIRROR = "http://ftp.gnu.org/gnu"
 GNUPG_MIRROR = "https://www.gnupg.org/ftp/gcrypt"
diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 7b64b25e89a..863b15a78da 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -7,7 +7,7 @@ SRCREV = "befcbbc9867e742ac16415660b0b7521218a530c"
 PV = "20170310"
 PE = "1"
 
-SRC_URI = "git://git.gnome.org/mobile-broadband-provider-info \
+SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info;protocol=https \
            file://multilibfix.patch \
 "
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
index 2a6f8af2b46..5d17a824f08 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
@@ -1,6 +1,6 @@
 SUMMARY = "GLib networking extensions"
 DESCRIPTION = "glib-networking contains the implementations of certain GLib networking features that cannot be implemented directly in GLib itself because of their dependencies."
-HOMEPAGE = "http://git.gnome.org/browse/glib-networking/"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/glib-networking/"
 BUGTRACKER = "http://bugzilla.gnome.org"
 
 LICENSE = "LGPLv2"
diff --git a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
index c71ab1165d5..9d8fb28281c 100644
--- a/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
+++ b/meta/recipes-graphics/cantarell-fonts/cantarell-fonts_git.bb
@@ -5,7 +5,7 @@ DESCRIPTION = "The Cantarell font typeface is designed as a \
                on-screen reading; in particular, reading web pages on an \
                HTC Dream mobile phone."
 
-HOMEPAGE = "https://git.gnome.org/browse/cantarell-fonts/"
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/cantarell-fonts/"
 SECTION = "fonts"
 LICENSE = "OFL-1.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=df91e3ffcab8cfb972a66bf11255188d"
 PV = "0.0.24"
 
 SRCREV = "07b6ea2cbbebfc360aa4668612a376be5e214eaa"
-SRC_URI = "git://git.gnome.org/cantarell-fonts;protocol=git;branch=master"
+SRC_URI = "git://gitlab.gnome.org/GNOME/cantarell-fonts;protocol=https;branch=master"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!0\.13)(?!0\.10\.1)\d+\.\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/update-output-syntax.patch b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/update-output-syntax.patch
index 5a178e2ef12..19c524b0ac6 100644
--- a/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/update-output-syntax.patch
+++ b/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing/update-output-syntax.patch
@@ -3,7 +3,7 @@ The terms `FAIL` instead of `FAILED` and `SKIP` instead of `SKIPPED`
 match what Automake does
 
 Upstream-Status: Accepted
-[ https://git.gnome.org/browse/gnome-desktop-testing/commit/?id=048850731a640532ef55a61df7357fcc6d2ad501 ]
+[ https://gitlab.gnome.org/GNOME/gnome-desktop-testing/commit/048850731a640532ef55a61df7357fcc6d2ad501 ]
 
 Signed-off-by: Maxin B. John <maxin.john@intel.com>
 ---
diff --git a/meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch b/meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch
index 424c976d9b9..ea3ae51e937 100644
--- a/meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch
+++ b/meta/recipes-support/libxslt/libxslt/fix-rvts-handling.patch
@@ -5,7 +5,7 @@ libxslt-1.1.32: Fix handling of RVTs returned from nested EXSLT functions
 Set the context variable to NULL when evaluating EXSLT functions.
 Fixes potential use-after-free errors or memory leaks.
 
-Upstream-Status: Backport [https://git.gnome.org/browse/libxslt/commit/?id=8bd32f7753ac253a54279a0b6a88d15a57076bb0]
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxslt/commit/8bd32f7753ac253a54279a0b6a88d15a57076bb0]
 bug: 792580
 Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
 
-- 
2.17.1


