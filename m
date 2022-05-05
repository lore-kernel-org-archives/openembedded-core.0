Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D80C2C43219
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:33 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web08.7297.1651727154549771697
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mG1oB0kD;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id n10so6556895ejk.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+JnRhDLWBmB1HD3TufWYtzZVf+eE9DogKwBMb59an9o=;
        b=mG1oB0kD5fEXiHGa9BfatPWqaK7dv+ZDiYWvJJUrqoCo8XJDTKAhdp/DABEdVNdGUy
         HaSh0DyjqqQHEWrkC0X+CnV64cRSudRgQq1Fp8JdQ9r6J4e9YxQGaa1OUI7pwCOAPOFi
         uuQdnQiSe9Stu/eKC5mdmPGIENA2nIhKpdfMzk7gkgjIjTJ+il92c0DSyc8uhIP1aJuF
         W/D0VFI8ypUJvag0FuoEtEscQiTs1c8THqpEZGLK65aQmbJb4LO7fnw3DhS/jTydlqy8
         GYMY4mOCpQDOwV3tJl84kAQ9Z4drbpEuk2R6AJyOuj/j/jmnvnmoqEbn3twA2qq/a8li
         yNpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+JnRhDLWBmB1HD3TufWYtzZVf+eE9DogKwBMb59an9o=;
        b=6bsagUCg7ArIoE3jP/f3yz6V2le2REOkRplNf8veXbi5JALDzvmwkgDfuJSSt3+4jV
         JlqT9/d3JMRG+VXBOVty+itN83OT2ryWJNyv+uY9rxA+QliCDUgUYgPJO7ZGHHb4dFzE
         h7Lly9H9VjzlpgbEJqGi2/abaGOC0K5WvqM6B9SWwqD+T8OxQ02fFjslf5QTGKn65LXu
         dAevfKLb455E2rornoKRfkuKEw4UQDpETjarCeeLTRKMlAdanywEV0z9Xyltffuc5IsL
         SXISttFfj6xwb98H1CpvoCnkYY8kxGC+4KzhpFzMBYRNZeNLaz4g1L/g8RnmWGbOAQi7
         FN+g==
X-Gm-Message-State: AOAM531OcoMHtMxEBVUzNFrjMWp0Qfzhul7uooIvqyneqA7oLZZdZyUV
	OyLEKQyE87HjhfAFeuYM8w1p9/BNaqw=
X-Google-Smtp-Source: 
 ABdhPJzeQWy8riUyWnTlgP0k8IkW6YhGclw+WlZelI3O08N0zo1pfTUCCeWt3CGGoUUESW8iangrbw==
X-Received: by 2002:a17:907:7810:b0:6e7:ef73:8326 with SMTP id
 la16-20020a170907781000b006e7ef738326mr24185079ejc.429.1651727186053;
        Wed, 04 May 2022 22:06:26 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 49/61] pciutils: update 3.7.0 -> 3.8.0
Date: Thu,  5 May 2022 07:05:32 +0200
Message-Id: <20220505050544.651895-49-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165278

Rebase configure.patch

Drop symlink creation; make install already does it.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../pciutils/pciutils/configure.patch         | 46 +++++++++++--------
 .../{pciutils_3.7.0.bb => pciutils_3.8.0.bb}  |  3 +-
 2 files changed, 29 insertions(+), 20 deletions(-)
 rename meta/recipes-bsp/pciutils/{pciutils_3.7.0.bb => pciutils_3.8.0.bb} (93%)

diff --git a/meta/recipes-bsp/pciutils/pciutils/configure.patch b/meta/recipes-bsp/pciutils/pciutils/configure.patch
index e444c13975..cf55b94808 100644
--- a/meta/recipes-bsp/pciutils/pciutils/configure.patch
+++ b/meta/recipes-bsp/pciutils/pciutils/configure.patch
@@ -1,9 +1,14 @@
+From 502c01e180d9085fcbeaf2fb46239999c4f335d2 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <rpurdie@linux.intel.com>
+Date: Wed, 31 Dec 2008 17:20:38 +0000
+Subject: [PATCH] pciutils: Upgarde 2.2.4 -> 3.0.3
+
 This patch:
 * ensures we link correctly
 * allows us to optionally pass target information to configure rather than using uname
 * select linux as the platform in most cases we care about
 
-This is a merge of various tweaks to allow us to build pciutils including 
+This is a merge of various tweaks to allow us to build pciutils including
 work from:
 
 7/30/2010 - Qing He <qing.he@intel.com>
@@ -13,23 +18,28 @@ Ionut Radu <ionutx.radu@intel.com>
 
 Upstream-Status: Inappropriate [embedded specific]
 
-Index: pciutils-3.5.6/Makefile
-===================================================================
---- pciutils-3.5.6.orig/Makefile
-+++ pciutils-3.5.6/Makefile
-@@ -96,7 +96,7 @@ example: example.o lib/$(PCILIB)
+---
+ Makefile      |  2 +-
+ lib/configure | 14 ++++++++++----
+ 2 files changed, 11 insertions(+), 5 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index 9319bb4..78a2d54 100644
+--- a/Makefile
++++ b/Makefile
+@@ -108,7 +108,7 @@ example$(EXEEXT): example.o lib/$(PCILIB)
  example.o: example.c $(PCIINC)
  
- %: %.o
+ %$(EXEEXT): %.o
 -	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LDLIBS) -o $@
 +	$(CC) $(LDFLAGS) $(TARGET_ARCH) $^ $(LIB_LDLIBS) $(LDLIBS) -o $@
  
  %.8 %.7 %.5: %.man
