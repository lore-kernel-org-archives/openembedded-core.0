Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 11E467E63C
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Jun 2019 11:26:30 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 16so3152292wmg.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Jun 2019 04:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HwjlvZudklpUgCcF2LVzbO3j59fKv9N1LslXvzzAogg=;
	b=f64crMLQ1fYYFaDTEKoupoIQOLg9SBE0z1Gp3n1F+OykEzU+lEEaWdN+SBdWZPj9Ya
	g1/IAjd3AGfbvS4qRO/qqJrBBIo4XQ4ptpRWgfj3LZ1U2P0Xvf+gYfM2GGpxTQPA+/rG
	Kj6rXIreiFSp1xrZ1AMuD82QS8+2W6jauQvgsQo6RMAG6xx8ka+nAXiP28PRWUFtl+cn
	vW9SQdKUVS7jXU+8fysM8cdX+rGOqudOn7EEX9V2pPjYM4V1jAcuf5VA8Ts2/TqlaNg1
	uzpw+TEfTQ22PRQnooyv5FmbBmqRnaJJzHjAqLPfSZ9dXOVfqz/o69tvCpKEvhr6Jpp2
	Y9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=HwjlvZudklpUgCcF2LVzbO3j59fKv9N1LslXvzzAogg=;
	b=flIQOwN/O1QhJx05NUshkJRTfI6kY2jlzrJ9TwsAdH4JtvPeNTxyqsc76qzvitt0yT
	7tNziWgwyLIFjqKAdfzzQAfwhx5oXGPlbV35+ij7xtLtReo7ymAzVNacKadoImfV6wSg
	twEAD5fu8DWcFkFp+Gdm5pyEVdyHphb6Bpoxhi+45pHuFqXP+7/8eDjWPaUf6n2P+ptr
	5Y9vuToODD8RSfSqDO/UH3Uabc/NMLom57ePqji0vtu5cXjq9FUkVnacysSHuEZ8JpRX
	Q9+ayO0F7/BLmxJMfVn3gfpcy38Rb4rp/ijksbzJJVNmZV1B7+izKBXA5uGxR93MigcL
	zWGQ==
X-Gm-Message-State: APjAAAXqHIYTVgo9+oXz9f41NO9vpB/eyE2BthKIEwssN5fYaEHm3zI9
	vSwRIBc8v9If+FurEsh6EX6fD9qX5WE=
X-Google-Smtp-Source: APXvYqwsA15UwnkY5XJrl+BEAKM2N0i0lVpoThigsCLCCbgVQ+RRN3eJtVCm/RZxDMQMwW4jYlP9cw==
X-Received: by 2002:a7b:ca4c:: with SMTP id m12mr8264939wml.37.1559388391630; 
	Sat, 01 Jun 2019 04:26:31 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	y2sm16270606wra.58.2019.06.01.04.26.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 01 Jun 2019 04:26:30 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Jun 2019 13:26:22 +0200
Message-Id: <20190601112623.80424-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190601112623.80424-1-alex.kanavin@gmail.com>
References: <20190601112623.80424-1-alex.kanavin@gmail.com>
Subject: [PATCH 4/5] source-highlight: remove the recipe
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
X-List-Received-Date: Sat, 01 Jun 2019 11:26:31 -0000

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


