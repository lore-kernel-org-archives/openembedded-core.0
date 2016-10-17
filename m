Return-Path: <raj.khem@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6C52F6071F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 21:09:46 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id 130so6206594vkg.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 14:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Jpve+DSLIQKSmbnhQM15tZHWuQpNT2jY/ems+7saSLg=;
	b=cb05ovqOB8OnF340N3CW/tjyidGnr6BCSL2Cr0tvOxFQy+plVPYPGZP8iA8J5jmR7s
	to5c0j9JQbgbUX4z7hQOTA1o+Y5fR/eo0H4VeZ2EjFm+lv2RAFVyewhQixJu0DvF8TPD
	AWCHdl3Lk4cLiZt9kHC3O2c1JgukRiQX5HQXHoTcr8MDT/AqLXyolGjL/groebxlt9QR
	1KLtu9NKWtn1HrC5ga99b82ou5WO2lmowQnJEvqAPVZ4iy+r8fAPVVNbMHVCfvbVNjVe
	avg7qG23ZP5C1dyz+5sqgjk/4RgA1kz/FvjakUixubQk6fUXqLx2OamYnSVqXdOh3aSI
	nMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Jpve+DSLIQKSmbnhQM15tZHWuQpNT2jY/ems+7saSLg=;
	b=caIkIb8Bb+Rt2Gq9tZHV3VfI36YHbfXVBoGRPPPZobIYlDd6yuvtYh3QLq/fcZozR5
	7IAtI6uerkQqWgvS75/Ujc27ZLD1JGa0yWne3+ivMHaaRqv1UnSFI7fwQiwn0/TYVd++
	3lLZQPXGIXTNHHBB280iWRc16EuQfyNn2nB/LuHEB8DRo3xM5iUVAkgm4EiPgws4V+AP
	rAhBB8+pJqFkalr3HBE+HJfLZmTFfAmaHu8KtBNzvRFO207KaoM50QJRgzc7En5QoL5U
	a4G31fIQi9uM7yiSW1yphbdpQOx6DMcCthYyOX4iH5yWBPNWWSiQsq+P/HBSDmPS1fBS
	w1BQ==
X-Gm-Message-State: AA6/9RlKAdj7bD30ow1oVv3u3J2OH/f0pTUYniP9dXEXMRAjcBZ+/HwbQtM7eXNG1VEU2vOso7hQOI4Q+4TrHQ==
X-Received: by 10.31.153.17 with SMTP id b17mr19546495vke.84.1476738587551;
	Mon, 17 Oct 2016 14:09:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.86.206 with HTTP; Mon, 17 Oct 2016 14:09:17 -0700 (PDT)
In-Reply-To: <5804F2C9.80809@linux.intel.com>
References: <44095a65-4aab-648f-5538-08b02f58bee7@siemens.com>
	<CADkTA4PHxV6uoUXiGRm7PfPP_sqs8G_9Uxg6wqsB++xKSOp=uw@mail.gmail.com>
	<ece016ec-8f57-fe4f-c730-54fa99f02b1b@siemens.com>
	<5804F2C9.80809@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Oct 2016 14:09:17 -0700
Message-ID: <CAMKF1spqmLF4UcZ5i--HVn6s_V4OmKX2LDtsOxjU17Je2LEFjQ@mail.gmail.com>
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: The future of qemuarm
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
X-List-Received-Date: Mon, 17 Oct 2016 21:09:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 17, 2016 at 8:48 AM, An=C3=ADbal Lim=C3=B3n
<anibal.limon@linux.intel.com> wrote:
>
>
> On 10/17/2016 10:20 AM, Pascal Bach wrote:
>>
>>>
>>> Whatever we replace it with has to be part of linux-yocto and the meta =
data that is
>>> carried there, so it can be used for the sanity/smoke test machine for =
arch arm.
>>>
>>> As such, it has to be feature compatible (network capabilities, disk bo=
ot, etc) with
>>> the existing arm versatile 926ejs platform
>>>
>>> There have been newer variants for ages, but since there's been no comp=
elling
>>> reason to upgrade, I continue to carry the existing platform support al=
ong to the
>>> new kernels. (In fact, I've had a qemuarma9 around for nearly 3 years n=
ow, but
>>> it lacked some disk controller support).
>> My main motivation is to get valgrind running. This requires at least ar=
mv7 to be useful.
>> Most physical boards are not powerful enough (memory and cpu) to do real=
 work with valgrind.
>> QEMU would be helpful for that.
>>>
>>> From the kernel point of view, updating the platform doesn't have any b=
ig benefits,
>>> but for userspace it could shake out issues with toolchains and instruc=
tions, so
>>> there is a gain to be had there.
>> In order to find more bugs there would be multiple qemuarms (qemuarm =3D=
 armv5, qemuarmv7 =3D armv7, ...).
>> Is this what you are suggesting?
>>>
>>> If someone is motivated, I'm happy to help work on an update to the cor=
e qemuarm
>>> platform .. it just has to meet the criteria above.
>
> I like the idea to have a new version of qemuarm instead of armv5 but
> that needs to be considerate in terms of,
>
> Do we aim to support multiple versions of qemuarm?, i'm saying this
> because of the comments by Bruce about all the testing and the effort
> needed to support another qemuarm variant.
>
> If we only want one version of qemuarm, what version you suggest? and why=
?.
>
> Finally i like the idea to be able to use valgrind into emulation that
> will speed up debugging times.

This has been discussed more than once in past and armv5 being the lowest c=
ommon
denominator for ARM devices always won the battle. It still might be,
however it will
be interesting to know how many folks still require armv5te qemuarm. A
raise of hands
might show interest. meta-linaro does support v7 based qemu here

https://git.linaro.org/openembedded/meta-linaro.git/tree/HEAD:/meta-linaro/=
conf/machine

should we move this to oe-core, may b discussing it further on
architecture list can yield
better results.

>
> Cheers,
>         alimon
>
>>>
>>
>> Pascal
>>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

