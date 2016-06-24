Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 6423960589
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 14:19:43 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id 187so5403740wmz.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 07:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2JipT8iGEBRsd5KqPWJRxeOHAdWztfTrpJN6Yx1mK1U=;
	b=OSvTxAcPh3f+Gy0z9HdcHotCXW4YzGqUI0mGCg9uv3R93LdXawpgt0etCN9AjDu4Lf
	pme9ZP2ed5rCV5eKTMVP2eXt5qJ9q7coCNjf4bCEQ2bHSNlOC66xM8A7qrcVnIFcqjsA
	t0dUqfCnHGA8wYTSROwbfHceB2AgV1GBqhiHu/UHaVZgA3UMHKTy5RCTDDKlXgD0cUAP
	uBUWV1Z/c8I8wOp1N55gowZuuQDlcyyvrR9RuK9sHBG8ilNmcaBrtO0DI70wiqQSkUcU
	CVrvvhwfuodA+8czzkQm02OXGgeO+zVdIKvVX9kWcDVGDz7y9bPhFYOnnx43+fjb6aqX
	S3Iw==
X-Gm-Message-State: ALyK8tIV8AV8gHaOdGY3Q578Ol79vicWFLBdzGaKlbdYs7IFYycAhgs1Dol/dOyCIAWZqw==
X-Received: by 10.194.48.7 with SMTP id h7mr4085254wjn.9.1466777983921;
	Fri, 24 Jun 2016 07:19:43 -0700 (PDT)
Received: from localhost ([185.46.212.65])
	by smtp.gmail.com with ESMTPSA id b84sm3369937wmb.6.2016.06.24.07.19.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 24 Jun 2016 07:19:43 -0700 (PDT)
Message-ID: <1466777979.30669.6.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>, "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 24 Jun 2016 15:19:39 +0100
In-Reply-To: <CAMKF1spjUmGWxmS_+inmTCecFLQtbwQ5Pj=LAzsarA5_ymO4CQ@mail.gmail.com>
References: <1466765671-22371-1-git-send-email-git@andred.net>
	<1466765671-22371-4-git-send-email-git@andred.net>
	<CAMKF1soqpKFDgoeKcAjiqbptR4xDFQ+VYRSt9kT67Uy=Bj8v7g@mail.gmail.com>
	<CAJTo0LbTunHyH_iss4dLTzcOwADNnVp2gdmGoMrWtgyt0Myx_w@mail.gmail.com>
	<CAMKF1spjUmGWxmS_+inmTCecFLQtbwQ5Pj=LAzsarA5_ymO4CQ@mail.gmail.com>
X-Mailer: Evolution 3.20.3-1 
Mime-Version: 1.0
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
X-List-Received-Date: Fri, 24 Jun 2016 14:19:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi Khem,

On Fr, 2016-06-24 at 06:57 -0700, Khem Raj wrote:
> make V=2
> 
>   CC ldso/ldso/ldso.oS -DNDEBUG -DNOT_IN_libc -DIS_IN_rtld
> -DUCLIBC_RUNTIME_PREFIX="/usr/x86_64-linux-uclibc/"
> -DUCLIBC_LDSO="ld64-uClibc.so.1" -DIN_LIB=rtld -DSHARED
> -DLDSO_ELFINTERP="x86_64/elfinterp.c"
> 
> make V=1
> 
> gcc -c ldso/ldso/ldso.c -o /tmp/uu/ldso/ldso/ldso.oS -Wall
> -Wstrict-prototypes -Wstrict-aliasing -funsigned-char -fno-builtin
> -fno-asm -fmerge-all-constants -std=gnu99 -fno-stack-protector
> -nostdinc -I/tmp/uu/include -I./include -include libc-symbols.h
> -I./libc/sysdeps/linux/x86_64 -I./libc/sysdeps/linux
> -I./ldso/ldso/x86_64 -I./ldso/include -I. -Os -fstrict-aliasing
> -I./libc/sysdeps/linux/common -isystem
> /usr/lib/gcc/x86_64-pc-linux-gnu/6.1.1/include-fixed -isystem
> /usr/lib/gcc/x86_64-pc-linux-gnu/6.1.1/include -I/ -DNDEBUG
> -DNOT_IN_libc -DIS_IN_rtld -fno-stack-protector
> -fno-omit-frame-pointer -I./ldso/ldso/x86_64 -I./ldso/include
> -I./ldso/ldso -DUCLIBC_RUNTIME_PREFIX=\"/usr/x86_64-linux-uclibc/\"
> -DUCLIBC_LDSO=\"ld64-uClibc.so.1\" -DIN_LIB=rtld -fPIC -DSHARED
> -DLDSO_ELFINTERP=\"x86_64/elfinterp.c\" -MT /tmp/uu/ldso/ldso/ldso.oS
> -MD -MP -MF /tmp/uu/ldso/ldso/.ldso.oS.dep
> 
> So it must be local issue.

