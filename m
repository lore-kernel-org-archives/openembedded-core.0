Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08F9CCA5FCE
	for <webhook@archiver.kernel.org>; Mon,  5 Oct 2026 09:23:55 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16184.1791192230137299284
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 Oct 2026 02:23:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Blf4sKIw;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9507; q=dns/txt;
  s=iport01; t=1791192230; x=1792401830;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JG19SmV7Y+sY7jV0hVvWm8f/dfMcrxDGCHF0M9T7E5Y=;
  b=Blf4sKIwEmIYSmc9ziPpojE/J08cPBb6rQ2enihBSL3T6kLwKVPB5SD0
   glOLI+xyikPhJWKQhIb0qlmTTInjxcEdUW6v6JB+aLxptdaYSTJPPeGYw
   GuMRpzmXFTAhmdlHubnVeOL9Rp6Gbdw2sQrRYSdREG90hOuhP8hSLQtUq
   tytT9UesfrvXvBDS+VnMt+bu6Y0htqpWMaYsYJ6cgrCPh7Sg1sG5DgTvY
   LeDUqHXgydNApzCUgzcHpi0ZG2QnaTDGmkJD7YQecOzYxaj2xpDQwm9bC
   hTnqhg7jotVLsrri6WXEEUqRyirHl9gxjlGfpEuUVpMXoYaVEQbB14W1U
   Q==;
X-CSE-ConnectionGUID: gszlBoUpR72sqiqKkBEQxQ==
X-CSE-MsgGUID: 0qLiXRv9QNGTxeERc2Ccaw==
X-IPAS-Result: =?us-ascii?q?A0BIAgA6a8Nq/43/Ja1aHgEBCxIMggULgld1YUJJlkoDg?=
 =?us-ascii?q?ROdB4F+DwEBAQ9EDQQBAYQ/RgKOCQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBC?=
 =?us-ascii?q?gEBBQEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQCA?=
 =?us-ascii?q?RG1NYF5M4EBgykBPwJDUNsyAQsUAQWBM4VAiCNdGAFEhDgnGxuBcoEVgTuBO?=
 =?us-ascii?q?HaBBYFcAQECgTaGbQSCIoEMgVoek05IgR4DWSwBVRMNCgsHBYFmAzUSKhVuM?=
 =?us-ascii?q?h2BIz4XgQcbBgWBHYEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB?=
 =?us-ascii?q?0VTCSVFEkcmIggSCQETGjALgRs4PAkoRBcMEBgNSBEsNxUZBD5uB5BQHoITL?=
 =?us-ascii?q?RkHAXoTASgCAReBHYEyknSQJ4IhgTWfWgoog3aMIpU6GjOqbwuYfY4KlTSBH?=
 =?us-ascii?q?IRpgWg8gUcLB3AVgyIJShkPjjmDa4F/gxTHJiQ1AgkyAQEHAgcOAwuBaJABg?=
 =?us-ascii?q?X0BAQ?=
IronPort-Data: A9a23:/uZYrK8aGURmPo8jbcvRDrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 WcZCDzUPviPZTbxLdsiPd/j8h4F7MCGndMxGgJlrylEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajpIs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k5Jp8c0OFKGVsRr
 +cBKSkubTquvvKPlefTpulE3qzPLeHxN48Z/3UlxjbDALN+HdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0Qn1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCwa4OIJofWHpg9ckCw/
 nvi/lTDHEAjEvOj2TeoyHn2reTGgnauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBWi4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:n885oKEQFZ7b5mN4pLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:pwWlvmzXID1ZHBTSux/FBgUbAdIhWHrg1E2PeVShCH9KS5e4cE+prfY=
X-Talos-MUID: =?us-ascii?q?9a23=3An9Z7qwxJjLuEobHEHg52hlpsksWaqPy3LEE9q4t?=
 =?us-ascii?q?Xgu+rCTx9Fg2W1h+8S5Byfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,141,1787011200"; 
   d="scan'208";a="531543435"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Oct 2026 09:23:49 +0000
