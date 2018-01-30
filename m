Return-Path: <raj.khem@gmail.com>
Received: from mail-it0-f67.google.com (mail-it0-f67.google.com
	[209.85.214.67])
	by mail.openembedded.org (Postfix) with ESMTP id 489FF71A5E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Jan 2018 06:39:18 +0000 (UTC)
Received: by mail-it0-f67.google.com with SMTP id x128so11275075ite.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jan 2018 22:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=R9h7YlZWKaM/SMDVCzCIHBnneJVEIxivsM8HGsrq/6s=;
	b=N+jyTTM4yn872VLYvt+wKxVQXZ8V4/cPVxsYtTbN1sluNxyD1WRIKHETB45Ywvxkt5
	LKPcUzl+4nM9VvelwGx8bPgnm+ii6WgBTWNbVyoDD0l48mm4aNbMu4B0Tu8NEI5sXQ7y
	VTxOiLoIhmcHjJB+0uM2nAPoMowEUv+N+Q1z97hHIcC0TTqLbnJt0/IZMstfaiQzlqoj
	BnH3HX4df4fLOt47F0Qc4xb5Tjgvfnd/6q0wDDvzwe42Q1BpOWQlY8HWqmBrM5WgoQVO
	Uf9fLalgKslVckZpH9gNLIpodDNjkzwn6fCM07uTaLOat3009IipBlaXW8GuOENGKJFe
	bthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=R9h7YlZWKaM/SMDVCzCIHBnneJVEIxivsM8HGsrq/6s=;
	b=fGNta3iGqeYVqJ6zNe26pn0+HmfcYUhFgLkp32msKEhMxcU2mW3TNTwV+i0fA25lfT
	Ujl2ncK3nCuDSmkPCKWs3ZgQ03s4A+5Utj3cJ8AXly7qzdwUDhFT1O3tAzgxrIq41O5D
	CpyBQW+f8KQFKFN6d3a8WFKudFDpr29jKaoieZgfUcsM+wOO+HBDeQ96Viwt5+AWjVZC
	Pdn1yY4La1O6Pbcyds6qa6ykTGKzMSYJOkeaoHQW2EA7bwNRaNO0d0j48w+0q5qzVuht
	Jdx47XKn+GW8cYYfaDuq3pFBvp6b5/jvRBjIYVOvyj+j++ZemRwxDScrgzJGnG4C/6gO
	ARQg==
X-Gm-Message-State: AKwxyte/xu3wgKbeMa1d/d2Iaq9xUYm1IMNaAV3esVLNj7xqTLVPIKJD
	jexi2W0b6bTnmnbR1/+SwWPOsCv6
X-Google-Smtp-Source: AH8x224nonCoRSdv8as49XvciogN0tmLWuGCWbsH8qyUIP57nCPXLAmge4s7juHAL4RR7nSEGti5zQ==
X-Received: by 10.36.51.201 with SMTP id k192mr31787857itk.71.1517294359749;
	Mon, 29 Jan 2018 22:39:19 -0800 (PST)
Received: from hermes.local ([2601:646:8880:466c:fd41:97d0:e3d:7877])
	by smtp.gmail.com with ESMTPSA id
	r203sm5345360itb.38.2018.01.29.22.39.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jan 2018 22:39:19 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1517265587-84623-1-git-send-email-juro.bystricky@intel.com>
	<1517265587-84623-2-git-send-email-juro.bystricky@intel.com>
	<90d6d504-1abe-43b9-b25c-008de4e96039@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <ac3ea8c3-402e-229a-768c-7c305540b59c@gmail.com>
Date: Mon, 29 Jan 2018 22:39:17 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:58.0)
	Gecko/20100101 Thunderbird/58.0
MIME-Version: 1.0
In-Reply-To: <90d6d504-1abe-43b9-b25c-008de4e96039@gmail.com>
Subject: Re: [PATCH 1/3] tzcode: remove unused patch files
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
X-List-Received-Date: Tue, 30 Jan 2018 06:39:19 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 1/29/18 5:13 PM, akuster808 wrote:
> 
> 
> On 01/29/2018 02:39 PM, Juro Bystricky wrote:
>> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> 
> thanks. For some reason I thought I remove all the old patches...
> 
> hmm, in any case.  Thanks again.

I wonder if we can cook up a script which can check for unused patches, 
it will be very helpful to keep the code tidy
perhaps it already exists and I am the only one who doesn't know

