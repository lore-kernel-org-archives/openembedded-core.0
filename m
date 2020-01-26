Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by mail.openembedded.org (Postfix) with ESMTP id 37325916C0
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 16:25:01 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id k3so3915000pgc.3
	for <openembedded-core@openembedded.org>;
	Sun, 26 Jan 2020 08:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=IdfsWKnamV2IKQLb4Q+CQN5/YksJR74sz+NX92PKbeg=;
	b=iVO02Oq46MWGPzZ3VPTXmNp6hymJxWUAiX2m1Zi0aA/dUss6Ib85p7X5cCdeptGLg+
	Ar8tLjfvBnAdr7U/pH+ZqVV/P5f8Q7ecYl1nZDdOI5Cc9ZSZNUqLbqwWap0pq9q/gQ9P
	JUuQTHzVs2yZeHkyL+w73sQJqXhaC+q1/YmsGh1ab+QV3OR1Kzp9VsBBCc2ELYx5Ixhm
	aAkV1pahZ8ewTlXBG24GXa4qV3lAtYNQiks7ezDCRjtn3LcbTe/Ysv3+asNWEPZd1Gph
	4CsaCIjZAtQ9V75TvGzno832PVnIVWtHMfB+VuAlD6R55cRzI9tJ3R5pBOxDu0hdHxAQ
	LMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=IdfsWKnamV2IKQLb4Q+CQN5/YksJR74sz+NX92PKbeg=;
	b=QxMsKKie9ZaiZ2QdqiU9RoSN2XvwhoFOT8IfrpEB/zgKp+oWTOC5cNGM2CsJxJlV15
	HvdrdO1MZbrA2Qv5Q3DuUxFiMI69kXR+m3aLwH90u8yZYW+ItJfHtmD4tPxGBw78i9V7
	8PxoOv+rMUk2yoq1toYQh0W7lwiMB23K+aLoZuignYeqnCOULnxgZNMgt6ardgTcc5hU
	5fWKM0gATSLGfbzrIqVxVh+oADHEsiAngd2b17rqKXDLwsV7DSlcs52aXIQOpW2Kz6o+
	GW7hhaZ53syGey7qbjtRlVdzxBKtYJ5Ig19nZc8TsSZYzXokLwW2atWwGZtE19/zJQNQ
	e8kw==
X-Gm-Message-State: APjAAAWpXq3ckB/onES8E7aH7yWn0oBz5IgQGSFe90qtA325yKVdKR/1
	Lu8GbQJGfyKNjLgYqgGv+pZy4qHb
X-Google-Smtp-Source: APXvYqzRjnyhMX5JHDLbQkQ7g+BgVUclJFE9czz58/TUyJqDwEPdYWYTw76SGakUQLFCndTn1SXZ9A==
X-Received: by 2002:aa7:9808:: with SMTP id e8mr12748595pfl.32.1580055901988; 
	Sun, 26 Jan 2020 08:25:01 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:bddb:633c:e712:cec2])
	by smtp.gmail.com with ESMTPSA id
	f43sm13046556pje.23.2020.01.26.08.25.01
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 26 Jan 2020 08:25:01 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 26 Jan 2020 08:24:31 -0800
Message-Id: <dcd3406c79bdee46fabc2310c9e278918e26ce80.1580055797.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1580055797.git.akuster808@gmail.com>
References: <cover.1580055797.git.akuster808@gmail.com>
Subject: [warrior 06/29] binutils: fix CVE-2019-17450
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
X-List-Received-Date: Sun, 26 Jan 2020 16:25:01 -0000

From: Trevor Gamblin <trevor.gamblin@windriver.com>

Backport upstream fix.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../binutils/binutils-2.32.inc                |  1 +
 .../binutils/binutils/CVE-2019-17450.patch    | 99 +++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.32.inc b/meta/recipes-devtools/binutils/binutils-2.32.inc
index d3c52936d1..a92bfd0354 100644
--- a/meta/recipes-devtools/binutils/binutils-2.32.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.32.inc
@@ -52,6 +52,7 @@ SRC_URI = "\
      file://CVE-2019-12972.patch \
      file://CVE-2019-14250.patch \
      file://CVE-2019-14444.patch \
+     file://CVE-2019-17450.patch \
 "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
