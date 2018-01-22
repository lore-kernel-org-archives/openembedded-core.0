Return-Path: <akuster808@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id DF208771F5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 23:08:43 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id f4so25286096qtj.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jan 2018 15:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=krJtxYHnOUQ/mp0lbqCIbwkO58wQLYc8Yz3esRcDvcA=;
	b=fjde6IFHneTh9o+vxO1zJcBKvvzt099ugqbEj8a9Gj5xb/awWmePOZ1PiOcg6R/ro2
	3ktAA6a+j3lZ4i0WDD571ixhyMgUMAG5bP+8i1tSpginKhyjYWhlVojcw+cOQn7VjBlN
	pjPciBdrUyDZ6lE04kbqD4Ve9Uu8oYbx+6bwCzU2K0mhlqxRBvpMk9MlpZoAyOdDhycE
	hf68IBS/sgVj8ZXdWJnfovnZza/XoQ+s+vq85qEJmPv1LH39sN3/rFZZvE2tTooc3DHm
	U2oz/VmJcVDYDDwK1E5VjzxFewaTJGlNQ0umtZYzh+Mipg+vPksSg+y3hqiuIjpbERSW
	ZsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=krJtxYHnOUQ/mp0lbqCIbwkO58wQLYc8Yz3esRcDvcA=;
	b=XYjJNehcIX6Sf8bt6KxORIR4wQQWEXy5gz2N007ERdoVY6o7SWfkcSKFNMLpUA2KSz
	+C/vKmAx0bjGOijic6dheklqlQHwCIsjaCOohGjm75dv2O+ZzEftWMjCHtTm72mAj8JE
	MTAjM6YKSy+MDDfCX01tsjsCF73MUCmaoFxc7kqER5zkkOvjLpqh531l9aoTxSDj4nVs
	RVlKYErfGezFUdSftQUeDAb4StrvANMyt943wJz4jmFE3kAc9blHPHc6FLtJfR6pFVXS
	Zi6NAGXSc1f0iqsZSx/1GFfEosH05/TTOkZgxBuqk3OjsGf3KI3WQHduz+1exo1/YOyY
	76LQ==
X-Gm-Message-State: AKwxytcGXDkfqQkb/oSCRFkIU9hDpHevIWZU1I+iBjkhC7eyO9uYrd65
	uOgxNq+A/kK7XjHC8emyHPQ=
X-Google-Smtp-Source: AH8x225we640TzOKHyJuHS3s8LN6IFH68SMgOR1z/aYBWWWLTAl4Ib0br/5p4USrV5gNXYDO5q2NMA==
X-Received: by 10.237.46.66 with SMTP id j60mr721411qtd.113.1516662524580;
	Mon, 22 Jan 2018 15:08:44 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4000:1184:c85d:e2c0:793e:901c])
	by smtp.gmail.com with ESMTPSA id
	a27sm11212357qkj.94.2018.01.22.15.08.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Jan 2018 15:08:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Mon, 22 Jan 2018 15:08:39 -0800
Message-Id: <1516662521-18942-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 1/3] tzcode-native: update to 2018b
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
X-List-Received-Date: Mon, 22 Jan 2018 23:08:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

removed patch now include in update

Release 2018b - 2018-01-17 23:24:48 -0800

  Briefly:
  Fix a packaging problem in tz2018a, which was missing 'pacificnew'.

  Changes to build procedure

     The distribution now contains the file 'pacificnew' again.
     This file was inadvertantly omitted in the 2018a distribution.
     (Problem reported by Matias Fonzo.)

Release 2018a - 2018-01-12 22:29:21 -0800

