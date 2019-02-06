Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFBF7BFF9
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Feb 2019 20:49:12 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id v11so9566571qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Feb 2019 12:49:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=i0pKCZp0eEjxzjZmkyckUewu3FwhPE6a79Z4+1MmIIw=;
	b=l+RVrrtQ/rBHYz4FkqFuS670H5DoU5rEmU9bSmEJ/OCLgVNCgRQmrTcSCK0yDIh8cs
	gzNYvHbSNwvmFt1mjBb7doSNynloGtvKSlbnQkPO/wydMiUmZmxV5iA8yshN2SsphsE4
	vmAJt8BryJ5ATztOVIJ80QATaP+nCVhS5eiUp8BpefP6vYnfLawleGRtZYgo/HPR8PxN
	zh2gg8l296yee5+bOIwDSyiIXXHDwGqgvfrz9dmoA9ypaY05gCwas65kmwWi//9sHEDT
	mUVXTrcckwZ6z+EOA0pVrOsEw1GgSkG1icAykMqWMVfowUReP/h6YNbYdbTMv2XJibSt
	2s7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=i0pKCZp0eEjxzjZmkyckUewu3FwhPE6a79Z4+1MmIIw=;
	b=jNlemJaRnRATl7QKw+HVbPZZKoL2/0Dl8V1zXYuUTeuirfBdvXDxRtNyRpmbaM9XkU
	Ocr1zLXP3d4HJtasm64gNvBeLJJoCvjWIqGCZMwHJyAaScqGmRvLQVGVP9as9Wq1beIb
	iar2pRXxiNuIMqBKlkv+RexGrnBvVE79RT8+utTZun2QktqlHnFE2QJbjnV/NlYCEOtX
	BwpqhQK83oS/ojS4ONQBInBiZaDyfkNNAQ2NzM9Am38sudlhO5WgrYmCixfNXle+gJXv
	+pS+v5YIthrBR99VjENTz27dnE4Ya5WgwwAkwK7qg3HD3/nodv5TX1EVrpnj6OjuToKX
	lA0A==
X-Gm-Message-State: AHQUAubnFeqCrVNT264py4g0q2PHS2nD35a6HTEbKdTIbnJKuJs442aw
	csEX6nkhXQdVec9YYyM80ulopKQo2AY+C9jDZDM=
X-Google-Smtp-Source: AHgI3IYHITF0KGEMJgzxTytzPjNGo0AKICD8ph9pPcbWs5VI9Oj4ioMnUvioZv6Zot0Pq/A/fgV1haSBgtPA8yHNweA=
X-Received: by 2002:a0c:a144:: with SMTP id d62mr9509489qva.50.1549486152782; 
	Wed, 06 Feb 2019 12:49:12 -0800 (PST)
MIME-Version: 1.0
References: <20190206084444.16250-1-raj.khem@gmail.com>
	<9aec20825c1b3b664ee9662ad10915994e4b2cd8.camel@linuxfoundation.org>
In-Reply-To: <9aec20825c1b3b664ee9662ad10915994e4b2cd8.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Feb 2019 12:48:46 -0800
Message-ID: <CAMKF1so-9ejhgcbgoX9p2HjewczMofuzVBAfLkcFUxrCEMaJyQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] grub2: Disable address-of-packed-member warnings
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
X-List-Received-Date: Wed, 06 Feb 2019 20:49:12 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 6, 2019 at 12:23 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Wed, 2019-02-06 at 00:44 -0800, Khem Raj wrote:
> > gcc9 has turned this warning into error when -Werror is used, lets
> > paper
> > it over by turning it into a warning for now
> >
> > Fixes
> > error: taking address of packed member of 'struct head' may result in
> > an unaligned pointer value [-Werror=address-of-packed-member]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-bsp/grub/grub2.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-bsp/grub/grub2.inc b/meta/recipes-
> > bsp/grub/grub2.inc
> > index 8e0f86217c..28e1c210e8 100644
> > --- a/meta/recipes-bsp/grub/grub2.inc
> > +++ b/meta/recipes-bsp/grub/grub2.inc
> > @@ -60,7 +60,7 @@ BUILD_CPPFLAGS = ""
> >  BUILD_CFLAGS = ""
> >  BUILD_CXXFLAGS = ""
> >  BUILD_LDFLAGS = ""
> > -
> > +CPPFLAGS += "-Wno-error=address-of-packed-member"
> >  do_configure_prepend() {
> >       # The grub2 configure script uses variables such as
> > TARGET_CFLAGS etc
> >       # for its own purposes. Remove the OE versions from the
> > environment to
>
> This failed all over the place, e.g.:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/264
>

yeah this is new gcc9+ option , it did not occur to me. I think we
need to make the code to see if compiler supports this option before
adding it. Ideally code should be fixed but thats for laters. Drop
this patch I will add a m4 macro check and add/remove it in
Makefile.am

> Cheers,
>
> Richard
>
>
>

