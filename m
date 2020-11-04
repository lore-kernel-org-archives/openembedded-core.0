Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.11181.1604486030406820561
 for <Openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2020 02:33:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TDX1nE0/;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: vinay.m.engg@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id k9so18662643qki.6
        for <Openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2020 02:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xZAKTVdP36qCHPSaJ3OYOGvR6bi4Us4wT7AfnYVIcP8=;
        b=TDX1nE0/khirn+Pu5hXHwvqmMzjZ6tW56w8r0ixuosbQ5TDk+muZDJR+8PId6IYCMA
         YF+nUo1AHmupbwAClzd6HYbBL+NCMrreTvSBfyXmpK1xt/zN8MaryO1Gt3RX7g68TSZy
         LZO1WtUX1b6hqGx7vl2723A34MR9X7Si5tJn4VpFfeaFeU/n+DWtTFKKDqJcyukxKepd
         I0zL4zVQ9IuAblUzDzV43HqUMxzTeW+uVSgGLWWvEWAE3ZVzgj2vs2zUUtw+Ub0y5R7p
         D56/qhhPMpocG80c0wjT3KY4i5HugKDXzfBdGmk9/n6/MkbR+faqUs2KX8+pFPrdPUex
         rlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xZAKTVdP36qCHPSaJ3OYOGvR6bi4Us4wT7AfnYVIcP8=;
        b=S0mF+VgRgcROWDgJdI3f03PPKdUNFVewzbSCuit7P6uXbFHiauQJMaoi/RqdZqIpN8
         5R8/4YDaBHuaNEk0LJm5Y3FkafRlnZngRCTJze3KRXH0SvA/DbsC/AcnrSCraHVKwAWK
         4SyglHrybrx+F37p+1K0m3Gw2Znxy58RG5Rqujyn7iNJlevZdgU4LtxhPHX85pWKzCcS
         xExUKL8iSUfHI9opLG7Xjcid72Ihgf1N7whAtfFLYjIlqEWQABlIEws2bofAy5jkLPpA
         kGMpj9UWyWkvUCjEnXystdEavW6MOnbLEelH+89YuZLbhgpnYf4UCjM5z7762Ffr2X8f
         iCYw==
X-Gm-Message-State: AOAM5319VF8sEo3sofuRjlsBW5p/tNmqgvps4nrsR2h2lZd8Q8JPCpuV
	bxsYF9m4qZNkHH05FQa9Gyd/H/2hOa6oH8/4sjY=
X-Google-Smtp-Source: ABdhPJzuvry9fB1iIKS0qOIP6vs3hJPih1eDhiRugahA5S7PO3xBPU34/7VOVEUIIRty1wjSMSrwQmAhgPOEutO5n2k=
X-Received: by 2002:a05:620a:12b9:: with SMTP id x25mr25186268qki.475.1604486029365;
 Wed, 04 Nov 2020 02:33:49 -0800 (PST)
MIME-Version: 1.0
References: <CANUMPcUV53punnV_5EArrkknXaTZWc=i_UunbJKHiFA_4HZdRw@mail.gmail.com>
 <CAMKF1sqyhT4GRypCoNs3cTvq3Jj7yCNa-Q7Jxv51z43nvDxuaA@mail.gmail.com>
In-Reply-To: <CAMKF1sqyhT4GRypCoNs3cTvq3Jj7yCNa-Q7Jxv51z43nvDxuaA@mail.gmail.com>
From: "Vinay Kumar" <vinay.m.engg@gmail.com>
Date: Wed, 4 Nov 2020 16:03:38 +0530
Message-ID: <CANUMPcWaitC0M=RbmjAUPJCJyKwUij6cLZ82fXT-D2d=0Qe3ZQ@mail.gmail.com>
Subject: Re: [OE-core] Yocto rust build failure
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer <Openembedded-core@lists.openembedded.org>, 
	Randy MacLeod <rwmacleod@gmail.com>, umesh.kalappa0@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Khem Raj,

Thanks for the confimtion, Will work on your suggestions.

Regards,
Vinay

On Wed, Nov 4, 2020 at 12:03 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> Hi Vinay
>
> Currently, rust for the target is not buildable, you can however build
> rust cross compiler and use it to cross-compile rust applications
> which run on your target, but generating rust compiler itself which
> will run on target is not currently supported in meta-rust
>
> On Tue, Nov 3, 2020 at 8:21 PM Vinay Kumar <vinay.m.engg@gmail.com> wrote:
> >
> > Hi,
> >
> > Trying to build yocto rust package using below branch,
> >
> > http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=rmacleod/rust-wip-sept-5
> >
> > Getting below list of errors while building yocto rust,
> > =======================================================
> > Command:
> > $bitbake rust
> >
> > Build Configuration:
> > BB_VERSION           = "1.47.0"
> > BUILD_SYS            = "x86_64-linux"
> > NATIVELSBSTRING      = "ubuntu-18.04"
> > TARGET_SYS           = "arm-poky-linux-gnueabi"
> > MACHINE              = "qemuarm"
> > DISTRO               = "poky"
> > DISTRO_VERSION       = "3.1+snapshot-20201029"
> > TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
> > TARGET_FPU           = "hard"
> > meta
> > meta-poky
> > meta-yocto-bsp       =
> > "rmacleod/rust-wip-sept-5:80e2aad495bd6f6e1c62b7af55677651131fa250"
> >
> >
> > Error1:
> >
> > failed to execute command:
> > "/home/build_arm_rust/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/rust/1.46.0-r0/recipe-sysroot/usr/lib/llvm-rust/bin/llvm-config"
> > "--bindir"
> > error: No such file or directory (os error 2)
> >
> >
> > Fixed by below changes,
> >
> > --- a/meta/recipes-devtools/rust/rust.inc
> > +++ b/meta/recipes-devtools/rust/rust.inc
> > @@ -14,7 +14,7 @@ export RUST_TARGET_PATH="${WORKDIR}/targets/"
> >
> >  export FORCE_CRATE_HASH="${BB_TASKHASH}"
> >
> > -export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
> > +export YOCTO_ALTERNATE_EXE_PATH =
> > "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
> >
> >
> > Error2:
> >
> > error: Error loading target specification: Could not find
> > specification for target "arm-poky-linux-gnueabi". Use `--print
> > target-list` for a list of built-in targets
> >
> > Fixed by updating "RUST_TARGET_PATH" in
> > "build_arm_rust/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/rust/1.46.0-r0/temp/run.do_compilerun.do_compile"
> > to "$STAGING_LIBDIR_NATIVE/rustlib" path where target specification
> > exists.
> >
> >
> > Error3:
> >
> > While building "librustc_privacy" getting below error.
> >
> > /home/build_arm_rust/tmp/work/armv7vet2hf-neon-poky-linux-gnueabi/rust/1.46.0-r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-poky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/10.2.0/ld:
> > /tmp/rustcLL5VLM/librustc_llvm-755d330643cd0fe0.rlib: member
> > /tmp/rustcLL5VLM/librustc_llvm-755d330643cd0fe0.rlib(X86Disassembler.cpp.o)
> > in archive is not an object
> >           collect2: error: ld returned 1 exit status
> >
> > error: aborting due to previous error
> >
> > error: could not compile `rustc_driver`.
> > To learn more, run the command again with --verbose.
> >
> > =======================================================
> >
> > Please let me know if any corrections are needed in the build procedure.
> >
> >
> > Regards,
> > Vinay
> >
> > 
> >
