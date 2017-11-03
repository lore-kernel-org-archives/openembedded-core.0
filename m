Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f41.google.com (mail-pg0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 88EEE77BD2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Nov 2017 19:54:53 +0000 (UTC)
Received: by mail-pg0-f41.google.com with SMTP id b192so3343139pga.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Nov 2017 12:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=LUi3kCyScU6mbbrT7a5vb4wd+lSgTSzm08Yrj9fjmwQ=;
	b=TmBHK4gcLvDRLKNcjl7ivF+A7djpgEi+XJUZil359Y2dPvii5eNa1/XMbu3jmouCwS
	qWFT4nR1MsXG5YBoGCe7c3wZVTnQqRfLkzrBLzWGbCbzObOf9D2n5EX7ZtrvhT0i6szU
	2QjqYTBs2niim6eanTWfXT/ZukxEigNsharkGDJgRvTXJnglrLp/kBZpDBXze8qmSOhP
	ssDpwtspPbY/62v/Mc6MraBU8O+9JqOk0MRadaBOTeTKwCtt8XPlo81wzyS2mX0HOPNP
	S1M5uTdK3Yvt6ncOdcqo1WJFnEQmkX3u0PI13kO7JbGELVZ+JgHSfGFWUFabFrqsKu8z
	fIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LUi3kCyScU6mbbrT7a5vb4wd+lSgTSzm08Yrj9fjmwQ=;
	b=qOhR1SGktz5LS75LlQdTO/mxgb4VPFv7Oa8vq117q4jpkp1LERACiA7kLB66I1MrxP
	yYig+QH6t2sMdHOpWDmV+8N5ipsygVjNec/5PfbR7lwnBIjX94CQLb13k8mUHOjo+7Hk
	jtj/5wfdYmo4BeYRl9ADkiSUXa0i8jSx/xkCKZzNYCIj/esnsN69Y8yCqh1m71ljMHoi
	J3bROt6CjHjvesBwz72TOU2ALsFOu+wljtIvq6t2NNcfwU9Uj24MF4ZDXmcPQdLNJWxr
	AgnKiVNsSrDyMfrVR9F9TD42Wb09TJaBT8BW5pQz/E8vy9NVT1P/pw9VfSNdJjjT0ZGD
	PImA==
X-Gm-Message-State: AMCzsaXd8CSJK07kjSruHfB6IRY2HB1xz93KdWj7k7vfa5lDnpMpXaF5
	nSajrXKFEDcu8Ohv7lF5+js=
X-Google-Smtp-Source: ABhQp+RiKJ2oysyYwmADgEhxpL5j3WKEjR723dp+96/D1I3NljHeMlpwBouhrZJxK7uR46R3/LTppA==
X-Received: by 10.84.160.204 with SMTP id v12mr7597095plg.206.1509738894089;
	Fri, 03 Nov 2017 12:54:54 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4001:9ea0:78e5:dcc3:4839:af44])
	by smtp.gmail.com with ESMTPSA id
	c26sm12781112pfl.115.2017.11.03.12.54.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 03 Nov 2017 12:54:53 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Fri,  3 Nov 2017 12:54:35 -0700
Message-Id: <2732988f1b8a2a97cdabf48589fb6401fa20b9b1.1509738544.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1509738544.git.akuster808@gmail.com>
References: <cover.1509738544.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 01/15] tzcode-native: update to 2017c
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
X-List-Received-Date: Fri, 03 Nov 2017 19:54:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

LICENSE changes do to rewording
https://github.com/eggert/tz/commit/7097a652778d35acf747d14f8bf7b3ced479bbc0#diff-9879d6db96fd29134fc802214163b95a

Backported to fixes from upstream too.

