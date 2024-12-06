Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E939DE77173
	for <webhook@archiver.kernel.org>; Fri,  6 Dec 2024 18:26:12 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.44622.1733509567310905150
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Dec 2024 10:26:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=A9mi73/6;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202412061826033c18a0e9e7cf1a4050-spi5gq@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202412061826033c18a0e9e7cf1a4050
        for <openembedded-core@lists.openembedded.org>;
        Fri, 06 Dec 2024 19:26:04 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=rCHbYSkR4GssmHHxXcsvLDhLnHUrE9yRYUYmgd0Ls5E=;
 b=A9mi73/62SXuNgz4KnFE5rdwjy4jJwvajn2zHHkLagWqzY635BKX+WXij8xDiCHqzV3E3K
 VDuuulRWowokyZcwV8O2mfgHLOZIrhBZxKJJa39v6K6ZDcikSAniRJnyeePYptse+YcGEq8g
 IwsPgCHsVg+Bh+3Ip+h2iPT9TGjlykxGVeLMNMgjQVC5KnDxi2Qi/MyUHYOQEAdXgQcSZiix
 rNcrb8tOgEWi23N9idXMOn9ZPeVO8JCBGqmFxh4x8ZH6MWHMZKFmZDAc8EHn7Yfwb1NutLa1
 ERuWoal4uBtyoqskogmTViirQeFI3vwDYRqampxBWhmnN+9iKx6C6GCA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH 0/3] CVE cleanup for master
Date: Fri,  6 Dec 2024 19:25:10 +0100
Message-Id: <20241206182513.11165-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Dec 2024 18:26:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208435

Clear and set CVE_STATUS fields for some recipes.

Peter Marko (3):
  libssh2: remove status for CVE-2023-48795
  tiff: remove status for CVE-2023-3164
  tiff: set status for CVEs firx in 4.7.0

 meta/recipes-multimedia/libtiff/tiff_4.7.0.bb  | 4 +++-
 meta/recipes-support/libssh2/libssh2_1.11.1.bb | 3 ---
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
2.30.2


