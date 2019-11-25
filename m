Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 676647FC0B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 12:05:15 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id t2so17697130wrr.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 04:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=6B2pb05XM7uy+VvsNjIK2oeWMzh1Z8Uj6YiPmb1SSug=;
	b=wU6+EPyt0AwA3RO0BlWkp306cbu4cEY9Pb4nL9pDhYaPPILv4PWUo2nn7iuvvWheUq
	IzM5/jaceZerhUDhVouYPI9dkeiZ44NCj1plmxfQSQ60kkfKPAaOEhMsZ1bP0xwWAbNr
	qEyn6/dVK0yZaw45mRXkvRL8ttvPVvtUotLi5ypt+sP4jLTIv7DsZHI1UBV3l9MuUrY7
	H+wEBJDUMleXWKpH3msYuqnETvtyR2uzfAo5v1fqGlWL6N4drZjWv3v6jLtjjjbZJb6a
	hezsRtm7J+oZMGXUkBBxstRT9cFU0mG2+jamV56x8yiAO4m9TD9JfTnhfqPT0KE+5PMD
	61Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6B2pb05XM7uy+VvsNjIK2oeWMzh1Z8Uj6YiPmb1SSug=;
	b=M5EeoJfL8VIV0us2nBT1bS9pMqsxn4ux820AOXT8+J5HUP2nng7hMIsn4riPVH2JYr
	HyEh9sOJe1OvSNw37MzsAjarzLAUdhmWaGJYvc1CsP+wQR7ARAkz6rJiWlMm5GbAcqd4
	d4pi5tr28l8T1JpMwzNrsZSfiRwvS79NQPyR3gCBCvEb0g9pC7ngIiouF+LUKfFrs67C
	G5wuqQiiplK2hCyp77qDzRMe02vAI4gVCasekw644ArghtGKnd7XbS7WdulLSNOa4oqv
	t6Ys55v1rrRPDAnBQsIghNPSrMBrnSfOGv72ox4ycqRYOKsMo3dj6Gy1BtkNwEpMWU7a
	jNvg==
X-Gm-Message-State: APjAAAW2LHQ1ZdzPEH8Rw3rk2Qp55c1XcwC4fB56oynWF0Jl4ZsbB+6M
	A2B9f3q9VhINpKfapG8vf4niJ0H4AoE=
X-Google-Smtp-Source: APXvYqzyABpMBa5vZqeu5l4BXwI+MuTidwY5cV3qgkD4DY05dx4SiDnso9RBNndEy+gQdnkC4LvkyQ==
X-Received: by 2002:a5d:6b51:: with SMTP id x17mr32910979wrw.148.1574683515860;
	Mon, 25 Nov 2019 04:05:15 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	e16sm10227411wrj.80.2019.11.25.04.05.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 04:05:15 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 12:04:35 +0000
Message-Id: <20191125120435.5203-4-ross.burton@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191125120435.5203-1-ross.burton@intel.com>
References: <20191125120435.5203-1-ross.burton@intel.com>
MIME-Version: 1.0
Subject: [PATCH 4/4] texi2html: remove
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
X-List-Received-Date: Mon, 25 Nov 2019 12:05:15 -0000
Content-Transfer-Encoding: 8bit

The last user of this obsolete recipe (abandoned upstream in 2010, removed from
oe-core build dependencies in 2012) has now been deleted from oe-core, so delete
the recipe too.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 .../0001-Allow-compiling-out-of-source.patch  | 39 -------------------
 .../texi2html/texi2html_5.0.bb                | 31 ---------------
 3 files changed, 71 deletions(-)
 delete mode 100644 meta/recipes-extended/texi2html/files/0001-Allow-compiling-out-of-source.patch
 delete mode 100644 meta/recipes-extended/texi2html/texi2html_5.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index a289008b8c1..79404dfbdb7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -677,7 +677,6 @@ RECIPE_MAINTAINER_pn-tcf-agent = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-tcl = "Yi Zhao <yi.zhao@windriver.com>"
 RECIPE_MAINTAINER_pn-tcp-wrappers = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-testexport-tarball = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER_pn-texi2html = "Robert Yang <liezhi.yang@windriver.com>"
 RECIPE_MAINTAINER_pn-texinfo = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-texinfo-dummy-native = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-tiff = "Alexander Kanavin <alex.kanavin@gmail.com>"
