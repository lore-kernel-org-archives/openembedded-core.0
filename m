Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TCvZM-0004AZ-T0; Sat, 15 Sep 2012 18:50:12 +0200
Received: by wgbdq11 with SMTP id dq11so1296700wgb.24
	for <multiple recipients>; Sat, 15 Sep 2012 09:37:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=5mtz2a+PTG5u7zGt6wtG2slMmLmsz/bxnN/eQBPDgzs=;
	b=QwUTl3Qx31H4V5NZ91bdZZDuIjzRnKL86QXgdvXIHchUmNZLpT4EmVWldM4DptKTFz
	+hKYAuiu0pgE1fTxa/khwEHAhqHcpX1Datv/ly1f13i1fqVMJkgyvUKvT+DbNWQ6Rv/D
	zNuUC7Fd/YTQwGfCEq1K28PFH4vOF2Hvpfm/cMHRl+gm0xOmwSanqbAEzxumrJWimPTo
	hmD7c6j/zLCbykoqHbTFBYZRK5ijAypg2/e1pNtW2+gDObs42fj64tHqI3TG23mtVmPn
	vJaQl6VxPpCDmeOwt4BplF0UJPnq64ic9YdyY51erAy5zzjDCOvRR69yCopfzNhRJ66V
	/e4Q==
Received: by 10.180.84.164 with SMTP id a4mr5598288wiz.12.1347727056214;
	Sat, 15 Sep 2012 09:37:36 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l6sm6081648wiz.4.2012.09.15.09.37.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 15 Sep 2012 09:37:35 -0700 (PDT)
Date: Sat, 15 Sep 2012 18:37:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Andrei Gherzan <andrei@gherzan.ro>
Message-ID: <20120915163739.GB11051@jama.jama.net>
References: <20120914085706.2CBFC103C3@opal>
	<20120915162051.GA11051@jama.jama.net>
	<CAK18fxGHn8aMu9Y926M2r9RQULR2VTOciBJkVD5S9awBV_j7-Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAK18fxGHn8aMu9Y926M2r9RQULR2VTOciBJkVD5S9awBV_j7-Q@mail.gmail.com>
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
X-List-Received-Date: Sat, 15 Sep 2012 16:50:13 -0000
X-Groupsio-MsgNum: 29353
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Pd0ReVV5GZGQvF3a"
Content-Disposition: inline

--Pd0ReVV5GZGQvF3a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 15, 2012 at 07:22:43PM +0300, Andrei Gherzan wrote:
> On Sat, Sep 15, 2012 at 7:20 PM, Martin Jansa <martin.jansa@gmail.com>wro=
te:
>=20
> > On Fri, Sep 14, 2012 at 08:57:06AM +0000, git@git.openembedded.org wrot=
e:
> > > Module: openembedded-core.git
> > > Branch: master
> > > Commit: 3e40136e8bd13b17b6d88b6acfb5ed162bb8d96a
> > > URL:
> > http://git.openembedded.org/?p=3Dopenembedded-core.git&a=3Dcommit;h=3D3=
e40136e8bd13b17b6d88b6acfb5ed162bb8d96a
> > >
> > > Author: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> > > Date:   Thu Sep 13 11:26:45 2012 +0300
> > >
> > > libffi upgrade to 3.0.11
> >
> > This changes .so name from libffi5 to libffi6, breaking every recipe
> > depending on libffi when someone is using debian.bbclass.
> >
> > This list of 374 packages is probably not complete, just what I have
> > built before.
> >
> > http://build.shr-project.org/tests/jama/libffi5.pkgs
>=20
>=20
> Confirmed. Just ran into this with glib-2.0.

Something like:
| /OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux=
/gcc/x86_64-oe-linux/4.7.2/ld: warning: libffi.so.5, needed by /OE/shr-core=
/tmp-eglibc/sysroots/q
emux86-64/usr/lib/libgobject-2.0.so, not found (try using -rpath or -rpath-=
link)
| /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: un=
defined reference to `ffi_type_void'
| /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: un=
defined reference to `ffi_type_double'
| /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: un=
defined reference to `ffi_prep_cif'
| /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: un=
defined reference to `ffi_type_sint32'
| /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: un=
defined reference to `ffi_type_float'
| /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: un=
defined reference to `ffi_type_uint64'
| /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: un=
defined reference to `ffi_type_sint64'
| /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: un=
defined reference to `ffi_type_pointer'
| /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: un=
defined reference to `ffi_type_uint32'
| /OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib/libgobject-2.0.so: un=
defined reference to `ffi_call'

That's easy to fix by manual rebuild, but for runtime packages we need thos=
e PR bumps :/.

I'll PR bump recipes (from my list) in meta-oe and meta-smartphone layers,=
=20
but leave oe-core for someone else.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Pd0ReVV5GZGQvF3a
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBUrtMACgkQN1Ujt2V2gBzEfQCgnmBoh1StK5V/PSeHZUax50M6
jLMAn3X3iRFneEB5b6Pyiqw/jAKBYJkU
=BoKt
-----END PGP SIGNATURE-----

--Pd0ReVV5GZGQvF3a--
