Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
	[209.85.128.43])
	by mail.openembedded.org (Postfix) with ESMTP id 48EC57EC4D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 13:49:10 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id z23so11846112wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Aug 2019 06:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3iLnQkKL6UY5X8gNWHAjypL2h2OgLIMv54fzCxrS1qI=;
	b=NCliRTrHHFzdAA1QLHZsLlKUurnoMl7+b4FX9QvQE+6IgRoqs/9UNnT8H8JE/2rtvH
	S5ip6oqLkZ3PSknzs0M5Lchl6NsmyYPhkgZ6cR0L6tUI+2rHwpnHCyNXzy2G2OJA559y
	bTGL7vgvCHdJ+ErBiWPtmYjUIACItdrpGygAzQkN1FQJkzlRbuVhTuas5iOJZMu545Vo
	pou6lJQjdF3P1XPXlSXbDnRwYJswp9CwtTmYlqGluCDMNM4kMRf5Kdeop2skmXmSSBbJ
	C3p6Srkirt1DYTLIPiNUmxSbCRxVv3tRHPOTjBf/8QRoWrTnPzPqRise/S3KTezrWKM2
	NI3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3iLnQkKL6UY5X8gNWHAjypL2h2OgLIMv54fzCxrS1qI=;
	b=ErWN8iUlz4WO2CkewywIGGs74IDB05XRTZDA/UegOupVuHGjwZgzVR/HEtfkDWJ8j0
	UpB7dS/i0B4NNEU29nQ6ACouXJ66NOQBmTRKflSjiRRqhmaRCmEQz1cbXZ14GfRL9jt7
	WCPFQ/rM6+MyziBCTxlLTjDlgCfppVt9VGFPIzDUiK9NoSP+gBFEqP0vdWvK7xIV8LEj
	8+ki/Vh+20blzmYMxtwmK5QDy1HL7XVbB/wUgssRX/UoFO9CWWEuBCtEQULkOgb2CQ05
	L/GWWeQflRrk30omKhPXi9rB0fJOAFln50JdpmuEMjbXaiIQBgFu8sFUhgyoXITJSs0I
	5elA==
X-Gm-Message-State: APjAAAVBJX93HObtO2gex11jSXlbT/gajVrwE2LKdLrcW8wuwjd0oFle
	Y7mNU3HuQpmS8dBOhZvmQ1AKCiCwz28=
X-Google-Smtp-Source: APXvYqzzVqgr6btJZ98LzfjMgE3BA9jQUdx9vdKU/YBd1WKJT9UvMWffTplyuU2MOIb6OhIbCC/53w==
X-Received: by 2002:a1c:3d89:: with SMTP id k131mr25681325wma.24.1565617750783;
	Mon, 12 Aug 2019 06:49:10 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	t14sm11932646wrv.12.2019.08.12.06.49.09
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 12 Aug 2019 06:49:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 12 Aug 2019 15:49:02 +0200
Message-Id: <20190812134903.55045-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190812134903.55045-1-alex.kanavin@gmail.com>
References: <20190812134903.55045-1-alex.kanavin@gmail.com>
Subject: [PATCH 3/4] python-scons: remove the python 2.x version of the recipe
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
X-List-Received-Date: Mon, 12 Aug 2019 13:49:10 -0000

Nothing in oe-core or meta-oe is using it (scons.bbclass is set
to use 3.x version).

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  2 --
 .../python/python-scons-native_3.1.0.bb       |  8 -------
 .../python/python-scons_3.1.0.bb              | 24 -------------------
 3 files changed, 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-scons-native_3.1.0.bb
 delete mode 100644 meta/recipes-devtools/python/python-scons_3.1.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index c713c811ffa..08fd83d3c4e 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -588,8 +588,6 @@ RECIPE_MAINTAINER_pn-puzzles = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-python = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-nose = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python-scons = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
-RECIPE_MAINTAINER_pn-python-scons-native = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python-setuptools = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3 = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
 RECIPE_MAINTAINER_pn-python3-async = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
diff --git a/meta/recipes-devtools/python/python-scons-native_3.1.0.bb b/meta/recipes-devtools/python/python-scons-native_3.1.0.bb
deleted file mode 100644
index 68b63c93579..00000000000
--- a/meta/recipes-devtools/python/python-scons-native_3.1.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require python-scons_${PV}.bb
-inherit native pythonnative
-DEPENDS = "python-native"
-RDEPENDS_${PN} = ""
-
-do_install_append() {
-    create_wrapper ${D}${bindir}/scons SCONS_LIB_DIR='${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}' PYTHONNOUSERSITE='1'
-}
diff --git a/meta/recipes-devtools/python/python-scons_3.1.0.bb b/meta/recipes-devtools/python/python-scons_3.1.0.bb
deleted file mode 100644
index b174050583f..00000000000
--- a/meta/recipes-devtools/python/python-scons_3.1.0.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "Software Construction tool (make/autotools replacement)"
-SECTION = "devel/python"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=37bb53a08e6beaea0c90e7821d731284"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/scons/scons-${PV}.tar.gz"
-SRC_URI[md5sum] = "e2fe9d16f81b0285b969238af4b552ff"
-SRC_URI[sha256sum] = "f3f548d738d4a2179123ecd744271ec413b2d55735ea7625a59b1b59e6cd132f"
-
-S = "${WORKDIR}/scons-${PV}"
-
-UPSTREAM_CHECK_URI = "http://scons.org/pages/download.html"
-UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
-
-inherit setuptools
-
-RDEPENDS_${PN} = "\
-  python-fcntl \
-  python-io \
-  python-json \
-  python-subprocess \
-  python-shell \
-  python-pprint \
-  "
-- 
2.17.1


