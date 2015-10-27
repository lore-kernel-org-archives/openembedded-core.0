Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id DF8F875D4A;
	Tue, 27 Oct 2015 12:01:36 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so156120580wic.0;
	Tue, 27 Oct 2015 05:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=m6WMRI75kja3HlHsTVsGk5jkPWW6FbPmQX2TVS93+e0=;
	b=auG2Qh/pPy1D+yae0D58HBAZHulBsV4r8nTpWE6hPpyCAvYySybc0EK4Lo8k7FO8Zi
	Olu57X0EPwmbIhOef+BVzU8Jrdh/0cAnauYl0EofCM+PciPTUiXYwheinDM/+QmC1aLd
	gjheshfBjfd7KQeeqzLIu8xryDXPDbvMY3mqLRqp0/AVtm76ZhOmZQDhThglAlkPKZmt
	GymWKTwXy7kWphzliLdVQe/B15gquGATTU0HjhDlUT+c2U29DjGm58heKPPp+4E+kpze
	9HYSEhDwirWrDqN7zlkddu285r8xsCqXRL3MQImyh0jhD/N2Yqe1CLPJnaf6DQqQU90H
	iGaw==
X-Received: by 10.194.142.166 with SMTP id rx6mr27046344wjb.54.1445947296649; 
	Tue, 27 Oct 2015 05:01:36 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id h7sm44433972wjz.7.2015.10.27.05.01.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 27 Oct 2015 05:01:35 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 27 Oct 2015 13:01:53 +0100
To: Andreas =?iso-8859-1?Q?M=FCller?= <schnitzeltony@googlemail.com>
Message-ID: <20151027120153.GD2577@jama>
References: <20151026204716.GJ2554@jama>
	<CALbNGRQCwyFKti9sgx0MHkxFbwuksupsjsnQ0UmK=dWQ47AZaw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALbNGRQCwyFKti9sgx0MHkxFbwuksupsjsnQ0UmK=dWQ47AZaw@mail.gmail.com>
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
X-List-Received-Date: Tue, 27 Oct 2015 12:01:37 -0000
X-Groupsio-MsgNum: 72671
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wULyF7TL5taEdwHz"
Content-Disposition: inline

--wULyF7TL5taEdwHz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 26, 2015 at 11:49:18PM +0100, Andreas M=FCller wrote:
> On Mon, Oct 26, 2015 at 9:47 PM, Martin Jansa <martin.jansa@gmail.com> wr=
ote:
>=20
> > =3D=3D=3D common (2) =3D=3D=3D
> >     * /meta-openembedded/meta-oe/recipes-graphics/gerbil/gerbil_git.bb,=
 do_compile
> >     * /openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.0.3.bb=
, do_compile
> ^ Hope I find time for this one. What DISTRO features were set: x11 and w=
ayland?

yes, both are in

OE qemuarm@ ~/oe/world/shr-core $ grep ^DISTRO_FEATURES=3D env.libsdl2=20
DISTRO_FEATURES=3D"alsa argp bluetooth ext2 irda largefile pcmcia usbgadget=
 usbhost wifi xattr nfs zeroconf pci 3g nfc x11 ipv4 ipv6 libc-backtrace li=
bc-big-macros libc-bsd libc-cxx-tests libc-catgets libc-charsets libc-crypt=
                                       libc-crypt-ufc libc-db-aliases libc-=
envz libc-fcvt libc-fmtmsg libc-fstab libc-ftraverse                       =
               libc-getlogin libc-idn libc-inet-anl libc-libm libc-locales =
libc-locale-code         libc-memusage libc-nis libc-nsswitch libc-rcmd lib=
c-rtld-debug libc-spawn libc-streams libc-sunrpc                           =
            libc-utmp libc-utmpx libc-wordexp libc-posix-clang-wchar libc-p=
osix-regexp libc-posix-regexp-glibc                                    libc=
-posix-wchar-io ld-is-gold systemd opengl wayland pulseaudio bluez5"

OE qemuarm@ ~/oe/world/shr-core $ grep ^PACKAGECONFIG=3D env.libsdl2       =
                                                                           =
        =20
PACKAGECONFIG=3D"     opengl     alsa          pulseaudio     wayland     x=
11 "

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--wULyF7TL5taEdwHz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYvZ68ACgkQN1Ujt2V2gBzaAgCfTRRYP69Yi8ts5ymN/FwOrLf1
+/0AoJ/WZ3dZPQz80Jks1uV1OM0HABNL
=0clZ
-----END PGP SIGNATURE-----

--wULyF7TL5taEdwHz--
