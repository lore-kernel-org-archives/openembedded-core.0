Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TDZDe-0000q5-3r; Mon, 17 Sep 2012 13:10:26 +0200
Received: by wibhn17 with SMTP id hn17so1829804wib.6
	for <multiple recipients>; Mon, 17 Sep 2012 03:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=R+MEII3qpJ5ZmaZPQZZV74fgsStXvYd/jic8U+rnsVc=;
	b=Pr1gl9KH8fuD24LcJxHR3aBaPGe+9VzVQmYiOyuKPAPXr4Cl1oqnW2R/1UwydlCUZb
	QXbZQ1UqN1jCNQSIixVZ174902P25B6LvGfARbpsMVYnhlIydue+F8wkmMWtIpurRGRZ
	XbdnnwLEDRVMUFyZPi0d3y+cr5w4GwEJgqb3qMX5+w1F1P3vN7/G4y5UHba6Ym5xHZUS
	x/XX+C06+pUq+/p4rt9ejGQ7BPZfjMY6Ib1O70Qb4nScCCfG99zNMtBGWNh4ORPTQV/m
	elh5H8JeQToKNc8o2J9qQtpMGXAVmrdSLDTWr5Fj5gF0qurOSr3cP/2bniD3bTITo9vG
	gyKg==
Received: by 10.216.242.196 with SMTP id i46mr5592350wer.123.1347879467633;
	Mon, 17 Sep 2012 03:57:47 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id dp8sm25116617wib.3.2012.09.17.03.57.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Sep 2012 03:57:45 -0700 (PDT)
Date: Mon, 17 Sep 2012 12:57:52 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Message-ID: <20120917105752.GD3628@jama.jama.net>
References: <20120914085706.2CBFC103C3@opal>
	<20120915162051.GA11051@jama.jama.net>
	<CAK18fxGHn8aMu9Y926M2r9RQULR2VTOciBJkVD5S9awBV_j7-Q@mail.gmail.com>
	<20120915163739.GB11051@jama.jama.net>
MIME-Version: 1.0
In-Reply-To: <20120915163739.GB11051@jama.jama.net>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-commits@lists.openembedded.org,
	openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [O-core] [oe-commits] Andrei Dinu : libffi upgrade to 3.0.11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Sep 2012 11:10:26 -0000
X-Groupsio-MsgNum: 29375
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pZs/OQEoSSbxGlYw"
Content-Disposition: inline

--pZs/OQEoSSbxGlYw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 15, 2012 at 06:37:39PM +0200, Martin Jansa wrote:
> On Sat, Sep 15, 2012 at 07:22:43PM +0300, Andrei Gherzan wrote:
> > On Sat, Sep 15, 2012 at 7:20 PM, Martin Jansa <martin.jansa@gmail.com>w=
rote:
> >=20
> > > On Fri, Sep 14, 2012 at 08:57:06AM +0000, git@git.openembedded.org wr=
ote:
> > > > Module: openembedded-core.git
> > > > Branch: master
> > > > Commit: 3e40136e8bd13b17b6d88b6acfb5ed162bb8d96a
> > > > URL:
> > > http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=
=3D3e40136e8bd13b17b6d88b6acfb5ed162bb8d96a
> > > >
> > > > Author: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> > > > Date:   Thu Sep 13 11:26:45 2012 +0300
> > > >
> > > > libffi upgrade to 3.0.11
> > >
> > > This changes .so name from libffi5 to libffi6, breaking every recipe
> > > depending on libffi when someone is using debian.bbclass.
> > >
> > > This list of 374 packages is probably not complete, just what I have
> > > built before.
> > >
> > > http://build.shr-project.org/tests/jama/libffi5.pkgs
> >=20
> >=20
> > Confirmed. Just ran into this with glib-2.0.
>=20
> Something like:
> | /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-lin=
ux/gcc/x86_64-oe-linux/4.7.2/ld: warning: libffi.so.5, needed by /OE/shr-co=
re/tmp-eglibc/sysroots/q
> emux86-64/usr/lib/libgobject-2.0.so, not found (try using -rpath or -rpat=
h-link)
> | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: =
undefined reference to `ffi_type_void'
> | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: =
undefined reference to `ffi_type_double'
> | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: =
undefined reference to `ffi_prep_cif'
> | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: =
undefined reference to `ffi_type_sint32'
> | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: =
undefined reference to `ffi_type_float'
> | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: =
undefined reference to `ffi_type_uint64'
> | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: =
undefined reference to `ffi_type_sint64'
> | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: =
undefined reference to `ffi_type_pointer'
> | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: =
undefined reference to `ffi_type_uint32'
> | /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: =
undefined reference to `ffi_call'
>=20
> That's easy to fix by manual rebuild, but for runtime packages we need th=
ose PR bumps :/.
>=20
> I'll PR bump recipes (from my list) in meta-oe and meta-smartphone layers=
,=20
> but leave oe-core for someone else.

PR bumps for recipes from my list sent to oe-core too, but again it's
probably not complete (only stuff included in one of images I build).

Someone should build world-image to test the rest..

Cheers,
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--pZs/OQEoSSbxGlYw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBXAjAACgkQN1Ujt2V2gBwGjwCgprv377w8jXMzrk26oYqfbcvn
SPcAni4ZRXKauAfzimjF3SFqeZMBnJp6
=iSzh
-----END PGP SIGNATURE-----

--pZs/OQEoSSbxGlYw--
