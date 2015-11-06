Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 763C175EE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 13:18:14 +0000 (UTC)
Received: by wmww144 with SMTP id w144so29978124wmw.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 06 Nov 2015 05:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=QEXEbgPEhnl3xwdDap1m0vYPX3i4vlBGOXjxPxK23Lo=;
	b=WDOn9pqTL9fypII1qXIIiECfcKj6GBU0RjtCcpBltGpGJQe3Z0z/N7U7bRMvwL1boF
	Kt1km7uRtDlUWfBYOTlC9NFtgB/qMwu7Ya1T0vKA6lw0nF04Zu07GOFv2yx2Opr5xeas
	7DFfU5UcZR8LCK1TBmS6E0L16G/ltnTo1+3JzSTGYk4BXC0RBSMJ+Gq2w9cJc8nufxfP
	GDkiUD2PDyEvLdK2eZZ+6qlMCqQmZ3RTrAh9LrXBf56IasF3xNNcZ0t/1JgkINk5jW4c
	Zp5pCvmZHmL+vYlMqBiS3ECOTVGtc7BJE6uw05iN1g/pi94pkJiAbkpEAE1YKlXWXEZG
	n1zw==
X-Received: by 10.28.55.7 with SMTP id e7mr9557055wma.18.1446815894474;
	Fri, 06 Nov 2015 05:18:14 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id b1sm131987wjx.12.2015.11.06.05.18.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Nov 2015 05:18:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 6 Nov 2015 14:18:31 +0100
To: Mike Crowe <mac@mcrowe.com>
Message-ID: <20151106131831.GA2550@jama>
References: <1446734821-6011-1-git-send-email-mac@mcrowe.com>
	<CAJ86T=WxqbJ83S4RESL_oKX9gYNg6-aAPGUYR3btSQBhKQo-1g@mail.gmail.com>
	<20151106103004.GA7454@mcrowe.com>
MIME-Version: 1.0
In-Reply-To: <20151106103004.GA7454@mcrowe.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] bitbake.conf, module.bbclass: Support opting out of legacy EXTRA_OEMAKE
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Nov 2015 13:18:19 -0000
X-Groupsio-MsgNum: 72994
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2015 at 10:30:04AM +0000, Mike Crowe wrote:
> On Friday 06 November 2015 at 01:16:46 -0800, Andre McCurdy wrote:
> > On Thu, Nov 5, 2015 at 6:47 AM, Mike Crowe <mac@mcrowe.com> wrote:
> > > Give recipes and classes the ability to opt out of EXTRA_OEMAKE
> > > containing the legacy value without removing other recipe-specific or
> > > local additions.
> >=20
> > Isn't this possible already from within a recipe or class by using
> >=20
> >   EXTRA_OEMAKE =3D ...
> >=20
> > instead of
> >=20
> >   EXTRA_OEMAKE +=3D ...
> >=20
> > ie what autotools.bbclass, kernel.bbclass and many recipes do already.
> >=20
> > For the specific case of module.bbclass, changing the EXTRA_OEMAKE
> > assignment to '=3D' might require some recipes to be tweaked to so that
> > they "inherit module" before adding their own options to EXTRA_OEMAKE,
> > but it seems like a cleaner solution?
>=20
> It would be, but I was afraid of what I might break. I suspect that there
> are many unseen third-party and local recipes that inherit module.bbclass.
>=20
> It would be great to get to the point that EXTRA_OEMAKE is empty by defau=
lt
> but I imagine that the experts are already aware of the difficulties with
> doing this which is why the current value has lasted so long.

Is it really good goal to get rid of "-e"?

I know that the environment used in bitbake tasks is already well
defined and controlled, but I still find a bit more control with -e to
be useful in many cases.

I know I'll be able to return -e where useful, but what's the main
advantage of removing it from default?

Regards,

>=20
> Mike.
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlY8mwoACgkQN1Ujt2V2gBw3LgCfcrucweLDJRG64uHwP0OtDlMG
bZYAn00sDbS0ijTAVWe6jBwDJokic2V0
=rlGP
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
