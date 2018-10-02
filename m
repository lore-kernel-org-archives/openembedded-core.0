Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1B379793EE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Oct 2018 20:59:07 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id z8-v6so3602978qto.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Oct 2018 13:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=69LWz5BsStnZEB/ep/cuYWeXBKRthRrNNHnd6t5Ar0U=;
	b=KAiSD90Dy2j0XFt+PD3iZZvvsEFsiKMbRMPVKFFHpYqGvbJInVJCsE+J93EeeubF97
	esqwRW1DqzToJfFbH0N5Pd1v5gGu23/XGBSFfggAZcMsLxwKsA+OJzGE+fd3VvKeqq6g
	BNzxWuqk6F6lLC5qsLeSeJE3Gzx/D/8OxrQO4ybsfx5IgP1LrwJPCgGHrOt//aF+FRYF
	+c0MXRKs/UM416Bf1jq/Us6XjGvvxpxV+/wc/aEOkn8i9Kncha07S4Lmzo4EFtdIbz6V
	s8oy9LHJs4NKhnRtnYIlm4yrjfq6aN9lUZXe1aPmx+HmbI3xz5civqnFdEvkUlNF2OSh
	STTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=69LWz5BsStnZEB/ep/cuYWeXBKRthRrNNHnd6t5Ar0U=;
	b=naoy9U5EsjxWI9JrQDPRpzZNoVDUPuPdR5nr/Dl3EXy8I6pGM0+t4RAEtkKKjYlH3H
	hDX9ZJPVg70dbDsOsAKKFloaleVC1+eGMUKdW5wd0DpCX2xfzeIbeWEHt5cWN1Qixsgf
	EVgK4Vk7gbOLz3rCuKZcAybbLg2hCzxgNpHy31LFhGycR2d14xIZaTI3J326HQTjVeUC
	nkQZqVFPhmqv2BzzMZYsjxJfIUOIBzGhLrE5m7AEwocurz5m9sH7RV1n9ADnqoGl9oPg
	lIOfZ4b+NlSRjb4dezytTzoX2EJ27ZCnF+XDOcZPseOHH6tdihs8Yv1tNAlWGWinkLGr
	+Uvg==
X-Gm-Message-State: ABuFfohnMEewWtxDxKnPFaOh21bC/xzvk3WwaJIVlJHmn32F4ODP8FSy
	Y2tYf1JWJUpg7xsvXyTG2NujCVF8jgIv4ny1RTU=
X-Google-Smtp-Source: ACcGV6163FZvKpl44agNjNsTTgbssTzhgBTjKWSwIOrpfHIUoOfuTnwIoAt+oYeoXarda4LuzcxZ7lY8nkafr1R7Gqo=
X-Received: by 2002:aed:3848:: with SMTP id
	j66-v6mr13898304qte.218.1538513947929; 
	Tue, 02 Oct 2018 13:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <20181002191136.8792-1-raj.khem@gmail.com>
	<CAJTo0LaN2cjd6o67epNgi0+8g1VE+1GnLCGdYDVsFLj01b_Oww@mail.gmail.com>
	<CAMKF1sq4xUqHtSVOB_C8Gt6Op_6MNmjrxxEzGTtC5R1eoT4MPw@mail.gmail.com>
	<CAJTo0LYAWwjocAccnV10ppx8JQ+and=qxqJ0=AqUu56jg_iyUA@mail.gmail.com>
In-Reply-To: <CAJTo0LYAWwjocAccnV10ppx8JQ+and=qxqJ0=AqUu56jg_iyUA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 Oct 2018 13:58:40 -0700
Message-ID: <CAMKF1sogk_epAFuxc5zjAQVKfGQHue4WDvm=en2CD6eKZqgUtw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Tue, 02 Oct 2018 20:59:08 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, will do. I think it will need some time since this needs to be
well explained so mesa devs can see the reasoning behind it
On Tue, Oct 2, 2018 at 1:42 PM Burton, Ross <ross.burton@intel.com> wrote:
>
> Can you file a bug with mesa so we don't forget and Mesa knows?
>
> Ross
> On Tue, 2 Oct 2018 at 20:37, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > I think it is. The way th calls are set for performance reasons seems to be causing this
> > Ideally we should ensure to use right dialect for  tls calls I think musl is exposing a bug in Mesa
> > Which we covered by disabling tls in Glx once we disable that then this problem pops up so we disable ASM
> >
> > So this is a workaround until then
> >
> > On Tue, Oct 2, 2018 at 12:28 PM Burton, Ross <ross.burton@intel.com> wrote:
> >>
> >> Isn't this a bit overkill?  Is the assembler actually broken?
> >>
> >> Ross
> >> On Tue, 2 Oct 2018 at 20:21, Khem Raj <raj.khem@gmail.com> wrote:
> >> >
> >> > some unknown part of mesa's x86 assembly
> >> > code is broken by readonly text segments
> >> >
> >> > [ YOCTO #12918 ]
> >> >
> >> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> > ---
> >> >  meta/recipes-graphics/mesa/mesa.inc | 2 +-
> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >> >
> >> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> >> > index 8d0e2cb67c..e6f3712706 100644
> >> > --- a/meta/recipes-graphics/mesa/mesa.inc
> >> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> >> > @@ -107,7 +107,7 @@ PACKAGECONFIG[osmesa] = "--enable-${OSMESA},--disable-${OSMESA}"
> >> >  PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
> >> >
> >> >  EXTRA_OECONF_remove_libc-musl = "--enable-glx-tls"
> >> > -EXTRA_OECONF_append_libc-musl = " --disable-glx-tls"
> >> > +EXTRA_OECONF_append_libc-musl = " --disable-asm --disable-glx-tls"
> >> >  # llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
> >> >  FULL_OPTIMIZATION_append = " -fno-omit-frame-pointer"
> >> >
> >> > --
> >> > 2.19.0
> >> >
> >> > --
> >> > _______________________________________________
> >> > Openembedded-core mailing list
> >> > Openembedded-core@lists.openembedded.org
> >> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

