Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EABBC7EE39
	for <webhook@archiver.kernel.org>; Thu,  1 Jun 2023 09:04:08 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.26243.1685610239733103081
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 02:04:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="98556115"
X-IronPort-AV: E=Sophos;i="6.00,209,1681138800"; 
   d="scan'208";a="98556115"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 18:04:03 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7923DD3EA9
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:01 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B5C71D5020
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Jun 2023 18:04:00 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id D862E88857;
	Thu,  1 Jun 2023 18:03:59 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] python3-ruamel-yaml: upgrade 0.17.21 -> 0.17.31
Date: Thu,  1 Jun 2023 17:03:24 +0800
Message-Id: <1685610221-29015-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
References: <1685610221-29015-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27664.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27664.006
X-TMASE-Result: 10-2.131000-10.000000
X-TMASE-MatchedRID: EGTy8EHGssijz0nOeth/yUIIxwDaU5mrTfK5j0EZbysvPRFFhcWhYKTz
	q4wH3yI2SX/bUTNvlqVrLoT+j1PhkiZHbwgU3JbsCoHzIAMWCU1gg7HO8z2tNnMsGegbdjl3+xj
	xs2OXeAZ2aOfb3vXhU5iGESsVDSMbdh9gYos97K24u3nS+3EEDvioIsi7Sa0gmS0TtehjpJJc2L
	MDQvdsc2k3J1uyUa7Xy9bS88sNu2EyApNZQ27iMyAWHOR37+AT8ej03A8UqeWgY3nWB9vQ8IUE/
	/lwpCnJJtlmyPlXmRHE2z1dxAMskR2P280ZiGmRP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwUe
	vDt+uW5tMXimGWsZZKEfeQTpODV8eBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8mfop0
	ytGwvXiq2rl3dzGQ1JvSMQQraxIiIG/IZgDG9gJY932MoJCauo+rTlSaDcRYiS28Kh+O2MLlvpd
	5D9h18j/k3YuMxLZBHNNl3wJz50KZBYB6UW/n2jiDf2NCMWE1TyZ1y9sjWHZLqPOO5dObQxMzMg
	JrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 09:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182072

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- added tag.setter on 'ScalarEvent' and on 'Node', that takes either 
    a 'Tag' instance, or a str 
- fix issue 467, caused by Tag instances not being hashable
- changed the internals of the tag property from a string to a class which allows
  for preservation of the original handle and suffix. This should
  result in better results using documents with %TAG directives, as well
  as preserving URI escapes in tag suffixes.
- fix for issue 464: documents ending with document end marker without final newline
  fail to load
- fix issue with inline mappings as value for merge keys
- fix for 468, error inserting after accessing merge attribute on "CommentedMap"
- fix for issue 461 pop + insert on same 'CommentedMap' key throwing error
- Fix for error on edge cage for issue 459
- fix for regression while dumping wrapped strings with too many backslashes removed
- rewrite of "CommentedMap.insert()". If you have a merge key in
  the YAML document for the mapping you insert to, the position value should 
  be the one as you look at the YAML input.
  This fixes issue 453 where other
  keys of a merged in mapping would show up after an insert
  It
  also fixes a call to '.insert()' resulting into the merge key to move
  to be the first key if it wasn't already and it is also now possible
  to insert a key before a merge key (even if the fist key in the mapping).
- fix (in the pure Python implementation including default) for issue 447.
  also brought up by brent on 
  'StackOverflow <https://stackoverflow.com/q/40072485/1307905>'__)
- fix 458, error on plain scalars starting with word longer than width.
- fix for ".update()" no longer correctly handling keyword arguments
- fix issue 454: high Unicode (emojis) in quoted strings always
  escaped
- fix issue with emitter conservatively inserting extra backslashes in wrapped
  quoted strings
- fix issue 449 where the second exclamation marks got URL encoded
  and fixing PR
- fix issue with indent != 2 and literal scalars with empty first line
- updated __repr__ of CommentedMap, now that Python's dict is ordered -> no more 
  ordereddict(list-of-tuples)
- merge MR 4, handling OctalInt in YAML 1.1 
- fix loading of '!!float 42'
- line numbers are now set on 'CommentedKeySeq' and 'CommentedKeyMap' (which
  are created if you have a sequence resp. mapping as the key in a mapping)
- plain scalars: put single words longer than width on a line of their own, instead
  of after the previous line
- fix for folded scalar part of 421: comments after ">" on first line of folded
  scalars are now preserved (as were those in the same position on literal scalars).
- added stacklevel to warnings
- typing changed from Py2 compatible comments to Py3, removed various Py2-isms

License-Update: Copyright year updated to 2023

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-ruamel-yaml_0.17.21.bb => python3-ruamel-yaml_0.17.31.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-ruamel-yaml_0.17.21.bb => python3-ruamel-yaml_0.17.31.bb} (75%)

diff --git a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.21.bb b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.31.bb
similarity index 75%
rename from meta/recipes-devtools/python/python3-ruamel-yaml_0.17.21.bb
rename to meta/recipes-devtools/python/python3-ruamel-yaml_0.17.31.bb
index 7d65c4c2d8..5604ff01e4 100644
--- a/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.21.bb
+++ b/meta/recipes-devtools/python/python3-ruamel-yaml_0.17.31.bb
@@ -3,13 +3,13 @@ HOMEPAGE = "https://pypi.org/project/ruamel.yaml/"
 AUTHOR = "Anthon van der Neut"
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=034154b7344d15438bc5ed5ee9cc075f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0e5f41db57c3a8d3584b450d35985ad1"
 
 PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af"
+SRC_URI[sha256sum] = "098ed1eb6d338a684891a72380277c1e6fc4d4ae0e120de9a447275056dda335"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
-- 
2.34.1