Changes to code

    zic has a new option -t FILE that specifies the location of the
    file that determines local time when TZ is unset.  The default for
    this location can be configured via the new TZDEFAULT makefile
    macro, which defaults to /etc/localtime.

    Diagnostics and commentary now distinguish UT from UTC more
    carefully; see theory.html for more information about UT vs UTC.

    zic has been ported to GCC 8's -Wstringop-truncation option.
    (Problem reported by Martin Sebor.)

  Changes to documentation and commentary

    The zic man page now documents the longstanding behavior that
    times and years can be out of the usual range, with negative times
    counting backwards from midnight and with year 0 preceding year 1.
    (Problem reported by Michael Deckers.)

    The theory.html file now mentions the POSIX limit of six chars
    per abbreviation, and lists alphabetic abbreviations used.

    The files tz-art.htm and tz-link.htm have been renamed to
    tz-art.html and tz-link.html, respectively, for consistency with
    other file names and to simplify web server configuration.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/0001-Fix-Makefile-quoting-bug.patch      | 174 ---------------------
 .../files/0002-Port-zdump-to-C90-snprintf.patch    | 115 --------------
 ...code-native_2017c.bb => tzcode-native_2018b.bb} |  11 +-
 3 files changed, 5 insertions(+), 295 deletions(-)
 delete mode 100644 meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
 delete mode 100644 meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2017c.bb => tzcode-native_2018b.bb} (63%)

