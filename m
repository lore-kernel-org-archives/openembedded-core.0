Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2BFFC25B7A
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 09:16:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.5638.1716369328359877289
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 02:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bz10Azaw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716369328; x=1747905328;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EcM8JmjPIm80W8jZ8fYwFf4K6za9H6/MNv6/JpUfE+Q=;
  b=bz10AzawR/JGaPR9cOgaBTscA3DAaV1jhN49oZfQUhVBrfh7Co6diaZY
   d4m4rqlOdzi+R4LIujtqgnqbRg+0WagqwFHQhUnkSoyjPgqeAkJ/cadZD
   4DBVh9Z17Ge5y1aRFyEoCPMRysp9NadWhrHbVznOJ8mbdNzcxJP3ajuXB
   1er2kL/kFHPARL6p+1/o2eANR8sQI2s3zWaMJTOgoJKqQUnOdjWzlOANr
   qdOFRsgu9ATCgz1xTrNGmt2KaYgviaDvAP4XfPdr6b37H4NzC+vWrw8CU
   VlmpSXjx3+qTeqGT62kiveSdii/HOwZ53A0vrJ1yHa/7zPy7U66oul0l+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11079"; a="147064670"
X-IronPort-AV: E=Sophos;i="6.08,179,1712588400"; 
   d="scan'208";a="147064670"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2024 18:15:25 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0770BD800D
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 46EB431B07
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D2BB821D01D
	for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 18:15:22 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7ED391A000B;
	Wed, 22 May 2024 17:15:22 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 13/42] gdk-pixbuf: upgrade 2.42.11 -> 2.42.12
Date: Wed, 22 May 2024 17:14:20 +0800
Message-Id: <1716369289-22526-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28402.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28402.006
X-TMASE-Result: 10--0.947100-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvFkDE9j8FwIMHL
	+hdk2mEdN4nbTwZZBF4yNJAGB7SC9ADNPxu11HXjP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW7cyx5vpK6SikF/mFuzVzil+YQ9ocFzl0sJN6i943RQTdUEOicf335WgCOzL6v7C+etsv
	rA+MaKLbF9uGobEuT7gDLqnrRlXrbIDt27MLDp0t0H8LFZNFG76sBnwpOylLN2zg8mS5wE2tmN+
	Or22AQ0116sVyDZbhdrBcgl77+yqSgkb7BSs9aRJqN2JS+MnUUV3LECgMZn/6UiEfE2wF0afHu5
	yF6DhzeIHqaUMp7VXtL/LK0d4I30Ze/gJB41STsbqpM7Cr+fvX7cGd19dSFd
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 09:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199708

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix a build failure
- Fix occasional build failures
- ani: Reject files with multiple INA or IART chunks
- ani: Reject files with multiple anih chunks
- ani: validate chunk size
- Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../gdk-pixbuf/{gdk-pixbuf_2.42.11.bb => gdk-pixbuf_2.42.12.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.42.11.bb => gdk-pixbuf_2.42.12.bb} (98%)

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
similarity index 98%
rename from meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
rename to meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
index ef0f23f8f7..9f825a68ef 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.11.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb
@@ -22,7 +22,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-meson.build-allow-a-subset-of-tests-in-cross-compile.patch \
            "
 
-SRC_URI[sha256sum] = "49dcb402388708647e8c321d56b6fb30f21e51e515d0c5a942268d23052a2f00"
+SRC_URI[sha256sum] = "b9505b3445b9a7e48ced34760c3bcb73e966df3ac94c95a148cb669ab748e3c7"
 
 inherit meson pkgconfig gettext pixbufcache ptest-gnome upstream-version-is-even gobject-introspection gi-docgen lib_package
 
-- 
2.34.1


