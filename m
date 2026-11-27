Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1534.1795801783872918220
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Dq4GB59+;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48e47347279so5123215f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801782; x=1796406582; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gvgbx6Mf+zGQH/DKTMm8Zp2irFEGn/+cFPLCFIrWuA4=;
        b=Dq4GB59+FoWmNxHWjaJARIB94jZndBGARwMLgmewMYRhAng0xzctW8uz9I9WeckihE
         8IXq8CoJA0PGygAkMBOFKgfiVuEsjzELWgQ+COLUbX2/bets3Y7iZefAmvtRT+MwY0+T
         DeJrIsDEX65N010Forkr+qNTk5o8rSN4ukKFIwXYHnVQYbwhB2E8l4ifiUOp3xxcz8Q9
         SAeJpVAv9yTRmLYDsBg6N6y2tEzV9rnVPmuEb1h/ILiBNT0VBr328HJjqG7G7CsT0oCS
         /U4Z0DM2fl4bpgb4wZTWL89qtMy5+yoLZPj1g3sucLLm4SSugibTd1W2wjibCIQ0/ohZ
         QR+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801782; x=1796406582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gvgbx6Mf+zGQH/DKTMm8Zp2irFEGn/+cFPLCFIrWuA4=;
        b=16dg/1u3wUrAPAIPezvzwWkKwx/k/ZiyH6YQB9y/UY53LAcnXxJkOitHXHu7uI3aak
         mJmLIntb2f3MoeZlMmwdm+Ev6jbd8YWUMiR/SDwT9Zj8eL0Sg4s7KplqIB1XdRvJXmuE
         raXcPOGEc/2/hkOYVVrQxBjXVyXzg7j+uqd9K1Kvsqn735kLN0YGwayTn+x58fisUcU/
         I91OtTNcP1nb7HFNa13hWBifzZjtbK9FO8vYtzSDjDpVre2CsC2BSUvS72NSFChuC877
         o6xxoPFX2K7F5X/ds0mtpkcAZbgVBAE9XiymTtoPESAtg24tNiExi74cZRybiXT7W4fM
         IDZA==
X-Gm-Message-State: APuU4Z97QJ356DO6kSghf0D8mY5S+5meO1rj7VgKtaT+0Xwbgg9rKzoc
	XxFVPh/+lHDvcGFNBmcI3PDYGsiwc3EQu3ThkiQRw7xlT6k2b68o9NN0xwXgoxFmAzoy/J9l16p
	mTOCqN/g=
X-Gm-Gg: AZFdTZdxTDyb1BGMs9OWRyl78GgMxrOCFGcZFNe4eRjx5p7DIUTX9rFzuM5pa2zOmDn
	yiXbfmoVi4l1DXbV2pJXice/Zo0HIPu203WT3rwQE3dlq+M6RwFizmKTR3gEww2D4BKl4zQi8m3
	x2Jouu/0qS2aXsChMlJ9Ty/o8ecH28uu9a9yDbLlVhXEDiFnPqu3PNXDxja8ucb7u/R0Av3ZYXo
	7kKMMM/QN0PT/eV/8YBVd9cexUVP2LDwZaiTEnqq8ssW8eA7oG1UKWgGolS4nTM7zuPuVBm3Dyd
	ye52T6ILJHccOvo4PkoRNARLSEc6U4hWgDe2bcl2VzaChNLJyFvpMAhwfSO1j6CRHlIWOtCAUZe
	1PwAxx9pYNDaRE4KR2hnqtYH0thV/lfapSyMljdumvLOnkg90eWuoW5Cs3MuMjkQRaHW/oXJBGv
	tPfTDX3KlDF3PNjTMVxmnW9XGUzZ2kkE+OicmsGBlNyrSnEaZ9tF/7v0ua9iuyfP6hU2SD5fslJ
	GsA1kkQEMhNMwAlet+1lhetfmlhssMCovjRPZCH+a28ypPvijuDksE4wQooUP2uG4sfwBndeW1w
	mnlLkgo6GYk5Cb2giUexDeYVfvuRRpwT90prHUFivNhSQWlh5WPqgNswkpaZN2LF3xJiaDNd/h5
	cdqEio/k3AAoseBM70UsOr0fCR31jAjtVzIzeJwtPvcs7mpcneA==