diff --git a/meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch b/meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
deleted file mode 100644
index e49fa09..0000000
--- a/meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
+++ /dev/null
@@ -1,174 +0,0 @@
-From b520d20b8122a783f99f088758b78d928f70ee34 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Mon, 23 Oct 2017 11:42:45 -0700
-Subject: [PATCH] Fix Makefile quoting bug
-
-Problem with INSTALLARGS reported by Zefram in:
-https://mm.icann.org/pipermail/tz/2017-October/025360.html
-Fix similar problems too.
-* Makefile (ZIC_INSTALL, VALIDATE_ENV, CC, install)
-(INSTALL, version, INSTALLARGS, right_posix, posix_right)
-(check_public): Use apostrophes to prevent undesirable
-interpretation of names by the shell.  We still do not support
-directory names containing apostrophes or newlines, but this is
-good enough.
-
-Upstream-Status: Backport
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
-* NEWS: Mention this.
----
- Makefile | 64 ++++++++++++++++++++++++++++++++--------------------------------
- NEWS     |  8 ++++++++
- 2 files changed, 40 insertions(+), 32 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index c92edc0..97649ca 100644
---- a/Makefile
-+++ b/Makefile
-@@ -313,7 +313,7 @@ ZFLAGS=
- 
- # How to use zic to install tz binary files.
- 
--ZIC_INSTALL=	$(ZIC) -d $(DESTDIR)$(TZDIR) $(LEAPSECONDS)
-+ZIC_INSTALL=	$(ZIC) -d '$(DESTDIR)$(TZDIR)' $(LEAPSECONDS)
- 
- # The name of a Posix-compliant 'awk' on your system.
- AWK=		awk
-@@ -341,8 +341,8 @@ SGML_CATALOG_FILES= \
- VALIDATE = nsgmls
- VALIDATE_FLAGS = -s -B -wall -wno-unused-param
- VALIDATE_ENV = \
--  SGML_CATALOG_FILES=$(SGML_CATALOG_FILES) \
--  SGML_SEARCH_PATH=$(SGML_SEARCH_PATH) \
-+  SGML_CATALOG_FILES='$(SGML_CATALOG_FILES)' \
-+  SGML_SEARCH_PATH='$(SGML_SEARCH_PATH)' \
-   SP_CHARSET_FIXED=YES \
-   SP_ENCODING=UTF-8
- 
-@@ -396,7 +396,7 @@ GZIPFLAGS=	-9n
- #MAKE=		make
- 
- cc=		cc
--CC=		$(cc) -DTZDIR=\"$(TZDIR)\"
-+CC=		$(cc) -DTZDIR='"$(TZDIR)"'
- 
- AR=		ar
- 
-@@ -473,29 +473,29 @@ all:		tzselect yearistype zic zdump libtz.a $(TABDATA)
- ALL:		all date $(ENCHILADA)
- 
- install:	all $(DATA) $(REDO) $(MANS)
--		mkdir -p $(DESTDIR)$(ETCDIR) $(DESTDIR)$(TZDIR) \
--			$(DESTDIR)$(LIBDIR) \
--			$(DESTDIR)$(MANDIR)/man3 $(DESTDIR)$(MANDIR)/man5 \
--			$(DESTDIR)$(MANDIR)/man8
-+		mkdir -p '$(DESTDIR)$(ETCDIR)' '$(DESTDIR)$(TZDIR)' \
-+			'$(DESTDIR)$(LIBDIR)' \
-+			'$(DESTDIR)$(MANDIR)/man3' '$(DESTDIR)$(MANDIR)/man5' \
-+			'$(DESTDIR)$(MANDIR)/man8'
- 		$(ZIC_INSTALL) -l $(LOCALTIME) -p $(POSIXRULES)
--		cp -f $(TABDATA) $(DESTDIR)$(TZDIR)/.
--		cp tzselect zic zdump $(DESTDIR)$(ETCDIR)/.
--		cp libtz.a $(DESTDIR)$(LIBDIR)/.
--		$(RANLIB) $(DESTDIR)$(LIBDIR)/libtz.a
--		cp -f newctime.3 newtzset.3 $(DESTDIR)$(MANDIR)/man3/.
--		cp -f tzfile.5 $(DESTDIR)$(MANDIR)/man5/.
--		cp -f tzselect.8 zdump.8 zic.8 $(DESTDIR)$(MANDIR)/man8/.
-+		cp -f $(TABDATA) '$(DESTDIR)$(TZDIR)/.'
-+		cp tzselect zic zdump '$(DESTDIR)$(ETCDIR)/.'
-+		cp libtz.a '$(DESTDIR)$(LIBDIR)/.'
-+		$(RANLIB) '$(DESTDIR)$(LIBDIR)/libtz.a'
-+		cp -f newctime.3 newtzset.3 '$(DESTDIR)$(MANDIR)/man3/.'
-+		cp -f tzfile.5 '$(DESTDIR)$(MANDIR)/man5/.'
-+		cp -f tzselect.8 zdump.8 zic.8 '$(DESTDIR)$(MANDIR)/man8/.'
- 
- INSTALL:	ALL install date.1
--		mkdir -p $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)/man1
--		cp date $(DESTDIR)$(BINDIR)/.
--		cp -f date.1 $(DESTDIR)$(MANDIR)/man1/.
-+		mkdir -p '$(DESTDIR)$(BINDIR)' '$(DESTDIR)$(MANDIR)/man1'
-+		cp date '$(DESTDIR)$(BINDIR)/.'
-+		cp -f date.1 '$(DESTDIR)$(MANDIR)/man1/.'
- 
- version:	$(VERSION_DEPS)
- 		{ (type git) >/dev/null 2>&1 && \
- 		  V=`git describe --match '[0-9][0-9][0-9][0-9][a-z]*' \
- 				--abbrev=7 --dirty` || \
--		  V=$(VERSION); } && \
-+		  V='$(VERSION)'; } && \
- 		printf '%s\n' "$$V" >$@.out
- 		mv $@.out $@
- 
-@@ -529,12 +529,12 @@ leapseconds:	$(LEAP_DEPS)
- # Arguments to pass to submakes of install_data.
- # They can be overridden by later submake arguments.
- INSTALLARGS = \
-- BACKWARD=$(BACKWARD) \
-- DESTDIR=$(DESTDIR) \
-+ BACKWARD='$(BACKWARD)' \
-+ DESTDIR='$(DESTDIR)' \
-  LEAPSECONDS='$(LEAPSECONDS)' \
-  PACKRATDATA='$(PACKRATDATA)' \
-- TZDIR=$(TZDIR) \
-- YEARISTYPE=$(YEARISTYPE) \
-+ TZDIR='$(TZDIR)' \
-+ YEARISTYPE='$(YEARISTYPE)' \
-  ZIC='$(ZIC)'
- 
- # 'make install_data' installs one set of tz binary files.
-@@ -558,16 +558,16 @@ right_only:
- # You must replace all of $(TZDIR) to switch from not using leap seconds
- # to using them, or vice versa.
- right_posix:	right_only
--		rm -fr $(DESTDIR)$(TZDIR)-leaps
--		ln -s $(TZDIR_BASENAME) $(DESTDIR)$(TZDIR)-leaps || \
--		  $(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-leaps right_only
--		$(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-posix posix_only
-+		rm -fr '$(DESTDIR)$(TZDIR)-leaps'
-+		ln -s '$(TZDIR_BASENAME)' '$(DESTDIR)$(TZDIR)-leaps' || \
-+		  $(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-leaps' right_only
-+		$(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-posix' posix_only
- 
- posix_right:	posix_only
--		rm -fr $(DESTDIR)$(TZDIR)-posix
--		ln -s $(TZDIR_BASENAME) $(DESTDIR)$(TZDIR)-posix || \
--		  $(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-posix posix_only
--		$(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-leaps right_only
-+		rm -fr '$(DESTDIR)$(TZDIR)-posix'
-+		ln -s '$(TZDIR_BASENAME)' '$(DESTDIR)$(TZDIR)-posix' || \
-+		  $(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-posix' posix_only
-+		$(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-leaps' right_only
- 
- # This obsolescent rule is present for backwards compatibility with
- # tz releases 2014g through 2015g.  It should go away eventually.
-@@ -764,7 +764,7 @@ set-timestamps.out: $(ENCHILADA)
- 
- check_public:
- 		$(MAKE) maintainer-clean
--		$(MAKE) "CFLAGS=$(GCC_DEBUG_FLAGS)" ALL
-+		$(MAKE) CFLAGS='$(GCC_DEBUG_FLAGS)' ALL
- 		mkdir -p public.dir
- 		for i in $(TDATA) tzdata.zi; do \
- 		  $(zic) -v -d public.dir $$i 2>&1 || exit; \
-diff --git a/NEWS b/NEWS
-index bd2bec2..75ab095 100644
---- a/NEWS
-+++ b/NEWS
-@@ -1,5 +1,13 @@
- News for the tz database
- 
-+Unreleased, experimental changes
-+
-+  Changes to build procedure
-+
-+    The Makefile now quotes values like BACKWARD more carefully when
-+    passing them to the shell.  (Problem reported by Zefram.)
-+
-+
- Release 2017c - 2017-10-20 14:49:34 -0700
- 
-   Briefly:
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch b/meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
deleted file mode 100644
index 87afe47..0000000
--- a/meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From e231da4fb2beb17c60b4b1a5c276366d6a6e433f Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Mon, 23 Oct 2017 17:58:36 -0700
-Subject: [PATCH] Port zdump to C90 + snprintf
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Problem reported by Jon Skeet in:
-https://mm.icann.org/pipermail/tz/2017-October/025362.html
-* NEWS: Mention this.
-* zdump.c (my_snprintf): New macro or function.  If a macro, it is
-just snprintf.  If a function, it is the same as the old snprintf
-static function, with an ATTRIBUTE_FORMAT to pacify modern GCC.
-All uses of snprintf changed to use my_snprintf.  This way,
-installers don’t need to specify -DHAVE_SNPRINTF if they are using
-a pre-C99 compiler with a library that has snprintf.
-
-Upstream-Status: Backport
-Signed-off-by: Armin Kuster <akuster@mvista.com>
-
----
- NEWS    |  4 ++++
- zdump.c | 29 ++++++++++++++++-------------
- 2 files changed, 20 insertions(+), 13 deletions(-)
-
-diff --git a/NEWS b/NEWS
-index 75ab095..dea08b8 100644
---- a/NEWS
-+++ b/NEWS
-@@ -7,6 +7,10 @@ Unreleased, experimental changes
-     The Makefile now quotes values like BACKWARD more carefully when
-     passing them to the shell.  (Problem reported by Zefram.)
- 
-+    Builders no longer need to specify -DHAVE_SNPRINTF on platforms
-+    that have snprintf and use pre-C99 compilers.  (Problem reported
-+    by Jon Skeet.)
-+
- 
- Release 2017c - 2017-10-20 14:49:34 -0700
- 
-diff --git a/zdump.c b/zdump.c
-index 8e3bf3e..d4e6084 100644
---- a/zdump.c
-+++ b/zdump.c
-@@ -795,12 +795,14 @@ show(timezone_t tz, char *zone, time_t t, bool v)
- 		abbrok(abbr(tmp), zone);
- }
- 
--#if !HAVE_SNPRINTF
-+#if HAVE_SNPRINTF
-+# define my_snprintf snprintf
-+#else
- # include <stdarg.h>
- 
- /* A substitute for snprintf that is good enough for zdump.  */
--static int
--snprintf(char *s, size_t size, char const *format, ...)
-+static int ATTRIBUTE_FORMAT((printf, 3, 4))
-+my_snprintf(char *s, size_t size, char const *format, ...)
- {
-   int n;
-   va_list args;
-@@ -839,10 +841,10 @@ format_local_time(char *buf, size_t size, struct tm const *tm)
- {
-   int ss = tm->tm_sec, mm = tm->tm_min, hh = tm->tm_hour;
-   return (ss
--	  ? snprintf(buf, size, "%02d:%02d:%02d", hh, mm, ss)
-+	  ? my_snprintf(buf, size, "%02d:%02d:%02d", hh, mm, ss)
- 	  : mm
--	  ? snprintf(buf, size, "%02d:%02d", hh, mm)
--	  : snprintf(buf, size, "%02d", hh));
-+	  ? my_snprintf(buf, size, "%02d:%02d", hh, mm)
-+	  : my_snprintf(buf, size, "%02d", hh));
- }
- 
- /* Store into BUF, of size SIZE, a formatted UTC offset for the
-@@ -877,10 +879,10 @@ format_utc_offset(char *buf, size_t size, struct tm const *tm, time_t t)
-   mm = off / 60 % 60;
-   hh = off / 60 / 60;
-   return (ss || 100 <= hh
--	  ? snprintf(buf, size, "%c%02ld%02d%02d", sign, hh, mm, ss)
-+	  ? my_snprintf(buf, size, "%c%02ld%02d%02d", sign, hh, mm, ss)
- 	  : mm
--	  ? snprintf(buf, size, "%c%02ld%02d", sign, hh, mm)
--	  : snprintf(buf, size, "%c%02ld", sign, hh));
-+	  ? my_snprintf(buf, size, "%c%02ld%02d", sign, hh, mm)
-+	  : my_snprintf(buf, size, "%c%02ld", sign, hh));
- }
- 
- /* Store into BUF (of size SIZE) a quoted string representation of P.
-@@ -983,15 +985,16 @@ istrftime(char *buf, size_t size, char const *time_fmt,
- 	    for (abp = ab; is_alpha(*abp); abp++)
- 	      continue;
- 	    len = (!*abp && *ab
--		   ? snprintf(b, s, "%s", ab)
-+		   ? my_snprintf(b, s, "%s", ab)
- 		   : format_quoted_string(b, s, ab));
- 	    if (s <= len)
- 	      return false;
- 	    b += len, s -= len;
- 	  }
--	  formatted_len = (tm->tm_isdst
--			   ? snprintf(b, s, &"\t\t%d"[show_abbr], tm->tm_isdst)
--			   : 0);
-+	  formatted_len
-+	    = (tm->tm_isdst
-+	       ? my_snprintf(b, s, &"\t\t%d"[show_abbr], tm->tm_isdst)
-+	       : 0);
- 	}
- 	break;
-       }
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2017c.bb b/meta/recipes-extended/tzcode/tzcode-native_2018b.bb
similarity index 63%
rename from meta/recipes-extended/tzcode/tzcode-native_2017c.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2018b.bb
index aeaef72..39d027c 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2017c.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2018b.bb
@@ -7,15 +7,14 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
-           file://0001-Fix-Makefile-quoting-bug.patch \
-           file://0002-Port-zdump-to-C90-snprintf.patch"
+           "
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "2fe6986231db5182c61d565021a0cd7b"
-SRC_URI[tzcode.sha256sum] = "81e8b4bc23e60906640c266bbff3789661e22f0fa29fe61b96ec7c2816c079b7"
-SRC_URI[tzdata.md5sum] = "1e751e7e08f8b68530674f04619d894d"
-SRC_URI[tzdata.sha256sum] = "d6543f92a929826318e2f44ff3a7611ce5f565a43e10250b42599d0ba4cbd90b"
+SRC_URI[tzcode.md5sum] = "0f18c4c43dd3a5a277b8ca474116dc09"
+SRC_URI[tzcode.sha256sum] = "74d102507fd1098688d4cce8179caf09097245fe01a6fb0d672a9abe9154ab22"
+SRC_URI[tzdata.md5sum] = "967c216d9b5e5f07880187e09d7fd329"
+SRC_URI[tzdata.sha256sum] = "f87540b9050e1b0d772d19058fcb62f54baa505ecebf392ea825713c33bd9848"
 
 S = "${WORKDIR}"
 
-- 
2.7.4


