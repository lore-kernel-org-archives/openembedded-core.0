Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11229C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 05:24:27 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.134798.1673760264513708293
 for <openembedded-core@lists.openembedded.org>;
 Sat, 14 Jan 2023 21:24:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=p2iIPAS8;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673760262; i=@fujitsu.com;
	bh=aYsmfRf01JBnIvL4OuXg8Dzn42aSjEK1wuLt6LzCt9s=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=p2iIPAS8AglmOGkeusQ3WeWRKVfTO+s1zP0TUxRUn14eHShMGZtszEyRVNAFVZ8/h
	 zuk6OBLzZp+xF9kyLVslJxlIYEHF2cou8gnW0zCkPgcupeEw62l2xTRTl+Fsp3uQ4y
	 Y8KyNv+WKLFrkJRsSVA3oe9JXVwXM+VkL0Mo0veYxn+oLCbCMALWVAFXIS/n5/wVHa
	 /WyW7EDiumgk9DWbIE9BDSekRXgyHkqEpDoQODMZ/49d97KPZlHpnyu50el0D6GAy6
	 ZYW15pRjheOFVQACrC+QPFoM1nyT7Tyg9jg32iSV1aPpkyP5X4MHtcSysR/o8pm80o
	 Bpij2WaN3xztA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8ORqMvadzj
  Z4Pc2TYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaN303SWgneSFdO/NrA1MG4T62Lk4hASeMwo
  cezCIhYI5zqTxPsb39khnL2MEveOn2DsYuTkYBOQkrhx/z9bFyMHh4iAnsTVf6IgYWYBFYkXv
  3vYQWxhAVeJ7o/XmUBsFgFViSvX1oHZvAKOErtOHgSrkRBQkJjy8D0zRFxQ4uTMJywQcyQkDr
  54wQxRoygx+3IzC4RdKdH64ReUrSZx9dwm5gmM/LOQtM9C0r6AkWkVo2lxalFZapGuhV5SUWZ
  6RkluYmaOXmKVbqJeaqlueWpxia6hXmJ5sV5qcbFecWVuck6KXl5qySZGYCimFDO572A8uuyP
  3iFGSQ4mJVHeyG+HkoX4kvJTKjMSizPii0pzUosPMcpwcChJ8G5oPJwsJFiUmp5akZaZA4wLm
  LQEB4+SCK92B1Cat7ggMbc4Mx0idYpRUUqc90UPUEIAJJFRmgfXBovFS4yyUsK8jAwMDEI8Ba
  lFuZklqPKvGMU5GJWEeZ+CTOHJzCuBm/4KaDET0OKQ+oMgi0sSEVJSDUxzZoecY9XdE26gbde
  Seju3dfvpZ1ae/yMf/5dfN8FhfuuW/NXfpiq9u1uwcUW7sKWemdWCnSfqb2v8MzH99NC4/8zR
  /1wlIjNOdfyvUhKQ95mgYs/0r0JIm1ngp8nJO22X9E/fPt58e/YM6x3zOx6s+pvdceSvTInoL
  JFSTVcG/fi0iujnwh9KG9ii9q+7J+x+4rDSi4SXm9480p785v7S0ucL5v9od3orYccaskCj7W
  2N8iRmq/fvNVyqp5vuzk849lfpmlV51ctpnofWFH/N1/HdsS1+U+jxpRt1f0deqxW8qP9iz68
  IXddwnSUlL/wYr7A/3XXFgEVtwZwzp0oSA+dN+FgYcuXoh59unIullFiKMxINtZiLihMBE3XI
  BkADAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-585.messagelabs.com!1673760261!237712!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6219 invoked from network); 15 Jan 2023 05:24:21 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 15 Jan 2023 05:24:21 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 468FE100188
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:21 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 39D4E100182
	for <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 15 Jan 2023 05:24:19 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-cython: upgrade 0.29.32 -> 0.29.33
Date: Sun, 15 Jan 2023 13:24:06 +0800
Message-ID: <1673760250-2563-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Jan 2023 05:24:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175872

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Features added
--------------
* The "cythonize" and "cython" commands have a new option "-M" / "--depfile"
  to generate ".dep" dependency files for the compilation unit.  This can be used
  by external build tools to track these dependencies.
  The "cythonize" option was already available in Cython :ref:'0.29.27'.

Bugs fixed
----------
* "const" fused types could not be used with memory views.
  Patch by Thomas Vincent.  (Github issue :issue:'1772')
* "wstr" usage was removed in Python 3.12 and later (PEP-623).
  (Github issue :issue:'5145')
* A type check assertion for Cython functions failed in debug Python builds.
  (Github issue :issue:'5031')
* Fixed various compiler warnings.
  Patches by Lisandro Dalcin et al.  (Github issues :issue:'4948', :issue:'5086')
* Fixed error when calculating complex powers of negative numbers.
  (Github issue :issue:'5014')
* Corrected a small mis-formatting of exception messages on Python 2.
  (Github issue :issue:'5018')
* The "PyUnicode_AsUTF8AndSize()" C-API function was missing from the CPython declarations.
  (Github issue :issue:'5163')
* A performance problem in the compiler was resolved when nesting conditional expressions.
  (Github issue :issue:'5197')
* Test suite problems with recent NumPy and CPython versions were resolved.
  (Github issues :issue:'5183', :issue:'5190')

Other changes
-------------
* The undocumented, untested and apparently useless syntax
  "from somemodule cimport class/struct/union somename" was deprecated
  in anticipation of its removal in Cython 3.  The type
  modifier is not needed here and a plain "cimport" of the name will do.
  (Github issue :issue:'4905')
* Properly disable generation of descriptor docstrings on PyPy since they cause crashes.
  It was previously disabled, but only accidentally via a typo.
  Patch by Matti Picus.  (Github issue :issue:'5083')
* The "cpow" directive of Cython 3.0 is available as a no-op.
  (Github issue :issue:'5016')

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-devtools/python/python-cython.inc                  | 2 +-
 .../{python3-cython_0.29.32.bb => python3-cython_0.29.33.bb}    | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-cython_0.29.32.bb => python3-cython_0.29.33.bb} (100%)

diff --git a/meta/recipes-devtools/python/python-cython.inc b/meta/recipes-devtools/python/python-cython.inc
index 750ccfd7ae..30d1b39467 100644
--- a/meta/recipes-devtools/python/python-cython.inc
+++ b/meta/recipes-devtools/python/python-cython.inc
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 PYPI_PACKAGE = "Cython"
 BBCLASSEXTEND = "native nativesdk"
 
-SRC_URI[sha256sum] = "8733cf4758b79304f2a4e39ebfac5e92341bce47bcceb26c1254398b2f8c1af7"
+SRC_URI[sha256sum] = "5040764c4a4d2ce964a395da24f0d1ae58144995dab92c6b96f44c3f4d72286a"
 UPSTREAM_CHECK_REGEX = "Cython-(?P<pver>.*)\.tar"
 
 inherit pypi
diff --git a/meta/recipes-devtools/python/python3-cython_0.29.32.bb b/meta/recipes-devtools/python/python3-cython_0.29.33.bb
similarity index 100%
rename from meta/recipes-devtools/python/python3-cython_0.29.32.bb
rename to meta/recipes-devtools/python/python3-cython_0.29.33.bb
-- 
2.25.1


