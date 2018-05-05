Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1C93A74D40
	for <openembedded-core@lists.openembedded.org>;
	Sat,  5 May 2018 00:14:33 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id f189so18601871pfa.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 17:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=VfvZYDKxu/cRYZN+VGTmlV5MldGMHzij7IIo3ciDtbw=;
	b=dLy7oVZZcUTTzBL0E5gjT6d8ZHb5TKHhHSq+e2Gff110hROh4gFYi6/Z5bh+hPdVlW
	Wa4/EhPGIONpNWymtxM8/d6x7z79FNDC/xPnZ3VQdQotfGKIit4ZkP3qjGsjXyJtBFr+
	6LKtA0ww8kNJIDzxB2UmXFv4PWHvW03AJcrlkxJn73gTeF3d6unHDueJnm/n7XIUBkff
	11dad2Rt8nNBiH2ut+6IlmL+KWJ6Wfn0gAVsdunmcdUUZt1+V3rxwadlRGCpBQpF/WoE
	NBgI4C8sXGDBxB3WvVJv7DrJDcIl6BGTgE3kS253KAUdqb4w9F+H5gcildgIQ7l2pHMk
	j1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=VfvZYDKxu/cRYZN+VGTmlV5MldGMHzij7IIo3ciDtbw=;
	b=NQzImc6hHC1CEddzIuDK0TVXyHqunpLKWj7CVk6+S/M01P9yOupP3IMiWqynp84NHW
	eW/MxPl2wwqupeCX2tPYUnUU01W8dEmoWe5W4pM7NY/mScPM9SkTfR5bvWCExroWUwZ0
	ICG7+GxOLY0iAI0HQMto1tBYp4wj8UGyY0t+4qsBodLudB4QnchT6f5i3l92lRFUOoHL
	MF58md1cFwSJ/3JfmPMELnKrYgV17odI7CwgyRq7k1vv6VsHc18C9xRBQ0hHzqFqu+BX
	hF8CFXcSKT+7e8fJkgqvEw9KjglINpMsIWKnttbdW95hnuLrOrjS/JP+4rwvowXitPDa
	5vxQ==
X-Gm-Message-State: ALQs6tAdKa6kczm+qX7tipfzwwIsL0QDD38qXKXLw4n9aaIHyL0t7zXB
	dvhYYFppiGhO1Y0TGBMNXoDtrA==
X-Google-Smtp-Source: AB8JxZrowoJCwjvzY52iWF/m5oFilyAwtIw5gaDL1aOug2wMC5pxrcZm9JVD0nLi7c/8Z7Mc2a6bjg==
X-Received: by 2002:a17:902:76c3:: with SMTP id
	j3-v6mr5327530plt.376.1525479274756; 
	Fri, 04 May 2018 17:14:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	o88sm36468559pfa.29.2018.05.04.17.14.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 May 2018 17:14:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 May 2018 17:14:04 -0700
Message-Id: <983014617fdb15bb4a7be7936cd928f66e7fc7bd.1525478935.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <cover.1525478935.git.raj.khem@gmail.com>
References: <cover.1525478935.git.raj.khem@gmail.com>
Subject: [PATCH 10/27] rpcsvc-proto: Add recipe
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
X-List-Received-Date: Sat, 05 May 2018 00:14:34 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../rpcsvc-proto/rpcsvc-proto.bb              | 37 +++++++++++++++++++
 .../0001-Use-cross-compiled-rpcgen.patch      | 26 +++++++++++++
 3 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto.bb
 create mode 100644 meta/recipes-extended/rpcsvc-proto/rpcsvc-proto/0001-Use-cross-compiled-rpcgen.patch

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4fb9fc23d1..d7d0c1e2da 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -613,6 +613,7 @@ RECIPE_MAINTAINER_pn-resolvconf = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER_pn-rgb = "Armin Kuster <akuster808@gmail.com>"
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


