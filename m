Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A908EC982C1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 07:11:29 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.33984.1789629088049179379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 00:11:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=vms8tboX;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B25A54E40786
	for <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:11:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 836D55FAA3;
	Thu, 17 Sep 2026 07:11:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 319DF11C7A20E;
	Thu, 17 Sep 2026 09:11:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789629085; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JD5Lc7DuXsSjLj+QGofRwKvetG4272+TXaeHbiKqMKc=;
	b=vms8tboXTOp/oQ7P5Jo9ldK4iEjvNygb9+a90PEzR9meFsMNEUIuzagHwlUHydCCj3PjMC
	AzU75WlrG4KAqDDR+C0loqIkRw7XpvsjcZ/9zKntGIN5yfABo9bXOqk0fS+gMRnqC45f++
	Mphhec14wm4W4u6fXqLTpZvrFyCwe/l3YHAq5oeTS5jfdY8+qwWWTcrzurE5a5NSxW7vdE
	8HxIT0uQG34OFUmaZuF94+ghxmtnXklviMr43z4lz06SO0gmdZm7QL73itcfmX26IWnBQM
	999P0E6zc15Lyjzsdv8D7RCttdVCfd2/to+1X/JT1sApp/tal4ySRFSMGPofkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 09:11:23 +0200
Message-Id: <DLHEKAY5H03H.25YJ78R6JQX08@bootlin.com>
Subject: Re: [oe-core][master][PATCH] libgcrypt: Update license for dbg
 package
Cc: "Sana Kazi" <Kazi.S@bmwtechworks.in>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <UpStream_IP-SK@bmwtechworks.in>,
 <openembedded-core@lists.openembedded.org>
References: <20260917063747.1037155-1-UpStream_IP-SK@bmwtechworks.in>
In-Reply-To: <20260917063747.1037155-1-UpStream_IP-SK@bmwtechworks.in>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 07:11:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246041

Hi,

On Thu Sep 17, 2026 at 8:37 AM CEST, Sana Kazi via lists.openembedded.org w=
rote:
> From: Sana Kazi <Kazi.S@bmwtechworks.in>
>
> Set LICENSE for libgcrypt-dbg as "LGPL-2.1-or-later"

Our recipe for libgcrypt was updated to 1.12.4 on master. Can you rebase an=
d
re-send the patch?

Thanks,
Antonin

