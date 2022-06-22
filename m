Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB98C43334
	for <webhook@archiver.kernel.org>; Wed, 22 Jun 2022 07:38:20 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.82])
 by mx.groups.io with SMTP id smtpd.web11.4581.1655883495802133310
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 00:38:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=KCgidshC;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.82,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655883494; i=@fujitsu.com;
	bh=Kb79q5iaLEpT6q9Sw8LmMyIe1gW9QRRWbsYa/BMIA44=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=KCgidshC+rj9+AtOLoyyXNnA3ekqCl7/FnERfquCJb5tgHhktHoLl01QIs8YW5bep
	 kCuxZdyrqB4ZwSkF8eNSM6Q5xOOXAcFt1BvB68uzTXE+ERLBJ9FU3u8fUgvq7qDz1p
	 aiPuzN6mSXYBrUe+2/gkKDeZeqX4aNwl/Iw/O5EPCRIySUJkHXfilByGdpCjjMG8VX
	 PwAfvEoEoL2GUcDgOnIvx6n6E8q63hDrrNggutd3SbBA/JOCNQmV/yk24IA5Yr03e/
	 EZVd973ZO48fLtYFqjW49vuAx+RrhnJHI7ARmaX+q4bmZA6o3NQtFEhIsedKbCrcdV
	 7oIbvBczRTG7g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMIsWRWlGSWpSXmKPExsViZ8OxWffpsU1
  JBmc3i1nc+fmO3YHR49zGFYwBjFGsmXlJ+RUJrBmnnjezFxzkrJh0cwJzA+Mxji5GLg4hgQeM
  Et1d+xghnBtMEj1HZgE5nEDOHkaJvX/8QWw2ATWJ6bdusHYxcnCICOhJXP0nChJmFlCRePG7h
  x3EFhZwlOj985AVxGYRUJVonfETzOYVcJI4sGY9mC0hoCAx5eF7ZhCbU8BZ4uDVDhaIVU4SW2
  69ZYKoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIzJixjQ3CVpO4em4T8wRGwVlI2mchaV/
  AyLSK0SKpKDM9oyQ3MTNH19DAQNfQ0FTXUNdIL7FKN1EvtVS3PLW4RNdQL7G8WC+1uFivuDI3
  OSdFLy+1ZBMjMHxTihmZdjAu6/upd4hRkoNJSZRX8sCmJCG+pPyUyozE4oz4otKc1OJDjDIcH
  EoSvM2HgXKCRanpqRVpmTnAWIJJS3DwKInwqh4CSvMWFyTmFmemQ6ROMepyzPzadoBZiCUvPy
  9VSpz360GgIgGQoozSPLgRsLi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9+5RoCk8mXk
  lcJteAR3BBHTEk+UbQI4oSURISTUwWUj86TE8WaAZNnNVAF/o940x3yZMuMNv9OJ9q1tdi5EF
  U43A/U3CJeoZSo2vA3U17V9f8+5VeMx/5dYDyRnr+xpEJ+yyv7vTwuL3de5DjcWXXVOlk/qDn
  OV4Nht/6rY6NXsRM+/79SK2P+JWp1l8/2IYU3cgteLQjVXd0rb3fVWKfF9unP3hgKh0h3Kwim
  zD6xntzMerJxhfj3WbcNH370zfKu7XRssyV2wRCc9bc4R9re2mB9Ma5pvLmi3rYLRbtLI71Gr
  Vvl3XqmaZ178sTs48NYPZ/vL63bUvRBfFXDCecKj7zClPjXcmOXbZp1ecvawvahtc6HiR66eB
  cqfg5QrjLesMNlcWKHoes01WYinOSDTUYi4qTgQAyFMxpGYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-585.messagelabs.com!1655883493!515453!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 15423 invoked from network); 22 Jun 2022 07:38:13 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jun 2022 07:38:13 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id EE2C7142
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:38:12 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id E1B1E73
	for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jun 2022 08:38:12 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 22 Jun 2022 08:38:11 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] alsa-plugins: upgrade 1.2.6 -> 1.2.7.1
Date: Wed, 22 Jun 2022 15:37:47 +0800
Message-ID: <1655883470-22765-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655883470-22765-1-git-send-email-wangmy@fujitsu.com>
References: <1655883470-22765-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jun 2022 07:38:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167213

Changelog:
==========
Jack PCM plugin
 - jack: use program_invocation_short_name
 - jack: implement pcm operation sw_params

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../alsa/{alsa-plugins_1.2.6.bb => alsa-plugins_1.2.7.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/alsa/{alsa-plugins_1.2.6.bb => alsa-plugins_1.2.7.1.bb} (98%)

diff --git a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.7.1.bb
similarity index 98%
rename from meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
rename to meta/recipes-multimedia/alsa/alsa-plugins_1.2.7.1.bb
index 560fd80f0b..62505fee83 100644
--- a/meta/recipes-multimedia/alsa/alsa-plugins_1.2.6.bb
+++ b/meta/recipes-multimedia/alsa/alsa-plugins_1.2.7.1.bb
@@ -23,7 +23,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/plugins/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "068818a4b55d8c029daa00015d853d45113f56b224b7c64e1e117988c825b2a0"
+SRC_URI[sha256sum] = "8c337814954bb7c167456733a6046142a2931f12eccba3ec2a4ae618a3432511"
 
 DEPENDS += "alsa-lib"
 
-- 
2.25.1


