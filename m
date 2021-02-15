Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web08.32114.1613399942095370885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Feb 2021 06:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=mSmGFj/w;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.52, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f52.google.com with SMTP id l23so6190594otn.10
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Feb 2021 06:39:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=xmgjxcl3f4YIXNyw76ATDgEki+E72W+zCgYwRw88MRk=;
        b=mSmGFj/wqRR5mrtLB+ecCcXYyyZ3GgiEr+b3T/xmYNRROGNztmRSLVTz1B1ec+Ucuo
         GsgKzAILI8ZIwhRp2K7Fkccr1tv/IYj2DWEm9wqkF2Sn9ddtsGEgzZ4X4nUC8JWk3vMz
         B/ZgnOkDWhZrK3SMTHd1hUFdCc1kOh4ChHw4SlS4G6iVdEoxkX1bBIShDLqTDPuo1FW7
         DawIfRCSz+oUL2N0zRjUzzJRzfKAQAjYhsiQf4vnKk26+cBdH33C3c4lp00AHeY+msGH
         2IE4wHpeqK8kv6tarm7n8+vg35nEce7Z9Ih9hyKS2w0MOtdsuxtZ6mWJfd0G2h773nky
         QaNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xmgjxcl3f4YIXNyw76ATDgEki+E72W+zCgYwRw88MRk=;
        b=gC+oQ4Uw62L5BTzgNzqLY56TLb/FMvCuXA9pfMNfnV+Xzvd8jHN/FoT4AlVeRafCK6
         cFNnvMzAOcRvyNrmFnNoUhR7ArXlhD7CidV8qovR2ATJah9VxTLCxV0skwxPn7RpF98u
         LXIv6FnfOEfFB1ygh4GKag/X9CK1MGfTgXwwZBFy9d7eltdoMsxEQCjkgNAp/dUsZfIy
         ky3m6xv6PB82tMs+C7Ycg20f7vATbA51bFZt3bpMiI0b4CFa0+Gx6P7zu9JkZmK/cvlL
         XYLHWUTDnTJYHvGkseq4ZoTfdhEo+VG2+3PDgpECP2ZwSrUDuAUHAebTPBQrp1+a6RqT
         mHUA==
X-Gm-Message-State: AOAM533BefndgleE/E3QciDWmnr6GK1BDCFG3okXC3Q8WGYF6qHqii/T
	A9gW4Tn41vx0xJo6DgnnU6rkukaQwrcklt5D
X-Google-Smtp-Source: ABdhPJxc8HkwzfGVsQ5Nn5DjYlhy11CKbhDOPrLdRmZdxyF3Mp24Y7Ewn2boMSX+7IC4itVLpDXoEA==
X-Received: by 2002:a05:6830:150a:: with SMTP id k10mr11295484otp.235.1613399941035;
        Mon, 15 Feb 2021 06:39:01 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id f1sm2714068otq.10.2021.02.15.06.38.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Feb 2021 06:39:00 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 15/17] meta: drop _PYTHON_SYSCONFIGDATA_NAME hacks
Date: Mon, 15 Feb 2021 04:37:26 -1000
Message-Id: <961b6ce18c4dfff2fa54306230480dbd0cd970ee.1613399659.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1613399659.git.steve@sakoman.com>
References: <cover.1613399659.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d3a81dd0e72a3495bfc7cc969c2bb806b666023d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes/scons.bbclass          | 3 ---
 meta/lib/oe/prservice.py            | 4 ----
 meta/recipes-core/glib-2.0/glib.inc | 4 ----
 meta/recipes-graphics/mesa/mesa.inc | 5 -----
 4 files changed, 16 deletions(-)

diff --git a/meta/classes/scons.bbclass b/meta/classes/scons.bbclass
index 6b171ca8df..4f3ae502ef 100644
--- a/meta/classes/scons.bbclass
+++ b/meta/classes/scons.bbclass
@@ -5,7 +5,6 @@ DEPENDS += "python3-scons-native"
 EXTRA_OESCONS ?= ""
 
 do_configure() {
-	unset _PYTHON_SYSCONFIGDATA_NAME
 	if [ -n "${CONFIGURESTAMPFILE}" ]; then
 		if [ -e "${CONFIGURESTAMPFILE}" -a "`cat ${CONFIGURESTAMPFILE}`" != "${BB_TASKHASH}" -a "${CLEANBROKEN}" != "1" ]; then
 			${STAGING_BINDIR_NATIVE}/scons --clean PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS}
@@ -17,13 +16,11 @@ do_configure() {
 }
 
 scons_do_compile() {
-	unset _PYTHON_SYSCONFIGDATA_NAME
 	${STAGING_BINDIR_NATIVE}/scons ${PARALLEL_MAKE} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} || \
 	die "scons build execution failed."
 }
 
 scons_do_install() {
-	unset _PYTHON_SYSCONFIGDATA_NAME
 	${STAGING_BINDIR_NATIVE}/scons install_root=${D}${prefix} PREFIX=${prefix} prefix=${prefix} ${EXTRA_OESCONS} install || \
 	die "scons install execution failed."
 }
diff --git a/meta/lib/oe/prservice.py b/meta/lib/oe/prservice.py
index 2d3c9c7e50..fcdbe66c19 100644
--- a/meta/lib/oe/prservice.py
+++ b/meta/lib/oe/prservice.py
@@ -3,10 +3,6 @@
 #
 
 def prserv_make_conn(d, check = False):
-    # Otherwise this fails when called from recipes which e.g. inherit python3native (which sets _PYTHON_SYSCONFIGDATA_NAME) with:
-    # No module named '_sysconfigdata'
-    if '_PYTHON_SYSCONFIGDATA_NAME' in os.environ:
-        del os.environ['_PYTHON_SYSCONFIGDATA_NAME']
     import prserv.serv
     host_params = list([_f for _f in (d.getVar("PRSERV_HOST") or '').split(':') if _f])
     try:
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index 7ebed0e5fd..c3ddf18387 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -32,10 +32,6 @@ inherit meson gettext gtk-doc pkgconfig ptest-gnome upstream-version-is-even bas
 
 GTKDOC_MESON_OPTION = "gtk_doc"
 
-# This avoids the need to depend on target python3, which in case of mingw is not even possible.
-# meson's python configuration pokes into python3 configuration, so this provides the native config to it.
-unset _PYTHON_SYSCONFIGDATA_NAME
-
 S = "${WORKDIR}/glib-${PV}"
 
 PACKAGECONFIG ??= "system-pcre libmount \
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index b7ef496fdc..a1bf878b1a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -26,11 +26,6 @@ PROVIDES = " \
 
 inherit meson pkgconfig python3native gettext features_check
 
-# Unset these to stop python trying to report the target Python setup
-_PYTHON_SYSCONFIGDATA_NAME[unexport] = "1"
-STAGING_INCDIR[unexport] = "1"
-STAGING_LIBDIR[unexport] = "1"
-
 BBCLASSEXTEND = "native nativesdk"
 
 ANY_OF_DISTRO_FEATURES_class-target = "opengl vulkan"
-- 
2.25.1

