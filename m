Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04392C5321E
	for <webhook@archiver.kernel.org>; Tue, 20 Aug 2024 06:52:29 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.12720.1724136740569396296
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 23:52:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R9YBv093;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724136740; x=1755672740;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=s+rDnNLUUOJ/b8UvC9c2VqBoKHn82LT+1ldAB56E/do=;
  b=R9YBv0936OWOUZwpRyYNrRaDupxjbfHpCWauC1UGy4PQc3FfSWWJjcio
   wXhlCPTOmMhgjzPsMtYM66FlvOZoNsLTTQnlNC94O/Rvhm/IYwBDSGKFr
   /VNs1wz3qiH6E/axoXYsbY+ZXAvvQopBAbH6U9lvJyKlT/4tab+Xfij6+
   eu5+fGLzPFFA6QqL3YL7eLvarKY3XXkPCmkVjwpR+foJL4uU5EjzD6b9l
   gnp07MSgKtceK3ow1JlOx7DXeriSbubVcRM/xUkH7gMA4P2o5FYxbJYI7
   TuT04A0aG/SKEfG2nIptOmmm1YlRiZjEeSGwzsuBZ/sJ6QIyNa4U6NC28
   w==;
X-CSE-ConnectionGUID: UcRm/VdpR6GwW61AeYb8fw==
X-CSE-MsgGUID: hX6wVXiwTamLVHB9Rilskw==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="171121031"
X-IronPort-AV: E=Sophos;i="6.10,161,1719846000"; 
   d="scan'208";a="171121031"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 15:52:18 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 021F5DB3CA
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:16 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 49AADCFA59
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CFC71E206E
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 15:52:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7AC9D1A000C;
	Tue, 20 Aug 2024 14:52:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/24] python3-lxml: upgrade 5.2.2 -> 5.3.0
Date: Tue, 20 Aug 2024 14:51:37 +0800
Message-Id: <1724136703-20023-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
References: <1724136703-20023-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28606.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28606.005
X-TMASE-Result: 10-2.196500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr4eOkQ7CedpssTMNBTJAZWYqc
	y9k5AnXI+PIDJm8nMt2U7Dof0FrM+W94Ipa1otxoP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFlwV2iaAfSWcURSScn+QSXt0H8LFZNFG76sBnwpOylLMMOZ
	MK1oJbIw/xENSINcEib8QeHsLj4VfTMqrfUFycypVWps+2UzPhVLcTroDOLO30D2OkABDxPnJ/I
	2Z+VS8eOB4yZ84jhs2IHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Aug 2024 06:52:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203540

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* GH#421: Nested "CDATA" sections are no longer rejected but split on
  output to represent "]]>" correctly.
* LP#2060160: Attribute values serialised differently in "xmlfile.element()"
  and "xmlfile.write()".
* LP#2058177: The ISO-Schematron implementation could fail on unknown prefixes.
* LP#2067707: The "strip_cdata" option in "HTMLParser()" turned out
  to be useless and is now deprecated.
* Binary wheels use the library versions libxml2 2.12.9 and libxslt 1.1.42.
* Windows binary wheels use the library versions libxml2 2.11.8 and libxslt 1.1.39.
* Built with Cython 3.0.11.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lxml_5.2.2.bb => python3-lxml_5.3.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-lxml_5.2.2.bb => python3-lxml_5.3.0.bb} (95%)

diff --git a/meta/recipes-devtools/python/python3-lxml_5.2.2.bb b/meta/recipes-devtools/python/python3-lxml_5.3.0.bb
similarity index 95%
rename from meta/recipes-devtools/python/python3-lxml_5.2.2.bb
rename to meta/recipes-devtools/python/python3-lxml_5.3.0.bb
index b114c18763..4c9c22e5c4 100644
--- a/meta/recipes-devtools/python/python3-lxml_5.2.2.bb
+++ b/meta/recipes-devtools/python/python3-lxml_5.3.0.bb
@@ -18,7 +18,7 @@ LIC_FILES_CHKSUM = "file://LICENSES.txt;md5=e4c045ebad958ead4b48008f70838403 \
 
 DEPENDS += "libxml2 libxslt"
 
-SRC_URI[sha256sum] = "bb2dc4898180bea79863d5487e5f9c7c34297414bad54bcd0f0852aee9cfdb87"
+SRC_URI[sha256sum] = "4e109ca30d1edec1ac60cdbe341905dc3b8f55b16855e03a54aaf59e51ec8c6f"
 
 SRC_URI += "${PYPI_SRC_URI}"
 inherit pkgconfig pypi setuptools3
-- 
2.34.1


