Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A850BCD4F52
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:54 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.9255.1727246985761968810
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HmjDlWsz;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246990; x=1758782990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Gm8z/PcJ8cFiY5zz2ItTh3ZmWU0scei+JODciq7Bkes=;
  b=HmjDlWszpIn2/LvwJDrWjwHhRjPgp1HeRm6FCL7p95rvW9qdrrjU1tYB
   BFqxNruVYN/P6sjpwGc286jAL0eFuytmn7/ffvTPY40gpykFsJMA9xFOx
   E3eWQXETpyhahMPFjAqvHlJMvJ+J/53ELW6t4ItSdQfAq3aieN+1T7CHr
   +0ZnM8+znYbktxXjWtpQxwsn7iHVwpIZRYlMEU8aLMBTIKWS9QP6UV6X2
   hybKMIgo8IauGvGGyY2PpLPoDJcKpsPvTBlv141+/e2ViHzul75Q1fv27
   I7FR90wFCTbf7OPh/Lhz1/mNLJNHYejg85knPZFqZF/zs+fjFcob15wxo
   A==;
X-CSE-ConnectionGUID: Ty/kiLpKQF2/6zRhkn+tVA==
X-CSE-MsgGUID: z/WqKeqrTPqMWL4mBtBzng==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="174697192"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="174697192"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:48 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DF1DD9233
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A42C5D73A8
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B2FB20086326
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:45 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DFEC71A000A;
	Wed, 25 Sep 2024 14:49:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 32/47] python3-pygobject: upgrade 3.48.2 -> 3.50.0
Date: Wed, 25 Sep 2024 14:49:05 +0800
Message-Id: <1727246960-20665-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--3.269300-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvNs1Ir4NZzFmgYz
	GYtVtarB4PKuGN+8yk2o/56eWHaCU2jez20/QikWlXePXNM4FjMXivwflisSrBhSCKZBIQo87/J
	GRZ8PgCf0YXQzpNvE/HN9cDfPWe4GlGl6D3cRgDED2WXLXdz+ATeXamXCCu1YIPUd1fKoOcS/BR
	68O365bq8FBzdsKASwfjWeJX0rKbMfE8yM4pjsDxZ4ylU2GwzAxEHRux+uk8hxKpvEGAbTDqOtH
	vx+b5JGdVHAfxmXNJQVahd1YsV6UXYptGLDTM8mxZUnsNJsOLcc0ZoAIlXvZP87CVxnarjcIX+a
	uFuO98QgdXWP7te8BoK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204918

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* tests: Fix event test errors when GTK is not installed :mr:'347'
* Rename master branch to main
* Drop support for Python 3.8 :mr:'300'
* Add Override for Gio.DataInputStream :mr:'293'
* Treat GParamSpec as any other fundamental type :mr:'268'
* override connection.register_object to prevent an invocation object from
  leaking :mr:'219'
* Various PyPy related fixes :mr:'299'
* bind_property: Accept keyword arguments :mr:'309'
* Various documentation improvements :mr:'342' :mr:'343' :mr:'338'
  :mr:'336' :mr:'335' :mr:'328' :mr:'329' :mr:'330' :mr:'325' :mr:'322' :mr:'312'
* Python2 / GTK2 cleanups :mr:'338' :mr:'331'
* asyncio integration with support to await Gio async functions :mr:'189'
* meson: move from .egg-info to .dist-info/METADATA :mr:'306'
* build: fixes for building with gobject-introspection 1.81 :mr:'344'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pygobject_3.48.2.bb => python3-pygobject_3.50.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.48.2.bb => python3-pygobject_3.50.0.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb b/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.48.2.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.50.0.bb
index 3d83a8a1c2..ab3d737866 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.48.2.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.50.0.bb
@@ -19,7 +19,7 @@ DEPENDS += "python3 glib-2.0"
 SRCNAME="pygobject"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "0794aeb4a9be31a092ac20621b5f54ec280f9185943d328b105cdae6298ad1a7"
+SRC_URI[sha256sum] = "8d836e75b5a881d457ee1622cae4a32bcdba28a0ba562193adb3bbb472472212"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.34.1


