Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
 by mx.groups.io with SMTP id smtpd.web10.930.1586395475369235258
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Apr 2020 18:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cl0Hi1fS;
 spf=pass (domain: gmail.com, ip: 209.85.160.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f194.google.com with SMTP id g7so1560947qtj.13
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Apr 2020 18:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nUIja/2UOsnjUoVqEmQDub/vPaK+E6xzgVlgSa0/z9g=;
        b=cl0Hi1fSakGtUzachLKoyOiAGDKLtyXg7raLWa60G7cT1YHZkxEFQK+68jv7Wmi3wy
         dfPvLdKjl9X9iY0EawpYuWsXA3fJzKdICtzWpMDzqwmI1DWZmRdKyBxKi/XG8XzJCfVV
         6uaGCP0W5F6kF+CtGZ0ZVreLl3y9XLWqknbf0xdNKGJbfyXsgITLNSXUCQubmiKz64fO
         /zSDrozJr7NgkdM+/lizpy8Ib9+p7w/xK4gBP/75E3djpOPEVLxjoLHLBr7jqmouoOpy
         Ew5UPksuajenroKOHgBhrK4mV5hhFnNPXjamZoUHKtl7obBzl0n2JUsilc2biSLyAvos
         iOIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nUIja/2UOsnjUoVqEmQDub/vPaK+E6xzgVlgSa0/z9g=;
        b=k7I1tt/v9ziR/2UVLBoiC5OTGRTWEkSfTvVwPvcFOfZkq4G7sbYjlm7hVmHpFN2AKI
         37WvGtbDsxgLiwdUdPhTpq4vgDzaiAap9l6HXW4JvMlKBPhUTgFoQFQ2eq3aJsIsbsE5
         DbqeByfA5zebOdpTtywVzxNq6MDGSW9oULsrkQsNA86IHRA/MVffGnOBiDJLk9X2CiVS
         IAsHeWO7lffyWydS08XuRsK6m28fGd5VqpX7ucagP5RYttkXIW/M7DZP/EX2pPL89/6h
         LgTW9qGfZo1cU/5ZhDKpakMuGlqp35lQUqBGtbV1yIFGXDpVMMngg5xA4J9bNQkBkEyF
         KuuQ==
X-Gm-Message-State: AGi0PubA7k7uL/RfPp5/SreGC8TQ0Eq0Pkde2iRLAbaaWb/TRO3qsnu8
	cvo+RClsBxdgnBobIc5M4Qd1GGlhvNnSKwtABIeA9KX0
X-Google-Smtp-Source: APiQypJky+KFlKGF4nXnXzFaoVE1+twJho7MyrS68DW6ZPXdj/gcND+X3bSm/oZ25XIH1BFbB7FDqnhI2JRuFMcyXsg=
X-Received: by 2002:ac8:a09:: with SMTP id b9mr10069395qti.190.1586395474216;
 Wed, 08 Apr 2020 18:24:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200408231808.393685-1-richard.purdie@linuxfoundation.org>
 <CAMKF1srJ72-knr8BJxGcJ6Mct=y_Dt4DtZWMhs5UM+eoCf4i6A@mail.gmail.com> <CAMKF1sox5DY7Zh5EN5onjGArv0ZTH=+L6+H8dQZtmcHCgFru2A@mail.gmail.com>
In-Reply-To: <CAMKF1sox5DY7Zh5EN5onjGArv0ZTH=+L6+H8dQZtmcHCgFru2A@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 8 Apr 2020 18:24:08 -0700
Message-ID: <CAMKF1sqfqFvK3U7b_59Au=Ko8fWEevRBndNGCEnCdBPpMtw5Ag@mail.gmail.com>
Subject: Re: [PATCH] musl: Show error when used with multilibs
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 8, 2020 at 4:59 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Apr 8, 2020 at 4:45 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Wed, Apr 8, 2020 at 4:18 PM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > As discussed in the bugzilla entry, musl is not compatible with multilibs
> > > and has no plans to support this. Therefore tell users this from the
> > > recipe rather than letting them run into build failures.
> > >
> >
> > I dont think thats the case anymore, I have sent patches to fix
> > multilib on musl.
> > this seems a broad brush. What are you trying to fix ?
> >
>
> I see the bug list a fix that was done last year as a workaround to
> disable multilib headers that should be reverted something like this
>
> diff --git a/meta/classes/multilib_header.bbclass
> b/meta/classes/multilib_header.bbclass
> index e03f5b13b2..48f231eed0 100644
> --- a/meta/classes/multilib_header.bbclass
> +++ b/meta/classes/multilib_header.bbclass
> @@ -6,13 +6,6 @@ inherit siteinfo
> # all of the ABI variants for that given architecture.
> #
> oe_multilib_header() {
> -
> -       case ${HOST_OS} in
> -       *-musl*)
> -               return
> -               ;;
> -       *)
> -       esac
> # For MIPS: "n32" is a special case, which needs to be
> # distinct from both 64-bit and 32-bit.
> case ${TARGET_ARCH} in
>
> would be more appropriate now a days.
>

I have now tested the above patch and sent for review to ml.

> > > [YOCTO #13122]
> > >
> > > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> > > ---
> > >  meta/recipes-core/musl/musl.inc | 6 ++++++
> > >  1 file changed, 6 insertions(+)
> > >
> > > diff --git a/meta/recipes-core/musl/musl.inc b/meta/recipes-core/musl/musl.inc
> > > index bdce412162c..f2f3d3d054b 100644
> > > --- a/meta/recipes-core/musl/musl.inc
> > > +++ b/meta/recipes-core/musl/musl.inc
> > > @@ -29,3 +29,9 @@ ARM_INSTRUCTION_SET_armv4 = "arm"
> > >  B = "${WORKDIR}/build"
> > >
> > >  do_configure[cleandirs] = "${B}"
> > > +
> > > +python () {
> > > +    multilibs = d.getVar("MULTILIBS")
> > > +    if multilibs:
> > > +        raise bb.parse.SkipRecipe("musl is not compatible with multilibs")
> > > +}
> > > --
> > > 2.25.1
> > >
