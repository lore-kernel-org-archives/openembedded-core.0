Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1464.1795801785414809352
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Nov 2026 09:49:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=SRk0RjBg;
 spf=pass (domain: smile.fr, ip: 209.85.221.54, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4a2f4ca0dcfso4805758f8f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 09:49:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795801784; x=1796406584; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U3zdXl246ZAeqhmsJPKbcVVJh4PcW5otftcz8YhOfPc=;
        b=SRk0RjBgHK+GejCClfl1ycQuBVYtkixnB8wyDy23BYZEnIO4gntyoBS2UGygkKh4e2
         3kmHcU+/VcpQepDoe2BUC1KNwgl7XIgXx023TLQ2R2GhMxofNnW12vmcZ2awBqvp70MI
         dZ2vy71wQnl7d9uToAZpZCZOV7I/Nq2eJebcaVOD9gakDL32+YnCWvrROtuTAg8d4ZAw
         C+Uu5ldaEbRvZ4iazOcVJ9eZHYa/ZtEnCza0KLfRuY9QZiU6/U69j+WBh+e9izy5jcD+
         0AKSR3Z4wiLQsOHePCOcS4kI+P4wiIveNPnCcSrP92EU/ulTHUs5CcMyvZByPQYtsxDj
         QgMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795801784; x=1796406584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U3zdXl246ZAeqhmsJPKbcVVJh4PcW5otftcz8YhOfPc=;
        b=aetofijYJYmW6X1o1KD5r/flzK2pavbKTOcdn5vxd75dZBZBlpbyOeGd78nT7pz6Yt
         MqYYqNRIC8x/fb6IX4grK9atlP8pbUHf1JTeGWEv0M0OTpeykprpZF+ERF+vdWrLcmsu
         JONq/biHrC9y4oq2yePbAjipsfbNbf5Uf0OnVtX5aCmvvhA/FQuEdswahMnk2sRR7uYv
         jb1r3yDI6InLfLAeVnQL5gZWOkQLie8nWwMbT3+yzcCb4eCXNJsX2r/+C3v+HZ6Uyplm
         O50XGwecv/4rtEdfEtFIuC75rGvt7gwqBqW601p5dZ5CvAxT0B90oJpyhv2LGnLovnTP
         ZPgw==
X-Gm-Message-State: APuU4Z+nWiyDPYu0QpbOthUarqC4JFzbVl4LRgoRXmu/xCs6RgO4CjK+
	ZIOoys7uvAvvrtuWZrOZKbT5OhC3h2FKZZp4c+zgdbKTpymFxdjdHZDGEw0kNLlP+hQ15ehoUbY
	kAwpNlQ8=
X-Gm-Gg: AZFdTZf7zWMp2j5APP0P5N4KwaIZSvmg3BXwlA+PjDsQxnyKD4sRC63V1bIQ2M76yZ1
	mJikE2JpQVH6W823cHFNuiS1KlQrby1mWQ7wZ+BIZWa1tMmZmEbEY+/zFiooSkFREVldsSfac6D
	qUZZ9b0bSe7iJnXAkuKIEQzRPPsSNfYikYhYwWqviEdrpk3ktSjtJythi6gojz+9b8tAaCBWbRF
	Rk5pGGcdS91tSH6IKPd4e126+uj4EM2Gu/C91Vv00IAzp777ogRFvDapP/DKVZpEJ/FwteOp6SV
	rCVtRd5W0Wi2NpEVFClzAYf/jieotUVlSUY6JDt81CM+J0u8NLubVe74C6xsqOTsUgeEYt0K6Wv
	LlrJB0jrxEfM8FtJyQEoQlEjcUYB7p/D0eMdm/tx0PS2DewJrYrKSBJeqPYCgXv3bLIZSetDj0t
	wRz4anu75VpXAoAuIsyeMOuZeossygRwPYDD/2cNB2Il1r4Rf+0p9+YD/WfDmHSIX6SBTNXCsTk
	fb+kcJrN71JkpxwUosZxKzfag35KeO0d1Q4B34GfdqxzpVRgcaV9J35Kkk5iv9gr7UQfmHQB7+5
	wV97kcmipOTO1a6nFokqQ8xm1PrMa9Q9cag9Y5vayB+zqWpboM+T6IkcjBQB2WKBMmn5S5ssMQT
	bnRG2TIRh0RgFCV4RoElb5KXY/Kfc
X-Received: by 2002:a05:6000:4704:b0:4a8:5a5b:3b7d with SMTP id ffacd0b85a97d-4abb5eacf4fmr51125702f8f.56.1795801783337;
        Fri, 27 Nov 2026 09:49:43 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf630esm49374624f8f.16.2026.11.27.09.49.42
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 09:49:42 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/37] dropbear: add follow-up patches for CVE-2019-6111
Date: Fri, 27 Nov 2026 18:48:59 +0100
Message-ID: <9e1988bd3789d2bfaf32265559770f296cc0f604.1795798718.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1795798718.git.yoann.congal@smile.fr>
References: <cover.1795798718.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 27 Nov 2026 17:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251422
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

