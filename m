Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 987ABCC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 21:08:19 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8082.1792098491273971975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Oct 2026 14:08:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michael.haener@siemens.com header.s=fm2 header.b=CPJLf/pi;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-664519-20261015210808524d7693540002072b-c4aodc@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20261015210808524d7693540002072b
        for <openembedded-core@lists.openembedded.org>;
        Thu, 15 Oct 2026 23:08:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=1N2GnmEyiPy5M3XXXlLcZyZ2YnO9AS3LmLr2zptFTJ8=;
 b=CPJLf/pi1D+mPBwCh2rOZ6oNcz4J+hU+NfiDyLnmz+9XByE2plXobfkEDwjASpcXXWpmq0
 S56MdjwbmraBr25nSqcTMizTs3rXVhZhnYJrygyB7vaL1liTNNVm5ydsBNNzSf5FfTSKX6LA
 6iEu4MMe9kw+r2dkk02piL/Y8r2J8uRH1mpKfUmumOTpt4ldo0oV6Cp/r8WersySbMigrqF/
 lazm8bTBWP5xMeIgorPX2cFbP4aXv2yA5WsQ0StC74pVr3NrzRrpM6PtDRu9AXnvI3a+xJkx
 3gNmmUcBWL5JHsJ0TIzrrmWbGvXIe/j4aJUwSiY156yDBU9XDuXFknoA==;
From: Michael Haener <michael.haener@siemens.com>
To: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Cc: adrian.freihofer@siemens.com,
	zhanxusheng@xiaomi.com,
	peter.marko@siemens.com
Subject: Re: [PATCH v3] sstate: fix access to a cached object rewriting its modification time
Date: Thu, 15 Oct 2026 23:08:06 +0200
Message-Id: <20261015210806.9501-1-michael.haener@siemens.com>
In-Reply-To: <5e2534d7886c69c5f47a71f2e03951b29489d04c.camel@linuxfoundation.org>
References: <5e2534d7886c69c5f47a71f2e03951b29489d04c.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Oct 2026 21:08:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247898

On Wed, 2026-09-16 at 14:24 +0100, Richard Purdie wrote:
> So I guess I'm saying it may be possible to change but we do need a bit
> more analysis and buy in from others for the change than what we have
> right now.

Thanks Richard. I filed [YOCTO #16454] to collect the analysis and
feedback:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=16454

Cheers,
Michael

