Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id CD74E77150;
	Mon,  9 Nov 2015 15:32:55 +0000 (UTC)
Received: by wmec201 with SMTP id c201so85853357wme.0;
	Mon, 09 Nov 2015 07:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=opVzSRDH2UesFqY2KzFqJ2OORcMW8pXxFedUqU3YM0Q=;
	b=jGSgZRa6JaQ8MMDJlNkwKeUlkd8ewfkkDMcV5cQrbc7q90sjYIREFiKX96oKjimWOd
	aiwqaxLju+q2hNaAAyZzqL0TBCM6UPz2kfXaEezJ45GjbXwXWopr/+WmIpEbvVihSdou
	GZoLoxvQcRZMpou0DNY4ImLpnIlAYC/v9ip1sCIE+yOxCdTxbv+eylNa1+LNqIBQqSxo
	THhMv9fA7ud/4vaX5bfzGTBx/uILpNpARaSBwQhOWyemVERfTW70QQCUveh1FVn4MU6f
	2l9yiIQZu8Qyw/7ju6l7NW4ICzh0LVXz6a8A5zbIiuHfsamdQ0ziB9W//AlOHKCoSm8K
	H1eQ==
X-Received: by 10.28.229.212 with SMTP id c203mr24662965wmh.11.1447083174954; 
	Mon, 09 Nov 2015 07:32:54 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id 20sm14876766wmh.8.2015.11.09.07.32.53
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 09 Nov 2015 07:32:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 9 Nov 2015 16:32:58 +0100
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20151109153258.GC2569@jama>
References: <20151026204716.GJ2554@jama>
	<CALbNGRQCwyFKti9sgx0MHkxFbwuksupsjsnQ0UmK=dWQ47AZaw@mail.gmail.com>
	<20151027120153.GD2577@jama>
MIME-Version: 1.0
In-Reply-To: <20151027120153.GD2577@jama>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2015-10-26
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
X-List-Received-Date: Mon, 09 Nov 2015 15:32:57 -0000
X-Groupsio-MsgNum: 73109
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="c3bfwLpm8qysLVxt"
Content-Disposition: inline

--c3bfwLpm8qysLVxt
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2015 at 01:01:53PM +0100, Martin Jansa wrote:
> On Mon, Oct 26, 2015 at 11:49:18PM +0100, Andreas M=FCller wrote:
> > On Mon, Oct 26, 2015 at 9:47 PM, Martin Jansa <martin.jansa@gmail.com> =
wrote:
> >=20
> > > =3D=3D=3D common (2) =3D=3D=3D
> > >     * /meta-openembedded/meta-oe/recipes-graphics/gerbil/gerbil_git.b=
b, do_compile
> > >     * /openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.=
bb, do_compile
> > ^ Hope I find time for this one. What DISTRO features were set: x11 and=
 wayland?
>=20
> yes, both are in
>=20
> OE qemuarm@ ~/oe/world/shr-core $ grep ^DISTRO_FEATURES=3D env.libsdl2=20
> DISTRO_FEATURES=3D"alsa argp bluetooth ext2 irda largefile pcmcia usbgadg=
et usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ipv4 ipv6 libc-backtrace =
libc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-cry=
pt                                       libc-crypt-ufc libc-db-aliases lib=
c-envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse                     =
                 libc-getlogin libc-idn libc-inet-anl libc-libm libc-locale=
s libc-locale-code         libc-memusage libc-nis libc-nsswitch libc-rcmd l=
ibc-rtld-debug libc-spawn libc-streams libc-sunrpc                         =
              libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc=
-posix-regexp libc-posix-regexp-glibc                                    li=
bc-posix-wchar-io ld-is-gold systemd opengl wayland pulseaudio bluez5"
>=20
> OE qemuarm@ ~/oe/world/shr-core $ grep ^PACKAGECONFIG=3D env.libsdl2     =
                                                                           =
          =20
> PACKAGECONFIG=3D"     opengl     alsa          pulseaudio     wayland    =
 x11 "

I can also confirm that adding:
PACKAGECONFIG_remove_pn-libsdl2 =3D "wayland"

fixes the build for me.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--c3bfwLpm8qysLVxt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlZAungACgkQN1Ujt2V2gBxDyQCfe5asY3p80QA2AVkOmiF2g34o
ZVQAoLts9zoOsHAQWejR+zxzahW+zSox
=EOqH
-----END PGP SIGNATURE-----

--c3bfwLpm8qysLVxt--
