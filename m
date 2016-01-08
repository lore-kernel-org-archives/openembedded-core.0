Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id A084C731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jan 2016 17:00:22 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id f206so142435348wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jan 2016 09:00:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=McBXFBucQc80VsCHmVT73pHj7TnHhnNeV5Y8A19TOKs=;
	b=Q6AO2XfUg8oNR3qM1EuQhmEfC6+O1DB7PU9sx4PUsg0MiVAtaaaGV/zQvkzG4SQ0K0
	OTwJoTO7b8QpoqRjACfgSDog/leMUrpfIr/qaBIOj/9wVHD0wLoq3bM3qKArIYDPHm0s
	9kV2oyrqR4c6N0WHVlnx9RqGXteogHdrNO8qX2rdh4naR5kf0u5NoBPilPOAX/ccSFQd
	SgzquFEr6zTs0INQLhBE8jufzxkTEbIry0mCgSwkHBZbu8zBpX2dk7ivABZZdYTS9CVJ
	nSBh8Q7hCLozrC/phU4sDgJFpR0GyBAQA+SntQPrzIEodbhQk2HAi1bU6g1tD++2VKq+
	MS0w==
X-Received: by 10.194.172.35 with SMTP id az3mr138358499wjc.64.1452272423121; 
	Fri, 08 Jan 2016 09:00:23 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 73sm2371707wmm.7.2016.01.08.09.00.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jan 2016 09:00:21 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 8 Jan 2016 18:00:54 +0100
To: Andre McCurdy <armccurdy@gmail.com>
Message-ID: <20160108170054.GB2573@jama>
References: <1452256574-21587-1-git-send-email-Martin.Jansa@gmail.com>
	<1452257072-1799-1-git-send-email-Martin.Jansa@gmail.com>
	<CAJ86T=WNGGp=L358DSu2+VXM4eEdOz9FRcDBkGueUap80RjGBw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ86T=WNGGp=L358DSu2+VXM4eEdOz9FRcDBkGueUap80RjGBw@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2][RFC] arch-armv7ve.inc: respect armv7a override as well
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
X-List-Received-Date: Fri, 08 Jan 2016 17:00:25 -0000
X-Groupsio-MsgNum: 75730
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline

--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2016 at 08:24:36AM -0800, Andre McCurdy wrote:
> On Fri, Jan 8, 2016 at 4:44 AM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > * in all cases we currently have we consider armv7ve to be compatible w=
ith armv7a
>=20
> Is this a short term workaround or a long term solution?

It's just RFC for discussion.

> If it's a long term solution then how will armv7m and armv7r be
> handled? They are likely to need to duplicate a lot of the current
> armv7a over-rides too.

armv7a and armv7ve are much closer than armv7a and armv7m or armv7r as
Khem said in earlier discussion. And maybe it's because fewer people use
armv7[rm], but currently these 2 aren't used anywhere as overrides (in
layers I've in world builds).

> Maybe adding a generic "armv7" over-ride which can be enabled by all
> armv7 variants is a better option?

Maybe, but that will change how armv7r and armv7m are currently built, I
cannot say if for better or worse, I don't use either.

> Either way, I'd like to continue cleaning up of the existing armv7a
> over-rides (e.g. the libav armv7a specific optimisation is likely
> bogus and should be removed, etc).
>=20
>=20
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > ---
> >  meta/conf/machine/include/arm/arch-armv7ve.inc | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/machine/include/arm/arch-armv7ve.inc b/meta/conf=
/machine/include/arm/arch-armv7ve.inc
> > index 79e1ef6..d0fdff7 100644
> > --- a/meta/conf/machine/include/arm/arch-armv7ve.inc
> > +++ b/meta/conf/machine/include/arm/arch-armv7ve.inc
> > @@ -3,7 +3,8 @@ DEFAULTTUNE ?=3D "armv7ve"
> >  TUNEVALID[armv7ve] =3D "Enable instructions for ARMv7ve"
> >  TUNECONFLICTS[armv7ve] =3D "armv4 armv5 armv6 armv7 armv7a"
> >  TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve', ' -=
march=3Darmv7ve', '', d)}"
> > -MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve'=
, 'armv7ve:', '' ,d)}"
> > +# In all cases we currently have we consider armv7ve to be compatible =
with armv7a
> > +MACHINEOVERRIDES =3D. "${@bb.utils.contains('TUNE_FEATURES', 'armv7ve'=
, 'armv7ve:armv7a:', '' ,d)}"
> >
> >  require conf/machine/include/arm/arch-armv6.inc
> >  require conf/machine/include/arm/feature-arm-neon.inc
> > --
> > 2.7.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaP60UACgkQN1Ujt2V2gBz4uQCfcbLuQESdVVgd9BKq9uomwMMc
vSgAn1VaLZRolc92Eb89HTPVYrgDZBln
=DjFC
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--
