Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 836F7605BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 16:05:18 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id t127so46303482qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jun 2016 09:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+BZqncBCvr/ORG67F7HGHlowLLpwIvWPVmiCQFB6tYs=;
	b=dKkBDQ/1nzMXU0s29ID+WFTES7v2ynSyAOlQEhnSQ4co/3ZwyzROJENsUKFwZlMi8/
	CMbCdWQeF/p0PmGgUBN6leoIIJ7UFcHoPsjBXm8GJSPI+QuEOKx/o6HL/o3/t70Qf4WZ
	xDj9XiuqD41Rx3yUlhxvch5gwwsngDU6xXa/5B+rAsH9DR+tkJuOnew8Z80ksh6+AC9H
	/1rbu6YqacS/eUtWCUCc30LHUvRqHarka/9Gqqg/VVF6WlK2uvxYOXfMjLsZzLOE3eGL
	BkS+xZcvuc73D1SfetX3F55UungWCOpYJHa/MvDFaw+dLTPfkHdA6bxlsrADpaNmZ9UW
	ao/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+BZqncBCvr/ORG67F7HGHlowLLpwIvWPVmiCQFB6tYs=;
	b=Ne3rclYre5eRhccXh5o1IxDANiSv5OErH4YSR+R/QtCLGvM6sudiEf8z4hfOyLSxvJ
	P1FToSF/6rkjGb9ZPqzUdjJA3ojNUG2+7QC5w2yClDxlpaasmlv2OThb/lv6tfyiLFTx
	B599qZIGJpshyNhDOMXrRk4c1huVO7wMYfgZGBLSXKnCF3pkSA3V6ayRaAMOy7QEHMsH
	gyz0n+vmSu93JkbfO0NSxwrLDFowdOxoXYBW2xOr7RCKyXjrBhK0PBqHUUFa3fcgpyMO
	h3Ppc1n6aBcKA49dzb6zMYAGX1lW6qrLuMCxmdNExHeuPemNZnPh1zEQrB/iJ3bKHrB7
	Gipg==
X-Gm-Message-State: ALyK8tJVhOdPkdzBTkHoOFw4BOcLEc1B/svzaLr0zJ24M9ZmF/lIqfyeLMbZidlUHt3vzIVrqSrtWw2XVqExgA==
X-Received: by 10.200.50.77 with SMTP id y13mr22687588qta.5.1466438719288;
	Mon, 20 Jun 2016 09:05:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.8.133 with HTTP; Mon, 20 Jun 2016 09:04:49 -0700 (PDT)
In-Reply-To: <CAP9ODKorODqhm-Pqe4L_m4RpTvPmW++yNngL_pAUxvFHHa7XTg@mail.gmail.com>
References: <CAP9ODKorODqhm-Pqe4L_m4RpTvPmW++yNngL_pAUxvFHHa7XTg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Jun 2016 09:04:49 -0700
Message-ID: <CAMKF1sqBWnbCtLNbVDD7cBvMyGbXfC-uyG=ewur33gzJ3VEP5g@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [for-krogoth] Backport for libc != glibc
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
X-List-Received-Date: Mon, 20 Jun 2016 16:05:20 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Jun 18, 2016 at 6:27 AM, Otavio Salvador
<otavio.salvador@ossystems.com.br> wrote:
> Hello,
>
> At O.S. Systems we are involved in some projects which uses musl as
> libC. For those, we are doing the SDK for faster development and found
> that it is currently broken on Krogoth.
>
> Master branch has the need fixes. The fixes needed are
> OE-Core:2b9ae0ab and OE-Core:fcaaabb4
>
> commit 2b9ae0ab056e62290f2328aa0d4dd70e6f138759
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Wed May 11 10:35:40 2016 -0700
>
>     musl: Create symlinks for stub libraries
>
>     Some libraries e.g. libm.so are needed to be
>     created so that SDKs built with distros which
>     disable static librararies can have the stubs
>     and since default linker script requires -lm
>     this helps in compiling applications with SDK
>
>     there are .a equivalents for these libraries
>     but they do not land in SDKs when static libs
>     are disabled distrowide
>
>     Signed-off-by: Khem Raj <raj.khem@gmail.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> commit fcaaabb401fffcda4db9a7d1f927a2a404e4776d
> Author: Khem Raj <raj.khem@gmail.com>
> Date:   Wed May 11 10:35:45 2016 -0700
>
>    gcc-runtime, libgcc: Symlink c++ header and startup files in
> target_triplet for SDK use
>
>    We build SDKs such that gcc-cross-candian is built for only one
>    target *-*-linux and then use -muclibc or -mmusl to let it compile
>    code for other libc variants. This works fine when libc = glibc
>    however it does not work for c++ programs when libc != glibc since
>    there are c++ headers installed under ${includedir}/c++/${BINV}/${TARGET_SYS}
>    which is fine when gcc-runtime and gcc-cross-candian uses same
> --target options
>    gxx includedir searches in right triplet, but it fails with musl/uclibc
>    since gcc will look for glibc based triplet but gcc-runtime will install
>    them under musl/uclibc triplet.
>
>    This patch symlinks the musl/uclibc triplet to glibc triplet when
> libc != glibc
>
>    This fixes SDKs for musl/uclibc
>
>    Signed-off-by: Khem Raj <raj.khem@gmail.com>
>    Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Backporting those, on top of current Krogoth branch, fixes the SDK
> issues we had at the moment.
>
> Could those be reviewed and queued for the next backport?

They look fine for backport to krogoth. Please submit pull requests

>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

