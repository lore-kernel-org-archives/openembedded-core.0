Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id EB1856B513
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:18:14 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id g1so3529026wmh.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 04:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=zFhEY93h0ByPzEgm+KvHVhWI1FCowl77OLmAryxXgx8=;
	b=a1EQQMSQ8LxXTxAB3fWJ4kgaV5XBxzSA8KYY6nU32W1gsAP3vH3tmsSGkl7QeCcLpI
	46CtzkaQHsnxI2GvdudjNQKQPabDP49VgbznbtMIzER0HhS9BYhnuCDqNFnPAxMCY3r0
	sOKjOQ+4mh/ipqIrqgHkuMGn+aYd+bQOKB6YxjCUnRqrkJ7/07SlCiPeEzn/oZsUJGKf
	Z62iHHhC7Ex5pLSq2fl9eEkyuuuOhVTi0wcv/y3VlM7iEYNdWEB5MLgtImwpn98dAuq7
	5rlDdXK2rq8vaYXZX7GzEQBoIIzsN6Az/3CTQegeZIuOthsHoUWgTICQe4TpVILzz/eU
	fq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=zFhEY93h0ByPzEgm+KvHVhWI1FCowl77OLmAryxXgx8=;
	b=IrzGJRVyOifDB+CgwPiCN6fo9K1br2AvQe+GX/L+XA5yYGnPGV8ixg9f5TyyIis4XR
	3cvX/yS/VzNXwjIfoutlLfYyzOUFhwtOkMgR4fqqxmgK+ip+H4JmGfw4LTiOV/ymF/wK
	NIu3gtaEDdIJJFvDADGC5mA9su3DjV+vqCYyMJo5K+Zx6W0bB67ldy9GbHp9pHAGy+0x
	VLCb+8VKWSoyD+iz9MzX9jp1RzxEoEL0j+XWFZQHWi4wJJ91R8B2NhOCh08vEsb7jxF1
	kEhp1fCPOIPv/z5du2ziWJMKPPLW8hWFFmAlIsDyZLEUnUV0DdaJfjiyP5eAjowzbnAF
	Dniw==
X-Gm-Message-State: APjAAAUSinvHNl3O8CxbKpyVj28D2SXN9qWrg9VhdUmCkhKNQFJSU8BV
	B0D5UYx6t7e/pzGjCYzC36IlHQno
X-Google-Smtp-Source: APXvYqzqpLE4JbYdAh80UNWHF1+lD7sS616H/25emgwxRf/vII6F+UPF1QewWy3XR+MRTLTkhLi0fQ==
X-Received: by 2002:a05:600c:145:: with SMTP id
	w5mr9870621wmm.157.1580288897303; 
	Wed, 29 Jan 2020 01:08:17 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:16 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:28 +0100
Message-Id: <20200129090738.1398-14-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 14/24] ncurses: upgrade 6.1+20190803 -> 6.1+20191019
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:00 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...selective-backport-of-20191012-patch.patch | 169 ------------------
 ....1+20190803.bb => ncurses_6.1+20191019.bb} |   9 +-
 2 files changed, 4 insertions(+), 174 deletions(-)
 delete mode 100644 meta/recipes-core/ncurses/files/0001-ncurses-selective-backport-of-20191012-patch.patch
 rename meta/recipes-core/ncurses/{ncurses_6.1+20190803.bb => ncurses_6.1+20191019.bb} (55%)

