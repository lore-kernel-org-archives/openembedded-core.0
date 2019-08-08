Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id C6B547F2FB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Aug 2019 16:11:58 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id t16so5368822wra.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Aug 2019 09:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3iLnQkKL6UY5X8gNWHAjypL2h2OgLIMv54fzCxrS1qI=;
	b=e1NE0ETFXf30+xAKzcJ7/IhSOTryGdDbyJ3tTWBXG3UGdF9zfTk7Owzr0qswz6Ijxr
	EAKqR/Cwto0GqVIZ60kdcBFcFU2buI2DB1WiZYC/Gz3ZvtigJVlSx7EiA+nGeQwuhiXJ
	8Dp96zLXqnDeMCcsz24lBALClF9QVAbJePs508Iq3vQGq1xAzrRklrevswtOcqf+7Xrq
	RNSZwUOnmqQeeTSK1L2Z68VFNVfIdycfijDNbxQqnRFq75w2XmyMFpRR2JokgFqgyoMG
	c4rzxsrFD8ZmQoofrooXFgNdbboWLe4ZIlcfNHbb8MzAJ923oYhLeHpeewuSr9rYEPw7
	CEEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=3iLnQkKL6UY5X8gNWHAjypL2h2OgLIMv54fzCxrS1qI=;
	b=BZn2KnJUh1hAvT/xUokGsj4BI7cNbSu2+hpHAELxGJMFgEXPWcXS1u7g1E4dudj+xK
	lMoZxdf9TWCHaHT3F6HnJU0PU0xKRKzqTjqB9DWBtJPxOnjpjpZoK0fTPZICnP+LZume
	+5DO6oYHgH4WIECy7KGhiHxbaaztCxT5Dfb5TYMVsh5dt7eSo5wCveIlugapijq4S6t2
	wr755AAlPe9wg3ILUAzHvMVMnR/6nlUBcduQij2/0XxJHqzXSoUZZd9ERWbrcRC8Qwwr
	mHOwJZkUeCIIk/HQfkJGGM388w6OSpVgdILiyzqTmupEPaPo3Yez0T8aRjOCu8dZoFsz
	pxYw==
X-Gm-Message-State: APjAAAVmLbru/3/dTfoUAHdQIg1DDwGXXaAYJch1tw5CrWVwSBuGqPPd
	I4f0pm2JktBVa6pewNkaptCCb94sR80=
X-Google-Smtp-Source: APXvYqyLCobkI55QrlojbTDYnGlibfW6TzW29J5ZC51k6HsLxi05e6oAEGQxa0rl1c/BunDfV+1LWA==
X-Received: by 2002:a5d:4fc9:: with SMTP id h9mr18568171wrw.349.1565280719258; 
	Thu, 08 Aug 2019 09:11:59 -0700 (PDT)
Received: from alexander-box.luxoft.com ([62.96.135.139])
	by smtp.gmail.com with ESMTPSA id
	i66sm5499876wmi.11.2019.08.08.09.11.58
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Thu, 08 Aug 2019 09:11:58 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Aug 2019 18:11:49 +0200
Message-Id: <20190808161150.44877-6-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808161150.44877-1-alex.kanavin@gmail.com>
References: <20190808161150.44877-1-alex.kanavin@gmail.com>
Subject: [PATCH 6/7] python-scons: remove the python 2.x version of the recipe
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
X-List-Received-Date: Thu, 08 Aug 2019 16:11:59 -0000

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


