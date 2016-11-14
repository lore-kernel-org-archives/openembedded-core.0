Return-Path: <maciej.borzecki@rndity.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id EBEEB60722
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 14:04:02 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id a197so99668434wmd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Nov 2016 06:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rndity-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=EAYTnEfyiuqGpq9+xk5ANJt7zr1FEvYEsl7SoydVmDA=;
	b=Wr+8gUGS6aT9zYasS/lUf4qplf9kWuPbBULanc3mN+BWn60D9dSP1ViI/lJ9AmOLhT
	XA3bKO0GySFMrTXgcfRalU62YRi1tyeXHUjexs2SuAIPI8yX+VVc6azIR8QU7UlY6YdD
	pj7YP2NUW3/bzaQXzUPjj7Kx2zl7fb/VXBO9kr7KfQHQ5yVk1Xa2TncEDs9iRgkhiUGO
	1dv4+y8mDfe+McHYwJTZSFy15cnl0RO8PKWte9GT1Gatv1MKsRtX15sPrj1H4JJSGqQB
	9zBLI7v64VDeSyhsk60uUjnHiPPWX0nqFCh1RyDUpbwNlYJVkqNci+pjrKEFC7y5ekJO
	/0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=EAYTnEfyiuqGpq9+xk5ANJt7zr1FEvYEsl7SoydVmDA=;
	b=HviPjrsRKLXND5/Pdx4AI2Dv6opAzDYe1nqyef7B7c1zJcT8XMZt/IZJfNP+eGn06x
	wZ8bLOVO37i+nBJtXe9b6HQjPL3zCvs7YCMR2ex875x01V6Li/t03pTHLSyiGZ8VqRFK
	X9ql9Jy7ZX12ZGrDvudjtTeieYocd50aPRI5EvPfEPA7TDbbokTsc6uXE8u+K40CBeA9
	3uRqmVwZfbaJPdTuClr5JBUPNlzOfPCK1ikglaK+eRPpsrHuXwd2z7tz4raIke6A7JE2
	EWfWuj46bqJ71WU4dllf1zAog+xmFrG6V5nekUn2r/TqsEOPkE2TyYQGogBmdt+svP8p
	61jQ==
X-Gm-Message-State: ABUngvfUlmIMEeOfqKRv8+Gh7ORzh/m4SnnDyM64gtJDq3jFXZbV/qgyLtYe++Z6mQZ722iTpKd93z8xq7JDjw==
X-Received: by 10.28.113.18 with SMTP id m18mr10401382wmc.101.1479132243180;
	Mon, 14 Nov 2016 06:04:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.15.9 with HTTP; Mon, 14 Nov 2016 06:03:42 -0800 (PST)
In-Reply-To: <CAJTo0LZ+JpE8G-qvLOQburPb+vFCJ-GB6HnGpKZD80tnLpv86A@mail.gmail.com>
References: <cover.1478779674.git.maciej.borzecki@rndity.com>
	<CAJTo0LZiXenXy8WC28z+5a4+ibJekaqeD+0_O84aejyi9XNH4w@mail.gmail.com>
	<CAD4b0_J6hKetcbiXvUS3wAeo19QSGF=5DCFZnLK-0Lz904-6DA@mail.gmail.com>
	<CAJTo0LaLwE+VOJwa3vad2XOc0FmwPpcGOxUvev=7RbnatnOKRg@mail.gmail.com>
	<CAD4b0_LBO_WbaGdaYne7U8KT0QiBb=P5_Th0MjzR24F6px-vXA@mail.gmail.com>
	<CAJTo0LZ+JpE8G-qvLOQburPb+vFCJ-GB6HnGpKZD80tnLpv86A@mail.gmail.com>
From: =?UTF-8?Q?Maciej_Borz=C4=99cki?= <maciej.borzecki@rndity.com>
Date: Mon, 14 Nov 2016 15:03:42 +0100
Message-ID: <CAD4b0_KC108KpwO3kvWqt7LCoqAQZ88_R0b_BXmmuSFAv_xVfQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 14 Nov 2016 14:04:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2016 at 2:34 PM, Burton, Ross <ross.burton@intel.com> wrote=
:
>
> On 14 November 2016 at 10:35, Maciej Borz=C4=99cki <maciej.borzecki@rndit=
y.com>
> wrote:
>>
>> Do you think it makes sense to replace TARGET_ARCH check with something
>> like this instead:
>>
>>         arch =3D get_bb_var('HOST_ARCH', 'core-image-minimal')
>>
>>         is_x86 =3D arch in ['i586', 'i686', 'x86-64']
>>         if is_x86:
>>             self.write_config('IMAGE_FSTYPES +=3D " hddimg"\n'
>>                               'MACHINE_FEATURES_append =3D " efi"\n')
>>
>> Basically, I do not want to build syslinux or set config options that
>> are usable on x86 target when building for other targets.
>
>
> That expression is more likely to work, yeah, though woudn't TARGET_ be m=
ore
> suitable than HOST_?

TARGET_ARCH is in fact not exported as you have indicated, there's this
piece in meta/conf/bitbake.conf:

  # Make sure TARGET_ARCH isn't exported
  # (breaks Makefiles using implicit rules, e.g. quilt, as GNU make has thi=
s
  # in them, undocumented)
  TARGET_ARCH[unexport] =3D "1"

HOST_ARCH defaults to TARGET_ARCH, I suppose it should be fine to use:

  HOST_ARCH =3D "${TARGET_ARCH}"

Cheers,
--=20
Maciej Borzecki
RnDity

