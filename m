Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id E9FD1745A1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 19:36:30 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id v63so5127159pfk.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Apr 2018 12:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=k8ozAW+hq6U7hXBCi09op2HDjBHthQAPAc9SUhlJmL8=;
	b=dRq1e1aidi4ispOmAYZUF3h4ecCeUf4Mk3grHYQ2+DQz6SZOcn+Hz1RtX6yJQgO9vG
	wqEJZORQ3wxF2JjGyH9CZZgZfudYVS/w8s2F+wGVAW58wp4tJ+z1t4pMrkBL0yRUboMO
	z8HztaL0BL5xbXTqo59wTP+H9Q3IFRBFIrWWcv9RxjnT97/uXXa9Y15vXAA9R/5HzoxL
	K32sFBMS+h6xRLoJJB2Kb6G3p/GCAuyRbRtoSSO2YLzUnf4gU/5/mgmy9CGHypcizLar
	ZyOPBS22obdCXkGI86j56N4zbegCvRTHcHi7xQzSeX0zrUX9rfqsq/Y0EchB4Ng//7NU
	VEKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=k8ozAW+hq6U7hXBCi09op2HDjBHthQAPAc9SUhlJmL8=;
	b=QgMjoa1L3k+uyIBs52kdSNJcvrmtBDmuws9YzHeLFfuKGdV3rnf3cqhAw7mhsYrTY7
	+Iw7dubSIRa2TIn2b0ABLc6vEL9sK5QQZYzVMtN4u+2ItF6WHMunzvGHX+wBer+D8qcG
	dzt2P4exz/GzvgUtawdNd1BzQNk5NcFD3aW+Tozz4VTvlCxPrLLrscHGFjFH2WaufHym
	OeCCpNNNMgy3SaqdktnvmHyiv4hy9kQVNKmS3ijIe39DbMnHwv6v0Jktk7A4ghxgZSxD
	ahPVXBvXpwNZtzBRoeldbrd7uuRYdIQ9swpHfznfr1AR4f/i5nTEymuc7O1TlywWdvEx
	4x6w==
X-Gm-Message-State: ALQs6tCG1G/hM5jXIuMURSei7/2cRs0QD45HEaKUIMs8P6PZAkFBPgg8
	bo2Rp62r+BWTmE5Gr8ztMYN0kA==
X-Google-Smtp-Source: AB8JxZrw7W+e7e1fLCtEbTOVlFSN8tdzBE4SclFNKV9+mzCBwRBLI9j3Wa2wRz2/GaMsCWlFkGvTgA==
X-Received: by 2002:a17:902:9a0c:: with SMTP id
	v12-v6mr9746716plp.162.1525030591476; 
	Sun, 29 Apr 2018 12:36:31 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c::ddd5])
	by smtp.gmail.com with ESMTPSA id
	125sm11960737pfc.145.2018.04.29.12.36.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Apr 2018 12:36:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Apr 2018 12:35:59 -0700
Message-Id: <f11d1f50ff37367943f2b7b7a56aff18bd85db5b.1525029885.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525029885.git.raj.khem@gmail.com>
References: <cover.1525029885.git.raj.khem@gmail.com>
Subject: [PATCH 12/24] rpcsvc-proto: Add recipe
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
X-List-Received-Date: Sun, 29 Apr 2018 19:36:31 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../rpcsvc-proto/rpcsvc-proto.bb              | 37 +++++++++++++++++++
 .../0001-Use-cross-compiled-rpcgen.patch      | 26 +++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
 create mode 100644 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 48aff9537e..823e1bfa98 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -633,6 +633,7 @@ RECIPE_MAINTAINER_pn-resourceproto = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-rgb = "Armin Kuster <akuster@mvista.com>"
 RECIPE_MAINTAINER_pn-rpcbind = "Hongxu Jia <hongxu.jia@windriver.com>"
 RECIPE_MAINTAINER_pn-rng-tools = "Maxin B. John <maxin.john@intel.com>"
+RECIPE_MAINTAINER_pn-rpcsvc-proto = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-rpm = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-rpmresolve = "Mark Hatle <mark.hatle@windriver.com>"
 RECIPE_MAINTAINER_pn-rsync = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
new file mode 100644
index 0000000000..fdeafe283a
--- /dev/null
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
@@ -0,0 +1,37 @@
+# Copyright (C) 2018 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "rpcsvc protocol definitions from glibc"
+
+DESCRIPTION = "This package contains rpcsvc proto.x files from glibc, which are\
+missing in libtirpc. Additional it contains rpcgen, which is needed\
+to create header files and sources from protocol files.\
+This package is only needed, if glibc is installed without the\
+deprecated sunrpc functionality and libtirpc should replace it."
+
+HOMEPAGE = "https://github.com/thkukuk/rpcsvc-proto"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=0daaf958d5531ab86169ec6e275e1517"
+SECTION = "libs"
+DEPENDS += "rpcsvc-proto-native"
+
+PV = "1.3.1+git${SRCPV}"
+
+SRCREV = "abcf24a09665b3def0f54c87d2acd4796de5d83a"
+
+SRC_URI = "git://github.com/thkukuk/${BPN} \
+           file://0001-Use-cross-compiled-rpcgen.patch \
+          "
+
+S = "${WORKDIR}/git"
+
+inherit autotools
+
+EXTRA_OEMAKE_class-native = " -C rpcgen"
+
+do_install_append() {
+	# They come from quota recipe
+	rm -rf ${D}${includedir}/rpcsvc/rquota.[hx]
+}
+
+BBCLASSEXTEND += "native nativesdk"
diff --git a/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch
new file mode 100644
index 0000000000..4ee4940295
--- /dev/null
+++ b/meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch
@@ -0,0 +1,26 @@
+From de9345207beb71e4d5b6b40b52cac4ebd2e3858c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 27 Apr 2018 23:23:20 -0700
+Subject: [PATCH] Use cross compiled rpcgen
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ rpcsvc/Makefile.am | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rpcsvc/Makefile.am b/rpcsvc/Makefile.am
+index 83867c0..4753242 100644
+--- a/rpcsvc/Makefile.am
++++ b/rpcsvc/Makefile.am
+@@ -12,5 +12,5 @@ nodist_rpcsvc_HEADERS = klm_prot.h nlm_prot.h rstat.h spray.h \
+ 	nfs_prot.h rquota.h sm_inter.h
+ 
+ %.h: %.x
+-	$(top_builddir)/rpcgen/rpcgen -h -o $@ $<
++	rpcgen -h -o $@ $<
+ 
+-- 
+2.17.0
+
-- 
2.17.0


