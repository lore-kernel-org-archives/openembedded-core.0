Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 440E9C3F6B0
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 08:40:52 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.6276.1659516047363765692
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 01:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Tlm33kxm;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1659516045; i=@fujitsu.com;
	bh=u3JAwZJkMl/g6fzuvPBucm5ARLxDW85f+CgQfgOeqQY=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Tlm33kxmRe9cp2By5UmdO+M88bod2y8I0VZzVji39LZsU2qA2omsoUkYkDCR8r4Qw
	 Bi7qsb09LorVG27H3wUzfESO3DUHK9+siaDQUZ8HtZdXqXRT2bVSTAy7MbCNSKdl24
	 IvzZlGzg1/GtH6p0bW4byBXYfER4fMy4VAbnYaPCgIRlCQEaHyJkonWE7aqQiSuDrZ
	 kBX2dqaxmy/JBzzqr1HqQcc7EqjL66QGtPV8xyzI55BeNiwgpMg5XN5RPzIHO+Qz34
	 1T0/zaqvUg900Qhh6q/z3JFN0h1obuZ2I/GIAgFgZo8TJH82KgvoAuxG+m/prEiES/
	 x+tDIgz1cPqFA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrHIsWRWlGSWpSXmKPExsViZ8OxWbfH5FW
  SwcsOZYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNePp3PssBa84K74/nMXcwNjI2cXIxSEkcJ9R
  ouniB1YI5xKTxMUpG6Cc3YwSxz6sY+5i5ORgE1CTmH7rBlCCg0NEQE/i6j9RkDCzgIrEi9897
  CC2sICTxPud7SwgNgtQfNWMc2wgNi9QfPKW56wgtoSAgsSUh++ZIeKCEidnPmGBmCMhcfDFC2
  aIGkWJ2ZebWSDsCokZM7axQdhqElfPbWKewMg/C0n7LCTtCxiZVjFaJRVlpmeU5CZm5ugaGhj
  oGhqa6prqGhmZ6iVW6SbqpZbqlqcWl+ga6iWWF+ulFhfrFVfmJuek6OWllmxiBAZlSjHrwx2M
  i/t+6h1ilORgUhLlZVJ8lSTEl5SfUpmRWJwRX1Sak1p8iFGGg0NJgjdDCygnWJSanlqRlpkDj
  BCYtAQHj5IIr7ASUJq3uCAxtzgzHSJ1ilGXY+bXtgPMQix5+XmpUuK8esZARQIgRRmleXAjYN
  F6iVFWSpiXkYGBQYinILUoN7MEVf4VozgHo5Iwr6oR0BSezLwSuE2vgI5gAjpCh+sFyBEliQg
  pqQYmh0Mac54anHz8dMLS6jU7ntXceZ1t9lm2K2zaJ7up/6doCbktCa3N5F10yjjZZ9vvKdVN
  dZfaFhs+X3zm2qrgl5ufe8ubOpYsmH6q8sjvlZ+bo9cF7dbQmF2u0M+zTibn785J/a5Fn8785
  14q7xf6/h2P5YIO1+SJzsWivXx+i2fw3F/58uzqqW98Yzy89RdcdBLf92t6zMJnmyYnbJVxtI
  h6nJ7Mc1N62cadh9TnzJTNl7t3K++c81tBoQ+CPP9n8F6VvCtdqFxnnrh6yiLvqyb7V3bOqj5
  df1xpavgV7q7dC3x+nAzQzD3wLv90VFj2l5gr7o+kj7Q2HCoxS7x1gbf1lPv3IJcl/EZvRf4s
  faPEUpyRaKjFXFScCAC+4+DMUQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-22.tower-591.messagelabs.com!1659516044!133932!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13313 invoked from network); 3 Aug 2022 08:40:44 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-22.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 3 Aug 2022 08:40:44 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 380E27B
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:40:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2BAA475
	for <openembedded-core@lists.openembedded.org>;
 Wed,  3 Aug 2022 09:40:44 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 3 Aug 2022 09:40:42 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-attrs: upgrade 21.4.0 -> 22.1.0
Date: Wed, 3 Aug 2022 16:40:27 +0800
Message-ID: <1659516030-31123-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 08:40:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168803

License-Update: add "and the attrs contributors" to Copyright

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-attrs_21.4.0.bb => python3-attrs_22.1.0.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-attrs_21.4.0.bb => python3-attrs_22.1.0.bb} (68%)

diff --git a/meta/recipes-devtools/python/python3-attrs_21.4.0.bb b/meta/recipes-devtools/python/python3-attrs_22.1.0.bb
similarity index 68%
rename from meta/recipes-devtools/python/python3-attrs_21.4.0.bb
rename to meta/recipes-devtools/python/python3-attrs_22.1.0.bb
index 1839ce6245..ba07ac71e3 100644
--- a/meta/recipes-devtools/python/python3-attrs_21.4.0.bb
+++ b/meta/recipes-devtools/python/python3-attrs_22.1.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Classes Without Boilerplate"
 HOMEPAGE = "http://www.attrs.org/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=d4ab25949a73fe7d4fdee93bcbdbf8ff"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=5e55731824cf9205cfabeab9a0600887"
 
-SRC_URI[sha256sum] = "626ba8234211db98e869df76230a137c4c40a12d72445c45d5f5b716f076e2fd"
+SRC_URI[sha256sum] = "29adc2665447e5191d0e7c568fde78b21f9672d344281d0c6e1ab085429b22b6"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.25.1


