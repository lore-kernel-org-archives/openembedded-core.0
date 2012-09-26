Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TGsHv-00023F-Jo
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 16:08:31 +0200
Received: by wibhn17 with SMTP id hn17so670554wib.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 06:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AqdQrEJfPLpSolggSECV+LnXotjbqvKLOMqin9PjBhE=;
	b=gLS54pA+uPYUOMPFcvXP5GUhmsxe4qBp1hkRE5Z2NvJ6+/boNzbvqE5EnbG7wxUxVG
	erCqryJCANdN3xK8jhYVnoklHxSQdZ9Uq2SCncweCTrZE+1+uYSTfW4CH6SGy3+KRRBc
	X8mmKdOSRpVB9hjyuUOYFTT77nWvaFHVQuTTVWweWFVOSqdYirq6eiYURcwzD5qeST20
	IKX2FyO5jRzgL0g5UBtCxkLTW//5WBBQJdruO0X9TX37kPTPAmVADOHkoGLDvpSihNBh
	9hVRDZ495zZYelF190JnutrBSCo4EZbxW2XuYX+E2/HQpOk7U6FdnqP373TIIEm1QUHH
	3ZyA==
Received: by 10.180.109.129 with SMTP id hs1mr1762304wib.0.1348667741185;
	Wed, 26 Sep 2012 06:55:41 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id k2sm7027043wiz.7.2012.09.26.06.55.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 06:55:40 -0700 (PDT)
Date: Wed, 26 Sep 2012 15:55:48 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20120926135548.GN3313@jama.jama.net>
References: <1348570313-16920-1-git-send-email-Martin.Jansa@gmail.com>
	<1348575933.8662.48.camel@ted>
	<20120925123652.GI3295@jama.jama.net>
	<1348577188.8662.53.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1348577188.8662.53.camel@ted>
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
X-List-Received-Date: Wed, 26 Sep 2012 14:08:31 -0000
X-Groupsio-MsgNum: 29924
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4Y142/9l9nQlBiaj"
Content-Disposition: inline

--4Y142/9l9nQlBiaj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 25, 2012 at 01:46:28PM +0100, Richard Purdie wrote:
> On Tue, 2012-09-25 at 14:36 +0200, Martin Jansa wrote:
> > On Tue, Sep 25, 2012 at 01:25:33PM +0100, Richard Purdie wrote:
> > > On Tue, 2012-09-25 at 12:51 +0200, Martin Jansa wrote:
> > > > * otherwise LOCALCOUNT is incremented after each MACHINE switch whe=
n=20
> > > >   machine usually has different SRCREV (e.g. because of different K=
BRANCH)
> > > > * see http://lists.linuxtogo.org/pipermail/openembedded-core/2012-S=
eptember/029392.html
> > > >=20
> > > > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> > > > ---
> > > >  meta/recipes-kernel/linux/linux-yocto.inc | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >=20
> > > > diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recip=
es-kernel/linux/linux-yocto.inc
> > > > index 973970d..6efb578 100644
> > > > --- a/meta/recipes-kernel/linux/linux-yocto.inc
> > > > +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> > > > @@ -16,7 +16,7 @@ LINUX_KERNEL_TYPE ?=3D "standard"
> > > >  # KMETA ?=3D ""
> > > >  KBRANCH ?=3D "master"
> > > >  KMACHINE ?=3D "${MACHINE}"
> > > > -SRCREV_FORMAT ?=3D "meta_machine"=20
> > > > +SRCREV_FORMAT ?=3D "meta"=20
> > > > =20
> > > >  LINUX_VERSION_EXTENSION ?=3D "-yocto-${LINUX_KERNEL_TYPE}"
> > >=20
> > > No, absolutely not. I have discussed this with Bruce before and there
> > > are no guarantees that the meta branch gets updated whenever machine
> > > changes. This is necessary to have deterministic builds and correctne=
ss
> > > of sstate for example.
> >=20
> > Isn't SRCREV_FORMAT used only to construct PV? So builds are still
> > deterministic because SRCREV is still locked to same value?
>=20
> PV is what triggers the system to rebuild. So if its not included,
> rebuilds won't happen when the revisions change.

