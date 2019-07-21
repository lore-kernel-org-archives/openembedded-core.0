Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8F07ED91
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 14:25:31 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id t132so16407548pgb.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Jul 2019 07:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=MNWDWLMCjXLtR/YaX+SgRxXGOY2NriVpHQLv6fP7bTg=;
	b=eREeOCXQlk9Ck8n2jhl0Ujbkpvim6a9LS0aT62HGRQMijRmVwF/5E87AWNGRZ/YDTf
	Ch9zuSYFguWAMKsAFozj5+ooJBGQFNskmSgQXNdaQuOBBcSLbw/fnXKa/9TQ4tTOXL3y
	s+yN8Uy5fLhSbuqgwp4zHe59+cd6SoLyYgQZb6RB7oplF96/h0wFVL9fbNT0DsS7JInP
	bZUYYWuTqsVEDo+74oz+S9kNI7o+PNLV81qDzQhKb2CxylNtiUep8qzYmjQB1yCug2zA
	g6qG1ZaM2oWGcFwR3O6GtHO+MfDHIJXFfECXBB/oew3RoL4nzzloZrosF7BymPYJVcFf
	lM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=MNWDWLMCjXLtR/YaX+SgRxXGOY2NriVpHQLv6fP7bTg=;
	b=ZTx9jCYxcT7PP1wWrTp6yP6MGFe9bpThx/rWeB6Fj322Kb4HlSbEwYx9zc1NZEWwjk
	DpJninPnsME9LrXZAt0fgieIUOOn+OXfqz0ark0Bvjnumm6c612tfgsnCRIdrOB7zCRy
	1ubBrzGsuPIMLea+r9dFy58DTIk6qw16543+LdpsBVncyJGUsaf8uXHPXODlw1efQ1B7
	LCcMPhrwbYSXN1FngmKvZiEmDxpSks3UAROxtDr/2MPvUqrbThvapwbCbVsnZAL77ajT
	y3diZrq6OGOMpqTbJ3SU/G30rqCDT6etiuZTMWx1LyKFEQFSzyK64yaGrTi6sALq2PaC
	t+gg==
X-Gm-Message-State: APjAAAVATk/hym/Jc98pMNE5NeytkcQLlJs4ZnnUf8E9pMxQUGrYf1Xc
	KFYAihDHDr3TwAN9HvYBQqPEHAM4
X-Google-Smtp-Source: APXvYqyqlwra+Iw2jFiGvpguGveJkPRZVMPlOIhIPBzO90vUYdpsFe6Nzgr/plM1EeJrd8naoIyLXA==
X-Received: by 2002:a63:590f:: with SMTP id n15mr19895535pgb.190.1563719132196;
	Sun, 21 Jul 2019 07:25:32 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:bd4d:a6f4:da99:27b4])
	by smtp.gmail.com with ESMTPSA id
	a3sm28807750pfc.70.2019.07.21.07.25.31
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 21 Jul 2019 07:25:31 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Jul 2019 07:24:57 -0700
Message-Id: <3d7375eb2e459b891b4ba16c1fc486afbfecef2c.1563719003.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1563719003.git.akuster808@gmail.com>
References: <cover.1563719003.git.akuster808@gmail.com>
Subject: [thud] 08/30] file: Multiple Secruity fixes
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
X-List-Received-Date: Sun, 21 Jul 2019 14:25:31 -0000

From: Armin Kuster <akuster@mvista.com>

Source: https://github.com/file
MR: 97573, 97578, 97583, 97588
Type: Security Fix
Disposition: Backport from https://github.com/file/file
ChangeID: 159e532d518623f19ba777c8edc24d2dc7e3a4e9
Description:

CVE-2019-8905 is the same fix as CVE-2019-8907

Affects < 5.36.0

Fixes:
CVE-2019-8904
CVE-2019-8906
CVE-2019-8906
CVE-2019-8907

Signed-off-by: Armin Kuster <akuster@mvista.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../recipes-devtools/file/file/CVE-2019-8904.patch |  30 ++++++
 .../file/file/CVE-2019-8905_CVE-2019-8907.patch    | 120 +++++++++++++++++++++
 .../recipes-devtools/file/file/CVE-2019-8906.patch |  27 +++++
 meta/recipes-devtools/file/file_5.34.bb            |   3 +
 4 files changed, 180 insertions(+)
 create mode 100644 meta/recipes-devtools/file/file/CVE-2019-8904.patch
 create mode 100644 meta/recipes-devtools/file/file/CVE-2019-8905_CVE-2019-8907.patch
 create mode 100644 meta/recipes-devtools/file/file/CVE-2019-8906.patch

