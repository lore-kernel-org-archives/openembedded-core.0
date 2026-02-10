Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9057EA3F38
	for <webhook@archiver.kernel.org>; Tue, 10 Feb 2026 10:10:03 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16465.1770718197576691635
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Feb 2026 02:09:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KyR+6MrE;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 918FC4E40BB4
	for <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 10:09:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 624DB606BD;
	Tue, 10 Feb 2026 10:09:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BDC85119D10E4;
	Tue, 10 Feb 2026 11:09:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770718194; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0hVlStYve/J+UoNVqPz9nQRGVy0XfasrLYsmHI2eLdE=;
	b=KyR+6MrEqZbfkUxxs+Df/yxUnKtFo1tPBW6QMmvzvf3j02Nyu8tvlgnmZtYxGiasaJTtmx
	rMR0KXUYwZ+TQaQ1TipYoaH1BV/2MYmqJsFiQ63O7TdKUXElb/ihmGXizU77TAhBNiHun0
	ixXG954qEvZTWe2jyc/EbWwpLMzpQBmzfoz8RRQQw5TQJkwICdMTYyZDG7LWDcbdaPmF/x
	uZ5lfwMvvN2qOkLRiBIv6et4tcmRp3wkN0LEmY01tpZQ6Z27iYl6utR6GeSfH0Hv+9fzLr
	d5jcoSCoFBWMb20DUargDCnSkiMb16K4iROxujE14ttrLquK35fzUGxxAcfqJQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Feb 2026 11:09:53 +0100
Message-Id: <DGB77NZHNM3V.2EJ7FXYV0OH5Q@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/13] kernel-yocto: 6.18 updates and 6.12/6.16
 removal
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: =?utf-8?q?Jan-Simon_M=C3=B6ller?= <jsmoeller@linuxfoundation.org>,
 <bruce.ashfield@gmail.com>, <richard.purdie@linuxfoundation.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
In-Reply-To: <20260206202732.1080699-1-bruce.ashfield@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Feb 2026 10:10:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230879

On Fri Feb 6, 2026 at 9:27 PM CET, Bruce Ashfield via lists.openembedded.or=
g wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Hi all,
>
> Here's my series for the two repositories combined into one.
> I usually do end up missing some reference to the old kernels,
> so I'm never completely sure that I've gotten them all.
>
> But with this (and thanks to Kevin getting the beaglebone
> working with 6.18/standard/base), we are down to just the
> single reference kernel.
>
> As usual, I'll continue updating any kernel that is active
> upstream, and I'll send -stable updates to the appropriate
> branches.
>
> I also plan to make my scripts available for those that may
> want to bump SRCREVs by themselves to continue consuming my
> merges.
>
> I'm out for the weekend, but will pick up any issues with
> this on first thing Monday morning.
>
> Bruce
>

Hi,

Looks correct on the autobuilder.

Just a quick note for Jan-Simon: once merged, this will break meta-agl
layer, as it refers to 6.16 as a preferred version:

WARNING: preferred version 6.16% of linux-yocto not available (for item vir=
tual/kernel)
WARNING: versions of linux-yocto available: 6.18.8+git

https://autobuilder.yoctoproject.org/valkyrie/#/builders/55/builds/2987

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