> 
> Armin
>> ---
>>   .../files/0001-Fix-Makefile-quoting-bug.patch      | 174 ---------------------
>>   .../files/0002-Port-zdump-to-C90-snprintf.patch    | 115 --------------
>>   2 files changed, 289 deletions(-)
>>   delete mode 100644 meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
>>   delete mode 100644 meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
>>
>> diff --git a/meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch b/meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
>> deleted file mode 100644
>> index e49fa09..0000000
>> --- a/meta/recipes-extended/tzcode/files/0001-Fix-Makefile-quoting-bug.patch
>> +++ /dev/null
>> @@ -1,174 +0,0 @@
>> -From b520d20b8122a783f99f088758b78d928f70ee34 Mon Sep 17 00:00:00 2001
>> -From: Paul Eggert <eggert@cs.ucla.edu>
>> -Date: Mon, 23 Oct 2017 11:42:45 -0700
>> -Subject: [PATCH] Fix Makefile quoting bug
>> -
>> -Problem with INSTALLARGS reported by Zefram in:
>> -https://mm.icann.org/pipermail/tz/2017-October/025360.html
>> -Fix similar problems too.
>> -* Makefile (ZIC_INSTALL, VALIDATE_ENV, CC, install)
>> -(INSTALL, version, INSTALLARGS, right_posix, posix_right)
>> -(check_public): Use apostrophes to prevent undesirable
>> -interpretation of names by the shell.  We still do not support
>> -directory names containing apostrophes or newlines, but this is
>> -good enough.
>> -
>> -Upstream-Status: Backport
>> -Signed-off-by: Armin Kuster <akuster@mvista.com>
>> -
>> -* NEWS: Mention this.
>> ----
>> - Makefile | 64 ++++++++++++++++++++++++++++++++--------------------------------
>> - NEWS     |  8 ++++++++
>> - 2 files changed, 40 insertions(+), 32 deletions(-)
>> -
>> -diff --git a/Makefile b/Makefile
>> -index c92edc0..97649ca 100644
>> ---- a/Makefile
>> -+++ b/Makefile
>> -@@ -313,7 +313,7 @@ ZFLAGS=
>> -
>> - # How to use zic to install tz binary files.
>> -
>> --ZIC_INSTALL=	$(ZIC) -d $(DESTDIR)$(TZDIR) $(LEAPSECONDS)
>> -+ZIC_INSTALL=	$(ZIC) -d '$(DESTDIR)$(TZDIR)' $(LEAPSECONDS)
>> -
>> - # The name of a Posix-compliant 'awk' on your system.
>> - AWK=		awk
>> -@@ -341,8 +341,8 @@ SGML_CATALOG_FILES= \
>> - VALIDATE = nsgmls
>> - VALIDATE_FLAGS = -s -B -wall -wno-unused-param
>> - VALIDATE_ENV = \
>> --  SGML_CATALOG_FILES=$(SGML_CATALOG_FILES) \
>> --  SGML_SEARCH_PATH=$(SGML_SEARCH_PATH) \
>> -+  SGML_CATALOG_FILES='$(SGML_CATALOG_FILES)' \
>> -+  SGML_SEARCH_PATH='$(SGML_SEARCH_PATH)' \
>> -   SP_CHARSET_FIXED=YES \
>> -   SP_ENCODING=UTF-8
>> -
>> -@@ -396,7 +396,7 @@ GZIPFLAGS=	-9n
>> - #MAKE=		make
>> -
>> - cc=		cc
>> --CC=		$(cc) -DTZDIR=\"$(TZDIR)\"
>> -+CC=		$(cc) -DTZDIR='"$(TZDIR)"'
>> -
>> - AR=		ar
>> -
>> -@@ -473,29 +473,29 @@ all:		tzselect yearistype zic zdump libtz.a $(TABDATA)
>> - ALL:		all date $(ENCHILADA)
>> -
>> - install:	all $(DATA) $(REDO) $(MANS)
>> --		mkdir -p $(DESTDIR)$(ETCDIR) $(DESTDIR)$(TZDIR) \
>> --			$(DESTDIR)$(LIBDIR) \
>> --			$(DESTDIR)$(MANDIR)/man3 $(DESTDIR)$(MANDIR)/man5 \
>> --			$(DESTDIR)$(MANDIR)/man8
>> -+		mkdir -p '$(DESTDIR)$(ETCDIR)' '$(DESTDIR)$(TZDIR)' \
>> -+			'$(DESTDIR)$(LIBDIR)' \
>> -+			'$(DESTDIR)$(MANDIR)/man3' '$(DESTDIR)$(MANDIR)/man5' \
>> -+			'$(DESTDIR)$(MANDIR)/man8'
>> - 		$(ZIC_INSTALL) -l $(LOCALTIME) -p $(POSIXRULES)
>> --		cp -f $(TABDATA) $(DESTDIR)$(TZDIR)/.
>> --		cp tzselect zic zdump $(DESTDIR)$(ETCDIR)/.
>> --		cp libtz.a $(DESTDIR)$(LIBDIR)/.
>> --		$(RANLIB) $(DESTDIR)$(LIBDIR)/libtz.a
>> --		cp -f newctime.3 newtzset.3 $(DESTDIR)$(MANDIR)/man3/.
>> --		cp -f tzfile.5 $(DESTDIR)$(MANDIR)/man5/.
>> --		cp -f tzselect.8 zdump.8 zic.8 $(DESTDIR)$(MANDIR)/man8/.
>> -+		cp -f $(TABDATA) '$(DESTDIR)$(TZDIR)/.'
>> -+		cp tzselect zic zdump '$(DESTDIR)$(ETCDIR)/.'
>> -+		cp libtz.a '$(DESTDIR)$(LIBDIR)/.'
>> -+		$(RANLIB) '$(DESTDIR)$(LIBDIR)/libtz.a'
>> -+		cp -f newctime.3 newtzset.3 '$(DESTDIR)$(MANDIR)/man3/.'
>> -+		cp -f tzfile.5 '$(DESTDIR)$(MANDIR)/man5/.'
>> -+		cp -f tzselect.8 zdump.8 zic.8 '$(DESTDIR)$(MANDIR)/man8/.'
>> -
>> - INSTALL:	ALL install date.1
>> --		mkdir -p $(DESTDIR)$(BINDIR) $(DESTDIR)$(MANDIR)/man1
>> --		cp date $(DESTDIR)$(BINDIR)/.
>> --		cp -f date.1 $(DESTDIR)$(MANDIR)/man1/.
>> -+		mkdir -p '$(DESTDIR)$(BINDIR)' '$(DESTDIR)$(MANDIR)/man1'
>> -+		cp date '$(DESTDIR)$(BINDIR)/.'
>> -+		cp -f date.1 '$(DESTDIR)$(MANDIR)/man1/.'
>> -
>> - version:	$(VERSION_DEPS)
>> - 		{ (type git) >/dev/null 2>&1 && \
>> - 		  V=`git describe --match '[0-9][0-9][0-9][0-9][a-z]*' \
>> - 				--abbrev=7 --dirty` || \
>> --		  V=$(VERSION); } && \
>> -+		  V='$(VERSION)'; } && \
>> - 		printf '%s\n' "$$V" >$@.out
>> - 		mv $@.out $@
>> -
>> -@@ -529,12 +529,12 @@ leapseconds:	$(LEAP_DEPS)
>> - # Arguments to pass to submakes of install_data.
>> - # They can be overridden by later submake arguments.
>> - INSTALLARGS = \
>> -- BACKWARD=$(BACKWARD) \
>> -- DESTDIR=$(DESTDIR) \
>> -+ BACKWARD='$(BACKWARD)' \
>> -+ DESTDIR='$(DESTDIR)' \
>> -  LEAPSECONDS='$(LEAPSECONDS)' \
>> -  PACKRATDATA='$(PACKRATDATA)' \
>> -- TZDIR=$(TZDIR) \
>> -- YEARISTYPE=$(YEARISTYPE) \
>> -+ TZDIR='$(TZDIR)' \
>> -+ YEARISTYPE='$(YEARISTYPE)' \
>> -  ZIC='$(ZIC)'
>> -
>> - # 'make install_data' installs one set of tz binary files.
>> -@@ -558,16 +558,16 @@ right_only:
>> - # You must replace all of $(TZDIR) to switch from not using leap seconds
>> - # to using them, or vice versa.
>> - right_posix:	right_only
>> --		rm -fr $(DESTDIR)$(TZDIR)-leaps
>> --		ln -s $(TZDIR_BASENAME) $(DESTDIR)$(TZDIR)-leaps || \
>> --		  $(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-leaps right_only
>> --		$(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-posix posix_only
>> -+		rm -fr '$(DESTDIR)$(TZDIR)-leaps'
>> -+		ln -s '$(TZDIR_BASENAME)' '$(DESTDIR)$(TZDIR)-leaps' || \
>> -+		  $(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-leaps' right_only
>> -+		$(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-posix' posix_only
>> -
>> - posix_right:	posix_only
>> --		rm -fr $(DESTDIR)$(TZDIR)-posix
>> --		ln -s $(TZDIR_BASENAME) $(DESTDIR)$(TZDIR)-posix || \
>> --		  $(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-posix posix_only
>> --		$(MAKE) $(INSTALLARGS) TZDIR=$(TZDIR)-leaps right_only
>> -+		rm -fr '$(DESTDIR)$(TZDIR)-posix'
>> -+		ln -s '$(TZDIR_BASENAME)' '$(DESTDIR)$(TZDIR)-posix' || \
>> -+		  $(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-posix' posix_only
>> -+		$(MAKE) $(INSTALLARGS) TZDIR='$(TZDIR)-leaps' right_only
>> -
>> - # This obsolescent rule is present for backwards compatibility with
>> - # tz releases 2014g through 2015g.  It should go away eventually.
>> -@@ -764,7 +764,7 @@ set-timestamps.out: $(ENCHILADA)
>> -
>> - check_public:
>> - 		$(MAKE) maintainer-clean
>> --		$(MAKE) "CFLAGS=$(GCC_DEBUG_FLAGS)" ALL
>> -+		$(MAKE) CFLAGS='$(GCC_DEBUG_FLAGS)' ALL
>> - 		mkdir -p public.dir
>> - 		for i in $(TDATA) tzdata.zi; do \
>> - 		  $(zic) -v -d public.dir $$i 2>&1 || exit; \
>> -diff --git a/NEWS b/NEWS
>> -index bd2bec2..75ab095 100644
>> ---- a/NEWS
>> -+++ b/NEWS
>> -@@ -1,5 +1,13 @@
>> - News for the tz database
>> -
>> -+Unreleased, experimental changes
>> -+
>> -+  Changes to build procedure
>> -+
>> -+    The Makefile now quotes values like BACKWARD more carefully when
>> -+    passing them to the shell.  (Problem reported by Zefram.)
>> -+
>> -+
>> - Release 2017c - 2017-10-20 14:49:34 -0700
>> -
>> -   Briefly:
>> ---
>> -2.7.4
>> -
>> diff --git a/meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch b/meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
>> deleted file mode 100644
>> index 87afe47..0000000
>> --- a/meta/recipes-extended/tzcode/files/0002-Port-zdump-to-C90-snprintf.patch
>> +++ /dev/null
>> @@ -1,115 +0,0 @@
>> -From e231da4fb2beb17c60b4b1a5c276366d6a6e433f Mon Sep 17 00:00:00 2001
>> -From: Paul Eggert <eggert@cs.ucla.edu>
>> -Date: Mon, 23 Oct 2017 17:58:36 -0700
>> -Subject: [PATCH] Port zdump to C90 + snprintf
>> -MIME-Version: 1.0
>> -Content-Type: text/plain; charset=UTF-8
>> -Content-Transfer-Encoding: 8bit
>> -
>> -Problem reported by Jon Skeet in:
>> -https://mm.icann.org/pipermail/tz/2017-October/025362.html
>> -* NEWS: Mention this.
>> -* zdump.c (my_snprintf): New macro or function.  If a macro, it is
>> -just snprintf.  If a function, it is the same as the old snprintf
>> -static function, with an ATTRIBUTE_FORMAT to pacify modern GCC.
>> -All uses of snprintf changed to use my_snprintf.  This way,
>> -installers don’t need to specify -DHAVE_SNPRINTF if they are using
>> -a pre-C99 compiler with a library that has snprintf.
>> -
>> -Upstream-Status: Backport
>> -Signed-off-by: Armin Kuster <akuster@mvista.com>
>> -
>> ----
>> - NEWS    |  4 ++++
>> - zdump.c | 29 ++++++++++++++++-------------
>> - 2 files changed, 20 insertions(+), 13 deletions(-)
>> -
>> -diff --git a/NEWS b/NEWS
>> -index 75ab095..dea08b8 100644
>> ---- a/NEWS
>> -+++ b/NEWS
>> -@@ -7,6 +7,10 @@ Unreleased, experimental changes
>> -     The Makefile now quotes values like BACKWARD more carefully when
>> -     passing them to the shell.  (Problem reported by Zefram.)
>> -
>> -+    Builders no longer need to specify -DHAVE_SNPRINTF on platforms
>> -+    that have snprintf and use pre-C99 compilers.  (Problem reported
>> -+    by Jon Skeet.)
>> -+
>> -
>> - Release 2017c - 2017-10-20 14:49:34 -0700
>> -
>> -diff --git a/zdump.c b/zdump.c
>> -index 8e3bf3e..d4e6084 100644
>> ---- a/zdump.c
>> -+++ b/zdump.c
>> -@@ -795,12 +795,14 @@ show(timezone_t tz, char *zone, time_t t, bool v)
>> - 		abbrok(abbr(tmp), zone);
>> - }
>> -
>> --#if !HAVE_SNPRINTF
>> -+#if HAVE_SNPRINTF
>> -+# define my_snprintf snprintf
>> -+#else
>> - # include <stdarg.h>
>> -
>> - /* A substitute for snprintf that is good enough for zdump.  */
>> --static int
>> --snprintf(char *s, size_t size, char const *format, ...)
>> -+static int ATTRIBUTE_FORMAT((printf, 3, 4))
>> -+my_snprintf(char *s, size_t size, char const *format, ...)
>> - {
>> -   int n;
>> -   va_list args;
>> -@@ -839,10 +841,10 @@ format_local_time(char *buf, size_t size, struct tm const *tm)
>> - {
>> -   int ss = tm->tm_sec, mm = tm->tm_min, hh = tm->tm_hour;
>> -   return (ss
>> --	  ? snprintf(buf, size, "%02d:%02d:%02d", hh, mm, ss)
>> -+	  ? my_snprintf(buf, size, "%02d:%02d:%02d", hh, mm, ss)
>> - 	  : mm
>> --	  ? snprintf(buf, size, "%02d:%02d", hh, mm)
>> --	  : snprintf(buf, size, "%02d", hh));
>> -+	  ? my_snprintf(buf, size, "%02d:%02d", hh, mm)
>> -+	  : my_snprintf(buf, size, "%02d", hh));
>> - }
>> -
>> - /* Store into BUF, of size SIZE, a formatted UTC offset for the
>> -@@ -877,10 +879,10 @@ format_utc_offset(char *buf, size_t size, struct tm const *tm, time_t t)
>> -   mm = off / 60 % 60;
>> -   hh = off / 60 / 60;
>> -   return (ss || 100 <= hh
>> --	  ? snprintf(buf, size, "%c%02ld%02d%02d", sign, hh, mm, ss)
>> -+	  ? my_snprintf(buf, size, "%c%02ld%02d%02d", sign, hh, mm, ss)
>> - 	  : mm
>> --	  ? snprintf(buf, size, "%c%02ld%02d", sign, hh, mm)
>> --	  : snprintf(buf, size, "%c%02ld", sign, hh));
>> -+	  ? my_snprintf(buf, size, "%c%02ld%02d", sign, hh, mm)
>> -+	  : my_snprintf(buf, size, "%c%02ld", sign, hh));
>> - }
>> -
>> - /* Store into BUF (of size SIZE) a quoted string representation of P.
>> -@@ -983,15 +985,16 @@ istrftime(char *buf, size_t size, char const *time_fmt,
>> - 	    for (abp = ab; is_alpha(*abp); abp++)
>> - 	      continue;
>> - 	    len = (!*abp && *ab
>> --		   ? snprintf(b, s, "%s", ab)
>> -+		   ? my_snprintf(b, s, "%s", ab)
>> - 		   : format_quoted_string(b, s, ab));
>> - 	    if (s <= len)
>> - 	      return false;
>> - 	    b += len, s -= len;
>> - 	  }
>> --	  formatted_len = (tm->tm_isdst
>> --			   ? snprintf(b, s, &"\t\t%d"[show_abbr], tm->tm_isdst)
>> --			   : 0);
>> -+	  formatted_len
>> -+	    = (tm->tm_isdst
>> -+	       ? my_snprintf(b, s, &"\t\t%d"[show_abbr], tm->tm_isdst)
>> -+	       : 0);
>> - 	}
>> - 	break;
>> -       }
>> ---
>> -2.7.4
>> -
> 

