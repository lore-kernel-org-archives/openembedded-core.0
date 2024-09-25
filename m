Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32AA7C369A7
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.9315.1727246984271008845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=N8lwKJGQ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246986; x=1758782986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qh0DnTeChyB58sQQZccnsXx1dfE45E2y/tA3WTPma1g=;
  b=N8lwKJGQc3wntEKsuB9ANz9nShDSMRDDSP/dNfb+uvH0X1GWLc0aHpHn
   tp8GMXxnMBIbggDZuBXAtZQmnX+VeYRXOafa7jISUiZyhrSslFKxuwg4f
   BGWOjHC/ON5DSDQiY76fd/QF5Gn0Zg+qwLjyiB2jUphsvuRzrkAqbPX5z
   +m8MYbPfd98U3TMx2WldGrR4gmyMvWiajQQQ3kTNJ3gNAOkfFBSRpg3iT
   ysRR2GDAvRqhY3KKnN+wJFNXmpVl7JggvGICR9Fkpvgz8jC9ooArUkiBv
   vJ3EV6hU+6kkB9VJu+L5OYD2J8hcBRL+akDQIm2dz2aEhMeLAoYpnRBde
   g==;
X-CSE-ConnectionGUID: bxUL+yz0RoSsIvspbzlYEw==
X-CSE-MsgGUID: gtFwA+QmQNmtXHmc+cgNaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="173949707"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="173949707"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:43 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C470BDB3C3
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:40 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F3D2FD5BB0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8E6A6E2B1B
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3D09C1A000A;
	Wed, 25 Sep 2024 14:49:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 17/47] libpng: upgrade 1.6.43 -> 1.6.44
Date: Wed, 25 Sep 2024 14:48:50 +0800
Message-Id: <1727246960-20665-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--2.134100-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrRpgtqnD1BD4kb1m5a32K+Hld
	s8wQQLl3O7qZrIf3RB9hWgNOVfhPTBeuWYdUPo65mVBuNYtCo5tZ+CK+BxQ9k3hh5KUdlgWiia4
	F3RR5Tbwe0ktHw4wB2icsEZRS0MacJnRO1kR8OZ4D2WXLXdz+AdXLiEcLf+DIsrDwfHQQaK1yp+
	gwY/4LBCL637QCIVpicJOae6OvbZ37L2q5dH9XYJ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyKsQd
	9qPXhnJgSxTfFx0SzTlo/S1HEQuOFHSkL7jNnicA6e8sW/hMcxfTVBFuAhT2epQxoW1t0QjAakZ
	4eL4WI2WwQVJTBNqQYHU5Z+KNdYNYcjxujSa4vLyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204908

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Hardened calculations in chroma handling to prevent overflows, and
  relaxed a constraint in cHRM validation to accomodate the standard
  ACES AP1 set of color primaries.
- Removed the ASM implementation of ARM Neon optimizations and updated
  the build accordingly. Only the remaining C implementation shall be
  used from now on, thus ensuring the support of the PAC/BTI security
  features on ARM64.
- Fixed the pickup of the PNG_HARDWARE_OPTIMIZATIONS option in the
  CMake build on FreeBSD/amd64. This is an important performance fix
  on this platform.
- Applied various fixes and improvements to the CMake build.
- Added fuzzing targets for the simplified read API.
- Fixed a build error involving pngtest.c under a custom config.
- Fixed and improved the config files for AppVeyor CI and Travis CI.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libpng/{libpng_1.6.43.bb => libpng_1.6.44.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.43.bb => libpng_1.6.44.bb} (92%)

diff --git a/meta/recipes-multimedia/libpng/libpng_1.6.43.bb b/meta/recipes-multimedia/libpng/libpng_1.6.44.bb
similarity index 92%
rename from meta/recipes-multimedia/libpng/libpng_1.6.43.bb
rename to meta/recipes-multimedia/libpng/libpng_1.6.44.bb
index f1febd0a02..dce4fadc47 100644
--- a/meta/recipes-multimedia/libpng/libpng_1.6.43.bb
+++ b/meta/recipes-multimedia/libpng/libpng_1.6.44.bb
@@ -11,7 +11,7 @@ DEPENDS = "zlib"
 LIBV = "16"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BPN}${LIBV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "6a5ca0652392a2d7c9db2ae5b40210843c0bbc081cbd410825ab00cc59f14a6c"
+SRC_URI[sha256sum] = "60c4da1d5b7f0aa8d158da48e8f8afa9773c1c8baa5d21974df61f1886b8ce8e"
 
 MIRRORS += "${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/ ${SOURCEFORGE_MIRROR}/project/${BPN}/${BPN}${LIBV}/older-releases/"
 
-- 
2.34.1