PR bump too and also sstate checksum change when OEBasicHash is enabled, ri=
ght?

> > Also PV which keeps changing without any change in source or metadata
> > doesn't look deterministic to me.
>=20
> I agree there is a problem, this is just not the right way to fix it,
> the problem is elsewhere, likely in the git fetcher. Making the
> revisions in the sqlite database respect components of STAMP/WORKDIR is
> probably the way we'll end up having to fix this (so some database
> entries are machine specific, some arch specific, some allarch).

I still don't get your point in this case, see bellow:

Build core-image-minimal
bitbake -k core-image-minimal
=2E..
NOTE: Tasks Summary: Attempted 1489 tasks of which 1242 didn't need to be r=
erun and all succeeded.

Apply:
diff --git a/meta/recipes-kernel/linux/linux-yocto_3.4.bb b/meta/recipes-ke=
rnel/linux/linux-yocto_3.4.bb
index 2f8f957..3380688 100644
--- a/meta/recipes-kernel/linux/linux-yocto_3.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_3.4.bb
@@ -7,7 +7,7 @@ SRCREV_machine_qemuarm ?=3D "8f05f1d8adbf1551a80225049dd381=
ffbb64a6c5"
 SRCREV_machine_qemumips  ?=3D "fb23a2ed7b94548b1736fdb55efb26f88bc5c171"
 SRCREV_machine_qemuppc ?=3D "cdecf5940d81330680ce1517a7bc101556792e71"
 SRCREV_machine_qemux86 ?=3D "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
-SRCREV_machine_qemux86-64 ?=3D "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
+SRCREV_machine_qemux86-64 ?=3D "00709f7f01c3a10252f030f0bdacecbb349d7be4"
 SRCREV_machine ?=3D "3fa06aa29078fdb2af431de2d3fdae7d281ba85f"
 SRCREV_meta ?=3D "8bdc655034a58a7147176a8a882d81e2fd51e4b9"

and indeed linux-yocto is rebuilt:
bitbake -k core-image-minimal
=2E..
NOTE: recipe linux-yocto-3.4.11+git3+5bdc655034a58a7147176a8a882d81e2fd51e4=
b9-r4.3: task do_fetch: Started
NOTE: recipe linux-yocto-3.4.11+git3+5bdc655034a58a7147176a8a882d81e2fd51e4=
b9-r4.3: task do_fetch: Succeeded
=2E..
NOTE: Tasks Summary: Attempted 1489 tasks of which 1456 didn't need to be r=
erun and all succeeded.

Because do_validate_branches checksum is different:
$ bitbake-diffsigs \
  stamps.1348666953/qemux86-64/qemux86_64-oe-linux/linux-yocto-3.4.11+git3+=
5bdc655034a58a7147176a8a882d81e2fd51e4b9-r4.3.do_validate_branches.sigdata.=
8de0c7968171d72ceef34c16693adcdc=20
  stamps.1348667138/qemux86-64/qemux86_64-oe-linux/linux-yocto-3.4.11+git3+=
5bdc655034a58a7147176a8a882d81e2fd51e4b9-r4.3.do_validate_branches.sigdata.=
91568475cd863438643fffa047e66e3e
basehash changed from 7cbacf9af68c92988dbf5e23fc57dafc to aa3c320a8a79614aa=
df94084c06fe9ba
Variable SRCREV_machine value changed from 00709f7f01c3a10252f030f0bdacecbb=
349d7be4 to 3fa06aa29078fdb2af431de2d3fdae7d281ba85f

So it _does_ trigger rebuild when SRCREV_machine is changed (even without i=
t in SRCREV_FORMAT).

And if every SRCREV_machine change is accompanied with PR bump or with PR s=
ervice it will=20
also increment pkg version for target to upgrade it.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--4Y142/9l9nQlBiaj
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBjCWQACgkQN1Ujt2V2gBxuTQCfRbsYR16UAa/mRsirOZ8zXp1l
U7QAniOD1ANUyawrJCR/rVEKVkUbjQ/b
=veTj
-----END PGP SIGNATURE-----

--4Y142/9l9nQlBiaj--
