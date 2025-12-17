Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96258D64085
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 07:14:04 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9255.1765955634113682650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 23:13:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OVC8s3i9;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 023534E41C50
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:13:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C49946072F;
	Wed, 17 Dec 2025 07:13:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DD963119501A8;
	Wed, 17 Dec 2025 08:13:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765955628; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5bB+nwyjjG1KX+cVWXJWgaD4efGhho4A49tJl3b4HRw=;
	b=OVC8s3i9JQSBBcYCKWN530DD1ae5uHloutr9coDjlA/cfbA3dMkTGTaiKjYH3cGIQCzEQH
	NMPwaJ5BLzInxZUJvh9kmnWjwjzAWgto4e6JRA9kyRprD0f5gFrg3zJ+IZeV5AQF0p2jhx
	FHNqXi3CZrC0ur4TYIQb61cKjRf/4SSDtFwpTjvMrP0Ys9kJZnKyNSWozbA9rvOqPWh//W
	8sy6LGNVsgTax1Dlsh4PT+SkOYHZE3zPjNMWQHzi72VJ1psjEXsuadBd/e+Jd6sxTTbp1U
	J2MRnA3KRPhEIL3psmQVFX+XV0Owtn8Khl1wVYZyJQmSyEXNMO6zW28ChOI84g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 08:13:46 +0100
Message-Id: <DF0B0V3GOP92.D0RPEBV393KB@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <lukakrstic031@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] patchtest: reject Upstream-Status after
 scissors
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251215204507.1675-1-lukakrstic031@gmail.com>
In-Reply-To: <20251215204507.1675-1-lukakrstic031@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 07:14:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227999

On Mon Dec 15, 2025 at 9:45 PM CET, Luka Krstic via lists.openembedded.org =
wrote:
> From: l-krstic <lukakrstic031@gmail.com>
>
> Upstream-Status must be placed in the patch header before the
> scissors line. patchtest currently accepts tags that appear
> only after the scissors, which means the tag is lost when the
> patch is refreshed by git or devtool.
>
> Update test_upstream_status_presence_format() to distinguish
> between tags in the header and tags after the scissors, and
> reject the latter.
>
> Fixes: [YOCTO #15940]
> Signed-off-by: Luka Krstic <lukakrstic031@gmail.com>
> ---

Hi Luka,

Thanks for your patch.

It is conflicting a lot with existing code on master branch: are you
based on a recent master branch on your side?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


