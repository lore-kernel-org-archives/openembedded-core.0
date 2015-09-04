Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 90BB673D27
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 15:47:19 +0000 (UTC)
Received: by wicfx3 with SMTP id fx3so26943802wic.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 08:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=HTcXt9mLyYRCPuOa+04XuYCnPbzPyoRhvT84hHGeuSY=;
	b=sZDRsS5ppr1hsy+zutDHI6Qw95AvmKNkkONuadv7qNtgtquKyB/0BldpAU6cGExOl6
	9bJN3Mbrn6XikENJkc5l3c8R/PCPsT+vlQU1WHP0TiJPLk8V3aTdXz5p0wM1CnrQ5u73
	RMKAGvClVJvRtDyR2kVEvTUb2sHu3CrySJ+fGj5WC1AivNWJ2pU9Eyso5DlEYmqNCSHA
	CxK+Rq0AI0DyH/5H9Lwhlc6oEnf6oiUnrOAEieCVHXcnhnhT/GbopHdpevE+NhcfCP6c
	Ft0soLmv8tjRVrYck7nu4KVehkW4fSQqn/S6J1tZjTcbI1RMIkdMV4AgTFfa9FUDq32N
	ZNbw==
X-Received: by 10.194.171.129 with SMTP id au1mr8856914wjc.115.1441381639064; 
	Fri, 04 Sep 2015 08:47:19 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id eu2sm4886757wic.8.2015.09.04.08.47.17
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 04 Sep 2015 08:47:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 4 Sep 2015 17:47:50 +0200
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20150904154750.GC2457@jama>
References: <1441380461.24871.171.camel@linuxfoundation.org>
	<2CF81DE4-D260-4561-AE95-F321C093AE13@gmail.com>
	<1441380800.24871.173.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1441380800.24871.173.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcmode-default: Set gcc 5.2 as the default
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
X-List-Received-Date: Fri, 04 Sep 2015 15:47:20 -0000
X-Groupsio-MsgNum: 70685
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fig2xvG2VGoz8o/s"
Content-Disposition: inline

--Fig2xvG2VGoz8o/s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 04, 2015 at 04:33:20PM +0100, Richard Purdie wrote:
> On Fri, 2015-09-04 at 08:29 -0700, Khem Raj wrote:
> > > On Sep 4, 2015, at 8:27 AM, Richard Purdie <richard.purdie@linuxfound=
ation.org> wrote:
> > >=20
> > > -GCCVERSION ?=3D "4.9%"
> > > +GCCVERSION ?=3D "5.2%"
> >=20
> > a small nit. Make it 5.% to logically indicate that 5.x is a bug fix re=
lease and next big upgrade will be
> > 6.x
>=20
> I'm not sure this would be a good idea. We have had 4.8 alongside 4.9
> and can imagine doing something like that with newer 5.x releases
> depending on how they work out. I doubt 5.2% hurts anything, apart from
> needing to tweak that file slightly more often...

But that was before GCC changed versioning scheme in 5, see
"Version Numbering Scheme for GCC 5 and Up" section in
https://gcc.gnu.org/develop.html

Having 5.1 alongside 5.2 isn't the same as 4.8 alongside 4.9 was.

I agree with Khem.

Ross: I agree that even small point release has to be tested, but this
variable is useful only to have multiple versions alongside each other,
which shouldn't be the case for 5.1 and 5.2 (or even 5.2.0 and 5.2.1 in
your example).

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Fig2xvG2VGoz8o/s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlXpvSUACgkQN1Ujt2V2gBxDYACgskGsZnjNkz+OUZx4CkJaRx44
IacAnisbh+PqkEWWEiwc2UW6iJpXDced
=YXUN
-----END PGP SIGNATURE-----

--Fig2xvG2VGoz8o/s--
