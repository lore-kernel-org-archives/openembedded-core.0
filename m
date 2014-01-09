Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id DEC966028A;
	Thu,  9 Jan 2014 23:25:48 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id q10so1473431ead.3
	for <multiple recipients>; Thu, 09 Jan 2014 15:25:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=1WbKrS73Z6qP1T5f0+2N39sKHiPV2ji8GJ13cLwBBV0=;
	b=VoyRbfcuSoKPfi5UxUidtwzM7kASFD1SJYj9rPQRNo53MrCoz0ez0xL0N41e/G2oLJ
	G6YpAWQ/t+S0GTeLq0Sku30Pn6pj4Mu67L8YxjnaYFtKqLhfEkkz7rJPzXjZv+KPoC3C
	R18hLlyz0fcZkXzaokYAS37Vk3sLB4eNJutStWnPitCMOWMXY9xydLG8K2yApQ5PJl0k
	NtmagamdlU4TUnrxtI3hLvYZKio//xypgUlmZ5MzV8mpovIuUeEZRgS38T8U8Qlc3gwH
	V/1W610WgLS447GkECvKkk6J04bKS4CL89NFqbg9Dn+sEZ+SfKuksyDoz5k/a3dpd98U
	L9IQ==
X-Received: by 10.14.87.195 with SMTP id y43mr5816568eee.32.1389309949501;
	Thu, 09 Jan 2014 15:25:49 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id n7sm9754750eef.5.2014.01.09.15.25.48
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 15:25:48 -0800 (PST)
Date: Fri, 10 Jan 2014 00:26:01 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20140109232601.GL3709@jama>
References: <20140109144626.GG3709@jama>
	<CALbNGRQ5jDLUA80jmXeoHU8g-0k04UwgXGtdjL3xTJdG6heSKg@mail.gmail.com>
	<20140109152308.GI3709@jama>
	<CALbNGRSjqo1+03hjQxeKN5aPFpGWK0PZv9YgR2NNcqHVhXZhGQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRSjqo1+03hjQxeKN5aPFpGWK0PZv9YgR2NNcqHVhXZhGQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] State of bitbake world, Failed tasks 2014-01-09
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Jan 2014 23:25:49 -0000
X-Groupsio-MsgNum: 48792
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7tuoKvP21MOB3sJS"
Content-Disposition: inline

--7tuoKvP21MOB3sJS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 09, 2014 at 05:37:24PM +0100, Andreas M=FCller wrote:
> On Thu, Jan 9, 2014 at 4:23 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> > On Thu, Jan 09, 2014 at 04:12:52PM +0100, Andreas M=FCller wrote:
> >> On Thu, Jan 9, 2014 at 3:46 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> >> > http://www.openembedded.org/wiki/Bitbake_World_Status
> >> >
> >> > =3D=3D Failed tasks 2014-01-09 =3D=3D
> >> >
> >> > =3D=3D=3D common (6) =3D=3D=3D
> >> >     * meta-openembedded/meta-efl/recipes-efl/webkit/webkit-efl_svn.b=
b, do_configure
> >> >     * meta-openembedded/meta-multimedia/recipes-mediacentre/xbmc/xbm=
c_git.bb, do_fetch
> >> >     * meta-openembedded/meta-oe/recipes-devtools/tcltk/tk_8.6.0.bb, =
do_compile
> >> >     * meta-openembedded/meta-oe/recipes-extended/gnuplot/gnuplot_4.4=
=2E4.bb, do_compile
> >> >     * meta-openembedded/meta-oe/recipes-navigation/monav/monav_0.3.b=
b, do_compile
> >> >     * meta-qt5/recipes-qt/qt5/qtwayland_git.bb, do_compile
> >>
> >> I have problems with qtwayland too and think that I am close to
> >> understand what's going on (on 5.2 branch). Where do I find logs for
> >> this error?
> >
> > Links for each machine are on the bottom of the e-mail:
> >
> > http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/...
> >
> > qtwayland builds for me fine with oe-core only and also in qt5-5.2.0 +
> > webos-ports, so I haven't looked much into it yet.
> OK - I can't find that in the logs - but anyway: I am working also on
> 5.2.0 and my error for qtwayland showed up as tons of multiple defined
> GL data types as

e.g.
http://logs.nslu2-linux.org/buildlogs/oe/oe-shr-core-branches/log.world.201=
40109_011732.log/bitbake.log

has that, but if you're looking at it in browser you need to wait quite
a long time for it to fetch completely and at least in chromium it
sometimes fail to search in bigger text files for me.
=20
| In file included from
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-oe-linux=
/qtwayland/5.1.0+gitAUTOINC+87dba733ac-r0/git/src/compositor/wayland_wrappe=
r/qwlinputdevice.cpp:41:0:
|
/home/jenkins/oe/shr-core-branches/shr-core/tmp-eglibc/work/x86_64-oe-linux=
/qtwayland/5.1.0+gitAUTOINC+87dba733ac-r0/git/src/compositor/wayland_wrappe=
r/qwlinputdevice_p.h:128:22:
error: field 'pointer' has incomplete type
|          ::wl_pointer pointer;
|                       ^

=2E.. and a lot more like this

> 'error: 'GLdouble' has a previous declaration as 'typedef GLfloat GLdoubl=
e''
>=20
> Reason was that I had GL-headers in my sysroot but qtwayland was
> configured without wayland-egl / egl (it took me long to find out that
> that wayland-egl is supplied by mesa..). So qtwayland tried to build
> glx-compositor which does not work with GL/GLES headers in sysroot.
> After building egl and wayland-egl, qtwayland configured fine and the
> errors disappeared.

It's probably different error than what I have, but with latest mesa I
had problem that I need to define MESA_EGL_NO_X11_HEADERS in qtbase and
qtwebkit again to prevent using xorg includes, maybe that's where your
2nd GLdouble is leaking in?

http://lists.openembedded.org/pipermail/openembedded-core/2014-January/0880=
72.html

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7tuoKvP21MOB3sJS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlLPMAkACgkQN1Ujt2V2gBy5dACgtPv88fpB82b/MdK98Ed9X0u6
hAUAn2CgoB3sYqFkaG/Oawekn6vX5GcA
=V+4O
-----END PGP SIGNATURE-----

--7tuoKvP21MOB3sJS--
