Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGsea-0002wU-Pl
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 16:31:56 +0200
Received: by bkcjk7 with SMTP id jk7so325197bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 07:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2JSL0LpjVoiMjjXPy6yZyGJtgwDN3VHCF1KGUDloW5w=;
	b=QySDyfIUoK2OxbdeH0xHskpBdy8yfA5S3bTjJez0YxzrekV56FxzAKn3EX6HsywaU0
	d2lwNfsNOanL8wPMH9mfD8Mv2qx+xbN5U5Y0tFQe46Jza+bElCuz16TJ5daLjrHsCHbd
	uV0hPMBbP0xLYm3hv1jUbHoFXmbB+u+qNBCrWuYqMvby9MKI76r/y3/70i++bVXj9gOe
	LpqD6PfPweIM4ahBr6SQ+4XInsDCySHDZWPNMaA/oXcAnlhxwdEUpDmvPYvWEQ9oe7Uy
	Nhb+ZpVlNdJsrPvVEfwf3sXS/T9LcrCrezDnEgkyu5i0mqXNMkT4GUd+IEe7EE7R5p/i
	CbKg==
Received: by 10.204.130.152 with SMTP id t24mr498559bks.138.1348669146166;
	Wed, 26 Sep 2012 07:19:06 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u23sm977940bks.11.2012.09.26.07.19.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 07:19:05 -0700 (PDT)
Date: Wed, 26 Sep 2012 16:19:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120926141912.GO3313@jama.jama.net>
References: <1348570313-16920-1-git-send-email-Martin.Jansa@gmail.com>
	<1348575933.8662.48.camel@ted>
	<20120925123652.GI3295@jama.jama.net>
	<1348577188.8662.53.camel@ted>
	<20120926135548.GN3313@jama.jama.net>
	<1348668628.8662.115.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1348668628.8662.115.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC][PATCH] linux-yocto: drop machine from SRCREV_FORMAT
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
X-List-Received-Date: Wed, 26 Sep 2012 14:31:56 -0000
X-Groupsio-MsgNum: 29933
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="gqEssfNGWsEa4HfM"
Content-Disposition: inline

--gqEssfNGWsEa4HfM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 26, 2012 at 03:10:28PM +0100, Richard Purdie wrote:
> On Wed, 2012-09-26 at 15:55 +0200, Martin Jansa wrote:
> > On Tue, Sep 25, 2012 at 01:46:28PM +0100, Richard Purdie wrote:
> > > On Tue, 2012-09-25 at 14:36 +0200, Martin Jansa wrote:
> > > > On Tue, Sep 25, 2012 at 01:25:33PM +0100, Richard Purdie wrote:
> > > > > On Tue, 2012-09-25 at 12:51 +0200, Martin Jansa wrote:
> > > > > > * otherwise LOCALCOUNT is incremented after each MACHINE switch=
 when=20
> > > > > >   machine usually has different SRCREV (e.g. because of differe=
nt KBRANCH)
> > > > > > * see http://lists.linuxtogo.org/pipermail/openembedded-core/20=
12-September/029392.html
> > > > > >=20
> > > > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > > > ---
> > > > > >  meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
> > > > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > >=20
> > > > > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/r=
ecipes-kernel/linux/linux-yocto.inc
> > > > > > index 973970d..6efb578 100644
> > > > > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > > > @@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE ?=3D "standard"
> > > > > >  # KMETA ?=3D ""
> > > > > >  KBRANCH ?=3D "master"
> > > > > >  KMACHINE ?=3D "${MACHINE}"
> > > > > > -SRCREV_FORMAT ?=3D "meta_machine"=20
> > > > > > +SRCREV_FORMAT ?=3D "meta"=20
> > > > > > =20
> > > > > >  LINUX_VERSION_EXTENSION ?=3D "-yocto-${LINUX_KERNEL_TYPE}"
> > > > >=20
> > > > > No, absolutely not. I have discussed this with Bruce before and t=
here
> > > > > are no guarantees that the meta branch gets updated whenever mach=
ine
> > > > > changes. This is necessary to have deterministic builds and corre=
ctness
> > > > > of sstate for example.
> > > >=20
> > > > Isn't SRCREV_FORMAT used only to construct PV? So builds are still
> > > > deterministic because SRCREV is still locked to same value?
> > >=20
> > > PV is what triggers the system to rebuild. So if its not included,
> > > rebuilds won't happen when the revisions change.
> >=20
> > PR bump too and also sstate checksum change when OEBasicHash is enabled=
, right?
>=20
> PR changes will trigger a rebuild, yes. A SRCREV change will not trigger
> a sstate change unless some dependency is added from fetch -> SRCREV
> though, regardless of which hash system is used.

