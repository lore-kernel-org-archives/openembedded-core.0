Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB938E7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:29:39 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.58973.1735543774385213258
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:29:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UVAmHQOg;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543774; x=1767079774;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iM4wGFc+g4nrAfBG3zkM3h0PYHeK2zLTT8TJEGhE5ws=;
  b=UVAmHQOgSjTkx6TcjO2fonZJTkQqa4myrxK9OyWl/HKdzd7174P5vAN2
   morDRQ1hQjRu4KLIexrbRCnwFlJaVF0UhCAAQZ7fkg9Q67zh44tFzNlao
   juNceyTVSPhIbK5SFsMR709cle0BbTQks/3wzs6C6U8y58wtwKWMr3H8b
   T2XgRMR9inceUSRXJoLJNZcS6z3m6AyhNguIlUNmmTm1LNyAvMi6q4R5S
   f59erLZUatQpEqf+FlR5wswPeezpoldrbXgY/2GnwKlKbiXIIgtZK2Upq
   pt1of7FZ/F36KTP09HdwhXE0alYjYNK1cRrsBj9nx91thcPHdRUWNe2Jo
   g==;
X-CSE-ConnectionGUID: ugD+b4JNTBO2LJxaVRo8Cw==
X-CSE-MsgGUID: HHomb+1ZTL+gDIFwWGkkTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="187727946"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="187727946"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:29:32 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 74633D6EA1
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:29 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F32ECFAB2
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:29 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id C89B170BE2
	for <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 16:29:28 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 73F171A0003;
	Mon, 30 Dec 2024 15:29:28 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 4/6] libical: upgrade 3.0.18 -> 3.0.19
Date: Mon, 30 Dec 2024 15:29:18 +0800
Message-Id: <1735543760-2456-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543760-2456-1-git-send-email-wangmy@fujitsu.com>
References: <1735543760-2456-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10--4.328600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX+DLvvVL3eB4A34KY0g5BTfp5F0BEaAln1cZNuxCoduSnxf
	dbXcgkQSsUlZjdfgGvIAy6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSzvGV4CStoiETWsw
	aEFXfV8tEKzUsyfTPl60zrD3R94pNUOO+44gDxNfnKYd9HMUFYFySTrBfn8VT5KUBPVeliEWCMI
	IhSGiKLiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 07:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209144

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libical/{libical_3.0.18.bb => libical_3.0.19.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.18.bb => libical_3.0.19.bb} (96%)

diff --git a/meta/recipes-support/libical/libical_3.0.18.bb b/meta/recipes-support/libical/libical_3.0.19.bb
similarity index 96%
rename from meta/recipes-support/libical/libical_3.0.18.bb
rename to meta/recipes-support/libical/libical_3.0.19.bb
index 052ca57cfb..1ee39aa94f 100644
--- a/meta/recipes-support/libical/libical_3.0.18.bb
+++ b/meta/recipes-support/libical/libical_3.0.19.bb
@@ -15,7 +15,7 @@ SECTION = "libs"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz \
            file://0001-cmake-Do-not-export-CC-into-gir-compiler.patch \
           "
-SRC_URI[sha256sum] = "72b7dc1a5937533aee5a2baefc990983b66b141dd80d43b51f80aced4aae219c"
+SRC_URI[sha256sum] = "6a1e7f0f50a399cbad826bcc286ce10d7151f3df7cc103f641de15160523c73f"
 
 inherit cmake pkgconfig gobject-introspection vala github-releases
 
-- 
2.43.0


