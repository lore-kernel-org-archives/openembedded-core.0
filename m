Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id E1E2771A31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 12:48:40 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id p9so73236vkd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 05:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Lmb4VY+065bjQgI8juV9Ee6Iz/AtC21Ip2sicW/pQ2M=;
	b=PR72cxM7wgrl4PzLhgUkQPi+2Kkjnq2PflKXs2kWc8yCbpBD4GrOlVS45rjxi+Nng/
	QOf7WeC8NVl2Hbx7AG55aXcdWEjh0r61vY52zDGU6NHViVPmx49haLgykXl2/cTJR/NT
	s7aCHgm4Bc22IVmPYd2FztfxIyHNfNwEE1hOBvxF8g4paFYG6J0qNlrcIWN29SgXJ6/A
	bZDbc1N3c5Q6ldUD9fPsLMoxDlYQwlNfRs2J+e9/IJyH9zlzGQ6lImLx6DTeywD0vHkA
	dWf2bIm0BI2/SB1quOzTG7NLngkTs7SWJzV45P5tkVWqVxUl4JgaucLia5tmKJAIeu7G
	OPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Lmb4VY+065bjQgI8juV9Ee6Iz/AtC21Ip2sicW/pQ2M=;
	b=PegX3myuvDH2QGxcgTEUMK+uUI5fNTeBYmd8atdC2mUX+k9MwPChkvJ4JbmNY2fkNd
	rgdTgb1wkZRFz7OO1NwcYA9GzaZtRLllSPcGszeMqeJqdu3Q7gqwuEGNm8GiUUOwrLOk
	K2oKp0l8rZSWgTjGYD4XZFcwQIqKCVgj5y2ZpWyCvTS7l2rX8EkscTXrhv8W0l6NgQzm
	wSA2MDOeyTPtcLBmdMmJmlvWg3zWrvDdB0725cE/+kVcbGaEI/lExt3qHf9eFqfZvTXl
	XbIRn47urtFKKyD5+6lAPVevUaGZq9Vt8iuHe99dmM1NfUJVQzdunB4D9xxyipuYzz2D
	cj+w==
X-Gm-Message-State: ABUngveb6c4GBTGNzwGqUWnUSMxrViAwvI8qoy5mhNDZRoOpggn6wbc69gbGW5+GfpEygKjw7DQDmGRa6ZULzQ==
X-Received: by 10.31.161.65 with SMTP id k62mr23506844vke.12.1477918121688;
	Mon, 31 Oct 2016 05:48:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.36.211 with HTTP; Mon, 31 Oct 2016 05:48:41 -0700 (PDT)
In-Reply-To: <CALbNGRQ2aKUmRyH1b-aAjx1FNgyrrkOyCWwSRVENM5repVGY9w@mail.gmail.com>
References: <20161029084707.29652-1-raj.khem@gmail.com>
	<CALbNGRSvqDHCA-3VPt379-Np29hZo-0ONbj=ZFd+Eew1K=4zFw@mail.gmail.com>
	<CAMKF1sr=VwcPUpdV9BTfVKuq_sD0Btnm6zkW3xFWNh=e_T=ZHw@mail.gmail.com>
	<CALbNGRQ2aKUmRyH1b-aAjx1FNgyrrkOyCWwSRVENM5repVGY9w@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 31 Oct 2016 13:48:41 +0100
Message-ID: <CALbNGRRcthK1Vpp-Yx90hN9TjAHexgY3cVbJC3fgvcLtfoM4MA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Mon, 31 Oct 2016 12:48:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2016 at 9:07 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Sun, Oct 30, 2016 at 6:38 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Sun, Oct 30, 2016 at 6:34 AM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>> On Sat, Oct 29, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> This has been cause of issue where we were getting both usr/include
>>>> dirs ( from target as well as native sysroot) added to compiler
>>>> flags.
>>>>
>>>> CXX_INCLUDES in final flags.cmake would include
>>>> -I<target-sysroot>/usr/include -I<native-sysroot>/usr/include
>>>> most of the time it would work since headers are mostly
>>>> common but netflix package failed to compile since one of
>>>> the headers was including curl headers which it could not
>>>> find in target sysroot and it went to next include path
>>>> and found it in native sysroot which is not what we want
>>>> when doing cross compile.
>>>>
>>>> As per https://cmake.org/Wiki/CMake_Cross_Compiling
>>>> never search for programs in target sysroot but search
>>>> for packages,libs,includes only.
>>>>
>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>> ---
>>>>  meta/classes/cmake.bbclass | 3 ++-
>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>>>> index 3e762de..3e8df37 100644
>>>> --- a/meta/classes/cmake.bbclass
>>>> +++ b/meta/classes/cmake.bbclass
>>>> @@ -25,6 +25,7 @@ OECMAKE_PERLNATIVE_DIR ??=3D ""
>>>>  OECMAKE_EXTRA_ROOT_PATH ?=3D ""
>>>>
>>>>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "ONLY"
>>>> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-target =3D "NEVER"
>>> ^ Split this into a second patch please you are changing two more or
>>> less unrelated settings in one patch.
>>
>> These changes are related and should stay together in same patch
>> otherwise it will break.
>>
>>>>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native =3D "BOTH"
>>>>
>>>>  EXTRA_OECMAKE_append =3D " ${PACKAGECONFIG_CONFARGS}"
>>>> @@ -60,7 +61,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}=
" CACHE STRING "LDFLAGS" )
>>>>
>>>>  # only search in the paths provided so cmake doesnt pick
>>>>  # up libraries and tools from the native build machine
>>>> -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} $=
{CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL=
_TOOLCHAIN})
>>>> +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${CROSS_DIR} ${OECMAKE_=
PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
>>> ^ Are you sure this doesn't break native builds? I am a bit scared: In
>>> meta-qt5-extra I have lot's of native builds for build-helpers. KDE
>>> guys seem to prefer this over shell scripts...
>>
>> It hasnt broken anything for my world builds thus far. I dont use
>> meta-qt5-extras though. So testing help is welcome.
> I'll give it a meta-qt5-extra world build and let you know
>
Huge fallout:

  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/karchive/karchive.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier2=
/kdoctools/kdoctools-native.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/kwindowsystem/kwindowsystem.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/kcodecs/kcodecs.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/kconfig/kconfig.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/kguiaddons/kguiaddons.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/kdbusaddons/kdbusaddons.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/kitemviews/kitemviews.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/attica/attica.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/sonnet/sonnet.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/kcoreaddons/kcoreaddons-native.bb:do_compile
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/kidletime/kidletime.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/kwayland/kwayland.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-lxqt/libqtxdg=
/libqtxdg_git.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/threadweaver/threadweaver.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/networkmanager-qt/networkmanager-qt.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/kdnssd/kdnssd.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/modemmanager-qt/modemmanager-qt.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-misc/recipes-=
multimedia/projectm/projectm_git.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/kplotting/kplotting.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tier1=
/breeze-icons/breeze-icons.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-lxqt/compton-=
conf/compton-conf_git.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-lxqt/qtermina=
l/qterminal_git.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-lxqt/obconf-q=
t/obconf-qt_git.bb:do_configure
  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-misc/recipes-=
multimedia/mixxx/mixxx_git.bb:do_compile

so please don't apply this one

Andreas

