Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.31.1608227199747839619
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Dec 2020 09:46:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SDGQgvyd;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id t30so9410333wrb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Dec 2020 09:46:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=mzNyYEauT05T6uzhVuOiFRFt5IdSdf0pYrpmfyI1XmI=;
        b=SDGQgvydgWDhc4126x7Wo0fr2/EbXF39gRJ7+MTtWcnJJFPt5AtbTTpK/NyrmHWoA7
         0f6Lr2Ek607B5hPx31hsMJGhcVkIBKYX8w1eH0U5vXCY9lByBCy1aAjv1vFTOd1wHpPt
         txmjYU5uPBWtZaFWLkUf/Om0yDC4NOZ51BuBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=mzNyYEauT05T6uzhVuOiFRFt5IdSdf0pYrpmfyI1XmI=;
        b=G8odXUcDtEWseqKIO/hjenUUElYMNQbngu+G3yyuSx+GLem1x/r3jTl/BQdL+Q16f+
         UZDv8TORYRrBCdkWju/izATeXvwTlOl/B3cSOBJsVklxx/z3ZS/ncafK8XzhVHue202z
         ihV9wgTjW6PXGWAtUrBmjpB1YmjSg2KNdcDvazZvGkwLh1yp52Ff7sDDAK3uMTC5ud+I
         FBgfZXQNWCq9FWNwyyKavrqNi7GDKdGGhCboDAfvo9X0fbv/guGTTBMQ6BK/ncoao51Q
         MXn5r4d6IwEM/Yp+vWWjjAv1fC7HG2+ANyFKnUd3sxud1vs7T3/8/nrTfTpaGE3OSoBl
         3u5A==
X-Gm-Message-State: AOAM531u9+WDE01y3tHkSjQcKTdr6RuucDvvLJXs2erK5/tlTYLyO4CL
	hgHY5IMBdnaQCNYXA3tD4oBRrA==
X-Google-Smtp-Source: ABdhPJxpwHfn5ve10zNkFBTGbqkL9g86jFK6GOdUfVGeB2+UZydVbebgjGdB568z3XxPlvToSZuKdQ==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr44859780wrw.386.1608227198191;
        Thu, 17 Dec 2020 09:46:38 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 5.4.7.a.c.2.5.1.9.b.9.c.c.5.d.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (5.4.7.a.c.2.5.1.9.b.9.c.c.5.d.5.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:5d5c:c9b9:152c:a745])
        by smtp.gmail.com with ESMTPSA id x66sm8685808wmg.26.2020.12.17.09.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 09:46:37 -0800 (PST)
Message-ID: <3a1f7ea9f46a2d0311eff000d59a92f10dbf42f4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/5] systemd: update 246 -> 247
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Boccassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 17 Dec 2020 17:46:34 +0000
In-Reply-To: <68d3174ccafddf0732e553e408e8b1c5c62a095f.camel@gmail.com>
References: <20201210125312.3302065-1-luca.boccassi@gmail.com>
	 <20201214123457.122655-1-luca.boccassi@gmail.com>
	 <7d16bf791179cc0e90fd0172e984eeeacb065112.camel@linuxfoundation.org>
	 <68d3174ccafddf0732e553e408e8b1c5c62a095f.camel@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2020-12-17 at 17:25 +0000, Luca Boccassi wrote:
> On Wed, 2020-12-16 at 18:07 +0000, Richard Purdie wrote:
> > On Mon, 2020-12-14 at 12:34 +0000, Luca Bocassi wrote:
> > > From: Luca Boccassi <luca.boccassi@microsoft.com>
> > > 
> > > Update systemd to v247.1.
> > > Add rule for new oomd dbus conf and for new pam.d
> > > conf directory in /usr/lib.
> > > Drop selinux-hook-handling-to-enumerate-nexthop.patch,
> > > merged upstream.
> > > Backport 0001-meson-set-cxx-variable-before-using-it.patch
> > > from v247-stable to fix builds without C++.
> > > Refresh musl patches.
> > > 
> > > Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> > > ---
> > > NOTE: the musl build has only been build-tested, and only on x86_64.
> > > The glibc build has been built and runtime-tested on x86_64 and
> > > arm64.
> > 
> > [sorry, hit send early when writing]
> > 
> > Unfortunately there is still something not quite right in this patchset
> > as it failed again during testing. There are a few different problems:
> > 
> > meta-intel in systemd-boot:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1016
> 
> Looking into this, thanks
> 
> > a reproducibility issue in oe-selftest:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/1651
> > (which did happen last time as well on centos but I don't think was
> > reported on the list, sorry)
> > 
> > These urls may help understand why its not reproducible:
> > 
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/packages/diff-html/
> > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20201215-mhq8wl33/
> > 
> > (looks like the uid of messagebus is changing at a really quick glance)
> 
> Given your follow-up message about host contamination, is there
> anything I can do here to fix it/mitigate it, or is it a CI issue?

We'll have to look into why building it on a centos system seems to
result in a different binary from building it on other distros. Its not
a CI problem, our multi distro setup is just exposing the problem (as
its intended to).

> 
> > and a build issue in world-lsb:
> > 
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/1189
> > 
> > At the top of the logs you can see the configuration that is being used
> > for a given build, so for example in the last one, the key difference
> > to some of the other builds might be any one of:
> > 
> > DISTRO = "poky-altcfg"
> > DISTRO_FEATURES_append = ' api-documentation'
> > require conf/multilib.conf
> > MULTILIBS = 'multilib:lib32'
> > DEFAULTTUNE_virtclass-multilib-lib32 = 'x86'
> > QEMU_USE_KVM = 'True'
> > INHERIT += 'testimage'
> > SDK_EXT_TYPE = 'minimal'
> > SDK_INCLUDE_TOOLCHAIN = '1'
> > 
> > but given its a pam error, I'd strongly suspect the DISTRO = "poky-
> > altcfg" would be the likely trigger.
> 
> ERROR: systemd-1_247.1-r0 do_package: QA Issue: systemd: Files/directories were installed but not shipped in any packa
> ge:
>   /usr/lib/pam.d
>   /usr/lib/pam.d/systemd-user
> 
> But the recipe has:
> 
> FILES_${PN} = " ${base_bindir}/* \
>                <...>
>                ${libdir}/pam.d/ \
> 
> Shouldn't that match? Did I use the wrong variable?

I think the trailing slash may make it match the directory only? I'm
going from memory though...

Cheers,

Richard



