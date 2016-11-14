Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1BB356010D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 10:35:28 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id a197so89543826wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 02:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bG4S5VHBFz91jZ2vrph3eSdBeQM7EoeQq3mqs65SIUk=;
	b=f0GsUxR0cVgs5/KxobzMRU/I345fHAHTl/ukWkhIFtrhfG1bknQ4ko2vjnZk854EQe
	oE4sK+gzroyy5q3qg7YU5kGautgbQNcW6ZzVO0Q+DIFdmUidCrU7c4qOFvHGoMWSKcaF
	j5LnFullHky3jwiUobFQAjw27FLsOISpkGlt9Amv2YdLm0+D8hpw5QcI45U4snAK/dLE
	BAAnz+yY3nQ+6+t9CgnSCSCBN26BVXPHtp5Vm+7YKD1jMdNrOlauXLW35s4r4SOzviUI
	4cdhSPQ0bxNH3Lheo3bbCVYyRrFVCARF859ibLzeyryJyBhBKBN/pXyGpN+vE4aU8EIN
	geXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bG4S5VHBFz91jZ2vrph3eSdBeQM7EoeQq3mqs65SIUk=;
	b=Jk6VKENnP1NIh5aqMYxoBprVC6BJogLlLJ3iqkzYFzBzvVZeC3SuSTdu52kQqx4nuv
	wm+wcO+CxPH0VyCrPlzLEDQJAiC2tl3kU40dUvm1pHIPmWlKGdTrlg0QawRhL1yp+dEP
	ttjG+XgXwkyWqO/tD0rBvSU/rdi0iXSVMFYI8VlA/ONHbErSv+0dJ0n+854LP65rQ6BK
	gI/DKNice5AFoEXmSOk554f/64vPsg1bXDu9X9aEf4sZgGgXaIF+5IQae88A6xDPJ/A0
	adjeYWazwlrSTN2zmnB3DFqXVh/w4aHiYQCIzReZYlRdkiv0U7HBD0qVfdUZ1FyAQGTQ
	42bg==
X-Gm-Message-State: ABUngvdX1M2pnrZYSZqArpmGHD1Xf7vpNr8jMhrfrk4gG32gJKRFcNxcO5zU3eOsU248ILoSjjmRoZE63VTTAQ==
X-Received: by 10.28.66.7 with SMTP id p7mr10156686wma.64.1479119729903; Mon,
	14 Nov 2016 02:35:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Mon, 14 Nov 2016 02:35:09 -0800 (PST)
In-Reply-To: <CAJTo0LaLwE+VOJwa3vad2XOc0FmwPpcGOxUvev=7RbnatnOKRg@mail.gmail.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
	<CAJTo0LZiXenXy8WC28z+5a4+ibJekaqeD+0_O84aejyi9XNH4w@mail.gmail.com>
	<CAD4b0_J6hKetcbiXvUS3wAeo19QSGF=5DCFZnLK-0Lz904-6DA@mail.gmail.com>
	<CAJTo0LaLwE+VOJwa3vad2XOc0FmwPpcGOxUvev=7RbnatnOKRg@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Mon, 14 Nov 2016 11:35:09 +0100
Message-ID: <CAD4b0_LBO_WbaGdaYne7U8KT0QiBb=P5_Th0MjzR24F6px-vXA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Maciej Borzecki <maciek.borzecki@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 00/10] wic: bugfixes & --fixed-size support, tests, selftest: minor fixes
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
X-List-Received-Date: Mon, 14 Nov 2016 10:35:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2016 at 11:16 AM, Burton, Ross <ross.burton@intel.com> wrot=
e:
>
> On 14 November 2016 at 10:02, Maciej Borz=C4=99cki <maciej.borzecki@rndit=
y.com>
> wrote:
>>
>> I see that the builds were running with qemux85-64 MACHINE, shouldn't
>> TARGET_ARCH be set to x86-64 then? There's a check that builds
>> syslinux(-native) for x86 archs only since it's not buildable for
>> anything else. Same for HDDIMG.
>
>
> Not quite:
>
> $ MACHINE=3Dqemux86 bitbake core-image-minimal -e | grep ^TARGET_ARCH=3D
> TARGET_ARCH=3D"i586"
>
> $ MACHINE=3Dqemux86-64 bitbake core-image-minimal -e | grep ^TARGET_ARCH=
=3D
> TARGET_ARCH=3D"x86_64"
>
> (had to patch bitbake.conf to export TARGET_ARCH)

Do you think it makes sense to replace TARGET_ARCH check with something
like this instead:

        arch =3D get_bb_var('HOST_ARCH', 'core-image-minimal')

        is_x86 =3D arch in ['i586', 'i686', 'x86-64']
        if is_x86:
            self.write_config('IMAGE_FSTYPES +=3D " hddimg"\n'
                              'MACHINE_FEATURES_append =3D " efi"\n')

Basically, I do not want to build syslinux or set config options that
are usable on x86 target when building for other targets.


>
>>
>> One more question, the assert raised when comparing parted's output is
>> caused by different locale. Do you think it would be ok to just enforce
>> LC_ALL=3DC when running commands under wic?
>
>
> Yes, enforcing a  locale is essential when comparing output of commands.
> Bitbake switches to en_US.UTF8 on startup for the same reason, so feel fr=
ee
> to use that or C.

I suppose I'll just enforce that in oe-selftest.



--=20
Maciej Borzecki
RnDity

