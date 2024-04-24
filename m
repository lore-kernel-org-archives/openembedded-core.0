Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE8BFC25B5E
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:43:14 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.11727.1713948189749062313
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cRXJo34q;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713948190; x=1745484190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=p6oG0Pa3GeL/y17uRu6CTC2VtK0tNkPLG4M17YU5yyM=;
  b=cRXJo34qAv6/vop+GgBNPlgDdTsVwVqUEPD5Cwun1IDnTKOmIGPOhwOa
   +v9fdsrxooRkKfZV6rcWbJEaa4+6Yny2kWICp/NgcwFIMKpbgAo2lBOdA
   fGwhfjmh66ZMfq+fcyh6pZcWgm3Ras/uNaB4w55n3HnPbEW2QsLkNXX7q
   hyVIHGVSWCQp1OUZRhs4PRQSPkE3luNVMgfSwiGmvYSrsUFx12sGGfC5z
   JgF/mFZQGgOTHsTsOYpqVOu2z5Yz2aRgD9YxVKAN41Wsx/QGNgkKSj2TC
   ZdN8ozZeiB06CUQJNDPbWcEUjMnQAJyB2BiDxXlEgLeQxH9N5crVckoWd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11053"; a="156834843"
X-IronPort-AV: E=Sophos;i="6.07,225,1708354800"; 
   d="scan'208";a="156834843"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2024 17:43:08 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CDE0BD9DBC
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:06 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0E778DB9FC
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9ED39202CE12E
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 17:43:05 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4A1941A000A;
	Wed, 24 Apr 2024 16:43:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 29/38] python3-pygobject: upgrade 3.48.1 -> 3.48.2
Date: Wed, 24 Apr 2024 16:42:23 +0800
Message-Id: <1713948152-13501-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
References: <1713948152-13501-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28340.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28340.006
X-TMASE-Result: 10-1.026700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN71Wx2uUbPLdV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantoSrw3Nb6NkAtuKBGekqUpnH7sbImOEBSW5pBjeGZWEdt//nVYFYCIuiPAxQokGLSvVT
	rFaQi3Nb5CjJecsAK9Hd3IEvEoa5ea1G4pkR+nH0OOQYYMthFTY4kN1+Qbf8nsfZ9V6Q6rCZgvU
	oiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198672

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix support for fundamental (primitive) types, such as Gst.Bitmask

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pygobject_3.48.1.bb => python3-pygobject_3.48.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.48.1.bb => python3-pygobject_3.48.2.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.48.1.bb b/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.48.1.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.48.2.bb
index 4754e41c04..3d83a8a1c2 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.48.1.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 SRCNAME="pygobject"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "3a0a2c0c0f25931b5840649c54834b9e58a63148d37fa9f6308887b7027e15c2"
+SRC_URI[sha256sum] = "0794aeb4a9be31a092ac20621b5f54ec280f9185943d328b105cdae6298ad1a7"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.34.1


