Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4707CCD185
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 22:01:03 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web11.20228.1759701661192928934
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Oct 2025 15:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=HwbrWKTs;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-1329275-2025100522005734016f3f6e000207a1-prh4nw@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2025100522005734016f3f6e000207a1
        for <openembedded-core@lists.openembedded.org>;
        Mon, 06 Oct 2025 00:00:58 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=P/CM1pZd5hBHDnw7dBtmHuWnXE/Yfr6uob6zAsmWAjs=;
 b=HwbrWKTsZnZTNyKrm+IK7RGfYPQNcLjtMgfDjshhBDq/hzUOYK9RxMNJ2N92jketwS32WY
 Y/Xxdy8eOQ1rWUt2wdhGaSpu3u2oW694atc18mXR+St4ixGJ/A0nbYukwf6Ma/BujO5/KE/0
 oU3sjqfSLmJKhI6bP2RdhPKlhuiTBW01qvCcCGSzArDYXUdWApqbKi/5gzqi00f77Hmhlo8S
 6lSI9yGrkRe+Y2zx+yMRWHfvyk3lDZb9O7Vxh+41nDOquZjx57JmAyQWLeFTWHj8UDW3DAjV
 waGj+aCW8HwrEEFZ8t5k4ym2NWwtzKZczC6iM1kWwk7dpFqJgXxu+VWA==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 0/4] devtool ide-sdk improvements for bitbake-setup
Date: Mon,  6 Oct 2025 00:00:30 +0200
Message-ID: <20251005220047.4101591-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Oct 2025 22:01:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224448

From: Adrian Freihofer <adrian.freihofer@siemens.com>

This patch series contains some improvements for the devtool ide-sdk
command, hopefully fixing the issues when oe-selftest runs in an
environment setup by bitbake-setup.


Adrian Freihofer (4):
  devtool: ide_sdk: trivial alphabetical reorder
  devtool: ide-sdk: use /bin/sh instead of /bin/bash
  devtool: ide_sdk: pass BITBAKEDIR to oe-init-build-env
  oe-selftest: devtool: DevtoolIdeSdkTests debug logging

 meta/lib/oeqa/selftest/cases/devtool.py | 101 +++++++++++++++---------
 scripts/lib/devtool/ide_sdk.py          |  15 ++--
 2 files changed, 72 insertions(+), 44 deletions(-)

-- 
2.51.0


