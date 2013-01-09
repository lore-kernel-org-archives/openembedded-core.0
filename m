Received: from mail-pa0-f42.google.com ([209.85.220.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1TsvwB-0000uo-Hh; Wed, 09 Jan 2013 14:43:24 +0100
Received: by mail-pa0-f42.google.com with SMTP id rl6so1045245pac.1
	for <multiple recipients>; Wed, 09 Jan 2013 05:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Lajkh9qTRQ+HBLdw/QNfMhwgAoHu4eaXTz3tGEfcyR8=;
	b=sM4zmJVSCtQlvSOELOVjjdR+RylI/kofzDkrE3vc2SBwTcW4oDrPXJ5XvEk7DvNe5T
	y60RllzZCMK/jyhbPmRbymvU1Li+8f55Br+Zherm/O1rqZtXEU2b2p1erCfDmNc5fu9Q
	qQO6baFclIaSAokUgRBDOhzGhPjh8FzFp41++z36tS8+FmDz189C2LW51rQIwpDZVGTe
	vNJ91kHBsUP63TsAYBUeHL3GjMlNTvX8lSdfwag3NQWR4mBYrtg4c06gIPIYVYwOykUB
	o62pnpAY1gqE/VMl8yDpZ3blSB0jV8bK7+puEL0zUrteJSgR8fUJ33GbXFVWzmGS9B/j
	g3KA==
X-Received: by 10.66.82.230 with SMTP id l6mr189840983pay.12.1357738090510;
	Wed, 09 Jan 2013 05:28:10 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id l8sm28891154pax.9.2013.01.09.05.28.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 09 Jan 2013 05:28:08 -0800 (PST)
Date: Wed, 9 Jan 2013 14:28:13 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130109132813.GJ3722@jama.palm1.palmone.com>
References: <20121213174202.GE3356@jama.jama.net>
	<20121223201634.GN8988@jama.palm1.palmone.com>
	<20121224091242.GS8988@jama.palm1.palmone.com>
MIME-Version: 1.0
In-Reply-To: <20121224091242.GS8988@jama.palm1.palmone.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: State of bitbake world
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
X-List-Received-Date: Wed, 09 Jan 2013 13:43:25 -0000
X-Groupsio-MsgNum: 33594
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="pMCBjikF2xGw87uL"
Content-Disposition: inline

--pMCBjikF2xGw87uL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 24, 2012 at 10:12:42AM +0100, Martin Jansa wrote:
> On Sun, Dec 23, 2012 at 09:16:34PM +0100, Martin Jansa wrote:
> > On Thu, Dec 13, 2012 at 06:42:02PM +0100, Martin Jansa wrote:
> > > Hi,=20
> > >=20
> > > I've sent a lot of small fixes to get world builds usable (to be able=
 to
> > > spot when there is more issues then usual).
> > >=20
> > > Now I'm down to ~ 43 recipes failing (+ maybe something what depends =
on
> > > them)
> >=20
> > Now I'm down to 19 failures with this patchset
> > http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-December/0=
43163.html
> >   openembedded-core/meta/recipes-graphics/clutter/cogl_1.8.2.bb, do_com=
pile
> >   meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-d=
isk-utility_2.32.0.bb, do_compile
> >   openembedded-core/meta/recipes-extended/sat-solver/sat-solver_git.bb,=
 do_compile
> >   meta-openembedded/meta-oe/recipes-connectivity/uhd/uhd_git.bb, do_com=
pile
> >   openembedded-core/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb, do_compile
> >   meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb=
, do_compile
> >   meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wirel=
ess-all_0.bb, do_compile
> >   meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.b=
b, do_compile
> >   meta-openembedded/meta-oe/recipes-connectivity/hostapd/hostap-daemon_=
1.0.bb, do_compile
> >   meta-openembedded/meta-networking/recipes-support/netcat/netcat_0.7.1=
=2Ebb, do_compile
> >   meta-openembedded/meta-oe/recipes-core/f2fs-tools/f2fs-tools_1.1.0.bb=
, do_fetch
> >   meta-openembedded/meta-oe/recipes-graphics/slim/slim_1.3.2.bb, do_com=
pile
> >   meta-openembedded/meta-oe/recipes-graphics/fbida/fbida_2.08.bb, do_co=
mpile
> >   meta-openembedded/meta-gnome/recipes-gnome/system-tools/system-tools-=
backends_2.10.2.bb, do_configure
> >   meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.b=
b, do_compile
> >   meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, d=
o_compile
> >   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-omap_g=
it.bb, do_compile
> >   meta-openembedded/meta-networking/recipes-support/traceroute/tracerou=
te_2.0.18.bb, do_install
> >   meta-openembedded/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.=
3.bb, do_compile
> >   meta-openembedded/meta-oe/recipes-support/fftw/benchfft_3.1.bb, do_co=
nfigure
> >   meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-=
power-manager_2.32.0.bb, do_compile
> >   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.b=
b, do_configure
>=20
> Few more are failing when it's built without DISTRO setting (and also wit=
hout gold)
> http://jenkins.nas-admin.org/job/shr-core-branches_world_qemuarm/28/conso=
leFull
>   meta-openembedded/meta-systemd/recipes-core/systemd/systemd_git.bb, do_=
package_write_ipk
>   meta-smartphone/meta-shr/recipes-multimedia/mplayer/mplayer_svn.bb, do_=
compile
>   meta-openembedded/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb=
, do_compile
>   virtual:native:meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs=
_0.6.20.bb, do_populate_sysroot
>   meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb, do=
_compile
>   meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb, do_=
install
>   meta-openembedded/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5=
=2Ebb, do_configure
>   meta-openembedded/meta-networking/recipes-support/traceroute/traceroute=
_2.0.18.bb, do_install