diff --git a/meta/recipes-devtools/file/file/CVE-2019-8904.patch b/meta/recipes-devtools/file/file/CVE-2019-8904.patch
new file mode 100644
index 0000000..5c3d6f7
--- /dev/null
+++ b/meta/recipes-devtools/file/file/CVE-2019-8904.patch
@@ -0,0 +1,30 @@
+From 94b7501f48e134e77716e7ebefc73d6bbe72ba55 Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Mon, 18 Feb 2019 17:30:41 +0000
+Subject: [PATCH] PR/62: spinpx: Avoid non-nul-terminated string read.
+
+Upstream-Status: Backport
+CVE: CVE-2019-8904
+Affects < 5.36
+[Fixup for thud context]
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/readelf.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+Index: git/src/readelf.c
+===================================================================
+--- git.orig/src/readelf.c
++++ git/src/readelf.c
+@@ -558,8 +558,8 @@ do_bid_note(struct magic_set *ms, unsign
+ 	}
+ 	if (namesz == 4 && strcmp((char *)&nbuf[noff], "Go") == 0 &&
+ 	    type == NT_GO_BUILD_ID && descsz < 128) {
+-		if (file_printf(ms, ", Go BuildID=%s",
+-		    (char *)&nbuf[doff]) == -1)
++		if (file_printf(ms, ", Go BuildID=%.*s",
++		    CAST(int, descsz), CAST(char *, &nbuf[doff])) == -1)
+ 			return 1;
+ 		return 1;
+ 	}
diff --git a/meta/recipes-devtools/file/file/CVE-2019-8905_CVE-2019-8907.patch b/meta/recipes-devtools/file/file/CVE-2019-8905_CVE-2019-8907.patch
new file mode 100644
index 0000000..a55b94c
--- /dev/null
+++ b/meta/recipes-devtools/file/file/CVE-2019-8905_CVE-2019-8907.patch
@@ -0,0 +1,120 @@
+From d65781527c8134a1202b2649695d48d5701ac60b Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Mon, 18 Feb 2019 17:46:56 +0000
+Subject: [PATCH] PR/62: spinpx: limit size of file_printable.
+
+Upstream-Status: Backport
+CVE: CVE-2019-8905
+CVE: CVE-2019-8907
+affects < 5.36
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ src/file.h      |  4 ++--
+ src/funcs.c     |  9 +++++----
+ src/readelf.c   |  7 ++++---
+ src/softmagic.c | 14 ++++++++------
+ 4 files changed, 19 insertions(+), 15 deletions(-)
+
+Index: git/src/file.h
+===================================================================
+--- git.orig/src/file.h
++++ git/src/file.h
+@@ -501,7 +501,7 @@ protected int file_looks_utf8(const unsi
+     size_t *);
+ protected size_t file_pstring_length_size(const struct magic *);
+ protected size_t file_pstring_get_length(const struct magic *, const char *);
+-protected char * file_printable(char *, size_t, const char *);
++protected char * file_printable(char *, size_t, const char *, size_t);
+ #ifdef __EMX__
+ protected int file_os2_apptype(struct magic_set *, const char *, const void *,
+     size_t);
+Index: git/src/funcs.c
+===================================================================
+--- git.orig/src/funcs.c
++++ git/src/funcs.c
+@@ -595,12 +595,13 @@ file_pop_buffer(struct magic_set *ms, fi
+  * convert string to ascii printable format.
+  */
+ protected char *
+-file_printable(char *buf, size_t bufsiz, const char *str)
++file_printable(char *buf, size_t bufsiz, const char *str, size_t slen)
+ {
+-	char *ptr, *eptr;
++	char *ptr, *eptr = buf + bufsiz - 1;
+ 	const unsigned char *s = (const unsigned char *)str;
++	const unsigned char *es = s + slen;
+ 
+-	for (ptr = buf, eptr = ptr + bufsiz - 1; ptr < eptr && *s; s++) {
++	for (ptr = buf;  ptr < eptr && s < es && *s; s++) {
+ 		if (isprint(*s)) {
+ 			*ptr++ = *s;
+ 			continue;
+Index: git/src/readelf.c
+===================================================================
+--- git.orig/src/readelf.c
++++ git/src/readelf.c
+@@ -750,7 +750,7 @@ do_core_note(struct magic_set *ms, unsig
+ 			if (file_printf(ms, ", from '%.31s', pid=%u, uid=%u, "
+ 			    "gid=%u, nlwps=%u, lwp=%u (signal %u/code %u)",
+ 			    file_printable(sbuf, sizeof(sbuf),
+-			    CAST(char *, pi.cpi_name)),
++			    CAST(char *, pi.cpi_name), sizeof(pi.cpi_name)),
+ 			    elf_getu32(swap, (uint32_t)pi.cpi_pid),
+ 			    elf_getu32(swap, pi.cpi_euid),
+ 			    elf_getu32(swap, pi.cpi_egid),
+@@ -1655,7 +1655,8 @@ dophn_exec(struct magic_set *ms, int cla
+ 		return -1;
+ 	if (interp[0])
+ 		if (file_printf(ms, ", interpreter %s",
+-		    file_printable(ibuf, sizeof(ibuf), interp)) == -1)
++		    file_printable(ibuf, sizeof(ibuf), interp, sizeof(interp)))
++			== -1)
+ 			return -1;
+ 	return 0;
+ }
+Index: git/src/softmagic.c
+===================================================================
+--- git.orig/src/softmagic.c
++++ git/src/softmagic.c
+@@ -616,8 +616,8 @@ mprint(struct magic_set *ms, struct magi
+   	case FILE_LESTRING16:
+ 		if (m->reln == '=' || m->reln == '!') {
+ 			if (file_printf(ms, F(ms, desc, "%s"), 
+-			    file_printable(sbuf, sizeof(sbuf), m->value.s))
+-			    == -1)
++			    file_printable(sbuf, sizeof(sbuf), m->value.s,
++			    sizeof(m->value.s))) == -1)
+ 				return -1;
+ 			t = ms->offset + m->vallen;
+ 		}
+@@ -644,7 +644,8 @@ mprint(struct magic_set *ms, struct magi
+ 			}
+ 
+ 			if (file_printf(ms, F(ms, desc, "%s"),
+-			    file_printable(sbuf, sizeof(sbuf), str)) == -1)
++			    file_printable(sbuf, sizeof(sbuf), str,
++				sizeof(p->s) - (str - p->s))) == -1)
+ 				return -1;
+ 
+ 			if (m->type == FILE_PSTRING)
+@@ -750,7 +751,7 @@ mprint(struct magic_set *ms, struct magi
+ 			return -1;
+ 		}
+ 		rval = file_printf(ms, F(ms, desc, "%s"),
+-		    file_printable(sbuf, sizeof(sbuf), cp));
++		    file_printable(sbuf, sizeof(sbuf), cp, ms->search.rm_len));
+ 		free(cp);
+ 
+ 		if (rval == -1)
+@@ -777,7 +778,8 @@ mprint(struct magic_set *ms, struct magi
+ 		break;
+ 	case FILE_DER:
+ 		if (file_printf(ms, F(ms, desc, "%s"), 
+-		    file_printable(sbuf, sizeof(sbuf), ms->ms_value.s)) == -1)
++		    file_printable(sbuf, sizeof(sbuf), ms->ms_value.s,
++                        sizeof(ms->ms_value.s))) == -1)
+ 			return -1;
+ 		t = ms->offset;
+ 		break;
diff --git a/meta/recipes-devtools/file/file/CVE-2019-8906.patch b/meta/recipes-devtools/file/file/CVE-2019-8906.patch
new file mode 100644
index 0000000..1079ac6
--- /dev/null
+++ b/meta/recipes-devtools/file/file/CVE-2019-8906.patch
@@ -0,0 +1,27 @@
+From 2858eaf99f6cc5aae129bcbf1e24ad160240185f Mon Sep 17 00:00:00 2001
+From: Christos Zoulas <christos@zoulas.com>
+Date: Wed, 2 Jan 2019 19:44:14 +0000
+Subject: [PATCH] Avoid OOB read (found by ASAN reported by F. Alonso)
+
+Upstream-Status: Backport
+CVE: CVE-2019-8906
+Affects < 5.36
+[Fixup for thud context]
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+---
+ src/readelf.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: git/src/readelf.c
+===================================================================
+--- git.orig/src/readelf.c
++++ git/src/readelf.c
+@@ -745,7 +745,7 @@ do_core_note(struct magic_set *ms, unsig
+ 			char sbuf[512];
+ 			struct NetBSD_elfcore_procinfo pi;
+ 			memset(&pi, 0, sizeof(pi));
+-			memcpy(&pi, nbuf + doff, descsz);
++			memcpy(&pi, nbuf + doff, MIN(descsz, sizeof(pi)));
+ 
+ 			if (file_printf(ms, ", from '%.31s', pid=%u, uid=%u, "
+ 			    "gid=%u, nlwps=%u, lwp=%u (signal %u/code %u)",
diff --git a/meta/recipes-devtools/file/file_5.34.bb b/meta/recipes-devtools/file/file_5.34.bb
index 5d92913..cb19642 100644
--- a/meta/recipes-devtools/file/file_5.34.bb
+++ b/meta/recipes-devtools/file/file_5.34.bb
@@ -16,6 +16,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
 
 SRC_URI = "git://github.com/file/file.git \
         file://debian-742262.patch \
+        file://CVE-2019-8906.patch \
+        file://CVE-2019-8904.patch \
+        file://CVE-2019-8905_CVE-2019-8907.patch \
         "
 
 SRCREV = "315cef2f699da3c31a54bd3c6c6070680fbaf1f5"
-- 
2.7.4