X-Received: by 2002:a5d:64c5:0:b0:4ab:c3f8:9f65 with SMTP id ffacd0b85a97d-4abc3f8a051mr46776494f8f.26.1795801781887;
        Fri, 27 Nov 2026 09:49:41 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.41
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:41 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 14/37] popt: patch CVE-2026-18839
Date: Fri, 27 Nov 2026 18:48:57 +0100
Message-ID: <0452da1b47e6ba31c1e3fc3e143116cdc1f5663c.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251420
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick commits from PR [1] referencing this CVE.
Modify the patch by converting cmake change to autotools.

[1] https://github.com/rpm-software-management/popt/pull/142

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a522f7f1d73e21745699243f6ca4fc89351fb91a)
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../popt/popt/CVE-2026-18839-01.patch         |  89 ++++
 .../popt/popt/CVE-2026-18839-02.patch         | 419 ++++++++++++++++++
 meta/recipes-support/popt/popt_1.19.bb        |   2 +
 3 files changed, 510 insertions(+)
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18839-01.patch
 create mode 100644 meta/recipes-support/popt/popt/CVE-2026-18839-02.patch

diff --git a/meta/recipes-support/popt/popt/CVE-2026-18839-01.patch b/meta/recipes-support/popt/popt/CVE-2026-18839-01.patch
new file mode 100644
index 00000000000..c3cb7e319c8
--- /dev/null
+++ b/meta/recipes-support/popt/popt/CVE-2026-18839-01.patch
@@ -0,0 +1,89 @@
+From 4f5a070cd98aade2767677de22661f4854d4a195 Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Thu, 20 Aug 2026 13:46:32 +0300
+Subject: [PATCH] Bring in our own allocating printf() variants
+
+These are brought mostly as-is from rpm under a new POPT_ name, just
+with a slight change return an error on memory alloc failure whereas
+rpm exits on error.
+As the author of rvasprintf() and rasprintf() there, I'm at liberty to
+(re)license them under MIT as well.
+
+No functional changes here, just needed for sanity going forward.
+
+CVE: CVE-2026-18839
+Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/4f5a070cd98aade2767677de22661f4854d4a195]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/poptint.c | 38 ++++++++++++++++++++++++++++++++++++++
+ src/poptint.h |  4 ++++
+ 2 files changed, 42 insertions(+)
+
+diff --git a/src/poptint.c b/src/poptint.c
+index b8dc90f..6b61ae3 100644
+--- a/src/poptint.c
++++ b/src/poptint.c
+@@ -192,3 +192,41 @@ POPT_fprintf (FILE * stream, const char * format, ...)
+ }
+ 
+ #endif	/* !defined(POPT_fprintf) */
++
++int POPT_vasprintf(char **strp, const char *fmt, va_list ap)
++{
++    char * p = NULL;
++    va_list aq;
++
++    if (strp == NULL)
++	return -1;
++
++    va_copy(aq, ap);
++    int n = vsnprintf(NULL, 0, fmt, aq);
++    va_end(aq);
++
++    if (n >= 0) {
++	size_t nb = (size_t)n + 1;
++	if ((p = malloc(nb))) {
++	    va_copy(aq, ap);
++	    n = vsnprintf(p, nb, fmt, aq);
++	    va_end(aq);
++	} else {
++	    n = -1;
++ 	}
++    }
++    *strp = p;
++
++    return n;
++}
++
++int POPT_asprintf(char **strp, const char *fmt, ...)
++{
++    va_list ap;
++
++    va_start(ap, fmt);
++    int n = POPT_vasprintf(strp, fmt, ap);
++    va_end(ap);
++
++    return n;
++}
+diff --git a/src/poptint.h b/src/poptint.h
+index 910d6f5..d4127b3 100644
+--- a/src/poptint.h
++++ b/src/poptint.h
+@@ -10,6 +10,7 @@
+ #define H_POPTINT
+ 
+ #include <stdint.h>
++#include <stdarg.h>
+ 
+ /**
+  * Wrapper to free(3), hides const compilation noise, permit NULL, return NULL.
+@@ -136,6 +137,9 @@ const char *POPT_next_char (const char *str);
+ 
+ #endif
+ 
++int POPT_vasprintf(char **strp, const char *fmt, va_list ap);
++int POPT_asprintf(char **strp, const char *fmt, ...);
++
+ #if defined(ENABLE_NLS) && defined(HAVE_LIBINTL_H)
+ #include <libintl.h>
+ #endif
diff --git a/meta/recipes-support/popt/popt/CVE-2026-18839-02.patch b/meta/recipes-support/popt/popt/CVE-2026-18839-02.patch
new file mode 100644
index 00000000000..702403c2b3a
--- /dev/null
+++ b/meta/recipes-support/popt/popt/CVE-2026-18839-02.patch
@@ -0,0 +1,419 @@
+From af6f19e5968d48608a062d6d92d28b7fd248f8ea Mon Sep 17 00:00:00 2001
+From: Panu Matilainen <pmatilai@redhat.com>
+Date: Thu, 20 Aug 2026 14:28:11 +0300
+Subject: [PATCH] Fix a bucketful of buffer overflows in popt --help printing
+
+singleOptionDefaultValue() based the default value string output buffer
+size on the available line length, without any sort of bounds checking
+for most data. This was trivial to overflow with longer option names.
+
+There was also this baffling ellipsizing of long string arguments, done
+done based on the rather arbitrary buffer size instead of screen limits.
+Ellipsizing of long values might be totally reasonable but that belongs
+to the display code that does all manner of formatting too.
+
+Just use our newly introduced allocating sprintf() to get it right for
+good. Drop the line length argument entirely, it was only used for
+a bad estimation of the needed buffer size.
+
+At the other end, make sure the indent length stays below available
+columns to avoid the underflow from help printing.
+
+Annoyingly we need multiple different test programs for this because
+the various crashes are quite sensitive to the max length of a single
+option in the table. There are more broken cases than these, but we
+can't test everything and these cover the CVE-2026-18839 case.
+Update the ellipsis test a bit because it no longer makes sense.
+
+Note: this depends on the previous commit.
+
+Fixes: CVE-2026-18839
+
+CVE: CVE-2026-18839
+Upstream-Status: Backport [https://github.com/rpm-software-management/popt/commit/af6f19e5968d48608a062d6d92d28b7fd248f8ea]
+Convert cmake change to autotools.
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/popthelp.c    | 55 ++++++++++++++++-------------------------------
+ tests/Makefile.am | 10 ++++++++-
+ tests/test1.c     |  2 +-
+ tests/test4-1.c   | 33 ++++++++++++++++++++++++++++
+ tests/test4-2.c   | 33 ++++++++++++++++++++++++++++
+ tests/test4-3.c   | 33 ++++++++++++++++++++++++++++
+ tests/test4-4.c   | 33 ++++++++++++++++++++++++++++
+ tests/testit.sh   | 36 +++++++++++++++++++++++++++++--
+ 8 files changed, 195 insertions(+), 40 deletions(-)
+ create mode 100644 tests/test4-1.c
+ create mode 100644 tests/test4-2.c
+ create mode 100644 tests/test4-3.c
+ create mode 100644 tests/test4-4.c
+
+diff --git a/src/popthelp.c b/src/popthelp.c
+index fa31901..3950975 100644
+--- a/src/popthelp.c
++++ b/src/popthelp.c
+@@ -197,79 +197,60 @@ getArgDescrip(const struct poptOption * opt,
+ 
+ /**
+  * Display default value for an option.
+- * @param lineLength	display positions remaining
+  * @param opt		option(s)
+  * @param translation_domain	translation domain
+  * @return
+  */
+ static char *
+-singleOptionDefaultValue(size_t lineLength,
++singleOptionDefaultValue(
+ 		const struct poptOption * opt,
+ 		/* FIX: i18n macros disabled with lclint */
+ 		const char * translation_domain)
+ {
+     const char * defstr = D_(translation_domain, "default");
+-    char * le = malloc(4*lineLength + 1);
+-    char * l = le;
++    char * l = NULL;
+ 
+-    if (le == NULL) return NULL;	/* XXX can't happen */
+-    *le = '\0';
+-    *le++ = '(';
+-    le = stpcpy(le, defstr);
+-    *le++ = ':';
+-    *le++ = ' ';
+   if (opt->arg) {	/* XXX programmer error */
+     poptArg arg = { .ptr = opt->arg };
+     switch (poptArgType(opt)) {
+     case POPT_ARG_VAL:
+     case POPT_ARG_INT:
+-	le += sprintf(le, "%d", arg.intp[0]);
++	POPT_asprintf(&l, "(%s: %d)", defstr, arg.intp[0]);
+ 	break;
+     case POPT_ARG_SHORT:
+-	le += sprintf(le, "%hd", arg.shortp[0]);
++	POPT_asprintf(&l, "(%s: %hd)", defstr, arg.shortp[0]);
+ 	break;
+     case POPT_ARG_LONG:
+-	le += sprintf(le, "%ld", arg.longp[0]);
++	POPT_asprintf(&l, "(%s: %ld)", defstr, arg.longp[0]);
+ 	break;
+     case POPT_ARG_LONGLONG:
+-	le += sprintf(le, "%lld", arg.longlongp[0]);
++	POPT_asprintf(&l, "(%s: %lld)", defstr, arg.longlongp[0]);
+ 	break;
+     case POPT_ARG_FLOAT:
+     {	double aDouble = (double) arg.floatp[0];
+-	le += sprintf(le, "%g", aDouble);
++	POPT_asprintf(&l, "(%s: %g)", defstr, aDouble);
+     }	break;
+     case POPT_ARG_DOUBLE:
+-	le += sprintf(le, "%g", arg.doublep[0]);
++	POPT_asprintf(&l, "(%s: %g)", defstr, arg.doublep[0]);
+ 	break;
+     case POPT_ARG_MAINCALL:
+-	le += sprintf(le, "%p", opt->arg);
++	POPT_asprintf(&l, "(%s: %p)", defstr, opt->arg);
+ 	break;
+     case POPT_ARG_ARGV:
+-	le += sprintf(le, "%p", opt->arg);
++	POPT_asprintf(&l, "(%s: %p)", defstr, opt->arg);
+ 	break;
+     case POPT_ARG_STRING:
+-    {	const char * s = arg.argv[0];
+-	if (s == NULL)
+-	    le = stpcpy(le, "null");
+-	else {
+-	    size_t limit = 4*lineLength - (le - l) - sizeof("\"\")");
+-	    size_t slen;
+-	    *le++ = '"';
+-	    strncpy(le, s, limit); le[limit] = '\0'; le += (slen = strlen(le));
+-	    if (slen == limit && s[limit])
+-		le[-1] = le[-2] = le[-3] = '.';
+-	    *le++ = '"';
+-	}
+-    }	break;
++	if (arg.argv[0])
++	    POPT_asprintf(&l, "(%s: \"%s\")", defstr, arg.argv[0]);
++	else
++	    POPT_asprintf(&l, "(%s: %s)", defstr, "null");
++	break;
+     case POPT_ARG_NONE:
+     default:
+-	l = _free(l);
+ 	return NULL;
+ 	break;
+     }
+   }
+-    *le++ = ')';
+-    *le = '\0';
+ 
+     return l;
+ }
+@@ -286,7 +267,9 @@ static void singleOptionHelp(FILE * fp, columns_t columns,
+ 		const char * translation_domain)
+ {
+     size_t maxLeftCol = columns->cur;
+-    size_t indentLength = maxLeftCol + 5;
++    size_t indentLength = maxLeftCol + 5 < columns->max ?
++			maxLeftCol + 5 :
++			columns->max - (maxLeftCol % columns->max) - 1;
+     size_t lineLength = columns->max - indentLength;
+     const char * help = D_(translation_domain, opt->descrip);
+     const char * argDescrip = getArgDescrip(opt, translation_domain);
+@@ -347,7 +330,7 @@ static void singleOptionHelp(FILE * fp, columns_t columns,
+ 
+ 	/* Choose type of output */
+ 	if (F_ISSET(opt, SHOW_DEFAULT)) {
+-	    defs = singleOptionDefaultValue(lineLength, opt, translation_domain);
++	    defs = singleOptionDefaultValue(opt, translation_domain);
+ 	    if (defs) {
+ 		char * t = malloc((help ? strlen(help) : 0) +
+ 				strlen(defs) + sizeof(" "));
+diff --git a/tests/Makefile.am b/tests/Makefile.am
+index 99fbf64..dfc60e7 100644
+--- a/tests/Makefile.am
++++ b/tests/Makefile.am
+@@ -11,7 +11,7 @@ EXTRA_DIST = testit.sh \
+ 
+ AM_CPPFLAGS = -I. -I$(top_srcdir)/src
+ 
+-noinst_PROGRAMS = test1 test2 tdict test3 tstuff
++noinst_PROGRAMS = test1 test2 tdict test3 tstuff test4-1 test4-2 test4-3 test4-4
+ tstuff_SOURCES = tstuff.c
+ tstuff_LDFLAGS =
+ tstuff_LDADD = $(top_builddir)/src/libpopt.la
+@@ -24,6 +24,14 @@ test2_LDADD = $(top_builddir)/src/libpopt.la
+ test3_SOURCES = test3.c
+ test3_LDFLAGS = 
+ test3_LDADD = $(top_builddir)/src/libpopt.la
++test4_1_SOURCES = test4-1.c
++test4_1_LDADD = $(top_builddir)/src/libpopt.la
++test4_2_SOURCES = test4-2.c
++test4_2_LDADD = $(top_builddir)/src/libpopt.la
++test4_3_SOURCES = test4-3.c
++test4_3_LDADD = $(top_builddir)/src/libpopt.la
++test4_4_SOURCES = test4-4.c
++test4_4_LDADD = $(top_builddir)/src/libpopt.la
+ tdict_SOURCES = tdict.c
+ tdict_LDFLAGS = 
+ tdict_LDADD = $(top_builddir)/src/libpopt.la
+diff --git a/tests/test1.c b/tests/test1.c
+index 7a3e663..3007f27 100644
+--- a/tests/test1.c
++++ b/tests/test1.c
+@@ -49,7 +49,7 @@ static char * oStr = (char *) -1;
+ static int singleDash = 0;
+ 
+ static const char * lStr =
+-"This tests default strings and exceeds the ... limit. "
++"This tests default strings and exceeds the former ... limit. "
+ "123456789+123456789+123456789+123456789+123456789+ "
+ "123456789+123456789+123456789+123456789+123456789+ "
+ "123456789+123456789+123456789+123456789+123456789+ "
+diff --git a/tests/test4-1.c b/tests/test4-1.c
+new file mode 100644
+index 0000000..2a0f094
+--- /dev/null
++++ b/tests/test4-1.c
+@@ -0,0 +1,33 @@
++#include <stdio.h>
++#include <popt.h>
++
++static char *arg2 = "meh";
++
++static struct poptOption options[] = {
++    { "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaargh",
++	    '\0', POPT_ARG_STRING | POPT_ARGFLAG_SHOW_DEFAULT,
++	    &arg2, 0, "Second", NULL },
++
++    POPT_AUTOALIAS
++    POPT_AUTOHELP
++    POPT_TABLEEND
++};
++
++int main(int argc, const char *argv[])
++{
++    poptContext optCon = poptGetContext("test4", argc, argv, options, 0);
++
++    poptReadDefaultConfig(optCon, 0);
++
++    int rc = poptGetNextOpt(optCon);
++
++    if (rc < -1) {
++	fprintf(stderr, "%s: bad argument %s: %s\n",
++		argv[0], poptBadOption(optCon, POPT_BADOPTION_NOALIAS),
++		poptStrerror(rc));
++	goto exit;
++    }
++
++exit:
++    poptFreeContext(optCon);
++}
+diff --git a/tests/test4-2.c b/tests/test4-2.c
+new file mode 100644
+index 0000000..f9cd13d
+--- /dev/null
++++ b/tests/test4-2.c
+@@ -0,0 +1,33 @@
++#include <stdio.h>
++#include <popt.h>
++
++static char *arg3 = NULL;
++
++static struct poptOption options[] = {
++    { "brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrgh",
++	    '\0', POPT_ARG_STRING | POPT_ARGFLAG_SHOW_DEFAULT,
++	    &arg3, 0, "Third", NULL },
++
++    POPT_AUTOALIAS
++    POPT_AUTOHELP
++    POPT_TABLEEND
++};
++
++int main(int argc, const char *argv[])
++{
++    poptContext optCon = poptGetContext("test4", argc, argv, options, 0);
++
++    poptReadDefaultConfig(optCon, 0);
++
++    int rc = poptGetNextOpt(optCon);
++
++    if (rc < -1) {
++	fprintf(stderr, "%s: bad argument %s: %s\n",
++		argv[0], poptBadOption(optCon, POPT_BADOPTION_NOALIAS),
++		poptStrerror(rc));
++	goto exit;
++    }
++
++exit:
++    poptFreeContext(optCon);
++}
+diff --git a/tests/test4-3.c b/tests/test4-3.c
+new file mode 100644
+index 0000000..a29f359
+--- /dev/null
++++ b/tests/test4-3.c
+@@ -0,0 +1,33 @@
++#include <stdio.h>
++#include <popt.h>
++
++static char *arg2 = NULL;
++
++static struct poptOption options[] = {
++    { "aarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrggggggh",
++	    '\0', POPT_ARG_STRING,
++	    &arg2, 0, "xxxxx", NULL },
++
++    POPT_AUTOALIAS
++    POPT_AUTOHELP
++    POPT_TABLEEND
++};
++
++int main(int argc, const char *argv[])
++{
++    poptContext optCon = poptGetContext("test4", argc, argv, options, 0);
++
++    poptReadDefaultConfig(optCon, 0);
++
++    int rc = poptGetNextOpt(optCon);
++
++    if (rc < -1) {
++	fprintf(stderr, "%s: bad argument %s: %s\n",
++		argv[0], poptBadOption(optCon, POPT_BADOPTION_NOALIAS),
++		poptStrerror(rc));
++	goto exit;
++    }
++
++exit:
++    poptFreeContext(optCon);
++}
+diff --git a/tests/test4-4.c b/tests/test4-4.c
+new file mode 100644
+index 0000000..b1b1322
+--- /dev/null
++++ b/tests/test4-4.c
+@@ -0,0 +1,33 @@
++#include <stdio.h>
++#include <popt.h>
++
++static char *arg2 = NULL;
++
++static struct poptOption options[] = {
++    { "aarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrgggggghyyyyy",
++	    '\0', POPT_ARG_STRING,
++	    &arg2, 0, "xxxxx", NULL },
++
++    POPT_AUTOALIAS
++    POPT_AUTOHELP
++    POPT_TABLEEND
++};
++
++int main(int argc, const char *argv[])
++{
++    poptContext optCon = poptGetContext("test4", argc, argv, options, 0);
++
++    poptReadDefaultConfig(optCon, 0);
++
++    int rc = poptGetNextOpt(optCon);
++
++    if (rc < -1) {
++	fprintf(stderr, "%s: bad argument %s: %s\n",
++		argv[0], poptBadOption(optCon, POPT_BADOPTION_NOALIAS),
++		poptStrerror(rc));
++	goto exit;
++    }
++
++exit:
++    poptFreeContext(optCon);
++}
+diff --git a/tests/testit.sh b/tests/testit.sh
+index d26be3a..b8357c8 100755
+--- a/tests/testit.sh
++++ b/tests/testit.sh
+@@ -149,8 +149,8 @@ Usage: test1 [OPTION...]
+       --nstr=STRING               POPT_ARG_STRING: (null) (default: null)
+       --lstr=STRING               POPT_ARG_STRING: \"123456789...\" (default:
+                                   \"This tests default strings and exceeds the
+-                                  ... limit.
+-                                  123456789+123456789+123456789+123456789+123456789+ 123456789+123456789+123456789+123456789+123456789+ 1234567...\")
++                                  former ... limit.
++                                  123456789+123456789+123456789+123456789+123456789+ 123456789+123456789+123456789+123456789+123456789+ 123456789+123456789+123456789+123456789+123456789+ 123456789+123456789+123456789+123456789+123456789+ \")
+ 
+ arg for cb2
+   -c, --cb2=STRING                Test argument callbacks
+@@ -183,5 +183,37 @@ run_diff test3 "test3 - 2" test3-data/02.input test3-data/02.answer
+ run_diff test3 "test3 - 3" test3-data/03.input test3-data/03.answer
+ run_diff test3 "test3 - 5" test3-data/05.input test3-data/05.answer
+ 
++run test4-1 "test 4-1 - 63" "\
++Usage: test4-1 [OPTION...]
++      --aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaargh=STRING     Second (default: \"meh\")
++
++Help options:
++  -?, --help                                                                Show this help message
++      --usage                                                               Display brief usage message" --help
++
++run test4-2 "test 4-2 - 64" "\
++Usage: test4-2 [OPTION...]
++      --brrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrgh=STRING     Third (default: null)
++
++Help options:
++  -?, --help                                                                                                              Show this help message
++      --usage                                                                                                             Display brief usage message" --help
++
++run test4-3 "test 4-3 - 65" "\
++Usage: test4-3 [OPTION...]
++      --aarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrggggggh=STRING     xxxxx
++
++Help options:
++  -?, --help                                                                   Show this help message
++      --usage                                                                  Display brief usage message" --help
++
++run test4-4 "test 4-4 - 66" "\
++Usage: test4-4 [OPTION...]
++      --aarrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrgggggghyyyyy=STRING     xxxxx
++
++Help options:
++  -?, --help                                                                        Show this help message
++      --usage                                                                       Display brief usage message" --help
++
+ echo ""
+ echo "Passed."
diff --git a/meta/recipes-support/popt/popt_1.19.bb b/meta/recipes-support/popt/popt_1.19.bb
index 18cc4f2867d..33f07552a6e 100644
--- a/meta/recipes-support/popt/popt_1.19.bb
+++ b/meta/recipes-support/popt/popt_1.19.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://ftp.rpm.org/popt/releases/popt-1.x/${BP}.tar.gz \
            file://run-ptest \
            file://CVE-2026-18743.patch \
            file://CVE-2026-18739.patch \
+           file://CVE-2026-18839-01.patch \
+           file://CVE-2026-18839-02.patch \
            "
 SRC_URI[sha256sum] = "c25a4838fc8e4c1c8aacb8bd620edb3084a3d63bf8987fdad3ca2758c63240f9"
 
