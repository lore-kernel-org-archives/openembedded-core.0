Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E61CEB64D7
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 10:53:34 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.39145.1687517607254440824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 03:53:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ODgu4y56;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
X-GND-Sasl: luca.ceresoli@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687517605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zdtksWl+HVrQSiEVrUAfas6no7KVZQYPBIFbnxfEHRc=;
	b=ODgu4y56c+4nyDhmilzQFFJv42zNUG4xMvVoeinkk4mm7YNOGjvoWdN8ebJX9aX1Tl7KRA
	J0uB6MHiq9QwZ1MrU9KxJ1Xj1rqHHTe6VBSWKnyDHoGok898xGhaLoHrMetlQ+fW2OI/Q8
	k84NS4zOY2sUxz5ouGOhrVn87GhMq2fx0O7HC4t6oW+rR08ScfQzXJW3PYSZPyi9/MWMLU
	HOOfedfhT3fvrpchbiq9O7NYbJamkqzplj8BKk7qmDNUhVCb3WOR2IzpA/drQexsAYvpBm
	rb8zq0j+m5Hxs+RZUYi6wAjBZWd+l8pmdgCWtKxHd4C40GwRp2gAlLXizo98MQ==
X-GND-Sasl: luca.ceresoli@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 21BDB1BF204;
	Fri, 23 Jun 2023 10:53:24 +0000 (UTC)
Date: Fri, 23 Jun 2023 12:53:23 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: =?UTF-8?Q?Eil=C3=ADs?= 'pidge' =?UTF-8?Q?N=C3=AD_Fhlannag=C3=A1in?=
 <pidge@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v2 0/3] wayland/weston upgrades
Message-ID: <20230623125323.70aad0d1@booty>
In-Reply-To: <fbbc9e99-a727-ad08-42f3-06d4ec15cbd2@baylibre.com>
References: <cover.1687444823.git.pidge@baylibre.com>
	<20230623104629.2cbf4a53@booty>
	<fbbc9e99-a727-ad08-42f3-06d4ec15cbd2@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 10:53:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183319

Hello Eil=C3=ADs,

On Fri, 23 Jun 2023 11:21:29 +0100
Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibre.com> wrote:

> On 23/06/2023 09:46, Luca Ceresoli wrote:
> > Hello Eil=C3=ADs,
> >=20
> > On Thu, 22 Jun 2023 15:42:14 +0100
> > Eil=C3=ADs 'pidge' N=C3=AD Fhlannag=C3=A1in <pidge@baylibre.com> wrote:
> >  =20
> >> Nothing really surprising here, except we should note that launcher-lo=
gind is
> >> being depreciated so some thought on how that is dealt with will need =
to occur =20
> >=20
> > Should we file a bug in bugzilla to avoid forgetting about this? =20
>=20
> Yes, I'll assign it to myself. Alex had suggested we just require seatd=20
> which to me makes the most sense.

OK, so it I guess you should add it as soon as a future version of
this series is accepted, unless you have managed to handle this
properly by then.

Luca

--=20
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

