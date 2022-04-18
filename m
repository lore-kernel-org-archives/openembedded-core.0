Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB499C64EC0
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:26:01 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web09.38363.1650284380282878144
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 05:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gPIXoYKe;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1650284378; i=@fujitsu.com;
	bh=+4BpCViGn6aHhBMKeTCIcIlamXGJFGMrS/yAcJc0upQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=gPIXoYKewQtFjXkBX67X+YlUFs9njdfLiDKb5TXHZfJzhJ9D48lYwORnYMuBOaLO5
	 KTh9hua80XoxCdJ5AWk7c0sYvxbU2kY+TGX/bSBlBnhDWMTDVYDv3BgOW1tcRMF/eE
	 lYTSW6TCh2DZiQpUuOxLmBqaHSGHqbfyKB9JFyV6l9o2g7ceXx6L9KPTdHDu1ALjZl
	 ubbDxs6zPhV4opEIpiW0QoN6yo+VbyLxkuMtYZNEVE01nmvXwnqsQrl0AOeqeGZtJz
	 lFQgqaEw3OnpHkoh7vaUy4PhvXKuw6+JGHa8c96fjBIgmHAfPaeW03XR3H0r45FaEe
	 SgVV+xDRbsBYw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxSTcyPDb
  J4NUZG4s7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPT8odsBe84Kn6cf8fewNjG0cXIxSEk8JhR
  Yu/he6wQznkmieZP05ggnD2MEtcW9LJ0MXJysAmoSUy/dQOoioNDREBP4uo/UZAws4CKxIvfP
  ewgtrCAucSi+f8YQWwWAVWJ9htHwGxeASeJnndrwGokBBQkpjx8zwwRF5Q4OfMJC8QcCYmDL1
  4wQ9QoSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQIj/ywk7bOQtC9gZFrFaJ1UlJmeUZKbmJmja2h
  goGtoaKprbKRraGGpl1ilm6iXWqpbnlpcomukl1herJdaXKxXXJmbnJOil5dasokRGJYpxQp7
  dzBeXvlT7xCjJAeTkijvf9/YJCG+pPyUyozE4oz4otKc1OJDjDIcHEoSvLNCgHKCRanpqRVpm
  TnAGIFJS3DwKInw9oOkeYsLEnOLM9MhUqcYdTkOT7i0l1mIJS8/L1VKnLc6DKhIAKQoozQPbg
  QsXi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEub9GQo0hSczrwRu0yugI5iAjtg+PxLkiJJ
  EhJRUAxPH+v5VCYLPTZv1VxvHHj968edDq9KdKUa9ikcqI2aru+ox1IcqCnVtSZiesnSxrfOy
  stkJWrkrP/18t+ZFt+LpJdsYr+i+nV396e7hauGiTzVT/K2chVP5YlQ3Hs68VbQnvFdLZc/Dk
  D2rF63zlH43Pev7jKTST+ERwVevfJH5MK98V/I307Nn5kSlW/DsiJ4d9XtW6Yq6V4a7dmUJ8v
  3SfrcwfPri6pMvo2dVuhgWdEvl5RWwtRne3s95rFz6h2F7wHeFjG/XQ0wvqzNPaZwTKszHNvG
  +cOfUM88bF69L3Rz19fL6MO9f3GuCd5sF64ld3d22w+xIp4rt/+6HYtslGKa1lrveiZrV9G4n
  g6YSS3FGoqEWc1FxIgDrTFaGUgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1650284377!201821!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29748 invoked from network); 18 Apr 2022 12:19:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 18 Apr 2022 12:19:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 9FBDC10046C
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:19:37 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 938F610044A
	for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Apr 2022 13:19:37 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 18 Apr 2022 13:19:28 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libcap: upgrade 2.63 -> 2.64
Date: Mon, 18 Apr 2022 20:19:20 +0800
Message-ID: <1650284363-16570-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:26:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164594

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta/recipes-support/libcap/{libcap_2.63.bb => libcap_2.64.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libcap/{libcap_2.63.bb => libcap_2.64.bb} (96%)

diff --git a/meta/recipes-support/libcap/libcap_2.63.bb b/meta/recipes-support/libcap/libcap_2.64.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.63.bb
rename to meta/recipes-support/libcap/libcap_2.64.bb
index 9e341c4bd0..7690d3e9a5 100644
--- a/meta/recipes-support/libcap/libcap_2.63.bb
+++ b/meta/recipes-support/libcap/libcap_2.64.bb
@@ -20,7 +20,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "0c637b8f44fc7d8627787e9cf57f15ac06c1ddccb53e41feec5496be3466f77f"
+SRC_URI[sha256sum] = "c8465e1f0b068d5fc06199231135ccac7adb56d662b1de93589252e8cd071e13"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.25.1


