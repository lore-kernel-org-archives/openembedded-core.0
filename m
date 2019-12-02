Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id 586297E995
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Dec 2019 17:55:09 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id y23so439975wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Dec 2019 09:55:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=KImDPhBoNC7+W6f6ZRgUs49r/1ZBLyDttktE8tKrVM4=;
	b=LZlcuhAkFqwzeYwzTxeKote/D61Fir/1bJtz5hmyEKL73Yo/zFyf5aN1tUCHZV9g9w
	60Ger/7sLO3RsqA1l/qu/evbe1075mvnSNla4dtupnvjBGuWUm7QptPLjUdq9KQTzhdQ
	DGgWRrcfbUFZGWcIzZTup0TLnG9xxdUzbhuWmZP8SyrZcpT3tEobQmTj/DdDBaN6vsSg
	qzQffG9aiLgU5cdiGWGqtsoGZGq0aJQ7xRubpj5aEShbisPXducI67YP4Cklm2PNk9gR
	IOg81YxyI/t9ZRdoZECnJ9QUHzymSxDOIU/FyfylnuZ+1NF+KG1xa8UvVLpzEZE0Kpos
	T5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=KImDPhBoNC7+W6f6ZRgUs49r/1ZBLyDttktE8tKrVM4=;
	b=hs1XScgTqG4xFLN9UDof7Zin9SeOMlJI/puKJkS6g5xBvgl67/PsTaFzW9R+0tzqdj
	Be7pjcmqN+RgOF4l21bjEd6TYjqUB/RKPvcQ/Ox/fztZEGyCojnhqOmL+qZS5193D5AC
	g3AWml/9BudYC9ym+Cdz4+8rBM488AobjWInrc7nnDb1fo7qLwgW67ypdvW8sBJ0n+Mr
	HMlOwMiB3U81iVPhTgIc3iKZqYCpVLN1ZCqBDHCAIhIb4H/bGCtahmGrBw8Tobog72va
	dOHA05TatJIEolpSwAFriwmNp91sg9cC/9MSoW4ngkDcxCfkKWhtUb09PdbjrJW3zKBw
	Ev5w==
X-Gm-Message-State: APjAAAXgLAUcHA1Lepya2VkBp9ZiVFx1pN7P0XqFuKGDPp8Bk8I8QtbD
	j+W1H2sFwXl4i26BpE19KZk+oDue
X-Google-Smtp-Source: APXvYqxXfuNO+fulQzlSNp1Tmotep6G2r6MFZc7V25uyeJbTqJsNEKr1bhHamH9zylnTEYSrPHwWVg==
X-Received: by 2002:a1c:e91a:: with SMTP id q26mr8910514wmc.59.1575309306689; 
	Mon, 02 Dec 2019 09:55:06 -0800 (PST)
Received: from alexander-box.rd.corpintra.net ([141.113.66.202])
	by smtp.gmail.com with ESMTPSA id y8sm144069wru.59.2019.12.02.09.55.05
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 02 Dec 2019 09:55:05 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Dec 2019 18:54:43 +0100
Message-Id: <20191202175459.112655-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191202175459.112655-1-alex.kanavin@gmail.com>
References: <20191202175459.112655-1-alex.kanavin@gmail.com>
Subject: [PATCH 02/18] gettext-minimal-native: update to 0.20.1
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
X-List-Received-Date: Mon, 02 Dec 2019 17:55:10 -0000

Rather than update a tarball, I took m4 files directly from an install of 0.20.1.

The patch is dropped as guile has long been removed from oe-core.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...H-Disable-the-test-to-convert-euc-jp.patch |  38 -
 .../gettext-minimal-0.19.8.1/aclocal.tgz      | Bin 40014 -> 0 bytes
 .../COPYING                                   |   0
 .../Makefile.in.in                            | 124 +--
 .../gettext-minimal-0.20.1/aclocal/gettext.m4 | 386 +++++++++
 .../aclocal/host-cpu-c-abi.m4                 | 644 +++++++++++++++
 .../gettext-minimal-0.20.1/aclocal/iconv.m4   | 288 +++++++
 .../aclocal/intlmacosx.m4                     |  72 ++
 .../gettext-minimal-0.20.1/aclocal/lib-ld.m4  | 168 ++++
 .../aclocal/lib-link.m4                       | 774 ++++++++++++++++++
 .../aclocal/lib-prefix.m4                     | 249 ++++++
 .../gettext-minimal-0.20.1/aclocal/nls.m4     |  32 +
 .../gettext-minimal-0.20.1/aclocal/po.m4      | 450 ++++++++++
 .../aclocal/progtest.m4                       |  91 ++
 .../config.rpath                              |   2 +-
 .../remove-potcdate.sin                       |   8 +-
 ....1.bb => gettext-minimal-native_0.20.1.bb} |   5 +-
 17 files changed, 3236 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.19.8.1/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch
 delete mode 100644 meta/recipes-core/gettext/gettext-minimal-0.19.8.1/aclocal.tgz
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.8.1 => gettext-minimal-0.20.1}/COPYING (100%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.8.1 => gettext-minimal-0.20.1}/Makefile.in.in (78%)
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/gettext.m4
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/host-cpu-c-abi.m4
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/iconv.m4
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/intlmacosx.m4
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-ld.m4
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-link.m4
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-prefix.m4
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/nls.m4
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/po.m4
 create mode 100644 meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/progtest.m4
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.8.1 => gettext-minimal-0.20.1}/config.rpath (99%)
 rename meta/recipes-core/gettext/{gettext-minimal-0.19.8.1 => gettext-minimal-0.20.1}/remove-potcdate.sin (50%)
 rename meta/recipes-core/gettext/{gettext-minimal-native_0.19.8.1.bb => gettext-minimal-native_0.20.1.bb} (86%)

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch
deleted file mode 100644
index 29ef2a5a63d..00000000000
--- a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/0001-PATCH-Disable-the-test-to-convert-euc-jp.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-[PATCH] Disable the test to convert euc-jp
-
-Remove the test "Test against HP-UX 11.11 bug:
-No converter from EUC-JP to UTF-8 is provided"
-since we don't support HP-UX and if the euc-jp is not
-installed on the host, the dependence will be built without
-iconv support and will cause guile-native building fail.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Roy Li <rongqing.li@windriver.com>
----
- iconv.m4 | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/iconv.m4 b/iconv.m4
-index 4e37363..35f54bd 100644
---- a/iconv.m4
-+++ b/iconv.m4
-@@ -165,6 +165,7 @@ AC_DEFUN([AM_ICONV_LINK],
-       }
-   }
- #endif
-+#if 0
-   /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
-      provided.  */
-   if (/* Try standardized names.  */
-@@ -176,6 +177,7 @@ AC_DEFUN([AM_ICONV_LINK],
-       /* Try HP-UX names.  */
-       && iconv_open ("utf8", "eucJP") == (iconv_t)(-1))
-     result |= 16;
-+#endif
-   return result;
- ]])],
-           [am_cv_func_iconv_works=yes], ,
--- 
-2.0.1
-
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/aclocal.tgz b/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/aclocal.tgz
deleted file mode 100644
index 9b2d1f561d734df608c9c7a6e29e08131296a5fd..0000000000000000000000000000000000000000
GIT binary patch
literal 0
HcmV?d00001

literal 40014
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

diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/COPYING b/meta/recipes-core/gettext/gettext-minimal-0.20.1/COPYING
similarity index 100%
rename from meta/recipes-core/gettext/gettext-minimal-0.19.8.1/COPYING
rename to meta/recipes-core/gettext/gettext-minimal-0.20.1/COPYING
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/Makefile.in.in b/meta/recipes-core/gettext/gettext-minimal-0.20.1/Makefile.in.in
similarity index 78%
rename from meta/recipes-core/gettext/gettext-minimal-0.19.8.1/Makefile.in.in
rename to meta/recipes-core/gettext/gettext-minimal-0.20.1/Makefile.in.in
index 38c293d2ed2..fdb6ad35881 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/Makefile.in.in
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/Makefile.in.in
@@ -1,13 +1,14 @@
 # Makefile for PO directory in any package using GNU gettext.
-# Copyright (C) 1995-1997, 2000-2007, 2009-2010 by Ulrich Drepper <drepper@gnu.ai.mit.edu>
+# Copyright (C) 1995-2000 Ulrich Drepper <drepper@gnu.ai.mit.edu>
+# Copyright (C) 2000-2019 Free Software Foundation, Inc.
 #
 # Copying and distribution of this file, with or without modification,
 # are permitted in any medium without royalty provided the copyright
 # notice and this notice are preserved.  This file is offered as-is,
 # without any warranty.
 #
-# Origin: gettext-0.19.8
-GETTEXT_MACRO_VERSION = 0.19
+# Origin: gettext-0.20
+GETTEXT_MACRO_VERSION = 0.20
 
 PACKAGE = @PACKAGE@
 VERSION = @VERSION@
@@ -52,16 +53,13 @@ GMSGFMT_ = @GMSGFMT@
 GMSGFMT_no = @GMSGFMT@
 GMSGFMT_yes = @GMSGFMT_015@
 GMSGFMT = $(GMSGFMT_$(USE_MSGCTXT))
-MSGFMT_ = @MSGFMT@
-MSGFMT_no = @MSGFMT@
-MSGFMT_yes = @MSGFMT_015@
-MSGFMT = $(MSGFMT_$(USE_MSGCTXT))
 XGETTEXT_ = @XGETTEXT@
 XGETTEXT_no = @XGETTEXT@
 XGETTEXT_yes = @XGETTEXT_015@
 XGETTEXT = $(XGETTEXT_$(USE_MSGCTXT))
-MSGMERGE = msgmerge
+MSGMERGE = @MSGMERGE@
 MSGMERGE_UPDATE = @MSGMERGE@ --update
+MSGMERGE_FOR_MSGFMT_OPTION = @MSGMERGE_FOR_MSGFMT_OPTION@
 MSGINIT = msginit
 MSGCONV = msgconv
 MSGFILTER = msgfilter
@@ -93,17 +91,32 @@ DISTFILESDEPS = $(DISTFILESDEPS_$(DIST_DEPENDS_ON_UPDATE_PO))
 # Makevars gets inserted here. (Don't remove this line!)
 
 .SUFFIXES:
-.SUFFIXES: .po .gmo .mo .sed .sin .nop .po-create .po-update
-
-.po.mo:
-	@echo "$(MSGFMT) -c -o $@ $<"; \
-	$(MSGFMT) -c -o t-$@ $< && mv t-$@ $@
-
-.po.gmo:
+.SUFFIXES: .po .gmo .sed .sin .nop .po-create .po-update
+
+# The .pot file, stamp-po, .po files, and .gmo files appear in release tarballs.
+# The GNU Coding Standards say in
+# <https://www.gnu.org/prep/standards/html_node/Makefile-Basics.html>:
+#   "GNU distributions usually contain some files which are not source files
+#    ... . Since these files normally appear in the source directory, they
+#    should always appear in the source directory, not in the build directory.
+#    So Makefile rules to update them should put the updated files in the
+#    source directory."
+# Therefore we put these files in the source directory, not the build directory.
+
+# During .po -> .gmo conversion, take into account the most recent changes to
+# the .pot file. This eliminates the need to update the .po files when the
+# .pot file has changed, which would be troublesome if the .po files are put
+# under version control.
+.po.gmo: $(srcdir)/$(DOMAIN).pot
 	@lang=`echo $* | sed -e 's,.*/,,'`; \
 	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
-	echo "$${cdcmd}rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics --verbose -o $${lang}.gmo $${lang}.po"; \
-	cd $(srcdir) && rm -f $${lang}.gmo && $(GMSGFMT) -c --statistics --verbose -o t-$${lang}.gmo $${lang}.po && mv t-$${lang}.gmo $${lang}.gmo
+	echo "$${cdcmd}rm -f $${lang}.gmo && $(MSGMERGE) $(MSGMERGE_FOR_MSGFMT_OPTION) -o $${lang}.1po $${lang}.po $(DOMAIN).pot && $(GMSGFMT) -c --statistics --verbose -o $${lang}.gmo $${lang}.1po && rm -f $${lang}.1po"; \
+	cd $(srcdir) && \
+	rm -f $${lang}.gmo && \
+	$(MSGMERGE) $(MSGMERGE_FOR_MSGFMT_OPTION) -o $${lang}.1po $${lang}.po $(DOMAIN).pot && \
+	$(GMSGFMT) -c --statistics --verbose -o t-$${lang}.gmo $${lang}.1po && \
+	mv t-$${lang}.gmo $${lang}.gmo && \
+	rm -f $${lang}.1po
 
 .sin.sed:
 	sed -e '/^#/d' $< > t-$@
@@ -112,7 +125,7 @@ DISTFILESDEPS = $(DISTFILESDEPS_$(DIST_DEPENDS_ON_UPDATE_PO))
 
 all: all-@USE_NLS@
 
-all-yes: stamp-po
+all-yes: $(srcdir)/stamp-po
 all-no:
 
 # Ensure that the gettext macros and this Makefile.in.in are in sync.
@@ -126,24 +139,24 @@ CHECK_MACRO_VERSION = \
 # internationalized messages, no $(srcdir)/$(DOMAIN).pot is created (because
 # we don't want to bother translators with empty POT files). We assume that
 # LINGUAS is empty in this case, i.e. $(POFILES) and $(GMOFILES) are empty.
-# In this case, stamp-po is a nop (i.e. a phony target).
-
-# stamp-po is a timestamp denoting the last time at which the CATALOGS have
-# been loosely updated. Its purpose is that when a developer or translator
-# checks out the package via CVS, and the $(DOMAIN).pot file is not in CVS,
-# "make" will update the $(DOMAIN).pot and the $(CATALOGS), but subsequent
-# invocations of "make" will do nothing. This timestamp would not be necessary
-# if updating the $(CATALOGS) would always touch them; however, the rule for
-# $(POFILES) has been designed to not touch files that don't need to be
-# changed.
-stamp-po: $(srcdir)/$(DOMAIN).pot
+# In this case, $(srcdir)/stamp-po is a nop (i.e. a phony target).
+
+# $(srcdir)/stamp-po is a timestamp denoting the last time at which the CATALOGS
+# have been loosely updated. Its purpose is that when a developer or translator
+# checks out the package from a version control system, and the $(DOMAIN).pot
+# file is not under version control, "make" will update the $(DOMAIN).pot and
+# the $(CATALOGS), but subsequent invocations of "make" will do nothing. This
+# timestamp would not be necessary if updating the $(CATALOGS) would always
+# touch them; however, the rule for $(POFILES) has been designed to not touch
+# files that don't need to be changed.
+$(srcdir)/stamp-po: $(srcdir)/$(DOMAIN).pot
 	@$(CHECK_MACRO_VERSION)
 	test ! -f $(srcdir)/$(DOMAIN).pot || \
 	  test -z "$(GMOFILES)" || $(MAKE) $(GMOFILES)
 	@test ! -f $(srcdir)/$(DOMAIN).pot || { \
-	  echo "touch stamp-po" && \
-	  echo timestamp > stamp-poT && \
-	  mv stamp-poT stamp-po; \
+	  echo "touch $(srcdir)/stamp-po" && \
+	  echo timestamp > $(srcdir)/stamp-poT && \
+	  mv $(srcdir)/stamp-poT $(srcdir)/stamp-po; \
 	}
 
 # Note: Target 'all' must not depend on target '$(DOMAIN).pot-update',
