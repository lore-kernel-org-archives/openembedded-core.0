Received: from relay13.mail.gandi.net (relay13.mail.gandi.net [217.70.178.233])
 by mx.groups.io with SMTP id smtpd.web11.8917.1615297660631978703
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Mar 2021 05:47:41 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.233, mailfrom: kory.maincent@bootlin.com)
Received: from kmaincent-XPS-13-7390 (92.208.113.78.rev.sfr.net [78.113.208.92])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay13.mail.gandi.net (Postfix) with ESMTPSA id 18E2A80009;
	Tue,  9 Mar 2021 13:47:35 +0000 (UTC)
Date: Tue, 9 Mar 2021 14:47:34 +0100
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Richard Purdie
 <richard.purdie@linuxfoundation.org>, bluelightning@bluelightning.org,
 Alexandre Belloni  <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH v7] util-linux: split uuid in separate recipe to allow bootstrapping
Message-ID: <20210309144734.7203cbb7@kmaincent-XPS-13-7390>
In-Reply-To: <c8159284d8980632a111126f61885e401a1eac90.camel@gmail.com>
References: <20201210184632.3448265-1-luca.boccassi@gmail.com>
	<20210305110218.24635-1-luca.boccassi@gmail.com>
	<58bcb66c9e15d4121defef93cb6b34266fd89037.camel@linuxfoundation.org>
	<20210309121859.053dbeb1@kmaincent-XPS-13-7390>
	<c8159284d8980632a111126f61885e401a1eac90.camel@gmail.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 09 Mar 2021 13:26:55 +0000
Luca Boccassi <luca.boccassi@gmail.com> wrote:

> >=20
> > It miss also the Maintainer description for linux-util-uuid recipe:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/1901/=
steps/14/logs/stdio
> >=20
> > Regards,=20
> >=20
> > K=C3=B6ry =20
>=20
> Hi,
>=20
> The DESCRIPTION field is in the util-linux.inc which is included by the
> recipe. Or is that something else entirely? What is it, precisely?
>=20

Sorry I was not enough explicit.
When you add a new recipe to oe-core you need to update the file:
meta/conf/distro/include/maintainers.inc

Regards,

K=C3=B6ry
