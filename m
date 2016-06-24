Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f170.google.com (mail-qk0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 187A860132
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 15:00:01 +0000 (UTC)
Received: by mail-qk0-f170.google.com with SMTP id t127so148818641qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 08:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5taPBysHCcdvasiLQifl+hq19gzMqjEsArSR/gGKbIY=;
	b=KNX4JDc89c8m3xiYZPTgTNKtYzB9UhE0xZtIYUq0tTO9aycgf6ZXHpjgHL6xQ8vh6M
	hwJbSntwzxg9A+AD2BNeRsu1PgGk3ASNcHwXeWpBejhSN4RZK0FCPZ+B/A7J4l5DyTH8
	bVvU00VZN2huDjqWSAtt2Ct6K2FTcl0by4NRQOTzXUIlIPJV8m9nN7K43VELCECLijrW
	4fLVMKOdUa7GQt++Wq8aJly+ADhFbxjzKgEKaZR+cOyKkhl1w0IXVomT0lsHnqH0g9j8
	95oHzPPEGZbOOVoVKiCJ4rSNjBKBg0MiGvIdXwwsB1b2DCF+y2n2CzrVyFBZWB46Odd4
	njZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5taPBysHCcdvasiLQifl+hq19gzMqjEsArSR/gGKbIY=;
	b=gZFWbSfg+D1HkBldzgB0pzctH6aDP4pMamunUr3iYvJ2n+HpFKeBYYJxw942UnZcXJ
	FaEy++mzoKnGqrvrJsnDw+HKB+2MQg7N9w4wRSnGrg0CvUNuVKDu7KA3Pv+Dhn4qHK9x
	HAltosgqY/Vz9XiMrXPPzPScbV/abRJRVhLLfmtvWReeTZEM/VsEO+Ickgw3tumGYT93
	LWVNZjJ2R27xgQBju0JSahqiDFdEfVhEEHnDzRD1CMkNm1FUhf+yXnx3VGyM5NV8R847
	u95PIlqsO6Wy326fCERBrP1Xz//ZgdpPTQ8aN4GC0+yOBnuEUh9EGlfwwpGALxi2Kz+0
	38Jg==
X-Gm-Message-State: ALyK8tLm0+9rrAT7XCwfopE1LTcM1nwt1angLQ6zEqMocwSEsE5oF3eRjnnGetHhf51Jw3duSdOPYit1dBXZ8A==
X-Received: by 10.55.155.193 with SMTP id d184mr5533386qke.152.1466780401947; 
	Fri, 24 Jun 2016 08:00:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Fri, 24 Jun 2016 07:59:32 -0700 (PDT)
In-Reply-To: <1466777979.30669.6.camel@andred.net>
References: <1466765671-22371-1-git-send-email-git@andred.net>
	<1466765671-22371-4-git-send-email-git@andred.net>
	<CAMKF1soqpKFDgoeKcAjiqbptR4xDFQ+VYRSt9kT67Uy=Bj8v7g@mail.gmail.com>
	<CAJTo0LbTunHyH_iss4dLTzcOwADNnVp2gdmGoMrWtgyt0Myx_w@mail.gmail.com>
	<CAMKF1spjUmGWxmS_+inmTCecFLQtbwQ5Pj=LAzsarA5_ymO4CQ@mail.gmail.com>
	<1466777979.30669.6.camel@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Jun 2016 07:59:32 -0700
Message-ID: <CAMKF1so=ikkJy0p4ofaYYJVwq0cRBYzM6d9Fy_0e==RCn30F4g@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] uclibc: really enable verbose compilation
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
X-List-Received-Date: Fri, 24 Jun 2016 15:00:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 24, 2016 at 7:19 AM, Andr=C3=A9 Draszik <git@andred.net> wrote:
> Hi Khem,
>
> On Fr, 2016-06-24 at 06:57 -0700, Khem Raj wrote:
>> make V=3D2
>>
>>   CC ldso/ldso/ldso.oS -DNDEBUG -DNOT_IN_libc -DIS_IN_rtld
>> -DUCLIBC_RUNTIME_PREFIX=3D"/usr/x86_64-linux-uclibc/"
>> -DUCLIBC_LDSO=3D"ld64-uClibc.so.1" -DIN_LIB=3Drtld -DSHARED
>> -DLDSO_ELFINTERP=3D"x86_64/elfinterp.c"
>>
>> make V=3D1
>>
>> gcc -c ldso/ldso/ldso.c -o /tmp/uu/ldso/ldso/ldso.oS -Wall
>> -Wstrict-prototypes -Wstrict-aliasing -funsigned-char -fno-builtin
>> -fno-asm -fmerge-all-constants -std=3Dgnu99 -fno-stack-protector
>> -nostdinc -I/tmp/uu/include -I./include -include libc-symbols.h
>> -I./libc/sysdeps/linux/x86_64 -I./libc/sysdeps/linux
>> -I./ldso/ldso/x86_64 -I./ldso/include -I. -Os -fstrict-aliasing
>> -I./libc/sysdeps/linux/common -isystem
>> /usr/lib/gcc/x86_64-pc-linux-gnu/6.1.1/include-fixed -isystem
>> /usr/lib/gcc/x86_64-pc-linux-gnu/6.1.1/include -I/ -DNDEBUG
>> -DNOT_IN_libc -DIS_IN_rtld -fno-stack-protector
>> -fno-omit-frame-pointer -I./ldso/ldso/x86_64 -I./ldso/include
>> -I./ldso/ldso -DUCLIBC_RUNTIME_PREFIX=3D\"/usr/x86_64-linux-uclibc/\"
>> -DUCLIBC_LDSO=3D\"ld64-uClibc.so.1\" -DIN_LIB=3Drtld -fPIC -DSHARED
>> -DLDSO_ELFINTERP=3D\"x86_64/elfinterp.c\" -MT /tmp/uu/ldso/ldso/ldso.oS
>> -MD -MP -MF /tmp/uu/ldso/ldso/.ldso.oS.dep
>>
>> So it must be local issue.
>
> Well exactly, V=3D1 gives more verbose output than V=3D2 :-)
>
> One of the reasons this is useful is that with V=3D1 one can now simply
> copy/paste the command line and modify it for test purposes. In addition,
> you can easily verify that everything is on the command line as expected.
>
> make V=3D2
>
>   CC libc/sysdeps/linux/common/execve.os -D__USE_STDIO_FUTEXES__
> -DHAVE_FORCED_UNWIND -D_LIBC_REENTRANT -DNDEBUG -DIN_LIB=3Dlibc
>
>
> vs.
>
> make V=3D1
>
> mipsel-poky-linux-uclibc-gcc  -mel -mabi=3D32 -msoft-float -march=3Dmips3=
2r2
> -mno-mips16  -minterlink-compressed -mtune=3D24kec -mdsp --sysroot=3D<sys=
root1>
> -c libc/sysdeps/linux/common/execve.c -o libc/sysdeps/linux/common/execve=
.os
> -Wall -Wstrict-prototypes -Wstrict-aliasing -funsigned-char -fno-builtin
> -fno-asm -fmerge-all-constants -msoft-float -std=3Dgnu99 -mabi=3D32 -fno-=
stack-
> protector -nostdinc -I./include -I./include -include libc-symbols.h
> -I./libc/sysdeps/linux/mips -I./libc/sysdeps/linux -I./ldso/ldso/mips
> -I./ldso/include -I. -Os -fstrict-aliasing -mno-split-addresses -O2 -pipe=
 -g
