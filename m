Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 737CD71A8B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 16:25:15 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id s8so9113682pfj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 09:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=c6VbnVPvGiQBYF8stEj5ILbldgy76s+K/TaUvtdIIv0=;
	b=VSdqu1HZTMETbK2K7ued1Mvn/v7jaW67KjjPIEOYClLRQeoszc/+e9TznXE2QWFywr
	DMRwNtMZUQXpcCAQ0eJhu0vHmcbP0UqlBflQ81LDDkXTy7F3VZr4jgnSRp3rQd6Jlqwo
	nPlIAA2fYiskisgi8KFW62K+dOscNdCOe0L0jo2cJbR0vr3THw/SApo03dJnwG8nB7fA
	+bY5bwieJo9LOA5Nqbr9mM/6d3wO14viQ2ymimYphiLQyLPZqxh620++QnkqR9PnmZ5Y
	h1pEgDCs1hKZD+vkLcKHWfnU9j0WzLTFqzmYk5puEkYk+m5zW16qDsBz0lZddbfc5dOD
	C55A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=c6VbnVPvGiQBYF8stEj5ILbldgy76s+K/TaUvtdIIv0=;
	b=T1FgNvPier8Bc3So5jCWCNP+nTuFV4arhI9YzMi3X564xCgcZAXDma+6lxJrlya8Tc
	NtTMtFSNe5MmPM/hM7ohni/hrXdMeILGeUOj/UAdnUkMn8Pj7t4XrZCiNJYg7Vbf1Hf4
	3dK0dMKXijVGvRcEzXHQPdVXlXbX18KpECLhwIANJJJWCdd270u0Ei3kDw2+3NidQ8+i
	/tWN6T0xDeKf4i/AlEWACxe39Zcoqyna4zUvaBYLbBEIJ5jfwYAtFpYsOLVuTj14Hz15
	N6Yb5lQu0pWCSqrIyQ+yvpR8QKxmD3FoK5FXbYDKxS07ZUF66tpyTObiMnbtB6cWzqhC
	WO6w==
X-Gm-Message-State: ABUngvcEHlehFHpRTojK6pqnFiL9Hb22xSvcDVwcM2gTBkFY9QMOMpGtR1p9mINaNIft9w==
X-Received: by 10.98.38.199 with SMTP id m190mr42677462pfm.45.1477931116450;
	Mon, 31 Oct 2016 09:25:16 -0700 (PDT)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	128sm36708993pfy.4.2016.10.31.09.25.15
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Oct 2016 09:25:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CALbNGRRcthK1Vpp-Yx90hN9TjAHexgY3cVbJC3fgvcLtfoM4MA@mail.gmail.com>
Date: Mon, 31 Oct 2016 09:25:13 -0700
Message-Id: <582B4854-F54B-492A-8897-F09981AA23C1@gmail.com>
References: <20161029084707.29652-1-raj.khem@gmail.com>
	<CALbNGRSvqDHCA-3VPt379-Np29hZo-0ONbj=ZFd+Eew1K=4zFw@mail.gmail.com>
	<CAMKF1sr=VwcPUpdV9BTfVKuq_sD0Btnm6zkW3xFWNh=e_T=ZHw@mail.gmail.com>
	<CALbNGRQ2aKUmRyH1b-aAjx1FNgyrrkOyCWwSRVENM5repVGY9w@mail.gmail.com>
	<CALbNGRRcthK1Vpp-Yx90hN9TjAHexgY3cVbJC3fgvcLtfoM4MA@mail.gmail.com>