Changes to code

    zic and the reference runtime now reject multiple leap seconds
    within 28 days of each other, or leap seconds before the Epoch.
    As a result, support for double leap seconds, which was
    obsolescent and undocumented, has been removed.  Double leap
    seconds were an error in the C89 standard; they have never existed
    in civil timekeeping.  (Thanks to Robert Elz and Bradley White for
    noticing glitches in the code that uncovered this problem.)

    zic now warns about use of the obsolescent and undocumented -y
    option, and about use of the obsolescent TYPE field of Rule lines.

    zic now allows unambiguous abbreviations like "Sa" and "Su" for
    weekdays; formerly it rejected them due to a bug.  Conversely, zic
    no longer considers non-prefixes to be abbreviations; for example,
    it no longer accepts "lF" as an abbreviation for "lastFriday".
    Also, zic warns about the undocumented usage with a "last-"
    prefix, e.g., "last-Fri".

    Similarly, zic now accepts the unambiguous abbreviation "L" for
    "Link" in ordinary context and for "Leap" in leap-second context.
    Conversely, zic no longer accepts non-prefixes such as "La" as
    abbreviations for words like "Leap".

    zic no longer accepts leap second lines in ordinary input, or
    ordinary lines in leap second input.  Formerly, zic sometimes
    warned about this undocumented usage and handled it incorrectly.

    The new macro HAVE_TZNAME governs whether the tzname external
    variable is exported, instead of USG_COMPAT.  USG_COMPAT now
    governs only the external variables "timezone" and "daylight".
    This change is needed because the three variables are not in the
    same category: although POSIX requires tzname, it specifies the
    other two variables as optional.  Also, USG_COMPAT is now 1 or 0:
    if not defined, the code attempts to guess it from other macros.

    localtime.c and difftime.c no longer require stdio.h, and .c files
    other than zic.c no longer require sys/wait.h.

    zdump.c no longer assumes snprintf.  (Reported by Jonathan Leffler.)

    Calculation of time_t extrema works around a bug in GCC 4.8.4
    (Reported by Stan Shebs and Joseph Myers.)

    zic.c no longer mistranslates formats of line numbers in non-English
    locales.  (Problem reported by Benno Schulenberg.)

    Several minor changes have been made to the code to make it a
    bit easier to port to MS-Windows and Solaris.  (Thanks to Kees
    Dekker for reporting the problems.)

  Changes to documentation and commentary

    The two new files 'theory.html' and 'calendars' contain the
    contents of the removed file 'Theory'.  The goal is to document
    tzdb theory more accessibly.

    The zic man page now documents abbreviation rules.

    tz-link.htm now covers how to apply tzdata changes to clients.
    (Thanks to Jorge Fábregas for the AIX link.)  It also mentions MySQL.

    The leap-seconds.list URL has been updated to something that is
    more reliable for tzdb.  (Thanks to Tim Parenti and Brian Inglis.)

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../files/0001-Fix-Makefile-quoting-bug.patch      | 174 +++++++++++++++++++++
 .../files/0002-Port-zdump-to-C90-snprintf.patch    | 115 ++++++++++++++
 ...code-native_2017b.bb => tzcode-native_2017c.bb} |  15 +-
 3 files changed, 298 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
 create mode 100644 meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
 rename meta/recipes-extended/tzcode/{tzcode-native_2017b.bb => tzcode-native_2017c.bb} (54%)

