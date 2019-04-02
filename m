Return-Path: <raj.khem@gmail.com>
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by mail.openembedded.org (Postfix) with ESMTP id C537B79C86
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 16:16:33 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id v10so11390045iom.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RgcG1rhzODr0mc5sZWZqQyTeUixNUrNzRjf6XjGjJ7s=;
	b=l7iRnCgUp5loeH9uA6+Hi40rjPGiett4geAHIREZ7AzJjnJucJ+th1m9wIyTsXxEk/
	zyaEG5JJ+1mB2sgKTfJ0rSAFCOW5x9ShN97p8HE9bswDoXg02KVyEmFRQkCkUw8o1ros
	31Zxm0oQxHQgLf25XxlCg6SfrR0Rbhic/JD4ZJAiiz0tgnK6msKJ4/tcIBsLyNY99L5I
	htG2uYvl7S8UNyeaUfwrLMmvuNS5hTS/rCZMBXkqrOKBwVYpGlm+7DN+bwuL4lOLjNkL
	NaGqvuxBIk9I5yzk6bGFp1R3DuTD6gCBgg5z4pxTRmY6EInIfip1e/9r6LojHkrjfM1O
	UD3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RgcG1rhzODr0mc5sZWZqQyTeUixNUrNzRjf6XjGjJ7s=;
	b=Tt4dMTw0hgcvUBpyReXtJdcXodrvKYk3pIcY6hQywPLBCiYO95Dj7Lzj3g4hUQYbvq
	1eIC8ReHZdxiVpsMYJXpXKPb/NbDkDMwvhg3/Rnhm/k8axFlyELcyQMBVnZk8sZtPJ1e
	njbfQh2Zlmx6bOYFlY8ilWwvAeiz3Ic8BGauozysCX5uafzB+2OsL8wQktanIqlS/HVw
	w3rooPRQbKWeb5vel9GXMbJj2jC2S6In7e7ragfBTDf5/BdhDGAku8nc+O1dcCBmXwUV
	Las0WDLuhzQYvDS85d8bMR+dix1EN029xj5Mmv6OfM4MAF7wPrgRrJcM0ZOIPf1wbmcf
	1VmA==
X-Gm-Message-State: APjAAAU/3WwyF5a4xcy5f6qWQAGTK4tCyYWeG2DUct7FZa1TSga8fuSS
	/3mTFKg9jM0UO+R+RXjYOleTy8nBQKNXUBwBHLI=
X-Google-Smtp-Source: APXvYqyHTCW3AcHr/MJ2D9SKtLqv8X19o/QQkxNW3pAA/A139nt318GUjVcidqeLyJPPyhgmPUiuxYLQxIwybHIAqUE=
X-Received: by 2002:a5e:981a:: with SMTP id s26mr31222521ioj.90.1554221794340; 
	Tue, 02 Apr 2019 09:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <a48654bd-c4df-694c-ad1f-3b2740a3aae9@windriver.com>
In-Reply-To: <a48654bd-c4df-694c-ad1f-3b2740a3aae9@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Apr 2019 09:16:07 -0700
Message-ID: <CAMKF1sp6X16_wMgg0_GCL3TjjnyfzvfrGxJuYBYEPooD-4PcnQ@mail.gmail.com>
To: Kang Kai <Kai.Kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Link issue of virglrenderer on x86 with gcc options '-O2 -fvisibility=default'
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
X-List-Received-Date: Tue, 02 Apr 2019 16:16:34 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Apr 2, 2019 at 8:46 AM Kang Kai <Kai.Kang@windriver.com> wrote:
>
> Hi Raj,
>
> I meet a link problem of virglrenderer with gcc options '-O2
> -fvisibility=default' configured in local.conf:
>
> SELECTED_OPTIMIZATION = "-O2 -fvisibility=default"
>
> It fails on qemux86 but succeeds on x86-64.
>
> And the error message:
>
> | i586-poky-linux-libtool: link: i586-poky-linux-gcc  -m32 -march=i586
> -fstack-protector-strong  -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security
> -Werror=
> format-security
> --sysroot=/home/kkang/buildarea/Yocto/build-systemd/tmp/work/i586-poky-linux/virglrenderer/0.7.0-r0/recipe-sysroot
> -shared  -fPIC -DPIC
>   .libs/virglrenderer.o  *-Wl,--whole-archive* ./.libs/libvrend.a
> gallium/auxiliary/.libs/libgallium.a *-Wl,--no-whole-archive*  -lm -ldrm
> -lgbm -lepoxy -lX1
> 1  -m32 -march=i586 -fstack-protector-strong
> --sysroot=/home/kkang/buildarea/Yocto/build-systemd/tmp/work/i586-poky-linux/virglrenderer/0.7.0-r0/recipe-
> sysroot -O2 -Wl,-Bsymbolic -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed
> -fstack-protector-strong -Wl,-z -Wl,relro -Wl,-z -Wl,now   -pthread
> -Wl,-soname
> -Wl,libvirglrenderer.so.0 -o .libs/libvirglrenderer.so.0.2.0
> |
> /home/kkang/buildarea/Yocto/build-systemd/tmp/work/i586-poky-linux/virglrenderer/0.7.0-r0/recipe-sysroot-native/usr/bin/i586-poky-linux/../../libexec/
> i586-poky-linux/gcc/i586-poky-linux/8.3.0/ld:
> gallium/auxiliary/.libs/libgallium.a(u_cpu_detect.o): relocation
> R_386_GOTOFF against undefined symbol `ut
> il_cpu_caps' can not be used when making a shared object
>
> It could pass if options -Wl,--whole-archive and -Wl,--no-whole-archive
> are removed.
>
> It says 'relocation R_386_GOTOFF' but when I check the file, it shows
> relocation type is R_386_GOT32X:
>
> $ readelf --relocs ./util/.libs/u_cpu_detect.o | grep util_cpu_caps
> 00000092  0000102b R_386_GOT32X      00000004   util_cpu_caps
>
> AFAIK R_386_GOT32X is not used with PIC. But I don't know why the type
> is R_386_GOT32X that -fPIC has been applied already?
>
> Any suggestion is great appreciated. Thanks.
>

it seems you have to build PIC archive for libgallium.a, it might not
be using the right -fPIC flags during compile/link phase.

>
> --
> Kai Kang
>

