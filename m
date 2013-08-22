Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by mail.openembedded.org (Postfix) with ESMTP id 1ABE26B917
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 21:37:34 +0000 (UTC)
Received: by mail-lb0-f177.google.com with SMTP id n6so2144412lbi.36
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 14:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=7fzEods1ivjvkJ3yQYmsWVRwghLSIB8Aco7ORCdZqOY=;
	b=OmHEzdoxdwJFwcwP/OHkh/kfBxnWRnTUf/+YuE0LrLvCQEmZJJvWih9pfvg4LeRBeG
	15CDEephKxyCvCuwAeH5HOUUQXHu4pqswX7FF2hZCf4xCKEbogvKqrdbvBIVcqQ3NWNP
	74pSaPhmu2ut1zQ1yMQoVuHYjRKDSGEyS7Si+QaKvlxNkKad7OpFKD5cJsSmbqnSER45
	Qy9+GiRaJkO8i/lMlKBLtpYv4N2de/EkSBWdEdYYWReV4uKkOJ2eAnlTXt3SQimEWfqm
	//7e+FhYLACLOE2edDSF86+fS58EfdafYzZpwnEumKDueIVMcCxDRtkfNMMecp9nk49e
	FRww==
X-Received: by 10.112.42.103 with SMTP id n7mr13222313lbl.6.1377207453963;
	Thu, 22 Aug 2013 14:37:33 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id m13sm5672557lbo.11.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 22 Aug 2013 14:37:33 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VCcZP-0002la-DG; Fri, 23 Aug 2013 00:37:31 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Aug 2013 00:37:29 +0300
Message-Id: <fa107ce2393b834fd74c353526e98e9edcac0a85.1377207091.git.cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <fdbdadc72d3c6c1ef1feb0602d9f16dce3645a33.1377207091.git.cazfi74@gmail.com>
References: <fdbdadc72d3c6c1ef1feb0602d9f16dce3645a33.1377207091.git.cazfi74@gmail.com>
In-Reply-To: <cover.1377207091.git.cazfi74@gmail.com>
References: <cover.1377207091.git.cazfi74@gmail.com>
Subject: [PATCH 2/2] automake: update to upstream version 1.13.4
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
X-List-Received-Date: Thu, 22 Aug 2013 21:37:35 -0000

prefer-cpio-over-pax-for-ustar-archives.patch updated to apply

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../prefer-cpio-over-pax-for-ustar-archives.patch  |   37 ++++++++++----------
 .../{automake_1.12.6.bb => automake_1.13.4.bb}     |    6 ++--
 2 files changed, 21 insertions(+), 22 deletions(-)
 rename meta/recipes-devtools/automake/{automake_1.12.6.bb => automake_1.13.4.bb} (90%)

diff --git a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
index 4627855..6558a00 100644
--- a/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
+++ b/meta/recipes-devtools/automake/automake/prefer-cpio-over-pax-for-ustar-archives.patch
@@ -19,24 +19,13 @@ Updated for version 1.11.3:
 Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
 Date: 2011/03/14
 
-Index: automake-1.11.3/m4/tar.m4
-===================================================================
---- automake-1.11.3.orig/m4/tar.m4	2012-01-31 03:41:18.000000000 -0800
-+++ automake-1.11.3/m4/tar.m4	2012-03-14 17:36:11.901303777 -0700
-@@ -31,7 +31,7 @@ m4_if([$1], [v7],
-               [m4_fatal([Unknown tar format])])
- AC_MSG_CHECKING([how to create a $1 tar archive])
- # Loop over all known methods to create a tar archive until one works.
--_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'
-+_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) cpio pax none'
- _am_tools=${am_cv_prog_tar_$1-$_am_tools}
- # Do not fold the above two line into one, because Tru64 sh and
- # Solaris sh will not grok spaces in the rhs of `-'.
-Index: automake-1.11.3/Makefile.in
-===================================================================
---- automake-1.11.3.orig/Makefile.in	2012-02-01 02:37:59.000000000 -0800
-+++ automake-1.11.3/Makefile.in	2012-03-14 17:38:03.530869197 -0700
-@@ -62,7 +62,7 @@ am__aclocal_m4_deps = $(top_srcdir)/m4/a
+Updated for version 1.13.2:
+Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
+
+diff -Nurd automake-1.13.2/Makefile.in automake-1.13.2/Makefile.in
+--- automake-1.13.2/Makefile.in	2013-05-15 23:12:58.000000000 +0300
++++ automake-1.13.2/Makefile.in	2013-05-23 02:13:41.364026301 +0300
+@@ -141,7 +141,7 @@
  	$(top_srcdir)/m4/options.m4 $(top_srcdir)/m4/runlog.m4 \
  	$(top_srcdir)/m4/sanity.m4 $(top_srcdir)/m4/silent.m4 \
  	$(top_srcdir)/m4/strip.m4 $(top_srcdir)/m4/substnot.m4 \
@@ -45,3 +34,15 @@ Index: automake-1.11.3/Makefile.in
  am__configure_deps = $(am__aclocal_m4_deps) $(CONFIGURE_DEPENDENCIES) \
  	$(ACLOCAL_M4)
  am__CONFIG_DISTCLEAN_FILES = config.status config.cache config.log \
+diff -Nurd automake-1.13.2/m4/tar.m4 automake-1.13.2/m4/tar.m4
+--- automake-1.13.2/m4/tar.m4	2013-05-13 23:12:48.000000000 +0300
++++ automake-1.13.2/m4/tar.m4	2013-05-23 02:13:26.600025805 +0300
+@@ -26,7 +26,7 @@
+ AC_SUBST([AMTAR], ['$${TAR-tar}'])
+
+ # We'll loop over all known methods to create a tar archive until one works.
+-_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) pax cpio none'
++_am_tools='gnutar m4_if([$1], [ustar], [plaintar]) cpio pax none'
+
+ m4_if([$1], [v7],
+   [am__tar='$${TAR-tar} chof - "$$tardir"' am__untar='$${TAR-tar} xf -'],
diff --git a/meta/recipes-devtools/automake/automake_1.12.6.bb b/meta/recipes-devtools/automake/automake_1.13.4.bb
similarity index 90%
rename from meta/recipes-devtools/automake/automake_1.12.6.bb
rename to meta/recipes-devtools/automake/automake_1.13.4.bb
index 549051b..e3db834 100644
--- a/meta/recipes-devtools/automake/automake_1.12.6.bb
+++ b/meta/recipes-devtools/automake/automake_1.13.4.bb
@@ -26,10 +26,8 @@ SRC_URI += "${PATHFIXPATCH} \
             file://py-compile-compile-only-optimized-byte-code.patch \
             file://buildtest.patch"
 
-SRC_URI[md5sum] = "199d39ece2e6070d64ac20d45ac86026"
-SRC_URI[sha256sum] = "0cbe570db487908e70af7119da85ba04f7e28656b26f717df0265ae08defd9ef"
-
-PR = "r0"
+SRC_URI[md5sum] = "9199e266993a5bbdc914923349d51e3e"
+SRC_URI[sha256sum] = "4c93abc0bff54b296f41f92dd3aa1e73e554265a6f719df465574983ef6f878c"
 
 do_install_append () {
     install -d ${D}${datadir}
-- 
1.7.10.4