diff --git a/meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch b/meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
new file mode 100644
index 0000000..e49fa09
--- /dev/null
+++ b/meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
@@ -0,0 +1,174 @@
+From b520d20b8122a783f99f088758b78d928f70ee34 Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 23 Oct 2017 11:42:45 -0700
+Subject: [PATCH] Fix Makefile quoting bug
+
+Problem with INSTALLARGS reported by Zefram in:
+https://mm.icann.org/pipermail/tz/2017-October/025360.html
+Fix similar problems too.
+* Makefile (ZIC_INSTALL, VALIDATE_ENV, CC, install)
+(INSTALL, version, INSTALLARGS, right_posix, posix_right)
+(check_public): Use apostrophes to prevent undesirable
+interpretation of names by the shell.  We still do not support
+directory names containing apostrophes or newlines, but this is
+good enough.
+
+Upstream-Status: Backport
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+* NEWS: Mention this.
+---
+ Makefile | 64 ++++++++++++++++++++++++++++++++--------------------------------
+ NEWS     |  8 ++++++++
+ 2 files changed, 40 insertions(+), 32 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index c92edc0..97649ca 100644
+--- a/Makefile
++++ b/Makefile
+@@ -313,7 +313,7 @@ ZFLAGS=
+ 
+ # How to use zic to install tz binary files.
+ 
+-ZIC_INSTALL=	$(ZIC) -d $(DESTDIR)$(TZDIR) $(LEAPSECONDS)
++ZIC_INSTALL=	$(ZIC) -d '$(DESTDIR)$(TZDIR)' $(LEAPSECONDS)
+ 
+ # The name of a Posix-compliant 'awk' on your system.
+ AWK=		awk
+@@ -341,8 +341,8 @@ SGML_CATALOG_FILES= \
+ VALIDATE = nsgmls
+ VALIDATE_FLAGS = -s -B -wall -wno-unused-param
+ VALIDATE_ENV = \
+-  SGML_CATALOG_FILES=$(SGML_CATALOG_FILES) \
+-  SGML_SEARCH_PATH=$(SGML_SEARCH_PATH) \
++  SGML_CATALOG_FILES='$(SGML_CATALOG_FILES)' \
++  SGML_SEARCH_PATH='$(SGML_SEARCH_PATH)' \
+   SP_CHARSET_FIXED=YES \
+   SP_ENCODING=UTF-8
+ 
+@@ -396,7 +396,7 @@ GZIPFLAGS=	-9n
+ #MAKE=		make
+ 
+ cc=		cc
+-CC=		$(cc) -DTZDIR=\"$(TZDIR)\"
++CC=		$(cc) -DTZDIR='"$(TZDIR)"'
+ 
+ AR=		ar
+ 
+@@ -473,29 +473,29 @@ all:		tzselect yearistype zic zdump libtz.a $(TABDATA)
+ ALL:		all date $(ENCHILADA)
+ 
+ install:	all $(DATA) $(REDO) $(MANS)
+-		mkdir -p $(DESTDIR)$(ETCDIR) $(DESTDIR)$(TZDIR) \
+-			$(DESTDIR)$(LIBDIR) \
+-			$(DESTDIR)$(MANDIR)/man3 $(DESTDIR)$(MANDIR)/man5 \
+-			$(DESTDIR)$(MANDIR)/man8
++		mkdir -p '$(DESTDIR)$(ETCDIR)' '$(DESTDIR)$(TZDIR)' \
++			'$(DESTDIR)$(LIBDIR)' \
++			'$(DESTDIR)$(MANDIR)/man3' '$(DESTDIR)$(MANDIR)/man5' \
++			'$(DESTDIR)$(MANDIR)/man8'
+ 		$(ZIC_INSTALL) -l $(LOCALTIME) -p $(POSIXRULES)
+-		cp -f $(TABDATA) $(DESTDIR)$(TZDIR)/.
+-		cp tzselect zic zdump $(DESTDIR)$(ETCDIR)/.
+-		cp libtz.a $(DESTDIR)$(LIBDIR)/.
+-		$(RANLIB) $(DESTDIR)$(LIBDIR)/libtz.a
+-		cp -f newctime.3 newtzset.3 $(DESTDIR)$(MANDIR)/man3/.
+-		cp -f tzfile.5 $(DESTDIR)$(MANDIR)/man5/.
+-		cp -f tzselect.8 zdump.8 zic.8 $(DESTDIR)$(MANDIR)/man8/.
++		cp -f $(TABDATA) '$(DESTDIR)$(TZDIR)/.'
++		cp tzselect zic zdump '$(DESTDIR)$(ETCDIR)/.'
++		cp libtz.a '$(DESTDIR)$(LIBDIR)/.'
++		$(RANLIB) '$(DESTDIR)$(LIBDIR)/libtz.a'
++		cp -f newctime.3 newtzset.3 '$(DESTDIR)$(MANDIR)/man3/.'
++		cp -f tzfile.5 '$(DESTDIR)$(MANDIR)/man5/.'
++		cp -f tzselect.8 zdump.8 zic.8 '$(DESTDIR)$(MANDIR)/man8/.'
+ 
+ INSTALL:	ALL install date.1
+-		mkdir -p $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)/man1
+-		cp date $(DESTDIR)$(BINDIR)/.
+-		cp -f date.1 $(DESTDIR)$(MANDIR)/man1/.
++		mkdir -p '$(DESTDIR)$(BINDIR)' '$(DESTDIR)$(MANDIR)/man1'
++		cp date '$(DESTDIR)$(BINDIR)/.'
++		cp -f date.1 '$(DESTDIR)$(MANDIR)/man1/.'
+ 
+ version:	$(VERSION_DEPS)
+ 		{ (type git) >/dev/null 2>&1 && \
+ 		  V=`git describe --match '[0-9][0-9][0-9][0-9][a-z]*' \
+ 				--abbrev=7 --dirty` || \
+-		  V=$(VERSION); } && \
++		  V='$(VERSION)'; } && \
+ 		printf '%s\n' "$$V" >$@.out
+ 		mv $@.out $@
+ 
+@@ -529,12 +529,12 @@ leapseconds:	$(LEAP_DEPS)
+ # Arguments to pass to submakes of install_data.
+ # They can be overridden by later submake arguments.
+ INSTALLARGS = \
+- BACKWARD=$(BACKWARD) \
+- DESTDIR=$(DESTDIR) \
++ BACKWARD='$(BACKWARD)' \
++ DESTDIR='$(DESTDIR)' \
+  LEAPSECONDS='$(LEAPSECONDS)' \
+  PACKRATDATA='$(PACKRATDATA)' \
+- TZDIR=$(TZDIR) \
+- YEARISTYPE=$(YEARISTYPE) \
++ TZDIR='$(TZDIR)' \
++ YEARISTYPE='$(YEARISTYPE)' \
+  ZIC='$(ZIC)'
+ 
+ # 'make install_data' installs one set of tz binary files.
+@@ -558,16 +558,16 @@ right_only:
+ # You must replace all of $(TZDIR) to switch from not using leap seconds
+ # to using them, or vice versa.
+ right_posix:	right_only
+-		rm -fr $(DESTDIR)$(TZDIR)-leaps
+-		ln -s $(TZDIR_BASENAME) $(DESTDIR)$(TZDIR)-leaps || \
+-		  $(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-leaps right_only
+-		$(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-posix posix_only
++		rm -fr '$(DESTDIR)$(TZDIR)-leaps'
++		ln -s '$(TZDIR_BASENAME)' '$(DESTDIR)$(TZDIR)-leaps' || \
++		  $(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-leaps' right_only
++		$(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-posix' posix_only
+ 
+ posix_right:	posix_only
+-		rm -fr $(DESTDIR)$(TZDIR)-posix
+-		ln -s $(TZDIR_BASENAME) $(DESTDIR)$(TZDIR)-posix || \
+-		  $(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-posix posix_only
+-		$(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-leaps right_only
++		rm -fr '$(DESTDIR)$(TZDIR)-posix'
++		ln -s '$(TZDIR_BASENAME)' '$(DESTDIR)$(TZDIR)-posix' || \
++		  $(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-posix' posix_only
++		$(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-leaps' right_only
+ 
+ # This obsolescent rule is present for backwards compatibility with
+ # tz releases 2014g through 2015g.  It should go away eventually.
+@@ -764,7 +764,7 @@ set-timestamps.out: $(ENCHILADA)
+ 
+ check_public:
+ 		$(MAKE) maintainer-clean
+-		$(MAKE) "CFLAGS=$(GCC_DEBUG_FLAGS)" ALL
++		$(MAKE) CFLAGS='$(GCC_DEBUG_FLAGS)' ALL
+ 		mkdir -p public.dir
+ 		for i in $(TDATA) tzdata.zi; do \
+ 		  $(zic) -v -d public.dir $$i 2>&1 || exit; \
+diff --git a/NEWS b/NEWS
+index bd2bec2..75ab095 100644
+--- a/NEWS
++++ b/NEWS
+@@ -1,5 +1,13 @@
+ News for the tz database
+ 
++Unreleased, experimental changes
++
++  Changes to build procedure
++
++    The Makefile now quotes values like BACKWARD more carefully when
++    passing them to the shell.  (Problem reported by Zefram.)
++
++
+ Release 2017c - 2017-10-20 14:49:34 -0700
+ 
+   Briefly:
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch b/meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
new file mode 100644
index 0000000..87afe47
--- /dev/null
+++ b/meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
@@ -0,0 +1,115 @@
+From e231da4fb2beb17c60b4b1a5c276366d6a6e433f Mon Sep 17 00:00:00 2001
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Mon, 23 Oct 2017 17:58:36 -0700
+Subject: [PATCH] Port zdump to C90 + snprintf
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Problem reported by Jon Skeet in:
+https://mm.icann.org/pipermail/tz/2017-October/025362.html
+* NEWS: Mention this.
+* zdump.c (my_snprintf): New macro or function.  If a macro, it is
+just snprintf.  If a function, it is the same as the old snprintf
+static function, with an ATTRIBUTE_FORMAT to pacify modern GCC.
+All uses of snprintf changed to use my_snprintf.  This way,
+installers don’t need to specify -DHAVE_SNPRINTF if they are using
+a pre-C99 compiler with a library that has snprintf.
+
+Upstream-Status: Backport
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ NEWS    |  4 ++++
+ zdump.c | 29 ++++++++++++++++-------------
+ 2 files changed, 20 insertions(+), 13 deletions(-)
+
+diff --git a/NEWS b/NEWS
+index 75ab095..dea08b8 100644
+--- a/NEWS
++++ b/NEWS
+@@ -7,6 +7,10 @@ Unreleased, experimental changes
+     The Makefile now quotes values like BACKWARD more carefully when
+     passing them to the shell.  (Problem reported by Zefram.)
+ 
++    Builders no longer need to specify -DHAVE_SNPRINTF on platforms
++    that have snprintf and use pre-C99 compilers.  (Problem reported
++    by Jon Skeet.)
++
+ 
+ Release 2017c - 2017-10-20 14:49:34 -0700
+ 
+diff --git a/zdump.c b/zdump.c
+index 8e3bf3e..d4e6084 100644
+--- a/zdump.c
++++ b/zdump.c
+@@ -795,12 +795,14 @@ show(timezone_t tz, char *zone, time_t t, bool v)
+ 		abbrok(abbr(tmp), zone);
+ }
+ 
+-#if !HAVE_SNPRINTF
++#if HAVE_SNPRINTF
++# define my_snprintf snprintf
++#else
+ # include <stdarg.h>
+ 
+ /* A substitute for snprintf that is good enough for zdump.  */
+-static int
+-snprintf(char *s, size_t size, char const *format, ...)
++static int ATTRIBUTE_FORMAT((printf, 3, 4))
++my_snprintf(char *s, size_t size, char const *format, ...)
+ {
+   int n;
+   va_list args;
+@@ -839,10 +841,10 @@ format_local_time(char *buf, size_t size, struct tm const *tm)
+ {
+   int ss = tm->tm_sec, mm = tm->tm_min, hh = tm->tm_hour;
+   return (ss
+-	  ? snprintf(buf, size, "%02d:%02d:%02d", hh, mm, ss)
++	  ? my_snprintf(buf, size, "%02d:%02d:%02d", hh, mm, ss)
+ 	  : mm
+-	  ? snprintf(buf, size, "%02d:%02d", hh, mm)
+-	  : snprintf(buf, size, "%02d", hh));
++	  ? my_snprintf(buf, size, "%02d:%02d", hh, mm)
++	  : my_snprintf(buf, size, "%02d", hh));
+ }
+ 
+ /* Store into BUF, of size SIZE, a formatted UTC offset for the
+@@ -877,10 +879,10 @@ format_utc_offset(char *buf, size_t size, struct tm const *tm, time_t t)
+   mm = off / 60 % 60;
+   hh = off / 60 / 60;
+   return (ss || 100 <= hh
+-	  ? snprintf(buf, size, "%c%02ld%02d%02d", sign, hh, mm, ss)
++	  ? my_snprintf(buf, size, "%c%02ld%02d%02d", sign, hh, mm, ss)
+ 	  : mm
+-	  ? snprintf(buf, size, "%c%02ld%02d", sign, hh, mm)
+-	  : snprintf(buf, size, "%c%02ld", sign, hh));
++	  ? my_snprintf(buf, size, "%c%02ld%02d", sign, hh, mm)
++	  : my_snprintf(buf, size, "%c%02ld", sign, hh));
+ }
+ 
+ /* Store into BUF (of size SIZE) a quoted string representation of P.
+@@ -983,15 +985,16 @@ istrftime(char *buf, size_t size, char const *time_fmt,
+ 	    for (abp = ab; is_alpha(*abp); abp++)
+ 	      continue;
+ 	    len = (!*abp && *ab
+-		   ? snprintf(b, s, "%s", ab)
++		   ? my_snprintf(b, s, "%s", ab)
+ 		   : format_quoted_string(b, s, ab));
+ 	    if (s <= len)
+ 	      return false;
+ 	    b += len, s -= len;
+ 	  }
+-	  formatted_len = (tm->tm_isdst
+-			   ? snprintf(b, s, &"\t\t%d"[show_abbr], tm->tm_isdst)
+-			   : 0);
++	  formatted_len
++	    = (tm->tm_isdst
++	       ? my_snprintf(b, s, &"\t\t%d"[show_abbr], tm->tm_isdst)
++	       : 0);
+ 	}
+ 	break;
+       }
+-- 
+2.7.4
+
diff --git a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb b/meta/recipes-extended/tzcode/tzcode-native_2017c.bb
similarity index 54%
rename from meta/recipes-extended/tzcode/tzcode-native_2017b.bb
rename to meta/recipes-extended/tzcode/tzcode-native_2017c.bb
index 165d2c6..aeaef72 100644
--- a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
+++ b/meta/recipes-extended/tzcode/tzcode-native_2017c.bb
@@ -3,16 +3,19 @@
 SUMMARY = "tzcode, timezone zoneinfo utils -- zic, zdump, tzselect"
 LICENSE = "PD & BSD & BSD-3-Clause"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=ef1a352b901ee7b75a75df8171d6aca7"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
-           http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata"
+           http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
+           file://0001-Fix-Makefile-quoting-bug.patch \
+           file://0002-Port-zdump-to-C90-snprintf.patch"
+
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.md5sum] = "afaf15deb13759e8b543d86350385b16"
-SRC_URI[tzcode.sha256sum] = "4d1735bb54e22b8d7443d4d1f1a13d007ae11be79a35e51f8e8322fb8e292d40"
-SRC_URI[tzdata.md5sum] = "50dc0dc50c68644c1f70804f2e7a1625"
-SRC_URI[tzdata.sha256sum] = "f8242a522ea3496b0ce4ff4f2e75a049178da21001a08b8e666d8cbe07d18086"
+SRC_URI[tzcode.md5sum] = "2fe6986231db5182c61d565021a0cd7b"
+SRC_URI[tzcode.sha256sum] = "81e8b4bc23e60906640c266bbff3789661e22f0fa29fe61b96ec7c2816c079b7"
+SRC_URI[tzdata.md5sum] = "1e751e7e08f8b68530674f04619d894d"
+SRC_URI[tzdata.sha256sum] = "d6543f92a929826318e2f44ff3a7611ce5f565a43e10250b42599d0ba4cbd90b"
 
 S = "${WORKDIR}"
 
-- 
2.7.4


