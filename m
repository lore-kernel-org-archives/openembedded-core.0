Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id DCED16A9CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 11:22:11 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id k13so5733742wgh.17
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 04:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=OxMRqYYgCYY+321JaAsKwkJTRCrV2nIbAaEhfsZeKWs=;
	b=RBoMm17F8/GXkMB9jdbAjkthlKvXfK4JPnOuSbo9MJ2IpuW9hl9+gCi4dnw8I45E7B
	Vk+atTN9SIh5dLETldCW9BJExSxBp3QNvh/tA8OqS6JHYiF0cad9/M4p9BubA7aSgrbH
	cyGQLGu4gOTOvoYF18aWmAXxun8tl7eGOcy2XuZxK5tUsxOhF+l4FUvrgS3/r1L/I2QX
	I72sdJheoOZWSfilFseWIyhTG7aZ6mmy5MYFQUY73aOuxw/uE3RY3J7jSj9BNwlXEnhp
	PAmr4MeVtlXY91uwCAr55Z17Hh8WK4Ge1f4a/cJ7dwqYJC8jAKmshJgKK9whjm/AZ0uJ
	6uxw==
X-Received: by 10.194.176.71 with SMTP id cg7mr8095596wjc.18.1370949731599;
	Tue, 11 Jun 2013 04:22:11 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fb9sm17130405wid.2.2013.06.11.04.22.09
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 04:22:10 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jun 2013 12:18:48 +0100
Message-Id: <1370949528-4946-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnOqI++LX9dCzpFobovuo2BCzP7Sx9Oeg7mkrGiWk9dIqcjwB7Ma4XAODz6/lQb7Dj8QbOJ
Subject: [PATCH] glib-2.0: drop Makefile.in hunks from patch
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
X-List-Received-Date: Tue, 11 Jun 2013 11:22:12 -0000

Patching a generated file is prone to conflicts, and we'll be replacing this
file anyway when configuring, so drop the Makefile.in hunks.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch   |   34 --------------------
 1 file changed, 34 deletions(-)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch b/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
index 2920e2f..0c243cd 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/glib-2.0_fix_for_x32.patch
@@ -23,23 +23,6 @@ Index: glib-2.30.0/glib/Makefile.am
  BUILT_SOURCES += glib_probes.h glib_probes.o
  CLEANFILES += glib_probes.h glib_probes.h.tmp
  libglib_2_0_la_LIBADD += glib_probes.o
-Index: glib-2.30.0/glib/Makefile.in
-===================================================================
---- glib-2.30.0.orig/glib/Makefile.in
-+++ glib-2.30.0/glib/Makefile.in
-@@ -1691,10 +1691,10 @@ uninstall-local: uninstall-ms-lib uninst
- @OS_WIN32_AND_DLL_COMPILATION_FALSE@uninstall-def-file:
- 
- @ENABLE_DTRACE_TRUE@glib_probes.h: glib_probes.d Makefile
--@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
-+@ENABLE_DTRACE_TRUE@	$(AM_V_GEN)  CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
- @ENABLE_DTRACE_TRUE@	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
- @ENABLE_DTRACE_TRUE@glib_probes.o: glib_probes.d Makefile
--@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
-+@ENABLE_DTRACE_TRUE@	$(AM_V_GEN)  CC="$(CC)" CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
- 
- gspawn-win32-helper-console.c:
- 	echo '#define HELPER_CONSOLE' >$@
 Index: glib-2.30.0/gobject/Makefile.am
 ===================================================================
 --- glib-2.30.0.orig/gobject/Makefile.am
@@ -57,20 +40,3 @@ Index: glib-2.30.0/gobject/Makefile.am
  BUILT_SOURCES += gobject_probes.h gobject_probes.o
  CLEANFILES += gobject_probes.h
  libgobject_2_0_la_LIBADD += gobject_probes.o
-Index: glib-2.30.0/gobject/Makefile.in
-===================================================================
---- glib-2.30.0.orig/gobject/Makefile.in
-+++ glib-2.30.0/gobject/Makefile.in
-@@ -1581,10 +1581,10 @@ uninstall-ms-lib:
- @OS_WIN32_AND_DLL_COMPILATION_FALSE@uninstall-def-file:
- 
- @ENABLE_DTRACE_TRUE@gobject_probes.h: gobject_probes.d Makefile
--@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -C -h -s $< -o $@.tmp
-+@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -C -h -s $< -o $@.tmp
- @ENABLE_DTRACE_TRUE@	@$(SED) -e "s,define STAP_HAS_SEMAPHORES 1,undef STAP_HAS_SEMAPHORES," < $@.tmp > $@ && rm -f $@.tmp
- @ENABLE_DTRACE_TRUE@gobject_probes.o: gobject_probes.d Makefile
--@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) $(DTRACE) -G -s $< -o $@
-+@ENABLE_DTRACE_TRUE@	$(AM_V_GEN) CFLAGS="$(CFLAGS)" $(DTRACE) -G -s $< -o $@
- 
- # This is read by gobject-introspection/misc/ and gtk-doc
- gobject-public-headers.txt: Makefile
-- 
1.7.10.4