Pick additional patches referencing this CVE from 2026.90 or 2026.91
releases.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
[YC: Note: this might change user-visible behavior:
     a Remote to local "scp -r" into an existing directory will now
     return an error.
]
---
 ...2019-6111.patch => CVE-2019-6111-01.patch} |   0
 .../dropbear/dropbear/CVE-2019-6111-02.patch  | 364 ++++++++++++++++++
 .../dropbear/dropbear/CVE-2019-6111-03.patch  |  43 +++
 .../dropbear/dropbear/CVE-2019-6111-04.patch  |  34 ++
 .../dropbear/dropbear/CVE-2019-6111-05.patch  |  43 +++
 .../recipes-core/dropbear/dropbear_2022.83.bb |   6 +-
 6 files changed, 489 insertions(+), 1 deletion(-)
 rename meta/recipes-core/dropbear/dropbear/{CVE-2019-6111.patch => CVE-2019-6111-01.patch} (100%)
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-02.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-03.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-04.patch
 create mode 100644 meta/recipes-core/dropbear/dropbear/CVE-2019-6111-05.patch

diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch b/meta/recipes-core/dropbear/dropbear/CVE-2019-6111-01.patch
similarity index 100%
rename from meta/recipes-core/dropbear/dropbear/CVE-2019-6111.patch
rename to meta/recipes-core/dropbear/dropbear/CVE-2019-6111-01.patch
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2019-6111-02.patch b/meta/recipes-core/dropbear/dropbear/CVE-2019-6111-02.patch
new file mode 100644
index 00000000000..3b73659d1da
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2019-6111-02.patch
@@ -0,0 +1,364 @@
+From 143291baca6ebb3407a0c25c85bd53bf041a6ab7 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Mon, 20 Apr 2026 20:57:11 +0800
+Subject: [PATCH] scp: more CVE-2019-6111 fix
+
+Cherrypicked from OpenSSH portable
+
+commit 3d896c157c722bc47adca51a58dca859225b5874
+djm Sun Feb 10 11:15:52 2019 +0000
+
+upstream: when checking that filenames sent by the server side
+
+match what the client requested, be prepared to handle shell-style brace
+alternations, e.g. "{foo,bar}".
+
+"looks good to me" millert@ + in snaps for the last week courtesy
+deraadt@
+
+CVE: CVE-2019-6111
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/143291baca6ebb3407a0c25c85bd53bf041a6ab7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ scp.c | 281 +++++++++++++++++++++++++++++++++++++++++++++++++++++++---
+ 1 file changed, 269 insertions(+), 12 deletions(-)
+
+diff --git a/scp.c b/scp.c
+index bf98986c..d151587c 100644
+--- a/scp.c
++++ b/scp.c
+@@ -74,7 +74,6 @@
+  */
+ 
+ #include "includes.h"
+-/*RCSID("$OpenBSD: scp.c,v 1.130 2006/01/31 10:35:43 djm Exp $");*/
+ 
+ #include <fnmatch.h>
+ 
+@@ -600,6 +599,253 @@ tolocal(int argc, char **argv)
+ 	}
+ }
+ 
++/* Appends a string to an array; returns 0 on success, -1 on alloc failure */
++static int
++append(char *cp, char ***ap, size_t *np)
++{
++	char **tmp;
++
++	if ((tmp = reallocarray(*ap, *np + 1, sizeof(*tmp))) == NULL)
++		return -1;
++	tmp[(*np)] = cp;
++	(*np)++;
++	*ap = tmp;
++	return 0;
++}
++
++/*
++ * Finds the start and end of the first brace pair in the pattern.
++ * returns 0 on success or -1 for invalid patterns.
++ */
++static int
++find_brace(const char *pattern, int *startp, int *endp)
++{
++	int i;
++	int in_bracket, brace_level;
++
++	*startp = *endp = -1;
++	in_bracket = brace_level = 0;
++	for (i = 0; i < INT_MAX && *endp < 0 && pattern[i] != '\0'; i++) {
++		switch (pattern[i]) {
++		case '\\':
++			/* skip next character */
++			if (pattern[i + 1] != '\0')
++				i++;
++			break;
++		case '[':
++			in_bracket = 1;
++			break;
++		case ']':
++			in_bracket = 0;
++			break;
++		case '{':
++			if (in_bracket)
++				break;
++			if (pattern[i + 1] == '}') {
++				/* Protect a single {}, for find(1), like csh */
++				i++; /* skip */
++				break;
++			}
++			if (*startp == -1)
++				*startp = i;
++			brace_level++;
++			break;
++		case '}':
++			if (in_bracket)
++				break;
++			if (*startp < 0) {
++				/* Unbalanced brace */
++				return -1;
++			}
++			if (--brace_level <= 0)
++				*endp = i;
++			break;
++		}
++	}
++	/* unbalanced brackets/braces */
++	if (*endp < 0 && (*startp >= 0 || in_bracket))
++		return -1;
++	return 0;
++}
++
++/*
++ * Assembles and records a successfully-expanded pattern, returns -1 on
++ * alloc failure.
++ */
++static int
++emit_expansion(const char *pattern, int brace_start, int brace_end,
++    int sel_start, int sel_end, char ***patternsp, size_t *npatternsp)
++{
++	char *cp;
++	int o = 0, tail_len = strlen(pattern + brace_end + 1);
++
++	if ((cp = malloc(brace_start + (sel_end - sel_start) +
++	    tail_len + 1)) == NULL)
++		return -1;
++
++	/* Pattern before initial brace */
++	if (brace_start > 0) {
++		memcpy(cp, pattern, brace_start);
++		o = brace_start;
++	}
++	/* Current braced selection */
++	if (sel_end - sel_start > 0) {
++		memcpy(cp + o, pattern + sel_start,
++		    sel_end - sel_start);
++		o += sel_end - sel_start;
++	}
++	/* Remainder of pattern after closing brace */
++	if (tail_len > 0) {
++		memcpy(cp + o, pattern + brace_end + 1, tail_len);
++		o += tail_len;
++	}
++	cp[o] = '\0';
++	if (append(cp, patternsp, npatternsp) != 0) {
++		free(cp);
++		return -1;
++	}
++	return 0;
++}
++
++/*
++ * Expand the first encountered brace in pattern, appending the expanded
++ * patterns it yielded to the *patternsp array.
++ *
++ * Returns 0 on success or -1 on allocation failure.
++ *
++ * Signals whether expansion was performed via *expanded and whether
++ * pattern was invalid via *invalid.
++ */
++static int
++brace_expand_one(const char *pattern, char ***patternsp, size_t *npatternsp,
++    int *expanded, int *invalid)
++{
++	int i;
++	int in_bracket, brace_start, brace_end, brace_level;
++	int sel_start, sel_end;
++
++	*invalid = *expanded = 0;
++
++	if (find_brace(pattern, &brace_start, &brace_end) != 0) {
++		*invalid = 1;
++		return 0;
++	} else if (brace_start == -1)
++		return 0;
++
++	in_bracket = brace_level = 0;
++	for (i = sel_start = brace_start + 1; i < brace_end; i++) {
++		switch (pattern[i]) {
++		case '{':
++			if (in_bracket)
++				break;
++			brace_level++;
++			break;
++		case '}':
++			if (in_bracket)
++				break;
++			brace_level--;
++			break;
++		case '[':
++			in_bracket = 1;
++			break;
++		case ']':
++			in_bracket = 0;
++			break;
++		case '\\':
++			if (i < brace_end - 1)
++				i++; /* skip */
++			break;
++		}
++		if (pattern[i] == ',' || i == brace_end - 1) {
++			if (in_bracket || brace_level > 0)
++				continue;
++			/* End of a selection, emit an expanded pattern */
++
++			/* Adjust end index for last selection */
++			sel_end = (i == brace_end - 1) ? brace_end : i;
++			if (emit_expansion(pattern, brace_start, brace_end,
++			    sel_start, sel_end, patternsp, npatternsp) != 0)
++				return -1;
++			/* move on to the next selection */
++			sel_start = i + 1;
++			continue;
++		}
++	}
++	if (in_bracket || brace_level > 0) {
++		*invalid = 1;
++		return 0;
++	}
++	/* success */
++	*expanded = 1;
++	return 0;
++}
++
++/* Expand braces from pattern. Returns 0 on success, -1 on failure */
++static int
++brace_expand(const char *pattern, char ***patternsp, size_t *npatternsp)
++{
++	char *cp, *cp2, **active = NULL, **done = NULL;
++	size_t i, nactive = 0, ndone = 0;
++	int ret = -1, invalid = 0, expanded = 0;
++
++	*patternsp = NULL;
++	*npatternsp = 0;
++
++	/* Start the worklist with the original pattern */
++	if ((cp = strdup(pattern)) == NULL)
++		return -1;
++	if (append(cp, &active, &nactive) != 0) {
++		free(cp);
++		return -1;
++	}
++	while (nactive > 0) {
++		cp = active[nactive - 1];
++		nactive--;
++		if (brace_expand_one(cp, &active, &nactive,
++		    &expanded, &invalid) == -1) {
++			free(cp);
++			goto fail;
++		}
++		if (invalid)
++			fatal("%s: invalid brace pattern \"%s\"", __func__, cp);
++		if (expanded) {
++			/*
++			 * Current entry expanded to new entries on the
++			 * active list; discard the progenitor pattern.
++			 */
++			free(cp);
++			continue;
++		}
++		/*
++		 * Pattern did not expand; append the finename component to
++		 * the completed list
++		 */
++		if ((cp2 = strrchr(cp, '/')) != NULL)
++			*cp2++ = '\0';
++		else
++			cp2 = cp;
++		if (append(xstrdup(cp2), &done, &ndone) != 0) {
++			free(cp);
++			goto fail;
++		}
++		free(cp);
++	}
++	/* success */
++	*patternsp = done;
++	*npatternsp = ndone;
++	done = NULL;
++	ndone = 0;
++	ret = 0;
++ fail:
++	for (i = 0; i < nactive; i++)
++		free(active[i]);
++	free(active);
++	for (i = 0; i < ndone; i++)
++		free(done[i]);
++	free(done);
++	return ret;
++}
++
+ void
+ source(int argc, char **argv)
+ {
+@@ -841,7 +1087,8 @@ sink(int argc, char **argv, const char *src)
+ 	off_t size, statbytes;
+ 	int setimes, targisdir, wrerrno = 0;
+ 	char ch, *cp, *np, *targ, *why, *vect[1], buf[2048];
+-	char *src_copy = NULL, *restrict_pattern = NULL;
++	char **patterns = NULL;
++	size_t n, npatterns = 0;
+ 	struct timeval tv[2];
+ 
+ #define	atime	tv[0]
+@@ -868,16 +1115,13 @@ sink(int argc, char **argv, const char *src)
+ 		 * Prepare to try to restrict incoming filenames to match
+ 		 * the requested destination file glob.
+ 		 */
+-		if ((src_copy = strdup(src)) == NULL)
+-			fatal("strdup failed");
+-		if ((restrict_pattern = strrchr(src_copy, '/')) != NULL) {
+-			*restrict_pattern++ = '\0';
+-		}
++		if (brace_expand(src, &patterns, &npatterns) != 0)
++			fatal("%s: could not expand pattern", __func__);
+ 	}
+ 	for (first = 1;; first = 0) {
+ 		cp = buf;
+ 		if (atomicio(read, remin, cp, 1) != 1)
+-			return;
++			goto done;
+ 		if (*cp++ == '\n')
+ 			SCREWUP("unexpected <newline>");
+ 		do {
+@@ -900,7 +1144,7 @@ sink(int argc, char **argv, const char *src)
+ 		}
+ 		if (buf[0] == 'E') {
+ 			(void) atomicio(vwrite, remout, "", 1);
+-			return;
++			goto done;
+ 		}
+ 		if (ch == '\n')
+ 			*--cp = 0;
+@@ -956,9 +1200,14 @@ sink(int argc, char **argv, const char *src)
+ 			run_err("error: unexpected filename: %s", cp);
+ 			exit(1);
+ 		}
+-		if (restrict_pattern != NULL &&
+-		    fnmatch(restrict_pattern, cp, 0) != 0)
+-			SCREWUP("filename does not match request");
++		if (npatterns > 0) {
++			for (n = 0; n < npatterns; n++) {
++				if (fnmatch(patterns[n], cp, 0) == 0)
++					break;
++			}
++			if (n >= npatterns)
++				SCREWUP("filename does not match request");
++		}
+ 		if (targisdir) {
+ 			static char *namebuf = NULL;
+ 			static size_t cursize = 0;
+@@ -1122,7 +1371,15 @@ bad:			run_err("%s: %s", np, strerror(errno));
+ 			break;
+ 		}
+ 	}
++done:
++	for (n = 0; n < npatterns; n++)
++		free(patterns[n]);
++	free(patterns);
++	return;
+ screwup:
++	for (n = 0; n < npatterns; n++)
++		free(patterns[n]);
++	free(patterns);
+ 	run_err("protocol error: %s", why);
+ 	exit(1);
+ }
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2019-6111-03.patch b/meta/recipes-core/dropbear/dropbear/CVE-2019-6111-03.patch
new file mode 100644
index 00000000000..1e0cd68b07d
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2019-6111-03.patch
@@ -0,0 +1,43 @@
+From 61bd0e3e6573277de17359763aa5827a189c8d7f Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Sat, 2 May 2026 08:43:26 +0800
+Subject: [PATCH] scp: Disallow -r to an existing directory
+
+Checks of received paths don't catch all cases in -r recursive mode, so
+disallow -r when the destination directory exists. This mitigates
+CVE-2019-6111, where unexpected files would be accepted from a malicious
+scp server.
+
+Alternatives like rsync could be used in that case.
+
+The new error message may be misleading if parent path components of the
+destination are also missing, though the command would have failed
+regardless.
+
+CVE: CVE-2019-6111
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/61bd0e3e6573277de17359763aa5827a189c8d7f]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ scp.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/scp.c b/scp.c
+index d151587c..09297a5b 100644
+--- a/scp.c
++++ b/scp.c
+@@ -583,6 +583,15 @@ tolocal(int argc, char **argv)
+ 			if (*suser == '\0')
+ 				suser = NULL;
+ 		}
++
++		char *dest = *(argv + argc - 1);
++		if (!(access(dest, F_OK) == 0 && errno == ENOENT)) {
++			/* paths sent from the server in recursive mode aren't adequately
++			 * checked that they match the requested files, so disallow this */
++			fprintf(stderr, "-r destination \"%s\" must not already exist\n", dest);
++			exit(1);
++		}
++
+ 		host = cleanhostname(host);
+ 		len = strlen(src) + CMDNEEDS + 20;
+ 		bp = xmalloc(len);
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2019-6111-04.patch b/meta/recipes-core/dropbear/dropbear/CVE-2019-6111-04.patch
new file mode 100644
index 00000000000..b718afc8c41
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2019-6111-04.patch
@@ -0,0 +1,34 @@
+From 0c5629a5d543ef5e4eff43345b1eedf2afef84ca Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Mon, 4 May 2026 21:35:57 +0800
+Subject: [PATCH] scp: don't use reallocarray
+
+reallocarray() isn't portable. An overflow check can be used instead.
+
+Fixes: 143291baca6e ("scp: more CVE-2019-6111 fix")
+
+CVE: CVE-2019-6111
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/0c5629a5d543ef5e4eff43345b1eedf2afef84ca]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ scp.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/scp.c b/scp.c
+index e5ce4e2f..2f7a6279 100644
+--- a/scp.c
++++ b/scp.c
+@@ -614,7 +614,12 @@ append(char *cp, char ***ap, size_t *np)
+ {
+ 	char **tmp;
+ 
+-	if ((tmp = reallocarray(*ap, *np + 1, sizeof(*tmp))) == NULL)
++	if (*np + 1 > (SIZE_MAX / sizeof(*tmp))) {
++		/* overflow */
++		return -1;
++	}
++
++	if ((tmp = realloc(*ap, (*np + 1) * sizeof(*tmp))) == NULL)
+ 		return -1;
+ 	tmp[(*np)] = cp;
+ 	(*np)++;
diff --git a/meta/recipes-core/dropbear/dropbear/CVE-2019-6111-05.patch b/meta/recipes-core/dropbear/dropbear/CVE-2019-6111-05.patch
new file mode 100644
index 00000000000..5e27c0ca44e
--- /dev/null
+++ b/meta/recipes-core/dropbear/dropbear/CVE-2019-6111-05.patch
@@ -0,0 +1,43 @@
+From 16ce059ed8e914e210af67e199041943ec747034 Mon Sep 17 00:00:00 2001
+From: Matt Johnston <matt@ucc.asn.au>
+Date: Mon, 4 May 2026 21:36:41 +0800
+Subject: [PATCH] scp: fix recursive overwrite check
+
+Non-recursive transfers were incorrectly disallowed to an existing
+destination.
+
+In addition, the destination check logic was wrong.
+
+Fixes: 61bd0e3e6573 ("scp: Disallow -r to an existing directory")
+
+CVE: CVE-2019-6111
+Upstream-Status: Backport [https://github.com/mkj/dropbear/commit/16ce059ed8e914e210af67e199041943ec747034]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ scp.c | 13 ++++++++-----
+ 1 file changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/scp.c b/scp.c
+index 2f7a6279..4b4990ea 100644
+--- a/scp.c
++++ b/scp.c
+@@ -585,11 +585,14 @@ tolocal(int argc, char **argv)
+ 		}
+ 
+ 		char *dest = *(argv + argc - 1);
+-		if (!(access(dest, F_OK) == 0 && errno == ENOENT)) {
+-			/* paths sent from the server in recursive mode aren't adequately
+-			 * checked that they match the requested files, so disallow this */
+-			fprintf(stderr, "-r destination \"%s\" must not already exist\n", dest);
+-			exit(1);
++		if (iamrecursive) {
++			/* Destination must not exist */
++			if (!(access(dest, F_OK) == -1 && errno == ENOENT)) {
++				/* paths sent from the server in recursive mode aren't adequately
++				 * checked that they match the requested files, so disallow this */
++				fprintf(stderr, "-r destination \"%s\" must not already exist\n", dest);
++				exit(1);
++			}
+ 		}
+ 
+ 		host = cleanhostname(host);
diff --git a/meta/recipes-core/dropbear/dropbear_2022.83.bb b/meta/recipes-core/dropbear/dropbear_2022.83.bb
index 93563aa3b47..d06bbd3a6db 100644
--- a/meta/recipes-core/dropbear/dropbear_2022.83.bb
+++ b/meta/recipes-core/dropbear/dropbear_2022.83.bb
@@ -29,7 +29,11 @@ SRC_URI = "http://matt.ucc.asn.au/dropbear/releases/dropbear-${PV}.tar.bz2 \
            file://0001-cli-runopts.c-add-missing-DROPBEAR_CLI_PUBKEY_AUTH.patch \
            file://0001-Avoid-unused-variable-with-DROPBEAR_CLI_PUBKEY_AUTH-.patch \
            file://CVE-2025-47203.patch \
-           file://CVE-2019-6111.patch \
+           file://CVE-2019-6111-01.patch \
+           file://CVE-2019-6111-02.patch \
+           file://CVE-2019-6111-03.patch \
+           file://CVE-2019-6111-04.patch \
+           file://CVE-2019-6111-05.patch \
            "
 
 SRC_URI[sha256sum] = "bc5a121ffbc94b5171ad5ebe01be42746d50aa797c9549a4639894a16749443b"