diff --git a/meta/recipes-core/ncurses/files/0001-ncurses-selective-backport-of-20191012-patch.patch b/meta/recipes-core/ncurses/files/0001-ncurses-selective-backport-of-20191012-patch.patch
deleted file mode 100644
index 7870c4ba322..00000000000
--- a/meta/recipes-core/ncurses/files/0001-ncurses-selective-backport-of-20191012-patch.patch
+++ /dev/null
@@ -1,169 +0,0 @@
-From 064b77f173337aa790f1cec0d741bfbc61a33d31 Mon Sep 17 00:00:00 2001
-From: Trevor Gamblin <trevor.gamblin@windriver.com>
-Date: Fri, 18 Oct 2019 09:57:43 -0400
-Subject: [PATCH] ncurses: selective backport of 20191012 patch
-
-Upstream-Status: Backport [https://salsa.debian.org/debian/ncurses/commit/243908b1e3d81]
-
-Contents of the upstream patch that are not applied to comp_hash.c, 
-parse_entry.c, or dump_entry.c have been omitted.
-
-CVE: CVE-2019-17594
-CVE: CVE-2019-17595
-
-Signed-off-by: Trevor Gamblin  <trevor.gamblin@windriver.com>
-
----
- ncurses/tinfo/comp_hash.c   | 14 ++++++++++----
- ncurses/tinfo/parse_entry.c | 32 ++++++++++++++++----------------
- progs/dump_entry.c          |  7 ++++---
- 3 files changed, 30 insertions(+), 23 deletions(-)
-
-diff --git a/ncurses/tinfo/comp_hash.c b/ncurses/tinfo/comp_hash.c
-index 21f165ca..a62d38f9 100644
---- a/ncurses/tinfo/comp_hash.c
-+++ b/ncurses/tinfo/comp_hash.c
-@@ -44,7 +44,7 @@
- #include <tic.h>
- #include <hashsize.h>
- 
--MODULE_ID("$Id: comp_hash.c,v 1.49 2019/03/10 00:06:48 tom Exp $")
-+MODULE_ID("$Id: comp_hash.c,v 1.51 2019/10/12 16:32:13 tom Exp $")
- 
- /*
-  * Finds the entry for the given string in the hash table if present.
-@@ -63,7 +63,9 @@ _nc_find_entry(const char *string,
- 
-     hashvalue = data->hash_of(string);
- 
--    if (data->table_data[hashvalue] >= 0) {
-+    if (hashvalue >= 0
-+	&& (unsigned) hashvalue < data->table_size
-+	&& data->table_data[hashvalue] >= 0) {
- 
- 	real_table = _nc_get_table(termcap);
- 	ptr = real_table + data->table_data[hashvalue];
-@@ -96,7 +98,9 @@ _nc_find_type_entry(const char *string,
-     const HashData *data = _nc_get_hash_info(termcap);
-     int hashvalue = data->hash_of(string);
- 
--    if (data->table_data[hashvalue] >= 0) {
-+    if (hashvalue >= 0
-+	&& (unsigned) hashvalue < data->table_size
-+	&& data->table_data[hashvalue] >= 0) {
- 	const struct name_table_entry *const table = _nc_get_table(termcap);
- 
- 	ptr = table + data->table_data[hashvalue];
-@@ -124,7 +128,9 @@ _nc_find_user_entry(const char *string)
- 
-     hashvalue = data->hash_of(string);
- 
--    if (data->table_data[hashvalue] >= 0) {
-+    if (hashvalue >= 0
-+	&& (unsigned) hashvalue < data->table_size
-+	&& data->table_data[hashvalue] >= 0) {
- 
- 	real_table = _nc_get_userdefs_table();
- 	ptr = real_table + data->table_data[hashvalue];
-diff --git a/ncurses/tinfo/parse_entry.c b/ncurses/tinfo/parse_entry.c
-index f8cca8b5..064376c5 100644
---- a/ncurses/tinfo/parse_entry.c
-+++ b/ncurses/tinfo/parse_entry.c
-@@ -47,7 +47,7 @@
- #include <ctype.h>
- #include <tic.h>
- 
--MODULE_ID("$Id: parse_entry.c,v 1.97 2019/08/03 23:10:38 tom Exp $")
-+MODULE_ID("$Id: parse_entry.c,v 1.98 2019/10/12 00:50:31 tom Exp $")
- 
- #ifdef LINT
- static short const parametrized[] =
-@@ -654,12 +654,12 @@ _nc_capcmp(const char *s, const char *t)
- }
- 
- static void
--append_acs0(string_desc * dst, int code, int src)
-+append_acs0(string_desc * dst, int code, char *src, size_t off)
- {
--    if (src != 0) {
-+    if (src != 0 && off < strlen(src)) {
- 	char temp[3];
- 	temp[0] = (char) code;
--	temp[1] = (char) src;
-+	temp[1] = src[off];
- 	temp[2] = 0;
- 	_nc_safe_strcat(dst, temp);
-     }
-@@ -669,7 +669,7 @@ static void
- append_acs(string_desc * dst, int code, char *src)
- {
-     if (VALID_STRING(src) && strlen(src) == 1) {
--	append_acs0(dst, code, *src);
-+	append_acs0(dst, code, src, 0);
-     }
- }
- 
-@@ -1038,17 +1038,17 @@ postprocess_terminfo(TERMTYPE2 *tp)
- 	_nc_str_init(&result, buf2, sizeof(buf2));
- 	_nc_safe_strcat(&result, acs_chars);
- 
--	append_acs0(&result, 'l', box_chars_1[0]);	/* ACS_ULCORNER */
--	append_acs0(&result, 'q', box_chars_1[1]);	/* ACS_HLINE */
--	append_acs0(&result, 'k', box_chars_1[2]);	/* ACS_URCORNER */
--	append_acs0(&result, 'x', box_chars_1[3]);	/* ACS_VLINE */
--	append_acs0(&result, 'j', box_chars_1[4]);	/* ACS_LRCORNER */
--	append_acs0(&result, 'm', box_chars_1[5]);	/* ACS_LLCORNER */
--	append_acs0(&result, 'w', box_chars_1[6]);	/* ACS_TTEE */
--	append_acs0(&result, 'u', box_chars_1[7]);	/* ACS_RTEE */
--	append_acs0(&result, 'v', box_chars_1[8]);	/* ACS_BTEE */
--	append_acs0(&result, 't', box_chars_1[9]);	/* ACS_LTEE */
--	append_acs0(&result, 'n', box_chars_1[10]);	/* ACS_PLUS */
-+	append_acs0(&result, 'l', box_chars_1, 0);	/* ACS_ULCORNER */
-+	append_acs0(&result, 'q', box_chars_1, 1);	/* ACS_HLINE */
-+	append_acs0(&result, 'k', box_chars_1, 2);	/* ACS_URCORNER */
-+	append_acs0(&result, 'x', box_chars_1, 3);	/* ACS_VLINE */
-+	append_acs0(&result, 'j', box_chars_1, 4);	/* ACS_LRCORNER */
-+	append_acs0(&result, 'm', box_chars_1, 5);	/* ACS_LLCORNER */
-+	append_acs0(&result, 'w', box_chars_1, 6);	/* ACS_TTEE */
-+	append_acs0(&result, 'u', box_chars_1, 7);	/* ACS_RTEE */
-+	append_acs0(&result, 'v', box_chars_1, 8);	/* ACS_BTEE */
-+	append_acs0(&result, 't', box_chars_1, 9);	/* ACS_LTEE */
-+	append_acs0(&result, 'n', box_chars_1, 10);	/* ACS_PLUS */
- 
- 	if (buf2[0]) {
- 	    acs_chars = _nc_save_str(buf2);
-diff --git a/progs/dump_entry.c b/progs/dump_entry.c
-index d0e420ec..8a47084a 100644
---- a/progs/dump_entry.c
-+++ b/progs/dump_entry.c
-@@ -39,7 +39,7 @@
- #include "termsort.c"		/* this C file is generated */
- #include <parametrized.h>	/* so is this */
- 
--MODULE_ID("$Id: dump_entry.c,v 1.173 2019/05/11 21:02:24 tom Exp $")
-+MODULE_ID("$Id: dump_entry.c,v 1.175 2019/10/12 15:59:07 tom Exp $")
- 
- #define DISCARD(string) string = ABSENT_STRING
- #define PRINTF (void) printf
-@@ -1136,7 +1136,8 @@ fmt_entry(TERMTYPE2 *tterm,
- 				*d++ = '\\';
- 				*d = ':';
- 			    } else if (*d == '\\') {
--				*++d = *s++;
-+				if ((*++d = *s++) == '\0')
-+				    break;
- 			    }
- 			    d++;
- 			    *d = '\0';
-@@ -1396,7 +1397,7 @@ one_one_mapping(const char *mapping)
- 
-     if (VALID_STRING(mapping)) {
- 	int n = 0;
--	while (mapping[n] != '\0') {
-+	while (mapping[n] != '\0' && mapping[n + 1] != '\0') {
- 	    if (isLine(mapping[n]) &&
- 		mapping[n] != mapping[n + 1]) {
- 		result = FALSE;
--- 
-2.17.1
-
diff --git a/meta/recipes-core/ncurses/ncurses_6.1+20190803.bb b/meta/recipes-core/ncurses/ncurses_6.1+20191019.bb
similarity index 55%
rename from meta/recipes-core/ncurses/ncurses_6.1+20190803.bb
rename to meta/recipes-core/ncurses/ncurses_6.1+20191019.bb
index e638a3737ca..ee7d4bed287 100644
--- a/meta/recipes-core/ncurses/ncurses_6.1+20190803.bb
+++ b/meta/recipes-core/ncurses/ncurses_6.1+20191019.bb
@@ -1,12 +1,11 @@
 require ncurses.inc
 
 SRC_URI += "file://0001-tic-hang.patch \
-            file://0002-configure-reproducible.patch \
-            file://config.cache \
-            file://0001-ncurses-selective-backport-of-20191012-patch.patch \
-"
+           file://0002-configure-reproducible.patch \
+           file://config.cache \
+           "
 # commit id corresponds to the revision in package version
-SRCREV = "3c9b2677c96c645496997321bf2fe465a5e7e21f"
+SRCREV = "ea70ec815b362f5bbad7a827a2edf50fd2b459cc"
 S = "${WORKDIR}/git"
 EXTRA_OECONF += "--with-abi-version=5 --cache-file=${B}/config.cache"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>\d+(\.\d+)+(\+\d+)*)"
-- 
2.25.0


