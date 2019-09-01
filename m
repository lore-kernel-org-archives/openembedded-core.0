Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com
	[209.85.215.193])
	by mail.openembedded.org (Postfix) with ESMTP id D347A7F285
	for <openembedded-core@lists.openembedded.org>;
	Sun,  1 Sep 2019 14:36:25 +0000 (UTC)
Received: by mail-pg1-f193.google.com with SMTP id x15so5929722pgg.8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 01 Sep 2019 07:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=J8tzaqytppEc6hNQ1t1ObtN1ks1g8ME/G1Xwh+gUkB8=;
	b=XgVRzKHywsnqJ53CgeYUvaCfMqancbjehY+mq+uoI4IhFcbEDNQTAjPh/hmzFyUc9+
	nS/wM75wmGKxOQpdEsmYzTAnUhnJHUKQfD2aFtiNGR38zpy+z3tEC9bCYm3dQ8tMZFoW
	fcB8/lDuXJ0xWckNM89STdESnaMDnNqPjBxAvJ/sOT582Nv66v8JOM/kXoxlEkkTyVwT
	b/+pVKIi9oSSws1C+fbhtNRBRtV5n2bjHwsbQPWXzv9FnF0XKk0N0QBACzMuGDGubwdx
	3MQu2ABhDM8gO3P/O41VKUH7A/o9XOfLeDtvaJeRbMQYZD7gom8O6a62rmQLoEb6vsCM
	LnUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=J8tzaqytppEc6hNQ1t1ObtN1ks1g8ME/G1Xwh+gUkB8=;
	b=D4sp1zZ2vneJWIiWh2j3ZIzAJ3+kq4/2VP/244YHGU0bRnlgpBMQkY23rKGVi2uI6q
	OcmBGM0iPzWGuNdxNOnDEVayFpT73cdaoNJLzaJQkijX6p62/FW58jonpYkx7A9Q5Kbw
	eInejGd3ymWouL+YrUSGQjfeLBRPwGJDooTI9/HmrNdKIsTdA7+TGL8DSk22tE+me59E
	BO04TYtIqkbyhl1Zgod2lojMVDVJZ8mO3jP1VcVYeoiooHTYOO9z0QzfaN6pCfhJYOmw
	UrtVtFVSRfocHSONPA98HU1N9yrmRBEBUx2qf8CSuyrGSrCI+J3/Dv4p6I3AxasyBHYp
	YpPA==
X-Gm-Message-State: APjAAAW8VZcRAohfbNlN3dFe4Ew6m2KaINQaJO44I+g1Ne0VeI68mtkJ
	eZ0WBcm0CYQjnn3EYJ+LqPRWrMTb
X-Google-Smtp-Source: APXvYqxHyF4waD+p/Dq3nv7cguXZNlBv6LWLBnxW0zx/q3iTpaHa6eX3LRgKibkpltqQWhmWKTCSDQ==
X-Received: by 2002:aa7:9ae7:: with SMTP id y7mr8836095pfp.246.1567348586671; 
	Sun, 01 Sep 2019 07:36:26 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:1d53:5246:e59:bfe9])
	by smtp.gmail.com with ESMTPSA id
	s16sm15911381pfs.6.2019.09.01.07.36.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 01 Sep 2019 07:36:26 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  1 Sep 2019 07:35:39 -0700
Message-Id: <a2caaefa7d21fd455d5cfa61656403fc57df7098.1567348433.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1567348433.git.akuster808@gmail.com>
References: <cover.1567348433.git.akuster808@gmail.com>
Subject: [warrior 01/43] binutils: fix CVE-2019-12972 CVE-2019-9071
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
X-List-Received-Date: Sun, 01 Sep 2019 14:36:25 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