diff --git a/meta/recipes-extended/texi2html/files/0001-Allow-compiling-out-of-source.patch b/meta/recipes-extended/texi2html/files/0001-Allow-compiling-out-of-source.patch
deleted file mode 100644
index 0cf025ff4a5..00000000000
--- a/meta/recipes-extended/texi2html/files/0001-Allow-compiling-out-of-source.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From: Olaf Mandel <o.mandel@menlosystems.com>
-Date: Fri, 21 Oct 2016 13:04:44 +0000
-Subject: [PATCH] Allow compiling out-of-source
-
-Upstream-Status: Backport of [svn://svn.sv.gnu.org/texinfo/trunk r3602]
----
- Makefile.am | 2 +-
- Makefile.in | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 3447463..c9b5b5c 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -208,7 +208,7 @@ i18n/en.thl i18n/: $(po_document_dir)/po_document/$(PACKAGE)_document.pot
- 	  done; \
- 	  msgexec -i $< "$(srcdir)/gettext_to_separated.pl" | "$(srcdir)/separated_to_hash.pl" en > i18n/en.thl; \
- 	else \
--	  cp -p i18n_ref/*.thl i18n; \
-+	  cp -p "$(srcdir)/i18n_ref/"*.thl i18n; \
- 	fi
- 
- i18n_ref:
-diff --git a/Makefile.in b/Makefile.in
-index 4264b37..a13f84d 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -1126,7 +1126,7 @@ i18n/en.thl i18n/: $(po_document_dir)/po_document/$(PACKAGE)_document.pot
- 	  done; \
- 	  msgexec -i $< "$(srcdir)/gettext_to_separated.pl" | "$(srcdir)/separated_to_hash.pl" en > i18n/en.thl; \
- 	else \
--	  cp -p i18n_ref/*.thl i18n; \
-+	  cp -p "$(srcdir)/i18n_ref/"*.thl i18n; \
- 	fi
- 
- i18n_ref:
--- 
-2.1.4
-
diff --git a/meta/recipes-extended/texi2html/texi2html_5.0.bb b/meta/recipes-extended/texi2html/texi2html_5.0.bb
deleted file mode 100644
index afd125b08fa..00000000000
--- a/meta/recipes-extended/texi2html/texi2html_5.0.bb
+++ /dev/null
@@ -1,31 +0,0 @@
-SUMMARY = "Perl script that converts Texinfo to HTML"
-HOMEPAGE    = "http://www.nongnu.org/texi2html/"
-SECTION     = "console/utils"
-LICENSE     = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-
-PR = "r2"
-
-SRC_URI     = "${SAVANNAH_GNU_MIRROR}/texi2html/${BPN}-${PV}.tar.bz2 \
-               file://0001-Allow-compiling-out-of-source.patch \
-               "
-
-SRC_URI[md5sum] = "f15ac876fcdc8be865b16535f480aa54"
-SRC_URI[sha256sum] = "e8a98b0ee20c495a6ab894398a065ef580272dbd5a15b1b19e8bd1bc89d9f9fa"
-
-inherit autotools gettext texinfo
-
-do_configure_prepend() {
-	# autotools_do_configure updates po/Makefile.in.in, we also need
-	# update po_document.
-	cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po_document/
-	cp -f ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/po_messages/
-}
-
-do_install_append () {
-	sed -i -e '1s,#!.*perl,#! ${USRBINPATH}/env perl,' ${D}${bindir}/texi2html
-}
-
-FILES_${PN}-doc += "${datadir}/texinfo"
-
-RDEPENDS_${PN} = "perl"
-- 
2.20.1


