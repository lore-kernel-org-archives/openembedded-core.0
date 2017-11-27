Return-Path: <akuster808@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id BEB7577811
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 02:35:18 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id k7so7595199pln.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Nov 2017 18:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=LBHHP8PtYLpVeONma3plscxRt/wYObRLBAYHU317cmg=;
	b=qBYc0CsRAgCRDgx/gHXpvYEIH9vvgcQRJVHg026T0eGnnbMN0JUU8K4yQbJRYteJhB
	4IWYsb1b7KO19p7nvb8NpFDB87ujlsQi0vThH5xrsS1iFc6jKvhlrRQyKzoHSw9M2xwk
	B4UPJUMoyLCmuoZ9AKYyS3gGDMSP5fF+p8tLq21Qsv02/OYaWEcA9PJxgBt5UpIa7KcM
	yym6Rx1ZcU4Y5yIkNPNaeAqdAFbwc2X/oh2mZwsUAZoJ+Rh8AxbR+ccrhdAds+ofLobC
	noYoOm7FEIHTPYCsY6WqBfa3IGrCX1wqSNKzBenWReJnz0xNChHRwotedywTseREIsDk
	CKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=LBHHP8PtYLpVeONma3plscxRt/wYObRLBAYHU317cmg=;
	b=S0kdq6oYwelrwghoL42EVIxVSp72ZJV6YjzT3kSkcV1e42SwevPW2msU3wlbouRVxU
	2CqI5UpREYjtTn8BkGdrcySDfe41swiG9AHgTTnLuwudOA2tvNbpDylk2ti5dTZJbCTV
	JGNGvsRozdmcZ8+g/+8HMz05XsrZNwPU/B1Ue4mSL/ycZ7pWnn28gk5imS4N0g8Fy+2z
	UhwlT7j/5QGmXsLSe3pj5RlVBXcFo1w5Kha/4RnIXxGBZSwgO8Zt4xwMg5AlT5OIie4P
	JV2q5fBOXw1QAn42Sp7CSo4AO4ujHxtU9nRZ5aUgKAP0s9IcSpGsOVwOY4tuEz2VeVx/
	Tmew==
X-Gm-Message-State: AJaThX6VNbIHLb705D6vHhXCVOA/WVP6GH9RIHyrBb+cv8BvYiamrKwt
	pCqzx1lGlxVgf+kfY30XiH+QKQ==
X-Google-Smtp-Source: AGs4zMaa6EJTDY3OnOdEBHTEqGzo0wzNWyRuWKKnfgrcGYvCv2kRp1/ChZaHBhIKze1lGKm7OJCgZA==
X-Received: by 10.159.194.1 with SMTP id x1mr37194775pln.48.1511750120368;
	Sun, 26 Nov 2017 18:35:20 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4001:9ea0:b082:a618:f613:3498])
	by smtp.gmail.com with ESMTPSA id
	e3sm17809103pfe.92.2017.11.26.18.35.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Nov 2017 18:35:20 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: akuster@mvista.com,
	openembedded-core@lists.openembedded.org
Date: Sun, 26 Nov 2017 18:34:53 -0800
Message-Id: <1511750112-2263-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
References: <1511750112-2263-1-git-send-email-akuster808@gmail.com>
Subject: [pyro][PATCH 07/26] binutils: Security fix for CVE-2017-8398
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
X-List-Received-Date: Mon, 27 Nov 2017 02:35:18 -0000

Affects: <= 2.28

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.28.inc   |   1 +
 .../binutils/binutils/CVE-2017-8398.patch          | 147 +++++++++++++++++++++
 2 files changed, 148 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2017-8398.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.28.inc b/meta/recipes-devtools/binutils/binutils-2.28.inc