Well exactly, V=1 gives more verbose output than V=2 :-)

One of the reasons this is useful is that with V=1 one can now simply
copy/paste the command line and modify it for test purposes. In addition,
you can easily verify that everything is on the command line as expected.

make V=2

  CC libc/sysdeps/linux/common/execve.os -D__USE_STDIO_FUTEXES__
-DHAVE_FORCED_UNWIND -D_LIBC_REENTRANT -DNDEBUG -DIN_LIB=libc


vs.

make V=1

mipsel-poky-linux-uclibc-gcc  -mel -mabi=32 -msoft-float -march=mips32r2
-mno-mips16  -minterlink-compressed -mtune=24kec -mdsp --sysroot=<sysroot1>
-c libc/sysdeps/linux/common/execve.c -o libc/sysdeps/linux/common/execve.os
-Wall -Wstrict-prototypes -Wstrict-aliasing -funsigned-char -fno-builtin
-fno-asm -fmerge-all-constants -msoft-float -std=gnu99 -mabi=32 -fno-stack-
protector -nostdinc -I./include -I./include -include libc-symbols.h
-I./libc/sysdeps/linux/mips -I./libc/sysdeps/linux -I./ldso/ldso/mips
-I./ldso/include -I. -Os -fstrict-aliasing -mno-split-addresses -O2 -pipe -g
-feliminate-unused-debug-types -fdebug-prefix-
map=<map1>=/usr/src/debug/uclibc/1.0.15+gitAUTOINC+95174cb69c-r0 -fdebug-
prefix-map=<map2>= -fdebug-prefix-map=<map3>= -D__USE_STDIO_FUTEXES__
-DHAVE_FORCED_UNWIND -D_LIBC_REENTRANT -I./libpthread/nptl
-I./libpthread/nptl -I./libpthread/nptl/sysdeps/unix/sysv/linux/mips
-I./libpthread/nptl/sysdeps/mips -I./libpthread/nptl/sysdeps/mips
-I./libpthread/nptl/sysdeps/unix/sysv/linux
-I./libpthread/nptl/sysdeps/unix/sysv/linux
-I./libpthread/nptl/sysdeps/pthread -I./libpthread/nptl/sysdeps/pthread/bits
-I./libpthread/nptl/sysdeps/generic -I./libc/sysdeps/linux/common -isystem
<...>/x86_64-linux/usr/lib/mipsel-poky-linux-uclibc.gcc-cross-initial-
mipsel/gcc/mipsel-poky-linux-uclibc/6.1.1/include-fixed -isystem .../x86_64-
linux/usr/lib/mipsel-poky-linux-uclibc.gcc-cross-initial-mipsel/gcc/mipsel-
poky-linux-uclibc/6.1.1/include -I.../usr/include/ -DNDEBUG -DIN_LIB=libc
-fPIC -MT libc/sysdeps/linux/common/execve.os -MD -MP -MF
libc/sysdeps/linux/common/.execve.os.dep


I honestly think the latter to be more useful...


Cheers,
Andre'


