Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id EAEBE719F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 17:49:41 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id b35so4849323uaa.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 10:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=B1mMa6Sf9WHqI7+oujU8QJabQ8OXeF0F4BzRAJQGHug=;
	b=TPJPVg78h/OudgbfNHe0gUFNlh/ZTj1aVj8sxOklSpjIkbLxLVUYnG0DkTtqGJVP0y
	XQsJs/PLyaO1yZFKHwDsLfTJvDfSX0+JykmBJt6jtnHfp6gjw5LSF7CNri+GeWcHfK1I
	bo+ooqbiR4ol9sX6WAZKR/YPsGKFzCJ6XvRw5Qd+C0gykw7Ded9w8XA5S7c+YTV+oaD2
	Yamk5dptBB29iqnSlE4PRvk3pic8uXTUchobe1iTRYqwYzxtrXzKzvN6wp3cezM7WfO7
	7QcxvWMUIGkxH8OD4lG5b8R8dDDMpz7SHmn6BcJgAYxuetmWRdLCwyvm3Y6WZ7uO6zcQ
	dKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=B1mMa6Sf9WHqI7+oujU8QJabQ8OXeF0F4BzRAJQGHug=;
	b=Je7OEP2xpu0Q7zjgBf8wJ6TVwrXPda3Br7DKS/jicwGZJS2SOuTXsOXdmkK2yFpgZb
	nER8p1wf5xkIBrRijJJfCDWWvt1rjxSkSITBUndIB6jpfFiMHyzwlZZbb3yoC00ZTrQL
	EDNBYujaTMFghvYxJtMIIntaxxZQtUYKzczIAsHocjw+XadRdw0eDMWLX8g6Uev/jZd5
	Q48M0rSWgIT5zwiLtDxqdQ+odystdoXcDP6vnVDXkdvBANpEpodmpK4bd5qwkwTMLA62
	vOA0URxP4bQosoPXYolTOisdn5FFGrfhKUog71N+ALDMvIWnmNgheenf0TeDg0ikquyL
	twyw==
X-Gm-Message-State: ABUngvfU0n5Iib/GFT8SvvtSmbtrs/0og9Xkv2Wcj5hQcsg9ekpso38wyeyaT8lOtjvSKIFJkSZaMVId0oPFtg==
X-Received: by 10.176.5.130 with SMTP id e2mr24134142uae.108.1477936182131;
	Mon, 31 Oct 2016 10:49:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.36.211 with HTTP; Mon, 31 Oct 2016 10:49:41 -0700 (PDT)
In-Reply-To: <582B4854-F54B-492A-8897-F09981AA23C1@gmail.com>
References: <20161029084707.29652-1-raj.khem@gmail.com>
	<CALbNGRSvqDHCA-3VPt379-Np29hZo-0ONbj=ZFd+Eew1K=4zFw@mail.gmail.com>
	<CAMKF1sr=VwcPUpdV9BTfVKuq_sD0Btnm6zkW3xFWNh=e_T=ZHw@mail.gmail.com>
	<CALbNGRQ2aKUmRyH1b-aAjx1FNgyrrkOyCWwSRVENM5repVGY9w@mail.gmail.com>
	<CALbNGRRcthK1Vpp-Yx90hN9TjAHexgY3cVbJC3fgvcLtfoM4MA@mail.gmail.com>
	<582B4854-F54B-492A-8897-F09981AA23C1@gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Mon, 31 Oct 2016 18:49:41 +0100
