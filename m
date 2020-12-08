Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.6523.1607422658844791121
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Dec 2020 02:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ufofrjcn;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id m5so6032757wrx.9
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Dec 2020 02:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=C9pl4sANLXy9IG34YqbdL+uKyGsiOky5PhPnEHXFc1w=;
        b=Ufofrjcnj7/bbkb1y175FsUyheqSGr+dM+T3JMMNLZDid/6PcmT6nit4OJsN5hJDHb
         SX2wwAHOPDzznjkyboV/SqZ/ZHwPGoYC+ZDfZtEVYSKYEV0NsPW+VcVo8blEwL432QEQ
         OzEeb+2WutkZo8TrudjU+Mnm621TU9y8YQ4j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=C9pl4sANLXy9IG34YqbdL+uKyGsiOky5PhPnEHXFc1w=;
        b=nWCcfeBBcCrGlZHdGAGHGwrjKGU1LURgnZzf18FbVfInSYuh0OomGPgSU6i1C72SmM
         WaqZ9nap67697ElFCIwtnMFO94QTdNJj0mM3kzOJ8PadiyNvitMznDhuRV0ugOg8lqiN
         iW/YKL3VyqWL5QF/3M+pBEU6yccY5X9XOsTl9cQZKApCIqHHjw2cHpYWLF5aWP5yV4qR
         M/00fp8Aj6M8ew048YmTe5b37PeB74nMnzPlmqv7UwbcrOUWkCRGDKGNQvrJyRkVogaw
         MoDjLBU36sY6Jw0tS6Dya2xbj25dGUe//OsAMGeUF/+wa9F7sUlJlHflb1Tvk9frQo1S
         mo+w==
X-Gm-Message-State: AOAM533YEsHaEHkG5ejpUDyjfMU5yTGxctnf9gP0a9Git9ndNpsNi7IP
	fj+RnSovrXvDKXSrC9eNnzctlQ==
X-Google-Smtp-Source: ABdhPJw07wG3XiDqm97phRaYVmpwY/2Zj9kyMCtU/lz7Qp7DfbCFHFMNAlZBqu8MCCa1mHtqZoYZXQ==
X-Received: by 2002:adf:f1d2:: with SMTP id z18mr25715130wro.244.1607422657190;
        Tue, 08 Dec 2020 02:17:37 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 9.8.c.0.f.4.1.5.6.b.7.5.c.c.0.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (9.8.c.0.f.4.1.5.6.b.7.5.c.c.0.c.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:c0cc:57b6:514f:c89])
        by smtp.gmail.com with ESMTPSA id b18sm20326528wrt.54.2020.12.08.02.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Dec 2020 02:17:36 -0800 (PST)
Message-ID: <8c23ef9f3ae53debdb90eecea4f16a7909aa3626.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCHv3 2/5] bitbake.conf: Add all layers (from BBLAYERS) to PSEUDO_IGNORE_PATHS
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Paul Barker <pbarker@konsulko.com>
Cc: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, openembedded-core
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 08 Dec 2020 10:17:34 +0000
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

I think we'll have to look at alternatives, yes. Thanks for reminding
me this was for the pyc files, I'd forgotten the exact reason.

The reason I added meta was because at least in core we have multiple
python lib directories (there are also things in scripts/).

Peter: Which files were you having a problem with in your layers?

We may need to go back to requiring layers to set this up correctly
themselves where needed?

Cheers,

Richard

