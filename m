Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB4EC32793
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 22:22:36 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.30995.1674080546688346686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 14:22:27 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=g2t0l1Kj;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1674080546;
  x=1705616546;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ML8TOqTyDTYtlRo3FGTr8aIB/s+9NltS8Pp0Wksofs8=;
  b=g2t0l1KjAwn08yxsE9cJmWU9G/WOT6850PQaH2hDVS5qL2GZxJAn2uvZ
   0ePbYlRzCgH1toY7SuNN4sTttiWYHmaNs6bgNcqaUOwC/L7Dm5OPebd80
   JhtYGIu1kNxUuNLzubY4T4FmRSsngX/DIiBQEnm9eNVyh5Dh542d57ndC
   o/oYHHezMSGHCOUXiZOoMhPuyYt8II0CpuE4hTwYqyFA7e32pD48KxsFp
   25rtp4A4JWzDmq5PAwcec5QT8nWcUznnGat2Ugk+ySqcG24Ft+KnKznRO
   Tvz3x2ODWSjQZhi16fzWcp+1RWZtNxDGckHfYiaeArWCS9CZf/iOG1eLG
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH] librsvg: Only enable the Vala bindings if
 GObject Introspection is enabled
Thread-Topic: [OE-core] [PATCH] librsvg: Only enable the Vala bindings if
 GObject Introspection is enabled
Thread-Index: AQHZK1kNyi5+VDsjPU235XwjSSfBWK6kvxEw
Date: Wed, 18 Jan 2023 22:22:22 +0000
Message-ID: <2c4678f5a769445f90b4759a6d6dd259@axis.com>
References: <20230118112759.3909741-1-pkj@axis.com>
 <20230118172227.28bdb930@booty>
In-Reply-To: <20230118172227.28bdb930@booty>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 22:22:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176114

> -----Original Message-----
> From: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Sent: den 18 januari 2023 17:22
> To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Cc: openembedded-core@lists.openembedded.org; Richard Purdie
> <richard.purdie@linuxfoundation.org>
> Subject: Re: [OE-core] [PATCH] librsvg: Only enable the Vala bindings if
> GObject Introspection is enabled
>=20
> Hello Peter,
>=20
> On Wed, 18 Jan 2023 12:27:59 +0100
> "Peter Kjellerstedt" <peter.kjellerstedt@axis.com> wrote:
>=20
> > This avoids the following error:
> >
> >   configure: error: Vala bindings require GObject Introspection
> >
> > Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
>=20
> A different patch [0] to address the same bug is already in my testing
> branch and is possibly being merged soon on master by Richard. Can you
> please check whether your think your patch is better and let us know?

I had not seen that patch when I sent mine. I think mine is a little better=
=20
since it defines and uses a PACKAGECONFIG for the vala support, which shoul=
d=20
make it easier for anyone wanting to, e.g., disable the vala support even i=
f=20
it is enabled by default.

>=20
> [0] https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dlu=
caceresoli/master-next-success&id=3De9e761146b52658c06aae150332db666ce2f25a=
8
>=20
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

//Peter


