Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72AFC4332F
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 16:59:46 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web09.7754.1647017986269762182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 08:59:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=AnZRhow9;
 spf=pass (domain: linaro.org, ip: 209.85.160.170,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-qt1-f170.google.com with SMTP id c4so7821644qtx.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 08:59:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pw6Uum+xeh6uo2QWHHjHRd+yt9uITfiVhgdam6RrbiQ=;
        b=AnZRhow9FFfJyk8FKqMhrwuScdulIQxLNMF2WsLATrVgi/WNgckquS98sT8m6UT8El
         aYuwxjgg1Tp/hJ3oYiqBdBVBQISkZ1gNg81nVnW4pbxOJ3iRnET+U5XVXXrdO8O7TNcR
         y+hXFjURxwG697pkEGOBNpuSP03iOYEO+qGCh0f2F+GJHLvbC8Mca54DtLADG3IQNx7W
         kdQpF/9PyRW5UUViPjw3or/2m/jV5m7HZmFXaYXJ8v3fU5aRrxb+4Aj1f7BSROs5YvG2
         5kLjAVmsmX4YiHWlEVsoTyqByaelpONvg7K9UCUnb1tVuZRfHuu9zJCrNyA0EC9lrYam
         LbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pw6Uum+xeh6uo2QWHHjHRd+yt9uITfiVhgdam6RrbiQ=;
        b=jCVADEmVyDk6t7xrbJe1MiZ6NrmLoclNeEnc7/QZe826/VYwKgT7fx6+76I/1X0//p
         KmNQY1fF6n9MM0m2Jc2amEZ8eZzx0M1Y2vH65yuutQmnli+dR6DPRvIyHlZFrTfrabl2
         nfQEuqfkUdmxLBwYuVL7RtNr5AV07UDd/u9nntOkVMninYojhYI8L3lXVO3VUqEMwTGZ
         H8qsnkYHYwW4+bdk2Uld/w1uwwn5D0fAxJkUph+C3TBQBwh4BS2vNWaGadX3LcmdZind
         1a8PGo9YcC5C7DvVJVFBw6iXQuVNCjC3m2D+9MaORY1PeF/ytSA8SQicDj7seQ9RK4/E
         ctZQ==
X-Gm-Message-State: AOAM532j+mDYllHXv+Okt8Rs5iWIF5VELdXf5yo4KwIbCNZpM9DrLne3
	2KdA0u/xKbCEBhu4gVgozq0t1+RXrxnSYA==
X-Google-Smtp-Source: 
 ABdhPJyUlQETqrqkiPVzm5QUtuQZVY9b259XfCEkvUpxnVUW1OXGCBZlpM1XD6mFdv8SFOljOcnO5Q==
X-Received: by 2002:a05:622a:1891:b0:2e1:a5d7:a0eb with SMTP id
 v17-20020a05622a189100b002e1a5d7a0ebmr9306379qtc.601.1647017985149;
        Fri, 11 Mar 2022 08:59:45 -0800 (PST)
Received: from maple.netwinder.org (rfs.netwinder.org. [206.248.184.2])
        by smtp.gmail.com with ESMTPSA id
 b126-20020a376784000000b0067d21404704sm4066370qkc.131.2022.03.11.08.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Mar 2022 08:59:44 -0800 (PST)
From: Ralph Siemsen <ralph.siemsen@linaro.org>
To: openembedded-core@lists.openembedded.org
Cc: tony.tascioglu@windriver.com,
	Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: [RFC PATCH 2/2] libxml2: update to 2.9.13
Date: Fri, 11 Mar 2022 11:58:55 -0500
Message-Id: <20220311165855.3477645-3-ralph.siemsen@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311165855.3477645-1-ralph.siemsen@linaro.org>
References: <20220311165855.3477645-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 16:59:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163062

- new version includes fix for CVE-2022-23308
- drop two patches which are upstream

Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>
---
 .../0002-Work-around-lxml-API-abuse.patch     | 213 ----------------
 .../libxml2/libxml-m4-use-pkgconfig.patch     | 229 ------------------
 .../{libxml2_2.9.12.bb => libxml2_2.9.13.bb}  |   4 +-
 3 files changed, 1 insertion(+), 445 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
 rename meta/recipes-core/libxml/{libxml2_2.9.12.bb => libxml2_2.9.13.bb} (95%)

diff --git a/meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch b/meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch
deleted file mode 100644
index f09ce9707a..0000000000
--- a/meta/recipes-core/libxml/libxml2/0002-Work-around-lxml-API-abuse.patch
+++ /dev/null
@@ -1,213 +0,0 @@
-From 85b1792e37b131e7a51af98a37f92472e8de5f3f Mon Sep 17 00:00:00 2001
-From: Nick Wellnhofer <wellnhofer@aevum.de>
-Date: Tue, 18 May 2021 20:08:28 +0200
-Subject: [PATCH] Work around lxml API abuse
-
-Make xmlNodeDumpOutput and htmlNodeDumpFormatOutput work with corrupted
-parent pointers. This used to work with the old recursive code but the
-non-recursive rewrite required parent pointers to be set correctly.
-
-Unfortunately, lxml relies on the old behavior and passes subtrees with
-a corrupted structure. Fall back to a recursive function call if an
-invalid parent pointer is detected.
-
-Fixes #255.
-
-Upstream-Status: Backport [85b1792e37b131e7a51af98a37f92472e8de5f3f]
----
- HTMLtree.c | 46 ++++++++++++++++++++++++++++------------------
- xmlsave.c  | 31 +++++++++++++++++++++----------
- 2 files changed, 49 insertions(+), 28 deletions(-)
-
-diff --git a/HTMLtree.c b/HTMLtree.c
-index 24434d45..bdd639c7 100644
---- a/HTMLtree.c
-+++ b/HTMLtree.c
-@@ -744,7 +744,7 @@ void
- htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
- 	                 xmlNodePtr cur, const char *encoding ATTRIBUTE_UNUSED,
-                          int format) {
--    xmlNodePtr root;
-+    xmlNodePtr root, parent;
-     xmlAttrPtr attr;
-     const htmlElemDesc * info;
- 
-@@ -755,6 +755,7 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-     }
- 
-     root = cur;
-+    parent = cur->parent;
-     while (1) {
-         switch (cur->type) {
-         case XML_HTML_DOCUMENT_NODE:
-@@ -762,13 +763,25 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-             if (((xmlDocPtr) cur)->intSubset != NULL) {
-                 htmlDtdDumpOutput(buf, (xmlDocPtr) cur, NULL);
-             }
--            if (cur->children != NULL) {
-+            /* Always validate cur->parent when descending. */
-+            if ((cur->parent == parent) && (cur->children != NULL)) {
-+                parent = cur;
-                 cur = cur->children;
-                 continue;
-             }
-             break;
- 
-         case XML_ELEMENT_NODE:
-+            /*
-+             * Some users like lxml are known to pass nodes with a corrupted
-+             * tree structure. Fall back to a recursive call to handle this
-+             * case.
-+             */
-+            if ((cur->parent != parent) && (cur->children != NULL)) {
-+                htmlNodeDumpFormatOutput(buf, doc, cur, encoding, format);
-+                break;
-+            }
-+
-             /*
-              * Get specific HTML info for that node.
-              */
-@@ -817,6 +830,7 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-                     (cur->name != NULL) &&
-                     (cur->name[0] != 'p')) /* p, pre, param */
-                     xmlOutputBufferWriteString(buf, "\n");
-+                parent = cur;
-                 cur = cur->children;
-                 continue;
-             }
-@@ -825,9 +839,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-                 (info != NULL) && (!info->isinline)) {
-                 if ((cur->next->type != HTML_TEXT_NODE) &&
-                     (cur->next->type != HTML_ENTITY_REF_NODE) &&
--                    (cur->parent != NULL) &&
--                    (cur->parent->name != NULL) &&
--                    (cur->parent->name[0] != 'p')) /* p, pre, param */
-+                    (parent != NULL) &&
-+                    (parent->name != NULL) &&
-+                    (parent->name[0] != 'p')) /* p, pre, param */
-                     xmlOutputBufferWriteString(buf, "\n");
-             }
- 
-@@ -842,9 +856,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-                 break;
-             if (((cur->name == (const xmlChar *)xmlStringText) ||
-                  (cur->name != (const xmlChar *)xmlStringTextNoenc)) &&
--                ((cur->parent == NULL) ||
--                 ((xmlStrcasecmp(cur->parent->name, BAD_CAST "script")) &&
--                  (xmlStrcasecmp(cur->parent->name, BAD_CAST "style"))))) {
-+                ((parent == NULL) ||
-+                 ((xmlStrcasecmp(parent->name, BAD_CAST "script")) &&
-+                  (xmlStrcasecmp(parent->name, BAD_CAST "style"))))) {
-                 xmlChar *buffer;
- 
-                 buffer = xmlEncodeEntitiesReentrant(doc, cur->content);
-@@ -902,13 +916,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-                 break;
-             }
- 
--            /*
--             * The parent should never be NULL here but we want to handle
--             * corrupted documents gracefully.
--             */
--            if (cur->parent == NULL)
--                return;
--            cur = cur->parent;
-+            cur = parent;
-+            /* cur->parent was validated when descending. */
-+            parent = cur->parent;
- 
-             if ((cur->type == XML_HTML_DOCUMENT_NODE) ||
-                 (cur->type == XML_DOCUMENT_NODE)) {
-@@ -939,9 +949,9 @@ htmlNodeDumpFormatOutput(xmlOutputBufferPtr buf, xmlDocPtr doc,
-                     (cur->next != NULL)) {
-                     if ((cur->next->type != HTML_TEXT_NODE) &&
-                         (cur->next->type != HTML_ENTITY_REF_NODE) &&
--                        (cur->parent != NULL) &&
--                        (cur->parent->name != NULL) &&
--                        (cur->parent->name[0] != 'p')) /* p, pre, param */
-+                        (parent != NULL) &&
-+                        (parent->name != NULL) &&
-+                        (parent->name[0] != 'p')) /* p, pre, param */
-                         xmlOutputBufferWriteString(buf, "\n");
-                 }
-             }
-diff --git a/xmlsave.c b/xmlsave.c
-index 61a40459..aedbd5e7 100644
---- a/xmlsave.c
-+++ b/xmlsave.c
-@@ -847,7 +847,7 @@ htmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
- static void
- xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
-     int format = ctxt->format;
--    xmlNodePtr tmp, root, unformattedNode = NULL;
-+    xmlNodePtr tmp, root, unformattedNode = NULL, parent;
-     xmlAttrPtr attr;
-     xmlChar *start, *end;
-     xmlOutputBufferPtr buf;
-@@ -856,6 +856,7 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
-     buf = ctxt->buf;
- 
-     root = cur;
-+    parent = cur->parent;
-     while (1) {
-         switch (cur->type) {
-         case XML_DOCUMENT_NODE:
-@@ -868,7 +869,9 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
-             break;
- 
-         case XML_DOCUMENT_FRAG_NODE:
--            if (cur->children != NULL) {
-+            /* Always validate cur->parent when descending. */
-+            if ((cur->parent == parent) && (cur->children != NULL)) {
-+                parent = cur;
-                 cur = cur->children;
-                 continue;
-             }
-@@ -887,7 +890,18 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
-             break;
- 
-         case XML_ELEMENT_NODE:
--	    if ((cur != root) && (ctxt->format == 1) && (xmlIndentTreeOutput))
-+            /*
-+             * Some users like lxml are known to pass nodes with a corrupted
-+             * tree structure. Fall back to a recursive call to handle this
-+             * case.
-+             */
-+            if ((cur->parent != parent) && (cur->children != NULL)) {
-+                xmlNodeDumpOutputInternal(ctxt, cur);
-+                break;
-+            }
-+
-+	    if ((ctxt->level > 0) && (ctxt->format == 1) &&
-+                (xmlIndentTreeOutput))
- 		xmlOutputBufferWrite(buf, ctxt->indent_size *
- 				     (ctxt->level > ctxt->indent_nr ?
- 				      ctxt->indent_nr : ctxt->level),
-@@ -942,6 +956,7 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
-                 xmlOutputBufferWrite(buf, 1, ">");
-                 if (ctxt->format == 1) xmlOutputBufferWrite(buf, 1, "\n");
-                 if (ctxt->level >= 0) ctxt->level++;
-+                parent = cur;
-                 cur = cur->children;
-                 continue;
-             }
-@@ -1058,13 +1073,9 @@ xmlNodeDumpOutputInternal(xmlSaveCtxtPtr ctxt, xmlNodePtr cur) {
-                 break;
-             }
- 
--            /*
--             * The parent should never be NULL here but we want to handle
--             * corrupted documents gracefully.
--             */
--            if (cur->parent == NULL)
--                return;
--            cur = cur->parent;
-+            cur = parent;
-+            /* cur->parent was validated when descending. */
-+            parent = cur->parent;
- 
-             if (cur->type == XML_ELEMENT_NODE) {
-                 if (ctxt->level > 0) ctxt->level--;
--- 
-2.32.0
-
diff --git a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch b/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
deleted file mode 100644
index a5c112db7b..0000000000
--- a/meta/recipes-core/libxml/libxml2/libxml-m4-use-pkgconfig.patch
+++ /dev/null
@@ -1,229 +0,0 @@
-From f57da62218cf72c1342da82abafdac6b0a2e4997 Mon Sep 17 00:00:00 2001
-From: Tony Tascioglu <tony.tascioglu@windriver.com>
-Date: Fri, 14 May 2021 11:50:35 -0400
-Subject: [PATCH] AM_PATH_XML2 uses xml-config which we disable through
-
-binconfig-disabled.bbclass, so port it to use pkg-config instead.
-
-This cannot be upstreamed, as the original macro supports various
-optional arguments which cannot be supported with a direct call
-to pkg-config.
-
-Upstream-Status: Inappropriate [oe-core specific; see above]
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-Rebase to 2.9.9
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-
-Updated to apply cleanly to v2.9.12
-
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
----
- libxml.m4 | 190 ++----------------------------------------------------
- 1 file changed, 5 insertions(+), 185 deletions(-)
-
-diff --git a/libxml.m4 b/libxml.m4
-index 09de9fe2..1c535853 100644
---- a/libxml.m4
-+++ b/libxml.m4
-@@ -1,192 +1,12 @@
--# Configure paths for LIBXML2
--# Simon Josefsson 2020-02-12
--# Fix autoconf 2.70+ warnings
--# Mike Hommey 2004-06-19
--# use CPPFLAGS instead of CFLAGS
--# Toshio Kuratomi 2001-04-21
--# Adapted from:
--# Configure paths for GLIB
--# Owen Taylor     97-11-3
--
- dnl AM_PATH_XML2([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
- dnl Test for XML, and define XML_CPPFLAGS and XML_LIBS
- dnl
--AC_DEFUN([AM_PATH_XML2],[ 
--AC_ARG_WITH(xml-prefix,
--            [  --with-xml-prefix=PFX   Prefix where libxml is installed (optional)],
--            xml_config_prefix="$withval", xml_config_prefix="")
--AC_ARG_WITH(xml-exec-prefix,
--            [  --with-xml-exec-prefix=PFX Exec prefix where libxml is installed (optional)],
--            xml_config_exec_prefix="$withval", xml_config_exec_prefix="")
--AC_ARG_ENABLE(xmltest,
--              [  --disable-xmltest       Do not try to compile and run a test LIBXML program],,
--              enable_xmltest=yes)
--
--  if test x$xml_config_exec_prefix != x ; then
--     xml_config_args="$xml_config_args"
--     if test x${XML2_CONFIG+set} != xset ; then
--        XML2_CONFIG=$xml_config_exec_prefix/bin/xml2-config
--     fi
--  fi
--  if test x$xml_config_prefix != x ; then
--     xml_config_args="$xml_config_args --prefix=$xml_config_prefix"
--     if test x${XML2_CONFIG+set} != xset ; then
--        XML2_CONFIG=$xml_config_prefix/bin/xml2-config
--     fi
--  fi
--
--  AC_PATH_PROG(XML2_CONFIG, xml2-config, no)
--  min_xml_version=ifelse([$1], ,2.0.0,[$1])
--  AC_MSG_CHECKING(for libxml - version >= $min_xml_version)
--  no_xml=""
--  if test "$XML2_CONFIG" = "no" ; then
--    no_xml=yes
--  else
--    XML_CPPFLAGS=`$XML2_CONFIG $xml_config_args --cflags`
--    XML_LIBS=`$XML2_CONFIG $xml_config_args --libs`
--    xml_config_major_version=`$XML2_CONFIG $xml_config_args --version | \
--           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\1/'`
--    xml_config_minor_version=`$XML2_CONFIG $xml_config_args --version | \
--           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\2/'`
--    xml_config_micro_version=`$XML2_CONFIG $xml_config_args --version | \
--           sed 's/\([[0-9]]*\).\([[0-9]]*\).\([[0-9]]*\)/\3/'`
--    if test "x$enable_xmltest" = "xyes" ; then
--      ac_save_CPPFLAGS="$CPPFLAGS"
--      ac_save_LIBS="$LIBS"
--      CPPFLAGS="$CPPFLAGS $XML_CPPFLAGS"
--      LIBS="$XML_LIBS $LIBS"
--dnl
--dnl Now check if the installed libxml is sufficiently new.
--dnl (Also sanity checks the results of xml2-config to some extent)
--dnl
--      rm -f conf.xmltest
--      AC_RUN_IFELSE(
--            [AC_LANG_SOURCE([[
--#include <stdlib.h>
--#include <stdio.h>
--#include <string.h>
--#include <libxml/xmlversion.h>
--
--int 
--main()
--{
--  int xml_major_version, xml_minor_version, xml_micro_version;
--  int major, minor, micro;
--  char *tmp_version;
--
--  system("touch conf.xmltest");
--
--  /* Capture xml2-config output via autoconf/configure variables */
--  /* HP/UX 9 (%@#!) writes to sscanf strings */
--  tmp_version = (char *)strdup("$min_xml_version");
--  if (sscanf(tmp_version, "%d.%d.%d", &major, &minor, &micro) != 3) {
--     printf("%s, bad version string from xml2-config\n", "$min_xml_version");
--     exit(1);
--   }
--   free(tmp_version);
--
--   /* Capture the version information from the header files */
--   tmp_version = (char *)strdup(LIBXML_DOTTED_VERSION);
--   if (sscanf(tmp_version, "%d.%d.%d", &xml_major_version, &xml_minor_version, &xml_micro_version) != 3) {
--     printf("%s, bad version string from libxml includes\n", "LIBXML_DOTTED_VERSION");
--     exit(1);
--   }
--   free(tmp_version);
--
-- /* Compare xml2-config output to the libxml headers */
--  if ((xml_major_version != $xml_config_major_version) ||
--      (xml_minor_version != $xml_config_minor_version) ||
--      (xml_micro_version != $xml_config_micro_version))
--    {
--      printf("*** libxml header files (version %d.%d.%d) do not match\n",
--         xml_major_version, xml_minor_version, xml_micro_version);
--      printf("*** xml2-config (version %d.%d.%d)\n",
--         $xml_config_major_version, $xml_config_minor_version, $xml_config_micro_version);
--      return 1;
--    } 
--/* Compare the headers to the library to make sure we match */
--  /* Less than ideal -- doesn't provide us with return value feedback, 
--   * only exits if there's a serious mismatch between header and library.
--   */
--    LIBXML_TEST_VERSION;
--
--    /* Test that the library is greater than our minimum version */
--    if ((xml_major_version > major) ||
--        ((xml_major_version == major) && (xml_minor_version > minor)) ||
--        ((xml_major_version == major) && (xml_minor_version == minor) &&
--        (xml_micro_version >= micro)))
--      {
--        return 0;
--       }
--     else
--      {
--        printf("\n*** An old version of libxml (%d.%d.%d) was found.\n",
--               xml_major_version, xml_minor_version, xml_micro_version);
--        printf("*** You need a version of libxml newer than %d.%d.%d. The latest version of\n",
--           major, minor, micro);
--        printf("*** libxml is always available from ftp://ftp.xmlsoft.org.\n");
--        printf("***\n");
--        printf("*** If you have already installed a sufficiently new version, this error\n");
--        printf("*** probably means that the wrong copy of the xml2-config shell script is\n");
--        printf("*** being found. The easiest way to fix this is to remove the old version\n");
--        printf("*** of LIBXML, but you can also set the XML2_CONFIG environment to point to the\n");
--        printf("*** correct copy of xml2-config. (In this case, you will have to\n");
--        printf("*** modify your LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf\n");
--        printf("*** so that the correct libraries are found at run-time))\n");
--    }
--  return 1;
--}
--]])],, no_xml=yes,[echo $ac_n "cross compiling; assumed OK... $ac_c"])
--       CPPFLAGS="$ac_save_CPPFLAGS"
--       LIBS="$ac_save_LIBS"
--     fi
--  fi
-+AC_DEFUN([AM_PATH_XML2],[
-+  AC_REQUIRE([PKG_PROG_PKG_CONFIG])
- 
--  if test "x$no_xml" = x ; then
--     AC_MSG_RESULT(yes (version $xml_config_major_version.$xml_config_minor_version.$xml_config_micro_version))
--     ifelse([$2], , :, [$2])     
--  else
--     AC_MSG_RESULT(no)
--     if test "$XML2_CONFIG" = "no" ; then
--       echo "*** The xml2-config script installed by LIBXML could not be found"
--       echo "*** If libxml was installed in PREFIX, make sure PREFIX/bin is in"
--       echo "*** your path, or set the XML2_CONFIG environment variable to the"
--       echo "*** full path to xml2-config."
--     else
--       if test -f conf.xmltest ; then
--        :
--       else
--          echo "*** Could not run libxml test program, checking why..."
--          CPPFLAGS="$CPPFLAGS $XML_CPPFLAGS"
--          LIBS="$LIBS $XML_LIBS"
--	  AC_LINK_IFELSE(
--            [AC_LANG_PROGRAM([[
--#include <libxml/xmlversion.h>
--#include <stdio.h>
--]],    [[ LIBXML_TEST_VERSION; return 0;]])],
--        [ echo "*** The test program compiled, but did not run. This usually means"
--          echo "*** that the run-time linker is not finding LIBXML or finding the wrong"
--          echo "*** version of LIBXML. If it is not finding LIBXML, you'll need to set your"
--          echo "*** LD_LIBRARY_PATH environment variable, or edit /etc/ld.so.conf to point"
--          echo "*** to the installed location  Also, make sure you have run ldconfig if that"
--          echo "*** is required on your system"
--          echo "***"
--          echo "*** If you have an old version installed, it is best to remove it, although"
--          echo "*** you may also be able to get things to work by modifying LD_LIBRARY_PATH" ],
--        [ echo "*** The test program failed to compile or link. See the file config.log for the"
--          echo "*** exact error that occurred. This usually means LIBXML was incorrectly installed"
--          echo "*** or that you have moved LIBXML since it was installed. In the latter case, you"
--          echo "*** may want to edit the xml2-config script: $XML2_CONFIG" ])
--          CPPFLAGS="$ac_save_CPPFLAGS"
--          LIBS="$ac_save_LIBS"
--       fi
--     fi
-+  verdep=ifelse([$1], [], [], [">= $1"])
-+  PKG_CHECK_MODULES(XML, [libxml-2.0 $verdep], [$2], [$3])
- 
--     XML_CPPFLAGS=""
--     XML_LIBS=""
--     ifelse([$3], , :, [$3])
--  fi
-+  XML_CPPFLAGS=$XML_CFLAGS
-   AC_SUBST(XML_CPPFLAGS)
--  AC_SUBST(XML_LIBS)
--  rm -f conf.xmltest
- ])
--- 
-2.7.4
-
diff --git a/meta/recipes-core/libxml/libxml2_2.9.12.bb b/meta/recipes-core/libxml/libxml2_2.9.13.bb
similarity index 95%
rename from meta/recipes-core/libxml/libxml2_2.9.12.bb
rename to meta/recipes-core/libxml/libxml2_2.9.13.bb
index 3508733cc0..0482cb88a8 100644
--- a/meta/recipes-core/libxml/libxml2_2.9.12.bb
+++ b/meta/recipes-core/libxml/libxml2_2.9.13.bb
@@ -18,14 +18,12 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20080827.tar.gz;subdir=${BP};name=te
            file://runtest.patch \
            file://run-ptest \
            file://python-sitepackages-dir.patch \
-           file://libxml-m4-use-pkgconfig.patch \
            file://0001-Make-ptest-run-the-python-tests-if-python-is-enabled.patch \
            file://fix-execution-of-ptests.patch \
            file://remove-fuzz-from-ptests.patch \
-           file://0002-Work-around-lxml-API-abuse.patch \
            "
 
-SRC_URI[archive.sha256sum] = "28a92f6ab1f311acf5e478564c49088ef0ac77090d9c719bbc5d518f1fe62eb9"
+SRC_URI[archive.sha256sum] = "276130602d12fe484ecc03447ee5e759d0465558fbc9d6bd144e3745306ebf0e"
 SRC_URI[testtar.sha256sum] = "96151685cec997e1f9f3387e3626d61e6284d4d6e66e0e440c209286c03e9cc7"
 
 BINCONFIG = "${bindir}/xml2-config"
-- 
2.25.1


