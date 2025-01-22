Return-Path: <sean@geanix.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 476E6C02181
	for <webhook@archiver.kernel.org>; Wed, 22 Jan 2025 14:04:41 +0000 (UTC)
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
 by mx.groups.io with SMTP id smtpd.web10.44207.1737554678149338027
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jan 2025 06:04:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@geanix.com header.s=default2211 header.b=HzvOlE3M;
 spf=pass (domain: geanix.com, ip: 188.40.30.78, mailfrom: sean@geanix.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID; bh=0mpB1fct3oQKu3VlNH28jnHsvnLlJDBetuVYlQtZ8vo=; b=HzvOlE
	3MPvRuParYj9iPDuhoQX6JBorFJ7PD27vIx5Vq5Zt8A2GXBAet1+Wehkkrk6BqzuANWNAxU+qfgyy
	NOehomsY39rkjUkulIR7velx4DAmB4CVvVfPILqd3CMBH5dL4awCaTB4rt+c8raPDiQbiw+CPNxtN
	/NOALfTNjOaPJSHJUIB7VksltokK7mRprmRAmwY7hBcLaLqAcad1KbAFwfpm1sEGjntiKTtM3QHSL
	ZS6jYD0Al2HsB/2Qnw+C3bXJ/4+O2ra81fjKl7II516agf7LVKeWy1yGybmltecUNmsLfBFOZuS36
	7wIOuQARj6iTDtx/klG5GIE83Bvg==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <sean@geanix.com>)
	id 1tabLQ-000Ekv-0A;
	Wed, 22 Jan 2025 15:04:36 +0100
Received: from [2a06:4004:10df:0:edea:1072:35e7:ef3] (helo=Seans-MBP.snzone.dk)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <sean@geanix.com>)
	id 1tabLQ-000H35-04;
	Wed, 22 Jan 2025 15:04:35 +0100
Date: Wed, 22 Jan 2025 15:04:35 +0100
From: Sean Nyekjaer <sean@geanix.com>
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] image/populate_sdk: Support usrmerge for
 nativesdk in SDK builds
Message-ID: <3ot3xt22h6idimbs4xrb4cnojyxeswugitvortqlinqdffb76o@tebg2u26fzin>
References: <20250117130851.4055166-1-sean@geanix.com>
 <C02E5327-1001-4CA9-BA15-E063F862C4AA@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <C02E5327-1001-4CA9-BA15-E063F862C4AA@arm.com>
X-Authenticated-Sender: sean@geanix.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27526/Wed Jan 22 10:40:03 2025)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jan 2025 14:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210154

On Wed, Jan 22, 2025 at 01:41:11PM +0100, Ross Burton wrote:
> Hi Sean,
> 
> On 17 Jan 2025, at 13:08, Sean Nyekjaer via lists.openembedded.org <sean=geanix.com@lists.openembedded.org> wrote:
> > Some recipes(systemd) requires usrmerge. Create the required
> > symlinks for `/bin`, `/lib` and `/sbin`, when installing nativesdk
> > packages.
> > Enable the symlink creation by setting the `usrmerge` flag in
> > DISTRO_FEATURES_NATIVESDK.
> 
> This implies that there is some layout dependency between the target and the sdk environment. There really shouldn't be, what broke to cause you to send this?

Hi Ross,

In order to build and test our rust programs, we need libudev which systemd is providing.
We are running our tests with nativesdk.

Systemd is requires usrmerge.

Hope that explains :)

/Sean

