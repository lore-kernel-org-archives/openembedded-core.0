Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id E715E6EA37
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2014 04:12:00 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id lj1so2615819pab.26
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Jan 2014 20:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=H4/iLKLF4Bh4vd/X2EcciT27WmytB15hxzDvFKH4DR4=;
	b=0nACqfM6cmJg/IChT1OV4RYlu/h+ZSpWGR/1Qte/WSOZzgpasTtnuxHcXZdS6YjgQX
	Ky4tdYSJdHhiRSJ8lOYNQh3egCTc2hQnl9UFklLKUoWyuhLp+wWaO6VEYzWzb8Ntmmxx
	XDWGFi+yzKj2hCobtdXypmGKubzELIEFwvhywd0+hp3u9ztrJloWFZf4C/yjn7zToK4Z
	ukxiB59nwX5FyemJBCxIjQN/kjFVDpSs9GLgJvf9ZQUF6zC1VWQBPGv4o8MFv5XMylxJ
	vKdwkI6W+nK5zN4QhBAmNfbCbT1xIxs3t5OLbOB90RYAGA/xQHf7sjT5MArXzprFAmAm
	o4ew==
X-Received: by 10.68.232.132 with SMTP id to4mr11821954pbc.141.1391055122222; 
	Wed, 29 Jan 2014 20:12:02 -0800 (PST)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	iu7sm12388951pbc.45.2014.01.29.20.12.01 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 29 Jan 2014 20:12:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2014 20:12:37 -0800
Message-Id: <8dc13ec02f1187f60634311e2351a9cdbc433cd8.1391054829.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
References: <c47e65e2da5790bc54aaf1bca87f2702dac64988.1391054829.git.raj.khem@gmail.com>
In-Reply-To: <cover.1391054829.git.raj.khem@gmail.com>
References: <cover.1391054829.git.raj.khem@gmail.com>
Subject: [PATCH 15/15] python-setuptools: Remove its provided by python-distribute
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
X-List-Received-Date: Thu, 30 Jan 2014 04:12:01 -0000

Use python-distribute-native in packagegroup-toolset-native

Also fixes warnings like

WARNING: The recipe python-setuptools is trying to install files into a
shared area when those files already exist. Those files and their
manifest location are:

/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python2.7/site-packages/setuptools.pth
    Matched in manifest-qemux86-64-python-distribute

/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python2.7/site-packages/site.pyc
    Matched in manifest-qemux86-64-python-distribute

/srv/ssd/sgw/builds/world/tmp/sysroots/qemux86-64/usr/lib/python2.7/site-packages/site.py
    Matched in manifest-qemux86-64-python-distribute

Signed-off-by: Khem Raj <raj.khem@gmail.com>

Conflicts:
	meta/recipes-devtools/python/python-setuptools_1.4.bb
---
 .../python/python-distribute_0.6.32.bb             |    3 ++
 .../python/python-setuptools_1.4.bb                |   40 --------------------
 .../python/python3-distribute_0.6.32.bb            |    2 +
 .../packagegroups/packagegroup-toolset-native.bb   |    2 +-
 4 files changed, 6 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python-setuptools_1.4.bb

diff --git a/meta/recipes-devtools/python/python-distribute_0.6.32.bb b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
index 86ac871..21af29d 100644
--- a/meta/recipes-devtools/python/python-distribute_0.6.32.bb
+++ b/meta/recipes-devtools/python/python-distribute_0.6.32.bb
@@ -41,6 +41,9 @@ RDEPENDS_${PN} = "\
   python-compression \
 "
 
+PROVIDES += "python-setuptools"
+
+
 SRC_URI[md5sum] = "acb7a2da81e3612bfb1608abe4f0e568"
 SRC_URI[sha256sum] = "8970cd1e148b5d1fea9430584aea66c45ea22d80e0933393ec49ebc388f718df"
 
diff --git a/meta/recipes-devtools/python/python-setuptools_1.4.bb b/meta/recipes-devtools/python/python-setuptools_1.4.bb
deleted file mode 100644
index 4138d28..0000000
--- a/meta/recipes-devtools/python/python-setuptools_1.4.bb
+++ /dev/null
@@ -1,40 +0,0 @@
-SUMMARY = "Downloads, builds, installs, upgrades, and uninstalls Python packages"
-HOMEPAGE = "http://cheeseshop.python.org/pypi/setuptools"
-SECTION = "devel/python"
-LICENSE = "PSF"
-LIC_FILES_CHKSUM = "file://setup.py;beginline=107;endline=107;md5=8a314270dd7a8dbca741775415f1716e"
-
-SRCNAME = "setuptools"
-DEPENDS += "python"
-DEPENDS_class-native += "python-native"
-
-SRC_URI = "\
-  http://cheeseshop.python.org/packages/source/s/setuptools/${SRCNAME}-${PV}.tar.gz\
-"
-S = "${WORKDIR}/${SRCNAME}-${PV}"
-
-inherit distutils
-
-DISTUTILS_INSTALL_ARGS += "--install-lib=${D}${libdir}/${PYTHON_DIR}/site-packages"
-
-do_install_prepend() {
-    install -d ${D}/${libdir}/${PYTHON_DIR}/site-packages
-}
-
-RDEPENDS_${PN} = "\
-  python-stringold \
-  python-email \
-  python-shell \
-  python-distutils \
-  python-compression \
-"
-
-RDEPENDS_${PN}_class-native = "\
-  python-distutils \
-  python-compression \
-"
-
-SRC_URI[md5sum] = "5710464bc5a61d75f5087f15ce63cfe0"
-SRC_URI[sha256sum] = "75d288687066ed124311d6ca5f40ffa92a0e81adcd7fff318c6e84082713cf39"
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
index 31fc56d..79e3cfc 100644
--- a/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
+++ b/meta/recipes-devtools/python/python3-distribute_0.6.32.bb
@@ -41,6 +41,8 @@ RDEPENDS_${PN} = "\
   python3-compression \
 "
 
+PROVIDES += "python3-setuptools"
+
 SRC_URI[md5sum] = "acb7a2da81e3612bfb1608abe4f0e568"
 SRC_URI[sha256sum] = "8970cd1e148b5d1fea9430584aea66c45ea22d80e0933393ec49ebc388f718df"
 
diff --git a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
index 07d4f1d..f08cf1d 100644
--- a/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
+++ b/meta/recipes-gnome/packagegroups/packagegroup-toolset-native.bb
@@ -185,7 +185,7 @@ DEPENDS = "\
     python-pygobject-native \
     python-pyrex-native \
     python-scons-native \
-    python-setuptools-native \
+    python-distribute-native \
     python-smartpm-native \
     qemu-helper-native \
     qemu-native \
-- 
1.7.10.4


