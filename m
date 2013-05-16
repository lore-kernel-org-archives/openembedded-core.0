Received: from mail-pd0-f179.google.com ([209.85.192.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>)
	id 1UcuYG-0001Eh-9X; Thu, 16 May 2013 11:32:50 +0200
Received: by mail-pd0-f179.google.com with SMTP id q10so2142245pdj.24
	for <multiple recipients>; Thu, 16 May 2013 02:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qCtCgVPk1JpnrLI4qiik5C+l38aKyC02FZehGStH6Gk=;
	b=W5ROvg8EqxfEX+/lcBzoqz66roMUUoF0U4FTeVpYolC5YMv4FrMhVOpy+mwuDhCX4N
	LsNM0GoI38R7tN9kI8r2u4016dZZ/ZdBT0FPXsvNTaqdAwCugXSl8sgLIdAbRkN56Wyx
	eLW8x5bvVoyhDtOGPwKvw9AvjMOr/U72QA/U00SJ4xULoYyI4IoZYq7Vvr7wN64LCCt/
	cnZG/uKACRMkx6sMt6X0q7lTz98EvJdi+xLrbfH4BR6aX6kvSr1NQvChN0t0mO2kNk8o
	Gd+EeuQ5wjZvOvEGFGMCQZG6SlRLlZcD+ELamHVSSxry+VWkKt0LP38+fAZmqZdp6iF/
	tE5g==
X-Received: by 10.66.233.130 with SMTP id tw2mr42219961pac.65.1368695669456;
	Thu, 16 May 2013 02:14:29 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	al2sm6079158pbc.25.2013.05.16.02.14.24 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 16 May 2013 02:14:26 -0700 (PDT)
Date: Thu, 16 May 2013 11:14:27 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Message-ID: <20130516091427.GE24809@jama.dyndns-home.com>
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
X-List-Received-Date: Thu, 16 May 2013 09:33:19 -0000
X-Groupsio-MsgNum: 39326
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="19uQFt6ulqmgNgg1"
Content-Disposition: inline

--19uQFt6ulqmgNgg1
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
>=20
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

FYI: these builds were started +- 3 days ago, because it takes +- 24hours f=
or
world build on one architecture (even with sstate-cache kept between
builds, because it's quickly changing checksums with oe-core changes) ...

so some fixes sent in last 3 days weren't used (there is patch to fix at
least maliit-framework and gnome-bluetooth)

Sometimes I upgrade used oe-core revision between arch builds (e.g. when new
oe-core invalidates many checksums I don't want to build another arch
spending 24 hours creating sstate-cache with already too old archives)

oe-core and other layers are used from shr/jansa/test branch

for meta-oe there is also contrib/jansa/in-test branch which tracks
which patches I've included to jansa/test from patchwork

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

--19uQFt6ulqmgNgg1
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGUo3MACgkQN1Ujt2V2gBwh1ACgkH0mrVFRvRIAiUIqzImE8kAa
uOoAoKsRFmteph3PykLf4smrvQrA1OJB
=BMRh
-----END PGP SIGNATURE-----

--19uQFt6ulqmgNgg1--
