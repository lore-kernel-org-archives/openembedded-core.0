Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ShaSn-0003kR-R0
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 08:01:53 +0200
Received: by wgbdr1 with SMTP id dr1so184174wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jun 2012 22:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=JhtyFa8+fY6O/AhnQs5I3FuYSg/nXK1YHm//Slenmzg=;
	b=ziUrxqP4LnzFQk90LfWK/E77DrVb0IhoR1ZSslmDsNwp50o5bY2xrGuJ7uqLjDDNPo
	C25hY3mCuRqS+kw/wsuqrsRCbBYvkcpShzkWqkq6mq1s5hzozgPlFClMY5xbPPmkx/Te
	r/j73eJqv6/ymrdAEAdn1BkF/z4xc6yeehdv8bqsoYaRRpUsLr6yEMPcLvm8Kx7w+rT+
	91keU9eO8Jtt5ORKKiIh9BNAQyPU+D0/BiJskouW0m5bxMhSZv3MA1M74vGXL46qkFNv
	qf47gZed9CoaCJ9sE+zLIIQsLeR8Oe2iS/xxTS7LzQKQ6ugumGPi3jhEN/0qv2o2FSeE
	ORtg==
Received: by 10.216.27.199 with SMTP id e49mr5493670wea.45.1340257868275;
	Wed, 20 Jun 2012 22:51:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ei4sm84498583wid.5.2012.06.20.22.51.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jun 2012 22:51:07 -0700 (PDT)
Date: Thu, 21 Jun 2012 07:51:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20120621055106.GC9352@jama.jama.net>
References: <1340091730-5993-1-git-send-email-Martin.Jansa@gmail.com>
	<4FE28985.1000501@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <4FE28985.1000501@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] opkg-utils: bump SRCREV
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
X-List-Received-Date: Thu, 21 Jun 2012 06:01:54 -0000
X-Groupsio-MsgNum: 23919
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NKoe5XOeduwbEQHU"
Content-Disposition: inline

--NKoe5XOeduwbEQHU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 20, 2012 at 07:40:05PM -0700, Saul Wold wrote:
> On 06/19/2012 12:42 AM, Martin Jansa wrote:
> > * there are 2 small fixes
> >    python-2.6 compatibility
> >    missing C option for opkg-build
> >
> > Signed-off-by: Martin Jansa<Martin.Jansa@gmail.com>
> > ---
> >   .../opkg-utils/opkg-utils/shr.patch                |   26 +++++++++++=
+++++++++
> >   meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |    2 +-
> >   2 files changed, 27 insertions(+), 1 deletions(-)
> >   create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/shr.pa=
tch
> >
> > diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/shr.patch b/me=
ta/recipes-devtools/opkg-utils/opkg-utils/shr.patch
> > new file mode 100644
> > index 0000000..29de962
> > --- /dev/null
> > +++ b/meta/recipes-devtools/opkg-utils/opkg-utils/shr.patch
>=20
> Martin,
>=20
> No Upstream-Status or Signed-off-by
>=20
> Please fix this

Ah sorry, this file shouldn't be here at all, I was using it just to
apply those changes until they get applied in yocto opkg-utils repo and
then replaced it with SRCREV bump, but forgot to drop this file from
patch.. will send v2.

Thanks!

>=20
> Thanks
> 	Sau!
>=20
> > @@ -0,0 +1,26 @@
> > +diff --git a/opkg-build b/opkg-build
> > +index 012afd3..485897a 100755
> > +--- a/opkg-build
> > ++++ b/opkg-build
> > +@@ -160,7 +160,7 @@ outer=3Dar
> > + noclean=3D0
> > + opkext=3D0
> > + usage=3D"Usage: $0 [-c] [-C] [-O] [-o owner] [-g group]<pkg_directory=
>  [<destination_directory>]"
> > +-while getopts "cg:ho:vO" opt; do
> > ++while getopts "cCg:ho:vO" opt; do
> > +     case $opt in
> > + 	o ) owner=3D$OPTARG
> > + 	    ogargs=3D"--owner=3D$owner"
> > +diff --git a/opkg-make-index b/opkg-make-index
> > +index 22393e8..1c3a8e1 100755
> > +--- a/opkg-make-index
> > ++++ b/opkg-make-index
> > +@@ -186,7 +186,7 @@ if packages_filename:
> > +      gzip_filename =3D ("%s.gz" % packages_filename)
> > +      tmp_gzip_filename =3D ("%s.%d" % (gzip_filename, os.getpid()))
> > +      gzip_cmd =3D "gzip -9c<  %s>  %s" % (tmp_packages_filename, tmp_=
gzip_filename)
> > +-     rc =3D subprocess.check_output(gzip_cmd, shell=3DTrue)
> > ++     subprocess.call(gzip_cmd, shell=3DTrue)
> > +      os.rename(tmp_packages_filename, packages_filename)
> > +      os.rename(tmp_gzip_filename, gzip_filename)
> > +
> > diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb b/meta/=
recipes-devtools/opkg-utils/opkg-utils_git.bb
> > index 1996c75..b193ba4 100644
> > --- a/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > +++ b/meta/recipes-devtools/opkg-utils/opkg-utils_git.bb
> > @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9b=
a36caa9b7df079bae19f \
> >                       file://opkg.py;beginline=3D1;endline=3D18;md5=3D1=
5917491ad6bf7acc666ca5f7cc1e083"
> >   RDEPENDS_${PN} =3D "python"
> >   RDEPENDS_${PN}_virtclass-native =3D ""
> > -SRCREV =3D "44df9dd3dc411ca1255cb4b23bde7eb71aed4778"
> > +SRCREV =3D "423ecd36b4782327c16f516885d1248249c7724a"
> >   PV =3D "0.1.8+git${SRCPV}"
> >   PR =3D "r1"
> >

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--NKoe5XOeduwbEQHU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/itkoACgkQN1Ujt2V2gBz9gwCfW5Kf9EjzWGQMxns9ftxrX5vf
XcIAmwXx7ZvSUSTzT11Qsf254ZZaygT2
=LZ1q
-----END PGP SIGNATURE-----

--NKoe5XOeduwbEQHU--
