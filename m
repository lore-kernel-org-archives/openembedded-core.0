Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REgCH-0005xj-73
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 13:45:05 +0200
Received: by bkat8 with SMTP id t8so1855642bka.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 04:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=UWYXAFgttJH1jaJys6RUEYKy4BWum1p14lY8OJcEzco=;
	b=fbcwOiXqQp9XLMgHCoJRi05/UV0Krh//OGe0t7yvC0BTCjmatpUoer9sLvGAPGdlN5
	Sv7ZYE+ggTxi2aNfmxJdDqafSVMrnCwIUjT8pz26I/KBJSfhXuYZU0qZUTlJCpfkr97f
	Avm5ujWn9cqaC2oCVnW//t5Z6ZAEeoEmvfY7g=
Received: by 10.204.139.21 with SMTP id c21mr6400028bku.63.1318592360388;
	Fri, 14 Oct 2011 04:39:20 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id u10sm8154745bkv.3.2011.10.14.04.39.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 14 Oct 2011 04:39:19 -0700 (PDT)
Date: Fri, 14 Oct 2011 13:39:12 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111014113912.GG3542@jama.jama.net>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<1318591599.23801.257.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1318591599.23801.257.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [oe-core 00/20] Xorg, mesa changes
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
X-List-Received-Date: Fri, 14 Oct 2011 11:45:05 -0000
X-Groupsio-MsgNum: 11004
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nqkreNcslJAfgyzk"
Content-Disposition: inline

--nqkreNcslJAfgyzk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 14, 2011 at 12:26:30PM +0100, Richard Purdie wrote:
> On Thu, 2011-10-13 at 13:30 +0200, Martin Jansa wrote:
> > Mostly cleanup in mesa directory.
> >=20
> > Most controversial is=20
> > mesa-dri: introduce MACHINE_DRI_MODULES
> > but maybe we can use it as distro variable and keep it with default arc=
h.
> > But then we cannot just add ie glamo dri module from meta-openmoko like=
 this:
> > http://git.shr-project.org/git/?p=3Dmeta-smartphone.git;a=3Dcommit;h=3D=
b50c8d00cf764c276b0792c0623b8eda3d18d343
> > without distro (setting MACHINE_DRI_MODULES) depending on such bsp laye=
r.
> >=20
> > The following changes since commit 5ad1ca59dea6d5045f252ed7b786ad193fac=
ed64:
> >=20
> >   xf86-video-intel: Update 2.15.0 -> 2.16.0 (2011-10-12 22:59:14 +0100)
> >=20
> > are available in the git repository at:
> >   git://git.openembedded.org/openembedded-core-contrib jansa/x11-v4
> >   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?=
h=3Djansa/x11-v4
> >=20
> > Martin Jansa (20):
> >   xserver-xorg: drop xorg-minimal-fonts from RDEPENDS
> >   xserver-xorg: move PE to xserver-xorg-common and bump it
> >   xorg-driver-common: bump PE for upgrade path for meta-oe users
> >   mesa-dri-glsl-native: fix LICENSE
> >   mesa: move common patches which could be used in both mesa-dri and
> >     mesa-xlib from mesa-dri to mesa
> >   mesa-common: add common LIC_FILES_CHKSUM for newer mesa versions
> >   mesa-common: MesaDemos is now separate recipes, bump PE, introduce
> >     INC_PR
> >   mesa-common: use glx-use-tls.inc instead of enabling glx-tls every
> >     time
> >   mesa-7.11: move shared DEPENDS, SRC_URI, checksums and
> >     do_configure_prepend to shared .inc file
> >   mesa: move shared PROTO_DEPS, LIB_DEPS and DEPENDS to common .inc
> >   mesa: package gl/egl/osmesa to separate packages
> >   mesa-xlib: move shared options to .inc
> >   mesa-dri: move shared options to mesa-dri.inc
> >   mesa-dri: introduce MACHINE_DRI_MODULES
> >   mesa-dri: LEAD_SONAME shouldn't be needed now, when we're packaging
> >     each lib in separate package
> >   mesa-dri: drop COMPATIBLE_HOST, swrast should work for everybody
> >   mesa-git: move shared parts from mesa-dri_git to mesa-git.inc and add
> >     mesa-xlib_git
> >   mesa-git: lower D_P a bit more then all mesa-dri
> >   mesa-git: upgrade from 7.7+git to 7.11+git
> >   mesa-git: fix LIC_FILES_CHKSUM
>=20
> I merged most of this. The pieces I didn't take:
>=20
> * MACHINE_DRI_MODULES piece
> * Drop COMPATIBLE_HOST (due to above)
> * glx-tls piece
> * FILES changes (due to do_install_append)

I've just pushed rebased jansa/x11-v4 with this last 4 patches

> This was *much* easier to review and I'm grateful for that, thanks!

good, you're welcome

> I think the actions are now:
>=20
> a) Resolve the MACHINE_DRI_MODULES discussion. Short term we can make
> the i915/965 pieces ia32 only and then remove the COMPATIBLE_MACHINES

OK

> b) Drop the glx/tls piece

I'll send patch dropping also the file and from xserver-xorg after mesa
is dropped in meta-oe so we don't introduce parsing issues

> c) Drop the do_install_append

resolved in 1/4 which is=20
mesa: package gl/egl/osmesa to separate packages
without do_install_append (that is moved to 3/4)

> and then we should have this all resolved :)

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nqkreNcslJAfgyzk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6YH2AACgkQN1Ujt2V2gBzUuACfcymTo5vYHd2Rd03RdN1poKJH
yM0AoLj/9Z23VxQzYevbttBSrLsKeHpa
=N35V
-----END PGP SIGNATURE-----

--nqkreNcslJAfgyzk--