@@ -159,11 +172,9 @@ $(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFILES.in remove-potcdate.sed
 	package_gnu="$(PACKAGE_GNU)"; \
 	test -n "$$package_gnu" || { \
 	  if { if (LC_ALL=C find --version) 2>/dev/null | grep GNU >/dev/null; then \
-		 LC_ALL=C find -L $(top_srcdir) -maxdepth 1 -type f \
-			       -size -10000000c -exec grep 'GNU @PACKAGE@' \
-			       /dev/null '{}' ';' 2>/dev/null; \
+	         LC_ALL=C find -L $(top_srcdir) -maxdepth 1 -type f -size -10000000c -exec grep -i 'GNU @PACKAGE@' /dev/null '{}' ';' 2>/dev/null; \
 	       else \
-		 LC_ALL=C grep 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null; \
+	         LC_ALL=C grep -i 'GNU @PACKAGE@' $(top_srcdir)/* 2>/dev/null; \
 	       fi; \
 	     } | grep -v 'libtool:' >/dev/null; then \
 	     package_gnu=yes; \
@@ -184,26 +195,29 @@ $(DOMAIN).pot-update: $(POTFILES) $(srcdir)/POTFILES.in remove-potcdate.sed
 	case `$(XGETTEXT) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
 	  '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].* | 0.16 | 0.16.[0-1]*) \
 	    $(XGETTEXT) --default-domain=$(DOMAIN) --directory=$(top_srcdir) \
-	      --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
+	      --add-comments=TRANSLATORS: \
 	      --files-from=$(srcdir)/POTFILES.in \
 	      --copyright-holder='$(COPYRIGHT_HOLDER)' \
 	      --msgid-bugs-address="$$msgid_bugs_address" \
+	      $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
 	    ;; \
 	  *) \
 	    $(XGETTEXT) --default-domain=$(DOMAIN) --directory=$(top_srcdir) \
-	      --add-comments=TRANSLATORS: $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
+	      --add-comments=TRANSLATORS: \
 	      --files-from=$(srcdir)/POTFILES.in \
 	      --copyright-holder='$(COPYRIGHT_HOLDER)' \
 	      --package-name="$${package_prefix}@PACKAGE@" \
 	      --package-version='@VERSION@' \
 	      --msgid-bugs-address="$$msgid_bugs_address" \
+	      $(XGETTEXT_OPTIONS) @XGETTEXT_EXTRA_OPTIONS@ \
 	    ;; \
 	esac
 	test ! -f $(DOMAIN).po || { \
 	  if test -f $(srcdir)/$(DOMAIN).pot-header; then \
 	    sed -e '1,/^#$$/d' < $(DOMAIN).po > $(DOMAIN).1po && \
-	    cat $(srcdir)/$(DOMAIN).pot-header $(DOMAIN).1po > $(DOMAIN).po; \
-	    rm -f $(DOMAIN).1po; \
+	    cat $(srcdir)/$(DOMAIN).pot-header $(DOMAIN).1po > $(DOMAIN).po && \
+	    rm -f $(DOMAIN).1po \
+	    || exit 1; \
 	  fi; \
 	  if test -f $(srcdir)/$(DOMAIN).pot; then \
 	    sed -f remove-potcdate.sed < $(srcdir)/$(DOMAIN).pot > $(DOMAIN).1po && \
@@ -228,17 +242,19 @@ $(srcdir)/$(DOMAIN).pot:
 # This target rebuilds a PO file if $(DOMAIN).pot has changed.
 # Note that a PO file is not touched if it doesn't need to be changed.
 $(POFILES): $(POFILESDEPS)
+	@test -f $(srcdir)/$(DOMAIN).pot || $(MAKE) $(srcdir)/$(DOMAIN).pot
 	@lang=`echo $@ | sed -e 's,.*/,,' -e 's/\.po$$//'`; \
 	if test -f "$(srcdir)/$${lang}.po"; then \
-	  test -f $(srcdir)/$(DOMAIN).pot || $(MAKE) $(srcdir)/$(DOMAIN).pot; \
 	  test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
-	  echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} $${lang}.po $(DOMAIN).pot"; \
+	  echo "$${cdcmd}$(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} --previous $${lang}.po $(DOMAIN).pot"; \
 	  cd $(srcdir) \
-	    && { case `$(MSGMERGE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
-	           '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
+	    && { case `$(MSGMERGE_UPDATE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
+	           '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].*) \
 	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) $${lang}.po $(DOMAIN).pot;; \
+	           0.1[6-7] | 0.1[6-7].*) \
+	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --previous $${lang}.po $(DOMAIN).pot;; \
 	           *) \
-	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} $${lang}.po $(DOMAIN).pot;; \
+	             $(MSGMERGE_UPDATE) $(MSGMERGE_OPTIONS) --lang=$${lang} --previous $${lang}.po $(DOMAIN).pot;; \
 	         esac; \
 	       }; \
 	else \
@@ -373,28 +389,30 @@ check: all
 
 info dvi ps pdf html tags TAGS ctags CTAGS ID:
 
+install-dvi install-ps install-pdf install-html:
+
 mostlyclean:
 	rm -f remove-potcdate.sed
-	rm -f stamp-poT
+	rm -f $(srcdir)/stamp-poT
 	rm -f core core.* $(DOMAIN).po $(DOMAIN).1po $(DOMAIN).2po *.new.po
 	rm -fr *.o
 
 clean: mostlyclean
 
 distclean: clean
-	rm -f Makefile Makefile.in POTFILES *.mo
+	rm -f Makefile Makefile.in POTFILES
 
 maintainer-clean: distclean
 	@echo "This command is intended for maintainers to use;"
 	@echo "it deletes files that may require special tools to rebuild."
-	rm -f stamp-po $(GMOFILES)
+	rm -f $(srcdir)/$(DOMAIN).pot $(srcdir)/stamp-po $(GMOFILES)
 
 distdir = $(top_builddir)/$(PACKAGE)-$(VERSION)/$(subdir)
 dist distdir:
 	test -z "$(DISTFILESDEPS)" || $(MAKE) $(DISTFILESDEPS)
 	@$(MAKE) dist2
 # This is a separate target because 'update-po' must be executed before.
-dist2: stamp-po $(DISTFILES)
+dist2: $(srcdir)/stamp-po $(DISTFILES)
 	dists="$(DISTFILES)"; \
 	if test "$(PACKAGE)" = "gettext-tools"; then \
 	  dists="$$dists Makevars.template"; \
@@ -439,13 +457,15 @@ update-po: Makefile
 	tmpdir=`pwd`; \
 	echo "$$lang:"; \
 	test "$(srcdir)" = . && cdcmd="" || cdcmd="cd $(srcdir) && "; \
-	echo "$${cdcmd}$(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang $$lang.po $(DOMAIN).pot -o $$lang.new.po"; \
+	echo "$${cdcmd}$(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang --previous $$lang.po $(DOMAIN).pot -o $$lang.new.po"; \
 	cd $(srcdir); \
 	if { case `$(MSGMERGE) --version | sed 1q | sed -e 's,^[^0-9]*,,'` in \
-	       '' | 0.[0-9] | 0.[0-9].* | 0.1[0-7] | 0.1[0-7].*) \
+	       '' | 0.[0-9] | 0.[0-9].* | 0.1[0-5] | 0.1[0-5].*) \
 	         $(MSGMERGE) $(MSGMERGE_OPTIONS) -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
+	       0.1[6-7] | 0.1[6-7].*) \
+	         $(MSGMERGE) $(MSGMERGE_OPTIONS) --previous -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
 	       *) \
-	         $(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
+	         $(MSGMERGE) $(MSGMERGE_OPTIONS) --lang=$$lang --previous -o $$tmpdir/$$lang.new.po $$lang.po $(DOMAIN).pot;; \
 	     esac; \
 	   }; then \
 	  if cmp $$lang.po $$tmpdir/$$lang.new.po >/dev/null 2>&1; then \
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/gettext.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/gettext.m4
new file mode 100644
index 00000000000..e7832418ea1
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/gettext.m4
@@ -0,0 +1,386 @@
+# gettext.m4 serial 70 (gettext-0.20)
+dnl Copyright (C) 1995-2014, 2016, 2018 Free Software Foundation, Inc.
+dnl This file is free software; the Free Software Foundation
+dnl gives unlimited permission to copy and/or distribute it,
+dnl with or without modifications, as long as this notice is preserved.
+dnl
+dnl This file can be used in projects which are not available under
+dnl the GNU General Public License or the GNU Library General Public
+dnl License but which still want to provide support for the GNU gettext
+dnl functionality.
+dnl Please note that the actual code of the GNU gettext library is covered
+dnl by the GNU Library General Public License, and the rest of the GNU
+dnl gettext package is covered by the GNU General Public License.
+dnl They are *not* in the public domain.
+
+dnl Authors:
+dnl   Ulrich Drepper <drepper@cygnus.com>, 1995-2000.
+dnl   Bruno Haible <haible@clisp.cons.org>, 2000-2006, 2008-2010.
+
+dnl Macro to add for using GNU gettext.
+
+dnl Usage: AM_GNU_GETTEXT([INTLSYMBOL], [NEEDSYMBOL], [INTLDIR]).
+dnl INTLSYMBOL must be one of 'external', 'use-libtool'.
+dnl    INTLSYMBOL should be 'external' for packages other than GNU gettext, and
+dnl    'use-libtool' for the packages 'gettext-runtime' and 'gettext-tools'.
+dnl    If INTLSYMBOL is 'use-libtool', then a libtool library
+dnl    $(top_builddir)/intl/libintl.la will be created (shared and/or static,
+dnl    depending on --{enable,disable}-{shared,static} and on the presence of
+dnl    AM-DISABLE-SHARED).
+dnl If NEEDSYMBOL is specified and is 'need-ngettext', then GNU gettext
+dnl    implementations (in libc or libintl) without the ngettext() function
+dnl    will be ignored.  If NEEDSYMBOL is specified and is
+dnl    'need-formatstring-macros', then GNU gettext implementations that don't
+dnl    support the ISO C 99 <inttypes.h> formatstring macros will be ignored.
+dnl INTLDIR is used to find the intl libraries.  If empty,
+dnl    the value '$(top_builddir)/intl/' is used.
+dnl
+dnl The result of the configuration is one of three cases:
+dnl 1) GNU gettext, as included in the intl subdirectory, will be compiled
+dnl    and used.
+dnl    Catalog format: GNU --> install in $(datadir)
+dnl    Catalog extension: .mo after installation, .gmo in source tree
+dnl 2) GNU gettext has been found in the system's C library.
+dnl    Catalog format: GNU --> install in $(datadir)
+dnl    Catalog extension: .mo after installation, .gmo in source tree
+dnl 3) No internationalization, always use English msgid.
+dnl    Catalog format: none
+dnl    Catalog extension: none
+dnl If INTLSYMBOL is 'external', only cases 2 and 3 can occur.
+dnl The use of .gmo is historical (it was needed to avoid overwriting the
+dnl GNU format catalogs when building on a platform with an X/Open gettext),
+dnl but we keep it in order not to force irrelevant filename changes on the
+dnl maintainers.
+dnl
+AC_DEFUN([AM_GNU_GETTEXT],
+[
+  dnl Argument checking.
+  ifelse([$1], [], , [ifelse([$1], [external], , [ifelse([$1], [use-libtool], ,
+    [errprint([ERROR: invalid first argument to AM_GNU_GETTEXT
+])])])])
+  ifelse(ifelse([$1], [], [old])[]ifelse([$1], [no-libtool], [old]), [old],
+    [errprint([ERROR: Use of AM_GNU_GETTEXT without [external] argument is no longer supported.
+])])
+  ifelse([$2], [], , [ifelse([$2], [need-ngettext], , [ifelse([$2], [need-formatstring-macros], ,
+    [errprint([ERROR: invalid second argument to AM_GNU_GETTEXT
+])])])])
+  define([gt_included_intl],
+    ifelse([$1], [external], [no], [yes]))
+  gt_NEEDS_INIT
+  AM_GNU_GETTEXT_NEED([$2])
+
+  AC_REQUIRE([AM_PO_SUBDIRS])dnl
+  ifelse(gt_included_intl, yes, [
+    AC_REQUIRE([AM_INTL_SUBDIR])dnl
+  ])
+
+  dnl Prerequisites of AC_LIB_LINKFLAGS_BODY.
+  AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
+  AC_REQUIRE([AC_LIB_RPATH])
+
+  dnl Sometimes libintl requires libiconv, so first search for libiconv.
+  dnl Ideally we would do this search only after the
+  dnl      if test "$USE_NLS" = "yes"; then
+  dnl        if { eval "gt_val=\$$gt_func_gnugettext_libc"; test "$gt_val" != "yes"; }; then
+  dnl tests. But if configure.in invokes AM_ICONV after AM_GNU_GETTEXT
+  dnl the configure script would need to contain the same shell code
+  dnl again, outside any 'if'. There are two solutions:
+  dnl - Invoke AM_ICONV_LINKFLAGS_BODY here, outside any 'if'.
+  dnl - Control the expansions in more detail using AC_PROVIDE_IFELSE.
+  dnl Since AC_PROVIDE_IFELSE is not documented, we avoid it.
+  ifelse(gt_included_intl, yes, , [
+    AC_REQUIRE([AM_ICONV_LINKFLAGS_BODY])
+  ])
+
+  dnl Sometimes, on Mac OS X, libintl requires linking with CoreFoundation.
+  gt_INTL_MACOSX
+
+  dnl Set USE_NLS.
+  AC_REQUIRE([AM_NLS])
+
+  ifelse(gt_included_intl, yes, [
+    BUILD_INCLUDED_LIBINTL=no
+    USE_INCLUDED_LIBINTL=no
+  ])
+  LIBINTL=
+  LTLIBINTL=
+  POSUB=
+
+  dnl Add a version number to the cache macros.
+  case " $gt_needs " in
+    *" need-formatstring-macros "*) gt_api_version=3 ;;
+    *" need-ngettext "*) gt_api_version=2 ;;
+    *) gt_api_version=1 ;;
+  esac
+  gt_func_gnugettext_libc="gt_cv_func_gnugettext${gt_api_version}_libc"
+  gt_func_gnugettext_libintl="gt_cv_func_gnugettext${gt_api_version}_libintl"
+
+  dnl If we use NLS figure out what method
+  if test "$USE_NLS" = "yes"; then
+    gt_use_preinstalled_gnugettext=no
+    ifelse(gt_included_intl, yes, [
+      AC_MSG_CHECKING([whether included gettext is requested])
+      AC_ARG_WITH([included-gettext],
+        [  --with-included-gettext use the GNU gettext library included here],
+        nls_cv_force_use_gnu_gettext=$withval,
+        nls_cv_force_use_gnu_gettext=no)
+      AC_MSG_RESULT([$nls_cv_force_use_gnu_gettext])
+
+      nls_cv_use_gnu_gettext="$nls_cv_force_use_gnu_gettext"
+      if test "$nls_cv_force_use_gnu_gettext" != "yes"; then
+    ])
+        dnl User does not insist on using GNU NLS library.  Figure out what
+        dnl to use.  If GNU gettext is available we use this.  Else we have
+        dnl to fall back to GNU NLS library.
+
+        if test $gt_api_version -ge 3; then
+          gt_revision_test_code='
+#ifndef __GNU_GETTEXT_SUPPORTED_REVISION
+#define __GNU_GETTEXT_SUPPORTED_REVISION(major) ((major) == 0 ? 0 : -1)
+#endif
+changequote(,)dnl
+typedef int array [2 * (__GNU_GETTEXT_SUPPORTED_REVISION(0) >= 1) - 1];
+changequote([,])dnl
+'
+        else
+          gt_revision_test_code=
+        fi
+        if test $gt_api_version -ge 2; then
+          gt_expression_test_code=' + * ngettext ("", "", 0)'
+        else
+          gt_expression_test_code=
+        fi
+
+        AC_CACHE_CHECK([for GNU gettext in libc], [$gt_func_gnugettext_libc],
+         [AC_LINK_IFELSE(
+            [AC_LANG_PROGRAM(
+               [[
+#include <libintl.h>
+#ifndef __GNU_GETTEXT_SUPPORTED_REVISION
+extern int _nl_msg_cat_cntr;
+extern int *_nl_domain_bindings;
+#define __GNU_GETTEXT_SYMBOL_EXPRESSION (_nl_msg_cat_cntr + *_nl_domain_bindings)
+#else
+#define __GNU_GETTEXT_SYMBOL_EXPRESSION 0
+#endif
+$gt_revision_test_code
+               ]],
+               [[
+bindtextdomain ("", "");
+return * gettext ("")$gt_expression_test_code + __GNU_GETTEXT_SYMBOL_EXPRESSION
+               ]])],
+            [eval "$gt_func_gnugettext_libc=yes"],
+            [eval "$gt_func_gnugettext_libc=no"])])
+
+        if { eval "gt_val=\$$gt_func_gnugettext_libc"; test "$gt_val" != "yes"; }; then
+          dnl Sometimes libintl requires libiconv, so first search for libiconv.
+          ifelse(gt_included_intl, yes, , [
+            AM_ICONV_LINK
+          ])
+          dnl Search for libintl and define LIBINTL, LTLIBINTL and INCINTL
+          dnl accordingly. Don't use AC_LIB_LINKFLAGS_BODY([intl],[iconv])
+          dnl because that would add "-liconv" to LIBINTL and LTLIBINTL
+          dnl even if libiconv doesn't exist.
+          AC_LIB_LINKFLAGS_BODY([intl])
+          AC_CACHE_CHECK([for GNU gettext in libintl],
+            [$gt_func_gnugettext_libintl],
+           [gt_save_CPPFLAGS="$CPPFLAGS"
+            CPPFLAGS="$CPPFLAGS $INCINTL"
+            gt_save_LIBS="$LIBS"
+            LIBS="$LIBS $LIBINTL"
+            dnl Now see whether libintl exists and does not depend on libiconv.
+            AC_LINK_IFELSE(
+              [AC_LANG_PROGRAM(
+                 [[
+#include <libintl.h>
+#ifndef __GNU_GETTEXT_SUPPORTED_REVISION
+extern int _nl_msg_cat_cntr;
+extern
+#ifdef __cplusplus
+"C"
+#endif
+const char *_nl_expand_alias (const char *);
+#define __GNU_GETTEXT_SYMBOL_EXPRESSION (_nl_msg_cat_cntr + *_nl_expand_alias (""))
+#else
+#define __GNU_GETTEXT_SYMBOL_EXPRESSION 0
+#endif
+$gt_revision_test_code
+                 ]],
+                 [[
+bindtextdomain ("", "");
+return * gettext ("")$gt_expression_test_code + __GNU_GETTEXT_SYMBOL_EXPRESSION
+                 ]])],
+              [eval "$gt_func_gnugettext_libintl=yes"],
+              [eval "$gt_func_gnugettext_libintl=no"])
+            dnl Now see whether libintl exists and depends on libiconv.
+            if { eval "gt_val=\$$gt_func_gnugettext_libintl"; test "$gt_val" != yes; } && test -n "$LIBICONV"; then
+              LIBS="$LIBS $LIBICONV"
+              AC_LINK_IFELSE(
+                [AC_LANG_PROGRAM(
+                   [[
+#include <libintl.h>
+#ifndef __GNU_GETTEXT_SUPPORTED_REVISION
+extern int _nl_msg_cat_cntr;
+extern
+#ifdef __cplusplus
+"C"
+#endif
+const char *_nl_expand_alias (const char *);
+#define __GNU_GETTEXT_SYMBOL_EXPRESSION (_nl_msg_cat_cntr + *_nl_expand_alias (""))
+#else
+#define __GNU_GETTEXT_SYMBOL_EXPRESSION 0
+#endif
+$gt_revision_test_code
+                   ]],
+                   [[
+bindtextdomain ("", "");
+return * gettext ("")$gt_expression_test_code + __GNU_GETTEXT_SYMBOL_EXPRESSION
+                   ]])],
+                [LIBINTL="$LIBINTL $LIBICONV"
+                 LTLIBINTL="$LTLIBINTL $LTLIBICONV"
+                 eval "$gt_func_gnugettext_libintl=yes"
+                ])
+            fi
+            CPPFLAGS="$gt_save_CPPFLAGS"
+            LIBS="$gt_save_LIBS"])
+        fi
+
+        dnl If an already present or preinstalled GNU gettext() is found,
+        dnl use it.  But if this macro is used in GNU gettext, and GNU
+        dnl gettext is already preinstalled in libintl, we update this
+        dnl libintl.  (Cf. the install rule in intl/Makefile.in.)
+        if { eval "gt_val=\$$gt_func_gnugettext_libc"; test "$gt_val" = "yes"; } \
+           || { { eval "gt_val=\$$gt_func_gnugettext_libintl"; test "$gt_val" = "yes"; } \
+                && test "$PACKAGE" != gettext-runtime \
+                && test "$PACKAGE" != gettext-tools; }; then
+          gt_use_preinstalled_gnugettext=yes
+        else
+          dnl Reset the values set by searching for libintl.
+          LIBINTL=
+          LTLIBINTL=
+          INCINTL=
+        fi
+
+    ifelse(gt_included_intl, yes, [
+        if test "$gt_use_preinstalled_gnugettext" != "yes"; then
+          dnl GNU gettext is not found in the C library.
+          dnl Fall back on included GNU gettext library.
+          nls_cv_use_gnu_gettext=yes
+        fi
+      fi
+
+      if test "$nls_cv_use_gnu_gettext" = "yes"; then
+        dnl Mark actions used to generate GNU NLS library.
+        BUILD_INCLUDED_LIBINTL=yes
+        USE_INCLUDED_LIBINTL=yes
+        LIBINTL="ifelse([$3],[],\${top_builddir}/intl,[$3])/libintl.la $LIBICONV $LIBTHREAD"
+        LTLIBINTL="ifelse([$3],[],\${top_builddir}/intl,[$3])/libintl.la $LTLIBICONV $LTLIBTHREAD"
+        LIBS=`echo " $LIBS " | sed -e 's/ -lintl / /' -e 's/^ //' -e 's/ $//'`
+      fi
+
+      CATOBJEXT=
+      if test "$gt_use_preinstalled_gnugettext" = "yes" \
+         || test "$nls_cv_use_gnu_gettext" = "yes"; then
+        dnl Mark actions to use GNU gettext tools.
+        CATOBJEXT=.gmo
+      fi
+    ])
+
+    if test -n "$INTL_MACOSX_LIBS"; then
+      if test "$gt_use_preinstalled_gnugettext" = "yes" \
+         || test "$nls_cv_use_gnu_gettext" = "yes"; then
+        dnl Some extra flags are needed during linking.
+        LIBINTL="$LIBINTL $INTL_MACOSX_LIBS"
+        LTLIBINTL="$LTLIBINTL $INTL_MACOSX_LIBS"
+      fi
+    fi
+
+    if test "$gt_use_preinstalled_gnugettext" = "yes" \
+       || test "$nls_cv_use_gnu_gettext" = "yes"; then
+      AC_DEFINE([ENABLE_NLS], [1],
+        [Define to 1 if translation of program messages to the user's native language
+   is requested.])
+    else
+      USE_NLS=no
+    fi
+  fi
+
+  AC_MSG_CHECKING([whether to use NLS])
+  AC_MSG_RESULT([$USE_NLS])
+  if test "$USE_NLS" = "yes"; then
+    AC_MSG_CHECKING([where the gettext function comes from])
+    if test "$gt_use_preinstalled_gnugettext" = "yes"; then
+      if { eval "gt_val=\$$gt_func_gnugettext_libintl"; test "$gt_val" = "yes"; }; then
+        gt_source="external libintl"
+      else
+        gt_source="libc"
+      fi
+    else
+      gt_source="included intl directory"
+    fi
+    AC_MSG_RESULT([$gt_source])
+  fi
+
+  if test "$USE_NLS" = "yes"; then
+
+    if test "$gt_use_preinstalled_gnugettext" = "yes"; then
+      if { eval "gt_val=\$$gt_func_gnugettext_libintl"; test "$gt_val" = "yes"; }; then
+        AC_MSG_CHECKING([how to link with libintl])
+        AC_MSG_RESULT([$LIBINTL])
+        AC_LIB_APPENDTOVAR([CPPFLAGS], [$INCINTL])
+      fi
+
+      dnl For backward compatibility. Some packages may be using this.
+      AC_DEFINE([HAVE_GETTEXT], [1],
+       [Define if the GNU gettext() function is already present or preinstalled.])
+      AC_DEFINE([HAVE_DCGETTEXT], [1],
+       [Define if the GNU dcgettext() function is already present or preinstalled.])
+    fi
+
+    dnl We need to process the po/ directory.
+    POSUB=po
+  fi
+
+  ifelse(gt_included_intl, yes, [
+    dnl In GNU gettext we have to set BUILD_INCLUDED_LIBINTL to 'yes'
+    dnl because some of the testsuite requires it.
+    BUILD_INCLUDED_LIBINTL=yes
+
+    dnl Make all variables we use known to autoconf.
+    AC_SUBST([BUILD_INCLUDED_LIBINTL])
+    AC_SUBST([USE_INCLUDED_LIBINTL])
+    AC_SUBST([CATOBJEXT])
+  ])
+
+  dnl For backward compatibility. Some Makefiles may be using this.
+  INTLLIBS="$LIBINTL"
+  AC_SUBST([INTLLIBS])
+
+  dnl Make all documented variables known to autoconf.
+  AC_SUBST([LIBINTL])
+  AC_SUBST([LTLIBINTL])
+  AC_SUBST([POSUB])
+])
+
+
+dnl gt_NEEDS_INIT ensures that the gt_needs variable is initialized.
+m4_define([gt_NEEDS_INIT],
+[
+  m4_divert_text([DEFAULTS], [gt_needs=])
+  m4_define([gt_NEEDS_INIT], [])
+])
+
+
+dnl Usage: AM_GNU_GETTEXT_NEED([NEEDSYMBOL])
+AC_DEFUN([AM_GNU_GETTEXT_NEED],
+[
+  m4_divert_text([INIT_PREPARE], [gt_needs="$gt_needs $1"])
+])
+
+
+dnl Usage: AM_GNU_GETTEXT_VERSION([gettext-version])
+AC_DEFUN([AM_GNU_GETTEXT_VERSION], [])
+
+
+dnl Usage: AM_GNU_GETTEXT_REQUIRE_VERSION([gettext-version])
+AC_DEFUN([AM_GNU_GETTEXT_REQUIRE_VERSION], [])
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/host-cpu-c-abi.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/host-cpu-c-abi.m4
new file mode 100644
index 00000000000..4407296d084
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/host-cpu-c-abi.m4
@@ -0,0 +1,644 @@
+# host-cpu-c-abi.m4 serial 11
+dnl Copyright (C) 2002-2019 Free Software Foundation, Inc.
+dnl This file is free software; the Free Software Foundation
+dnl gives unlimited permission to copy and/or distribute it,
+dnl with or without modifications, as long as this notice is preserved.
+
+dnl From Bruno Haible and Sam Steingold.
+
+dnl Sets the HOST_CPU variable to the canonical name of the CPU.
+dnl Sets the HOST_CPU_C_ABI variable to the canonical name of the CPU with its
+dnl C language ABI (application binary interface).
+dnl Also defines __${HOST_CPU}__ and __${HOST_CPU_C_ABI}__ as C macros in
+dnl config.h.
+dnl
+dnl This canonical name can be used to select a particular assembly language
+dnl source file that will interoperate with C code on the given host.
+dnl
+dnl For example:
+dnl * 'i386' and 'sparc' are different canonical names, because code for i386
+dnl   will not run on SPARC CPUs and vice versa. They have different
+dnl   instruction sets.
+dnl * 'sparc' and 'sparc64' are different canonical names, because code for
+dnl   'sparc' and code for 'sparc64' cannot be linked together: 'sparc' code
+dnl   contains 32-bit instructions, whereas 'sparc64' code contains 64-bit
+dnl   instructions. A process on a SPARC CPU can be in 32-bit mode or in 64-bit
+dnl   mode, but not both.
+dnl * 'mips' and 'mipsn32' are different canonical names, because they use
+dnl   different argument passing and return conventions for C functions, and
+dnl   although the instruction set of 'mips' is a large subset of the
+dnl   instruction set of 'mipsn32'.
+dnl * 'mipsn32' and 'mips64' are different canonical names, because they use
+dnl   different sizes for the C types like 'int' and 'void *', and although
+dnl   the instruction sets of 'mipsn32' and 'mips64' are the same.
+dnl * The same canonical name is used for different endiannesses. You can
+dnl   determine the endianness through preprocessor symbols:
+dnl   - 'arm': test __ARMEL__.
+dnl   - 'mips', 'mipsn32', 'mips64': test _MIPSEB vs. _MIPSEL.
+dnl   - 'powerpc64': test _BIG_ENDIAN vs. _LITTLE_ENDIAN.
+dnl * The same name 'i386' is used for CPUs of type i386, i486, i586
+dnl   (Pentium), AMD K7, Pentium II, Pentium IV, etc., because
+dnl   - Instructions that do not exist on all of these CPUs (cmpxchg,
+dnl     MMX, SSE, SSE2, 3DNow! etc.) are not frequently used. If your
+dnl     assembly language source files use such instructions, you will
+dnl     need to make the distinction.
+dnl   - Speed of execution of the common instruction set is reasonable across
+dnl     the entire family of CPUs. If you have assembly language source files
+dnl     that are optimized for particular CPU types (like GNU gmp has), you
+dnl     will need to make the distinction.
+dnl   See <https://en.wikipedia.org/wiki/X86_instruction_listings>.
+AC_DEFUN([gl_HOST_CPU_C_ABI],
+[
+  AC_REQUIRE([AC_CANONICAL_HOST])
+  AC_REQUIRE([gl_C_ASM])
+  AC_CACHE_CHECK([host CPU and C ABI], [gl_cv_host_cpu_c_abi],
+    [case "$host_cpu" in
+
+changequote(,)dnl
+       i[4567]86 )
+changequote([,])dnl
+         gl_cv_host_cpu_c_abi=i386
+         ;;
+
+       x86_64 )
+         # On x86_64 systems, the C compiler may be generating code in one of
+         # these ABIs:
+         # - 64-bit instruction set, 64-bit pointers, 64-bit 'long': x86_64.
+         # - 64-bit instruction set, 64-bit pointers, 32-bit 'long': x86_64
+         #   with native Windows (mingw, MSVC).
+         # - 64-bit instruction set, 32-bit pointers, 32-bit 'long': x86_64-x32.
+         # - 32-bit instruction set, 32-bit pointers, 32-bit 'long': i386.
+         AC_COMPILE_IFELSE(
+           [AC_LANG_SOURCE(
+              [[#if (defined __x86_64__ || defined __amd64__ \
+                     || defined _M_X64 || defined _M_AMD64)
+                 int ok;
+                #else
+                 error fail
+                #endif
+              ]])],
+           [AC_COMPILE_IFELSE(
+              [AC_LANG_SOURCE(
+                 [[#if defined __ILP32__ || defined _ILP32
+                    int ok;
+                   #else
+                    error fail
+                   #endif
+                 ]])],
+              [gl_cv_host_cpu_c_abi=x86_64-x32],
+              [gl_cv_host_cpu_c_abi=x86_64])],
+           [gl_cv_host_cpu_c_abi=i386])
+         ;;
+
+changequote(,)dnl
+       alphaev[4-8] | alphaev56 | alphapca5[67] | alphaev6[78] )
+changequote([,])dnl
+         gl_cv_host_cpu_c_abi=alpha
+         ;;
+
+       arm* | aarch64 )
+         # Assume arm with EABI.
+         # On arm64 systems, the C compiler may be generating code in one of
+         # these ABIs:
+         # - aarch64 instruction set, 64-bit pointers, 64-bit 'long': arm64.
+         # - aarch64 instruction set, 32-bit pointers, 32-bit 'long': arm64-ilp32.
+         # - 32-bit instruction set, 32-bit pointers, 32-bit 'long': arm or armhf.
+         AC_COMPILE_IFELSE(
+           [AC_LANG_SOURCE(
+              [[#ifdef __aarch64__
+                 int ok;
+                #else
+                 error fail
+                #endif
+              ]])],
+           [AC_COMPILE_IFELSE(
+              [AC_LANG_SOURCE(
+                [[#if defined __ILP32__ || defined _ILP32
+                   int ok;
+                  #else
+                   error fail
+                  #endif
+                ]])],
+              [gl_cv_host_cpu_c_abi=arm64-ilp32],
+              [gl_cv_host_cpu_c_abi=arm64])],
+           [# Don't distinguish little-endian and big-endian arm, since they
+            # don't require different machine code for simple operations and
+            # since the user can distinguish them through the preprocessor
+            # defines __ARMEL__ vs. __ARMEB__.
+            # But distinguish arm which passes floating-point arguments and
+            # return values in integer registers (r0, r1, ...) - this is
+            # gcc -mfloat-abi=soft or gcc -mfloat-abi=softfp - from arm which
+            # passes them in float registers (s0, s1, ...) and double registers
+            # (d0, d1, ...) - this is gcc -mfloat-abi=hard. GCC 4.6 or newer
+            # sets the preprocessor defines __ARM_PCS (for the first case) and
+            # __ARM_PCS_VFP (for the second case), but older GCC does not.
+            echo 'double ddd; void func (double dd) { ddd = dd; }' > conftest.c
+            # Look for a reference to the register d0 in the .s file.
+            AC_TRY_COMMAND(${CC-cc} $CFLAGS $CPPFLAGS $gl_c_asm_opt conftest.c) >/dev/null 2>&1
+            if LC_ALL=C grep 'd0,' conftest.$gl_asmext >/dev/null; then
+              gl_cv_host_cpu_c_abi=armhf
+            else
+              gl_cv_host_cpu_c_abi=arm
+            fi
+            rm -f conftest*
+           ])
+         ;;
+
+       hppa1.0 | hppa1.1 | hppa2.0* | hppa64 )
+         # On hppa, the C compiler may be generating 32-bit code or 64-bit
+         # code. In the latter case, it defines _LP64 and __LP64__.
+         AC_COMPILE_IFELSE(
+           [AC_LANG_SOURCE(
+              [[#ifdef __LP64__
+                 int ok;
+                #else
+                 error fail
+                #endif
+              ]])],
+           [gl_cv_host_cpu_c_abi=hppa64],
+           [gl_cv_host_cpu_c_abi=hppa])
+         ;;
+
+       ia64* )
+         # On ia64 on HP-UX, the C compiler may be generating 64-bit code or
+         # 32-bit code. In the latter case, it defines _ILP32.
+         AC_COMPILE_IFELSE(
+           [AC_LANG_SOURCE(
+              [[#ifdef _ILP32
+                 int ok;
+                #else
+                 error fail
+                #endif
+              ]])],
+           [gl_cv_host_cpu_c_abi=ia64-ilp32],
+           [gl_cv_host_cpu_c_abi=ia64])
+         ;;
+
+       mips* )
+         # We should also check for (_MIPS_SZPTR == 64), but gcc keeps this
+         # at 32.
+         AC_COMPILE_IFELSE(
+           [AC_LANG_SOURCE(
+              [[#if defined _MIPS_SZLONG && (_MIPS_SZLONG == 64)
+                 int ok;
+                #else
+                 error fail
+                #endif
+              ]])],
+           [gl_cv_host_cpu_c_abi=mips64],
+           [# In the n32 ABI, _ABIN32 is defined, _ABIO32 is not defined (but
+            # may later get defined by <sgidefs.h>), and _MIPS_SIM == _ABIN32.
+            # In the 32 ABI, _ABIO32 is defined, _ABIN32 is not defined (but
+            # may later get defined by <sgidefs.h>), and _MIPS_SIM == _ABIO32.
+            AC_COMPILE_IFELSE(
+              [AC_LANG_SOURCE(
+                 [[#if (_MIPS_SIM == _ABIN32)
+                    int ok;
+                   #else
+                    error fail
+                   #endif
+                 ]])],
+              [gl_cv_host_cpu_c_abi=mipsn32],
+              [gl_cv_host_cpu_c_abi=mips])])
+         ;;
+
+       powerpc* )
+         # Different ABIs are in use on AIX vs. Mac OS X vs. Linux,*BSD.
+         # No need to distinguish them here; the caller may distinguish
+         # them based on the OS.
+         # On powerpc64 systems, the C compiler may still be generating
+         # 32-bit code. And on powerpc-ibm-aix systems, the C compiler may
+         # be generating 64-bit code.
+         AC_COMPILE_IFELSE(
+           [AC_LANG_SOURCE(
+              [[#if defined __powerpc64__ || defined _ARCH_PPC64
+                 int ok;
+                #else
+                 error fail
+                #endif
+              ]])],
+           [# On powerpc64, there are two ABIs on Linux: The AIX compatible
+            # one and the ELFv2 one. The latter defines _CALL_ELF=2.
+            AC_COMPILE_IFELSE(
+              [AC_LANG_SOURCE(
+                 [[#if defined _CALL_ELF && _CALL_ELF == 2
+                    int ok;
+                   #else
+                    error fail
+                   #endif
+                 ]])],
+              [gl_cv_host_cpu_c_abi=powerpc64-elfv2],
+              [gl_cv_host_cpu_c_abi=powerpc64])
+           ],
+           [gl_cv_host_cpu_c_abi=powerpc])
+         ;;
+
+       rs6000 )
+         gl_cv_host_cpu_c_abi=powerpc
+         ;;
+
+       riscv32 | riscv64 )
+         # There are 2 architectures (with variants): rv32* and rv64*.
+         AC_COMPILE_IFELSE(
+           [AC_LANG_SOURCE(
+              [[#if __riscv_xlen == 64
+                  int ok;
+                #else
+                  error fail
+                #endif
+              ]])],
+           [cpu=riscv64],
+           [cpu=riscv32])
+         # There are 6 ABIs: ilp32, ilp32f, ilp32d, lp64, lp64f, lp64d.
+         # Size of 'long' and 'void *':
+         AC_COMPILE_IFELSE(
+           [AC_LANG_SOURCE(
+              [[#if defined __LP64__
+                  int ok;
+                #else
+                  error fail
+                #endif
+              ]])],
+           [main_abi=lp64],
+           [main_abi=ilp32])
+         # Float ABIs:
+         # __riscv_float_abi_double:
+         #   'float' and 'double' are passed in floating-point registers.
+         # __riscv_float_abi_single:
+         #   'float' are passed in floating-point registers.
+         # __riscv_float_abi_soft:
+         #   No values are passed in floating-point registers.
+         AC_COMPILE_IFELSE(
+           [AC_LANG_SOURCE(
+              [[#if defined __riscv_float_abi_double
+                  int ok;
+                #else
+                  error fail
+                #endif
+              ]])],
+           [float_abi=d],
+           [AC_COMPILE_IFELSE(
+              [AC_LANG_SOURCE(
+                 [[#if defined __riscv_float_abi_single
+                     int ok;
+                   #else
+                     error fail
+                   #endif
+                 ]])],
+              [float_abi=f],
+              [float_abi=''])
+           ])
+         gl_cv_host_cpu_c_abi="${cpu}-${main_abi}${float_abi}"
+         ;;
+
+       s390* )
+         # On s390x, the C compiler may be generating 64-bit (= s390x) code
+         # or 31-bit (= s390) code.
+         AC_COMPILE_IFELSE(
+           [AC_LANG_SOURCE(
+              [[#if defined __LP64__ || defined __s390x__
+                  int ok;
+                #else
+                  error fail
+                #endif
+              ]])],
+           [gl_cv_host_cpu_c_abi=s390x],
+           [gl_cv_host_cpu_c_abi=s390])
+         ;;
+
+       sparc | sparc64 )
+         # UltraSPARCs running Linux have `uname -m` = "sparc64", but the
+         # C compiler still generates 32-bit code.
+         AC_COMPILE_IFELSE(
+           [AC_LANG_SOURCE(
+              [[#if defined __sparcv9 || defined __arch64__
+                 int ok;
+                #else
+                 error fail
+                #endif
+              ]])],
+           [gl_cv_host_cpu_c_abi=sparc64],
+           [gl_cv_host_cpu_c_abi=sparc])
+         ;;
+
+       *)
+         gl_cv_host_cpu_c_abi="$host_cpu"
+         ;;
+     esac
+    ])
+
+  dnl In most cases, $HOST_CPU and $HOST_CPU_C_ABI are the same.
+  HOST_CPU=`echo "$gl_cv_host_cpu_c_abi" | sed -e 's/-.*//'`
+  HOST_CPU_C_ABI="$gl_cv_host_cpu_c_abi"
+  AC_SUBST([HOST_CPU])
+  AC_SUBST([HOST_CPU_C_ABI])
+
+  # This was
+  #   AC_DEFINE_UNQUOTED([__${HOST_CPU}__])
+  #   AC_DEFINE_UNQUOTED([__${HOST_CPU_C_ABI}__])
+  # earlier, but KAI C++ 3.2d doesn't like this.
+  sed -e 's/-/_/g' >> confdefs.h <<EOF
+#ifndef __${HOST_CPU}__
+#define __${HOST_CPU}__ 1
+#endif
+#ifndef __${HOST_CPU_C_ABI}__
+#define __${HOST_CPU_C_ABI}__ 1
+#endif
+EOF
+  AH_TOP([/* CPU and C ABI indicator */
+#ifndef __i386__
+#undef __i386__
+#endif
+#ifndef __x86_64_x32__
+#undef __x86_64_x32__
+#endif
+#ifndef __x86_64__
+#undef __x86_64__
+#endif
+#ifndef __alpha__
+#undef __alpha__
+#endif
+#ifndef __arm__
+#undef __arm__
+#endif
+#ifndef __armhf__
+#undef __armhf__
+#endif
+#ifndef __arm64_ilp32__
+#undef __arm64_ilp32__
+#endif
+#ifndef __arm64__
+#undef __arm64__
+#endif
+#ifndef __hppa__
+#undef __hppa__
+#endif
+#ifndef __hppa64__
+#undef __hppa64__
+#endif
+#ifndef __ia64_ilp32__
+#undef __ia64_ilp32__
+#endif
+#ifndef __ia64__
+#undef __ia64__
+#endif
+#ifndef __m68k__
+#undef __m68k__
+#endif
+#ifndef __mips__
+#undef __mips__
+#endif
+#ifndef __mipsn32__
+#undef __mipsn32__
+#endif
+#ifndef __mips64__
+#undef __mips64__
+#endif
+#ifndef __powerpc__
+#undef __powerpc__
+#endif
+#ifndef __powerpc64__
+#undef __powerpc64__
+#endif
+#ifndef __powerpc64_elfv2__
+#undef __powerpc64_elfv2__
+#endif
+#ifndef __riscv32__
+#undef __riscv32__
+#endif
+#ifndef __riscv64__
+#undef __riscv64__
+#endif
+#ifndef __riscv32_ilp32__
+#undef __riscv32_ilp32__
+#endif
+#ifndef __riscv32_ilp32f__
+#undef __riscv32_ilp32f__
+#endif
+#ifndef __riscv32_ilp32d__
+#undef __riscv32_ilp32d__
+#endif
+#ifndef __riscv64_ilp32__
+#undef __riscv64_ilp32__
+#endif
+#ifndef __riscv64_ilp32f__
+#undef __riscv64_ilp32f__
+#endif
+#ifndef __riscv64_ilp32d__
+#undef __riscv64_ilp32d__
+#endif
+#ifndef __riscv64_lp64__
+#undef __riscv64_lp64__
+#endif
+#ifndef __riscv64_lp64f__
+#undef __riscv64_lp64f__
+#endif
+#ifndef __riscv64_lp64d__
+#undef __riscv64_lp64d__
+#endif
+#ifndef __s390__
+#undef __s390__
+#endif
+#ifndef __s390x__
+#undef __s390x__
+#endif
+#ifndef __sh__
+#undef __sh__
+#endif
+#ifndef __sparc__
+#undef __sparc__
+#endif
+#ifndef __sparc64__
+#undef __sparc64__
+#endif
+])
+
+])
+
+
+dnl Sets the HOST_CPU_C_ABI_32BIT variable to 'yes' if the C language ABI
+dnl (application binary interface) is a 32-bit one, or to 'no' otherwise.
+dnl This is a simplified variant of gl_HOST_CPU_C_ABI.
+AC_DEFUN([gl_HOST_CPU_C_ABI_32BIT],
+[
+  AC_REQUIRE([AC_CANONICAL_HOST])
+  AC_CACHE_CHECK([32-bit host C ABI], [gl_cv_host_cpu_c_abi_32bit],
+    [if test -n "$gl_cv_host_cpu_c_abi"; then
+       case "$gl_cv_host_cpu_c_abi" in
+         i386 | x86_64-x32 | arm | armhf | arm64-ilp32 | hppa | ia64-ilp32 | mips | mipsn32 | powerpc | riscv*-ilp32* | s390 | sparc)
+           gl_cv_host_cpu_c_abi_32bit=yes ;;
+         *)
+           gl_cv_host_cpu_c_abi_32bit=no ;;
+       esac
+     else
+       case "$host_cpu" in
+
+changequote(,)dnl
+         i[4567]86 )
+changequote([,])dnl
+           gl_cv_host_cpu_c_abi_32bit=yes
+           ;;
+
+         x86_64 )
+           # On x86_64 systems, the C compiler may be generating code in one of
+           # these ABIs:
+           # - 64-bit instruction set, 64-bit pointers, 64-bit 'long': x86_64.
+           # - 64-bit instruction set, 64-bit pointers, 32-bit 'long': x86_64
+           #   with native Windows (mingw, MSVC).
+           # - 64-bit instruction set, 32-bit pointers, 32-bit 'long': x86_64-x32.
+           # - 32-bit instruction set, 32-bit pointers, 32-bit 'long': i386.
+           AC_COMPILE_IFELSE(
+             [AC_LANG_SOURCE(
+                [[#if (defined __x86_64__ || defined __amd64__ \
+                       || defined _M_X64 || defined _M_AMD64) \
+                      && !(defined __ILP32__ || defined _ILP32)
+                   int ok;
+                  #else
+                   error fail
+                  #endif
+                ]])],
+             [gl_cv_host_cpu_c_abi_32bit=no],
+             [gl_cv_host_cpu_c_abi_32bit=yes])
+           ;;
+
+         arm* | aarch64 )
+           # Assume arm with EABI.
+           # On arm64 systems, the C compiler may be generating code in one of
+           # these ABIs:
+           # - aarch64 instruction set, 64-bit pointers, 64-bit 'long': arm64.
+           # - aarch64 instruction set, 32-bit pointers, 32-bit 'long': arm64-ilp32.
+           # - 32-bit instruction set, 32-bit pointers, 32-bit 'long': arm or armhf.
+           AC_COMPILE_IFELSE(
+             [AC_LANG_SOURCE(
+                [[#if defined __aarch64__ && !(defined __ILP32__ || defined _ILP32)
+                   int ok;
+                  #else
+                   error fail
+                  #endif
+                ]])],
+             [gl_cv_host_cpu_c_abi_32bit=no],
+             [gl_cv_host_cpu_c_abi_32bit=yes])
+           ;;
+
+         hppa1.0 | hppa1.1 | hppa2.0* | hppa64 )
+           # On hppa, the C compiler may be generating 32-bit code or 64-bit
+           # code. In the latter case, it defines _LP64 and __LP64__.
+           AC_COMPILE_IFELSE(
+             [AC_LANG_SOURCE(
+                [[#ifdef __LP64__
+                   int ok;
+                  #else
+                   error fail
+                  #endif
+                ]])],
+             [gl_cv_host_cpu_c_abi_32bit=no],
+             [gl_cv_host_cpu_c_abi_32bit=yes])
+           ;;
+
+         ia64* )
+           # On ia64 on HP-UX, the C compiler may be generating 64-bit code or
+           # 32-bit code. In the latter case, it defines _ILP32.
+           AC_COMPILE_IFELSE(
+             [AC_LANG_SOURCE(
+                [[#ifdef _ILP32
+                   int ok;
+                  #else
+                   error fail
+                  #endif
+                ]])],
+             [gl_cv_host_cpu_c_abi_32bit=yes],
+             [gl_cv_host_cpu_c_abi_32bit=no])
+           ;;
+
+         mips* )
+           # We should also check for (_MIPS_SZPTR == 64), but gcc keeps this
+           # at 32.
+           AC_COMPILE_IFELSE(
+             [AC_LANG_SOURCE(
+                [[#if defined _MIPS_SZLONG && (_MIPS_SZLONG == 64)
+                   int ok;
+                  #else
+                   error fail
+                  #endif
+                ]])],
+             [gl_cv_host_cpu_c_abi_32bit=no],
+             [gl_cv_host_cpu_c_abi_32bit=yes])
+           ;;
+
+         powerpc* )
+           # Different ABIs are in use on AIX vs. Mac OS X vs. Linux,*BSD.
+           # No need to distinguish them here; the caller may distinguish
+           # them based on the OS.
+           # On powerpc64 systems, the C compiler may still be generating
+           # 32-bit code. And on powerpc-ibm-aix systems, the C compiler may
+           # be generating 64-bit code.
+           AC_COMPILE_IFELSE(
+             [AC_LANG_SOURCE(
+                [[#if defined __powerpc64__ || defined _ARCH_PPC64
+                   int ok;
+                  #else
+                   error fail
+                  #endif
+                ]])],
+             [gl_cv_host_cpu_c_abi_32bit=no],
+             [gl_cv_host_cpu_c_abi_32bit=yes])
+           ;;
+
+         rs6000 )
+           gl_cv_host_cpu_c_abi_32bit=yes
+           ;;
+
+         riscv32 | riscv64 )
+           # There are 6 ABIs: ilp32, ilp32f, ilp32d, lp64, lp64f, lp64d.
+           # Size of 'long' and 'void *':
+           AC_COMPILE_IFELSE(
+             [AC_LANG_SOURCE(
+                [[#if defined __LP64__
+                    int ok;
+                  #else
+                    error fail
+                  #endif
+                ]])],
+             [gl_cv_host_cpu_c_abi_32bit=no],
+             [gl_cv_host_cpu_c_abi_32bit=yes])
+           ;;
+
+         s390* )
+           # On s390x, the C compiler may be generating 64-bit (= s390x) code
+           # or 31-bit (= s390) code.
+           AC_COMPILE_IFELSE(
+             [AC_LANG_SOURCE(
+                [[#if defined __LP64__ || defined __s390x__
+                    int ok;
+                  #else
+                    error fail
+                  #endif
+                ]])],
+             [gl_cv_host_cpu_c_abi_32bit=no],
+             [gl_cv_host_cpu_c_abi_32bit=yes])
+           ;;
+
+         sparc | sparc64 )
+           # UltraSPARCs running Linux have `uname -m` = "sparc64", but the
+           # C compiler still generates 32-bit code.
+           AC_COMPILE_IFELSE(
+             [AC_LANG_SOURCE(
+                [[#if defined __sparcv9 || defined __arch64__
+                   int ok;
+                  #else
+                   error fail
+                  #endif
+                ]])],
+             [gl_cv_host_cpu_c_abi_32bit=no],
+             [gl_cv_host_cpu_c_abi_32bit=yes])
+           ;;
+
+         *)
+           gl_cv_host_cpu_c_abi_32bit=no
+           ;;
+       esac
+     fi
+    ])
+
+  HOST_CPU_C_ABI_32BIT="$gl_cv_host_cpu_c_abi_32bit"
+])
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/iconv.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/iconv.m4
new file mode 100644
index 00000000000..a285e9daa5e
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/iconv.m4
@@ -0,0 +1,288 @@
+# iconv.m4 serial 21
+dnl Copyright (C) 2000-2002, 2007-2014, 2016-2019 Free Software Foundation,
+dnl Inc.
+dnl This file is free software; the Free Software Foundation
+dnl gives unlimited permission to copy and/or distribute it,
+dnl with or without modifications, as long as this notice is preserved.
+
+dnl From Bruno Haible.
+
+AC_DEFUN([AM_ICONV_LINKFLAGS_BODY],
+[
+  dnl Prerequisites of AC_LIB_LINKFLAGS_BODY.
+  AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
+  AC_REQUIRE([AC_LIB_RPATH])
+
+  dnl Search for libiconv and define LIBICONV, LTLIBICONV and INCICONV
+  dnl accordingly.
+  AC_LIB_LINKFLAGS_BODY([iconv])
+])
+
+AC_DEFUN([AM_ICONV_LINK],
+[
+  dnl Some systems have iconv in libc, some have it in libiconv (OSF/1 and
+  dnl those with the standalone portable GNU libiconv installed).
+  AC_REQUIRE([AC_CANONICAL_HOST]) dnl for cross-compiles
+
+  dnl Search for libiconv and define LIBICONV, LTLIBICONV and INCICONV
+  dnl accordingly.
+  AC_REQUIRE([AM_ICONV_LINKFLAGS_BODY])
+
+  dnl Add $INCICONV to CPPFLAGS before performing the following checks,
+  dnl because if the user has installed libiconv and not disabled its use
+  dnl via --without-libiconv-prefix, he wants to use it. The first
+  dnl AC_LINK_IFELSE will then fail, the second AC_LINK_IFELSE will succeed.
+  am_save_CPPFLAGS="$CPPFLAGS"
+  AC_LIB_APPENDTOVAR([CPPFLAGS], [$INCICONV])
+
+  AC_CACHE_CHECK([for iconv], [am_cv_func_iconv], [
+    am_cv_func_iconv="no, consider installing GNU libiconv"
+    am_cv_lib_iconv=no
+    AC_LINK_IFELSE(
+      [AC_LANG_PROGRAM(
+         [[
+#include <stdlib.h>
+#include <iconv.h>
+         ]],
+         [[iconv_t cd = iconv_open("","");
+           iconv(cd,NULL,NULL,NULL,NULL);
+           iconv_close(cd);]])],
+      [am_cv_func_iconv=yes])
+    if test "$am_cv_func_iconv" != yes; then
+      am_save_LIBS="$LIBS"
+      LIBS="$LIBS $LIBICONV"
+      AC_LINK_IFELSE(
+        [AC_LANG_PROGRAM(
+           [[
+#include <stdlib.h>
+#include <iconv.h>
+           ]],
+           [[iconv_t cd = iconv_open("","");
+             iconv(cd,NULL,NULL,NULL,NULL);
+             iconv_close(cd);]])],
+        [am_cv_lib_iconv=yes]
+        [am_cv_func_iconv=yes])
+      LIBS="$am_save_LIBS"
+    fi
+  ])
+  if test "$am_cv_func_iconv" = yes; then
+    AC_CACHE_CHECK([for working iconv], [am_cv_func_iconv_works], [
+      dnl This tests against bugs in AIX 5.1, AIX 6.1..7.1, HP-UX 11.11,
+      dnl Solaris 10.
+      am_save_LIBS="$LIBS"
+      if test $am_cv_lib_iconv = yes; then
+        LIBS="$LIBS $LIBICONV"
+      fi
+      am_cv_func_iconv_works=no
+      for ac_iconv_const in '' 'const'; do
+        AC_RUN_IFELSE(
+          [AC_LANG_PROGRAM(
+             [[
+#include <iconv.h>
+#include <string.h>
+
+#ifndef ICONV_CONST
+# define ICONV_CONST $ac_iconv_const
+#endif
+             ]],
+             [[int result = 0;
+  /* Test against AIX 5.1 bug: Failures are not distinguishable from successful
+     returns.  */
+  {
+    iconv_t cd_utf8_to_88591 = iconv_open ("ISO8859-1", "UTF-8");
+    if (cd_utf8_to_88591 != (iconv_t)(-1))
+      {
+        static ICONV_CONST char input[] = "\342\202\254"; /* EURO SIGN */
+        char buf[10];
+        ICONV_CONST char *inptr = input;
+        size_t inbytesleft = strlen (input);
+        char *outptr = buf;
+        size_t outbytesleft = sizeof (buf);
+        size_t res = iconv (cd_utf8_to_88591,
+                            &inptr, &inbytesleft,
+                            &outptr, &outbytesleft);
+        if (res == 0)
+          result |= 1;
+        iconv_close (cd_utf8_to_88591);
+      }
+  }
+  /* Test against Solaris 10 bug: Failures are not distinguishable from
+     successful returns.  */
+  {
+    iconv_t cd_ascii_to_88591 = iconv_open ("ISO8859-1", "646");
+    if (cd_ascii_to_88591 != (iconv_t)(-1))
+      {
+        static ICONV_CONST char input[] = "\263";
+        char buf[10];
+        ICONV_CONST char *inptr = input;
+        size_t inbytesleft = strlen (input);
+        char *outptr = buf;
+        size_t outbytesleft = sizeof (buf);
+        size_t res = iconv (cd_ascii_to_88591,
+                            &inptr, &inbytesleft,
+                            &outptr, &outbytesleft);
+        if (res == 0)
+          result |= 2;
+        iconv_close (cd_ascii_to_88591);
+      }
+  }
+  /* Test against AIX 6.1..7.1 bug: Buffer overrun.  */
+  {
+    iconv_t cd_88591_to_utf8 = iconv_open ("UTF-8", "ISO-8859-1");
+    if (cd_88591_to_utf8 != (iconv_t)(-1))
+      {
+        static ICONV_CONST char input[] = "\304";
+        static char buf[2] = { (char)0xDE, (char)0xAD };
+        ICONV_CONST char *inptr = input;
+        size_t inbytesleft = 1;
+        char *outptr = buf;
+        size_t outbytesleft = 1;
+        size_t res = iconv (cd_88591_to_utf8,
+                            &inptr, &inbytesleft,
+                            &outptr, &outbytesleft);
+        if (res != (size_t)(-1) || outptr - buf > 1 || buf[1] != (char)0xAD)
+          result |= 4;
+        iconv_close (cd_88591_to_utf8);
+      }
+  }
+#if 0 /* This bug could be worked around by the caller.  */
+  /* Test against HP-UX 11.11 bug: Positive return value instead of 0.  */
+  {
+    iconv_t cd_88591_to_utf8 = iconv_open ("utf8", "iso88591");
+    if (cd_88591_to_utf8 != (iconv_t)(-1))
+      {
+        static ICONV_CONST char input[] = "\304rger mit b\366sen B\374bchen ohne Augenma\337";
+        char buf[50];
+        ICONV_CONST char *inptr = input;
+        size_t inbytesleft = strlen (input);
+        char *outptr = buf;
+        size_t outbytesleft = sizeof (buf);
+        size_t res = iconv (cd_88591_to_utf8,
+                            &inptr, &inbytesleft,
+                            &outptr, &outbytesleft);
+        if ((int)res > 0)
+          result |= 8;
+        iconv_close (cd_88591_to_utf8);
+      }
+  }
+#endif
+  /* Test against HP-UX 11.11 bug: No converter from EUC-JP to UTF-8 is
+     provided.  */
+  {
+    /* Try standardized names.  */
+    iconv_t cd1 = iconv_open ("UTF-8", "EUC-JP");
+    /* Try IRIX, OSF/1 names.  */
+    iconv_t cd2 = iconv_open ("UTF-8", "eucJP");
+    /* Try AIX names.  */
+    iconv_t cd3 = iconv_open ("UTF-8", "IBM-eucJP");
+    /* Try HP-UX names.  */
+    iconv_t cd4 = iconv_open ("utf8", "eucJP");
+    if (cd1 == (iconv_t)(-1) && cd2 == (iconv_t)(-1)
+        && cd3 == (iconv_t)(-1) && cd4 == (iconv_t)(-1))
+      result |= 16;
+    if (cd1 != (iconv_t)(-1))
+      iconv_close (cd1);
+    if (cd2 != (iconv_t)(-1))
+      iconv_close (cd2);
+    if (cd3 != (iconv_t)(-1))
+      iconv_close (cd3);
+    if (cd4 != (iconv_t)(-1))
+      iconv_close (cd4);
+  }
+  return result;
+]])],
+          [am_cv_func_iconv_works=yes], ,
+          [case "$host_os" in
+             aix* | hpux*) am_cv_func_iconv_works="guessing no" ;;
+             *)            am_cv_func_iconv_works="guessing yes" ;;
+           esac])
+        test "$am_cv_func_iconv_works" = no || break
+      done
+      LIBS="$am_save_LIBS"
+    ])
+    case "$am_cv_func_iconv_works" in
+      *no) am_func_iconv=no am_cv_lib_iconv=no ;;
+      *)   am_func_iconv=yes ;;
+    esac
+  else
+    am_func_iconv=no am_cv_lib_iconv=no
+  fi
+  if test "$am_func_iconv" = yes; then
+    AC_DEFINE([HAVE_ICONV], [1],
+      [Define if you have the iconv() function and it works.])
+  fi
+  if test "$am_cv_lib_iconv" = yes; then
+    AC_MSG_CHECKING([how to link with libiconv])
+    AC_MSG_RESULT([$LIBICONV])
+  else
+    dnl If $LIBICONV didn't lead to a usable library, we don't need $INCICONV
+    dnl either.
+    CPPFLAGS="$am_save_CPPFLAGS"
+    LIBICONV=
+    LTLIBICONV=
+  fi
+  AC_SUBST([LIBICONV])
+  AC_SUBST([LTLIBICONV])
+])
+
+dnl Define AM_ICONV using AC_DEFUN_ONCE for Autoconf >= 2.64, in order to
+dnl avoid warnings like
+dnl "warning: AC_REQUIRE: `AM_ICONV' was expanded before it was required".
+dnl This is tricky because of the way 'aclocal' is implemented:
+dnl - It requires defining an auxiliary macro whose name ends in AC_DEFUN.
+dnl   Otherwise aclocal's initial scan pass would miss the macro definition.
+dnl - It requires a line break inside the AC_DEFUN_ONCE and AC_DEFUN expansions.
+dnl   Otherwise aclocal would emit many "Use of uninitialized value $1"
+dnl   warnings.
+m4_define([gl_iconv_AC_DEFUN],
+  m4_version_prereq([2.64],
+    [[AC_DEFUN_ONCE(
+        [$1], [$2])]],
+    [m4_ifdef([gl_00GNULIB],
+       [[AC_DEFUN_ONCE(
+           [$1], [$2])]],
+       [[AC_DEFUN(
+           [$1], [$2])]])]))
+gl_iconv_AC_DEFUN([AM_ICONV],
+[
+  AM_ICONV_LINK
+  if test "$am_cv_func_iconv" = yes; then
+    AC_MSG_CHECKING([for iconv declaration])
+    AC_CACHE_VAL([am_cv_proto_iconv], [
+      AC_COMPILE_IFELSE(
+        [AC_LANG_PROGRAM(
+           [[
+#include <stdlib.h>
+#include <iconv.h>
+extern
+#ifdef __cplusplus
+"C"
+#endif
+#if defined(__STDC__) || defined(_MSC_VER) || defined(__cplusplus)
+size_t iconv (iconv_t cd, char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);
+#else
+size_t iconv();
+#endif
+           ]],
+           [[]])],
+        [am_cv_proto_iconv_arg1=""],
+        [am_cv_proto_iconv_arg1="const"])
+      am_cv_proto_iconv="extern size_t iconv (iconv_t cd, $am_cv_proto_iconv_arg1 char * *inbuf, size_t *inbytesleft, char * *outbuf, size_t *outbytesleft);"])
+    am_cv_proto_iconv=`echo "[$]am_cv_proto_iconv" | tr -s ' ' | sed -e 's/( /(/'`
+    AC_MSG_RESULT([
+         $am_cv_proto_iconv])
+  else
+    dnl When compiling GNU libiconv on a system that does not have iconv yet,
+    dnl pick the POSIX compliant declaration without 'const'.
+    am_cv_proto_iconv_arg1=""
+  fi
+  AC_DEFINE_UNQUOTED([ICONV_CONST], [$am_cv_proto_iconv_arg1],
+    [Define as const if the declaration of iconv() needs const.])
+  dnl Also substitute ICONV_CONST in the gnulib generated <iconv.h>.
+  m4_ifdef([gl_ICONV_H_DEFAULTS],
+    [AC_REQUIRE([gl_ICONV_H_DEFAULTS])
+     if test -n "$am_cv_proto_iconv_arg1"; then
+       ICONV_CONST="const"
+     fi
+    ])
+])
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/intlmacosx.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/intlmacosx.m4
new file mode 100644
index 00000000000..30e6f50e0ac
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/intlmacosx.m4
@@ -0,0 +1,72 @@
+# intlmacosx.m4 serial 6 (gettext-0.20)
+dnl Copyright (C) 2004-2014, 2016, 2019 Free Software Foundation, Inc.
+dnl This file is free software; the Free Software Foundation
+dnl gives unlimited permission to copy and/or distribute it,
+dnl with or without modifications, as long as this notice is preserved.
+dnl
+dnl This file can be used in projects which are not available under
+dnl the GNU General Public License or the GNU Library General Public
+dnl License but which still want to provide support for the GNU gettext
+dnl functionality.
+dnl Please note that the actual code of the GNU gettext library is covered
+dnl by the GNU Library General Public License, and the rest of the GNU
+dnl gettext package is covered by the GNU General Public License.
+dnl They are *not* in the public domain.
+
+dnl Checks for special options needed on Mac OS X.
+dnl Defines INTL_MACOSX_LIBS.
+AC_DEFUN([gt_INTL_MACOSX],
+[
+  dnl Check for API introduced in Mac OS X 10.4.
+  AC_CACHE_CHECK([for CFPreferencesCopyAppValue],
+    [gt_cv_func_CFPreferencesCopyAppValue],
+    [gt_save_LIBS="$LIBS"
+     LIBS="$LIBS -Wl,-framework -Wl,CoreFoundation"
+     AC_LINK_IFELSE(
+       [AC_LANG_PROGRAM(
+          [[#include <CoreFoundation/CFPreferences.h>]],
+          [[CFPreferencesCopyAppValue(NULL, NULL)]])],
+       [gt_cv_func_CFPreferencesCopyAppValue=yes],
+       [gt_cv_func_CFPreferencesCopyAppValue=no])
+     LIBS="$gt_save_LIBS"])
+  if test $gt_cv_func_CFPreferencesCopyAppValue = yes; then
+    AC_DEFINE([HAVE_CFPREFERENCESCOPYAPPVALUE], [1],
+      [Define to 1 if you have the Mac OS X function CFPreferencesCopyAppValue in the CoreFoundation framework.])
+  fi
+  dnl Check for API introduced in Mac OS X 10.5.
+  AC_CACHE_CHECK([for CFLocaleCopyCurrent], [gt_cv_func_CFLocaleCopyCurrent],
+    [gt_save_LIBS="$LIBS"
+     LIBS="$LIBS -Wl,-framework -Wl,CoreFoundation"
+     AC_LINK_IFELSE(
+       [AC_LANG_PROGRAM(
+          [[#include <CoreFoundation/CFLocale.h>]],
+          [[CFLocaleCopyCurrent();]])],
+       [gt_cv_func_CFLocaleCopyCurrent=yes],
+       [gt_cv_func_CFLocaleCopyCurrent=no])
+     LIBS="$gt_save_LIBS"])
+  if test $gt_cv_func_CFLocaleCopyCurrent = yes; then
+    AC_DEFINE([HAVE_CFLOCALECOPYCURRENT], [1],
+      [Define to 1 if you have the Mac OS X function CFLocaleCopyCurrent in the CoreFoundation framework.])
+  fi
+  AC_CACHE_CHECK([for CFLocaleCopyPreferredLanguages], [gt_cv_func_CFLocaleCopyPreferredLanguages],
+    [gt_save_LIBS="$LIBS"
+     LIBS="$LIBS -Wl,-framework -Wl,CoreFoundation"
+     AC_LINK_IFELSE(
+       [AC_LANG_PROGRAM(
+          [[#include <CoreFoundation/CFLocale.h>]],
+          [[CFLocaleCopyPreferredLanguages();]])],
+       [gt_cv_func_CFLocaleCopyPreferredLanguages=yes],
+       [gt_cv_func_CFLocaleCopyPreferredLanguages=no])
+     LIBS="$gt_save_LIBS"])
+  if test $gt_cv_func_CFLocaleCopyPreferredLanguages = yes; then
+    AC_DEFINE([HAVE_CFLOCALECOPYPREFERREDLANGUAGES], [1],
+      [Define to 1 if you have the Mac OS X function CFLocaleCopyPreferredLanguages in the CoreFoundation framework.])
+  fi
+  INTL_MACOSX_LIBS=
+  if test $gt_cv_func_CFPreferencesCopyAppValue = yes \
+     || test $gt_cv_func_CFLocaleCopyCurrent = yes \
+     || test $gt_cv_func_CFLocaleCopyPreferredLanguages = yes; then
+    INTL_MACOSX_LIBS="-Wl,-framework -Wl,CoreFoundation"
+  fi
+  AC_SUBST([INTL_MACOSX_LIBS])
+])
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-ld.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-ld.m4
new file mode 100644
index 00000000000..a18719630d5
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-ld.m4
@@ -0,0 +1,168 @@
+# lib-ld.m4 serial 9
+dnl Copyright (C) 1996-2003, 2009-2019 Free Software Foundation, Inc.
+dnl This file is free software; the Free Software Foundation
+dnl gives unlimited permission to copy and/or distribute it,
+dnl with or without modifications, as long as this notice is preserved.
+
+dnl Subroutines of libtool.m4,
+dnl with replacements s/_*LT_PATH/AC_LIB_PROG/ and s/lt_/acl_/ to avoid
+dnl collision with libtool.m4.
+
+dnl From libtool-2.4. Sets the variable with_gnu_ld to yes or no.
+AC_DEFUN([AC_LIB_PROG_LD_GNU],
+[AC_CACHE_CHECK([if the linker ($LD) is GNU ld], [acl_cv_prog_gnu_ld],
+[# I'd rather use --version here, but apparently some GNU lds only accept -v.
+case `$LD -v 2>&1 </dev/null` in
+*GNU* | *'with BFD'*)
+  acl_cv_prog_gnu_ld=yes
+  ;;
+*)
+  acl_cv_prog_gnu_ld=no
+  ;;
+esac])
+with_gnu_ld=$acl_cv_prog_gnu_ld
+])
+
+dnl From libtool-2.4. Sets the variable LD.
+AC_DEFUN([AC_LIB_PROG_LD],
+[AC_REQUIRE([AC_PROG_CC])dnl
+AC_REQUIRE([AC_CANONICAL_HOST])dnl
+
+AC_ARG_WITH([gnu-ld],
+    [AS_HELP_STRING([--with-gnu-ld],
+        [assume the C compiler uses GNU ld [default=no]])],
+    [test "$withval" = no || with_gnu_ld=yes],
+    [with_gnu_ld=no])dnl
+
+# Prepare PATH_SEPARATOR.
+# The user is always right.
+if test "${PATH_SEPARATOR+set}" != set; then
+  # Determine PATH_SEPARATOR by trying to find /bin/sh in a PATH which
+  # contains only /bin. Note that ksh looks also at the FPATH variable,
+  # so we have to set that as well for the test.
+  PATH_SEPARATOR=:
+  (PATH='/bin;/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 \
+    && { (PATH='/bin:/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 \
+           || PATH_SEPARATOR=';'
+       }
+fi
+
+if test -n "$LD"; then
+  AC_MSG_CHECKING([for ld])
+elif test "$GCC" = yes; then
+  AC_MSG_CHECKING([for ld used by $CC])
+elif test "$with_gnu_ld" = yes; then
+  AC_MSG_CHECKING([for GNU ld])
+else
+  AC_MSG_CHECKING([for non-GNU ld])
+fi
+if test -n "$LD"; then
+  # Let the user override the test with a path.
+  :
+else
+  AC_CACHE_VAL([acl_cv_path_LD],
+  [
+    acl_cv_path_LD= # Final result of this test
+    ac_prog=ld # Program to search in $PATH
+    if test "$GCC" = yes; then
+      # Check if gcc -print-prog-name=ld gives a path.
+      case $host in
+        *-*-mingw*)
+          # gcc leaves a trailing carriage return which upsets mingw
+          acl_output=`($CC -print-prog-name=ld) 2>&5 | tr -d '\015'` ;;
+        *)
+          acl_output=`($CC -print-prog-name=ld) 2>&5` ;;
+      esac
+      case $acl_output in
+        # Accept absolute paths.
+        [[\\/]]* | ?:[[\\/]]*)
+          re_direlt='/[[^/]][[^/]]*/\.\./'
+          # Canonicalize the pathname of ld
+          acl_output=`echo "$acl_output" | sed 's%\\\\%/%g'`
+          while echo "$acl_output" | grep "$re_direlt" > /dev/null 2>&1; do
+            acl_output=`echo $acl_output | sed "s%$re_direlt%/%"`
+          done
+          # Got the pathname. No search in PATH is needed.
+          acl_cv_path_LD="$acl_output"
+          ac_prog=
+          ;;
+        "")
+          # If it fails, then pretend we aren't using GCC.
+          ;;
+        *)
+          # If it is relative, then search for the first ld in PATH.
+          with_gnu_ld=unknown
+          ;;
+      esac
+    fi
+    if test -n "$ac_prog"; then
+      # Search for $ac_prog in $PATH.
+      acl_save_ifs="$IFS"; IFS=$PATH_SEPARATOR
+      for ac_dir in $PATH; do
+        IFS="$acl_save_ifs"
+        test -z "$ac_dir" && ac_dir=.
+        if test -f "$ac_dir/$ac_prog" || test -f "$ac_dir/$ac_prog$ac_exeext"; then
+          acl_cv_path_LD="$ac_dir/$ac_prog"
+          # Check to see if the program is GNU ld.  I'd rather use --version,
+          # but apparently some variants of GNU ld only accept -v.
+          # Break only if it was the GNU/non-GNU ld that we prefer.
+          case `"$acl_cv_path_LD" -v 2>&1 </dev/null` in
+            *GNU* | *'with BFD'*)
+              test "$with_gnu_ld" != no && break
+              ;;
+            *)
+              test "$with_gnu_ld" != yes && break
+              ;;
+          esac
+        fi
+      done
+      IFS="$acl_save_ifs"
+    fi
+    case $host in
+      *-*-aix*)
+        AC_COMPILE_IFELSE(
+          [AC_LANG_SOURCE(
+             [[#if defined __powerpc64__ || defined _ARCH_PPC64
+                int ok;
+               #else
+                error fail
+               #endif
+             ]])],
+          [# The compiler produces 64-bit code. Add option '-b64' so that the
+           # linker groks 64-bit object files.
+           case "$acl_cv_path_LD " in
+             *" -b64 "*) ;;
+             *) acl_cv_path_LD="$acl_cv_path_LD -b64" ;;
+           esac
+          ], [])
+        ;;
+      sparc64-*-netbsd*)
+        AC_COMPILE_IFELSE(
+          [AC_LANG_SOURCE(
+             [[#if defined __sparcv9 || defined __arch64__
+                int ok;
+               #else
+                error fail
+               #endif
+             ]])],
+          [],
+          [# The compiler produces 32-bit code. Add option '-m elf32_sparc'
+           # so that the linker groks 32-bit object files.
+           case "$acl_cv_path_LD " in
+             *" -m elf32_sparc "*) ;;
+             *) acl_cv_path_LD="$acl_cv_path_LD -m elf32_sparc" ;;
+           esac
+          ])
+        ;;
+    esac
+  ])
+  LD="$acl_cv_path_LD"
+fi
+if test -n "$LD"; then
+  AC_MSG_RESULT([$LD])
+else
+  AC_MSG_RESULT([no])
+  AC_MSG_ERROR([no acceptable ld found in \$PATH])
+fi
+AC_LIB_PROG_LD_GNU
+])
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-link.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-link.m4
new file mode 100644
index 00000000000..0ff10731fac
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-link.m4
@@ -0,0 +1,774 @@
+# lib-link.m4 serial 28
+dnl Copyright (C) 2001-2019 Free Software Foundation, Inc.
+dnl This file is free software; the Free Software Foundation
+dnl gives unlimited permission to copy and/or distribute it,
+dnl with or without modifications, as long as this notice is preserved.
+
+dnl From Bruno Haible.
+
+AC_PREREQ([2.61])
+
+dnl AC_LIB_LINKFLAGS(name [, dependencies]) searches for libname and
+dnl the libraries corresponding to explicit and implicit dependencies.
+dnl Sets and AC_SUBSTs the LIB${NAME} and LTLIB${NAME} variables and
+dnl augments the CPPFLAGS variable.
+dnl Sets and AC_SUBSTs the LIB${NAME}_PREFIX variable to nonempty if libname
+dnl was found in ${LIB${NAME}_PREFIX}/$acl_libdirstem.
+AC_DEFUN([AC_LIB_LINKFLAGS],
+[
+  AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
+  AC_REQUIRE([AC_LIB_RPATH])
+  pushdef([Name],[m4_translit([$1],[./+-], [____])])
+  pushdef([NAME],[m4_translit([$1],[abcdefghijklmnopqrstuvwxyz./+-],
+                                   [ABCDEFGHIJKLMNOPQRSTUVWXYZ____])])
+  AC_CACHE_CHECK([how to link with lib[]$1], [ac_cv_lib[]Name[]_libs], [
+    AC_LIB_LINKFLAGS_BODY([$1], [$2])
+    ac_cv_lib[]Name[]_libs="$LIB[]NAME"
+    ac_cv_lib[]Name[]_ltlibs="$LTLIB[]NAME"
+    ac_cv_lib[]Name[]_cppflags="$INC[]NAME"
+    ac_cv_lib[]Name[]_prefix="$LIB[]NAME[]_PREFIX"
+  ])
+  LIB[]NAME="$ac_cv_lib[]Name[]_libs"
+  LTLIB[]NAME="$ac_cv_lib[]Name[]_ltlibs"
+  INC[]NAME="$ac_cv_lib[]Name[]_cppflags"
+  LIB[]NAME[]_PREFIX="$ac_cv_lib[]Name[]_prefix"
+  AC_LIB_APPENDTOVAR([CPPFLAGS], [$INC]NAME)
+  AC_SUBST([LIB]NAME)
+  AC_SUBST([LTLIB]NAME)
+  AC_SUBST([LIB]NAME[_PREFIX])
+  dnl Also set HAVE_LIB[]NAME so that AC_LIB_HAVE_LINKFLAGS can reuse the
+  dnl results of this search when this library appears as a dependency.
+  HAVE_LIB[]NAME=yes
+  popdef([NAME])
+  popdef([Name])
+])
+
+dnl AC_LIB_HAVE_LINKFLAGS(name, dependencies, includes, testcode, [missing-message])
+dnl searches for libname and the libraries corresponding to explicit and
+dnl implicit dependencies, together with the specified include files and
+dnl the ability to compile and link the specified testcode. The missing-message
+dnl defaults to 'no' and may contain additional hints for the user.
+dnl If found, it sets and AC_SUBSTs HAVE_LIB${NAME}=yes and the LIB${NAME}
+dnl and LTLIB${NAME} variables and augments the CPPFLAGS variable, and
+dnl #defines HAVE_LIB${NAME} to 1. Otherwise, it sets and AC_SUBSTs
+dnl HAVE_LIB${NAME}=no and LIB${NAME} and LTLIB${NAME} to empty.
+dnl Sets and AC_SUBSTs the LIB${NAME}_PREFIX variable to nonempty if libname
+dnl was found in ${LIB${NAME}_PREFIX}/$acl_libdirstem.
+AC_DEFUN([AC_LIB_HAVE_LINKFLAGS],
+[
+  AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
+  AC_REQUIRE([AC_LIB_RPATH])
+  pushdef([Name],[m4_translit([$1],[./+-], [____])])
+  pushdef([NAME],[m4_translit([$1],[abcdefghijklmnopqrstuvwxyz./+-],
+                                   [ABCDEFGHIJKLMNOPQRSTUVWXYZ____])])
+
+  dnl Search for lib[]Name and define LIB[]NAME, LTLIB[]NAME and INC[]NAME
+  dnl accordingly.
+  AC_LIB_LINKFLAGS_BODY([$1], [$2])
+
+  dnl Add $INC[]NAME to CPPFLAGS before performing the following checks,
+  dnl because if the user has installed lib[]Name and not disabled its use
+  dnl via --without-lib[]Name-prefix, he wants to use it.
+  ac_save_CPPFLAGS="$CPPFLAGS"
+  AC_LIB_APPENDTOVAR([CPPFLAGS], [$INC]NAME)
+
+  AC_CACHE_CHECK([for lib[]$1], [ac_cv_lib[]Name], [
+    ac_save_LIBS="$LIBS"
+    dnl If $LIB[]NAME contains some -l options, add it to the end of LIBS,
+    dnl because these -l options might require -L options that are present in
+    dnl LIBS. -l options benefit only from the -L options listed before it.
+    dnl Otherwise, add it to the front of LIBS, because it may be a static
+    dnl library that depends on another static library that is present in LIBS.
+    dnl Static libraries benefit only from the static libraries listed after
+    dnl it.
+    case " $LIB[]NAME" in
+      *" -l"*) LIBS="$LIBS $LIB[]NAME" ;;
+      *)       LIBS="$LIB[]NAME $LIBS" ;;
+    esac
+    AC_LINK_IFELSE(
+      [AC_LANG_PROGRAM([[$3]], [[$4]])],
+      [ac_cv_lib[]Name=yes],
+      [ac_cv_lib[]Name='m4_if([$5], [], [no], [[$5]])'])
+    LIBS="$ac_save_LIBS"
+  ])
+  if test "$ac_cv_lib[]Name" = yes; then
+    HAVE_LIB[]NAME=yes
+    AC_DEFINE([HAVE_LIB]NAME, 1, [Define if you have the lib][$1 library.])
+    AC_MSG_CHECKING([how to link with lib[]$1])
+    AC_MSG_RESULT([$LIB[]NAME])
+  else
+    HAVE_LIB[]NAME=no
+    dnl If $LIB[]NAME didn't lead to a usable library, we don't need
+    dnl $INC[]NAME either.
+    CPPFLAGS="$ac_save_CPPFLAGS"
+    LIB[]NAME=
+    LTLIB[]NAME=
+    LIB[]NAME[]_PREFIX=
+  fi
+  AC_SUBST([HAVE_LIB]NAME)
+  AC_SUBST([LIB]NAME)
+  AC_SUBST([LTLIB]NAME)
+  AC_SUBST([LIB]NAME[_PREFIX])
+  popdef([NAME])
+  popdef([Name])
+])
+
+dnl Determine the platform dependent parameters needed to use rpath:
+dnl   acl_libext,
+dnl   acl_shlibext,
+dnl   acl_libname_spec,
+dnl   acl_library_names_spec,
+dnl   acl_hardcode_libdir_flag_spec,
+dnl   acl_hardcode_libdir_separator,
+dnl   acl_hardcode_direct,
+dnl   acl_hardcode_minus_L.
+AC_DEFUN([AC_LIB_RPATH],
+[
+  dnl Complain if config.rpath is missing.
+  AC_REQUIRE_AUX_FILE([config.rpath])
+  AC_REQUIRE([AC_PROG_CC])                dnl we use $CC, $GCC, $LDFLAGS
+  AC_REQUIRE([AC_LIB_PROG_LD])            dnl we use $LD, $with_gnu_ld
+  AC_REQUIRE([AC_CANONICAL_HOST])         dnl we use $host
+  AC_REQUIRE([AC_CONFIG_AUX_DIR_DEFAULT]) dnl we use $ac_aux_dir
+  AC_CACHE_CHECK([for shared library run path origin], [acl_cv_rpath], [
+    CC="$CC" GCC="$GCC" LDFLAGS="$LDFLAGS" LD="$LD" with_gnu_ld="$with_gnu_ld" \
+    ${CONFIG_SHELL-/bin/sh} "$ac_aux_dir/config.rpath" "$host" > conftest.sh
+    . ./conftest.sh
+    rm -f ./conftest.sh
+    acl_cv_rpath=done
+  ])
+  wl="$acl_cv_wl"
+  acl_libext="$acl_cv_libext"
+  acl_shlibext="$acl_cv_shlibext"
+  acl_libname_spec="$acl_cv_libname_spec"
+  acl_library_names_spec="$acl_cv_library_names_spec"
+  acl_hardcode_libdir_flag_spec="$acl_cv_hardcode_libdir_flag_spec"
+  acl_hardcode_libdir_separator="$acl_cv_hardcode_libdir_separator"
+  acl_hardcode_direct="$acl_cv_hardcode_direct"
+  acl_hardcode_minus_L="$acl_cv_hardcode_minus_L"
+  dnl Determine whether the user wants rpath handling at all.
+  AC_ARG_ENABLE([rpath],
+    [  --disable-rpath         do not hardcode runtime library paths],
+    :, enable_rpath=yes)
+])
+
+dnl AC_LIB_FROMPACKAGE(name, package)
+dnl declares that libname comes from the given package. The configure file
+dnl will then not have a --with-libname-prefix option but a
+dnl --with-package-prefix option. Several libraries can come from the same
+dnl package. This declaration must occur before an AC_LIB_LINKFLAGS or similar
+dnl macro call that searches for libname.
+AC_DEFUN([AC_LIB_FROMPACKAGE],
+[
+  pushdef([NAME],[m4_translit([$1],[abcdefghijklmnopqrstuvwxyz./+-],
+                                   [ABCDEFGHIJKLMNOPQRSTUVWXYZ____])])
+  define([acl_frompackage_]NAME, [$2])
+  popdef([NAME])
+  pushdef([PACK],[$2])
+  pushdef([PACKUP],[m4_translit(PACK,[abcdefghijklmnopqrstuvwxyz./+-],
+                                     [ABCDEFGHIJKLMNOPQRSTUVWXYZ____])])
+  define([acl_libsinpackage_]PACKUP,
+    m4_ifdef([acl_libsinpackage_]PACKUP, [m4_defn([acl_libsinpackage_]PACKUP)[, ]],)[lib$1])
+  popdef([PACKUP])
+  popdef([PACK])
+])
+
+dnl AC_LIB_LINKFLAGS_BODY(name [, dependencies]) searches for libname and
+dnl the libraries corresponding to explicit and implicit dependencies.
+dnl Sets the LIB${NAME}, LTLIB${NAME} and INC${NAME} variables.
+dnl Also, sets the LIB${NAME}_PREFIX variable to nonempty if libname was found
+dnl in ${LIB${NAME}_PREFIX}/$acl_libdirstem.
+AC_DEFUN([AC_LIB_LINKFLAGS_BODY],
+[
+  AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])
+  pushdef([NAME],[m4_translit([$1],[abcdefghijklmnopqrstuvwxyz./+-],
+                                   [ABCDEFGHIJKLMNOPQRSTUVWXYZ____])])
+  pushdef([PACK],[m4_ifdef([acl_frompackage_]NAME, [acl_frompackage_]NAME, lib[$1])])
+  pushdef([PACKUP],[m4_translit(PACK,[abcdefghijklmnopqrstuvwxyz./+-],
+                                     [ABCDEFGHIJKLMNOPQRSTUVWXYZ____])])
+  pushdef([PACKLIBS],[m4_ifdef([acl_frompackage_]NAME, [acl_libsinpackage_]PACKUP, lib[$1])])
+  dnl By default, look in $includedir and $libdir.
+  use_additional=yes
+  AC_LIB_WITH_FINAL_PREFIX([
+    eval additional_includedir=\"$includedir\"
+    eval additional_libdir=\"$libdir\"
+  ])
+  AC_ARG_WITH(PACK[-prefix],
+[[  --with-]]PACK[[-prefix[=DIR]  search for ]PACKLIBS[ in DIR/include and DIR/lib
+  --without-]]PACK[[-prefix     don't search for ]PACKLIBS[ in includedir and libdir]],
+[
+    if test "X$withval" = "Xno"; then
+      use_additional=no
+    else
+      if test "X$withval" = "X"; then
+        AC_LIB_WITH_FINAL_PREFIX([
+          eval additional_includedir=\"$includedir\"
+          eval additional_libdir=\"$libdir\"
+        ])
+      else
+        additional_includedir="$withval/include"
+        additional_libdir="$withval/$acl_libdirstem"
+        if test "$acl_libdirstem2" != "$acl_libdirstem" \
+           && test ! -d "$withval/$acl_libdirstem"; then
+          additional_libdir="$withval/$acl_libdirstem2"
+        fi
+      fi
+    fi
+])
+  dnl Search the library and its dependencies in $additional_libdir and
+  dnl $LDFLAGS. Using breadth-first-seach.
+  LIB[]NAME=
+  LTLIB[]NAME=
+  INC[]NAME=
+  LIB[]NAME[]_PREFIX=
+  dnl HAVE_LIB${NAME} is an indicator that LIB${NAME}, LTLIB${NAME} have been
+  dnl computed. So it has to be reset here.
+  HAVE_LIB[]NAME=
+  rpathdirs=
+  ltrpathdirs=
+  names_already_handled=
+  names_next_round='$1 $2'
+  while test -n "$names_next_round"; do
+    names_this_round="$names_next_round"
+    names_next_round=
+    for name in $names_this_round; do
+      already_handled=
+      for n in $names_already_handled; do
+        if test "$n" = "$name"; then
+          already_handled=yes
+          break
+        fi
+      done
+      if test -z "$already_handled"; then
+        names_already_handled="$names_already_handled $name"
+        dnl See if it was already located by an earlier AC_LIB_LINKFLAGS
+        dnl or AC_LIB_HAVE_LINKFLAGS call.
+        uppername=`echo "$name" | sed -e 'y|abcdefghijklmnopqrstuvwxyz./+-|ABCDEFGHIJKLMNOPQRSTUVWXYZ____|'`
+        eval value=\"\$HAVE_LIB$uppername\"
+        if test -n "$value"; then
+          if test "$value" = yes; then
+            eval value=\"\$LIB$uppername\"
+            test -z "$value" || LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$value"
+            eval value=\"\$LTLIB$uppername\"
+            test -z "$value" || LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+ }$value"
+          else
+            dnl An earlier call to AC_LIB_HAVE_LINKFLAGS has determined
+            dnl that this library doesn't exist. So just drop it.
+            :
+          fi
+        else
+          dnl Search the library lib$name in $additional_libdir and $LDFLAGS
+          dnl and the already constructed $LIBNAME/$LTLIBNAME.
+          found_dir=
+          found_la=
+          found_so=
+          found_a=
+          eval libname=\"$acl_libname_spec\"    # typically: libname=lib$name
+          if test -n "$acl_shlibext"; then
+            shrext=".$acl_shlibext"             # typically: shrext=.so
+          else
+            shrext=
+          fi
+          if test $use_additional = yes; then
+            dir="$additional_libdir"
+            dnl The same code as in the loop below:
+            dnl First look for a shared library.
+            if test -n "$acl_shlibext"; then
+              if test -f "$dir/$libname$shrext"; then
+                found_dir="$dir"
+                found_so="$dir/$libname$shrext"
+              else
+                if test "$acl_library_names_spec" = '$libname$shrext$versuffix'; then
+                  ver=`(cd "$dir" && \
+                        for f in "$libname$shrext".*; do echo "$f"; done \
+                        | sed -e "s,^$libname$shrext\\\\.,," \
+                        | sort -t '.' -n -r -k1,1 -k2,2 -k3,3 -k4,4 -k5,5 \
+                        | sed 1q ) 2>/dev/null`
+                  if test -n "$ver" && test -f "$dir/$libname$shrext.$ver"; then
+                    found_dir="$dir"
+                    found_so="$dir/$libname$shrext.$ver"
+                  fi
+                else
+                  eval library_names=\"$acl_library_names_spec\"
+                  for f in $library_names; do
+                    if test -f "$dir/$f"; then
+                      found_dir="$dir"
+                      found_so="$dir/$f"
+                      break
+                    fi
+                  done
+                fi
+              fi
+            fi
+            dnl Then look for a static library.
+            if test "X$found_dir" = "X"; then
+              if test -f "$dir/$libname.$acl_libext"; then
+                found_dir="$dir"
+                found_a="$dir/$libname.$acl_libext"
+              fi
+            fi
+            if test "X$found_dir" != "X"; then
+              if test -f "$dir/$libname.la"; then
+                found_la="$dir/$libname.la"
+              fi
+            fi
+          fi
+          if test "X$found_dir" = "X"; then
+            for x in $LDFLAGS $LTLIB[]NAME; do
+              AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
+              case "$x" in
+                -L*)
+                  dir=`echo "X$x" | sed -e 's/^X-L//'`
+                  dnl First look for a shared library.
+                  if test -n "$acl_shlibext"; then
+                    if test -f "$dir/$libname$shrext"; then
+                      found_dir="$dir"
+                      found_so="$dir/$libname$shrext"
+                    else
+                      if test "$acl_library_names_spec" = '$libname$shrext$versuffix'; then
+                        ver=`(cd "$dir" && \
+                              for f in "$libname$shrext".*; do echo "$f"; done \
+                              | sed -e "s,^$libname$shrext\\\\.,," \
+                              | sort -t '.' -n -r -k1,1 -k2,2 -k3,3 -k4,4 -k5,5 \
+                              | sed 1q ) 2>/dev/null`
+                        if test -n "$ver" && test -f "$dir/$libname$shrext.$ver"; then
+                          found_dir="$dir"
+                          found_so="$dir/$libname$shrext.$ver"
+                        fi
+                      else
+                        eval library_names=\"$acl_library_names_spec\"
+                        for f in $library_names; do
+                          if test -f "$dir/$f"; then
+                            found_dir="$dir"
+                            found_so="$dir/$f"
+                            break
+                          fi
+                        done
+                      fi
+                    fi
+                  fi
+                  dnl Then look for a static library.
+                  if test "X$found_dir" = "X"; then
+                    if test -f "$dir/$libname.$acl_libext"; then
+                      found_dir="$dir"
+                      found_a="$dir/$libname.$acl_libext"
+                    fi
+                  fi
+                  if test "X$found_dir" != "X"; then
+                    if test -f "$dir/$libname.la"; then
+                      found_la="$dir/$libname.la"
+                    fi
+                  fi
+                  ;;
+              esac
+              if test "X$found_dir" != "X"; then
+                break
+              fi
+            done
+          fi
+          if test "X$found_dir" != "X"; then
+            dnl Found the library.
+            LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+ }-L$found_dir -l$name"
+            if test "X$found_so" != "X"; then
+              dnl Linking with a shared library. We attempt to hardcode its
+              dnl directory into the executable's runpath, unless it's the
+              dnl standard /usr/lib.
+              if test "$enable_rpath" = no \
+                 || test "X$found_dir" = "X/usr/$acl_libdirstem" \
+                 || test "X$found_dir" = "X/usr/$acl_libdirstem2"; then
+                dnl No hardcoding is needed.
+                LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
+              else
+                dnl Use an explicit option to hardcode DIR into the resulting
+                dnl binary.
+                dnl Potentially add DIR to ltrpathdirs.
+                dnl The ltrpathdirs will be appended to $LTLIBNAME at the end.
+                haveit=
+                for x in $ltrpathdirs; do
+                  if test "X$x" = "X$found_dir"; then
+                    haveit=yes
+                    break
+                  fi
+                done
+                if test -z "$haveit"; then
+                  ltrpathdirs="$ltrpathdirs $found_dir"
+                fi
+                dnl The hardcoding into $LIBNAME is system dependent.
+                if test "$acl_hardcode_direct" = yes; then
+                  dnl Using DIR/libNAME.so during linking hardcodes DIR into the
+                  dnl resulting binary.
+                  LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
+                else
+                  if test -n "$acl_hardcode_libdir_flag_spec" && test "$acl_hardcode_minus_L" = no; then
+                    dnl Use an explicit option to hardcode DIR into the resulting
+                    dnl binary.
+                    LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
+                    dnl Potentially add DIR to rpathdirs.
+                    dnl The rpathdirs will be appended to $LIBNAME at the end.
+                    haveit=
+                    for x in $rpathdirs; do
+                      if test "X$x" = "X$found_dir"; then
+                        haveit=yes
+                        break
+                      fi
+                    done
+                    if test -z "$haveit"; then
+                      rpathdirs="$rpathdirs $found_dir"
+                    fi
+                  else
+                    dnl Rely on "-L$found_dir".
+                    dnl But don't add it if it's already contained in the LDFLAGS
+                    dnl or the already constructed $LIBNAME
+                    haveit=
+                    for x in $LDFLAGS $LIB[]NAME; do
+                      AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
+                      if test "X$x" = "X-L$found_dir"; then
+                        haveit=yes
+                        break
+                      fi
+                    done
+                    if test -z "$haveit"; then
+                      LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }-L$found_dir"
+                    fi
+                    if test "$acl_hardcode_minus_L" != no; then
+                      dnl FIXME: Not sure whether we should use
+                      dnl "-L$found_dir -l$name" or "-L$found_dir $found_so"
+                      dnl here.
+                      LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_so"
+                    else
+                      dnl We cannot use $acl_hardcode_runpath_var and LD_RUN_PATH
+                      dnl here, because this doesn't fit in flags passed to the
+                      dnl compiler. So give up. No hardcoding. This affects only
+                      dnl very old systems.
+                      dnl FIXME: Not sure whether we should use
+                      dnl "-L$found_dir -l$name" or "-L$found_dir $found_so"
+                      dnl here.
+                      LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }-l$name"
+                    fi
+                  fi
+                fi
+              fi
+            else
+              if test "X$found_a" != "X"; then
+                dnl Linking with a static library.
+                LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$found_a"
+              else
+                dnl We shouldn't come here, but anyway it's good to have a
+                dnl fallback.
+                LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }-L$found_dir -l$name"
+              fi
+            fi
+            dnl Assume the include files are nearby.
+            additional_includedir=
+            case "$found_dir" in
+              */$acl_libdirstem | */$acl_libdirstem/)
+                basedir=`echo "X$found_dir" | sed -e 's,^X,,' -e "s,/$acl_libdirstem/"'*$,,'`
+                if test "$name" = '$1'; then
+                  LIB[]NAME[]_PREFIX="$basedir"
+                fi
+                additional_includedir="$basedir/include"
+                ;;
+              */$acl_libdirstem2 | */$acl_libdirstem2/)
+                basedir=`echo "X$found_dir" | sed -e 's,^X,,' -e "s,/$acl_libdirstem2/"'*$,,'`
+                if test "$name" = '$1'; then
+                  LIB[]NAME[]_PREFIX="$basedir"
+                fi
+                additional_includedir="$basedir/include"
+                ;;
+            esac
+            if test "X$additional_includedir" != "X"; then
+              dnl Potentially add $additional_includedir to $INCNAME.
+              dnl But don't add it
+              dnl   1. if it's the standard /usr/include,
+              dnl   2. if it's /usr/local/include and we are using GCC on Linux,
+              dnl   3. if it's already present in $CPPFLAGS or the already
+              dnl      constructed $INCNAME,
+              dnl   4. if it doesn't exist as a directory.
+              if test "X$additional_includedir" != "X/usr/include"; then
+                haveit=
+                if test "X$additional_includedir" = "X/usr/local/include"; then
+                  if test -n "$GCC"; then
+                    case $host_os in
+                      linux* | gnu* | k*bsd*-gnu) haveit=yes;;
+                    esac
+                  fi
+                fi
+                if test -z "$haveit"; then
+                  for x in $CPPFLAGS $INC[]NAME; do
+                    AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
+                    if test "X$x" = "X-I$additional_includedir"; then
+                      haveit=yes
+                      break
+                    fi
+                  done
+                  if test -z "$haveit"; then
+                    if test -d "$additional_includedir"; then
+                      dnl Really add $additional_includedir to $INCNAME.
+                      INC[]NAME="${INC[]NAME}${INC[]NAME:+ }-I$additional_includedir"
+                    fi
+                  fi
+                fi
+              fi
+            fi
+            dnl Look for dependencies.
+            if test -n "$found_la"; then
+              dnl Read the .la file. It defines the variables
+              dnl dlname, library_names, old_library, dependency_libs, current,
+              dnl age, revision, installed, dlopen, dlpreopen, libdir.
+              save_libdir="$libdir"
+              case "$found_la" in
+                */* | *\\*) . "$found_la" ;;
+                *) . "./$found_la" ;;
+              esac
+              libdir="$save_libdir"
+              dnl We use only dependency_libs.
+              for dep in $dependency_libs; do
+                case "$dep" in
+                  -L*)
+                    additional_libdir=`echo "X$dep" | sed -e 's/^X-L//'`
+                    dnl Potentially add $additional_libdir to $LIBNAME and $LTLIBNAME.
+                    dnl But don't add it
+                    dnl   1. if it's the standard /usr/lib,
+                    dnl   2. if it's /usr/local/lib and we are using GCC on Linux,
+                    dnl   3. if it's already present in $LDFLAGS or the already
+                    dnl      constructed $LIBNAME,
+                    dnl   4. if it doesn't exist as a directory.
+                    if test "X$additional_libdir" != "X/usr/$acl_libdirstem" \
+                       && test "X$additional_libdir" != "X/usr/$acl_libdirstem2"; then
+                      haveit=
+                      if test "X$additional_libdir" = "X/usr/local/$acl_libdirstem" \
+                         || test "X$additional_libdir" = "X/usr/local/$acl_libdirstem2"; then
+                        if test -n "$GCC"; then
+                          case $host_os in
+                            linux* | gnu* | k*bsd*-gnu) haveit=yes;;
+                          esac
+                        fi
+                      fi
+                      if test -z "$haveit"; then
+                        haveit=
+                        for x in $LDFLAGS $LIB[]NAME; do
+                          AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
+                          if test "X$x" = "X-L$additional_libdir"; then
+                            haveit=yes
+                            break
+                          fi
+                        done
+                        if test -z "$haveit"; then
+                          if test -d "$additional_libdir"; then
+                            dnl Really add $additional_libdir to $LIBNAME.
+                            LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }-L$additional_libdir"
+                          fi
+                        fi
+                        haveit=
+                        for x in $LDFLAGS $LTLIB[]NAME; do
+                          AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
+                          if test "X$x" = "X-L$additional_libdir"; then
+                            haveit=yes
+                            break
+                          fi
+                        done
+                        if test -z "$haveit"; then
+                          if test -d "$additional_libdir"; then
+                            dnl Really add $additional_libdir to $LTLIBNAME.
+                            LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+ }-L$additional_libdir"
+                          fi
+                        fi
+                      fi
+                    fi
+                    ;;
+                  -R*)
+                    dir=`echo "X$dep" | sed -e 's/^X-R//'`
+                    if test "$enable_rpath" != no; then
+                      dnl Potentially add DIR to rpathdirs.
+                      dnl The rpathdirs will be appended to $LIBNAME at the end.
+                      haveit=
+                      for x in $rpathdirs; do
+                        if test "X$x" = "X$dir"; then
+                          haveit=yes
+                          break
+                        fi
+                      done
+                      if test -z "$haveit"; then
+                        rpathdirs="$rpathdirs $dir"
+                      fi
+                      dnl Potentially add DIR to ltrpathdirs.
+                      dnl The ltrpathdirs will be appended to $LTLIBNAME at the end.
+                      haveit=
+                      for x in $ltrpathdirs; do
+                        if test "X$x" = "X$dir"; then
+                          haveit=yes
+                          break
+                        fi
+                      done
+                      if test -z "$haveit"; then
+                        ltrpathdirs="$ltrpathdirs $dir"
+                      fi
+                    fi
+                    ;;
+                  -l*)
+                    dnl Handle this in the next round.
+                    names_next_round="$names_next_round "`echo "X$dep" | sed -e 's/^X-l//'`
+                    ;;
+                  *.la)
+                    dnl Handle this in the next round. Throw away the .la's
+                    dnl directory; it is already contained in a preceding -L
+                    dnl option.
+                    names_next_round="$names_next_round "`echo "X$dep" | sed -e 's,^X.*/,,' -e 's,^lib,,' -e 's,\.la$,,'`
+                    ;;
+                  *)
+                    dnl Most likely an immediate library name.
+                    LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$dep"
+                    LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+ }$dep"
+                    ;;
+                esac
+              done
+            fi
+          else
+            dnl Didn't find the library; assume it is in the system directories
+            dnl known to the linker and runtime loader. (All the system
+            dnl directories known to the linker should also be known to the
+            dnl runtime loader, otherwise the system is severely misconfigured.)
+            LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }-l$name"
+            LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+ }-l$name"
+          fi
+        fi
+      fi
+    done
+  done
+  if test "X$rpathdirs" != "X"; then
+    if test -n "$acl_hardcode_libdir_separator"; then
+      dnl Weird platform: only the last -rpath option counts, the user must
+      dnl pass all path elements in one option. We can arrange that for a
+      dnl single library, but not when more than one $LIBNAMEs are used.
+      alldirs=
+      for found_dir in $rpathdirs; do
+        alldirs="${alldirs}${alldirs:+$acl_hardcode_libdir_separator}$found_dir"
+      done
+      dnl Note: acl_hardcode_libdir_flag_spec uses $libdir and $wl.
+      acl_save_libdir="$libdir"
+      libdir="$alldirs"
+      eval flag=\"$acl_hardcode_libdir_flag_spec\"
+      libdir="$acl_save_libdir"
+      LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$flag"
+    else
+      dnl The -rpath options are cumulative.
+      for found_dir in $rpathdirs; do
+        acl_save_libdir="$libdir"
+        libdir="$found_dir"
+        eval flag=\"$acl_hardcode_libdir_flag_spec\"
+        libdir="$acl_save_libdir"
+        LIB[]NAME="${LIB[]NAME}${LIB[]NAME:+ }$flag"
+      done
+    fi
+  fi
+  if test "X$ltrpathdirs" != "X"; then
+    dnl When using libtool, the option that works for both libraries and
+    dnl executables is -R. The -R options are cumulative.
+    for found_dir in $ltrpathdirs; do
+      LTLIB[]NAME="${LTLIB[]NAME}${LTLIB[]NAME:+ }-R$found_dir"
+    done
+  fi
+  popdef([PACKLIBS])
+  popdef([PACKUP])
+  popdef([PACK])
+  popdef([NAME])
+])
+
+dnl AC_LIB_APPENDTOVAR(VAR, CONTENTS) appends the elements of CONTENTS to VAR,
+dnl unless already present in VAR.
+dnl Works only for CPPFLAGS, not for LIB* variables because that sometimes
+dnl contains two or three consecutive elements that belong together.
+AC_DEFUN([AC_LIB_APPENDTOVAR],
+[
+  for element in [$2]; do
+    haveit=
+    for x in $[$1]; do
+      AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
+      if test "X$x" = "X$element"; then
+        haveit=yes
+        break
+      fi
+    done
+    if test -z "$haveit"; then
+      [$1]="${[$1]}${[$1]:+ }$element"
+    fi
+  done
+])
+
+dnl For those cases where a variable contains several -L and -l options
+dnl referring to unknown libraries and directories, this macro determines the
+dnl necessary additional linker options for the runtime path.
+dnl AC_LIB_LINKFLAGS_FROM_LIBS([LDADDVAR], [LIBSVALUE], [USE-LIBTOOL])
+dnl sets LDADDVAR to linker options needed together with LIBSVALUE.
+dnl If USE-LIBTOOL evaluates to non-empty, linking with libtool is assumed,
+dnl otherwise linking without libtool is assumed.
+AC_DEFUN([AC_LIB_LINKFLAGS_FROM_LIBS],
+[
+  AC_REQUIRE([AC_LIB_RPATH])
+  AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])
+  $1=
+  if test "$enable_rpath" != no; then
+    if test -n "$acl_hardcode_libdir_flag_spec" && test "$acl_hardcode_minus_L" = no; then
+      dnl Use an explicit option to hardcode directories into the resulting
+      dnl binary.
+      rpathdirs=
+      next=
+      for opt in $2; do
+        if test -n "$next"; then
+          dir="$next"
+          dnl No need to hardcode the standard /usr/lib.
+          if test "X$dir" != "X/usr/$acl_libdirstem" \
+             && test "X$dir" != "X/usr/$acl_libdirstem2"; then
+            rpathdirs="$rpathdirs $dir"
+          fi
+          next=
+        else
+          case $opt in
+            -L) next=yes ;;
+            -L*) dir=`echo "X$opt" | sed -e 's,^X-L,,'`
+                 dnl No need to hardcode the standard /usr/lib.
+                 if test "X$dir" != "X/usr/$acl_libdirstem" \
+                    && test "X$dir" != "X/usr/$acl_libdirstem2"; then
+                   rpathdirs="$rpathdirs $dir"
+                 fi
+                 next= ;;
+            *) next= ;;
+          esac
+        fi
+      done
+      if test "X$rpathdirs" != "X"; then
+        if test -n ""$3""; then
+          dnl libtool is used for linking. Use -R options.
+          for dir in $rpathdirs; do
+            $1="${$1}${$1:+ }-R$dir"
+          done
+        else
+          dnl The linker is used for linking directly.
+          if test -n "$acl_hardcode_libdir_separator"; then
+            dnl Weird platform: only the last -rpath option counts, the user
+            dnl must pass all path elements in one option.
+            alldirs=
+            for dir in $rpathdirs; do
+              alldirs="${alldirs}${alldirs:+$acl_hardcode_libdir_separator}$dir"
+            done
+            acl_save_libdir="$libdir"
+            libdir="$alldirs"
+            eval flag=\"$acl_hardcode_libdir_flag_spec\"
+            libdir="$acl_save_libdir"
+            $1="$flag"
+          else
+            dnl The -rpath options are cumulative.
+            for dir in $rpathdirs; do
+              acl_save_libdir="$libdir"
+              libdir="$dir"
+              eval flag=\"$acl_hardcode_libdir_flag_spec\"
+              libdir="$acl_save_libdir"
+              $1="${$1}${$1:+ }$flag"
+            done
+          fi
+        fi
+      fi
+    fi
+  fi
+  AC_SUBST([$1])
+])
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-prefix.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-prefix.m4
new file mode 100644
index 00000000000..8adb17bb916
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/lib-prefix.m4
@@ -0,0 +1,249 @@
+# lib-prefix.m4 serial 14
+dnl Copyright (C) 2001-2005, 2008-2019 Free Software Foundation, Inc.
+dnl This file is free software; the Free Software Foundation
+dnl gives unlimited permission to copy and/or distribute it,
+dnl with or without modifications, as long as this notice is preserved.
+
+dnl From Bruno Haible.
+
+dnl AC_LIB_PREFIX adds to the CPPFLAGS and LDFLAGS the flags that are needed
+dnl to access previously installed libraries. The basic assumption is that
+dnl a user will want packages to use other packages he previously installed
+dnl with the same --prefix option.
+dnl This macro is not needed if only AC_LIB_LINKFLAGS is used to locate
+dnl libraries, but is otherwise very convenient.
+AC_DEFUN([AC_LIB_PREFIX],
+[
+  AC_BEFORE([$0], [AC_LIB_LINKFLAGS])
+  AC_REQUIRE([AC_PROG_CC])
+  AC_REQUIRE([AC_CANONICAL_HOST])
+  AC_REQUIRE([AC_LIB_PREPARE_MULTILIB])
+  AC_REQUIRE([AC_LIB_PREPARE_PREFIX])
+  dnl By default, look in $includedir and $libdir.
+  use_additional=yes
+  AC_LIB_WITH_FINAL_PREFIX([
+    eval additional_includedir=\"$includedir\"
+    eval additional_libdir=\"$libdir\"
+  ])
+  AC_ARG_WITH([lib-prefix],
+[[  --with-lib-prefix[=DIR] search for libraries in DIR/include and DIR/lib
+  --without-lib-prefix    don't search for libraries in includedir and libdir]],
+[
+    if test "X$withval" = "Xno"; then
+      use_additional=no
+    else
+      if test "X$withval" = "X"; then
+        AC_LIB_WITH_FINAL_PREFIX([
+          eval additional_includedir=\"$includedir\"
+          eval additional_libdir=\"$libdir\"
+        ])
+      else
+        additional_includedir="$withval/include"
+        additional_libdir="$withval/$acl_libdirstem"
+      fi
+    fi
+])
+  if test $use_additional = yes; then
+    dnl Potentially add $additional_includedir to $CPPFLAGS.
+    dnl But don't add it
+    dnl   1. if it's the standard /usr/include,
+    dnl   2. if it's already present in $CPPFLAGS,
+    dnl   3. if it's /usr/local/include and we are using GCC on Linux,
+    dnl   4. if it doesn't exist as a directory.
+    if test "X$additional_includedir" != "X/usr/include"; then
+      haveit=
+      for x in $CPPFLAGS; do
+        AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
+        if test "X$x" = "X-I$additional_includedir"; then
+          haveit=yes
+          break
+        fi
+      done
+      if test -z "$haveit"; then
+        if test "X$additional_includedir" = "X/usr/local/include"; then
+          if test -n "$GCC"; then
+            case $host_os in
+              linux* | gnu* | k*bsd*-gnu) haveit=yes;;
+            esac
+          fi
+        fi
+        if test -z "$haveit"; then
+          if test -d "$additional_includedir"; then
+            dnl Really add $additional_includedir to $CPPFLAGS.
+            CPPFLAGS="${CPPFLAGS}${CPPFLAGS:+ }-I$additional_includedir"
+          fi
+        fi
+      fi
+    fi
+    dnl Potentially add $additional_libdir to $LDFLAGS.
+    dnl But don't add it
+    dnl   1. if it's the standard /usr/lib,
+    dnl   2. if it's already present in $LDFLAGS,
+    dnl   3. if it's /usr/local/lib and we are using GCC on Linux,
+    dnl   4. if it doesn't exist as a directory.
+    if test "X$additional_libdir" != "X/usr/$acl_libdirstem"; then
+      haveit=
+      for x in $LDFLAGS; do
+        AC_LIB_WITH_FINAL_PREFIX([eval x=\"$x\"])
+        if test "X$x" = "X-L$additional_libdir"; then
+          haveit=yes
+          break
+        fi
+      done
+      if test -z "$haveit"; then
+        if test "X$additional_libdir" = "X/usr/local/$acl_libdirstem"; then
+          if test -n "$GCC"; then
+            case $host_os in
+              linux*) haveit=yes;;
+            esac
+          fi
+        fi
+        if test -z "$haveit"; then
+          if test -d "$additional_libdir"; then
+            dnl Really add $additional_libdir to $LDFLAGS.
+            LDFLAGS="${LDFLAGS}${LDFLAGS:+ }-L$additional_libdir"
+          fi
+        fi
+      fi
+    fi
+  fi
+])
+
+dnl AC_LIB_PREPARE_PREFIX creates variables acl_final_prefix,
+dnl acl_final_exec_prefix, containing the values to which $prefix and
+dnl $exec_prefix will expand at the end of the configure script.
+AC_DEFUN([AC_LIB_PREPARE_PREFIX],
+[
+  dnl Unfortunately, prefix and exec_prefix get only finally determined
+  dnl at the end of configure.
+  if test "X$prefix" = "XNONE"; then
+    acl_final_prefix="$ac_default_prefix"
+  else
+    acl_final_prefix="$prefix"
+  fi
+  if test "X$exec_prefix" = "XNONE"; then
+    acl_final_exec_prefix='${prefix}'
+  else
+    acl_final_exec_prefix="$exec_prefix"
+  fi
+  acl_save_prefix="$prefix"
+  prefix="$acl_final_prefix"
+  eval acl_final_exec_prefix=\"$acl_final_exec_prefix\"
+  prefix="$acl_save_prefix"
+])
+
+dnl AC_LIB_WITH_FINAL_PREFIX([statement]) evaluates statement, with the
+dnl variables prefix and exec_prefix bound to the values they will have
+dnl at the end of the configure script.
+AC_DEFUN([AC_LIB_WITH_FINAL_PREFIX],
+[
+  acl_save_prefix="$prefix"
+  prefix="$acl_final_prefix"
+  acl_save_exec_prefix="$exec_prefix"
+  exec_prefix="$acl_final_exec_prefix"
+  $1
+  exec_prefix="$acl_save_exec_prefix"
+  prefix="$acl_save_prefix"
+])
+
+dnl AC_LIB_PREPARE_MULTILIB creates
+dnl - a variable acl_libdirstem, containing the basename of the libdir, either
+dnl   "lib" or "lib64" or "lib/64",
+dnl - a variable acl_libdirstem2, as a secondary possible value for
+dnl   acl_libdirstem, either the same as acl_libdirstem or "lib/sparcv9" or
+dnl   "lib/amd64".
+AC_DEFUN([AC_LIB_PREPARE_MULTILIB],
+[
+  dnl There is no formal standard regarding lib and lib64.
+  dnl On glibc systems, the current practice is that on a system supporting
+  dnl 32-bit and 64-bit instruction sets or ABIs, 64-bit libraries go under
+  dnl $prefix/lib64 and 32-bit libraries go under $prefix/lib. We determine
+  dnl the compiler's default mode by looking at the compiler's library search
+  dnl path. If at least one of its elements ends in /lib64 or points to a
+  dnl directory whose absolute pathname ends in /lib64, we assume a 64-bit ABI.
+  dnl Otherwise we use the default, namely "lib".
+  dnl On Solaris systems, the current practice is that on a system supporting
+  dnl 32-bit and 64-bit instruction sets or ABIs, 64-bit libraries go under
+  dnl $prefix/lib/64 (which is a symlink to either $prefix/lib/sparcv9 or
+  dnl $prefix/lib/amd64) and 32-bit libraries go under $prefix/lib.
+  AC_REQUIRE([AC_CANONICAL_HOST])
+  AC_REQUIRE([gl_HOST_CPU_C_ABI_32BIT])
+
+  case "$host_os" in
+    solaris*)
+      AC_CACHE_CHECK([for 64-bit host], [gl_cv_solaris_64bit],
+        [AC_COMPILE_IFELSE(
+           [AC_LANG_SOURCE(
+              [[#ifdef _LP64
+                 int ok;
+                #else
+                 error fail
+                #endif
+              ]])],
+           [gl_cv_solaris_64bit=yes],
+           [gl_cv_solaris_64bit=no])
+        ]);;
+  esac
+
+  dnl Allow the user to override the result by setting acl_cv_libdirstems.
+  AC_CACHE_CHECK([for the common suffixes of directories in the library search path],
+    [acl_cv_libdirstems],
+    [acl_libdirstem=lib
+     acl_libdirstem2=
+     case "$host_os" in
+       solaris*)
+         dnl See Solaris 10 Software Developer Collection > Solaris 64-bit Developer's Guide > The Development Environment
+         dnl <https://docs.oracle.com/cd/E19253-01/816-5138/dev-env/index.html>.
+         dnl "Portable Makefiles should refer to any library directories using the 64 symbolic link."
+         dnl But we want to recognize the sparcv9 or amd64 subdirectory also if the
+         dnl symlink is missing, so we set acl_libdirstem2 too.
+         if test $gl_cv_solaris_64bit = yes; then
+           acl_libdirstem=lib/64
+           case "$host_cpu" in
+             sparc*)        acl_libdirstem2=lib/sparcv9 ;;
+             i*86 | x86_64) acl_libdirstem2=lib/amd64 ;;
+           esac
+         fi
+         ;;
+       *)
+         dnl If $CC generates code for a 32-bit ABI, the libraries are
+         dnl surely under $prefix/lib, not $prefix/lib64.
+         if test "$HOST_CPU_C_ABI_32BIT" != yes; then
+           dnl The result is a property of the system. However, non-system
+           dnl compilers sometimes have odd library search paths. Therefore
+           dnl prefer asking /usr/bin/gcc, if available, rather than $CC.
+           searchpath=`(if test -f /usr/bin/gcc \
+                           && LC_ALL=C /usr/bin/gcc -print-search-dirs >/dev/null 2>/dev/null; then \
+                          LC_ALL=C /usr/bin/gcc -print-search-dirs; \
+                        else \
+                          LC_ALL=C $CC -print-search-dirs; \
+                        fi) 2>/dev/null \
+                       | sed -n -e 's,^libraries: ,,p' | sed -e 's,^=,,'`
+           if test -n "$searchpath"; then
+             acl_save_IFS="${IFS= 	}"; IFS=":"
+             for searchdir in $searchpath; do
+               if test -d "$searchdir"; then
+                 case "$searchdir" in
+                   */lib64/ | */lib64 ) acl_libdirstem=lib64 ;;
+                   */../ | */.. )
+                     # Better ignore directories of this form. They are misleading.
+                     ;;
+                   *) searchdir=`cd "$searchdir" && pwd`
+                      case "$searchdir" in
+                        */lib64 ) acl_libdirstem=lib64 ;;
+                      esac ;;
+                 esac
+               fi
+             done
+             IFS="$acl_save_IFS"
+           fi
+         fi
+         ;;
+     esac
+     test -n "$acl_libdirstem2" || acl_libdirstem2="$acl_libdirstem"
+     acl_cv_libdirstems="$acl_libdirstem,$acl_libdirstem2"
+    ])
+  # Decompose acl_cv_libdirstems into acl_libdirstem and acl_libdirstem2.
+  acl_libdirstem=`echo "$acl_cv_libdirstems" | sed -e 's/,.*//'`
+  acl_libdirstem2=`echo "$acl_cv_libdirstems" | sed -e '/,/s/.*,//'`
+])
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/nls.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/nls.m4
new file mode 100644
index 00000000000..b62f6148570
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/nls.m4
@@ -0,0 +1,32 @@
+# nls.m4 serial 5 (gettext-0.18)
+dnl Copyright (C) 1995-2003, 2005-2006, 2008-2014, 2016, 2019 Free Software
+dnl Foundation, Inc.
+dnl This file is free software; the Free Software Foundation
+dnl gives unlimited permission to copy and/or distribute it,
+dnl with or without modifications, as long as this notice is preserved.
+dnl
+dnl This file can be used in projects which are not available under
+dnl the GNU General Public License or the GNU Library General Public
+dnl License but which still want to provide support for the GNU gettext
+dnl functionality.
+dnl Please note that the actual code of the GNU gettext library is covered
+dnl by the GNU Library General Public License, and the rest of the GNU
+dnl gettext package is covered by the GNU General Public License.
+dnl They are *not* in the public domain.
+
+dnl Authors:
+dnl   Ulrich Drepper <drepper@cygnus.com>, 1995-2000.
+dnl   Bruno Haible <haible@clisp.cons.org>, 2000-2003.
+
+AC_PREREQ([2.50])
+
+AC_DEFUN([AM_NLS],
+[
+  AC_MSG_CHECKING([whether NLS is requested])
+  dnl Default is enabled NLS
+  AC_ARG_ENABLE([nls],
+    [  --disable-nls           do not use Native Language Support],
+    USE_NLS=$enableval, USE_NLS=yes)
+  AC_MSG_RESULT([$USE_NLS])
+  AC_SUBST([USE_NLS])
+])
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/po.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/po.m4
new file mode 100644
index 00000000000..143792dba56
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/po.m4
@@ -0,0 +1,450 @@
+# po.m4 serial 30 (gettext-0.20)
+dnl Copyright (C) 1995-2014, 2016, 2018-2019 Free Software Foundation, Inc.
+dnl This file is free software; the Free Software Foundation
+dnl gives unlimited permission to copy and/or distribute it,
+dnl with or without modifications, as long as this notice is preserved.
+dnl
+dnl This file can be used in projects which are not available under
+dnl the GNU General Public License or the GNU Library General Public
+dnl License but which still want to provide support for the GNU gettext
+dnl functionality.
+dnl Please note that the actual code of the GNU gettext library is covered
+dnl by the GNU Library General Public License, and the rest of the GNU
+dnl gettext package is covered by the GNU General Public License.
+dnl They are *not* in the public domain.
+
+dnl Authors:
+dnl   Ulrich Drepper <drepper@cygnus.com>, 1995-2000.
+dnl   Bruno Haible <haible@clisp.cons.org>, 2000-2003.
+
+AC_PREREQ([2.60])
+
+dnl Checks for all prerequisites of the po subdirectory.
+AC_DEFUN([AM_PO_SUBDIRS],
+[
+  AC_REQUIRE([AC_PROG_MAKE_SET])dnl
+  AC_REQUIRE([AC_PROG_INSTALL])dnl
+  AC_REQUIRE([AC_PROG_MKDIR_P])dnl
+  AC_REQUIRE([AC_PROG_SED])dnl
+  AC_REQUIRE([AM_NLS])dnl
+
+  dnl Release version of the gettext macros. This is used to ensure that
+  dnl the gettext macros and po/Makefile.in.in are in sync.
+  AC_SUBST([GETTEXT_MACRO_VERSION], [0.20])
+
+  dnl Perform the following tests also if --disable-nls has been given,
+  dnl because they are needed for "make dist" to work.
+
+  dnl Search for GNU msgfmt in the PATH.
+  dnl The first test excludes Solaris msgfmt and early GNU msgfmt versions.
+  dnl The second test excludes FreeBSD msgfmt.
+  AM_PATH_PROG_WITH_TEST(MSGFMT, msgfmt,
+    [$ac_dir/$ac_word --statistics /dev/null >&]AS_MESSAGE_LOG_FD[ 2>&1 &&
+     (if $ac_dir/$ac_word --statistics /dev/null 2>&1 >/dev/null | grep usage >/dev/null; then exit 1; else exit 0; fi)],
+    :)
+  AC_PATH_PROG([GMSGFMT], [gmsgfmt], [$MSGFMT])
+
+  dnl Test whether it is GNU msgfmt >= 0.15.
+changequote(,)dnl
+  case `$GMSGFMT --version | sed 1q | sed -e 's,^[^0-9]*,,'` in
+    '' | 0.[0-9] | 0.[0-9].* | 0.1[0-4] | 0.1[0-4].*) GMSGFMT_015=: ;;
+    *) GMSGFMT_015=$GMSGFMT ;;
+  esac
+changequote([,])dnl
+  AC_SUBST([GMSGFMT_015])
+
+  dnl Search for GNU xgettext 0.12 or newer in the PATH.
+  dnl The first test excludes Solaris xgettext and early GNU xgettext versions.
+  dnl The second test excludes FreeBSD xgettext.
+  AM_PATH_PROG_WITH_TEST(XGETTEXT, xgettext,
+    [$ac_dir/$ac_word --omit-header --copyright-holder= --msgid-bugs-address= /dev/null >&]AS_MESSAGE_LOG_FD[ 2>&1 &&
+     (if $ac_dir/$ac_word --omit-header --copyright-holder= --msgid-bugs-address= /dev/null 2>&1 >/dev/null | grep usage >/dev/null; then exit 1; else exit 0; fi)],
+    :)
+  dnl Remove leftover from FreeBSD xgettext call.
+  rm -f messages.po
+
+  dnl Test whether it is GNU xgettext >= 0.15.
+changequote(,)dnl
+  case `$XGETTEXT --version | sed 1q | sed -e 's,^[^0-9]*,,'` in
+    '' | 0.[0-9] | 0.[0-9].* | 0.1[0-4] | 0.1[0-4].*) XGETTEXT_015=: ;;
+    *) XGETTEXT_015=$XGETTEXT ;;
+  esac
+changequote([,])dnl
+  AC_SUBST([XGETTEXT_015])
+
+  dnl Search for GNU msgmerge 0.11 or newer in the PATH.
+  AM_PATH_PROG_WITH_TEST(MSGMERGE, msgmerge,
+    [$ac_dir/$ac_word --update -q /dev/null /dev/null >&]AS_MESSAGE_LOG_FD[ 2>&1], :)
+
+  dnl Test whether it is GNU msgmerge >= 0.20.
+  if LC_ALL=C $MSGMERGE --help | grep ' --for-msgfmt ' >/dev/null; then
+    MSGMERGE_FOR_MSGFMT_OPTION='--for-msgfmt'
+  else
+    dnl Test whether it is GNU msgmerge >= 0.12.
+    if LC_ALL=C $MSGMERGE --help | grep ' --no-fuzzy-matching ' >/dev/null; then
+      MSGMERGE_FOR_MSGFMT_OPTION='--no-fuzzy-matching --no-location --quiet'
+    else
+      dnl With these old versions, $(MSGMERGE) $(MSGMERGE_FOR_MSGFMT_OPTION) is
+      dnl slow. But this is not a big problem, as such old gettext versions are
+      dnl hardly in use any more.
+      MSGMERGE_FOR_MSGFMT_OPTION='--no-location --quiet'
+    fi
+  fi
+  AC_SUBST([MSGMERGE_FOR_MSGFMT_OPTION])
+
+  dnl Support for AM_XGETTEXT_OPTION.
+  test -n "${XGETTEXT_EXTRA_OPTIONS+set}" || XGETTEXT_EXTRA_OPTIONS=
+  AC_SUBST([XGETTEXT_EXTRA_OPTIONS])
+
+  AC_CONFIG_COMMANDS([po-directories], [[
+    for ac_file in $CONFIG_FILES; do
+      # Support "outfile[:infile[:infile...]]"
+      case "$ac_file" in
+        *:*) ac_file=`echo "$ac_file"|sed 's%:.*%%'` ;;
+      esac
+      # PO directories have a Makefile.in generated from Makefile.in.in.
+      case "$ac_file" in */Makefile.in)
+        # Adjust a relative srcdir.
+        ac_dir=`echo "$ac_file"|sed 's%/[^/][^/]*$%%'`
+        ac_dir_suffix=/`echo "$ac_dir"|sed 's%^\./%%'`
+        ac_dots=`echo "$ac_dir_suffix"|sed 's%/[^/]*%../%g'`
+        # In autoconf-2.13 it is called $ac_given_srcdir.
+        # In autoconf-2.50 it is called $srcdir.
+        test -n "$ac_given_srcdir" || ac_given_srcdir="$srcdir"
+        case "$ac_given_srcdir" in
+          .)  top_srcdir=`echo $ac_dots|sed 's%/$%%'` ;;
+          /*) top_srcdir="$ac_given_srcdir" ;;
+          *)  top_srcdir="$ac_dots$ac_given_srcdir" ;;
+        esac
+        # Treat a directory as a PO directory if and only if it has a
+        # POTFILES.in file. This allows packages to have multiple PO
+        # directories under different names or in different locations.
+        if test -f "$ac_given_srcdir/$ac_dir/POTFILES.in"; then
+          rm -f "$ac_dir/POTFILES"
+          test -n "$as_me" && echo "$as_me: creating $ac_dir/POTFILES" || echo "creating $ac_dir/POTFILES"
+          gt_tab=`printf '\t'`
+          cat "$ac_given_srcdir/$ac_dir/POTFILES.in" | sed -e "/^#/d" -e "/^[ ${gt_tab}]*\$/d" -e "s,.*,     $top_srcdir/& \\\\," | sed -e "\$s/\(.*\) \\\\/\1/" > "$ac_dir/POTFILES"
+          POMAKEFILEDEPS="POTFILES.in"
+          # ALL_LINGUAS, POFILES, UPDATEPOFILES, DUMMYPOFILES, GMOFILES depend
+          # on $ac_dir but don't depend on user-specified configuration
+          # parameters.
+          if test -f "$ac_given_srcdir/$ac_dir/LINGUAS"; then
+            # The LINGUAS file contains the set of available languages.
+            if test -n "$OBSOLETE_ALL_LINGUAS"; then
+              test -n "$as_me" && echo "$as_me: setting ALL_LINGUAS in configure.in is obsolete" || echo "setting ALL_LINGUAS in configure.in is obsolete"
+            fi
+            ALL_LINGUAS=`sed -e "/^#/d" -e "s/#.*//" "$ac_given_srcdir/$ac_dir/LINGUAS"`
+            POMAKEFILEDEPS="$POMAKEFILEDEPS LINGUAS"
+          else
+            # The set of available languages was given in configure.in.
+            ALL_LINGUAS=$OBSOLETE_ALL_LINGUAS
+          fi
+          # Compute POFILES
+          # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(lang).po)
+          # Compute UPDATEPOFILES
+          # as      $(foreach lang, $(ALL_LINGUAS), $(lang).po-update)
+          # Compute DUMMYPOFILES
+          # as      $(foreach lang, $(ALL_LINGUAS), $(lang).nop)
+          # Compute GMOFILES
+          # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(lang).gmo)
+          case "$ac_given_srcdir" in
+            .) srcdirpre= ;;
+            *) srcdirpre='$(srcdir)/' ;;
+          esac
+          POFILES=
+          UPDATEPOFILES=
+          DUMMYPOFILES=
+          GMOFILES=
+          for lang in $ALL_LINGUAS; do
+            POFILES="$POFILES $srcdirpre$lang.po"
+            UPDATEPOFILES="$UPDATEPOFILES $lang.po-update"
+            DUMMYPOFILES="$DUMMYPOFILES $lang.nop"
+            GMOFILES="$GMOFILES $srcdirpre$lang.gmo"
+          done
+          # CATALOGS depends on both $ac_dir and the user's LINGUAS
+          # environment variable.
+          INST_LINGUAS=
+          if test -n "$ALL_LINGUAS"; then
+            for presentlang in $ALL_LINGUAS; do
+              useit=no
+              if test "%UNSET%" != "$LINGUAS"; then
+                desiredlanguages="$LINGUAS"
+              else
+                desiredlanguages="$ALL_LINGUAS"
+              fi
+              for desiredlang in $desiredlanguages; do
+                # Use the presentlang catalog if desiredlang is
+                #   a. equal to presentlang, or
+                #   b. a variant of presentlang (because in this case,
+                #      presentlang can be used as a fallback for messages
+                #      which are not translated in the desiredlang catalog).
+                case "$desiredlang" in
+                  "$presentlang"*) useit=yes;;
+                esac
+              done
+              if test $useit = yes; then
+                INST_LINGUAS="$INST_LINGUAS $presentlang"
+              fi
+            done
+          fi
+          CATALOGS=
+          if test -n "$INST_LINGUAS"; then
+            for lang in $INST_LINGUAS; do
+              CATALOGS="$CATALOGS $lang.gmo"
+            done
+          fi
+          test -n "$as_me" && echo "$as_me: creating $ac_dir/Makefile" || echo "creating $ac_dir/Makefile"
+          sed -e "/^POTFILES =/r $ac_dir/POTFILES" -e "/^# Makevars/r $ac_given_srcdir/$ac_dir/Makevars" -e "s|@POFILES@|$POFILES|g" -e "s|@UPDATEPOFILES@|$UPDATEPOFILES|g" -e "s|@DUMMYPOFILES@|$DUMMYPOFILES|g" -e "s|@GMOFILES@|$GMOFILES|g" -e "s|@CATALOGS@|$CATALOGS|g" -e "s|@POMAKEFILEDEPS@|$POMAKEFILEDEPS|g" "$ac_dir/Makefile.in" > "$ac_dir/Makefile"
+          for f in "$ac_given_srcdir/$ac_dir"/Rules-*; do
+            if test -f "$f"; then
+              case "$f" in
+                *.orig | *.bak | *~) ;;
+                *) cat "$f" >> "$ac_dir/Makefile" ;;
+              esac
+            fi
+          done
+        fi
+        ;;
+      esac
+    done]],
+   [# Capture the value of obsolete ALL_LINGUAS because we need it to compute
+    # POFILES, UPDATEPOFILES, DUMMYPOFILES, GMOFILES, CATALOGS.
+    OBSOLETE_ALL_LINGUAS="$ALL_LINGUAS"
+    # Capture the value of LINGUAS because we need it to compute CATALOGS.
+    LINGUAS="${LINGUAS-%UNSET%}"
+   ])
+])
+
+dnl Postprocesses a Makefile in a directory containing PO files.
+AC_DEFUN([AM_POSTPROCESS_PO_MAKEFILE],
+[
+  # When this code is run, in config.status, two variables have already been
+  # set:
+  # - OBSOLETE_ALL_LINGUAS is the value of LINGUAS set in configure.in,
+  # - LINGUAS is the value of the environment variable LINGUAS at configure
+  #   time.
+
+changequote(,)dnl
+  # Adjust a relative srcdir.
+  ac_dir=`echo "$ac_file"|sed 's%/[^/][^/]*$%%'`
+  ac_dir_suffix=/`echo "$ac_dir"|sed 's%^\./%%'`
+  ac_dots=`echo "$ac_dir_suffix"|sed 's%/[^/]*%../%g'`
+  # In autoconf-2.13 it is called $ac_given_srcdir.
+  # In autoconf-2.50 it is called $srcdir.
+  test -n "$ac_given_srcdir" || ac_given_srcdir="$srcdir"
+  case "$ac_given_srcdir" in
+    .)  top_srcdir=`echo $ac_dots|sed 's%/$%%'` ;;
+    /*) top_srcdir="$ac_given_srcdir" ;;
+    *)  top_srcdir="$ac_dots$ac_given_srcdir" ;;
+  esac
+
+  # Find a way to echo strings without interpreting backslash.
+  if test "X`(echo '\t') 2>/dev/null`" = 'X\t'; then
+    gt_echo='echo'
+  else
+    if test "X`(printf '%s\n' '\t') 2>/dev/null`" = 'X\t'; then
+      gt_echo='printf %s\n'
+    else
+      echo_func () {
+        cat <<EOT
+$*
+EOT
+      }
+      gt_echo='echo_func'
+    fi
+  fi
+
+  # A sed script that extracts the value of VARIABLE from a Makefile.
+  tab=`printf '\t'`
+  sed_x_variable='
+# Test if the hold space is empty.
+x
+s/P/P/
+x
+ta
+# Yes it was empty. Look if we have the expected variable definition.
+/^['"${tab}"' ]*VARIABLE['"${tab}"' ]*=/{
+  # Seen the first line of the variable definition.
+  s/^['"${tab}"' ]*VARIABLE['"${tab}"' ]*=//
+  ba
+}
+bd
+:a
+# Here we are processing a line from the variable definition.
+# Remove comment, more precisely replace it with a space.
+s/#.*$/ /
+# See if the line ends in a backslash.
+tb
+:b
+s/\\$//
+# Print the line, without the trailing backslash.
+p
+tc
+# There was no trailing backslash. The end of the variable definition is
+# reached. Clear the hold space.
+s/^.*$//
+x
+bd
+:c
+# A trailing backslash means that the variable definition continues in the
+# next line. Put a nonempty string into the hold space to indicate this.
+s/^.*$/P/
+x
+:d
+'
+changequote([,])dnl
+
+  # Set POTFILES to the value of the Makefile variable POTFILES.
+  sed_x_POTFILES=`$gt_echo "$sed_x_variable" | sed -e '/^ *#/d' -e 's/VARIABLE/POTFILES/g'`
+  POTFILES=`sed -n -e "$sed_x_POTFILES" < "$ac_file"`
+  # Compute POTFILES_DEPS as
+  #   $(foreach file, $(POTFILES), $(top_srcdir)/$(file))
+  POTFILES_DEPS=
+  for file in $POTFILES; do
+    POTFILES_DEPS="$POTFILES_DEPS "'$(top_srcdir)/'"$file"
+  done
+  POMAKEFILEDEPS=""
+
+  if test -n "$OBSOLETE_ALL_LINGUAS"; then
+    test -n "$as_me" && echo "$as_me: setting ALL_LINGUAS in configure.in is obsolete" || echo "setting ALL_LINGUAS in configure.in is obsolete"
+  fi
+  if test -f "$ac_given_srcdir/$ac_dir/LINGUAS"; then
+    # The LINGUAS file contains the set of available languages.
+    ALL_LINGUAS=`sed -e "/^#/d" -e "s/#.*//" "$ac_given_srcdir/$ac_dir/LINGUAS"`
+    POMAKEFILEDEPS="$POMAKEFILEDEPS LINGUAS"
+  else
+    # Set ALL_LINGUAS to the value of the Makefile variable LINGUAS.
+    sed_x_LINGUAS=`$gt_echo "$sed_x_variable" | sed -e '/^ *#/d' -e 's/VARIABLE/LINGUAS/g'`
+    ALL_LINGUAS=`sed -n -e "$sed_x_LINGUAS" < "$ac_file"`
+  fi
+  # Compute POFILES
+  # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(lang).po)
+  # Compute UPDATEPOFILES
+  # as      $(foreach lang, $(ALL_LINGUAS), $(lang).po-update)
+  # Compute DUMMYPOFILES
+  # as      $(foreach lang, $(ALL_LINGUAS), $(lang).nop)
+  # Compute GMOFILES
+  # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(lang).gmo)
+  # Compute PROPERTIESFILES
+  # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(DOMAIN)_$(lang).properties)
+  # Compute CLASSFILES
+  # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(DOMAIN)_$(lang).class)
+  # Compute QMFILES
+  # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(lang).qm)
+  # Compute MSGFILES
+  # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(frob $(lang)).msg)
+  # Compute RESOURCESDLLFILES
+  # as      $(foreach lang, $(ALL_LINGUAS), $(srcdir)/$(frob $(lang))/$(DOMAIN).resources.dll)
+  case "$ac_given_srcdir" in
+    .) srcdirpre= ;;
+    *) srcdirpre='$(srcdir)/' ;;
+  esac
+  POFILES=
+  UPDATEPOFILES=
+  DUMMYPOFILES=
+  GMOFILES=
+  PROPERTIESFILES=
+  CLASSFILES=
+  QMFILES=
+  MSGFILES=
+  RESOURCESDLLFILES=
+  for lang in $ALL_LINGUAS; do
+    POFILES="$POFILES $srcdirpre$lang.po"
+    UPDATEPOFILES="$UPDATEPOFILES $lang.po-update"
+    DUMMYPOFILES="$DUMMYPOFILES $lang.nop"
+    GMOFILES="$GMOFILES $srcdirpre$lang.gmo"
+    PROPERTIESFILES="$PROPERTIESFILES \$(srcdir)/\$(DOMAIN)_$lang.properties"
+    CLASSFILES="$CLASSFILES \$(srcdir)/\$(DOMAIN)_$lang.class"
+    QMFILES="$QMFILES $srcdirpre$lang.qm"
+    frobbedlang=`echo $lang | sed -e 's/\..*$//' -e 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
+    MSGFILES="$MSGFILES $srcdirpre$frobbedlang.msg"
+    frobbedlang=`echo $lang | sed -e 's/_/-/g' -e 's/^sr-CS/sr-SP/' -e 's/@latin$/-Latn/' -e 's/@cyrillic$/-Cyrl/' -e 's/^sr-SP$/sr-SP-Latn/' -e 's/^uz-UZ$/uz-UZ-Latn/'`
+    RESOURCESDLLFILES="$RESOURCESDLLFILES $srcdirpre$frobbedlang/\$(DOMAIN).resources.dll"
+  done
+  # CATALOGS depends on both $ac_dir and the user's LINGUAS
+  # environment variable.
+  INST_LINGUAS=
+  if test -n "$ALL_LINGUAS"; then
+    for presentlang in $ALL_LINGUAS; do
+      useit=no
+      if test "%UNSET%" != "$LINGUAS"; then
+        desiredlanguages="$LINGUAS"
+      else
+        desiredlanguages="$ALL_LINGUAS"
+      fi
+      for desiredlang in $desiredlanguages; do
+        # Use the presentlang catalog if desiredlang is
+        #   a. equal to presentlang, or
+        #   b. a variant of presentlang (because in this case,
+        #      presentlang can be used as a fallback for messages
+        #      which are not translated in the desiredlang catalog).
+        case "$desiredlang" in
+          "$presentlang"*) useit=yes;;
+        esac
+      done
+      if test $useit = yes; then
+        INST_LINGUAS="$INST_LINGUAS $presentlang"
+      fi
+    done
+  fi
+  CATALOGS=
+  JAVACATALOGS=
+  QTCATALOGS=
+  TCLCATALOGS=
+  CSHARPCATALOGS=
+  if test -n "$INST_LINGUAS"; then
+    for lang in $INST_LINGUAS; do
+      CATALOGS="$CATALOGS $lang.gmo"
+      JAVACATALOGS="$JAVACATALOGS \$(DOMAIN)_$lang.properties"
+      QTCATALOGS="$QTCATALOGS $lang.qm"
+      frobbedlang=`echo $lang | sed -e 's/\..*$//' -e 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
+      TCLCATALOGS="$TCLCATALOGS $frobbedlang.msg"
+      frobbedlang=`echo $lang | sed -e 's/_/-/g' -e 's/^sr-CS/sr-SP/' -e 's/@latin$/-Latn/' -e 's/@cyrillic$/-Cyrl/' -e 's/^sr-SP$/sr-SP-Latn/' -e 's/^uz-UZ$/uz-UZ-Latn/'`
+      CSHARPCATALOGS="$CSHARPCATALOGS $frobbedlang/\$(DOMAIN).resources.dll"
+    done
+  fi
+
+  sed -e "s|@POTFILES_DEPS@|$POTFILES_DEPS|g" -e "s|@POFILES@|$POFILES|g" -e "s|@UPDATEPOFILES@|$UPDATEPOFILES|g" -e "s|@DUMMYPOFILES@|$DUMMYPOFILES|g" -e "s|@GMOFILES@|$GMOFILES|g" -e "s|@PROPERTIESFILES@|$PROPERTIESFILES|g" -e "s|@CLASSFILES@|$CLASSFILES|g" -e "s|@QMFILES@|$QMFILES|g" -e "s|@MSGFILES@|$MSGFILES|g" -e "s|@RESOURCESDLLFILES@|$RESOURCESDLLFILES|g" -e "s|@CATALOGS@|$CATALOGS|g" -e "s|@JAVACATALOGS@|$JAVACATALOGS|g" -e "s|@QTCATALOGS@|$QTCATALOGS|g" -e "s|@TCLCATALOGS@|$TCLCATALOGS|g" -e "s|@CSHARPCATALOGS@|$CSHARPCATALOGS|g" -e 's,^#distdir:,distdir:,' < "$ac_file" > "$ac_file.tmp"
+  tab=`printf '\t'`
+  if grep -l '@TCLCATALOGS@' "$ac_file" > /dev/null; then
+    # Add dependencies that cannot be formulated as a simple suffix rule.
+    for lang in $ALL_LINGUAS; do
+      frobbedlang=`echo $lang | sed -e 's/\..*$//' -e 'y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/abcdefghijklmnopqrstuvwxyz/'`
+      cat >> "$ac_file.tmp" <<EOF
+$frobbedlang.msg: $lang.po
+${tab}@echo "\$(MSGFMT) -c --tcl -d \$(srcdir) -l $lang $srcdirpre$lang.po"; \
+${tab}\$(MSGFMT) -c --tcl -d "\$(srcdir)" -l $lang $srcdirpre$lang.po || { rm -f "\$(srcdir)/$frobbedlang.msg"; exit 1; }
+EOF
+    done
+  fi
+  if grep -l '@CSHARPCATALOGS@' "$ac_file" > /dev/null; then
+    # Add dependencies that cannot be formulated as a simple suffix rule.
+    for lang in $ALL_LINGUAS; do
+      frobbedlang=`echo $lang | sed -e 's/_/-/g' -e 's/^sr-CS/sr-SP/' -e 's/@latin$/-Latn/' -e 's/@cyrillic$/-Cyrl/' -e 's/^sr-SP$/sr-SP-Latn/' -e 's/^uz-UZ$/uz-UZ-Latn/'`
+      cat >> "$ac_file.tmp" <<EOF
+$frobbedlang/\$(DOMAIN).resources.dll: $lang.po
+${tab}@echo "\$(MSGFMT) -c --csharp -d \$(srcdir) -l $lang $srcdirpre$lang.po -r \$(DOMAIN)"; \
+${tab}\$(MSGFMT) -c --csharp -d "\$(srcdir)" -l $lang $srcdirpre$lang.po -r "\$(DOMAIN)" || { rm -f "\$(srcdir)/$frobbedlang.msg"; exit 1; }
+EOF
+    done
+  fi
+  if test -n "$POMAKEFILEDEPS"; then
+    cat >> "$ac_file.tmp" <<EOF
+Makefile: $POMAKEFILEDEPS
+EOF
+  fi
+  mv "$ac_file.tmp" "$ac_file"
+])
+
+dnl Initializes the accumulator used by AM_XGETTEXT_OPTION.
+AC_DEFUN([AM_XGETTEXT_OPTION_INIT],
+[
+  XGETTEXT_EXTRA_OPTIONS=
+])
+
+dnl Registers an option to be passed to xgettext in the po subdirectory.
+AC_DEFUN([AM_XGETTEXT_OPTION],
+[
+  AC_REQUIRE([AM_XGETTEXT_OPTION_INIT])
+  XGETTEXT_EXTRA_OPTIONS="$XGETTEXT_EXTRA_OPTIONS $1"
+])
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/progtest.m4 b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/progtest.m4
new file mode 100644
index 00000000000..5f186b14909
--- /dev/null
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/aclocal/progtest.m4
@@ -0,0 +1,91 @@
+# progtest.m4 serial 7 (gettext-0.18.2)
+dnl Copyright (C) 1996-2003, 2005, 2008-2019 Free Software Foundation, Inc.
+dnl This file is free software; the Free Software Foundation
+dnl gives unlimited permission to copy and/or distribute it,
+dnl with or without modifications, as long as this notice is preserved.
+dnl
+dnl This file can be used in projects which are not available under
+dnl the GNU General Public License or the GNU Library General Public
+dnl License but which still want to provide support for the GNU gettext
+dnl functionality.
+dnl Please note that the actual code of the GNU gettext library is covered
+dnl by the GNU Library General Public License, and the rest of the GNU
+dnl gettext package is covered by the GNU General Public License.
+dnl They are *not* in the public domain.
+
+dnl Authors:
+dnl   Ulrich Drepper <drepper@cygnus.com>, 1996.
+
+AC_PREREQ([2.50])
+
+# Search path for a program which passes the given test.
+
+dnl AM_PATH_PROG_WITH_TEST(VARIABLE, PROG-TO-CHECK-FOR,
+dnl   TEST-PERFORMED-ON-FOUND_PROGRAM [, VALUE-IF-NOT-FOUND [, PATH]])
+AC_DEFUN([AM_PATH_PROG_WITH_TEST],
+[
+# Prepare PATH_SEPARATOR.
+# The user is always right.
+if test "${PATH_SEPARATOR+set}" != set; then
+  # Determine PATH_SEPARATOR by trying to find /bin/sh in a PATH which
+  # contains only /bin. Note that ksh looks also at the FPATH variable,
+  # so we have to set that as well for the test.
+  PATH_SEPARATOR=:
+  (PATH='/bin;/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 \
+    && { (PATH='/bin:/bin'; FPATH=$PATH; sh -c :) >/dev/null 2>&1 \
+           || PATH_SEPARATOR=';'
+       }
+fi
+
+# Find out how to test for executable files. Don't use a zero-byte file,
+# as systems may use methods other than mode bits to determine executability.
+cat >conf$$.file <<_ASEOF
+#! /bin/sh
+exit 0
+_ASEOF
+chmod +x conf$$.file
+if test -x conf$$.file >/dev/null 2>&1; then
+  ac_executable_p="test -x"
+else
+  ac_executable_p="test -f"
+fi
+rm -f conf$$.file
+
+# Extract the first word of "$2", so it can be a program name with args.
+set dummy $2; ac_word=[$]2
+AC_MSG_CHECKING([for $ac_word])
+AC_CACHE_VAL([ac_cv_path_$1],
+[case "[$]$1" in
+  [[\\/]]* | ?:[[\\/]]*)
+    ac_cv_path_$1="[$]$1" # Let the user override the test with a path.
+    ;;
+  *)
+    ac_save_IFS="$IFS"; IFS=$PATH_SEPARATOR
+    for ac_dir in ifelse([$5], , $PATH, [$5]); do
+      IFS="$ac_save_IFS"
+      test -z "$ac_dir" && ac_dir=.
+      for ac_exec_ext in '' $ac_executable_extensions; do
+        if $ac_executable_p "$ac_dir/$ac_word$ac_exec_ext"; then
+          echo "$as_me: trying $ac_dir/$ac_word..." >&AS_MESSAGE_LOG_FD
+          if [$3]; then
+            ac_cv_path_$1="$ac_dir/$ac_word$ac_exec_ext"
+            break 2
+          fi
+        fi
+      done
+    done
+    IFS="$ac_save_IFS"
+dnl If no 4th arg is given, leave the cache variable unset,
+dnl so AC_PATH_PROGS will keep looking.
+ifelse([$4], , , [  test -z "[$]ac_cv_path_$1" && ac_cv_path_$1="$4"
+])dnl
+    ;;
+esac])dnl
+$1="$ac_cv_path_$1"
+if test ifelse([$4], , [-n "[$]$1"], ["[$]$1" != "$4"]); then
+  AC_MSG_RESULT([$][$1])
+else
+  AC_MSG_RESULT([no])
+fi
+AC_SUBST([$1])dnl
+])
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/config.rpath b/meta/recipes-core/gettext/gettext-minimal-0.20.1/config.rpath
similarity index 99%
rename from meta/recipes-core/gettext/gettext-minimal-0.19.8.1/config.rpath
rename to meta/recipes-core/gettext/gettext-minimal-0.20.1/config.rpath
index 98183ff2f2e..be202c1a9e7 100755
--- a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/config.rpath
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/config.rpath
@@ -2,7 +2,7 @@
 # Output a system dependent set of variables, describing how to set the
 # run time search path of shared libraries in an executable.
 #
