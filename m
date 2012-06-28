Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkMZR-0005rp-Rg
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Jun 2012 23:48:14 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so3494282pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 14:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=o1EykKS4xC2v17Xsv+SI+S4kRSL69DT/nggPI8YILSo=;
	b=PaoaCQ9QxmCIWeX6etV3nuhHJuapYLynClQg/o+niMj+/CP3GBkkSKxsjqwpkgv/PP
	N9jgJ+rZlkrLEwzaucF+BhByaoUIyge+ib5G4ysVvpAgQMvawsOQ9lRvmOwDAUj6QKce
	gBSdeDWmvasrWnSXROhvgLbWnaPik6u9EoBpfPLkvPPOm2HhBQXqHBvEqdh6fWSXfdtq
	++C+x+i6YcQQlgYvBGr6APVQkAMn3dHQIJ1FS6ZsbrCi4CKS7my6S8honEltOwjFYqcM
	54HROotcd6/LHQNsSL2Xjtj1PpldDgKWrqwXKgjVTAtTJfoi2z60EMqs/0A3bmLNA3X6
	qUSA==
Received: by 10.68.233.193 with SMTP id ty1mr4684031pbc.47.1340919440667;
	Thu, 28 Jun 2012 14:37:20 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id os1sm3220209pbb.49.2012.06.28.14.37.19
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jun 2012 14:37:19 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2012 14:36:52 -0700
Message-Id: <f7cf75986d2c52368e8d130fc19404c87ff6cf70.1340919157.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
References: <638231d75b991a3be5c9aed5add4c56e66f79fe0.1340919157.git.raj.khem@gmail.com>
In-Reply-To: <cover.1340919157.git.raj.khem@gmail.com>
References: <cover.1340919157.git.raj.khem@gmail.com>
Subject: [PATCH 06/11] kconfig-frontends: New recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 28 Jun 2012 21:48:14 -0000

kconfig-frontends provides the kconfig infrastructure
thats used for linux kernel as a standalone package. Its
not intended to be used for kernel itself but can be
used by packages who are based on kconfig e.g. busybox
uclibc or new packages who wants to use kconfig infra
for the package build

kconfig-frontends names it's shared library as -3.4.0.so instead of .so.3.4.0,
this causes the -dev package to grab it since it matches on *.so. This error
would also have shown up with the old PACKAGE order.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../kconfig-frontends/kconfig-frontends_3.4.bb     |   34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb

diff --git a/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
new file mode 100644
index 0000000..9abfa75
--- /dev/null
+++ b/meta/recipes-devtools/kconfig-frontends/kconfig-frontends_3.4.bb
@@ -0,0 +1,34 @@
+# Copyright (C) 2012 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+DESCRIPTION = "The kconfig-frontends project aims at centralising \
+the effort of keeping an up-to-date, out-of-tree, packaging of the \
+kconfig infrastructure, ready for use by third-party projects. \
+The kconfig-frontends package provides the kconfig parser, as well as all \
+the frontends"
+HOMEPAGE = "http://ymorin.is-a-geek.org/projects/kconfig-frontends"
+LICENSE = "GPL-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=9b8cf60ff39767ff04b671fca8302408"
+SECTION = "devel"
+DEPENDS += "ncurses flex bison gperf"
+PR = "r0"
+PV = "3.4.0"
+SPIN = "0"
+SRC_URI = "http://ymorin.is-a-geek.org/download/${BPN}/${BPN}-${PV}-${SPIN}.tar.xz"
+SRC_URI[md5sum] = "7eed0faf5a41d6dd0b2a886a440a972d"
+SRC_URI[sha256sum] = "638006f3d1aefefdc1db3030a15b562cf3c89f2028b1cea0bf0f0629708802f2"
+
+S = "${WORKDIR}/${BPN}-${PV}-${SPIN}"
+
+inherit autotools
+do_configure_prepend () {
+	mkdir -p scripts/.autostuff/m4
+}
+EXTRA_OECONF += "--disable-gconf --disable-qconf"
+
+# Some packages have the version preceeding the .so instead properly
+# versioned .so.<version>, so we need to reorder and repackage.
+SOLIBS = "-${PV}.so"
+FILES_SOLIBSDEV = "${libdir}/libkconfig-parser.so"
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5