- 	M=`echo $(DATE) | sed 's/-01-/-January-/;s/-02-/-February-/;s/-03-/-March-/;s/-04-/-April-/;s/-05-/-May-/;s/-06-/-June-/;s/-07-/-July-/;s/-08-/-August-/;s/-09-/-September-/;s/-10-/-October-/;s/-11-/-November-/;s/-12-/-December-/;s/\(.*\)-\(.*\)-\(.*\)/\3 \2 \1/'` ; sed <$< >$@ "s/@TODAY@/$$M/;s/@VERSION@/pciutils-$(VERSION)/;s#@IDSDIR@#$(IDSDIR)#"
-Index: pciutils-3.5.6/lib/configure
-===================================================================
---- pciutils-3.5.6.orig/lib/configure
-+++ pciutils-3.5.6/lib/configure
+ 	M=`echo $(DATE) | sed 's/-01-/-January-/;s/-02-/-February-/;s/-03-/-March-/;s/-04-/-April-/;s/-05-/-May-/;s/-06-/-June-/;s/-07-/-July-/;s/-08-/-August-/;s/-09-/-September-/;s/-10-/-October-/;s/-11-/-November-/;s/-12-/-December-/;s/\(.*\)-\(.*\)-\(.*\)/\3 \2 \1/'` ; sed <$< >$@ "s/@TODAY@/$$M/;s/@VERSION@/pciutils-$(VERSION)/;s#@IDSDIR@#$(IDSDIR)#;s#@PCI_IDS@#$(PCI_IDS)#"
+diff --git a/lib/configure b/lib/configure
+index 45a416a..1afdaa6 100755
+--- a/lib/configure
++++ b/lib/configure
 @@ -9,6 +9,10 @@ echo_n() {
  	printf '%s' "$*"
  }
@@ -38,7 +48,7 @@ Index: pciutils-3.5.6/lib/configure
 +IDSDIR=$2
 +DNS=yes
 +
- if [ -z "$VERSION" -o -z "$IDSDIR" ] ; then
+ if [ -z "$VERSION" ] ; then
  	echo >&2 "Please run the configure script from the top-level Makefile"
  	exit 1
 @@ -16,8 +20,8 @@ fi
@@ -56,12 +66,12 @@ Index: pciutils-3.5.6/lib/configure
  		proc=`/usr/sbin/lsdev -C -c processor -S available -F name | head -1`
  		cpu=`/usr/sbin/lsattr -F value -l $proc -a type | sed 's/_.*//'`
  	else
--		cpu=`uname -m | sed 's/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^BeMac$/powerpc/;s/^BeBox$/powerpc/'`
-+		cpu=${4:-`uname -m | sed 's/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^BeMac$/powerpc/;s/^BeBox$/powerpc/'`}
+-		cpu=`uname -m | sed 's/^i.86-AT386/i386/;s/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^BeMac$/powerpc/;s/^BeBox$/powerpc/'`
++		cpu=${4:-`uname -m | sed 's/^i.86-AT386/i386/;s/^i.86$/i386/;s/^sun4u$/sparc64/;s/^i86pc$/i386/;s/^BePC$/i386/;s/^BeMac$/powerpc/;s/^BeBox$/powerpc/'`}
  	fi
- 	if [ "$sys" = "GNU/kFreeBSD" -o "$sys" = "DragonFly" ]
+ 	if [ "$sys" = "DragonFly" ]
  	then
-@@ -35,7 +39,7 @@ if [ -z "$HOST" ] ; then
+@@ -43,7 +47,7 @@ if [ -z "$HOST" ] ; then
  	then
  		sys=cygwin
  	fi
@@ -70,7 +80,7 @@ Index: pciutils-3.5.6/lib/configure
  fi
  [ -n "$RELEASE" ] && rel="${RELEASE}"
  # CAVEAT: tr on Solaris is a bit weird and the extra [] is otherwise harmless.
-@@ -44,6 +48,8 @@ cpu=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
+@@ -52,6 +56,8 @@ cpu=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\1/'`
  sys=`echo $host | sed 's/^\([^-]*\)-\([^-]*\)-\(.*\)$/\3/'`
  echo " $host $rel $cpu $sys"
  
diff --git a/meta/recipes-bsp/pciutils/pciutils_3.7.0.bb b/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb
similarity index 93%
rename from meta/recipes-bsp/pciutils/pciutils_3.7.0.bb
rename to meta/recipes-bsp/pciutils/pciutils_3.8.0.bb
index 7d1740f665..8455b286a8 100644
--- a/meta/recipes-bsp/pciutils/pciutils_3.7.0.bb
+++ b/meta/recipes-bsp/pciutils/pciutils_3.8.0.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib kmod"
 SRC_URI = "${KERNELORG_MIRROR}/software/utils/pciutils/pciutils-${PV}.tar.xz \
            file://configure.patch"
 
-SRC_URI[sha256sum] = "9d40b97be8b6a2cdf96aead5a61881d1f7e4e0da9544a9bac4fba1ae9dcd40eb"
+SRC_URI[sha256sum] = "91edbd0429a84705c9ad156d4ff38ccc724d41ea54c4c5b88e38e996f8a34f05"
 
 inherit multilib_header pkgconfig
 
@@ -46,7 +46,6 @@ do_install () {
 	oe_runmake DESTDIR=${D} install install-lib
 
 	install -d ${D}${bindir}
-	ln -s ../sbin/lspci ${D}${bindir}/lspci
 
 	oe_multilib_header pci/config.h
 }
-- 
2.30.2


