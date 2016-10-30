Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4D0CA719D0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 20:06:59 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id x186so716318vkd.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Oct 2016 13:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=CH3uZkt3o/htKgOVP71Mm6eoCut/hE6DKmcg9b9r8sc=;
	b=sjw4MVvFqqHgd2sgiugyTrQfpTTRtunSEi7e8OOKW/NObxq6uyZqpWQZn3jBy5qanw
	9k5/LW5guc5MjuvKW0m8nGbpNGmHcapclcmQ9L3bQ7iRsszBWXXG0Myf5D5JviANinJl
	2OPW0VCBonPZwlvbJqOZ2qpSMNqwfse1NR1CjQXrYvYw/97QVz9OK5TS3DSYmbeqRA6t
	Jgn0vKZNT58Qr18Hrs/1h7CWy6Tx0/Xw/BzK9KzToCyTdh5BIS+9jXJ+Tk8chxyyBtN4
	QYT5ohJqYC9XbsrbvRpLhupcOnHbT12S2boUmFaVl4zZTYpIJ0oSdkRep00pHcDMDAYT
	tvKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=CH3uZkt3o/htKgOVP71Mm6eoCut/hE6DKmcg9b9r8sc=;
	b=UZJYgpaU55xo3es/cZ51XU0/7ETQ1dzL9k8KIIIGeqTHtEyBn7FoXePhW7+MsSYlmZ
	bt3tC4IgQFqHzxcr9U8Y6XHO0PZqYpr9+Jn/DlE0MbG/fzDw01LBAzv/6trrAEJqzL57
	3QQqtevnikNQ4U4nk6LH23ZmocA+bcM63liCpyQhoJ2hgXEU1uGxhhv7wUekTEPW+EsU
	vHYAqjriD1/8CUpvOoYYDR995MOLJek3TnXEGSv3SwZCaZ3ZoW780exUOnOoPyzvSgx1
	8X7EjZNvXGQdDHYVCjZD+UrIftIj3AFaUd2ISaanF/CtTWG/86OCuDQXXVqnfTJEBqqB
	Mjug==
X-Gm-Message-State: ABUngvdQx+oi/nPLczlTLiAbRlBa5qqAI12HicYaieIeZcmmVqr9pC+hMGPE5j4cm91dLbh4A7+cM+IaPdmS1A==
X-Received: by 10.31.216.4 with SMTP id p4mr18682416vkg.51.1477858021047; Sun,
	30 Oct 2016 13:07:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.36.211 with HTTP; Sun, 30 Oct 2016 13:07:00 -0700 (PDT)
In-Reply-To: <CAMKF1sr=VwcPUpdV9BTfVKuq_sD0Btnm6zkW3xFWNh=e_T=ZHw@mail.gmail.com>
References: <20161029084707.29652-1-raj.khem@gmail.com>
	<CALbNGRSvqDHCA-3VPt379-Np29hZo-0ONbj=ZFd+Eew1K=4zFw@mail.gmail.com>
	<CAMKF1sr=VwcPUpdV9BTfVKuq_sD0Btnm6zkW3xFWNh=e_T=ZHw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Date: Sun, 30 Oct 2016 21:07:00 +0100
Message-ID: <CALbNGRQ2aKUmRyH1b-aAjx1FNgyrrkOyCWwSRVENM5repVGY9w@mail.gmail.com>
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
X-List-Received-Date: Sun, 30 Oct 2016 20:07:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 30, 2016 at 6:38 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Oct 30, 2016 at 6:34 AM, Andreas M=C3=BCller
> <schnitzeltony@googlemail.com> wrote:
>> On Sat, Oct 29, 2016 at 10:47 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> This has been cause of issue where we were getting both usr/include
>>> dirs ( from target as well as native sysroot) added to compiler
>>> flags.
>>>
>>> CXX_INCLUDES in final flags.cmake would include
>>> -I<target-sysroot>/usr/include -I<native-sysroot>/usr/include
>>> most of the time it would work since headers are mostly
>>> common but netflix package failed to compile since one of
>>> the headers was including curl headers which it could not
>>> find in target sysroot and it went to next include path
>>> and found it in native sysroot which is not what we want
>>> when doing cross compile.
>>>
>>> As per https://cmake.org/Wiki/CMake_Cross_Compiling
>>> never search for programs in target sysroot but search
>>> for packages,libs,includes only.
>>>
>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> ---
>>>  meta/classes/cmake.bbclass | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
>>> index 3e762de..3e8df37 100644
>>> --- a/meta/classes/cmake.bbclass
>>> +++ b/meta/classes/cmake.bbclass
>>> @@ -25,6 +25,7 @@ OECMAKE_PERLNATIVE_DIR ??=3D ""
>>>  OECMAKE_EXTRA_ROOT_PATH ?=3D ""
>>>
>>>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "ONLY"
>>> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-target =3D "NEVER"
>> ^ Split this into a second patch please you are changing two more or
>> less unrelated settings in one patch.
>
> These changes are related and should stay together in same patch
> otherwise it will break.
>
>>>  OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM_class-native =3D "BOTH"
>>>
>>>  EXTRA_OECMAKE_append =3D " ${PACKAGECONFIG_CONFARGS}"
>>> @@ -60,7 +61,7 @@ set( CMAKE_CXX_LINK_FLAGS "${OECMAKE_CXX_LINK_FLAGS}"=
 CACHE STRING "LDFLAGS" )
>>>
>>>  # only search in the paths provided so cmake doesnt pick
>>>  # up libraries and tools from the native build machine
>>> -set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${STAGING_DIR_NATIVE} ${=
CROSS_DIR} ${OECMAKE_PERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_=
TOOLCHAIN})
>>> +set( CMAKE_FIND_ROOT_PATH ${STAGING_DIR_HOST} ${CROSS_DIR} ${OECMAKE_P=
ERLNATIVE_DIR} ${OECMAKE_EXTRA_ROOT_PATH} ${EXTERNAL_TOOLCHAIN})
>> ^ Are you sure this doesn't break native builds? I am a bit scared: In
>> meta-qt5-extra I have lot's of native builds for build-helpers. KDE
>> guys seem to prefer this over shell scripts...
>
> It hasnt broken anything for my world builds thus far. I dont use
> meta-qt5-extras though. So testing help is welcome.
I'll give it a meta-qt5-extra world build and let you know

Andreas

