Return-Path: <kamel.bouhara@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73E93CA0FFE
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 07:12:16 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.71510.1756797127153483593
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 00:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=vyMS8noB;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: kamel.bouhara@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8396E4E40C75
	for <openembedded-core@lists.openembedded.org>; Tue,  2 Sep 2025 07:12:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4C8AE60695;
	Tue,  2 Sep 2025 07:12:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8316E1C22DB1D;
	Tue,  2 Sep 2025 09:12:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756797124; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=a+jeoZ+hqzrbXa9cT6d02sXcR3i1Ne5qnmyWiesPw7w=;
	b=vyMS8noBIJGJZHtCU/+Evrf0tzLZG6L1+HQx9KHoK2P26qFlgz/zijFThWKsUxUleqHaAW
	yQYJ15tDKaFsTVDmZxP4tEppFnCvi1S3C8m8avUDX5hpszDNB2r2g2S3HpfmMVWhLQZego
	rmOtXKo0kB7da0W+rwlZcy8OBuFcSZ9eIcdBL4L7DDGb3tJRlQ0P/H5JbKqHKxCvPEs4lk
	M487yBSR1wq8Mepl1pu5l+jZC1AfSpr+yzq8X3oMNaYGr70k0AtEPWJ6o25xhwBGCz5i2s
	7uo8GfEGpHqJFq+nDx6LA/djxgkypY3a6jM0mBNeQAQxuTqGcmWrtKsg+ZRxKQ==
Date: Tue, 2 Sep 2025 09:11:58 +0200
From: Kamel Bouhara <kamel.bouhara@bootlin.com>
To: ross.burton@arm.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Joshua Watt <JPEWhacker@gmail.com>, "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
	"mathieu.dubois-briand@bootlin.com" <mathieu.dubois-briand@bootlin.com>, "antonin.godard@bootlin.com" <antonin.godard@bootlin.com>
Subject: Re: [OE-core] [PATCH v3 2/2] spdx30_tasks: Add support for exporting
 PACKAGECONFIG to SPDX
Message-ID: <zxrxtcqgep7gsgkc3oax2rff7zoyq2c76bghvstsx3cii5aykp@rgtw34rifhdt>
References: <20250821145438.2537767-1-kamel.bouhara@bootlin.com>
 <20250821145438.2537767-3-kamel.bouhara@bootlin.com>
 <818BC0DA-8F57-4BCA-987A-BD3128CFE9EB@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <818BC0DA-8F57-4BCA-987A-BD3128CFE9EB@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 07:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222710

On Mon, Sep 01, 2025 at 05:04:38PM +0000, Ross Burton via lists.openembed=
ded.org wrote:
> Hi,
>

Hi Ross,

> > On 21 Aug 2025, at 15:54, Kamel Bouhara via lists.openembedded.org <k=
amel.bouhara=3Dbootlin.com@lists.openembedded.org> wrote:
> >
> > Introduce the SPDX_INCLUDE_PACKAGECONFIG variable, which when enabled=
 causes
> > PACKAGECONFIG features to be recorded in the SPDX document as build p=
arameters.
>
> My initial review comment was =E2=80=9Cwhat does Josh think=E2=80=9D an=
d he=E2=80=99s already acked this, but this is adding disabled-by-default=
 functionality that isn=E2=80=99t documented or tested at all.
>
> Can you add some documentation to the reference manual at least, and a =
test case in oe-selftest that turns on all of these optional toggles so t=
hey get exercised at least once?

Sure, I=E2=80=99ll add the docs and an oe-selftest case in the next updat=
e.

Thanks,
Kamel

--
Kamel Bouhara, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