So is PR bump enough or not? Well I gave up, I cannot build qemuarm
anyway because of arm tune issue..

Cheers,

>=20
> > > > Also PV which keeps changing without any change in source or metada=
ta
> > > > doesn't look deterministic to me.
> > >=20
> > > I agree there is a problem, this is just not the right way to fix it,
> > > the problem is elsewhere, likely in the git fetcher. Making the
> > > revisions in the sqlite database respect components of STAMP/WORKDIR =
is
> > > probably the way we'll end up having to fix this (so some database
> > > entries are machine specific, some arch specific, some allarch).
> >=20
> > I still don't get your point in this case, see bellow:
> >=20
> > Build core-image-minimal
> > bitbake -k core-image-minimal
> > ...
> > NOTE: Tasks Summary: Attempted 1489 tasks of which 1242 didn't need to =
be rerun and all succeeded.
> >=20
> > Apply:
> > diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipe=
s-kernel/linux/linux-yocto_3.4.bb
> > index 2f8f957..3380688 100644
> > --- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > +++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
> > @@ -7,7 +7,7 @@ SRCREV_machine_qemuarm ?=3D "8f05f1d8adbf1551a80225049d=
d381ffbb64a6c5"
> >  SRCREV_machine_qemumips  ?=3D "fb23a2ed7b94548b1736fdb55efb26f88bc5c17=
1"
> >  SRCREV_machine_qemuppc ?=3D "cdecf5940d81330680ce1517a7bc101556792e71"
> >  SRCREV_machine_qemux86 ?=3D "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
> > -SRCREV_machine_qemux86-64 ?=3D "3fa06aa29078fdb2af431de2d3fdae7d281ba8=
5f"
> > +SRCREV_machine_qemux86-64 ?=3D "00709f7f01c3a10252f030f0bdacecbb349d7b=
e4"
> >  SRCREV_machine ?=3D "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
> >  SRCREV_meta ?=3D "8bdc655034a58a7147176a8a882d81e2fd51e4b9"
> >=20
> > and indeed linux-yocto is rebuilt:
> > bitbake -k core-image-minimal
> > ...
> > NOTE: recipe linux-yocto-3.4.11+git3+5bdc655034a58a7147176a8a882d81e2fd=
51e4b9-r4.3: task do_fetch: Started
> > NOTE: recipe linux-yocto-3.4.11+git3+5bdc655034a58a7147176a8a882d81e2fd=
51e4b9-r4.3: task do_fetch: Succeeded
> > ...
> > NOTE: Tasks Summary: Attempted 1489 tasks of which 1456 didn't need to =
be rerun and all succeeded.
> >=20
> > Because do_validate_branches checksum is different:
> > $ bitbake-diffsigs \
> >   stamps.1348666953/qemux86-64/qemux86_64-oe-linux/linux-yocto-3.4.11+g=
it3+5bdc655034a58a7147176a8a882d81e2fd51e4b9-r4.3.do_validate_branches.sigd=
ata.8de0c7968171d72ceef34c16693adcdc=20
> >   stamps.1348667138/qemux86-64/qemux86_64-oe-linux/linux-yocto-3.4.11+g=
it3+5bdc655034a58a7147176a8a882d81e2fd51e4b9-r4.3.do_validate_branches.sigd=
ata.91568475cd863438643fffa047e66e3e
> > basehash changed from 7cbacf9af68c92988dbf5e23fc57dafc to aa3c320a8a796=
14aadf94084c06fe9ba
> > Variable SRCREV_machine value changed from 00709f7f01c3a10252f030f0bdac=
ecbb349d7be4 to 3fa06aa29078fdb2af431de2d3fdae7d281ba85f
> >=20
> > So it _does_ trigger rebuild when SRCREV_machine is changed (even witho=
ut it in SRCREV_FORMAT).
> >=20
> > And if every SRCREV_machine change is accompanied with PR bump or with =
PR service it will=20
> > also increment pkg version for target to upgrade it.
>=20
> So by luck, do_validate_branches changes checksum since it probably
> references those variable names explicitly. do_fetch however did not and
> should have. That is a serious problem and proves my point. So this
> change is not safe and must not go in.
>=20
> The real problem is in the git fetcher and needs to be fixed there,
> anything else is just working around it.
>=20
> Cheers,
>=20
> Richard
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--gqEssfNGWsEa4HfM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBjDuAACgkQN1Ujt2V2gBzSpwCfbXLZ3NPBn3FDSCFvUnvPvcg3
rbwAni//Y/fZozHHR7BMPgGew4hLYZWx
=mvHA
-----END PGP SIGNATURE-----

--gqEssfNGWsEa4HfM--
