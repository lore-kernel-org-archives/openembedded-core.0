Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T28EC-0004Xb-Mk
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 00:07:44 +0200
Received: by wibhq4 with SMTP id hq4so976222wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 14:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=CA9BDtnQD7BN8WPiOsnweZthjoctLeuCbaBvRFC0uwg=;
	b=jHe9hstrUc32AbOpWBIztMEEV0iYoKbW9qY5RRwfMLCvf1PDYF+5NP1cGkw+fvYm/m
	BYJAX5dF+HhrOmM8PYrSNScYprog/4V5JRPenau5IaCKSqF705Uh1WA5dNPOEC1yui2M
	xRNb0sgieWhS8j6sHLQpdQXkUaxWSEPXmrfiTBXRQNhBk0g4FmoTVnz2oe6Lrtits79G
	Iy7gcUiFx5SRNq9XdeYfhC/LkkCqvLNOOyOY1UmodKffD79ma8cyaQo7I8PWMlBl5Tjv
	A2E9rjePlpzV7oMbcdbnf1IBzfLsUucqPsZliyBQRNwm3MlN8JlViNzXyPjIDck8fl0N
	RtLg==
Received: by 10.216.235.197 with SMTP id u47mr1350213weq.180.1345154146868;
	Thu, 16 Aug 2012 14:55:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm6178449wiz.4.2012.08.16.14.55.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 14:55:45 -0700 (PDT)
Date: Thu, 16 Aug 2012 23:55:42 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120816215542.GA3625@jama.jama.net>
References: <cover.1345047378.git.ross.burton@intel.com>
	<10192d7fd47ea041f73511eaa8b5e56c13152951.1345047378.git.ross.burton@intel.com>
	<20120815211232.GC3108@jama.jama.net>
	<CAJTo0LaKHbXJVAE3Y9jO1wDJYO5iyFAEMYM+U5cgGDhQ6xy+aQ@mail.gmail.com>
	<1345066801.7750.68.camel@x121e.pbcl.net>
	<CALbNGRQSzVnbgMZXeS2eWONCWbpdDRL3K7kGAJqj2Jq5dERDJw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQSzVnbgMZXeS2eWONCWbpdDRL3K7kGAJqj2Jq5dERDJw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 1/2] make: add make-replacement-native 3.81
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
X-List-Received-Date: Thu, 16 Aug 2012 22:07:44 -0000
X-Groupsio-MsgNum: 27642
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline

--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 16, 2012 at 10:30:37PM +0200, Andreas M=FCller wrote:
> On Wed, Aug 15, 2012 at 11:40 PM, Phil Blundell <philb@gnu.org> wrote:
> > On Wed, 2012-08-15 at 22:17 +0100, Burton, Ross wrote:
> >> On 15 August 2012 22:12, Martin Jansa <martin.jansa@gmail.com> wrote:
> >> > eglibc was failing to build with make-3.81
> >> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D2314
> >> >
> >> > so I guess once this is built (as webkit-gtk dependency), eglibc wil=
l maybe sometimes fail again..
> >>
> >> Interesting, this is the first time I've encountered 3.81 having
> >> problems.  So we can't use 3.81 and we can't use 3.82 either. :)
> >
> > You can use 3.81, you just need to install it either under a different
> > name (e.g. call it "make-3.81" and set $MAKE) or in a different
> > directory (e.g. ${bindir}/make-3.81/make and set $PATH) so that other
> > recipes don't pick it up unexpectedly.
> >
> > p.
> >
> The following is really dirty but at least to me it succeeds and to me
> it seems to have less influences than the 'make 3.81 dance':
>=20
> # dirty hack for gnu make 3.82 race condition
> do_compile() {
>     if [ x"$MAKE" =3D x ]; then MAKE=3Dmake; fi
>     bbnote make ${PARALLEL_MAKE} "$@"
>     for error_count in 1 2 3; do
>         bbnote "Number of trials: $error_count"
>         exit_code=3D0
>         make ${PARALLEL_MAKE} "$@" || exit_code=3D1
>         if [ $exit_code =3D 0 ]; then
>             break
>         fi
>     done
>     if [ ! $exit_code =3D 0 ]; then
>         die "oe_runmake failed"
>     fi
> }
>=20
> I have make 3.82 and before this I had 100% error at first do_compile.
> For rerun (without cleanup) I had 100% success. Now I get 100% success
> with make called twice. Would something like have a chance to be
> accepted?

Same for me, except I didn't go that far to reexecute make from recipe,
just executing feed build twice in for loop to be sure it will succeed.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlAtbF4ACgkQN1Ujt2V2gBzUOgCfbe6NdRkQ4i4kcwPVaPmFmEwD
B/QAn2zAocI9Wfpai1c06Zde9s0l8gqE
=sp+/
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--
