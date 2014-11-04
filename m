Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3684765D4F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Nov 2014 11:39:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4Bd1ma009455; Tue, 4 Nov 2014 11:39:01 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id v9NECeb0ekjN; Tue,  4 Nov 2014 11:39:01 +0000 (GMT)
Received: from ted (5751f4a1.skybroadband.com [87.81.244.161])
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sA4BcelF009423
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 4 Nov 2014 11:38:41 GMT
Received: from richard by ted with local (Exim 4.82)
	(envelope-from <richard@dan.rpsys.net>)
	id 1XlcS5-0000JI-Ry; Tue, 04 Nov 2014 11:39:09 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Nov 2014 11:39:04 +0000
Message-Id: <1415101148-1142-4-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.0.2
In-Reply-To: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1415101148-1142-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 4/8] libunistring: 0.9.3 -> 0.9.4
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
X-List-Received-Date: Tue, 04 Nov 2014 11:39:39 -0000

Drop two patches merged upstream.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...conv-m4-remove-the-test-to-convert-euc-jp.patch | 20 +++---
 .../libunistring_fix_for_automake_1.12.patch       | 81 ----------------------
 .../libunistring/libunistring/parallelmake.patch   | 26 -------
 .../libunistring/libunistring_0.9.3.bb             | 32 ---------
 .../libunistring/libunistring_0.9.4.bb             | 28 ++++++++
 5 files changed, 37 insertions(+), 150 deletions(-)
 delete mode 100644 meta/recipes-support/libunistring/libunistring/libunistring_fix_for_automake_1.12.patch
 delete mode 100644 meta/recipes-support/libunistring/libunistring/parallelmake.patch
 delete mode 100644 meta/recipes-support/libunistring/libunistring_0.9.3.bb
 create mode 100644 meta/recipes-support/libunistring/libunistring_0.9.4.bb

diff --git a/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch b/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
index a330c73..d448916 100644
--- a/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
+++ b/meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch
@@ -16,11 +16,11 @@ Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
  gnulib-m4/iconv.m4 |   11 -----------
  1 files changed, 0 insertions(+), 11 deletions(-)
 
-diff --git a/gnulib-m4/iconv.m4 b/gnulib-m4/iconv.m4
-index f46ff14..de0a5e9 100644
---- a/gnulib-m4/iconv.m4
-+++ b/gnulib-m4/iconv.m4
-@@ -126,17 +126,6 @@ int main ()
+Index: libunistring-0.9.4/gnulib-m4/iconv.m4
+===================================================================
+--- libunistring-0.9.4.orig/gnulib-m4/iconv.m4	2014-11-03 17:41:29.755011917 +0000
++++ libunistring-0.9.4/gnulib-m4/iconv.m4	2014-11-03 17:43:03.795014480 +0000
+@@ -159,17 +159,6 @@
        }
    }
  #endif
@@ -34,9 +34,7 @@ index f46ff14..de0a5e9 100644
 -      && iconv_open ("UTF-8", "IBM-eucJP") == (iconv_t)(-1)
 -      /* Try HP-UX names.  */
 -      && iconv_open ("utf8", "eucJP") == (iconv_t)(-1))
