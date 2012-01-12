Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RlNgJ-000170-HE
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jan 2012 17:39:15 +0100
Received: by eekd17 with SMTP id d17so636025eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2012 08:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2bsm2Q3dceUX+WjDXSHxpPNTufxUyfLLnNFIuSkwBC0=;
	b=WWfcpeoUp5CA2UwDSsBMPTBGvs/5zraEeOm03eyhAUCAmm169M4jV/pyc6T2XQ/T2V
	+nFoecpPRJXBKnXZrNb2E2cW6sdnHu/yumJMGPt5nTHuCOfXLJKZs+OpjlJBb0x+et1/
	BnFBODDv42RCPe+2jFao3SsPgOwqSNhi/4PSA=
Received: by 10.213.20.219 with SMTP id g27mr145150ebb.19.1326385900451;
	Thu, 12 Jan 2012 08:31:40 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id t59sm21297507eeh.10.2012.01.12.08.31.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jan 2012 08:31:39 -0800 (PST)
Date: Thu, 12 Jan 2012 17:31:28 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120112163127.GG3452@jama.jama.net>
References: <cover.1326216024.git.josh@linux.intel.com>
	<35eca064e6310d94b517b481beef5f5a5a3f395b.1326216024.git.josh@linux.intel.com>
	<4F0F08F4.4010505@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4F0F08F4.4010505@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 3/3] task-base: add alsa-state to task-base-alsa
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
X-List-Received-Date: Thu, 12 Jan 2012 16:39:15 -0000
X-Groupsio-MsgNum: 15887
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oXNgvKVxGWJ0RPMJ"
Content-Disposition: inline

--oXNgvKVxGWJ0RPMJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2012 at 08:23:16AM -0800, Darren Hart wrote:
>=20
>=20
> On 01/10/2012 09:39 AM, Joshua Lock wrote:
> > This enables automatic configuration setting and restoration on systems
> > with alsa.
> >=20
> > Signed-off-by: Joshua Lock <josh@linux.intel.com>
>=20
> Acked-by: Darren Hart <dvhart@linux.intel.com>

can we use VIRTUAL_RUNTIME for this, please?

for example in SHR we have alsa-state provided by fsoaudiod

Cheers,

>=20
> > ---
> >  meta/recipes-core/tasks/task-base.bb |    5 +++--
> >  1 files changed, 3 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/meta/recipes-core/tasks/task-base.bb b/meta/recipes-core/t=
asks/task-base.bb
> > index e0960b5..7460be4 100644
> > --- a/meta/recipes-core/tasks/task-base.bb
> > +++ b/meta/recipes-core/tasks/task-base.bb
> > @@ -2,7 +2,7 @@ DESCRIPTION =3D "Merge machine and distro options to cr=
eate a basic machine task/p
> >  LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://${COREBASE}/LICENSE;md5=3D3f40d7994397109=
285ec7b81fdeb3b58 \
> >                      file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> > -PR =3D "r72"
> > +PR =3D "r73"
> > =20
> >  inherit task
> > =20
> > @@ -183,7 +183,8 @@ RRECOMMENDS_task-base-vfat =3D "\
> > =20
> >  RDEPENDS_task-base-alsa =3D "\
> >      alsa-utils-alsactl \
> > -    alsa-utils-alsamixer"
> > +    alsa-utils-alsamixer \
> > +    alsa-state"
> > =20
> >  RRECOMMENDS_task-base-alsa =3D "\
> >      kernel-module-snd-mixer-oss \
>=20
> --=20
> Darren Hart
> Intel Open Source Technology Center
> Yocto Project - Linux Kernel
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oXNgvKVxGWJ0RPMJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8PCt8ACgkQN1Ujt2V2gBxe0ACeNYuqBlhaDnzwrxPR/2W+4ZX/
ITgAn3YPcc1+MRcieVfknwngD3SjShwD
=dm2/
-----END PGP SIGNATURE-----

--oXNgvKVxGWJ0RPMJ--
