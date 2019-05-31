Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id 18A597E57D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 15:56:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id n4so1609731wrw.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2019 08:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HwjlvZudklpUgCcF2LVzbO3j59fKv9N1LslXvzzAogg=;
	b=CvEwEWM9+aRFDlIo48O/UQ6+5Emjx7h/Tf0+WO/b1/suo4ka7Tmma2v/TnSRDsGife
	hPTsok2LebL6CVu9yDwoBcnjVhHci254UZzIVq71rmTjfc4ivqNiCN/YUYLtKKUBgxMC
	Lmhp64igOglR3FTg2sajodXw0MBPKzsz5vPs3noxuwQNEVMHreZULk2BVDtJ5Mwa+nEe
	NqB1EKfQUUwdlMSaZGaXrdGIRmlFH9+Xs3rkjT9Sg9vQcOSNtkK5TgYKqqYcsHOTPxAf
	JLrMX3uaxdTVtqO8GSYYmLth+OVgNM0A6rNX8VPpfmydW7Fw9Go7vD3/2+bacEdKtgAi
	y1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HwjlvZudklpUgCcF2LVzbO3j59fKv9N1LslXvzzAogg=;
	b=jCNqWWTaGbtQUsqqaxBT5zNM1reMIBHA1RiaacigA+GVe0EgH5zmEV0lwLNcgKdupV
	Lljm5lE9M+hWfDKbDcMs5ZUoxVmIB+qqd2aAJgSUC1C90mgK+7IJdndw2w9HluwJPDS+
	AgQwZlDsvmEoRigAX2IM7oE4pAV0J4R5AmX+2Wyw8efCIAZvD3UgW2kGuYctE4eHrava
	MxBa7rFIX39peOHH/u9CzdVNHWxLnyH6TUiiGv4bOf9d4tosK9BWHyDnK9QfPYmmT323
	a27zsKGQd2EDrJtfA4ROEIefuNYXbzdZf4+GK331y7dxeBcowC9HL9ujsCYAaRBcYLwt
	rJig==
X-Gm-Message-State: APjAAAXGeolToWq5jPVeFkGmHTzZQr9GA5Q7u4W2E6i9+PqD9dj246Cv
	tG9nv54VPxLipOJbN+OiJx5H82LVCNzi+Q==
X-Google-Smtp-Source: APXvYqxzhJpjZdYV+sIY3TimQpZLrAvPw4S1SWTlVq18c/28Vvhr+yI64t6TojDurUYqpXYjHSZfRA==
X-Received: by 2002:a5d:4e46:: with SMTP id r6mr6920173wrt.290.1559318184629; 
	Fri, 31 May 2019 08:56:24 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	u19sm16496445wmu.41.2019.05.31.08.56.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 May 2019 08:56:23 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2019 17:56:09 +0200
Message-Id: <20190531155612.75663-5-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190531155612.75663-1-alex.kanavin@gmail.com>
References: <20190531155612.75663-1-alex.kanavin@gmail.com>
Subject: [PATCH 5/8] source-highlight: remove the recipe
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
X-List-Received-Date: Fri, 31 May 2019 15:56:24 -0000

gtk-doc was the only user, and has been switched over to python3-pygments.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 ....pc.in-do-not-add-Boost-s-libraries-.patch | 30 -------------------
 .../source-highlight_3.1.8.bb                 | 28 -----------------
 3 files changed, 59 deletions(-)
 delete mode 100644 meta/recipes-support/source-highlight/files/0001-source-highlight.pc.in-do-not-add-Boost-s-libraries-.patch
 delete mode 100644 meta/recipes-support/source-highlight/source-highlight_3.1.8.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 35f10c2a91a..d6f66510e32 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -645,7 +645,6 @@ RECIPE_MAINTAINER_pn-shutdown-desktop = "Alexander Kanavin <alex.kanavin@gmail.c
 RECIPE_MAINTAINER_pn-signing-keys = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER_pn-slang = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-socat = "Hongxu Jia <hongxu.jia@windriver.com>"
-RECIPE_MAINTAINER_pn-source-highlight = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER_pn-speex = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-speexdsp = "Tanu Kaskinen <tanuk@iki.fi>"
 RECIPE_MAINTAINER_pn-sqlite3 = "Anuj Mittal <anuj.mittal@intel.com>"
diff --git a/meta/recipes-support/source-highlight/files/0001-source-highlight.pc.in-do-not-add-Boost-s-libraries-.patch b/meta/recipes-support/source-highlight/files/0001-source-highlight.pc.in-do-not-add-Boost-s-libraries-.patch
deleted file mode 100644
index b0aa5d17393..00000000000
--- a/meta/recipes-support/source-highlight/files/0001-source-highlight.pc.in-do-not-add-Boost-s-libraries-.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 9aa01fd5f9d8b2b98c34684dc8f68115750ef41c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 12 Jul 2016 17:15:13 +0300
-Subject: [PATCH] source-highlight.pc.in: do not add Boost's libraries and
- includes
-
-This breaks when compiling in sysroots; a proper way is to use Depends
-
-Upstream-Status: Pending
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- source-highlight.pc.in | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/source-highlight.pc.in b/source-highlight.pc.in
-index 79ab63e..64114a7 100644
---- a/source-highlight.pc.in
-+++ b/source-highlight.pc.in
-@@ -7,6 +7,6 @@ Name: libsource-highlight
- Description: GNU Source-highlight library.
- URL: http://www.gnu.org/software/src-highlite/
- Version: @VERSION@
--Libs: -L${libdir} -lsource-highlight @BOOST_LDFLAGS@ @BOOST_REGEX_LIB@
--Cflags: -I${includedir} @BOOST_CPPFLAGS@
-+Libs: -L${libdir} -lsource-highlight
-+Cflags: -I${includedir}
- 
--- 
-2.8.1
-
diff --git a/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb b/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb
deleted file mode 100644
index 85923e47596..00000000000
--- a/meta/recipes-support/source-highlight/source-highlight_3.1.8.bb
+++ /dev/null
@@ -1,28 +0,0 @@
-SUMMARY = "Syntax highlight utility"
-DESCRIPTION = "Source-highlight converts source code to formatted text with syntax highlighting."
-HOMEPAGE = "https://www.gnu.org/software/src-highlite/"
-LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ff95bfe019feaf92f524b73dd79e76eb"
-
-SRC_URI = "${GNU_MIRROR}/src-highlite/${BPN}-${PV}.tar.gz \
-           file://0001-source-highlight.pc.in-do-not-add-Boost-s-libraries-.patch"
-SRC_URI[md5sum] = "3243470706ef5fefdc3e43b5306a4e41"
-SRC_URI[sha256sum] = "01336a7ea1d1ccc374201f7b81ffa94d0aecb33afc7d6903ebf9fbf33a55ada3"
-
-inherit autotools
-
-DEPENDS_append = " boost"
-
-DEPENDS_append_class-target = " source-highlight-native"
-
-EXTRA_OECONF = "--with-boost=yes --with-boost-libdir=${STAGING_DIR_TARGET}${libdir}"
-
-BBCLASSEXTEND = "native"
-
-# source-highlight is using its own binary from the build tree to make documentation
-# let's substitute the native binary instead
-do_configure_prepend_class-target () {
-        sed -i -e 's,^SRCHILITEEXE = $(top_builddir).*,SRCHILITEEXE = source-highlight,' ${S}/doc/Makefile.am
-}
-
-RDEPENDS_source-highlight += "bash"
-- 
2.17.1