> -feliminate-unused-debug-types -fdebug-prefix-
> map=3D<map1>=3D/usr/src/debug/uclibc/1.0.15+gitAUTOINC+95174cb69c-r0 -fde=
bug-
> prefix-map=3D<map2>=3D -fdebug-prefix-map=3D<map3>=3D -D__USE_STDIO_FUTEX=
ES__
> -DHAVE_FORCED_UNWIND -D_LIBC_REENTRANT -I./libpthread/nptl
> -I./libpthread/nptl -I./libpthread/nptl/sysdeps/unix/sysv/linux/mips
> -I./libpthread/nptl/sysdeps/mips -I./libpthread/nptl/sysdeps/mips
> -I./libpthread/nptl/sysdeps/unix/sysv/linux
> -I./libpthread/nptl/sysdeps/unix/sysv/linux
> -I./libpthread/nptl/sysdeps/pthread -I./libpthread/nptl/sysdeps/pthread/b=
its
> -I./libpthread/nptl/sysdeps/generic -I./libc/sysdeps/linux/common -isyste=
m
> <...>/x86_64-linux/usr/lib/mipsel-poky-linux-uclibc.gcc-cross-initial-
> mipsel/gcc/mipsel-poky-linux-uclibc/6.1.1/include-fixed -isystem .../x86_=
64-
> linux/usr/lib/mipsel-poky-linux-uclibc.gcc-cross-initial-mipsel/gcc/mipse=
l-
> poky-linux-uclibc/6.1.1/include -I.../usr/include/ -DNDEBUG -DIN_LIB=3Dli=
bc
> -fPIC -MT libc/sysdeps/linux/common/execve.os -MD -MP -MF
> libc/sysdeps/linux/common/.execve.os.dep
>
>
> I honestly think the latter to be more useful...

then say that in your commit message in its current form its
misleading. I am ok with using V=3D1

>
>
> Cheers,
> Andre'
>

