Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web10.7253.1608281538949977588
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Dec 2020 00:52:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: kory.maincent@bootlin.com)
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net [78.113.208.212])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id CC05724001B;
	Fri, 18 Dec 2020 08:52:15 +0000 (UTC)
Date: Fri, 18 Dec 2020 09:52:14 +0100
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, "thomas.petazzoni@bootlin.com"
 <thomas.petazzoni@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] ltp: fix rpc build error
Message-ID: <20201218095214.267d7c2a@kmaincent-XPS-13-7390>
In-Reply-To: <ce781b6c4aa644f3ba1f322396065bcb@XBOX03.axis.com>
References: <20201217140756.30688-1-kory.maincent@bootlin.com>
	<ce781b6c4aa644f3ba1f322396065bcb@XBOX03.axis.com>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Peter,

On Thu, 17 Dec 2020 16:21:20 +0000
Peter Kjellerstedt <peter.kjellerstedt@axis.com> wrote:

> >=20
> >  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> >=20
> > +export libdir :=3D "${exec_prefix}/${baselib}"
> > +export incdir :=3D "${exec_prefix}/include" =20
>=20
> This should be a little bit better:
>=20
> export libdir :=3D "${libdir}"
> export incdir :=3D "${incdir}"

Thanks,
I did not notice but it brings an error and I sent a V3 with it.
Your review returns this error:
bb.data_smart.ExpansionError: Failure expanding variable incdir,
expression was ${incdir} which triggered exception Exception: variable incd=
ir
references itself!


Regards,

K=C3=B6ry,


