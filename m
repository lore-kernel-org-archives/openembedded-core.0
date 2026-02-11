Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF188E9E2F9
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:05:26 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17497.1770811519664541939
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:05:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=yZVyGsJY;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id EC521C243AC
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 12:05:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1AC16606BE;
	Wed, 11 Feb 2026 12:05:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DF81011948D90;
	Wed, 11 Feb 2026 13:05:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770811516; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qzkTYoOaJPlHq6GXczOxfIUFYi8ZcMG5v1YCoXLRvIM=;
	b=yZVyGsJYIqaqKqOcV0Jl8lufVzYb5q7LUHm35ERvClPfcTM98ZuqkSJmINtplyIrCiPj4p
	MGO1ECUMxHV0q/lL9Uu127FhHD1YTQQPx3TtiKH6whsHex4PssB9zdEONz1fNb70fKUigU
	7sXy2BS2gCQSZ+3jc4EpmJLhYtc+uL+OQAyQGuX22n606YLgBdtbQ8LTpCpqM4QGmAG2Cw
	I6pfXS4TRstcACSNVKjx6udj4irxVG4EnhX7agZA0Y5CJVJXESiGuBA6WL3pv2mXmu5V7b
	UStF9LBFzxxvosWN/YjbDiT2/QS/cO5dGaSbkNHO704htjeQ9AsdCwZC4ivtTA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 13:05:15 +0100
Message-Id: <DGC4AJKQVSU7.1VZLAXQQ4326T@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][master][PATCH v2] python3-pip: Backport fix
 CVE-2026-1703
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260210163138.91552-1-adarsh.jagadish.kamini@est.tech>
In-Reply-To: <20260210163138.91552-1-adarsh.jagadish.kamini@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Feb 2026 12:05:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230981

On Tue Feb 10, 2026 at 5:31 PM CET, Adarsh Jagadish Kamini wrote:
> From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
>
> Include the patch linked in the NVD report: https://github.com/pypa/pip/c=
ommit/8e227a9be4faa9594e05d02ca05a413a2a4e7735
>
> Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
> ---

Hi Adarsh,

Thanks for the new version. I can see you updated the SRC_URI, but did
you also update for the issue of the patch itself? "b4 diff" tells me it
it the same.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


