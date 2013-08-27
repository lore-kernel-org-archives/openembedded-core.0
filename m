Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by mail.openembedded.org (Postfix) with ESMTP id A2F6C61F47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 18:14:47 +0000 (UTC)
Received: by mail-ee0-f48.google.com with SMTP id l10so2447428eei.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 11:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5QCbNQS4Ew0r1cC9pDSEqxQcglakVDMVsNBO+iX/ab8=;
	b=G1oCyRh6AcS2OR3ne94Kvrl+6qGF/Vw0tOBI8E0lb6RmR4OmK0xZAp7/X1/vKanbnh
	lAHfWbBl8GMn/evMlgaemzZvDjXifoY2GDX+1/SmKwPdJZVeU75ehDG1iWavXq2hDlTQ
	BG3bcSdwS3BbXjCnKgRW0jJhZexcZ34Cc/YIDXVPsflilakah0XtRS1IG+P85ZbHdpvQ
	CQOYB+vErE+Qv76+WC2GWq+gNg4ByTDCxxreYrobftRDNymucRoX0NT6Hz2hWhu/MvKq
	MaU2cSqUnR9IxVvDbTFjOHAeb8bCjVNIbLIaGahsn8P1fFoV+2EJrlnmbI1OKXyo7owx
	BQ7w==
X-Received: by 10.15.81.132 with SMTP id x4mr7753eey.100.1377627287779;
	Tue, 27 Aug 2013 11:14:47 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	f49sm31070299eec.7.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 27 Aug 2013 11:14:47 -0700 (PDT)
Date: Tue, 27 Aug 2013 20:15:58 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20130827181558.GA3544@jama>
References: <cover.1372456294.git.raj.khem@gmail.com>
	<317e5f0060239db963b826eb9b569170cf9e07dd.1372456294.git.raj.khem@gmail.com>
	<20130826133254.GR3544@jama>
	<677CFE60-700A-4057-92B5-58E6BB906202@gmail.com>
	<20130827074531.GU3544@jama> <20130827074818.GV3544@jama>
	<A0DA14FE-EC85-4F83-93CA-E704C828501D@gmail.com>
MIME-Version: 1.0
In-Reply-To: <A0DA14FE-EC85-4F83-93CA-E704C828501D@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 12/24] python3: Add recipes
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
X-List-Received-Date: Tue, 27 Aug 2013 18:14:49 -0000
X-Groupsio-MsgNum: 44149
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u3gIr+u2NK768I+f"
Content-Disposition: inline

--u3gIr+u2NK768I+f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2013 at 11:10:34AM -0700, Khem Raj wrote:
>=20
> On Aug 27, 2013, at 12:48 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
> >>=20
> >> python3_3.3.2.bb: Add liblzma to RDEPENDS for python3-misc
> >>=20
> >> doesn't look like right fix, something in python3-misc is linked to
> >> liblzma
> >>=20
> >> DEBUG: calculating shlib requirements for python3-misc
> >> DEBUG: python3-misc: Dependency libpython3.3m.so.1.0 requires package =
libpython3
> >> DEBUG: python3-misc: Dependency libc.so.6 requires package eglibc
> >> DEBUG: python3-misc: Dependency liblzma.so.5 requires package liblzma
> >> DEBUG: python3-misc: Dependency libbz2.so.0 requires package libbz2
> >> DEBUG: python3-misc: Dependency libcrypt.so.1 requires package eglibc
> >>=20
> >> so you should add it to DEPENDS not RDEPENDS (Adding it to RDEPENDS
> >> hides this message from test-dependencies.sh, but support for lzma in
> >> python3-misc would stay nondeterministic).
>=20
>=20
> why ? wont RDEPENDS ask for getting it built before ?

before do_package but not before do_configure

>=20
> >=20
> > That something is python lzmamodule packaged in python3-misc :)
> >=20
> > setup.py:
> >        # LZMA compression support.
> >        if self.compiler.find_library_file(lib_dirs, 'lzma'):
> >            exts.append( Extension('_lzma', ['_lzmamodule.c'],
> >                                   libraries =3D ['lzma']) )
> >        else:
> >            missing.append('_lzma')
> >=20
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--u3gIr+u2NK768I+f
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.21 (GNU/Linux)

iEYEARECAAYFAlIc7N4ACgkQN1Ujt2V2gBwmZACfVLHPvQtyG25mzYmDmLRxuSWm
8KIAoLiCIHZBa9Nv20bEaJk57D/bZMo4
=LCdw
-----END PGP SIGNATURE-----

--u3gIr+u2NK768I+f--