Message-ID: <CALbNGRTr4dVBSxrUCjFgNPRM8Hf4aQba6xqzz8WJOv4+-Qa-Uw@mail.gmail.com>
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
X-List-Received-Date: Mon, 31 Oct 2016 17:49:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 31, 2016 at 5:25 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Oct 31, 2016, at 5:48 AM, Andreas M=C3=BCller <schnitzeltony@googlema=
il.com> wrote:
>>
>> On Sun, Oct 30, 2016 at 9:07 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>> On Sun, Oct 30, 2016 at 6:38 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On Sun, Oct 30, 2016 at 6:34 AM, Andreas M=C3=BCller
>>>> <schnitzeltony@googlemail.com> wrote:
>>>>> On Sat, Oct 29, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com> wrote=
:
>>>>>> This has been cause of issue where we were getting both usr/include
>>>>>> dirs ( from target as well as native sysroot) added to compiler
>>>>>> flags.
>>>>>>
>>>>>> CXX_INCLUDES in final flags.cmake would include
>>>>>> -I<target-sysroot>/usr/include -I<native-sysroot>/usr/include
>>>>>> most of the time it would work since headers are mostly
>>>>>> common but netflix package failed to compile since one of
>>>>>> the headers was including curl headers which it could not
>>>>>> find in target sysroot and it went to next include path
>>>>>> and found it in native sysroot which is not what we want
>>>>>> when doing cross compile.
>>>>>>
>>>>>> As per https://cmake.org/Wiki/CMake_Cross_Compiling
>>>>>> never search for programs in target sysroot but search
>>>>>> for packages,libs,includes only.
>>>>>>
>>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>>> ---
>>>>>> meta/classes/cmake.bbclass | 3 ++-
>>>>>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>>>>>> index 3e762de..3e8df37 100644
>>>>>> --- a/meta/classes/cmake.bbclass
>>>>>> +++ b/meta/classes/cmake.bbclass
>>>>>> @@ -25,6 +25,7 @@ OECMAKE_PERLNATIVE_DIR ??=3D ""
>>>>>> OECMAKE_EXTRA_ROOT_PATH ?=3D ""
>>>>>>
>>>>>> OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "ONLY"
>>>>>> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-target =3D "NEVER"
>>>>> ^ Split this into a second patch please you are changing two more or
>>>>> less unrelated settings in one patch.
>>>>
>>>> These changes are related and should stay together in same patch
>>>> otherwise it will break.
>>>>
>>>>>> OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native =3D "BOTH"
>>>>>>
>>>>>> EXTRA_OECMAKE_append =3D " ${PACKAGECONFIG_CONFARGS}"
>>>>>> @@ -60,7 +61,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAG=
S}" CACHE STRING "LDFLAGS" )
>>>>>>
>>>>>> # only search in the paths provided so cmake doesnt pick
>>>>>> # up libraries and tools from the native build machine
>>>>>> -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE}=
 ${CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERN=
AL_TOOLCHAIN})
>>>>>> +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${CROSS_DIR} ${OECMAK=
E_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
>>>>> ^ Are you sure this doesn't break native builds? I am a bit scared: I=
n
>>>>> meta-qt5-extra I have lot's of native builds for build-helpers. KDE
>>>>> guys seem to prefer this over shell scripts...
>>>>
>>>> It hasnt broken anything for my world builds thus far. I dont use
>>>> meta-qt5-extras though. So testing help is welcome.
>>> I'll give it a meta-qt5-extra world build and let you know
>>>
>> Huge fallout:
>>
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/karchive/karchive.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r2/kdoctools/kdoctools-native.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/kwindowsystem/kwindowsystem.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/kcodecs/kcodecs.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/kconfig/kconfig.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/kguiaddons/kguiaddons.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/kdbusaddons/kdbusaddons.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/kitemviews/kitemviews.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/attica/attica.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/sonnet/sonnet.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/kcoreaddons/kcoreaddons-native.bb:do_compile
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/kidletime/kidletime.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/kwayland/kwayland.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-lxqt/libqtx=
dg/libqtxdg_git.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/threadweaver/threadweaver.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/networkmanager-qt/networkmanager-qt.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/kdnssd/kdnssd.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/modemmanager-qt/modemmanager-qt.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-misc/recipe=
s-multimedia/projectm/projectm_git.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/kplotting/kplotting.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-kde/kf5/tie=
r1/breeze-icons/breeze-icons.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-lxqt/compto=
n-conf/compton-conf_git.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-lxqt/qtermi=
nal/qterminal_git.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-lxqt/obconf=
-qt/obconf-qt_git.bb:do_configure
>>  /home/superandy/data/oe-core/sources/meta-qt5-extra/recipes-misc/recipe=
s-multimedia/mixxx/mixxx_git.bb:do_compile
>
>
>>
>> so please don't apply this one
>
> Not yet, but specify both native includedir and target includedir while b=
uilding something is broken at core
> that must be fixed in anycase. May be these fallouts are just latent issu=
es that were papered over in past.
> Can you upload the logs somewhere ?
>
Sorry I killed them - my harddisk is not able to keep much more than 2
tmpdirs and I lost 1 day for this test already. I think the problem is
that you want to kill references to includedir but you kill all
references even those to native binaries addressed and required by
cmake. These native binaries cannot be addressed anymore without
searching in native sysroot and there is nothing wrong about it.

Andreas

