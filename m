Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web09.7562.1607429998249805846
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 04:19:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QzWeHo4A;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id g25so1796201wmh.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 04:19:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=bgIQ/PXe2i2wchO7iM03htm+qhVtdxhXB4wGLj+Ptow=;
        b=QzWeHo4AMdFgDhElhKdfWHgNdtXl7f4mu3RsbJidYhASdp9+tu1lxarEvOksPXKX9X
         OlHja69LKqlgj+D1+HdPjta/klzF9xkMRoXtSr6Zo2AEexHVmFatrRvPoyVnS18l/vs1
         Zrk0U/G5SHZev2evQkiKYcTKb3Fg2VlNjR/xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=bgIQ/PXe2i2wchO7iM03htm+qhVtdxhXB4wGLj+Ptow=;
        b=W5jLSkyRmeIzdAJMkLuLB+mC3TQoE3olEh0xtnGRgGy8IHj1/DdsAoxJVp+EJKW5hj
         HmXW79XGccaDsUCnqgOfQG2dFrSCjsuuDrQWb9x1YXDn7ETqVCVsbpHIB101V47I2bpp
         xaGsz952CUd6EIv1lHQtB8S+MfVmsBjnQaaepVXrTXzcJmFPgwn9bPm43egIVXydNAD7
         ih7/c4vt9HorUaKsLOdDaYcbt8FHxmCGaQ2Eroyt38EzfH1v8duH+DJf9wO8aO6WnsYJ
         xmbNoMxZNzc+G479KqwxVIavX6wLkMilRwDpETwNOFi5zNAld5zDZZ7ggu1MNRxl1MeN
         2dmQ==
X-Gm-Message-State: AOAM530v5608B94o6513CscRwIqsicBXYjAdQyulCoEx5UTRKN3G7G4D
	jUMLHjhwb9VbccIaD16YWtzdZA==
X-Google-Smtp-Source: ABdhPJwLeO9zUKO56FpdxWUDmh8S7RH6ulLO93vJ2EdqQBl3kO3gYCIIcB21wQevD70fwtlv/3pKuQ==
X-Received: by 2002:a05:600c:208:: with SMTP id 8mr3668577wmi.143.1607429996658;
        Tue, 08 Dec 2020 04:19:56 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.8.c.0.f.4.1.5.6.b.7.5.c.c.0.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.8.c.0.f.4.1.5.6.b.7.5.c.c.0.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c0cc:57b6:514f:c89])
        by smtp.gmail.com with ESMTPSA id d3sm3372033wmb.5.2020.12.08.04.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 04:19:56 -0800 (PST)
Message-ID: <0f923cdcf0ff0ea8e4ed5bb8fdbe568f3a904446.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv3 2/5] bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 08 Dec 2020 12:19:55 +0000
In-Reply-To: <CAM9ZRVuTxAwqRAntHaf5UGg2iiAPW=KBC7v0hCM02J0a8WgPyg@mail.gmail.com>
References: <cover.1606846217.git.pkj@axis.com>
	 <b7bae6e1633fba206d9c7abad93d79fbe7b0f654.1606846217.git.pkj@axis.com>
	 <CAM9ZRVtVRk2CrBKeG=Ks8a+OPhTPKu6q=HctT39tKyYCbAguFA@mail.gmail.com>
	 <CAM9ZRVsX+r31zxDHDNA7BOiBCrGyrwwYJWwMmjdF6p69QScJUg@mail.gmail.com>
	 <88d9a9dea0420aa5944c0acba44f14f6eb24d771.camel@linuxfoundation.org>
	 <CAM9ZRVuTxAwqRAntHaf5UGg2iiAPW=KBC7v0hCM02J0a8WgPyg@mail.gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-12-08 at 08:48 +0000, Paul Barker wrote:
> On Mon, 7 Dec 2020 at 12:46, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Mon, 2020-12-07 at 12:04 +0000, Paul Barker wrote:
> > > On Mon, 7 Dec 2020 at 10:29, Paul Barker <pbarker@konsulko.com>
> > > wrote:
> > > To follow up some more: The entries in PSEUDO_IGNORE_PATHS are
> > > treated
> > > as string prefixes within pseudo. So if
> > > "/home/pbarker/Projects/Yocto/meta-linux-mainline" is added to
> > > the
> > > ignore list it will exclude not just
> > > "/home/pbarker/Projects/Yocto/meta-linux-mainline/build" but also
> > > ""/home/pbarker/Projects/Yocto/meta-linux-mainline-build".
> > > 
> > > I wonder if some more of those entries should have trailing
> > > slashes.
> > 
> > In most (all?) cases it was very deliberate FWIW...
> 
> That does make sense. Ignoring "${COREBASE}/meta" will also ignore
> most layers unpacked or cloned within the poky directory as their
> names start with "meta". However that does miss layers if you use a
> different directory structure which is what Peter's patch addresses
> (though I'm still not sure if there's an actual build failure with
> some layers which it is intended to fix or if it's just to make
> things
> consistent).
> 
> The issue comes when you clone a layer as the top-level of your
> working tree and build within that. That's how I work with
> meta-sancloud & meta-linux-mainline. It's also what happens if you
> build using the kas config in meta-raspberrypi. So it's not uncommon.
> 
> Investigating why the layer directories are being ignored I found
> this
> commit added the ignore of "${COREBASE}/meta":
> 
>     commit e0cb6dd689a362d8433caa14cc5a9fdd5eb44923
>     Author: Richard Purdie <richard.purdie@linuxfoundation.org>
>     Date:   Wed Oct 7 23:08:45 2020 +0100
> 
>        bitbake.conf: Extend PSEUDO_IGNORE_PATHS to ${COREBASE}/meta
> 
>         Unfortunately, .pyc files can be generated in meta/lib/oe
> which corrupt the pseudo
>         database so we need to extend the ignore list to cover this
> as well.
> 
>         Signed-off-by: Richard Purdie <
> richard.purdie@linuxfoundation.org>
> 
> Could we instead ignore "${LAYERDIR}/lib" for each layer?
> 
> An alternative would be to detect the case where TOPDIR or TMPDIR is
> beneath an entry in BBLAYERS and handle that as a special case.


I'm wondering if we should just set:

sys.dont_write_bytecode=True

since the number of places we'd get significant speed from this is
limited. We probably only need to do this in any pseudo using code
paths?

Cheers,

Richard


