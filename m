Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
 by mx.groups.io with SMTP id smtpd.web11.12908.1589206928339639473
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 May 2020 07:22:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=B5Jxvss+;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.66, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f66.google.com with SMTP id j5so11214547wrq.2
        for <openembedded-core@lists.openembedded.org>; Mon, 11 May 2020 07:22:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=xBLnwdqO75r8mHf+/XFCORhoH/ao/gA+MPc7tB6B1HQ=;
        b=B5Jxvss+BBpbSnDu0F8XIoH0sYBS/0aOsxfnwUNRQNfyeEgLbXkN/UUJSYeO/DSGWL
         o0t540k/odBVu1d2vUifbc4u9+rRVQtzJii4Q4rOFFgdg7o4Evs4+GJYcauHKvvsTeco
         CSpUicDjrbPE3r6o87LxlMBfnHJF/UBq1rN1Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=xBLnwdqO75r8mHf+/XFCORhoH/ao/gA+MPc7tB6B1HQ=;
        b=PRraDjFegXg0qaTw0FOryt4/YThutTO2m/ManzjaucwPo1ZG7YUA1VtFjjxDIzVF5s
         lvjw6OU7CLuaul+3d6l/L6TPZInwehev1DeXtuaGrw5+nGLzVKtMOlN7xwERHCJKM0NN
         A7ZVcpV957a9ynHLgQ5CNTSdgF0KaqM3j0YOLD1mVAoiOXzeWRAYpqvpHGZBS0OLKk75
         Ik6XxpPunE0SWCCFeYDfMiMFlkPKZDF4QZZKGOwZIN9IFnqWjQOxhWgLFuryZIh2lwGx
         YNR3zjN62Y/WYNQOkcvI8DldOmFT9xuG0StOg4G7VK8PyeKzvza5yE784nkaDeKkmQ8Y
         M+2A==
X-Gm-Message-State: AGi0PubpTxi2K/f+hP4FpE5xXPfEKZQgJzuQTQrdPPckXdDE41/2xmLe
	10har+7l+gSRqFy/AwT09mIRwg==
X-Google-Smtp-Source: APiQypI5bHErO1pd5pxhGF7VVvLWFBfSCs/7lr3249RTKmdngvEr5E4U5Fzomi/bqe8lS0GKIosaTQ==
X-Received: by 2002:adf:dc0f:: with SMTP id t15mr19017449wri.165.1589206926716;
        Mon, 11 May 2020 07:22:06 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id w15sm17236795wrl.73.2020.05.11.07.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2020 07:22:06 -0700 (PDT)
Message-ID: <77ef2a6d2521c5bc7cab1ba109dc0ad03a17bae0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2 1/2] gcc10: Update to GCC 10.1 Release
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 11 May 2020 15:22:02 +0100
In-Reply-To: <160DF24277C7EAFD.21511@lists.openembedded.org>
References: <20200510195050.3470835-1-raj.khem@gmail.com>
	 <160DF24277C7EAFD.21511@lists.openembedded.org>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2020-05-11 at 11:23 +0100, Richard Purdie via lists.openembedded.org wrote:
> On Sun, 2020-05-10 at 12:50 -0700, Khem Raj wrote:
> > * Package new gomp header acc_prof.h
> > * Package lto-dump which is a new tool in gcc10
> > * All Changes are here [1]
> > * Porting apps to gcc 10 help is here [2]
> > 
> > [1] https://gcc.gnu.org/gcc-10/changes.html
> > [2] https://gcc.gnu.org/gcc-10/porting_to.html
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Correct SRC_URI checksums
> 
> Fails, in gcc, nativesdk-gcc and gcc-cross-canadian.
> 
> e.g.
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/1885
> 
> (but many more)
> 
> I think we may need something like:
> 
> https://patchwork.ozlabs.org/project/gcc/patch/20200508131105.170077-1-hjl.tools@gmail.com/

I added that in master-next and things do look better.

meta-mingw fails in gcc-runtime:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/1888

also valgrind failed for qemuarm64 on arm64

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/690

10.1.0/ld: /home/pokybuild/yocto-worker/qemuarm64-ptest/build/build/tmp/work/aarch64-poky-linux/valgrind/3.15.0-r0/recipe-sysroot/usr/lib/aarch64-poky-linux/10.1.0/libgcc.a(lse-init.o): in function `init_have_lse_atomics':
| /usr/src/debug/libgcc/10.1.0-r0/gcc-10.1.0/build.aarch64-poky-linux.aarch64-poky-linux/libgcc/../../../../../../../work-shared/gcc-10.1.0-r0/gcc-10.1.0/libgcc/config/aarch64/lse-init.c:44: undefined reference to `__getauxval'
| /usr/src/debug/libgcc/10.1.0-r0/gcc-10.1.0/build.aarch64-poky-linux.aarch64-poky-linux/libgcc/../../../../../../../work-shared/gcc-10.1.0-r0/gcc-10.1.0/libgcc/config/aarch64/lse-init.c:44:(.text.startup+0xc): relocation truncated to fit: R_AARCH64_CALL26 against undefined symbol `__getauxval'

The build is still running so there may be other issues...

Cheers,

Richard

