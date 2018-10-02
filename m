Return-Path: <ross.burton@intel.com>
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
	[209.85.167.195])
	by mail.openembedded.org (Postfix) with ESMTP id 368FF7920A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 19:28:01 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id l197-v6so2500466oib.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2018 12:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kA8R0r065XjF+CriQWMdYdhlgHGU+8x78rOAyB9vdUs=;
	b=XPjj3tnL6P1qIt1ZSqfS8Te1dsYPG12AOrSrq4pLA4rcqRRljVUiODXNV/lhIFl46h
	C/elX+8kxsjtt/+uSEAa7BW+015dgr//0waxqNVD+lzUhPvApClGNYfJ2Cr9KHRtcFbU
	fJe8OT862NrzsxCLGt4RGD6gANz2vy5THr6EpJ9TN3/FCrjb91ROtM7AjRA/Xc4c4d9e
	1N2rf6u+5Bka4DWcBcpBn82sGW+M0gdzFv5N4Od3s9nqy2pUjjlxhOxrrP0jOu5DJsxs
	dqRlJxogfNEHj/EcFLrvY8GNe/g/+Z0GZLNNts0omAx2YcyjBTOUNs3u4LazF3rvtfJY
	SkDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kA8R0r065XjF+CriQWMdYdhlgHGU+8x78rOAyB9vdUs=;
	b=oYRCowY+lusRlt+yCpNXvGl6olV2tRgyR4U076AYX7DJ7F+Si77th9wg5Ei85mdpUA
	A+rduOxwDui926WJnmioJYkyll/7r4rltkJ68Gt/82m5cRZAIi9bg9wNHuEg/StcFWtX
	aYuBSX+w2AQxOq7zj+CraFwd7I13cuRYh0LTGyIAAMU8EJyc3y8Pb5SOhrel/Gurqy91
	g8snujx+quiSJ/kcZ/r7SLkshDo6YUowG7Ho317ZEx2HpYhyliwOnyYv/vLEhBvydUU9
	+48/MNMq//gftuLSV3gX/u8CKHhYOCEtNICFFz4UgPIBhykcA5i/hNc+Vl3Bj8t0vZ1E
	u9dA==
X-Gm-Message-State: ABuFfojYORVfRwF8mqyZ5ydI6HO341ZfvWiCEnijz81Mp5SaYrZwPfJv
	yGXudeWrmrqP+aOH9aM4n9mObvAIsQrMCDjCkZ7OjA==
X-Google-Smtp-Source: ACcGV60vPSyNvmFwDDbn/rxzO6ofGyMp5aVrP0F5fBGGKzG6xM4DXMzSHMSN+sskHNlGX0iaolt6G60c725arKq78E0=
X-Received: by 2002:aca:2c5:: with SMTP id
	188-v6mr7715891oic.192.1538508482126; 
	Tue, 02 Oct 2018 12:28:02 -0700 (PDT)
MIME-Version: 1.0
References: <20181002191136.8792-1-raj.khem@gmail.com>
In-Reply-To: <20181002191136.8792-1-raj.khem@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Oct 2018 20:27:50 +0100
Message-ID: <CAJTo0LaN2cjd6o67epNgi0+8g1VE+1GnLCGdYDVsFLj01b_Oww@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa: Disable asm on musl
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
X-List-Received-Date: Tue, 02 Oct 2018 19:28:01 -0000
Content-Type: text/plain; charset="UTF-8"

Isn't this a bit overkill?  Is the assembler actually broken?

Ross
On Tue, 2 Oct 2018 at 20:21, Khem Raj <raj.khem@gmail.com> wrote:
>
> some unknown part of mesa's x86 assembly
> code is broken by readonly text segments
>
> [ YOCTO #12918 ]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-graphics/mesa/mesa.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 8d0e2cb67c..e6f3712706 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -107,7 +107,7 @@ PACKAGECONFIG[osmesa] = "--enable-${OSMESA},--disable-${OSMESA}"
>  PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
>
>  EXTRA_OECONF_remove_libc-musl = "--enable-glx-tls"
> -EXTRA_OECONF_append_libc-musl = " --disable-glx-tls"
> +EXTRA_OECONF_append_libc-musl = " --disable-asm --disable-glx-tls"
>  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
>  FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
>
> --
> 2.19.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