To: =?utf-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cmake.bbclass: Exclude native sysroot from CMAKE_FIND_ROOT_PATH
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
X-List-Received-Date: Mon, 31 Oct 2016 16:25:15 -0000
X-Groupsio-MsgNum: 88809
Content-Type: multipart/signed;
	boundary="Apple-Mail=_D321794C-9209-46C0-8A71-03943C2CAD15";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_D321794C-9209-46C0-8A71-03943C2CAD15
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Oct 31, 2016, at 5:48 AM, Andreas M=C3=BCller =
<schnitzeltony@googlemail.com> wrote:
>=20
> On Sun, Oct 30, 2016 at 9:07 PM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Sun, Oct 30, 2016 at 6:38 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Sun, Oct 30, 2016 at 6:34 AM, Andreas M=C3=BCller
>>> <schnitzeltony@googlemail.com> wrote:
>>>> On Sat, Oct 29, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com> =
wrote:
>>>>> This has been cause of issue where we were getting both =
usr/include
>>>>> dirs ( from target as well as native sysroot) added to compiler
>>>>> flags.
>>>>>=20
>>>>> CXX_INCLUDES in final flags.cmake would include
>>>>> -I<target-sysroot>/usr/include -I<native-sysroot>/usr/include
>>>>> most of the time it would work since headers are mostly
>>>>> common but netflix package failed to compile since one of
>>>>> the headers was including curl headers which it could not
>>>>> find in target sysroot and it went to next include path
>>>>> and found it in native sysroot which is not what we want
>>>>> when doing cross compile.
>>>>>=20
>>>>> As per https://cmake.org/Wiki/CMake_Cross_Compiling
>>>>> never search for programs in target sysroot but search
>>>>> for packages,libs,includes only.
>>>>>=20
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> ---
>>>>> meta/classes/cmake.bbclass | 3 ++-
>>>>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>=20
>>>>> diff --git a/meta/classes/cmake.bbclass =
b/meta/classes/cmake.bbclass
>>>>> index 3e762de..3e8df37 100644
>>>>> --- a/meta/classes/cmake.bbclass
>>>>> +++ b/meta/classes/cmake.bbclass
>>>>> @@ -25,6 +25,7 @@ OECMAKE_PERLNATIVE_DIR ??=3D ""
>>>>> OECMAKE_EXTRA_ROOT_PATH ?=3D ""
>>>>>=20
>>>>> OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "ONLY"
>>>>> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-target =3D "NEVER"
>>>> ^ Split this into a second patch please you are changing two more =
or
>>>> less unrelated settings in one patch.
>>>=20
>>> These changes are related and should stay together in same patch
>>> otherwise it will break.
>>>=20
>>>>> OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native =3D "BOTH"
>>>>>=20
>>>>> EXTRA_OECMAKE_append =3D " ${PACKAGECONFIG_CONFARGS}"
>>>>> @@ -60,7 +61,7 @@ set( CMAKE_CXX_LINK_FLAGS =
"${OECMAKE_CXX_LINK_FLAGS}" CACHE STRING "LDFLAGS" )
>>>>>=20
>>>>> # only search in the paths provided so cmake doesnt pick
>>>>> # up libraries and tools from the native build machine
>>>>> -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} =
${STAGING_DIR_NATIVE} ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} =
${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
>>>>> +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${CROSS_DIR} =
${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} =
${EXTERNAL_TOOLCHAIN})
>>>> ^ Are you sure this doesn't break native builds? I am a bit scared: =
In
>>>> meta-qt5-extra I have lot's of native builds for build-helpers. KDE
>>>> guys seem to prefer this over shell scripts...
>>>=20
>>> It hasnt broken anything for my world builds thus far. I dont use
>>> meta-qt5-extras though. So testing help is welcome.
>> I'll give it a meta-qt5-extra world build and let you know
>>=20
> Huge fallout:
>=20
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
karchive/karchive.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier2/=
kdoctools/kdoctools-native.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
kwindowsystem/kwindowsystem.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
kcodecs/kcodecs.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
kconfig/kconfig.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
kguiaddons/kguiaddons.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
kdbusaddons/kdbusaddons.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
kitemviews/kitemviews.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
attica/attica.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
sonnet/sonnet.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
kcoreaddons/kcoreaddons-native.bb:do_compile
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
kidletime/kidletime.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
kwayland/kwayland.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-lxqt/libqtxdg/=
libqtxdg_git.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
threadweaver/threadweaver.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
networkmanager-qt/networkmanager-qt.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
kdnssd/kdnssd.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
modemmanager-qt/modemmanager-qt.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-misc/recipes-m=
ultimedia/projectm/projectm_git.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
kplotting/kplotting.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1/=
breeze-icons/breeze-icons.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-lxqt/compton-c=
onf/compton-conf_git.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-lxqt/qterminal=
/qterminal_git.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-lxqt/obconf-qt=
/obconf-qt_git.bb:do_configure
>  =
/home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-misc/recipes-m=
ultimedia/mixxx/mixxx_git.bb:do_compile


>=20
> so please don't apply this one

Not yet, but specify both native includedir and target includedir while =
building something is broken at core
that must be fixed in anycase. May be these fallouts are just latent =
issues that were papered over in past.
Can you upload the logs somewhere ?

>=20
> Andreas


--Apple-Mail=_D321794C-9209-46C0-8A71-03943C2CAD15
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgXcGkACgkQuwUzVZGdMxTzJQCfXzR9FCR2tz+0fGhBlCSG/lMd
rj0Anj0s+/8QtOQdoipThp6sQeuZ8NTx
=VDul
-----END PGP SIGNATURE-----

--Apple-Mail=_D321794C-9209-46C0-8A71-03943C2CAD15--
