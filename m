Return-Path: <martin.jansa@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id D838061AD0;
	Wed, 22 May 2013 15:19:55 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id g10so1791825pdj.27
	for <multiple recipients>; Wed, 22 May 2013 08:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=yWSAsN8jxFltjisLe2ZKDZPluGFRSKkwTfgRzsD15Ao=;
	b=OIqbIwNhVVJ1wQz6SUc+Ah+I3TJ/5DgUqUU8NYIERLGCouCgtT+Ce1A0mVfsUlc4LV
	MkSz8HU8mVv66XOa2oDYT9+cCYc2V56Uys8oJtDFs3udq3WPdxKO344R/wghzdn9fVQB
	h6UTcsalH66B4/uOluZuImcdM3o47cI65SeUxF8W5Usu9qH1CYGAEHarenvfo2Gh7XE7
	W45BmxmRZs2J9Y7KQQw21RN91Qk4jwkLpTQrvzZHq4OLxaDKrAktubs4gmJXemRW+QqO
	gFPTpea5ZU8+2cwuxMIPoVF0kKGqqn78moccC1YoN9ff5I73y3SPVXoG2cqxOiYSP9jI
	w8Fg==
X-Received: by 10.66.11.164 with SMTP id r4mr8757752pab.221.1369235996486;
	Wed, 22 May 2013 08:19:56 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	al2sm7623385pbc.25.2013.05.22.08.19.53 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 22 May 2013 08:19:55 -0700 (PDT)
Date: Wed, 22 May 2013 17:19:50 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130522151950.GL32431@jama>
References: <CA+YB3rYf0Tt181v+zAqCwjKk74uP88Zoaht_+FMuS7ee2tJRfQ@mail.gmail.com>
	<519CCFFF.2060506@windriver.com> <20130522144925.GJ32431@jama>
	<3795534.7yd4ZVD7nC@helios>
MIME-Version: 1.0
In-Reply-To: <3795534.7yd4ZVD7nC@helios>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [oe] OE TSC Minutes 7 May 2013
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
X-List-Received-Date: Wed, 22 May 2013 15:19:56 -0000
X-Groupsio-MsgNum: 39598
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W/+CTqSGWdiRg+8j"
Content-Disposition: inline

--W/+CTqSGWdiRg+8j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 22, 2013 at 04:11:02PM +0100, Paul Eggleton wrote:
> On Wednesday 22 May 2013 16:49:25 Martin Jansa wrote:
> > Using combination of tabs and spaces in the same file (and even on the
> > same lines) is quite bad, because it looks different based on tab length
> > and can show wrong indentation in case like 8 spaces and 2
> > 4-character-wide tabs on next line (where author was seeing 18 spaces on
> > 2nd line)
> >=20
> > It was acked by 2 TSC members:
> > Koen:
> > http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/0=
9016
> > 2.html Khem:
> > http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/0=
9020
> > 3.html
> >=20
> > 3rd member of TSC and maintainer of some meta-oe layers, was aware of t=
his
> > change and wasn't complaining:
> > Paul:
> > http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/0=
9018
> > 4.html
>=20
> I didn't feel like I had good reason to object other than what had alread=
y=20
> been discussed. That should not be construed as me supporting the move. I=
 now=20
> regret not commenting further at the time.

I didn't say that you supported that, just that you was aware and didn't
complain about it being such a bad idea.

> The problem is we now have a split between how shell function indentation=
 is=20
> done in OE-Core and how it is done elsewhere, which as I'm sure you can=
=20
> understand is also a suboptimal situation.

The split was there before too, because more recipes were using some
number of spaces than recipes using tabs "correctly".

> > When this was discussed about a year ago in TSC, the most important
> > reason was complicating backports, you can read something about it my R=
FC:
> > http://lists.openembedded.org/pipermail/openembedded-devel/2013-April/0=
90135
> > .html Now close to creating dylan branch for meta-openembedded is imho =
best
> > time to do this, not many changes from released dylan will be backporte=
d to
> > danny, because people will start moving to newer release instead of
> > backporting more and more stuff to old one (also resolving possible
> > whitespace merge conflict it not hard).  Causing conflicts for merge was
> > IIRC most important reason why my proposal was rejected for oe-core.
>=20
> We've been through this with OE-Core. We do do a significant number of=20
> backports and it has been painful when whitespace has changed. The TSC=20
> decision was taken in order to avoid this.

Advantage with this is that if you backport patch with different whitespace,
worse you can cause is few spaces in shell task in danny recipe.

> > And TSC minutes which discussed it say:
> > Reluctant conclusion: tabs for shell, 4 spaces for python.
> >=20
> > So please stop trying to show it as action of one maintainer who
> > decided to go against TSC decision and to scr3w everybody.
>=20
> The problem with this is that you've effectively added pressure on Richar=
d to=20
> change the the policy in OE-Core despite the explicit decision not to mak=
e=20
> this change there.
>=20
> This kind of overall policy change *must* be done everywhere and not just=
 in=20
> one place or even the majority of places. We shouldn't ever need to be in=
 a=20
> position where OE-Core says you must do one thing and meta-oe and other l=
ayers=20
> say you must do the opposite.

That's why I was asking to change styleguide and allow new metadata to
be submitted with spaces, as it's only aestetic so changing styleguide
wouldn't force to change every recipe (the same as many recipes having
RDEPENDS next to DEPENDS instead of near the end of file next to
do_package and FILES_ etc.).=20

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--W/+CTqSGWdiRg+8j
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGc4hYACgkQN1Ujt2V2gByYNACfXc2ScnE8YuelqhV5bydGhuKS
/nUAn3eUSPrmXFkOZ4o65bQj9J0r9xSH
=yCeX
-----END PGP SIGNATURE-----

--W/+CTqSGWdiRg+8j--
