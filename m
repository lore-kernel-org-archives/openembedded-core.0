Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SvEB3-0004hz-Kg
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 23:03:57 +0200
Received: by wgbdr1 with SMTP id dr1so3331393wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jul 2012 13:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=r0ZDDHWINXmcZ0Rc6jxOTHqmMHW7+dof4nBxngplmyc=;
	b=s3XJ4+oP3dnRbx3dLzU49eOefCUEdxThZOKU5gHUMKqLtn4L733yUfdpRYV23Ukcop
	dYTQx/cjAtralnG07uPw62uPf/TmD3UimSp35iCYWFdVrmqR0/CzHyc0acsfwX1ifXw0
	uCc7+O+WGsX3saZda0lNE1VNi3aD/V2vjgbjVsM0woGW5o/i3TreGvXI9nN+D8d8CZqh
	4QNgoFA+ofclaPzpYOWY3f8YFKKinPhPwnSuoUY7tJleONBq0obobFWlFYgmvmgCEBk6
	LqPEOBwvHA19YR5HxnVX240qoOudx4EG6M1xStLG17p8xSISziUMC8jCy+6YGUU3KaeC
	bX/Q==
Received: by 10.216.134.20 with SMTP id r20mr3469117wei.61.1343508744156;
	Sat, 28 Jul 2012 13:52:24 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ck9sm9521307wib.2.2012.07.28.13.52.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 28 Jul 2012 13:52:23 -0700 (PDT)
Date: Sat, 28 Jul 2012 22:52:16 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: ml@communistcode.co.uk, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120728205216.GB3261@jama.jama.net>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
	<4d738395bf7cd05c924a9facf9677bab784cb1b6.1341763346.git.raj.khem@gmail.com>
	<5013C1BB.9020504@communistcode.co.uk>
	<CAMKF1spLQ5M7fpjninE_Gbyq=faW9V0psMN1Hb9NZKfXGDTMBg@mail.gmail.com>
	<5014425C.3090506@communistcode.co.uk>
	<20120728202414.GA3261@jama.jama.net>
	<50144DFD.4040408@communistcode.co.uk>
MIME-Version: 1.0
In-Reply-To: <50144DFD.4040408@communistcode.co.uk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 08/19] bison: Fix for gets being removed from eglibc 2.16
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Jul 2012 21:03:57 -0000
X-Groupsio-MsgNum: 26441
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+g7M9IMkV8truYOl"
Content-Disposition: inline

--+g7M9IMkV8truYOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 28, 2012 at 09:39:25PM +0100, Jack Mitchell wrote:
> On 28/07/2012 21:24, Martin Jansa wrote:
> > On Sat, Jul 28, 2012 at 08:49:48PM +0100, Jack Mitchell wrote:
> >> I'm not sure quite what you mean by pre-processed output but here is my
> >> do_compile log which is where it fails.
> >
> > He meant C source code after processing by preprocessor (-E option for
> > gcc), but it's not needed, see following patch.
> >
> > The problem was that patch was applied only for target recipe not
> > -native which is failing for you (I guess you have (e)glibc-2.16 on host
> > like I do)
> >
> > Cheers,
>=20
> Do you know what, I should have seen this as I applied my patch to the=20
> BASE_SRC_URI. My patch failed with the same message again in the SRC_URI=
=20
> and I thought I had just deleted Khems patch line and then re-added my=20
> patch line in the wrong function.
>=20
> I'll put it down to it being the weekend
>=20
> I do have glibc-2.16 on my host and it's causing me no end of trouble -=
=20
> but someone has be the lab rat eh and I'm not under commercial pressure=
=20
> quite yet ;) I'll have another eglibc do_install issue coming along soon=
=20
> as I can't seem to fix it.
>=20
> What would be the process to get the preprocessed output?

cd to dir where the build is failing, copy last gcc call which was
failing with gets, replace -c with -E and rename -o param to foo.E,
execute and then send foo.E

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--+g7M9IMkV8truYOl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAUUQAACgkQN1Ujt2V2gBzJFACfbJfDFtwOvaSeenr/r+tHp0io
JZgAoJiZsEurvElrtcJ2i5G3OYJC1VrP
=wWSr
-----END PGP SIGNATURE-----

--+g7M9IMkV8truYOl--
