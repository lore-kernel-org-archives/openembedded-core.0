Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 007ADCF58E8
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 06:49:55 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.9253.1727246984555558906
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 23:49:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=e1WMwnpa;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727246984; x=1758782984;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=iLwOGJYhW0IKAlafe9gQ33feBqylj8h5IDKxCX/1mVA=;
  b=e1WMwnpaST5kQG5BGzjRTM+X+UPPH88xVK/amAfNqziwkEy9at2IS8ab
   hqdRSvu4l84Bk1/7H7xW93hA60r7EjQWs1ZM9/mc18SJiM5yBnUYRZ0Rn
   F2GUCNeBxiD4w8pVbCIN2f2J7y+R/cUWFDk4tVjpeB9hQ5PgRZMT36dV1
   pSWmQ3N6gQ1VsyuaybccVCcrvJ5n4Nri3cTVAdMY7ht9WMQKiVIwtQlwD
   yIyUpyo3+wRbPdnv5wkQ/gfFjElQs/DBckXgu0EIF0FJX79BkCHO7bnVk
   /LH7RnFG8uSVIYrLD0/nnkEkppjz1KWZlUmHlfgESf1CLISLq9sAbVk5n
   A==;
X-CSE-ConnectionGUID: MuRVBed/SDONOIm9CERz8w==
X-CSE-MsgGUID: ywrUyzrpSjqNfdB+kDnHaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="163052381"
X-IronPort-AV: E=Sophos;i="6.10,256,1719846000"; 
   d="scan'208";a="163052381"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 15:49:43 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 48406D8008
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:41 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BB41BF3D6
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 158AE401E0
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 15:49:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B55421A000A;
	Wed, 25 Sep 2024 14:49:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 18/47] liburi-perl: upgrade 5.28 -> 5.29
Date: Wed, 25 Sep 2024 14:48:51 +0800
Message-Id: <1727246960-20665-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
References: <1727246960-20665-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28686.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28686.005
X-TMASE-Result: 10--1.954700-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNK1L6TVkdgztr2qJoNIuCjfGmNQuSBG+Fo8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXLnixKQd7ZK0rcSsq5mtl7PlAw5rHtlSvxR0w
	wVzKmCu86UQXL3nSOoAWAsc7W8WkzvCkcOnzp9m/6vQMUHkgeWrDcMd11oiGr+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Sep 2024 06:49:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204906

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 - Add otpauth URI

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{liburi-perl_5.28.bb => liburi-perl_5.29.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{liburi-perl_5.28.bb => liburi-perl_5.29.bb} (94%)

diff --git a/meta/recipes-devtools/perl/liburi-perl_5.28.bb b/meta/recipes-devtools/perl/liburi-perl_5.29.bb
similarity index 94%
rename from meta/recipes-devtools/perl/liburi-perl_5.28.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.29.bb
index 1fc0efd3e5..4eb769f102 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.28.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.29.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "e7985da359b15efd00917fa720292b711c396f2f9f9a7349e4e7dec74aa79765"
+SRC_URI[sha256sum] = "a34b9f626c3ff1e20c0d4a23ec5c8b7ae1de1fb674ecefed7e46791388137372"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.34.1


