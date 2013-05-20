Received: from mail-da0-f53.google.com ([209.85.210.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UeQ5L-0006vp-69; Mon, 20 May 2013 15:25:12 +0200
Received: by mail-da0-f53.google.com with SMTP id t11so3894697daj.12
	for <multiple recipients>; Mon, 20 May 2013 06:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=P1aNSwRcHOlrjKv8QA29CqVdii/wpbIRAAsP8b4fJ0E=;
	b=GoNfOY9DV9RHDfmbUD8eaVggcolWGt1GD29MrtGNU+6w4JpylloNbipAepCXZuDINA
	4hjV52r3q41EExRxOq66fCjSge8DqQ4jBmghuTfbZ964a6YQBHeypva1SuVVP/jNlIUG
	A9+62/KpPL23OYqoZvqxsiVlDpHehTUGxX7SGQSPMu14vaMURauFzLxg/IeHXFRjEHd8
	ZtWaQHo/X9wI20QF00GRGKkHp/4Eyy25ZLMOpn9HnD5WKbQcjsp1b9bPWtEOk1gSJ+21
	nmL3LRdPVG9f9mbqrCY8qNLhS6eVLGn8ClrKT32WdWFy71d8CLG7zygRtvkpP5BKC+cp
	25yg==
X-Received: by 10.66.0.73 with SMTP id 9mr52699068pac.171.1369055204817;
	Mon, 20 May 2013 06:06:44 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	vv6sm25812150pab.6.2013.05.20.06.06.41 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 20 May 2013 06:06:43 -0700 (PDT)
Date: Mon, 20 May 2013 15:06:35 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130520130635.GA32431@jama>
References: <20121213174202.GE3356@jama.jama.net>
	<20130415141253.GC10628@jama.dyndns-home.com>
	<20130427105400.GB3199@jama> <20130502151833.GC3206@jama>
	<20130516075215.GA24809@jama.dyndns-home.com>
MIME-Version: 1.0
In-Reply-To: <20130516075215.GA24809@jama.dyndns-home.com>
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
X-List-Received-Date: Mon, 20 May 2013 13:25:42 -0000
X-Groupsio-MsgNum: 39454
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline

--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2013 at 09:52:15AM +0200, Martin Jansa wrote:
> On Thu, May 02, 2013 at 05:18:33PM +0200, Martin Jansa wrote:
> > On Sat, Apr 27, 2013 at 12:54:00PM +0200, Martin Jansa wrote:
> > > Updated status, but only change IIRC is fixed php, tbb,
> > > android-audiosystem and partially fixed llvm2.9 (I'm testing patch to
> > > fix build on qemuarm again)
> > >=20
> > > qemuarm Summary: 19 tasks failed:
> > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.wor=
ld.20130426_185942.log/
> > > qemux86 Summary: 20 tasks failed:
> > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.wor=
ld.20130427_002532.log/
> > > qemux86-64 Summary: 22 tasks failed:
> > > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.wor=
ld.20130427_044751.log/
> >=20
> > Updated list, there were some nice fixes especially for gnome stuff, bu=
t this time it was=20
> > built with gcc-4.8 and binutils-2.23.2 so we have a lot more issues,
> > most of them were already reported in
> > http://lists.linuxtogo.org/pipermail/openembedded-core/2013-March/03771=
5.html
> > so those are caused by gcc-4.8 not binutils-2.23.2
> >=20
> > Be warned, logs are HUGE this time +- 600M
> > qemuarm Summary: 24 tasks failed:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130429_150137.log/
> > qemux86 Summary: 25 tasks failed:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130430_170512.log/
> > qemux86-64 Summary: 27 tasks failed:
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world=
=2E20130501_142102.log/
>=20
> Big thanks to all who sent patches to fix some of issues from last
> status email!
>=20
> webkit-efl fails sooner, so the logs are "normal" +=3D 90M
>=20
> qemuarm Summary: 16 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130513_155710.log
>=20
> qemux86 Summary: 22 tasks failed:
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130514_091356.log
>=20
> qemux86-64 Summary: 26 tasks failed:=20
> http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.2=
0130515_050455.log

Couple of issues from last email were fixed, so here is updated status:

qemuarm Summary: 14 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30520_090009.log
qemux86 Summary: 19 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30519_170509.log
qemux86-64 Summary: 20 tasks failed:
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
30520_005747.log

common (11):
  meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_compi=
le
  meta-openembedded/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.bb=
, do_compile
  meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_compi=
le
  meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.bb=
, do_compile
  meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb, =
do_compile
  meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb, do_configure
  meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb, do_fetch
  meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_git.=
bb, do_compile
  meta-openembedded/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2=
=2E1.26.bb, do_configure
  meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-tools=
_0.7.2.bb, do_compile
  meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb, d=
o_compile

qemuarm (3):
  meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, do_=
compile
  openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_comp=
ile
  openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile

qemux86* common (6):
  openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
  openembedded-core/meta/recipes-devtools/gcc/gcc_4.8.bb, do_compile
  openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21=
=2E6.bb, do_compile
  meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
  meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compile
  meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_compile

qemux86 (2):
  openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_comp=
ile
  meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode_2=
=2E11.14.bb, do_compile

qemux86-64 (3):
  meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
  meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimobil=
edevice_1.1.4.bb, do_configure
  meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-session_2.=
32.1.bb, do_compile

> common (14):
>   meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git.b=
b, do_compile
>   meta-openembedded/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb, do_co=
mpile
>   meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_com=
pile
>   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.6.=
bb, do_compile
>   meta-openembedded/meta-oe/recipes-qt/libconnman-qt/libconnman-qt_1.0.7.=
bb, do_compile
>   meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb, =
do_compile
>   meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.5.8.bb, do_config=
ure
>   meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_com=
pile
>   meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb, do_com=
pile
>   meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_gi=
t.bb, do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-blueto=
oth_2.32.0.bb, do_compile
>   meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbmc_git.bb,=
 do_compile
>   meta-openembedded/meta-gnome/recipes-gnome/evince/evince_2.32.0.bb, do_=
compile
>   meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-too=
ls_0.7.2.bb, do_compile
>=20
> qemuarm (2):
>   openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb, d=
o_compile
>=20
> qemux86* common (7):
>   openembedded-core/meta/recipes-devtools/gcc/gcc_4.8.bb, do_compile
>   openembedded-core/meta/recipes-bsp/grub/grub_2.00.bb, do_package
>   openembedded-core/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.=
21.6.bb, do_compile
>   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
>   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_compi=
le
>   meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-klibc=
_2.0.2.bb, do_compile
>   meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_comp=
ile
>=20
> qemux86 (1):
>   meta-openembedded/meta-oe/recipes-graphics/xorg-driver/xf86-video-geode=
_2.11.14.bb, do_compile
>=20
> qemux86-64 (5):
>   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libimob=
iledevice_1.1.4.bb, do_configure
>   meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-session_=
2.32.1.bb, do_compile
>   meta-openembedded/meta-oe/recipes-connectivity/gnuradio/gnuradio_git.bb=
, do_compile
>   meta-openembedded/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl=
_2.1.26.bb, do_configure
>   meta-browser/recipes-mozilla/firefox/firefox_10.0.11esr.bb, do_compile
>=20
> > Common (18):
> >   virtual:native:meta-openembedded/meta-gnome/recipes-gnome/orbit2/orbi=
t2_2.14.17.bb, do_compile
> >   openembedded-core/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.1=
4.0.bb, do_compile
> >   meta-openembedded/meta-oe/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb, do_=
compile
> >   meta-openembedded/meta-oe/recipes-navigation/omgps/omgps_svn.bb, do_c=
ompile
> >   meta-openembedded/meta-oe/recipes-extended/collectd/collectd_5.2.2.bb=
, do_compile
> >   meta-openembedded/meta-oe/recipes-support/maliit/maliit-framework_git=
=2Ebb, do_compile
> >   meta-openembedded/meta-oe/recipes-navigation/gypsy/gypsy_0.9.bb, do_c=
ompile
> >   meta-openembedded/meta-oe/recipes-multimedia/vlc/vlc_1.1.11.bb, do_pa=
ckage
> >   meta-openembedded/meta-oe/recipes-devtools/packagekit/packagekit_0.5.=
6.bb, do_compile
> >   meta-openembedded/meta-gnome/recipes-gnome/gvfs/gvfs_1.8.2.bb, do_com=
pile
> >   meta-openembedded/meta-gnome/recipes-gnome/eds/evolution-data-server_=
git.bb, do_compile
> >   meta-openembedded/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4=
=2Ebb, do_compile
> >   meta-openembedded/meta-gnome/recipes-gnome/gnome-bluetooth/gnome-blue=
tooth_2.32.0.bb, do_compile
> >   meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.bb, do_c=
ompile
> >   meta-openembedded/meta-networking/recipes-support/ipsec-tools/ipsec-t=
ools_0.7.2.bb, do_compile
> >   meta-smartphone/meta-shr/recipes-shr/shr/phoneuid_git.bb, do_compile
> >   meta-smartphone/meta-shr/recipes-shr/shr/libphone-ui-shr_git.bb, do_c=
ompile
> >   meta-smartphone/meta-fso/recipes-freesmartphone/freesmartphone/libfra=
meworkd-glib_git.bb, do_compile
> >=20
> > qemux86* common (6):
> >   openembedded-core/meta/recipes-devtools/gcc/gcc_4.8.bb, do_compile
> >   meta-openembedded/meta-initramfs/recipes-kernel/kexec/kexec-tools-kli=
bc_2.0.2.bb, do_compile
> >   meta-openembedded/meta-oe/recipes-support/ode/ode_0.9.bb, do_configure
> >   meta-openembedded/meta-oe/recipes-support/emacs/emacs_23.4.bb, do_com=
pile
> >   meta-openembedded/meta-oe/recipes-devtools/geany/geany_1.22.bb, do_co=
mpile
> >   meta-browser/recipes-browser/chromium/chromium_24.0.1312.52.bb, do_co=
mpile
> >=20
> > qemuarm (6)
> >   openembedded-core/meta/recipes-support/gmp/gmp_5.1.0.bb, do_compile
> >   openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.4.0.bb, do_=
configure
> >   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_=
compile
> >   openembedded-core/meta/recipes-devtools/qemu/qemu_1.4.0.bb, do_compile
> >   meta-openembedded/meta-efl/recipes-efl/e17/e-wm_0.17.2.1.bb, do_compi=
le
> >   meta-openembedded/meta-oe/recipes-support/libunwind/libunwind_1.1.bb,=
 do_compile
> >=20
> > qemux86 (1)
> >   openembedded-core/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb, do_=
compile
> >=20
> > qemux86-64 (3)
> >   meta-openembedded/meta-oe/recipes-devtools/python/python-numpy_1.7.0.=
bb, do_compile
> >   meta-openembedded/meta-oe/recipes-connectivity/libimobiledevice/libim=
obiledevice_1.1.4.bb, do_configure
> >   meta-openembedded/meta-gnome/recipes-gnome/gnome-session/gnome-sessio=
n_2.32.1.bb, do_compile
>=20
>=20
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGaH9sACgkQN1Ujt2V2gByaGgCdEY+NSjkg5TkQ6iUmloGEyvDj
MygAoLH+774b3DV+AnbFkaLSZbE1WFdl
=xzmT
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
