Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.7352.1615375648095311932
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Mar 2021 03:27:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: kory.maincent@bootlin.com)
X-Originating-IP: 78.113.208.92
Received: from kmaincent-XPS-13-7390 (92.208.113.78.rev.sfr.net [78.113.208.92])
	(Authenticated sender: kory.maincent@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 75A416000A;
	Wed, 10 Mar 2021 11:27:25 +0000 (UTC)
Date: Wed, 10 Mar 2021 12:27:24 +0100
From: "Kory Maincent" <kory.maincent@bootlin.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/6] perf: fix reproducibility issues
Message-ID: <20210310122724.1cd55d60@kmaincent-XPS-13-7390>
In-Reply-To: <20210310114234.1b838cd8@kmaincent-XPS-13-7390>
References: <cover.1615317549.git.bruce.ashfield@gmail.com>
	<0e2ab3111ac8446d0657e8f4d8d400f50f4e245b.1615317549.git.bruce.ashfield@gmail.com>
	<20210310114234.1b838cd8@kmaincent-XPS-13-7390>
Organization: bootlin
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Mar 2021 11:42:34 +0100
K=C3=B6ry Maincent <kory.maincent@bootlin.com> wrote:

> Hello Bruce,
>=20
> On Tue,  9 Mar 2021 14:23:36 -0500
> "Bruce Ashfield" <bruce.ashfield@gmail.com> wrote:
>=20
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >=20
> > perf has been failing our reproducible testing due to multiple symbols
> > containg build paths. =20
>=20
> There is still reproducible issues:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/89/ste=
ps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/115/builds/84/ste=
ps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/116/builds/86/ste=
ps/13/logs/stdio
>=20
> Here is the diffoscope log:
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210310-pc9v=
zt2k/packages/diff-html/

The other logs:
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210310-kd_osa=
ed/packages/diff-html/
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20210310-lxiszb=
i_/packages/diff-html/

>=20
> Regards,
>=20
> K=C3=B6ry
