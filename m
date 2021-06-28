Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.10944.1624885828103304047
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Jun 2021 06:10:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=d0PKa5xi;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: andrea.adami@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id o5so4864125ejy.7
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Jun 2021 06:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=REUry7njz1CQXEvnqqZmB+dVPAIhTfOKgj/KnrFn7+g=;
        b=d0PKa5xi2iCZMjAVA11URBuQVq+psYs48PzpnA9q1WE/VIiT2lMswuXZL3tYpK62bp
         rdqMdE8R+SXow1d92DrvcTL/mJniDqp0YRgzYTuICI64LLa/1KSNuCkfm9iZ+2AxvV3T
         eHN3AOFLs8Qat6a+4n7yXaK7j7yq/jnOB1BFpaMX/5teUak9zGWiH+LP2btPox5GpTDs
         mK/g1B5GbNDwTauVAHalZcB41NbhGTcIPSGiRPKYWb2AO4hQQNHTH2U3OPy2fLT70hqp
         zuTOWbDokHujn/+qEXWhxV0nC3ODARQZCOJBkzuqR/qXb9qYVb7KeHToLReWnJTqff34
         uGkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=REUry7njz1CQXEvnqqZmB+dVPAIhTfOKgj/KnrFn7+g=;
        b=N3F6T4HQMAchVQqc8SbwQFc/b4QYBTE0DRGSvpB4AfDnFTbTQIn6P9uWPlW2bhBq7N
         k78Q0BF2Lnq9/tZpx3wbuqw/0Wbo4HBrHnLdx/p6rOGzR0kVI9mjpmxlVflfu1JDTNX3
         B3BMvTi2phuNFRGk8nfbPXC6i4JzDVFOO16U0jltqxJQAUx6NsnvQ5j+3zKBMetBg1E8
         rbAmzh+geCDgHdk8KyMN5FrirlVgDaHLfUDlG6zRRWqRV6I8A2WwxxSoopguK8x3fSBt
         O/UNAQRJFGUN1s5MVtDdZ0jcgENdElPsO4D8tBRY+BxdSfEyZsfwGlM/8OnbnZfDmd37
         JbiA==
X-Gm-Message-State: AOAM5326ZMln8vpyklRGKpyYPX9VH/KPr1VPjGtiF59Bur2YJS69RSN2
	RGdM4CTg4dwQudwlDPBfmR6OptRjZ3ike4EokGw=
X-Google-Smtp-Source: ABdhPJx8xp61KhWjXeUJRAl/jDqmc3Tx3noe1WXomgmELiVaubPghhNa3OBj8TsUT0yCoTrQ94DROMZeJ9Wc7iH7zDY=
X-Received: by 2002:a17:906:b05:: with SMTP id u5mr6592076ejg.142.1624885826537;
 Mon, 28 Jun 2021 06:10:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQYJAvFsFr-1WDMkqeSLReq6V2irGR04XOEoVa_GnXAK+abqA@mail.gmail.com>
 <CANNYZj_yZHkpbGKPaec_x4AQDQ8jR_rLk1mroBZxn6JCpQ9WbQ@mail.gmail.com>
 <CAAQYJAspv72aL7J_fYri+vk_OfL=PDNCvGk9C6O=CisB3dEPeg@mail.gmail.com>
 <CANNYZj-XL7NB0S=3bTv9DMvhbMTmUfJFK627YAqQ4for3QMDqA@mail.gmail.com>
 <CAAQYJAvGNSy2CAD6Dwk2-LYz-KGUp-pFjXtOLKD_1iD4SOaghQ@mail.gmail.com> <41c8f86302dbdf6be6d6dc4f057619e26b05c7ad.camel@linuxfoundation.org>
In-Reply-To: <41c8f86302dbdf6be6d6dc4f057619e26b05c7ad.camel@linuxfoundation.org>
From: "Andrea Adami" <andrea.adami@gmail.com>
Date: Mon, 28 Jun 2021 15:10:15 +0200
Message-ID: <CAAQYJAsGgbw4NEyYVXQ70hMLgHmiVu3z1UaWemMN169UyFWkUw@mail.gmail.com>
Subject: Re: [OE-core] RFC: pulseaudio vs. meson vs. neon
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 28, 2021 at 3:03 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2021-06-28 at 14:44 +0200, Andrea Adami wrote:
> > On Mon, Jun 28, 2021 at 2:36 PM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > What I am saying is, can you discuss this with upstream first please?
> >
> > Sorry, no, I'm not in the position to do that.
> > Besides, I am dispatching my armv4/armv5te Zaurus hardware so I will
> > not be able to test anymore.
> >
> > My point here is, for this pulseaudio 14.x release (in Honister) we
> > could do an effort and patch the damn file.
> > I write this because this is the only failing recipe for
> > core-image-sato for armv4 and this arch is still supported in oe-core
> > (thank you so much Khem).
> >
> > So I'd say as long as armv4 and armv5t are supported we need to patch
> > the recipe.
> >
> > With next pulseaudio 15.x the older arm will maybe lose support, I
> > don't know now.
>
> We've left armv4 "support" in there mainly as it doesn't really cost us
> anything to do so and does help some users. We're not in a position
> where we have many people interested in helping carry patches like this
> to pulseaudio.
>
> What that means is that where there are fixes, they need to be easy to
> maintain and not impact the more modern tunes.
>
> Hacking CC as in the patch you linked to isn't particularly nice, nor
> is a global export it requires (changing the behaviour of other arches).
> It is also risky as the pulseaudio build system tries to do something
> quite different and this workaround is liable to break.
>
> I'm not against patching in an explicit option to pulseaudio but it
> would also be good to mention that to upstream, raising the fact there
> is a problem, contra to what their commit says.
>
> Cheers,
>
> Richard
>
>
Richard,
thanks for reviewing this.
As you know I'm mumbling about this on irc these days.
Please let's wait and read what Khem proposes.

Note that the switch to meson wasn't mandatory.
"we will be dropping support for the autotools build in 15.0"

A.A.
>
