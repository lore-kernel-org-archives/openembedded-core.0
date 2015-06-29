Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id F1ABC60670
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 11:28:20 +0000 (UTC)
Received: by wiwl6 with SMTP id l6so96486055wiw.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 04:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=iVepU2dXoQbj8U6w/wKvaz6+PkJ28V8/4sTbw+6/zkE=;
	b=F2wuAlJwqW+fFxHpPGuejlhox1+3MMHlNg2aCg/hqu25NYXdC7o0gcqvgQtHO0OU06
	zh5jWhoGZx6Rl4TW4tnCaNEqxrT5TO8eQ5E+0lWDQ1Rj5Siyrjpka1gloaL54mEaqNBi
	3ZZ3zseYJbR/eYuOZ+yW2seVREAQmBRlhMZrnGztYgcfgJL1iEeiQ4um90RvNwIhilSs
	6Ahuu91bADKSBEVzTUYxpwisicegS1zvD+kTDjxgqf/rLcwQYMRK16RinWJR2v2s6sSk
	HG86kQG+7gCSDV/4KqOtmCiN1lPTsGoE/PnUM1KMlDpadL2iDHWaE09doY4a+3/GczCA
	Z5CA==
X-Received: by 10.180.23.8 with SMTP id i8mr22154310wif.39.1435577301155;
	Mon, 29 Jun 2015 04:28:21 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id r6sm11711257wiy.13.2015.06.29.04.28.19
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jun 2015 04:28:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 29 Jun 2015 13:28:26 +0200
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20150629112826.GD2393@jama>
References: <cover.1433349512.git.raj.khem@gmail.com>
	<0d3de82d935f6408e5c04ff980a2b3fd4a9e4ac3.1433349512.git.raj.khem@gmail.com>
	<CAHiDW_GjW0PSnNRGekiYkg+qdhg=xbbmiVhWY95cv6GxQPJ1Bw@mail.gmail.com>
	<5E0378F8-62E0-4A7F-AB07-0209CD229BF3@gmail.com>
	<CAJTo0Lb0S_b4Wnb0dWmVae9Ezmn=dB0G2=DFyEjD2nivoa6Jfw@mail.gmail.com>
	<AB12494C-E7B7-4FD0-B3E2-72E5E91F3714@gmail.com>
	<CAJTo0LYMx1XcXf3TkPpTz3a_pn-z3VOaPG-YheKyJJwOeF_eEw@mail.gmail.com>
	<C0962A50-1D80-44B2-AA1C-E03C75459071@gmail.com>
MIME-Version: 1.0
In-Reply-To: <C0962A50-1D80-44B2-AA1C-E03C75459071@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] wayland/weston/libinput: Upgrade to 1.6.0 -> 1.8.0
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
X-List-Received-Date: Mon, 29 Jun 2015 11:28:21 -0000
X-Groupsio-MsgNum: 67276
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1sNVjLsmu1MXqwQ/"
Content-Disposition: inline

--1sNVjLsmu1MXqwQ/
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2015 at 10:37:57AM -0700, Khem Raj wrote:
>=20
> > On Jun 26, 2015, at 9:59 AM, Burton, Ross <ross.burton@intel.com> wrote:
> >=20
> > On 26 June 2015 at 16:19, Khem Raj <raj.khem@gmail.com <mailto:raj.khem=
@gmail.com>> wrote:
> > From a system integrators point of view, I agree with your sentiments. =
=46rom a developers point of view not so much. We already have many recipes=
 already fetching from git and more and more switching to use it see qt5 la=
tely, there are perfectly fine tarballs released for QT5 too, just because =
its simpler to developer and integrate packages.
> >=20
> > But oe-core is a system for integrating software...  If you're doing lo=
ts of work against weston, then a bbappend to change the SRC_URI to a git r=
epository isn't exactly hard work.
>=20
> yes and its done like that and what you are saying is that we limit OE to=
 not help there. Its fine. We are now in a phase where we should be upstrea=
ming the patches we are hosting in meta data for OE or elsewhere and git ba=
sed workflow makes it easy for such work atleast for components which use g=
it upstream. Preparing in same sandbox and test them out becomes simpler.
>=20
> >=20
> > Tarballs give us much smaller downloads, the security of checksums, and=
 the general assurance that you're building what the maintainer expects you=
 to build.
>=20
> then we patch it on top of tarballs maintainer doesn=E2=80=99t want you t=
o do that as well isnt it ?
> its lot easier to maintain using a SCM when we have patches and usually t=
here are patches in OE. In any case, I will post a tarball version, and ove=
rride the SRC_URI internally its not an issue its just another one thing to=
 maintain on top of others. if thats what community wants, but I will need =
more folks to also express there usecase and opinion moving forward this is=
 applicable to many components.

We did this in few cases earlier and I hate it, mostly because the
foo_1.2.3.bbappend changes SRC_URI and git and usually also sets PV to
something newer, so

foo_1.2.3.bb + foo_1.2.3.bbappend is building version 2.0+git which is
at least a bit confusing.

Other option of foo.bb in our layer with:
  require meta/recipes-bar/foo/foo_1.2.3.bb
  PV =3D "2.0+gitr${SRCPV}"
  ....
is also a bit annoying e.g. when upgrading oe-core and parsing failing
because foo_1.2.3.bb was upgraded to foo_1.2.4.bb by uprev script in
oe-core.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--1sNVjLsmu1MXqwQ/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlWRK9kACgkQN1Ujt2V2gByMagCgj2kYEkE7nmpH8CKccc6N3NLv
Q0kAoICJmhZqKVWyf5iLU2Iv9r7/UTrN
=J/jI
-----END PGP SIGNATURE-----

--1sNVjLsmu1MXqwQ/--
