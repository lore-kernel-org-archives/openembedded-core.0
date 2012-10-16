Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TOFtI-0002EO-Cq
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Oct 2012 00:45:36 +0200
Received: by mail-wg0-f43.google.com with SMTP id dq11so5077845wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Oct 2012 15:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=KxCdMONPHWluuQRbJr0fgwF4pp/ZMZSDSp9O0xVPpSA=;
	b=S+0W56cVQncKGTYNfcFaIvqpCDPQ8ZiAgvXGnv56/3cCbUg0YU0f8jAWQHAxGlUUe+
	UKGw+JyuCAAVl6+1e84pp+MpCcupT6a6DdXgERz3IytLSaBhCgR2U3DkDjgG9vtVMYCc
	L6UmES0ogOuMi+EK+mQtZbh+Zc9IuQSNUrghety2e2ehE1oUlqhxsP+Uaogq42dMAlWj
	HKJRTRV3NvTh7pdRPJ7HFTEBaompD6bKH0fp1sOmN40UsAkbJ5dBgM4Ih1pIzafbNUCh
	J21Z2aM/erbIUzoy0W4UhNa7AolhQuN2TlZpZQY23/FzZSRqnRJ4ZWR0zGApOoB/TR5h
	x5LA==
Received: by 10.216.145.9 with SMTP id o9mr9748086wej.107.1350426739076;
	Tue, 16 Oct 2012 15:32:19 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id eq2sm24103157wib.1.2012.10.16.15.32.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Oct 2012 15:32:17 -0700 (PDT)
Date: Wed, 17 Oct 2012 00:32:24 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Message-ID: <20121016223224.GA3405@jama.jama.net>
References: <1350038799-22567-1-git-send-email-Martin.Jansa@gmail.com>
	<50785628.8060504@linux.intel.com>
	<20121012175629.GB3605@jama.jama.net>
	<507DB7F6.9030208@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <507DB7F6.9030208@linux.intel.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] PACKAGES_DYNAMIC: use regexp not glob
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
X-List-Received-Date: Tue, 16 Oct 2012 22:45:36 -0000
X-Groupsio-MsgNum: 30611
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="SLDf9lqlvOQaIe6s"
Content-Disposition: inline

--SLDf9lqlvOQaIe6s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 16, 2012 at 12:39:34PM -0700, Saul Wold wrote:
> On 10/12/2012 10:56 AM, Martin Jansa wrote:
> > On Fri, Oct 12, 2012 at 10:40:56AM -0700, Saul Wold wrote:
> >> On 10/12/2012 03:46 AM, Martin Jansa wrote:
> >>> * bitbake uses PACKAGES_DYNAMIC as regexp
> >>>     ^ could make matching faster (and it will be more clear that we'r=
e expecting regexp not glob)
> >>>     * made all those last '-' optional, use .* (or nothing)
> >>>
> >>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >>> ---
> >>>    meta/classes/kernel.bbclass                              | 6 +++---
> >>>    meta/conf/bitbake.conf                                   | 2 +-
> >>>    meta/recipes-connectivity/connman/connman.inc            | 2 +-
> >>>    meta/recipes-core/eglibc/eglibc-locale.inc               | 6 +++---
> >>>    meta/recipes-core/packagegroups/packagegroup-core-sdk.bb | 2 +-
> >>>    meta/recipes-devtools/perl/perl_5.14.2.bb                | 4 ++--
> >>>    meta/recipes-extended/lighttpd/lighttpd_1.4.31.bb        | 2 +-
> >>>    meta/recipes-extended/pam/libpam_1.1.6.bb                | 2 +-
> >>>    meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb       | 2 +-
> >>>    meta/recipes-gnome/gtk+/gtk+_2.24.8.bb                   | 2 +-
> >>>    meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb     | 2 +-
> >>>    meta/recipes-graphics/directfb/directfb.inc              | 2 +-
> >>>    meta/recipes-graphics/mesa/mesa-dri.inc                  | 2 +-
> >>>    meta/recipes-graphics/pango/pango.inc                    | 2 +-
> >>>    meta/recipes-kernel/linux/linux-dummy.bb                 | 4 ++--
> >>>    meta/recipes-multimedia/gstreamer/gst-plugins.inc        | 2 +-
> >>>    meta/recipes-multimedia/pulseaudio/pulseaudio.inc        | 2 +-
> >>>    meta/recipes-qt/qt-apps/qmmp_0.6.1.bb                    | 2 +-
> >>>    meta/recipes-qt/qt4/qt4-embedded.inc                     | 2 +-
> >>>    meta/recipes-qt/qt4/qt4.inc                              | 2 +-
> >>>    20 files changed, 26 insertions(+), 26 deletions(-)
> >>>
> >> Martin,
> >>
> >> Did you do any verification with the buildhistory tools to ensure
> >> nothing changed in the packaging?
> >
> > Yes, last 12 commits in
> > https://github.com/shr-distribution/buildhistory/commits/jama
> >
> > e.g. for om-gta02
> > https://github.com/shr-distribution/buildhistory/commit/55d9cb4fa438e64=
c9fcc4ef0966164779c5dc974
> > https://github.com/shr-distribution/buildhistory/commit/c0b3897e04fd966=
9c557620ca48fde05f01e7aca
> >
> > but it's together with last change to perl, eglibc, pkgconfig.
> >
> I did track down this failure to your change, possibly something missed=
=20
> in kernel.bbclass:
>=20
> > ERROR: Nothing RPROVIDES 'kernel-modules' (but /srv/home/pokybuild/yoct=
o-autobuilder/yocto-slave/nightly-mips/build/meta/recipes-core/packagegroup=
s/packagegroup-base.bb RDEPENDS on or otherwise requires it)
> > NOTE: Runtime target 'kernel-modules' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['kernel-modules']
> > NOTE: Runtime target 'packagegroup-base-extended' is unbuildable, remov=
ing...
> > Missing or unbuildable dependency chain was: ['packagegroup-base-extend=
ed', 'kernel-modules']

True, kernel-module-* was also matching kernel-modules which is added to
PACKAGES later in python.

I'm sending 2 alternative patches to resolve this
1) adding ^kernel-modules$ to PACKAGES_DYNAMIC
  =20
2) adding kernel-modules as normal package to PACKAGES and simplify=20
   populate_packages_prepend

I prefer 2nd solution, but maybe someone will find some reason why 1st is
better.

> I was attempting to build core-image-sato and core-image-sato-sdk on=20
> qemumips or routerstation, I was able to see this failure on other=20
> MACHINES also.
>=20
> Thanks

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--SLDf9lqlvOQaIe6s
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlB94HgACgkQN1Ujt2V2gBwzSQCgroBJxPy1K7o3nsL2ufXdB3XE
RxcAnRsrcTmQlbHZuAtZ1ewGEIOfhG8+
=55P2
-----END PGP SIGNATURE-----

--SLDf9lqlvOQaIe6s--
