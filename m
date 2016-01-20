Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 94CEA6FFEC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 01:45:49 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l65so160908343wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 17:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=q3XX9N1SjWHTSddgEHPBIicA5/cXsx+LahzpR3ZZYG8=;
	b=rVqWwdEheHrIo1TjZbYd7WX/iMgoCQ958W6UtdUcsxG7c2nfdhSNLOwqsF0MUYWNqd
	DZ8OaNAu0Vpx04guNomZgyWVVgdycnuWUF3JRYoze2mc+2NTL1JccF52jtpWh5uBLcQW
	vdOlHRDM4F6kAjbIL340dESJvWJgaX3+2205I7vcdpTUKjD4jLYIF9ZdnpDbwjNV+gcp
	2Y87NHjeniDPiksGXhkCco0044TGMiRaGC6rTQVTCI8AgkKd8Duh1t7SPj0zNkNZvzKZ
	pWO4VIgtlGZAts3ULxGrQVQtS3LcHUJwTmyKpQSmDgqubrhAG4tygaA+T7Svbp5BOgOj
	QLjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=q3XX9N1SjWHTSddgEHPBIicA5/cXsx+LahzpR3ZZYG8=;
	b=lVRSd5jrGLO7RO7mGxbf0c8LyFtcW0GaBS1kn3KiAr/rHAJJW9Dn8icWZ2/AZnDWlw
	sJrfj3D59aNod00v5pUXxctA586MqPHW0uohOEGwGqyZYepsf4VtNKkn/OksyK4OpWeF
	VlR7Z5ba+qwd201/zREAB2pikTtCTiKfAJmXCk+WPz72pRIkYC0Uj1H/Er4YIkIMbFIN
	CGWspV0TE3L5M5VKlZeyx5ZmhN6j/DYMHt8D/iAHSmOWzty5G/y6eF4XhC0rn2LGn1TD
	GyY4gmY09VyO8SzHuIGSmUGVFQlU7q7w0px7YUDoaXuH112ZwkdPaNVYSAlc+IsEmU2f
	s89Q==
X-Gm-Message-State: ALoCoQmuWUwXu6yi4nkOuxxzf07vrOf+CQnmhKlkiRRHNuEo0R503HNqgRYanVkACqdXcPBisNJ++xbMH7zjPfGoAEopIBukfw==
MIME-Version: 1.0
X-Received: by 10.194.24.226 with SMTP id x2mr32504570wjf.43.1453254349665;
	Tue, 19 Jan 2016 17:45:49 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 19 Jan 2016 17:45:49 -0800 (PST)
In-Reply-To: <B84185CF-3666-49D6-A3FB-3FBCBBFE6B17@gmail.com>
References: <569DE54C.7090506@windriver.com>
	<4D27B3F8-BDBC-43AF-A54C-E4B556388202@gmail.com>
	<CAJ86T=WSMw4f0tC0=MVqHE+gPJ_5N4MpLNGW8m7Gy2xgsQcmZw@mail.gmail.com>
	<B84185CF-3666-49D6-A3FB-3FBCBBFE6B17@gmail.com>
Date: Tue, 19 Jan 2016 17:45:49 -0800
Message-ID: <CAJ86T=VWgN=NGTgT1CTE1z1VuDzu-56sjA=qObDpxwLQ4gWz_g@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [BUG REPORT] failed to build valgrind on qemuarm
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
X-List-Received-Date: Wed, 20 Jan 2016 01:45:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2016 at 3:23 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Jan 19, 2016, at 1:38 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> On Tue, Jan 19, 2016 at 1:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>> On Jan 18, 2016, at 11:27 PM, Rongqing Li <rongqing.li@windriver.com> =
wrote:
>>>>
>>>> 2: on qemuarma9
>>>>
>>>> | arm-wrs-linux-gnueabi-gcc -march=3Darmv7-a -mfloat-abi=3Dsoftfp  -ma=
rm -mthumb-interwork --sysroot=3D/work/wr/buildarea/arm/bitbake_build/tmp/s=
ysroots/qemuarma9 -DHAVE_CONFIG_H -I. -I/work/wr/buildarea/arm/bitbake_buil=
d/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/=
memcheck/tests -I../.. -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv=
7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0 -I/work/wr/buil=
darea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11=
.0-r0/valgrind-3.11.0/include -I/work/wr/buildarea/arm/bitbake_build/tmp/wo=
rk/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/coregrin=
d -I../../include -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vf=
p-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/VEX/pub -I../../VEX/=
pub -DVGA_arm=3D1 -DVGO_linux=3D1 -DVGP_arm_linux=3D1 -DVGPV_arm_linux_vani=
lla=3D1   -Winline -Wall -Wshadow -Wno-long-long -g -fno-stack-protector   =
 -O2 -pipe -g  -fno-omit-frame-pointer -fvisibility=3Ddefault -O0 -c -o sh-=
mem-random.o /work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-l=
inux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/memcheck/tests/sh-mem-rando=
m.c
>>>> | {standard input}: Assembler messages:
>>>> | {standard input}:1107: Error: selected processor does not support AR=
M mode `vld1.64 {d7},[r3]'
>>>> | {standard input}:1107: Error: selected processor does not support AR=
M mode `vst1.64 {d7},[r2]'
>>>> | Makefile:2467: recipe for target 'sh-mem-random.o=E2=80=99 failed
>>>
>>>
>>> So you disable neon but do not choose a particular implementation which=
 allows so. e.g. you should have -mtune=3Dcortex-a9 which allows neon to be=
 optional
>>> but thats probably just the semantic thing. Below code should check for=
 __ARM_NEON__ internal define being set as well before resorting to use neo=
n instructions.
>>
>> It's a test app which is failing, so I think we have 3 solutions:
>>
>> 1) Disable tests which don't build for all supported targets (the
>> traditional OE approach). See:
>>
>>  http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtool=
s/valgrind/valgrind/remove-arm-variant-specific.patch
>>
>> 2) Tweak CFLAGS so that the test always compiles but fails at run-time
>> on non-neon targets.
>>
>> 3) Tweak test code so that it avoids NEON instructions on non-neon
>> targets (risk then is that the run-time test will appear to pass on
>> non-neon targets when it should actually fail).
>>
>> Any preference?
>
> option 3
>

Yes, I think that's right in this case. The sh-mem-random.c test isn't
really about testing neon, so falling back to C for non-neon targets
seems correct.

Patch sent.

