Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 927F97318D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 21:38:32 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id n5so133726356wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 13:38:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=TK6hscUcYKUadLaaWtfxIPS7eNaLgAupkj8kqUoHc98=;
	b=ficXEps+1qdJVvTT0OetDCzITTfYRme8/FRYTX8enYwEdAXXX4j9hmGcSIkLiWSgCU
	YjEfmmPHwyEbKD0Bwcagpj2a6FYcwa2t1CbDmNPS6s1pcwOZLEAYW+4DvYXYTFMTSILZ
	VTi/xEnCN9juWc5HCPSGJKJt2WWKMOt0ahD1o2Qs/rj4d5s4vrlK1Mu0O+9dUjv7l9uL
	Zrh4ngWgpS7A9BwVaY3vsgIpAXLzXtbURi8L0s9RqSHJwa5MaB5Ym4CyszRy5qT+0hXB
	DSwVs/umU3lktxArmpNGJt4Bfu4NCD+EwM9wmu8a1QBtTrn4uD94sp3qzExcLxNg7mXg
	80tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=TK6hscUcYKUadLaaWtfxIPS7eNaLgAupkj8kqUoHc98=;
	b=Rcb/Tj+yNUxN6PcEjtBk9QJW6/HGudpHeoafuUqE1yVQde+UPJozzCR6/Nmnc3FLtR
	L57T+egtkS4k9s3tBPiR8wdKPQTLaOgZz1NOecC/WuERnRZ4v/jz8zJD2XWP3bzGcoxb
	4ZVJliBGVberT83GZFuxmPkV6bSwpAYN/6jZXe3ychm+MQLfEY7I5HuzBvqmHK8k3JAZ
	VVDQQ0szjspjywLq+6d7WJMStb6U5MM3r+Kzc1KJBun5keT8x3lNppy+InG0x35fNBZ1
	X8lNrhZdMbqtQ03bmTXyUX10mIiDpgcL6g4pOalbmgCrhRtv+trHyV9HuIrB5tX22wya
	2xhA==
X-Gm-Message-State: AG10YOTZ/wYTSkMkWzmho7s1slqXhoIHbFzOh84evgsI1LTFQYyNPc4h1fpvror0SuhnBDOUmJ2L84ccunL95g==
MIME-Version: 1.0
X-Received: by 10.28.178.206 with SMTP id b197mr191824wmf.72.1453239512472;
	Tue, 19 Jan 2016 13:38:32 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Tue, 19 Jan 2016 13:38:32 -0800 (PST)
In-Reply-To: <4D27B3F8-BDBC-43AF-A54C-E4B556388202@gmail.com>
References: <569DE54C.7090506@windriver.com>
	<4D27B3F8-BDBC-43AF-A54C-E4B556388202@gmail.com>
Date: Tue, 19 Jan 2016 13:38:32 -0800
Message-ID: <CAJ86T=WSMw4f0tC0=MVqHE+gPJ_5N4MpLNGW8m7Gy2xgsQcmZw@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Jan 2016 21:38:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2016 at 1:00 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Jan 18, 2016, at 11:27 PM, Rongqing Li <rongqing.li@windriver.com> wr=
ote:
>>
>> 2: on qemuarma9
>>
>> | arm-wrs-linux-gnueabi-gcc -march=3Darmv7-a -mfloat-abi=3Dsoftfp  -marm=
 -mthumb-interwork --sysroot=3D/work/wr/buildarea/arm/bitbake_build/tmp/sys=
roots/qemuarma9 -DHAVE_CONFIG_H -I. -I/work/wr/buildarea/arm/bitbake_build/=
tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/me=
mcheck/tests -I../.. -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a=
-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0 -I/work/wr/builda=
rea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0=
-r0/valgrind-3.11.0/include -I/work/wr/buildarea/arm/bitbake_build/tmp/work=
/armv7a-vfp-wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/coregrind =
-I../../include -I/work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-=
wrs-linux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/VEX/pub -I../../VEX/pu=
b -DVGA_arm=3D1 -DVGO_linux=3D1 -DVGP_arm_linux=3D1 -DVGPV_arm_linux_vanill=
a=3D1   -Winline -Wall -Wshadow -Wno-long-long -g -fno-stack-protector    -=
O2 -pipe -g  -fno-omit-frame-pointer -fvisibility=3Ddefault -O0 -c -o sh-me=
m-random.o /work/wr/buildarea/arm/bitbake_build/tmp/work/armv7a-vfp-wrs-lin=
ux-gnueabi/valgrind/3.11.0-r0/valgrind-3.11.0/memcheck/tests/sh-mem-random.=
c
>> | {standard input}: Assembler messages:
>> | {standard input}:1107: Error: selected processor does not support ARM =
mode `vld1.64 {d7},[r3]'
>> | {standard input}:1107: Error: selected processor does not support ARM =
mode `vst1.64 {d7},[r2]'
>> | Makefile:2467: recipe for target 'sh-mem-random.o=E2=80=99 failed
>
>
> So you disable neon but do not choose a particular implementation which a=
llows so. e.g. you should have -mtune=3Dcortex-a9 which allows neon to be o=
ptional
> but thats probably just the semantic thing. Below code should check for _=
_ARM_NEON__ internal define being set as well before resorting to use neon =
instructions.

It's a test app which is failing, so I think we have 3 solutions:

1) Disable tests which don't build for all supported targets (the
traditional OE approach). See:

  http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/=
valgrind/valgrind/remove-arm-variant-specific.patch

2) Tweak CFLAGS so that the test always compiles but fails at run-time
on non-neon targets.

3) Tweak test code so that it avoids NEON instructions on non-neon
targets (risk then is that the run-time test will appear to pass on
non-neon targets when it should actually fail).


Any preference?


>>
>> and the codes are below:
>>
>> 194 #elif defined(__linux__) && defined(__arm__) && !defined(__aarch64__=
)
>> 195             /* On arm32, many compilers generate a 64-bit float move
>> 196                using two 32 bit integer registers, which completely
>> 197                defeats this test.  Hence force a 64-bit NEON load an=
d
>> 198                store.  I guess this will break the build on non-NEON
>> 199                capable targets. */
>> 200             __asm__ __volatile__ (
>> 201                "vld1.64 {d7},[%0] ; vst1.64 {d7},[%1] "
>> 202                : : "r"(arr+src), "r"(arr+dst) : "d7","memory"
>> 203             );
>> 204 #else
>>
>>
>> -Roy
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

