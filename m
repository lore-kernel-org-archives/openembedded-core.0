Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC49AC433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 13:20:01 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web10.10937.1639401601121446223
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 05:20:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mbAESoXP;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639401598; i=@fujitsu.com;
	bh=BxevArVyoEIuJ6x+uJCEQvRN42DYDLM/aO20L8Xh6dw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mbAESoXPvT28uVhuJV3LYxOx1Pzog4HWrXY9KQSUjk7o5PIVBxRMnpHXiYIHoJmOq
	 dKyD0ltQa7WziU3Y42utaSHj8dxG9UFFR3iV+uTUh+ZaKV63CjTNG/ftlZoOJE5Hxe
	 LQX7LAF8JcB42qDPGSYNn+T2wWV9pzIMCfMdoOMAn2WTCgNxk2q2yKfnuUiIIYpCfg
	 tt+myCs6wWh7+cNulczJOdnx66W0X74ZNMYSpXM5tDpcG9uJj+vAVglsLdkmqRbUME
	 3y+C3gnkS443a8r3JC10k4eVOKeO3oUcgnG7+quVpZTESDU2k4S2acT4C74NROt2sE
	 MLmujG8Dgrueg==
Received: from [100.115.1.47] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.ess.symcld.net id E5/06-30341-E7847B16;
 Mon, 13 Dec 2021 13:19:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRWlGSWpSXmKPExsViZ8ORqFvnsT3
  RYM5caYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWP6JK6CV1wVP7uXsDUw3uXsYuTiEBJ4zChx
  7swndgjnPJPEt5szWCGcE4wSH/6vAspwcrAJqElMv3UDKMHBISKgJ3H1nyhImFlAReLF7x6wE
  mEBG4nu3tPMIDaLgKrE7hVT2EBsXgEniXOLO1hAbAkBBYkpD9+D1XAKOEs8+XmBCcQWAqr58H
  ELI0S9oMTJmU9YIOZLSBx88YIZoldRYvblZqg5FRKzZrUxQdhqElfPbWKewCg4C0n7LCTtCxi
  ZVjFaJRVlpmeU5CZm5ugaGhjoGhqa6poAWYZ6iVW6iXqppbrlqcUlukBuebFeanGxXnFlbnJO
  il5easkmRmAIpxSzpO5g7Ov7qXeIUZKDSUmUN5h1e6IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lC
  d7f5kA5waLU9NSKtMwcYDzBpCU4eJREeLsdgdK8xQWJucWZ6RCpU4yKUuK8gu5ACQGQREZpHl
  wbLIYvMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLmTQYZz5OZVwI3/RXQYiagxYyVm0EWlyQ
  ipKQamHruxj5ZHbwgS11DmEPcyqOft8TI99jdK77xMWcO9xUcOWqSrdbSphSfo8K/zfR3vZlM
  58nuA9YpfBOcHL7ffnpw661DrLZNh2LMn+aei1aeobxEOb/4u7T+ffHVN9lN9qovDBN+8zczu
  27G2iPCffrnznH71jNObLa+8qrPt7KQqfZYUk41D/+uxjUHbhRGXwiOXd9t3DErWeuLcvwV1q
  XROw/Xf2ta4vVE5WXc0fMXnyWm3Tl1puQr3yz3VdZ1Hi9e+s4U7dnKK2x0bh1jysTdL4K7o+b
  Nln5x6swz3kqOc4q3PmWwzRVPqffR2DLdvthhv8chJ/7rT+/aTjCL29bCd8tNLGZJ9r5Va+Mv
  K7EUZyQaajEXFScCAMy3QRtcAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-591.messagelabs.com!1639401598!33557!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9820 invoked from network); 13 Dec 2021 13:19:58 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-15.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 13:19:58 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 020ED1009F5
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:19:58 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id E6618100242
	for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Dec 2021 13:19:57 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 13:19:49 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libical: upgrade 3.0.11 -> 3.0.12
Date: Mon, 13 Dec 2021 21:19:37 +0800
Message-ID: <1639401578-27830-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1639401578-27830-1-git-send-email-wangmy@fujitsu.com>
References: <1639401578-27830-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Dec 2021 13:20:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159629

Change log :
===========
Fix a libicalval crash in cleanVObject
METHOD:DECLINECOUNTER must have DTEND or DURATION
Handle if DTEND and DURATION are both missing
Improved FindICU (copied from official CMake. see files in cmake/Kitware)
Buildsystem fixes (especially for the Ninja generator)
Built-in timezones updated to tzdata2021e

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libical/{libical_3.0.11.bb => libical_3.0.12.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/libical/{libical_3.0.11.bb => libical_3.0.12.bb} (95%)

diff --git a/meta/recipes-support/libical/libical_3.0.11.bb b/meta/recipes-support/libical/libical_3.0.12.bb
similarity index 95%
rename from meta/recipes-support/libical/libical_3.0.11.bb
rename to meta/recipes-support/libical/libical_3.0.12.bb
index b16081e9e2..fe5e58cbfb 100644
--- a/meta/recipes-support/libical/libical_3.0.11.bb
+++ b/meta/recipes-support/libical/libical_3.0.12.bb
@@ -14,7 +14,7 @@ SECTION = "libs"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BP}.tar.gz \
 "
-SRC_URI[sha256sum] = "1e6c5e10c5a48f7a40c68958055f0e2759d9ab3563aca17273fe35a5df7dbbf1"
+SRC_URI[sha256sum] = "35095a4cc1a061a3de0f332c2dc728226cf127fa0baa818e9f8856cee6d35830"
 UPSTREAM_CHECK_URI = "https://github.com/libical/libical/releases"
 
 inherit cmake pkgconfig
-- 
2.25.1


