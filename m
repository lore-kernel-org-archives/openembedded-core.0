Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A171F3C264
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 13:43:47 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14542.1773063823890093634
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Mar 2026 06:43:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bf5UWJdZ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E9E7F1A246D;
	Mon,  9 Mar 2026 13:43:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBC655FFB8;
	Mon,  9 Mar 2026 13:43:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8BF0F10369BC5;
	Mon,  9 Mar 2026 14:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773063821; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5VHzca1wET8bXXZ/YlhCSySQzaL18nfff/Huw/f1ftQ=;
	b=bf5UWJdZyOlsiRWPXjzwbrBiHEmDHy+ZRSDvnoj6XXJHyrCKBfmsC52k4G0KCWYM8TqVxB
	iuiLyZpvj681xAOPIWvSl02qpFOFz0i/qp5sguW1J3C1RKOOcnXjsKbgIRdqEgbZXgg421
	JZvMQbaIV5F5tmExrG8k60DeW4l9bHRb/LMFg5a9SPdRle/w716tsE8SDCAHQ5jkXz6VgS
	JYwQobsNUfkU+1xPZvLKO8vFSUl2RB4JlVa9iULIss9YOzpaTeIDS+LOHdHiSkBnRYGTmG
	cBaT3D620KAR8H63IiBldC3G40gUvVK7XRoyXXLboXBbdFo4CpevplafDbS8fA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 14:43:40 +0100
Message-Id: <DGYAO253LE4I.2VZQEXWUZ5G5P@bootlin.com>
Subject: Re: [OE-core][PATCH v2] go: add ptest support
Cc: "pratik.farkase@ericsson.com" <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260305110200.17834-1-pratik.farkase@est.tech>
 <20260306172416.23307-1-pratik.farkase@est.tech>
 <DGXJ52WWUKEO.GZLFB46U22IX@bootlin.com>
 <GV2P189MB3005CC084E6CC2C59CCBC5FCFE78A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
In-Reply-To: <GV2P189MB3005CC084E6CC2C59CCBC5FCFE78A@GV2P189MB3005.EURP189.PROD.OUTLOOK.COM>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 13:43:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232719

On Sun Mar 8, 2026 at 5:58 PM CET, Pratik Farkase wrote:
> Hi Mathieu,
>
> Thanks for testing!
>
> Yes, Go ptest requires significant RAM due to on-the-fly compilation duri=
ng testing.
> On my setup (qemux86-64 with 4GB RAM), tests complete successfully in ~45=
 minutes.
>
> The minimum RAM requirement appears to be ~2GB. With less RAM, the OOM ki=
ller
> terminates compile processes as you've seen.
>
> Options:
> 1. Increase QB_MEM for go-ptest in the recipe
>
> This is similar to other resource-intensive ptests like gcc or llvm.
>
> What would be the preferred approach for OpenEmbedded-Core?
>
> Thanks,
> Pratik
>

Hi Pratik,

I believe increasing QB_MEM is the way to go, but some reviewers might
have a different opinion.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


