Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 719F0C54E6A
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 07:09:29 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.10799.1710313767460299285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 00:09:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=otEdYpIS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710313768; x=1741849768;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QWkT3yrFmdxaSnparEVpx1FvTljIwqwp9cy6yR/E2zo=;
  b=otEdYpISYtXCxatjX1vkc79Ck96kniyU/eSW2mrfcsgrvGZPyNqnpUOL
   XPYljNCnJN2EOQB/wYNENO3j+INspIdnj3aa0JnubDge6VsGvi+haNTab
   F3sK3fkTtjExNjppElUATgLVQy+yai/dAAKnWf4d3I8h6/QKCLuNW25sq
   urKGSUJEhylUx01EjqxNs8UXn6q3pPI7CuYHgsBY+hCqRWo+kqDgGy0nV
   IVcluHyYiVdBgQ+NrtG749dbmqp54m2KNU0yE3bwgupmtBt93R+oVb46z
   wrFzX8rJ0XLKiHZ15oTIyCxNkpXLtStcX3jB87hdTF1W5hIdECLxlQSpv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="151987874"
X-IronPort-AV: E=Sophos;i="6.07,119,1708354800"; 
   d="scan'208";a="151987874"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 16:09:26 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 500CEDD942
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 84C62D9941
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1DF4F2C666B
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 16:09:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BCF901A006B;
	Wed, 13 Mar 2024 15:09:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 24/36] python3-pygobject: update 3.46.0 -> 3.48.1
Date: Wed, 13 Mar 2024 15:08:22 +0800
Message-Id: <1710313714-12541-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28248.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28248.004
X-TMASE-Result: 10--6.328700-10.000000
X-TMASE-MatchedRID: WyUGENwRfaevbHkumykHIyrLqyE6Ur/jTSz0JdEAJbTWneiERmpDN5tX
	hf4dcLJZz5HYWCESGTB1iSVN1nuFqfgTICFU4qTbGn9d8apLgABZ+CK+BxQ9k58euMsD0OFmIw6
	4a0XgvURmsKHMIn1WbGB1WhaKRr7kkmoOfourmHRFwYcRXRYHEFgy2ozNthE2/gMNehoKqTsH8d
	CsiXu7p+ArY2JkKW9pBdRHP6FCEZVaQiLka9EcSk7nLUqYrlslFIuBIWrdOeP+BlcK7VpWD56ba
	/D5x6cp4vM1YF6AJbZT3DhdVcNYJgtuKBGekqUpI/NGWt0UYPDNbZr9++ZC2OMEcxUJePUCNyig
	WJbr60QBjyTBRbrdB1qwxgxViRpo
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 07:09:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197026

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix installation with pip failing in some environments with
  ModuleNotFoundError in g-ir-scanner :issue:'622' :mr:'302'
* test: fix some tests on macOS :mr:'296'
* docs: some dark mode fixes :mr:'291'
* Drop setuptools in favor of meson-python :mr:'248' :mr:'253' :mr:'254' :mr:'255' :mr:'276'
* Fundamental type support :mr:'250'
* Fundamental type support for GValues :mr:'264'
* pygi-convert.sh: migrate FILE_CHOOSER_CONFIRMATION_* :mr:'266'
* gimodule, cairo: Use multi-phase initialization as per PEP-489 :mr:'271'
* Deprecate classes in gi.option module :mr:'272'
* Deprecate pygtkcompat :mr:'278'
* Add support for (optional) nullable GErrors :mr:'259'
* Fix CssProvider not valid in GTK2 :mr:'284'
* Fix double free if array item cannot be marshalled to Python :mr:'280'
* Raise exception if a callback property is encountered :mr:'269'
* build: Fix pycairo detection "script" for Windows :mr:'267'
* Replace deprecated ''pkgutil.find_loader'' call :mr:'252'
* Avoid segfault on property access for incompletely initialized objects :mr:'260'
* pygenum: When getting a member instance, use correct key for the lookup :mr:'262'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pygobject_3.46.0.bb => python3-pygobject_3.48.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.46.0.bb => python3-pygobject_3.48.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.48.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.46.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.48.1.bb
index 73a393051a..4754e41c04 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.46.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.48.1.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 SRCNAME="pygobject"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "426008b2dad548c9af1c7b03b59df0440fde5c33f38fb5406b103a43d653cafc"
+SRC_URI[sha256sum] = "3a0a2c0c0f25931b5840649c54834b9e58a63148d37fa9f6308887b7027e15c2"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.34.1