(From OE-Core rev: 093f0914f261a27d58ecba9c1e9d3b78a35af012)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.32.inc   |   2 +
 .../binutils/binutils/CVE-2019-12972.patch         |  51 +++++++
 .../binutils/binutils/CVE-2019-9071.patch          | 164 +++++++++++++++++++++
 3 files changed, 217 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index 49e6827..31c24a3 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -48,6 +48,8 @@ SRC_URI = "\
      file://CVE-2019-9075.patch \
      file://CVE-2019-9076.patch \
      file://CVE-2019-9077.patch \
+     file://CVE-2019-9071.patch \
+     file://CVE-2019-12972.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
new file mode 100644
index 0000000..07d1d65
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-12972.patch
@@ -0,0 +1,51 @@
+From 30bcc01478433a1cb05b36dc5c4beef7d2c89b5b Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Fri, 21 Jun 2019 11:51:38 +0930
+Subject: [PATCH] PR24689, string table corruption
+
+The testcase in the PR had a e_shstrndx section of type SHT_GROUP.
+hdr->contents were initialized by setup_group rather than being read
+from the file, thus last byte was not zero and string dereference ran
+off the end of the buffer.
+
+	PR 24689
+	* elfcode.h (elf_object_p): Check type of e_shstrndx section.
+
+Upstream-Status: Backport
+CVE: CVE-2019-12972
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ bfd/ChangeLog | 5 +++++
+ bfd/elfcode.h | 3 ++-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/bfd/ChangeLog b/bfd/ChangeLog
+index 91f09e6346..e66fb40a2c 100644
+--- a/bfd/ChangeLog
++++ b/bfd/ChangeLog
+@@ -1,3 +1,8 @@
++2019-06-21  Alan Modra  <amodra@gmail.com>
++
++	PR 24689
++	* elfcode.h (elf_object_p): Check type of e_shstrndx section.
++
+ 2019-02-20  Alan Modra  <amodra@gmail.com>
+ 
+ 	PR 24236
+diff --git a/bfd/elfcode.h b/bfd/elfcode.h
+index ec5ea766de..a35a629087 100644
+--- a/bfd/elfcode.h
++++ b/bfd/elfcode.h
+@@ -755,7 +755,8 @@ elf_object_p (bfd *abfd)
+   /* A further sanity check.  */
+   if (i_ehdrp->e_shnum != 0)
+     {
+-      if (i_ehdrp->e_shstrndx >= elf_numsections (abfd))
++      if (i_ehdrp->e_shstrndx >= elf_numsections (abfd)
++	  || i_shdrp[i_ehdrp->e_shstrndx].sh_type != SHT_STRTAB)
+ 	{
+ 	  /* PR 2257:
+ 	     We used to just goto got_wrong_format_error here
+-- 
+2.20.1
+
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
new file mode 100644
index 0000000..26f4809
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-9071.patch
@@ -0,0 +1,164 @@
+From c1202057eb9161a86af27d867703235fee7b7555 Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickc@redhat.com>
+Date: Wed, 10 Apr 2019 15:49:36 +0100
+Subject: [PATCH] Pull in patch for libiberty that fixes a stack exhaustion bug
+ when demangling a pathalogically constructed mangled name.
+
+	PR 89394
+	* cp-demangle.c (cplus_demangle_fill_name): Reject negative
+	lengths.
+	(d_count_templates_scopes): Replace num_templates and num_scopes
+	parameters with a struct d_print_info pointer parameter.  Adjust
+	body of the function accordingly.  Add recursion counter and check
+	that the recursion limit is not reached.
+	(d_print_init): Pass dpi parameter to d_count_templates_scopes.
+	Reset recursion counter afterwards, unless the recursion limit was
+	reached.
+
+CVE: CVE-2019-9071
+Upstream-Status: Backport
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ ChangeLog               | 16 ++++++++++++++
+ libiberty/cp-demangle.c | 48 ++++++++++++++++++++++-------------------
+ 2 files changed, 42 insertions(+), 22 deletions(-)
+
+diff --git a/ChangeLog b/ChangeLog
+index cd631a15b6..4df3aaa62c 100644
+--- a/ChangeLog
++++ b/ChangeLog
+@@ -1,3 +1,19 @@
++2019-04-10  Nick Clifton  <nickc@redhat.com>
++
++	* libiberty: Sync with gcc.  Bring in:
++	2019-04-10  Nick Clifton  <nickc@redhat.com>
++
++	PR 89394
++	* cp-demangle.c (cplus_demangle_fill_name): Reject negative
++	lengths.
++	(d_count_templates_scopes): Replace num_templates and num_scopes
++	parameters with a struct d_print_info pointer parameter.  Adjust
++	body of the function accordingly.  Add recursion counter and check
++	that the recursion limit is not reached.
++	(d_print_init): Pass dpi parameter to d_count_templates_scopes.
++	Reset recursion counter afterwards, unless the recursion limit was
++	reached.
++
+ 2018-06-24  Nick Clifton  <nickc@redhat.com>
+ 
+ 	2.32 branch created.
+diff --git a/libiberty/cp-demangle.c b/libiberty/cp-demangle.c
+index b34b485692..779b4e763a 100644
+--- a/libiberty/cp-demangle.c
++++ b/libiberty/cp-demangle.c
+@@ -861,7 +861,7 @@ CP_STATIC_IF_GLIBCPP_V3
+ int
+ cplus_demangle_fill_name (struct demangle_component *p, const char *s, int len)
+ {
+-  if (p == NULL || s == NULL || len == 0)
++  if (p == NULL || s == NULL || len <= 0)
+     return 0;
+   p->d_printing = 0;
+   p->type = DEMANGLE_COMPONENT_NAME;
+@@ -4061,7 +4061,7 @@ d_growable_string_callback_adapter (const char *s, size_t l, void *opaque)
+    are larger than the actual numbers encountered.  */
+ 
+ static void
+-d_count_templates_scopes (int *num_templates, int *num_scopes,
++d_count_templates_scopes (struct d_print_info *dpi,
+ 			  const struct demangle_component *dc)
+ {
+   if (dc == NULL)
+@@ -4081,13 +4081,13 @@ d_count_templates_scopes (int *num_templates, int *num_scopes,
+       break;
+ 
+     case DEMANGLE_COMPONENT_TEMPLATE:
+-      (*num_templates)++;
++      dpi->num_copy_templates++;
+       goto recurse_left_right;
+ 
+     case DEMANGLE_COMPONENT_REFERENCE:
+     case DEMANGLE_COMPONENT_RVALUE_REFERENCE:
+       if (d_left (dc)->type == DEMANGLE_COMPONENT_TEMPLATE_PARAM)
+-	(*num_scopes)++;
++	dpi->num_saved_scopes++;
+       goto recurse_left_right;
+ 
+     case DEMANGLE_COMPONENT_QUAL_NAME:
+@@ -4152,42 +4152,42 @@ d_count_templates_scopes (int *num_templates, int *num_scopes,
+     case DEMANGLE_COMPONENT_TAGGED_NAME:
+     case DEMANGLE_COMPONENT_CLONE:
+     recurse_left_right:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				d_left (dc));
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				d_right (dc));
++      /* PR 89394 - Check for too much recursion.  */
++      if (dpi->recursion > DEMANGLE_RECURSION_LIMIT)
++	/* FIXME: There ought to be a way to report to the
++	   user that the recursion limit has been reached.  */
++	return;
++
++      ++ dpi->recursion;
++      d_count_templates_scopes (dpi, d_left (dc));
++      d_count_templates_scopes (dpi, d_right (dc));
++      -- dpi->recursion;
+       break;
+ 
+     case DEMANGLE_COMPONENT_CTOR:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				dc->u.s_ctor.name);
++      d_count_templates_scopes (dpi, dc->u.s_ctor.name);
+       break;
+ 
+     case DEMANGLE_COMPONENT_DTOR:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				dc->u.s_dtor.name);
++      d_count_templates_scopes (dpi, dc->u.s_dtor.name);
+       break;
+ 
+     case DEMANGLE_COMPONENT_EXTENDED_OPERATOR:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				dc->u.s_extended_operator.name);
++      d_count_templates_scopes (dpi, dc->u.s_extended_operator.name);
+       break;
+ 
+     case DEMANGLE_COMPONENT_FIXED_TYPE:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-                                dc->u.s_fixed.length);
++      d_count_templates_scopes (dpi, dc->u.s_fixed.length);
+       break;
+ 
+     case DEMANGLE_COMPONENT_GLOBAL_CONSTRUCTORS:
+     case DEMANGLE_COMPONENT_GLOBAL_DESTRUCTORS:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				d_left (dc));
++      d_count_templates_scopes (dpi, d_left (dc));
+       break;
+ 
+     case DEMANGLE_COMPONENT_LAMBDA:
+     case DEMANGLE_COMPONENT_DEFAULT_ARG:
+-      d_count_templates_scopes (num_templates, num_scopes,
+-				dc->u.s_unary_num.sub);
++      d_count_templates_scopes (dpi, dc->u.s_unary_num.sub);
+       break;
+     }
+ }
+@@ -4222,8 +4222,12 @@ d_print_init (struct d_print_info *dpi, demangle_callbackref callback,
+   dpi->next_copy_template = 0;
+   dpi->num_copy_templates = 0;
+ 
+-  d_count_templates_scopes (&dpi->num_copy_templates,
+-			    &dpi->num_saved_scopes, dc);
++  d_count_templates_scopes (dpi, dc);
++  /* If we did not reach the recursion limit, then reset the
++     current recursion value back to 0, so that we can print
++     the templates.  */
++  if (dpi->recursion < DEMANGLE_RECURSION_LIMIT)
++    dpi->recursion = 0;
+   dpi->num_copy_templates *= dpi->num_saved_scopes;
+ 
+   dpi->current_template = NULL;
+-- 
+2.20.1
+
-- 
2.7.4


