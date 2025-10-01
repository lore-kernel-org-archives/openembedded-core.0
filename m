Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 553FDCCA471
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 21:01:46 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web11.1064.1759352495322190402
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 14:01:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm2 header.b=NsomL/Ib;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20251001210132dd708ef5fc000207ae-a2syje@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20251001210132dd708ef5fc000207ae
        for <openembedded-core@lists.openembedded.org>;
        Wed, 01 Oct 2025 23:01:32 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=0uZ+zWfvxyg5vQukghjiOJTeS4gJEWH1gitigvVJy4w=;
 b=NsomL/IbwECcsWKvnSEwj021MIw1TvmWzb0zysR13OvdRhTVgBbK/Xo3GnllSeeA6JPr69
 ZK1SsUfZuFmwFGnbGKgahMGlRv8aTnAJ/dlduYxVtOgJKyOJXmoLCa0ZK3xGQA5BgZIQcNQ1
 zA8TjVN5gyqCF8zky3XMMmUMK5e0pCfuSCBbCtMZKUwj1NkVATzFyWt9QX5deLEf+P1vWbls
 lO/ch9RqxEaGqCqODcnojyueBHNu7LPefaU1kqFf93Rf2599z9Bvz6w/cZ0BIXdeuHzE+KEX
 A1RiiI5jwf+QDkUPDjdXBHVilMBeVo/1rpa6UelikmewulwHQXgpL1/A==;
From: AdrianF <adrian.freihofer@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [scarthgap][PATCH 0/6] expect fixes for gcc-15
Date: Wed,  1 Oct 2025 22:58:32 +0200
Message-ID: <20251001210111.1444441-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 21:01:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224328

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Back-port the latest patches from the master branch to get expect building
with gcc-15.
Patches which are related to tcl 9 are not included since scarthgap uses
tcl 8.6 only.

Adrian Freihofer (2):
  expect: Revert "expect-native: fix do_compile failure with gcc-14"
  expect: fix native build with GCC 15

Khem Raj (1):
  expect: Fix build with GCC 15

Ross Burton (3):
  expect: update code for Tcl channel implementation
  expect: don't run aclocal in do_configure
  expect: cleanup do_install

 .../expect/expect/tcl840.patch                | 27 +++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.4.bb | 18 ++++++-------
 2 files changed, 35 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/expect/expect/tcl840.patch

-- 
2.51.0