--    return 1;
-   return 0;
- }], [am_cv_func_iconv_works=yes], [am_cv_func_iconv_works=no],
-         [case "$host_os" in
---
-1.7.4
+-    result |= 16;
+   return result;
+ }]])],
+         [am_cv_func_iconv_works=yes],
diff --git a/meta/recipes-support/libunistring/libunistring/libunistring_fix_for_automake_1.12.patch b/meta/recipes-support/libunistring/libunistring/libunistring_fix_for_automake_1.12.patch
deleted file mode 100644
index 5d831d5..0000000
--- a/meta/recipes-support/libunistring/libunistring/libunistring_fix_for_automake_1.12.patch
+++ /dev/null
@@ -1,81 +0,0 @@
-Upstream-Status: Pending
-
-automake 1.12 has deprecated use of mkdir_p, and it recommends
-use of MKDIR_P instead. Changed the code to avoid these kind 
-of warning-errors.
-
-| make[2]: /build/tmp/work/x86_64-linux/libunistring-native-0.9.3-r2/image/srv/home/nitin/builds2/build0/tmp/sysroots/x86_64-linux/usr/share/doc/libunistring: Command not found
-| make[2]: *** [install-html-split] Error 127
-
-Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
-2012/07/10
-
-Index: libunistring-0.9.3/doc/Makefile.am
-===================================================================
---- libunistring-0.9.3.orig/doc/Makefile.am
-+++ libunistring-0.9.3/doc/Makefile.am
-@@ -87,7 +87,7 @@ TEXI2DVI = @TEXI2DVI@ $(TEXINCLUDES)
- # The install-dvi target is already defined by automake.
- 
- installdirs-dvi:
--	$(mkdir_p) $(DESTDIR)$(dvidir)
-+	$(MKDIR_P) $(DESTDIR)$(dvidir)
- 
- uninstall-dvi:
- 	$(RM) $(DESTDIR)$(dvidir)/libunistring.dvi
-@@ -105,7 +105,7 @@ libunistring.ps: libunistring.dvi
- # The install-ps target is already defined by automake.
- 
- installdirs-ps:
--	$(mkdir_p) $(DESTDIR)$(psdir)
-+	$(MKDIR_P) $(DESTDIR)$(psdir)
- 
- uninstall-ps:
- 	$(RM) $(DESTDIR)$(psdir)/libunistring.ps
-@@ -120,7 +120,7 @@ TEXI2PDF = @TEXI2DVI@ --pdf $(TEXINCLUDE
- # The install-pdf target is already defined by automake.
- 
- installdirs-pdf:
--	$(mkdir_p) $(DESTDIR)$(pdfdir)
-+	$(MKDIR_P) $(DESTDIR)$(pdfdir)
- 
- uninstall-pdf:
- 	$(RM) $(DESTDIR)$(pdfdir)/libunistring.pdf
-@@ -151,17 +151,17 @@ libunistring_toc.html: libunistring.texi
- 	   }
- 
- install-html-monolithic: libunistring.html
--	$(mkdir_p) $(DESTDIR)$(htmldir)
-+	$(MKDIR_P) $(DESTDIR)$(htmldir)
- 	$(INSTALL_DATA) `if test -f libunistring.html; then echo .; else echo $(srcdir); fi`/libunistring.html $(DESTDIR)$(htmldir)/libunistring.html
- 
- install-html-split: libunistring_toc.html
--	$(mkdir_p) $(DESTDIR)$(htmldir)
-+	$(MKDIR_P) $(DESTDIR)$(htmldir)
- 	for file in `if test -f libunistring_toc.html; then echo .; else echo $(srcdir); fi`/libunistring_*.html; do \
- 	  $(INSTALL_DATA) $$file $(DESTDIR)$(htmldir)/`basename $$file`; \
- 	done
- 
- installdirs-html:
--	$(mkdir_p) $(DESTDIR)$(htmldir)
-+	$(MKDIR_P) $(DESTDIR)$(htmldir)
- 
- uninstall-html-monolithic:
- 	$(RM) $(DESTDIR)$(htmldir)/libunistring.html
-@@ -170,14 +170,14 @@ uninstall-html-split:
- 	$(RM) $(DESTDIR)$(htmldir)/libunistring_*.html
- 
- dist-html-monolithic:
--	$(mkdir_p) $(distdir)/
-+	$(MKDIR_P) $(distdir)/
- 	file=libunistring.html; \
- 	if test -f $$file; then d=.; else d=$(srcdir); fi; \
- 	cp -p $$d/$$file $(distdir)/$$file || exit 1
- 
- # We would like to put libunistring_*.html into EXTRA_DIST, but it doesn't work.
- dist-html-split: libunistring_toc.html
--	$(mkdir_p) $(distdir)/
-+	$(MKDIR_P) $(distdir)/
- 	file=libunistring_toc.html; \
- 	if test -f $$file; then d=.; else d=$(srcdir); fi; \
- 	for file in `cd $$d && echo libunistring_*.html`; do \
diff --git a/meta/recipes-support/libunistring/libunistring/parallelmake.patch b/meta/recipes-support/libunistring/libunistring/parallelmake.patch
deleted file mode 100644
index 21025b8..0000000
--- a/meta/recipes-support/libunistring/libunistring/parallelmake.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-Fix a parallel make race where cdefs.h uses the unused-parameter.h header file
-but has no dependency listed. This can result in an empty cdefs.h file which 
-results in a build failure like:
-
-| In file included from striconveh.c:30:0:
-| unistr.h:193:48: error: expected ';', ',' or ')' before '_GL_UNUSED_PARAMETER'
-| In file included from striconveh.c:30:0:
-| unistr.h:263:54: error: expected ';', ',' or ')' before '_GL_UNUSED_PARAMETER'
-
-Upstream-Status: Pending
-
-RP 2012/4/12
-
-Index: libunistring-0.9.3/lib/Makefile.am
-===================================================================
---- libunistring-0.9.3.orig/lib/Makefile.am	2012-04-12 07:45:41.450059820 +0000
-+++ libunistring-0.9.3/lib/Makefile.am	2012-04-12 07:48:45.434055559 +0000
-@@ -157,7 +157,7 @@
- 
- # unistring/cdefs.h is not public, but is included by other header files.
- nobase_nodist_include_HEADERS += unistring/cdefs.h
--unistring/cdefs.h : unistring/cdefs.in.h
-+unistring/cdefs.h : unistring/cdefs.in.h $(UNUSED_PARAMETER_H)
- 	@MKDIR_P@ unistring
- 	rm -f $@-t $@
- 	sed -e '/definition of _GL_UNUSED_PARAMETER/r $(UNUSED_PARAMETER_H)' \
diff --git a/meta/recipes-support/libunistring/libunistring_0.9.3.bb b/meta/recipes-support/libunistring/libunistring_0.9.3.bb
deleted file mode 100644
index db1651b..0000000
--- a/meta/recipes-support/libunistring/libunistring_0.9.3.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "Library for manipulating C and Unicode strings"
-
-DESCRIPTION = "Text files are nowadays usually encoded in Unicode, and may\
- consist of very different scripts from Latin letters to Chinese Hanzi\
- with many kinds of special characters accents, right-to-left writing\
- marks, hyphens, Roman numbers, and much more. But the POSIX platform\
- APIs for text do not contain adequate functions for dealing with\
- particular properties of many Unicode characters. In fact, the POSIX\
- APIs for text have several assumptions at their base which don't hold\
- for Unicode text.  This library provides functions for manipulating\
- Unicode strings and for manipulating C strings according to the Unicode\
- standard.  This package contains documentation."
-
-HOMEPAGE = "http://www.gnu.org/software/libunistring/"
-SECTION = "devel"
-LICENSE = "GPLv3&LGPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6" 
-
-SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
-           file://parallelmake.patch \
-           file://libunistring_fix_for_automake_1.12.patch \
-           file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
-"
-
-SRC_URI[md5sum] = "db8eca3b64163abadf8c40e5cecc261f"
-SRC_URI[sha256sum] = "610d3ec724fbdaa654afe3cff20b9f4d504be3fd296fded2e0f7f764041006a3"
-
-PR = "r3"
-
-inherit autotools texinfo
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/libunistring/libunistring_0.9.4.bb b/meta/recipes-support/libunistring/libunistring_0.9.4.bb
new file mode 100644
index 0000000..89b1dc2
--- /dev/null
+++ b/meta/recipes-support/libunistring/libunistring_0.9.4.bb
@@ -0,0 +1,28 @@
+SUMMARY = "Library for manipulating C and Unicode strings"
+
+DESCRIPTION = "Text files are nowadays usually encoded in Unicode, and may\
+ consist of very different scripts from Latin letters to Chinese Hanzi\
+ with many kinds of special characters accents, right-to-left writing\
+ marks, hyphens, Roman numbers, and much more. But the POSIX platform\
+ APIs for text do not contain adequate functions for dealing with\
+ particular properties of many Unicode characters. In fact, the POSIX\
+ APIs for text have several assumptions at their base which don't hold\
+ for Unicode text.  This library provides functions for manipulating\
+ Unicode strings and for manipulating C strings according to the Unicode\
+ standard.  This package contains documentation."
+
+HOMEPAGE = "http://www.gnu.org/software/libunistring/"
+SECTION = "devel"
+LICENSE = "GPLv3&LGPLv3"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LIB;md5=6a6a8e020838b23406c81b19c1d46df6" 
+
+SRC_URI = "${GNU_MIRROR}/libunistring/libunistring-${PV}.tar.gz \
+           file://iconv-m4-remove-the-test-to-convert-euc-jp.patch \
+"
+
+SRC_URI[md5sum] = "c24a6a3838d9ad4a41a62549312c4226"
+SRC_URI[sha256sum] = "f5246d63286a42902dc096d6d44541fbe4204b6c02d6d5d28b457c9882ddd8a6"
+
+inherit autotools texinfo
+BBCLASSEXTEND = "native nativesdk"
-- 
2.0.2


