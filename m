Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f193.google.com (mail-yb1-f193.google.com
	[209.85.219.193])
	by mail.openembedded.org (Postfix) with ESMTP id CCC106C42C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 15:57:56 +0000 (UTC)
Received: by mail-yb1-f193.google.com with SMTP id e128so2332465ybc.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2019 08:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=5ATbzj/P7ALAO2ZB1qMpL9kuxwoRpeWLQxKm0sAV9g0=;
	b=R6Qsn2RGHFhwItIb8fK3FDA3oHITTlhdzAwT9KM+ctLcu3ucWUV26JtkguxBuPa8wc
	3kOjVBeK4N3dHNsbXG6zAMKb2aBrPZ+4lw4cEoSCtX79w8ZKMSIMFHRdKvGiWghAKwIX
	VSNSyMNce3ZMogwUxyt2YCOLme0+OUPfBGwiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=5ATbzj/P7ALAO2ZB1qMpL9kuxwoRpeWLQxKm0sAV9g0=;
	b=PAcRNDUiGgBlLzXS3UkmGJCIENBAVQbgggHaMmrwKKnTYh4i2GNHB3w5YgxerwD+yq
	E0KMGTml7HHsSy+AJ1U4qRILNNxQDvjQKfxYBw+Nl9x7hL2ZPyWpktM3Q4EEqJQg9IYl
	HgUdcAFfe8ujBL+XbdwheUXB73wObFTDzL1D0YLSuTaQNtJ2jrYaZr1wpUIfLCjx1vQC
	k8X1ccDkFzv/pOApq4zMGscuPEpV99IzgT5N+hbITIOIOZvaf7F7ev2/ZGwaN0HlSj4S
	kB6SN1KR4axiYItNDHhEwxSFBbV7ZxfCwJIKsr6b14DtK2IUwITFtNfx4zQXo/gE2/lN
	G15w==
X-Gm-Message-State: APjAAAUyUwHhSlONHATTgjDHorxgiCOsZQ7ic4W/juWalQBOHd0eLWIY
	Un2uEBZT+bUGXpeW7dlf+pRErg==
X-Google-Smtp-Source: APXvYqwOVUsP6UnrB5I1iyLDba4zOoNKfWf006xbnyiVPjNqzhgBxcSfBHjLafiOwSqr8kifVX7p6g==
X-Received: by 2002:a25:4208:: with SMTP id p8mr1979693yba.413.1559231877607; 
	Thu, 30 May 2019 08:57:57 -0700 (PDT)
Received: from bill-the-cat
	(cpe-2606-A000-1401-82DE-655F-A2E8-A61C-402B.dyn6.twc.com.
	[2606:a000:1401:82de:655f:a2e8:a61c:402b])
	by smtp.gmail.com with ESMTPSA id g8sm267894ywb.69.2019.05.30.08.57.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 May 2019 08:57:55 -0700 (PDT)
Date: Thu, 30 May 2019 11:57:53 -0400
From: Tom Rini <trini@konsulko.com>
To: richard.purdie@linuxfoundation.org
Message-ID: <20190530155753.GS20781@bill-the-cat>
References: <321f3cb8-a101-49ad-07c4-64fc82d2c7f8@gmail.com>
	<d5b41b11583c78cd16d6393736fafd8e733c48a9.camel@linuxfoundation.org>
	<20190529212556.GO20781@bill-the-cat>
	<4571b3c03fb83ee01492dd1891e410becb72b0e5.camel@linuxfoundation.org>
	<20190529221726.GA16075@localhost>
	<20190529222920.GP20781@bill-the-cat>
	<20190529230203.GB16075@localhost>
	<aba82f4358b0479419ccc3412b83c052dce57bf4.camel@linuxfoundation.org>
	<ed68ff2b-e29e-54eb-f477-5026e45795dc@gmail.com>
	<9934d166bdb464e18d20ccb64f88fcebac019a07.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <9934d166bdb464e18d20ccb64f88fcebac019a07.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org, Adrian Bunk <bunk@stusta.de>
Subject: Re: [PATCH 2/2] uninative: Switch from bz2 to xz
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
X-List-Received-Date: Thu, 30 May 2019 15:57:57 -0000
X-Groupsio-MsgNum: 125201
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SvIVi2W53CI5vhWc"
Content-Disposition: inline