new file mode 100644
index 0000000000..a6ce0b9a8a
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils/CVE-2019-17450.patch
@@ -0,0 +1,99 @@
+From 09dd135df9ebc7a4b640537e23e26a03a288a789 Mon Sep 17 00:00:00 2001
+From: Alan Modra <amodra@gmail.com>
+Date: Wed, 9 Oct 2019 00:07:29 +1030
+Subject: [PATCH] PR25078, stack overflow in function find_abstract_instance
+
+Selectively backporting fix for bfd/dwarf2.c, but not the ChangeLog
+file. There are newer versions of binutils, but none of them contain the
+commit fixing CVE-2019-17450, so backport it to master and zeus.
+
+Upstream-Status: Backport [https://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;h=063c511bd79]
+CVE: CVE-2019-17450
+Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
+
+	PR 25078
+	* dwarf2.c (find_abstract_instance): Delete orig_info_ptr, add
+	recur_count.  Error on recur_count reaching 100 rather than
+	info_ptr matching orig_info_ptr.  Adjust calls.
+
+---
+ bfd/dwarf2.c | 35 +++++++++++++++++------------------
+ 1 file changed, 17 insertions(+), 18 deletions(-)
+
+diff --git a/bfd/dwarf2.c b/bfd/dwarf2.c
+index 0b4e485582..20ec9e2e56 100644
+--- a/bfd/dwarf2.c
++++ b/bfd/dwarf2.c
+@@ -2803,13 +2803,13 @@ lookup_symbol_in_variable_table (struct comp_unit *unit,
+ }
+ 
+ static bfd_boolean
+-find_abstract_instance (struct comp_unit *   unit,
+-			bfd_byte *           orig_info_ptr,
+-			struct attribute *   attr_ptr,
+-			const char **        pname,
+-			bfd_boolean *        is_linkage,
+-			char **              filename_ptr,
+-			int *                linenumber_ptr)
++find_abstract_instance (struct comp_unit *unit,
++			struct attribute *attr_ptr,
++			unsigned int recur_count,
++			const char **pname,
++			bfd_boolean *is_linkage,
++			char **filename_ptr,
++			int *linenumber_ptr)
+ {
+   bfd *abfd = unit->abfd;
+   bfd_byte *info_ptr;
+@@ -2820,6 +2820,14 @@ find_abstract_instance (struct comp_unit *   unit,
+   struct attribute attr;
+   const char *name = NULL;
+ 
++  if (recur_count == 100)
++    {
++      _bfd_error_handler
++	(_("DWARF error: abstract instance recursion detected"));
++      bfd_set_error (bfd_error_bad_value);
++      return FALSE;
++    }
++
+   /* DW_FORM_ref_addr can reference an entry in a different CU. It
+      is an offset from the .debug_info section, not the current CU.  */
+   if (attr_ptr->form == DW_FORM_ref_addr)
+@@ -2939,15 +2947,6 @@ find_abstract_instance (struct comp_unit *   unit,
+ 					 info_ptr, info_ptr_end);
+ 	      if (info_ptr == NULL)
+ 		break;
+-	      /* It doesn't ever make sense for DW_AT_specification to
+-		 refer to the same DIE.  Stop simple recursion.  */
+-	      if (info_ptr == orig_info_ptr)
+-		{
+-		  _bfd_error_handler
+-		    (_("DWARF error: abstract instance recursion detected"));
+-		  bfd_set_error (bfd_error_bad_value);
+-		  return FALSE;
+-		}
+ 	      switch (attr.name)
+ 		{
+ 		case DW_AT_name:
+@@ -2961,7 +2960,7 @@ find_abstract_instance (struct comp_unit *   unit,
+ 		    }
+ 		  break;
+ 		case DW_AT_specification:
+-		  if (!find_abstract_instance (unit, info_ptr, &attr,
++		  if (!find_abstract_instance (unit, &attr, recur_count + 1,
+ 					       &name, is_linkage,
+ 					       filename_ptr, linenumber_ptr))
+ 		    return FALSE;
+@@ -3175,7 +3174,7 @@ scan_unit_for_symbols (struct comp_unit *unit)
+ 
+ 		case DW_AT_abstract_origin:
+ 		case DW_AT_specification:
+-		  if (!find_abstract_instance (unit, info_ptr, &attr,
++		  if (!find_abstract_instance (unit, &attr, 0,
+ 					       &func->name,
+ 					       &func->is_linkage,
+ 					       &func->file,
+-- 
+2.23.0
+
-- 
2.17.1


