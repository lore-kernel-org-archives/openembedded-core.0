Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCCDC3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 08:44:23 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.13784.1704271453938788120
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jan 2024 00:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="133114150"
X-IronPort-AV: E=Sophos;i="6.04,327,1695654000"; 
   d="scan'208";a="133114150"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2024 17:44:11 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id EE54AD6187
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jan 2024 17:44:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 32A3DF25C8
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jan 2024 17:44:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id BA7FF20097CF4
	for <openembedded-core@lists.openembedded.org>; Wed,  3 Jan 2024 17:44:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 68CB11A0070;
	Wed,  3 Jan 2024 16:44:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-lxml: upgrade 4.9.4 -> 45.0.0
Date: Wed,  3 Jan 2024 16:42:58 +0800
Message-Id: <1704271378-18012-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1704271378-18012-1-git-send-email-wangmy@fujitsu.com>
References: <1704271378-18012-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28096.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28096.006
X-TMASE-Result: 10--4.889500-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrKQNhMboqZlqo56EgB7X94l51
	jW7DITz5/DW1GvHktOhjDSloE/K2AmDkZXCxhKbBOWUWxTQJdI+DnmblFLAswntzXL7lPwD/j7C
	qC9lRaqg2g+/iMiQLA2Fmg4aAOjOwL1i7SY1uYHKqh5pv1eDPz5v7eN3eThF+yIKHzIGoT60Rlz
	Zw9jZp3Qd+SVJtCjAADcq+tTLukTptF6/n498MP/LeH1FBnhK0wTlc9CcHMZdH8jOVX4Ixttb2e
	7N2CFQyYL1LiBO7iuWMxiIndHCbIi9b7bd19qdFngIgpj8eDcAZ1CdBJOsoY8RB0bsfrpPIcSqb
	xBgG0w4XXKrMixCDou2OCbIUrfec1qnjmdcU0NxH7TLBWDUEgUU0WegpLy8WhI9vLdKi4IfWsLU
	671Pfj3xpwYaaGD6KoRYNjusXJ5KCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jan 2024 08:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193276

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-LP#1976304: The "Element.addnext()" method previously inserted the new element
 before existing tail text.  The tail text of both sibling elements now stays on
 the respective elements.
-LP#1980767, GH#379: "TreeBuilder.close()" could fail with a "TypeError" after
 parsing incorrect input.
-"Element.itertext(with_tail=False)" returned the tail text of comments and
 processing instructions, despite the explicit option.
-GH#370: A crash with recent libxml2 2.11.x versions was resolved.
-A compile problem with recent libxml2 2.12.x versions was resolved.
-The internal exception handling in C callbacks was improved for Cython 3.0.
-The exception declarations of "xmlInputReadCallback", "xmlInputCloseCallback",
-"xmlOutputWriteCallback" and "xmlOutputCloseCallback" in "tree.pxd" were
 corrected to prevent running Python code or calling into the C-API with a live
 exception set.
-GH#385: The long deprecated "unittest.makeSuite()" function is no longer used.
-LP#1522052: A file-system specific test is now optional and should no longer fail
 on systems that don't support it.
-GH#392: Some tests were adapted for libxml2 2.13.
-Contains all fixes from lxml 4.9.4.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lxml_4.9.4.bb => python3-lxml_5.0.0.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_4.9.4.bb => python3-lxml_5.0.0.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-lxml_4.9.4.bb b/meta/recipes-devtools/python/python3-lxml_5.0.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-lxml_4.9.4.bb
rename to meta/recipes-devtools/python/python3-lxml_5.0.0.bb
index ed8bce0735..e27405fd23 100644
--- a/meta/recipes-devtools/python/python3-lxml_4.9.4.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.0.0.bb
@@ -18,10 +18,11 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "b1541e50b78e15fa06a2670157a1962ef06591d4c998b998047fff5e3236880e"
+SRC_URI[sha256sum] = "2219cbf790e701acf9a21a31ead75f983e73daf0eceb9da6990212e4d20ebefe"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
+PYPI_PACKAGE_EXT = "zip"
 
 # {standard input}: Assembler messages:
 # {standard input}:1488805: Error: branch out of range
-- 
2.34.1


