Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id D9BF26067C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 14:47:48 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id f65so32160022wmi.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jul 2016 07:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+hJZnTzoZmV5I9ueHLoOq31gLv8NsMEd73PfBYHVbkc=;
	b=xFqJ+4/vi4xQS+eR+tlWU/aJ+yKK5MZGvdYuRUdfUld7gKyICbDLmW2umhxOHSEnyT
	P/ctlmxtuOtmQJXIZQD5dVkSaVx+qOqjVFVuXT2fCDB8AMCo3H6lbtF0UEqBECZYLBv8
	Fxhdt/PmkmlalXkc6rtdiTCvrdn0xjYZ9o0lU5+yolOyxz3Nc7evoi/t1/oDEJ9iaVq7
	s97yDwh0veX9TKiweGvysUFxtaxvglg8Dm5Ad5K0H3el5ipqWYyetPaWdFXDwc69oHVf
	AIHyfmWl2i2nfm9RRhob3W4BGdk3jkchOl2TQ6Q8s+2qJOzFHUcDK1Xs9FPd0+cGhfqJ
	h+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+hJZnTzoZmV5I9ueHLoOq31gLv8NsMEd73PfBYHVbkc=;
	b=OyRZLgVy5LIaZK8+UsMqgIH0yh1NOxfjZo6onimSQu3t3eOYuEsIOZJAd8zsl08Suv
	CH8RsGBxxw8PLeuAUWavSzAfCzLPPZAztGqfWEwNEX07Nwpvo3u92B4Kke+Q/MBDPubY
	DzwakqwLbIgmd4fPv0TwawQUOO4RUtIZ6PKiZf9msdc5XDWM3IB6TiG0Z3WUts6ewQJb
	C89pcMPpatwUxhQ2Sb3Jymtor9wNrRW0JDh+2zUAQLJuE/SMMAUPWXmivg6YB3Fzi2K4
	9pjWFgrTAOT6hXFqToazUvU2k89r0KI0FqBXSwXMH9/O024CzvTgSOIkR+qWc2VAQjFn
	YCSw==
X-Gm-Message-State: ALyK8tIMHIxRY3gZu6F6ML+0Ih6Bq4YDTfkavvwMbbsDRzjbnpsoS1VbFTmnhptgdvN4yw==
X-Received: by 10.194.201.72 with SMTP id jy8mr1428738wjc.95.1468421268986;
	Wed, 13 Jul 2016 07:47:48 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	i207sm1194243wmf.0.2016.07.13.07.47.47
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Jul 2016 07:47:47 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 13 Jul 2016 16:47:58 +0200
To: Gary Thomas <gary@mlbassoc.com>
Message-ID: <20160713144758.rojziiocjimyuy3d@jama>
References: <20160713142422.aihj4b5qmni7uair@jama>
	<57865303.30805@mlbassoc.com>
MIME-Version: 1.0
In-Reply-To: <57865303.30805@mlbassoc.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Downloads from sourceforge.net
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
X-List-Received-Date: Wed, 13 Jul 2016 14:47:49 -0000
X-Groupsio-MsgNum: 84467
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="blrc62mlmv3xebnp"
Content-Disposition: inline

--blrc62mlmv3xebnp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2016 at 04:41:07PM +0200, Gary Thomas wrote:
> On 2016-07-13 16:24, Martin Jansa wrote:
> > Just FYI
> >
> > If you're seeing a lot of do_fetch failures because of SRC_URI checksums
> > mismatch, be aware that there is some issue with sourceforge.net, all my
> > source archive downloads (with wget) download just this HTML:
> >
> > wget http://downloads.sourceforge.net/project/gptfdisk/gptfdisk/0.8.10/=
gptfdisk-0.8.10.tar.gz
> >
> > <html><head>
> > <title>SourceForge</title>
> > <!-- <script src=3D"/js/jquery.com/jquery-1.11.0.min.js"></script> -->
> > <script src=3D"//code.jquery.com/jquery-1.11.0.min.js"></script>
> > <script src=3D"//sourceforge.net/js/mirrors.js"></script>
> > <script src=3D"/js/sf.js"></script>
> > <script>
> > var DR_loc =3D DR_parse_hash_url();
> > if (DR_loc) {
> >      DR_sf_main(DR_loc);
> > } else {
> >      window.location.href =3D 'http://sourceforge.net/home.html';
> > }
> > </script>
> > </head><body>
> > <noscript>
> > We're sorry -- the Sourceforge site is currently in Disaster Recovery m=
ode, and currently requires
> > the use of javascript to function.  Please check back later.
> > </noscript>
> > </body></html>
> >
> > Which of course has different checksums than tarball with sources.
> >
> > You can see similar message if you try to access e.g. their blog (to fi=
nd out if it's already
> > known issue for them):
> > http://sourceforge.net/blog/
> > or
> > http://sourceforge.net/blog/category/sitestatus/
> >
> > Until it's resolved continue to use your better-be-already-populated pr=
emirrors.
>=20
> It seems to have been short lived - I had this issue with docbook-xsl-1.7=
9.1.tar.bz2
> and the second time I tried it (a few minutes later) it was fine.

Not for me, I'm seeing it repeatedly for many archives over last 2 days
(in job which intentionally runs without premirror to verify
download-ability).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--blrc62mlmv3xebnp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleGVJ0ACgkQN1Ujt2V2gBwg4QCgn9DEFRtm/zJD3PXeNH71WEkA
So4An20aTsgP9c7+Jnvi2steOLdVPBO6
=V0FR
-----END PGP SIGNATURE-----

--blrc62mlmv3xebnp--