Received: from sjc-ads-4178.cisco.com (sjc-ads-4178.cisco.com [171.70.54.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id 1691C180001A0;
	Mon,  5 Oct 2026 09:23:49 +0000 (GMT)
Received: by sjc-ads-4178.cisco.com (Postfix, from userid 1887505)
	id A031DCC12B5; Mon,  5 Oct 2026 02:23:48 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH v2 8/8] libxml2: Fix CVE-2026-86144
Date: Mon,  5 Oct 2026 02:23:46 -0700
Message-Id: <20261005092346.1670265-8-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261005092346.1670265-1-hthakar@cisco.com>
References: <20261005092346.1670265-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-4178.cisco.com [171.70.54.199];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.54.199, sjc-ads-4178.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 05 Oct 2026 09:23:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247233

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/GNOME/libxml2/commit/b63cd517afecb76582dd9488c55e54ceaf50de61
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-86144

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
Changes in v2
- limit backport changes to 80 characters
---
 .../libxml/libxml2/CVE-2026-86144.patch       | 225 ++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |   1 +
 2 files changed, 226 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch
new file mode 100644
index 0000000000..77dd2a07e2
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86144.patch
@@ -0,0 +1,225 @@
+From 8d0c6eb94f8a32a49e3c9122a6da82c519198063 Mon Sep 17 00:00:00 2001
+From: Ruben Thijssen <ruben.thijssen@cba.com.au>
+Date: Fri, 15 May 2026 15:42:18 +1000
+Subject: [PATCH] fix(xinclude): propagate parseFlags in xmlXIncludeProcess and
+ xmlXIncludeProcessTree
+
+CVE: CVE-2026-86144
+Upstream-Status: Backport [https://github.com/GNOME/libxml2/commit/b63cd517afecb76582dd9488c55e54ceaf50de61]
+
+Backport Changes:
+- Use xmlLoadExternalEntity() with xmlCtxtUseOptions() because Scarthgap
+  2.12.10 predates xmlLoadResource() and resource-loader callbacks.
+- Adapt the regression tests for 2.12.10 by using the global structured-error
+  handler, matching 2.12.10 loader network-entity diagnostics, and restoring
+  the test handler after xmlXIncludeProcess().
+- Omit the upstream XML_IO_NETWORK_ATTEMPT filter because the 2.12.10
+  xmlLoadExternalEntity() path has no corresponding post-load error-filtering
+  block.
+- Add a parser-context allocation guard because the target version can return
+  NULL from xmlNewParserCtxt().
+
+(cherry picked from commit b63cd517afecb76582dd9488c55e54ceaf50de61)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ result/XInclude/issue1120-1.xml         |  4 ++
+ result/XInclude/issue1120-1.xml.err     |  1 +
+ result/XInclude/issue1120-2.xml         |  4 ++
+ result/XInclude/issue1120-2.xml.err     |  1 +
+ runtest.c                               | 75 +++++++++++++++++++++++++
+ test/XInclude/issue1120/issue1120-1.xml |  6 ++
+ test/XInclude/issue1120/issue1120-2.xml |  6 ++
+ xinclude.c                              |  9 ++-
+ 8 files changed, 104 insertions(+), 2 deletions(-)
+ create mode 100644 result/XInclude/issue1120-1.xml
+ create mode 100644 result/XInclude/issue1120-1.xml.err
+ create mode 100644 result/XInclude/issue1120-2.xml
+ create mode 100644 result/XInclude/issue1120-2.xml.err
+ create mode 100644 test/XInclude/issue1120/issue1120-1.xml
+ create mode 100644 test/XInclude/issue1120/issue1120-2.xml
+
+diff --git a/result/XInclude/issue1120-1.xml b/result/XInclude/issue1120-1.xml
+new file mode 100644
+index 00000000..5d83cc96
+--- /dev/null
++++ b/result/XInclude/issue1120-1.xml
+@@ -0,0 +1,4 @@
++<?xml version="1.0"?>
++<doc xmlns:xi="http://www.w3.org/2001/XInclude">
++  Network access is not allowed
++</doc>
+diff --git a/result/XInclude/issue1120-1.xml.err b/result/XInclude/issue1120-1.xml.err
+new file mode 100644
+index 00000000..c134bed1
+--- /dev/null
++++ b/result/XInclude/issue1120-1.xml.err
+@@ -0,0 +1 @@
++I/O error : Attempt to load network entity http://example.invalid/file.txt
+diff --git a/result/XInclude/issue1120-2.xml b/result/XInclude/issue1120-2.xml
+new file mode 100644
+index 00000000..af5bde91
+--- /dev/null
++++ b/result/XInclude/issue1120-2.xml
+@@ -0,0 +1,4 @@
++<?xml version="1.0"?>
++<doc xmlns:xi="http://www.w3.org/2001/XInclude">
++  <p>Network access is not allowed</p>
++</doc>
+diff --git a/result/XInclude/issue1120-2.xml.err b/result/XInclude/issue1120-2.xml.err
+new file mode 100644
+index 00000000..051f5928
+--- /dev/null
++++ b/result/XInclude/issue1120-2.xml.err
+@@ -0,0 +1 @@
++I/O error : Attempt to load network entity http://example.invalid/file.xml
+diff --git a/runtest.c b/runtest.c
+index e91e2dfd..297cb5e2 100644
+--- a/runtest.c
++++ b/runtest.c
+@@ -2444,6 +2444,75 @@ noentParseTest(const char *filename, const char *result,
+     return(res);
+ }
+ 
++#ifdef LIBXML_XINCLUDE_ENABLED
++/**
++ * Parse a file and run xmlXIncludeProcess() to verify that doc->parseFlags
++ * is propagated properly.
++ *
++ * @param filename  the file to parse
++ * @param result  the file with expected result
++ * @param err  the file with error messages
++ * @returns 0 in case of success, an error code otherwise
++ */
++static int
++xincludeProcessTest(const char *filename, const char *result, const char *err,
++                    int options) {
++    xmlParserCtxtPtr ctxt;
++    xmlDocPtr doc;
++    xmlChar *base = NULL;
++    int size, res;
++    int ret = 0;
++
++    nb_tests++;
++
++    /* Create a new parser context */
++    ctxt = xmlNewParserCtxt();
++    if (ctxt == NULL)
++        return(-1);
++
++    /* Load the data from `filename` into a parser context */
++    xmlSetStructuredErrorFunc(NULL, testStructuredErrorHandler);
++    doc = xmlCtxtReadFile(ctxt, filename, NULL, options);
++    xmlFreeParserCtxt(ctxt);
++
++    /* Check if `doc` was created successfully */
++    if (doc == NULL) {
++        testErrorHandler(NULL, "%s : failed to parse\n", filename);
++        return(-1);
++    }
++
++    /*
++     * Run xmlXIncludeProcess() with a structured error handler to check that
++     * the parse flags are propagated.
++     */
++    xmlSetStructuredErrorFunc(NULL, testStructuredErrorHandler);
++    xmlXIncludeProcess(doc);
++    xmlSetStructuredErrorFunc(NULL, testStructuredErrorHandler);
++
++    /* Check the result and for any errors */
++    if (result) {
++        xmlDocDumpMemory(doc, &base, &size);
++        res = compareFileMem(result, (char *) base, size);
++        xmlFree(base);
++        if (res != 0) {
++            fprintf(stderr, "Result for %s failed in %s\n", filename, result);
++            ret = -1;
++        }
++    }
++
++    if ((ret == 0) && (err != NULL)) {
++        res = compareFileMem(err, testErrors, testErrorsSize);
++        if (res != 0) {
++            fprintf(stderr, "Error for %s failed\n", filename);
++            ret = -1;
++        }
++    }
++
++    xmlFreeDoc(doc);
++    return(ret);
++}
++#endif
++
+ /**
+  * errParseTest:
+  * @filename: the file to parse
+@@ -5134,6 +5203,12 @@ testDesc testDescriptions[] = {
+     { "XInclude regression tests without reader",
+       errParseTest, "./test/XInclude/without-reader/*", "result/XInclude/", "",
+       ".err", XML_PARSE_XINCLUDE },
++    { "XInclude issue1120 regression tests",
++      errParseTest, "./test/XInclude/issue1120/*", "result/XInclude/", "",
++      ".err", XML_PARSE_XINCLUDE | XML_PARSE_NONET },
++    { "XInclude xmlXIncludeProcess() issue1120 regression tests",
++      xincludeProcessTest, "./test/XInclude/issue1120/*", "result/XInclude/",
++      "", ".err", XML_PARSE_NONET },
+ #endif
+ #ifdef LIBXML_XPATH_ENABLED
+ #ifdef LIBXML_DEBUG_ENABLED
+diff --git a/test/XInclude/issue1120/issue1120-1.xml b/test/XInclude/issue1120/issue1120-1.xml
+new file mode 100644
+index 00000000..b0b8feef
+--- /dev/null
++++ b/test/XInclude/issue1120/issue1120-1.xml
+@@ -0,0 +1,6 @@
++<?xml version="1.0"?>
++<doc xmlns:xi="http://www.w3.org/2001/XInclude">
++  <xi:include href="http://example.invalid/file.txt" parse="text">
++    <xi:fallback>Network access is not allowed</xi:fallback>
++  </xi:include>
++</doc>
+diff --git a/test/XInclude/issue1120/issue1120-2.xml b/test/XInclude/issue1120/issue1120-2.xml
+new file mode 100644
+index 00000000..b4c9fe5e
+--- /dev/null
++++ b/test/XInclude/issue1120/issue1120-2.xml
+@@ -0,0 +1,6 @@
++<?xml version="1.0"?>
++<doc xmlns:xi="http://www.w3.org/2001/XInclude">
++  <xi:include href="http://example.invalid/file.xml">
++    <xi:fallback><p>Network access is not allowed</p></xi:fallback>
++  </xi:include>
++</doc>
+diff --git a/xinclude.c b/xinclude.c
+index b6581558..0d57f5a1 100644
+--- a/xinclude.c
++++ b/xinclude.c
+@@ -1688,6 +1688,11 @@ xmlXIncludeLoadTxt(xmlXIncludeCtxtPtr ctxt, const xmlChar *url,
+      * Load it.
+      */
+     pctxt = xmlNewParserCtxt();
++    if (pctxt == NULL) {
++        xmlXIncludeErrMemory(ctxt, ref->elem, NULL);
++        goto error;
++    }
++    xmlCtxtUseOptions(pctxt, ctxt->parseFlags);
+     inputStream = xmlLoadExternalEntity((const char*)URL, NULL, pctxt);
+     if(inputStream == NULL)
+ 	goto error;
+@@ -2416,7 +2421,7 @@ xmlXIncludeProcessFlags(xmlDocPtr doc, int flags) {
+  */
+ int
+ xmlXIncludeProcess(xmlDocPtr doc) {
+-    return(xmlXIncludeProcessFlags(doc, 0));
++    return(xmlXIncludeProcessFlags(doc, doc ? doc->parseFlags : 0));
+ }
+ 
+ /**
+@@ -2461,7 +2466,7 @@ xmlXIncludeProcessTreeFlags(xmlNodePtr tree, int flags) {
+  */
+ int
+ xmlXIncludeProcessTree(xmlNodePtr tree) {
+-    return(xmlXIncludeProcessTreeFlags(tree, 0));
++    return(xmlXIncludeProcessTreeFlags(tree, (tree && tree->doc) ? tree->doc->parseFlags : 0));
+ }
+ 
+ /**
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index 1363beba7a..5e4cabbf5d 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -38,6 +38,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-86141.patch \
            file://CVE-2026-86142.patch \
            file://CVE-2026-86143.patch \
+           file://CVE-2026-86144.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.35.6


