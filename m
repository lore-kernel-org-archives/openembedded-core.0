Return-Path: <junjie.cao@linux.dev>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0922AC5DF81
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 14:27:18 +0000 (UTC)
Received: from mta0.migadu.com (mta0.migadu.com [91.218.175.211])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17979.1787581635184541475
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 07:27:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.dev header.s=key1 header.b=W6OTAg6B;
 spf=pass (domain: linux.dev, ip: 91.218.175.211, mailfrom: junjie.cao@linux.dev)
X-Envelope-To: openembedded-core@lists.openembedded.org
DKIM-Signature: a=rsa-sha256; bh=c/YWAK/yRVJ7kitRjrsrsJMQrSt66VMf12yhea6Yu8A=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787581632; v=1; x=1788186432;
 b=W6OTAg6B1ClSILCd1oLDtoPgPyrle3jYDaWzSORl1BJ5heuDXdylfNjTS4B7m42fNKNpaHqd
 uTGRs+Rq+zzany38YsEK9gFrh6KpqRMk2Ps6tlv8lp5OH6f9jM0go/jiYHvwVqLvCDZ+FAXyRm6
 WzrTQnjn6NbEq2rVlzm68v6w=
X-Envelope-To: openembedded-core@lists.openembedded.org
Received: from localhost (2408:8806:52:f8ea:5de6:8d95:1672:70f3)
	by smtp.migadu.com with ESMTPS id ec2d9b6271511fde;
	Mon, 24 Aug 2026 14:27:02 +0000
X-Mizu-Trace-ID: ec2d9b6271511fde
X-Migadu-Flow: FLOW_OUT
Date: Mon, 24 Aug 2026 11:25:58 -0500
Message-ID: <d94be5543ecfd4dc3c71119af20e202a.junjie.cao@linux.dev>
From: Junjie Cao <junjie.cao@linux.dev>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org, Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] cve-exclusions: set status for CVE-2022-0400
In-Reply-To: <f94020c9d3d9a7a9a49c1ddfaa56b2af3d7cfe2c.camel@pbarker.dev>
References: <20260824043034.1457687-1-junjie.cao@linux.dev>
 <f94020c9d3d9a7a9a49c1ddfaa56b2af3d7cfe2c.camel@pbarker.dev>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 14:27:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244124

On Mon, 24 Aug 2026, Paul Barker wrote:
> We can say 6.13rc4 here.

Right, v2 sent:

  https://lore.kernel.org/openembedded-core/20260824155219.1562450-1-junjie.cao@linux.dev/

Richard, that supersedes 3247c267 in master-next.