index ca78a30..d58d7b8 100644
--- a/meta/recipes-devtools/binutils/binutils-2.28.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.28.inc
@@ -49,6 +49,7 @@ SRC_URI = "\
      file://CVE-2017-8394.patch \
      file://CVE-2017-8395.patch \
      file://CVE-2017-8396_8397.patch \
+     file://CVE-2017-8398.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2017-8398.patch b/meta/recipes-devtools/binutils/binutils/CVE-2017-8398.patch
new file mode 100644
index 0000000..5b9acc8
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2017-8398.patch
@@ -0,0 +1,147 @@
+From d949ff5607b9f595e0eed2ff15fbe5eb84eb3a34 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Fri, 28 Apr 2017 10:28:04 +0100
+Subject: [PATCH] Fix heap-buffer overflow bugs caused when dumping debug
+ information from a corrupt binary.
+
+	PR binutils/21438
+	* dwarf.c (process_extended_line_op): Do not assume that the
+	string extracted from the section is NUL terminated.
+	(fetch_indirect_string): If the string retrieved from the section
+	is not NUL terminated, return an error message.
+	(fetch_indirect_line_string): Likewise.
+	(fetch_indexed_string): Likewise.
+
+Upstream-Status: Backport
+CVE: CVE-2017-8398
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ binutils/ChangeLog | 10 +++++++++
+ binutils/dwarf.c   | 66 +++++++++++++++++++++++++++++++++++++++++-------------
+ 2 files changed, 60 insertions(+), 16 deletions(-)
+
+Index: git/binutils/dwarf.c
+===================================================================
+--- git.orig/binutils/dwarf.c
++++ git/binutils/dwarf.c
+@@ -472,15 +472,20 @@ process_extended_line_op (unsigned char
+       printf (_("  Entry\tDir\tTime\tSize\tName\n"));
+       printf ("   %d\t", ++state_machine_regs.last_file_entry);
+ 
+-      name = data;
+-      data += strnlen ((char *) data, end - data) + 1;
+-      printf ("%s\t", dwarf_vmatoa ("u", read_uleb128 (data, & bytes_read, end)));
+-      data += bytes_read;
+-      printf ("%s\t", dwarf_vmatoa ("u", read_uleb128 (data, & bytes_read, end)));
+-      data += bytes_read;
+-      printf ("%s\t", dwarf_vmatoa ("u", read_uleb128 (data, & bytes_read, end)));
+-      data += bytes_read;
+-      printf ("%s\n\n", name);
++      {
++	size_t l;
++
++	name = data;
++	l = strnlen ((char *) data, end - data);
++	data += len + 1;
++	printf ("%s\t", dwarf_vmatoa ("u", read_uleb128 (data, & bytes_read, end)));
++	data += bytes_read;
++	printf ("%s\t", dwarf_vmatoa ("u", read_uleb128 (data, & bytes_read, end)));
++	data += bytes_read;
++	printf ("%s\t", dwarf_vmatoa ("u", read_uleb128 (data, & bytes_read, end)));
++	data += bytes_read;
++	printf ("%.*s\n\n", (int) l, name);
++      }
+ 
+       if (((unsigned int) (data - orig_data) != len) || data == end)
+ 	warn (_("DW_LNE_define_file: Bad opcode length\n"));
+@@ -597,18 +602,27 @@ static const unsigned char *
+ fetch_indirect_string (dwarf_vma offset)
+ {
+   struct dwarf_section *section = &debug_displays [str].section;
++  const unsigned char * ret;
+ 
+   if (section->start == NULL)
+     return (const unsigned char *) _("<no .debug_str section>");
+ 
+-  if (offset > section->size)
++  if (offset >= section->size)
+     {
+       warn (_("DW_FORM_strp offset too big: %s\n"),
+ 	    dwarf_vmatoa ("x", offset));
+       return (const unsigned char *) _("<offset is too big>");
+     }
++  ret = section->start + offset;
++  /* Unfortunately we cannot rely upon the .debug_str section ending with a
++     NUL byte.  Since our caller is expecting to receive a well formed C
++     string we test for the lack of a terminating byte here.  */
++  if (strnlen ((const char *) ret, section->size - offset)
++      == section->size - offset)
++    ret = (const unsigned char *)
++      _("<no NUL byte at end of .debug_str section>");
+ 
+-  return (const unsigned char *) section->start + offset;
++  return ret; 
+ }
+ 
+ static const char *
+@@ -621,6 +635,7 @@ fetch_indexed_string (dwarf_vma idx, str
+   struct dwarf_section *str_section = &debug_displays [str_sec_idx].section;
+   dwarf_vma index_offset = idx * offset_size;
+   dwarf_vma str_offset;
++  const char * ret;
+ 
+   if (index_section->start == NULL)
+     return (dwo ? _("<no .debug_str_offsets.dwo section>")
+@@ -628,7 +643,7 @@ fetch_indexed_string (dwarf_vma idx, str
+ 
+   if (this_set != NULL)
+     index_offset += this_set->section_offsets [DW_SECT_STR_OFFSETS];
+-  if (index_offset > index_section->size)
++  if (index_offset >= index_section->size)
+     {
+       warn (_("DW_FORM_GNU_str_index offset too big: %s\n"),
+ 	    dwarf_vmatoa ("x", index_offset));
+@@ -641,14 +656,22 @@ fetch_indexed_string (dwarf_vma idx, str
+ 
+   str_offset = byte_get (index_section->start + index_offset, offset_size);
+   str_offset -= str_section->address;
+-  if (str_offset > str_section->size)
++  if (str_offset >= str_section->size)
+     {
+       warn (_("DW_FORM_GNU_str_index indirect offset too big: %s\n"),
+ 	    dwarf_vmatoa ("x", str_offset));
+       return _("<indirect index offset is too big>");
+     }
+ 
+-  return (const char *) str_section->start + str_offset;
++  ret = (const char *) str_section->start + str_offset;
++  /* Unfortunately we cannot rely upon str_section ending with a NUL byte.
++     Since our caller is expecting to receive a well formed C string we test
++     for the lack of a terminating byte here.  */
++  if (strnlen (ret, str_section->size - str_offset)
++      == str_section->size - str_offset)
++    ret = (const char *) _("<no NUL byte at end of section>");
++
++  return ret;
+ }
+ 
+ static const char *
+Index: git/binutils/ChangeLog
+===================================================================
+--- git.orig/binutils/ChangeLog
++++ git/binutils/ChangeLog
+@@ -1,3 +1,13 @@
++2017-04-28  Nick Clifton  <nickc@redhat.com>
++
++       PR binutils/21438
++       * dwarf.c (process_extended_line_op): Do not assume that the
++       string extracted from the section is NUL terminated.
++       (fetch_indirect_string): If the string retrieved from the section
++       is not NUL terminated, return an error message.
++       (fetch_indirect_line_string): Likewise.
++       (fetch_indexed_string): Likewise.
++
+ 2017-02-14  Nick Clifton  <nickc@redhat.com>
+ 
+ 	PR binutils/21157
-- 
2.7.4


