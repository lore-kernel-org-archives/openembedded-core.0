Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web08.7374.1608375806367660059
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Dec 2020 03:03:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: kory.maincent@bootlin.com)
Received: from kmaincent-XPS-13-7390 (212.208.113.78.rev.sfr.net [78.113.208.212])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id C5279100008;
	Sat, 19 Dec 2020 11:03:23 +0000 (UTC)
Date: Sat, 19 Dec 2020 12:03:20 +0100
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, thomas.petazzoni@bootlin.com
Subject: Re: [OE-core] [PATCH v2] ltp: fix rpc build error
Message-ID: <20201219120320.3f318211@kmaincent-XPS-13-7390>
In-Reply-To: <befdc92a15ad20dc490201f6f87a56e79fe5714e.camel@linuxfoundation.org>
References: <20201217140756.30688-1-kory.maincent@bootlin.com>
	<befdc92a15ad20dc490201f6f87a56e79fe5714e.camel@linuxfoundation.org>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Dec 2020 13:36:10 +0000
Richard Purdie <richard.purdie@linuxfoundation.org> wrote:
> > @@ -42,14 +42,14 @@ inherit autotools-brokensep pkgconfig
> > =20
> >  TARGET_CC_ARCH +=3D "${LDFLAGS}"
> > =20
> > +export libdir :=3D "${exec_prefix}/${baselib}"
> > +export incdir :=3D "${exec_prefix}/include" =20
>=20
> In general we try and avoid :=3D, is there a reason its needed here
> rather than just "=3D" ? If so, it might be something that should be
> mentioned in the commit message?

Ok, the point was to avoid these ${incdir} and ${libdir} get modified by the
"export ${prefix}". In fact, I need to do it only with the PKG_CONFIG_PATH
variable. Yes, I will mention it.

Regards,

K=C3=B6ry

>=20
> Cheers,
> Richard
>=20