-#   Copyright 1996-2016 Free Software Foundation, Inc.
+#   Copyright 1996-2019 Free Software Foundation, Inc.
 #   Taken from GNU libtool, 2001
 #   Originally by Gordon Matzigkeit <gord@gnu.ai.mit.edu>, 1996
 #
diff --git a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/remove-potcdate.sin b/meta/recipes-core/gettext/gettext-minimal-0.20.1/remove-potcdate.sin
similarity index 50%
rename from meta/recipes-core/gettext/gettext-minimal-0.19.8.1/remove-potcdate.sin
rename to meta/recipes-core/gettext/gettext-minimal-0.20.1/remove-potcdate.sin
index 2436c49e786..8c70dfbf148 100644
--- a/meta/recipes-core/gettext/gettext-minimal-0.19.8.1/remove-potcdate.sin
+++ b/meta/recipes-core/gettext/gettext-minimal-0.20.1/remove-potcdate.sin
@@ -1,6 +1,12 @@
-# Sed script that remove the POT-Creation-Date line in the header entry
+# Sed script that removes the POT-Creation-Date line in the header entry
 # from a POT file.
 #
+# Copyright (C) 2002 Free Software Foundation, Inc.
+# Copying and distribution of this file, with or without modification,
+# are permitted in any medium without royalty provided the copyright
+# notice and this notice are preserved.  This file is offered as-is,
+# without any warranty.
+#
 # The distinction between the first and the following occurrences of the
 # pattern is achieved by looking at the hold space.
 /^"POT-Creation-Date: .*"$/{
diff --git a/meta/recipes-core/gettext/gettext-minimal-native_0.19.8.1.bb b/meta/recipes-core/gettext/gettext-minimal-native_0.20.1.bb
similarity index 86%
rename from meta/recipes-core/gettext/gettext-minimal-native_0.19.8.1.bb
rename to meta/recipes-core/gettext/gettext-minimal-native_0.20.1.bb
index 26ff19975d2..7a4dcbec57b 100644
--- a/meta/recipes-core/gettext/gettext-minimal-native_0.19.8.1.bb
+++ b/meta/recipes-core/gettext/gettext-minimal-native_0.20.1.bb
@@ -3,12 +3,11 @@ DESCRIPTION = "Contains the m4 macros sufficient to support building \
 autoconf/automake. This provides a significant build time speedup by \
 the removal of gettext-native from most dependency chains (now only \
 needed for gettext for the target)."
-SRC_URI = "file://aclocal.tgz \
+SRC_URI = "file://aclocal/ \
            file://config.rpath \
            file://Makefile.in.in \
            file://remove-potcdate.sin \
            file://COPYING \
-           file://0001-PATCH-Disable-the-test-to-convert-euc-jp.patch \
 "
 
 INHIBIT_DEFAULT_DEPS = "1"
@@ -23,7 +22,7 @@ S = "${WORKDIR}"
 
 do_install () {
 	install -d ${D}${datadir}/aclocal/
-	cp ${WORKDIR}/*.m4 ${D}${datadir}/aclocal/
+	cp ${WORKDIR}/aclocal/*.m4 ${D}${datadir}/aclocal/
 	install -d ${D}${datadir}/gettext/po/
 	cp ${WORKDIR}/config.rpath ${D}${datadir}/gettext/
 	cp ${WORKDIR}/Makefile.in.in ${D}${datadir}/gettext/po/
-- 
2.17.1


