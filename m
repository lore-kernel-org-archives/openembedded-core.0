Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C4FEC433F5
	for <webhook@archiver.kernel.org>; Mon, 15 Nov 2021 15:03:14 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.23672.1636988593329239418
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 07:03:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=aWXAtFDd;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1636988585; i=@fujitsu.com;
	bh=hqJXnFSSyGntpXekP3BJwAYQlg3hXNbGLk+SgSLcJ40=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=aWXAtFDdKfJIRuMW/sB9ZePlnLP6szCOVPpAL6KH209O0LapqUWfbwU2BPlRs0poK
	 bRXp7TXbqTqYi6TjYWPhbWFpC7LPJCbNez60ofDzPOLBMCGcngS/bgDlJCTmSXfw41
	 hBJ/HDc87W2um8vRge1DYfjjT8nLmJcJiews3yFf1zRSmdtfLYrFD+VIjLQKtbIdqY
	 RUm/p6VUXH0PdKhUKGTB03AMbgWvF+9UegqeHjnG4dVdPwSF2so6bieTI2p1wxoSik
	 O/q7rH7GVtdwUUk9/s3u4tAtg5wqKC3F44oiyE1p4fyfmysD4rgkXhh0WIW+Nb0QLi
	 U/SMYTRgobfCg==
Received: from [100.115.36.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id C3/BE-16121-9A672916;
 Mon, 15 Nov 2021 15:03:05 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqLuybFK
  iwc+fghZ3fr5jd2D0OLdxBWMAYxRrZl5SfkUCa8bjRQfZCpp5Ktb2zGVsYDzA1cXIxSEk8JhR
  Yv/iBcwQznkmiTNLD7FDOCcYJfbtecLaxcjJwSagJjH91g0gm4NDREBP4uo/UZAws4CKxIvfP
  ewgtrCAtcT53hPMIDaLgKpE27YusFZeASeJfx+3MILYEgIKElMevger4RRwlvg26T0LiC0EVP
  Nh2hYmiHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYzWSUWZ6RkluYmZObqGBga6hoamusamuoYmhnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXF
  esWVuck5KXp5qSWbGIFhnFKs3LuDsffyN71DjJIcTEqivH/0JyUK8SXlp1RmJBZnxBeV5qQWH
  2KU4eBQkuDdXQqUEyxKTU+tSMvMAcYUTFqCg0dJhNegGCjNW1yQmFucmQ6ROsWoKCXOOw2kTw
  AkkVGaB9cGi+NLjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5A0DG82TmlcBNfwW0mAlosf2
  9fpDFJYkIKakGpqp/ZSfYt6g9Pev4VmcV066erXKzQ37OOK2UPvWRWo+baReDBOuFWQ3HL7Na
  KfFdYTuWo77TK/nFsZszzGRr3+c+Equp5fMKXnPW7OTqgDVbnNINzqhNYyzR9riy5c2by2vWB
  u9hfNh46G2o/Pm5T4LkeDpKvpW454hVuDpU3f43veLr2ad7N9/fdO/Cuaos0y0VGZV/NULlXh
  d/ytx3Ninm7o+E654F3okmP6Ufv+Wr0eN1FViwZY62jmzsHeOzZ1TVDm6aLlL3bE1TrsExbu+
  5WoGdpdPUHN40r3KNkxX8J3/23pWc9hn1DPYXk//s+6jyckPgH62mgrQHG3SWX18r7lukWHrR
  nZ9ba/eBKUosxRmJhlrMRcWJAG9g6jJeAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-23.tower-565.messagelabs.com!1636988585!859817!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3300 invoked from network); 15 Nov 2021 15:03:05 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-23.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Nov 2021 15:03:05 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id D6D7210023B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:03:04 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CA3D910022B
	for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Nov 2021 15:03:04 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.24; Mon, 15 Nov 2021 15:02:58 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libhandy: upgrade 1.4.0 -> 1.5.0
Date: Mon, 15 Nov 2021 23:02:36 +0800
Message-ID: <1636988556-78653-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636988556-78653-1-git-send-email-wangmy@fujitsu.com>
References: <1636988556-78653-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Nov 2021 15:03:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158298

=============
Version 1.5.0
=============

- Introduce HdyStyleManager for managing color schemes (light/dark) and
  high contrast mode.
  - Support the cross-platform color scheme preference in the
    settings portal.
- HdyPreferencesPage
  - Remove adaptive margins to fix default window sizes
- HdyTabBar
  - Handle middle click on button release rather than press
- Various memory leak fixes
- Translation updates:
  - Brazilian Portuguese
  - Finnish
  - Indonesian
  - Portuguese
  - Serbian
  - Swedish
  - Ukrainian

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libhandy/{libhandy_1.4.0.bb => libhandy_1.5.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libhandy/{libhandy_1.4.0.bb => libhandy_1.5.0.bb} (95%)

diff --git a/meta/recipes-gnome/libhandy/libhandy_1.4.0.bb b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
similarity index 95%
rename from meta/recipes-gnome/libhandy/libhandy_1.4.0.bb
rename to meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
index 1f032284e5..d0b59b1a62 100644
--- a/meta/recipes-gnome/libhandy/libhandy_1.4.0.bb
+++ b/meta/recipes-gnome/libhandy/libhandy_1.5.0.bb
@@ -10,7 +10,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/libhandy.git;protocol=https;branch=master"
-SRCREV = "f8626427acebfa08b2b4ee1166d51e416d3d7407"
+SRCREV = "8fa8306a79215fc6ebf2483145da98bf9b2495ab"
 S = "${WORKDIR}/git"
 
 GIR_MESON_ENABLE_FLAG = 'enabled'
-- 
2.25.1