Updated list with current oe-core + eglibc-2.17 and changes listed in
in-test bundle on patchwork

Summary: 31 tasks failed:
Build log:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/2013010905160=
0.log

New entries:
  meta-openembedded/meta-gnome/recipes-connectivity/obex/obexd_0.44.bb, do_=
compile
  meta-openembedded/meta-oe/recipes-support/gpm/gpm_1.99.7.bb, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb, do_c=
ompile
  meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc_2=
=2E0.2.bb, do_configure
  meta-openembedded/meta-multimedia/recipes-dvb/wscan/wscan_20121111.bb, do=
_compile
  meta-openembedded/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc_1.5=
=2E0.bb, do_compile
  meta-openembedded/meta-initramfs/recipes-bsp/kexecboot/kexecboot-klibc_gi=
t.bb, do_configure

Old entries:
  meta-openembedded/meta-systemd/recipes-core/systemd/systemd_git.bb, do_pa=
ckage_write_ipk
  meta-openembedded/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-=
utility_2.32.0.bb, do_compile
  meta-smartphone/meta-shr/recipes-multimedia/mplayer/mplayer_svn.bb, do_co=
mpile
  meta-openembedded/meta-oe/recipes-connectivity/uhd/uhd_git.bb, do_compile
  meta-openembedded/meta-oe/recipes-multimedia/libdc1394/libdc1394_git.bb, =
do_compile
  virtual:native:meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0=
=2E6.20.bb, do_populate_sysroot
  meta-openembedded/meta-oe/recipes-qt/qwt/qwt-e_6.0.1.bb, do_compile
  openembedded-core/meta/recipes-qt/qt-apps/qmmp_0.6.1.bb, do_compile
  meta-openembedded/meta-oe/recipes-qt/qcanobserver/qcanobserver_svn.bb, do=
_compile
  meta-openembedded/meta-oe/recipes-kernel/compat-wireless/compat-wireless-=
all_0.bb, do_compile
  meta-openembedded/meta-oe/recipes-devtools/nodejs/nodejs_0.6.20.bb, do_in=
stall
  meta-openembedded/meta-gnome/recipes-gnome/epiphany/epiphany_2.30.6.bb, d=
o_compile
  meta-openembedded/meta-oe/recipes-graphics/slim/slim_1.3.2.bb, do_compile
  meta-openembedded/meta-networking/recipes-support/netcat/netcat_0.7.1.bb,=
 do_compile
  meta-openembedded/meta-oe/recipes-graphics/fbida/fbida_2.08.bb, do_compile
  meta-smartphone/meta-samsung/recipes-bsp/samsung-modem-mgr/samsung-modem-=
mgr_git.bb, do_configure
  meta-openembedded/meta-gnome/recipes-gnome/system-tools/system-tools-back=
ends_2.10.2.bb, do_configure
  meta-openembedded/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb, d=
o_compile
  meta-openembedded/meta-gnome/recipes-gnome/zenity/zenity_2.32.1.bb, do_co=
mpile
  meta-openembedded/meta-networking/recipes-support/traceroute/traceroute_2=
=2E0.18.bb, do_install
  meta-openembedded/meta-oe/recipes-support/fftw/benchfft_3.1.bb, do_config=
ure
  meta-openembedded/meta-gnome/recipes-gnome/gnome/gnome-terminal_2.26.3.bb=
, do_compile
  meta-openembedded/meta-gnome/recipes-gnome/gnome-power-manager/gnome-powe=
r-manager_2.32.0.bb, do_compile
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_compile

Cheers,

--pMCBjikF2xGw87uL
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDtcG0ACgkQN1Ujt2V2gByClQCfcQ9XdfpxCCSB418QkTpWFi+j
y9kAoIFt1iYIKP1D7AlIxMyYahVOIKm2
=3/BW
-----END PGP SIGNATURE-----

--pMCBjikF2xGw87uL--
