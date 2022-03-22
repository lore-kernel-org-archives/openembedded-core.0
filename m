Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63353C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 10:40:09 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web08.8294.1647945607629294112
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 03:40:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=QZHL8t6Z;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647945606; i=@fujitsu.com;
	bh=hYlw9nQIDPtC/NfcCGKGI4eU+JGs4VzCVeK1uoMiH5c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=QZHL8t6ZoyMj5q0aaHMrPtdq1/9F+1kn4Y8JA+XwjMveQK/ZsI4hRXLLeLFlWQsXv
	 SvLdCYn1oavSw80pN12unlNWBn4hEiw59B1E+rOPyJTgVGV7gSSvfrTYJyHKJHysHn
	 ql6ao1Q70y05VQLDrXpVh6TeThpaxKKFEa8ID1kR7hG0/qPdDxVMaivQiVH4jcATPu
	 KReYBar19gADrc7lQWewYg0gTISmbqKy1trTwDOeTjCDvUcqH20nNgRSwlVg89lvEd
	 2osFGmV4aSKqgIQnLYJn0XLCGFUdhq2JgWv0N5Hy3oJPflVA68jsnZm52uJmttw8gx
	 h0NIkPRKyPN0w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrMIsWRWlGSWpSXmKPExsViZ8MxSbd1uWW
  SQccpdYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPhqS/MBUs4K/ZNO83YwDifo4uRi0NI4DGj
  xIyHF1ghnPNMEh07lkA5exglNn6fztTFyMnBJqAmMf3WDaAEB4eIgJ7E1X+iIGFmARWJF7972
  EFsYQFricVTt7CB2CwCqhKt1z6BxXkFHCWmPu1kBbElBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  4wQ9QoSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJ1UlJmeUZKbmJmja2h
  goGtoaKprbKRraGSml1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokRGJYpxQp1
  Oxivrfypd4hRkoNJSZRXHBiwQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4jy4GygkWpaanVqRl5
  gBjBCYtwcGjJMKb0Q2U5i0uSMwtzkyHSJ1iVJQS5/27DCghAJLIKM2Da4PF5SVGWSlhXkYGBg
  YhnoLUotzMElT5V4ziHIxKwrwBIFN4MvNK4Ka/AlrMBLRYn9UMZHFJIkJKqoFpslNNb1uX4vH
  nZ3u8X5tvvNbJv3nnjuDpAQe1JhXvEtSVmnjO9uOikNq3EwO2Pyz7unj3tbRHigpyMzK+Tvx4
  8cOTr/959v78c0koUuIhW2rQ5JffMpkVPljFvp3lp68jyf7ymNjy5dMklO9sPna/sC+yMHhC4
  9I3Kc/yv3F9YNRqvqzy7gPXwwuRVyY+Vjr4xmT2ydh3G6oEHn1d9Xsqx4oa16B/DBV3VxYemM
  VSom4gdqy32my9YP1dz9r+n9W63NcW8XLuD9rTL/26z/vXrP8hP3LW1Ihx2V2YMIHzJ0es4+m
  GX8v26O3I9GDL+vpb75lPtWWFnXqHq13fqk0LG9o+PjCZufnZgqcrJS0P/VRiKc5INNRiLipO
  BAAnrAIZRgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-12.tower-571.messagelabs.com!1647945605!80563!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29407 invoked from network); 22 Mar 2022 10:40:05 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Mar 2022 10:40:05 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 3CE8310044F
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:40:05 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 2D12910044D
	for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 10:40:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 22 Mar 2022 10:39:56 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] man-db: upgrade 2.10.1 -> 2.10.2
Date: Tue, 22 Mar 2022 18:39:45 +0800
Message-ID: <1647945587-5282-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 10:40:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163542

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../man-db/{man-db_2.10.1.bb => man-db_2.10.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/man-db/{man-db_2.10.1.bb => man-db_2.10.2.bb} (96%)

diff --git a/meta/recipes-extended/man-db/man-db_2.10.1.bb b/meta/recipes-extended/man-db/man-db_2.10.2.bb
similarity index 96%
rename from meta/recipes-extended/man-db/man-db_2.10.1.bb
rename to meta/recipes-extended/man-db/man-db_2.10.2.bb
index e8fd47a8f7..a41e2dd4d8 100644
--- a/meta/recipes-extended/man-db/man-db_2.10.1.bb
+++ b/meta/recipes-extended/man-db/man-db_2.10.2.bb
@@ -9,7 +9,7 @@ SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
            file://99_mandb \
            file://0001-man-Move-local-variable-declaration-to-function-scop.patch \
            file://man_db.conf-avoid-multilib-install-file-conflict.patch"
-SRC_URI[sha256sum] = "2ffd8f2e80122fe72e60c740c851e6a3e15c9a7921185eb4752c1c672824bed6"
+SRC_URI[sha256sum] = "ee97954d492a13731903c9d0727b9b01e5089edbd695f0cdb58d405a5af5514d"
 
 DEPENDS = "libpipeline gdbm groff-native base-passwd"
 RDEPENDS:${PN} += "base-passwd"
-- 
2.25.1


