Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11813FEA806
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 03:55:20 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15202.1774410916177189787
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Mar 2026 20:55:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ox0Vr4hR;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774410916; x=1805946916;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=lOzLOy+qW+ly2UpDH3LZ7aX3/mHRHp24kK9UG6/k2tw=;
  b=ox0Vr4hRYyKoovuBaRN88jm+lSTA23cIXVurmbQjLzX0fc3lkdd/NZ7n
   /955o8bFbvYlGAuII88EIQLq2yCKsCDi7LmvtZvn47QGkMMrSUYvrvJuY
   zbN6RCuKjpm2Ghw6LvimVu3qG+jwOsAvkr9aNn+sjdhd1PPUKpdqbGWZN
   zIN3dzf8OY9YaxraDscNca0VwAAlPiUnbnlIZMk576bsRV5LcZxbDm/pp
   kPACjIT6oIjHaomD9U9GI0kDsd0omPNR6I0v+i2FsEmcoilRjGTnCB6ox
   N49acbD0sLWdr5khbBgCRdWfKccaT+xF4nFr6sh1ReA9xKbY+JDSM5H31
   g==;
X-CSE-ConnectionGUID: IHDVfb+DRpiXxqgwQU+Gaw==
X-CSE-MsgGUID: RimE86xnQKO1Ffp1Mohqqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="213511006"
X-IronPort-AV: E=Sophos;i="6.23,139,1770562800"; 
   d="scan'208";a="213511006"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 12:55:14 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7DB8642A33A
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 03:55:14 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 240541C172B6
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 03:55:14 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.24])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 01A8C101E529
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 03:55:11 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] tzdata,tzcode-native: upgrade 2025c -> 2026a
Date: Wed, 25 Mar 2026 11:55:07 +0800
Message-ID: <20260325035507.3648-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 03:55:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233855

Full release notes:
https://lists.iana.org/hyperkitty/list/tz-announce@iana.org/thread/ASPLBE3A4BAEXIOQ3KZ6EJSJWBU6L53G/

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index b9323432b8..00bb704e36 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2025c"
+PV = "2026a"
 
 SRC_URI = "http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode;subdir=tz \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata;subdir=tz \
@@ -16,5 +16,5 @@ S = "${UNPACKDIR}/tz"
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "697ebe6625444aef5080f58e49d03424bbb52e08bf483d3ddb5acf10cbd15740"
-SRC_URI[tzdata.sha256sum] = "4aa79e4effee53fc4029ffe5f6ebe97937282ebcdf386d5d2da91ce84142f957"
+SRC_URI[tzcode.sha256sum] = "f80a17a2eddd2b54041f9c98d75b0aa8038b016d7c5de72892a146d9938740e1"
+SRC_URI[tzdata.sha256sum] = "77b541725937bb53bd92bd484c0b43bec8545e2d3431ee01f04ef8f2203ba2b7"
-- 
2.43.0