--SvIVi2W53CI5vhWc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 30, 2019 at 02:55:35PM +0100, richard.purdie@linuxfoundation.or=
g wrote:
> On Thu, 2019-05-30 at 06:32 -0700, akuster808 wrote:
> >=20
> > On 5/30/19 1:13 AM, richard.purdie@linuxfoundation.org wrote:
> > > On Thu, 2019-05-30 at 02:02 +0300, Adrian Bunk wrote:
> > > > On Wed, May 29, 2019 at 06:29:20PM -0400, Tom Rini wrote:
> > > > > On Thu, May 30, 2019 at 01:17:26AM +0300, Adrian Bunk wrote:
> > > > > > On Wed, May 29, 2019 at 10:29:31PM +0100,=20
> > > > > > richard.purdie@linuxfoundation.org wrote:
> > > > > > > On Wed, 2019-05-29 at 17:25 -0400, Tom Rini wrote:
> > > > > > > > On Wed, May 29, 2019 at 09:50:22PM +0100,=20
> > > > > > > > richard.purdie@linuxfoundation.org wrote:
> > > > > > > > > On Wed, 2019-05-29 at 13:39 -0700, akuster808 wrote:
> > > > > > > > > > On 5/29/19 12:26 PM,=20
> > > > > > > > > > richard.purdie@linuxfoundation.org
> > > > > > > > > > wrote:
> > > > > > > > > > > On Wed, 2019-05-29 at 12:21 -0700, akuster808
> > > > > > > > > > > wrote:
> > > > > > > > > > > > On 5/29/19 11:43 AM, Richard Purdie wrote:
> > > > > > > > > > > > > (From OE-Core rev:
> > > > > > > > > > > > > 29fc9210b973be68de474e75068e4c72371afe5a)
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > Signed-off-by: Richard Purdie <
> > > > > > > > > > > > > richard.purdie@linuxfoundation.org>
> > > > > > > > > > > > With back port to warrior and Thud too?
> > > > > > > > > > > Yes, we'll need to do that if we bring fedora 30
> > > > > > > > > > > workers online
> > > > > > > > > > > on
> > > > > > > > > > > the
> > > > > > > > > > > autobuilder.
> > > > > > > > > > I know the uninative update is required for FC30 but
> > > > > > > > > > changing the
> > > > > > > > > > compression does not.
> > > > > > > > > >=20
> > > > > > > > > > This question is about the compression extension
> > > > > > > > > > question.
> > > > > > > > > >=20
> > > > > > > > > > Does this mean YP will no longer be providing bz2
> > > > > > > > > > uninatives?
> > > > > > > > > Correct, the patch should be straight forward to
> > > > > > > > > include
> > > > > > > > > with the
> > > > > > > > > upgrade.
> > > > > > > > Does that in turn mean we must have host xz-utils?
> > > > > > > It will mean you need a tar which supports the -J option.
> > > > > > > The
> > > > > > > tests
> > > > > > > I've see so far suggest all our oldest supported distros
> > > > > > > do...
> > > > > > For thud tar >=3D 1.27 is required, -J was added in 1.22.
> > > > > >=20
> > > > > > But Tom is asking about something different:
> > > > > > tar calls "xz -d" for decompression, which needs xz-utils
> > > > > > installed.
> > > > > >=20
> > > > > > https://www.yoctoproject.org/docs/2.6/ref-manual/ref-manual.htm=
l#required-packages-for-the-build-host=20
> > > > > > documents that xz has to be installed, but looking at=20
> > > > > > meta/conf/bitbake.conf it might be missing in HOSTTOOLS.
> > > uninative runs in a weird early non-worker context and doesn't
> > > actually
> > > use HOSTTOOLS so luckily we're covered from that angle.
> > >=20
> > > > > I think it's also missing in for example the crops
> > > > > containers.  So
> > > > > if
> > > > > we're going to backport it, I think maybe we should keep it
> > > > > bz2?  The
> > > > > size difference can't be that much.
> > > > The size difference is surprisingly high - a factor of 5 (sic).
> > > > But in practice the difference between 5 MB and 26 MB
> > > > shouldn't really matter.
> > > I'm torn, partly as if we stick with bz2, we effectively do that
> > > perpetually and given the size difference, we should switch.
> > >=20
> > > Tim mentions we could fix the crops container and I'm tempted to
> > > switch
> > > given we're so close with the current patchset...
> > >=20
> > > We can add xz to HOSTTOOLS in master and that makes sense for a
> > > number
> > > of other reasons but gets tricky as we can't add it to
> > > ASSUME_PROVIDED
> > > as easily due to the libs it provides. I think we only need to
> > > worry
> > > about this on master though.
> > So.. Can we have a bz and xz version built until thud is in community
> > supported and update Warrior to use xz ?
>=20
> I think thud and warrior will work fine if we backport just the upgrade
> and the change to uninative.bbclass?
>=20
> I really don't want to try and do both.

To be honest, I'd really like to see thud/warrior keep the bz2 and
master switch.  Changing underlying host dependencies especially ones
that we hit on in special early threads seems like a bad idea.  I've
been doing too many "fun" things in containers of late, and CROPS might
be fine but bare Ubuntu containers aren't and this would be a very funky
error to diagnose.  Given we've released I think we need to err on the
side of consistency.

--=20
Tom

--SvIVi2W53CI5vhWc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJc7/2BAAoJEIf59jXTHXZSrdsQAKUHxAjKTckgmsqr6lkPx3xi
ItLOptRL0cKZWQykoiJwFOVdQb3nqoClcCHlhGy9x4HQvmpVB9HdLNj9kOFjvmSl
OF4xDXOheX/mfnh5q5uto6/3M/s5oYsD665+/U4KhWJms2MpHCmOFVDTbcWErhZr
P4fKsUb89DOzurszYM9vlopI6S/tm/WMDLW3Kb1dqjRp9zlhJjg032DxiC5Gb+A5
V2nu16/qy1nVN6b3dQIoIqjWaF4xhSAihZU+VTnCjyaLtwD8GAjm8ad92nZs0jAk
xUFy9Dg23Ddyq75yhB/8VsHiWpp+768cBggd2mKXlh79kMmpU7zi2Wk3nVZEpM0F
K5jVyYYvJv3taonWrbZJmPIoKSWrQlR3iFRgMSSlJzXVs0R+NGWqUKtlfi4Ip7r5
+JEkp3obPjKRWEhaKFcrYZRlkCq/PGhJNi+knhiYLZJcYVuvaK7Z4Te2MvQoLACb
rlUdwYVd846NUjoslj6LrQa+oF2sojaAi3s4cghwFqUWu/FyYJIizS7OfN0iGykQ
A6sjwxWvwVb9PTjn7Y8UENlayR9Q/dvPIPcxZqHuJRD5qC3lX0I0r71xLinPuwoA
Qae3xbM4QEwqFEkBovrfREAsBLGc+gXe1vNZ6O34Bim1P+sNzsCXkyiYYGnk5I7a
792A6JfWWMCNuxi+eJEn
=ix0y
-----END PGP SIGNATURE-----

--SvIVi2W53CI5vhWc--
