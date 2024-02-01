Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837B9C47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 05:26:09 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.9108.1706765163206369253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 21:26:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sbJ9n9xE;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1706765163; x=1738301163;
  h=from:to:cc:subject:date:message-id;
  bh=TGvq2IHqVlOVJ9+ddaVmRBkOoEeaTOJahF4a9JlWy4Q=;
  b=sbJ9n9xEMKYRYrVcEV9hHAToIY2uOaxdgmcsGHSzYFHuybBZra0rjeEW
   iy/MOsemY5cWfFEbju1MmEJ3sufzmZdW2vG+/ogTeyfbEh74KVgrebqAI
   n5sz/4TTJ8p/0xZ4OJ08wNhAxcIRRXw0+eo1PFeS5AijjX7oPgSkN2hTl
   iun/ghLNUYk8Z5mODaFrGtO+bzTpeP7er5DXjh8gZTaWulACYLe6RfdtL
   1uwBH3spsNed2SARZrNN/+VaMgWcXNx/X37z0o+PlaRO35TPUm//nco7D
   Oi7E20rX9pXB9Iuh3D1HfK2Y8MpNTJ7Qt8gdrmiuTefCYJIVfRK5j5j3P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="147478584"
X-IronPort-AV: E=Sophos;i="6.05,234,1701097200"; 
   d="scan'208";a="147478584"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2024 14:26:00 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6D7F3D4804
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:25:58 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9CC1DBF4D1
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:25:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 307BC6B823
	for <openembedded-core@lists.openembedded.org>; Thu,  1 Feb 2024 14:25:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BB1491A006A;
	Thu,  1 Feb 2024 13:25:56 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] liburi-perl: upgrade 5.21 -> 5.25
Date: Thu,  1 Feb 2024 13:23:49 +0800
Message-Id: <1706765029-12692-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28156.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28156.000
X-TMASE-Result: 10-1.958200-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrWDH2sIy8+j9RiRl337i3b8Ir
	JyGzvIdDeW+qf585DXkNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl66S7pSnTU82me8
	7f6EgxaPV5UwNdtR5dQGN2ThlUwL/5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0JC+
	VZi2gQEdPbjCxYBNz57ByyZdA/XvheXRFaHsUCkbxx7hGPRnNGgt8PMDO0ZO/Pp/AkzpOCy0UMG
	L+RyZA5yi0Pr9NzOMWFpxyjX1ib3vIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 05:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194569

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- cache scheme so it never attempt to load it again
- Really revert "use Scalar::Util::reftype instead of ref to check for
  ARRAY"
- Revert the reftype change introduced in 5.22 as it causes warnings.
- Use Scalar::Util::reftype instead of ref to check for ARRAY

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../perl/{liburi-perl_5.21.bb => liburi-perl_5.25.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/perl/{liburi-perl_5.21.bb => liburi-perl_5.25.bb} (94%)

diff --git a/meta/recipes-devtools/perl/liburi-perl_5.21.bb b/meta/recipes-devtools/perl/liburi-perl_5.25.bb
similarity index 94%
rename from meta/recipes-devtools/perl/liburi-perl_5.21.bb
rename to meta/recipes-devtools/perl/liburi-perl_5.25.bb
index 0356469d98..0305955524 100644
--- a/meta/recipes-devtools/perl/liburi-perl_5.21.bb
+++ b/meta/recipes-devtools/perl/liburi-perl_5.25.bb
@@ -12,7 +12,7 @@ SRC_URI = "${CPAN_MIRROR}/authors/id/O/OA/OALDERS/URI-${PV}.tar.gz \
            file://0001-Skip-TODO-test-cases-that-fail.patch \
            "
 
-SRC_URI[sha256sum] = "96265860cd61bde16e8415dcfbf108056de162caa0ac37f81eb695c9d2e0ab77"
+SRC_URI[sha256sum] = "ef61941da09fff2503cea3692c4f2fc48c0e4442486e2a28345cb32d44d0d271"
 
 S = "${WORKDIR}/URI-${PV}"
 
-- 
2.34.1


