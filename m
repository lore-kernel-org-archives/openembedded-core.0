Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by mail.openembedded.org (Postfix) with ESMTP id 72B0E7BD73
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 13:37:59 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id v5so9465879lfe.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 05:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cEtGsO/ebi4CDkq9QOgfrOWzTvo5oeWAIkcwC+kM/fE=;
	b=kCPF3MjrY8n11IS5ztpIG6MaalvC97xm/l/z9ApSigfUbDRy49/2rtDbidRzNBonoU
	ZcK/AD5HMSbg+pPz0t1NE2/x6ZTfn9dWuvFuJFvLKqgnqlKIEJq7VjzIJXl2Rlv8Sdlp
	S7sNFaBxKRo9oF9Ud0Lfl4lizXMH4xLcqD5PlA0V+qYOd3Nc4zLWF1AWf/9MYduhOjPE
	4wbvbW46jmdPvOXgWhc5el/ysL88ndHuDaPmouKmW88rb9Cw9xnZ+b0xh0/JdhjuoE6h
	x+vZGDZoMHbWbTI9lus293PDl+0F+Hxuw2MEc89erW0Kc9fnd6hRBlfcU3B5HwzXSsod
	fmTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cEtGsO/ebi4CDkq9QOgfrOWzTvo5oeWAIkcwC+kM/fE=;
	b=Q6AR1/W1yslZYHlYm9soY9Hf+FXmauvM5ZQjErw96ZuiPm1ItzVoknBh1kPZsktuky
	iVKQrl4Zy9w5j7HYxqs70loYp+t1bNQf4oxF3lLV5XGCVC+44ipBFGn1JC08GKKztvYR
	TWc7goxs1FN3ybzljfwnTwVpqKzD7yNhzwYAhTtf7QIlcbxuhnyktLwzeowJ/3T/7ykN
	UTJ4eTjEggJmTQHKS7iydwq89V7ps8+BjVlcUF9geno3Ysg19HO2g37RWa8t0EeDziCO
	rviRnWPHJi1fBpMBMopKuk5EtS+/jBmWLo9oiUKJDyh3+CBTaVFK4m/oPUC+zScaR1u+
	VTbw==
X-Gm-Message-State: AA+aEWYvGX2e34yS6A10DMF3kVrTdOsLotCAVLgDjUlKVHeg+T49TbUY
	Yc43g/+EWrUmWaM6e+5k4w5ZVFHaR2iN5arnEEYGEw==
X-Google-Smtp-Source: AFSGD/ULrN8U5WU7zw5MBC2ghXbXzmdPtCZ5RqoF7NnTbG6dIGPVvLtl4IVJw8lm2CgJjPGml+D3jBwFdQMNJw5QPYQ=
X-Received: by 2002:a19:26ce:: with SMTP id m197mr24002lfm.23.1545053879579;
	Mon, 17 Dec 2018 05:37:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1545017774.git.bruce.ashfield@windriver.com>
	<7fc18a5b076eaf0c9e089ece60ed6845f2d36fbc.camel@linuxfoundation.org>
In-Reply-To: <7fc18a5b076eaf0c9e089ece60ed6845f2d36fbc.camel@linuxfoundation.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Dec 2018 08:37:48 -0500
Message-ID: <CADkTA4P5h=ErgMF4W-oHcdgQ8BYQNK6SgdHgC5wdmY3p=4Zysw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 00/17] linux-yocto: consolidated pull request
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
X-List-Received-Date: Mon, 17 Dec 2018 13:37:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 17, 2018 at 7:26 AM <richard.purdie@linuxfoundation.org> wrote:
>
> Hi Bruce,
>
> On Sun, 2018-12-16 at 22:38 -0500, Bruce Ashfield wrote:
> > Here is the latest linux-yocto consolidated pull request. Some of
> > these commits are re-sends of changes that didn't make the release,
> > and others are new.
> >
> > Most are routine -stable bumps, configuration cleanups, etc, and
> > shouldn't cause any issues.
> >
> > The more interesting part of this queue is the introduction of 4.19
> > reference kernels to replace 4.14 as the LTS version in master. I've
> > built and booted it on qemu*, so it is sane from that point of view.
> >
> > I'm trying to separate out the kernel bumps into distict pull
> > requests so I can deal with one set of issues at a time:
> >
> >  - I'm not removing 4.18 yet, since it will be replaced by 4.20+ as
> > the "latest" kernel in the next release. Plus our h/w reference BSPs
> > need to be updated before I can drop it.
> >
> >  - I'm not bumping libc-headers in this pull, I'll do that in my next
> > queue, and we'll jump to 4.20 for the libc-headers at that time.
> > There will be one more bump to match the 'latest' reference kernel
> > for the release.
> >
> > I will also follow up to the appropriate list with a bump to the
> > poky-lsb distro
> > builds that are using 4.14 as their default kernel version.
> >
> > I'm not convinced this is issue free (i.e. did I miss some reference
> > to a 4.14 kernel ??),
>
> The bbappend in meta-yocto-bsp? ;-)
>
> (I deleted it)

ahaha. Did you want me to add that to my queue (a delete of it), since I'll have
a look at the 4.18 version bump and see what happened to qemumips64.

Or I can send an incremental 4.18 patch (since I see there's another version
bump for it available now), and take care of that issue without resending the
queue. Whatever is easiest for you.

Bruce

>
> >  but some people have been asking about 4.19 support, so I wanted to
> > get this queue out, and start dealing with any issues it brings.
>
> MACHINE=qemumips64 seems to fail on 4.18:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/74/builds/102
>
> Cheers,
>
> Richard
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

