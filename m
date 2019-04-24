Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
	[209.85.210.52])
	by mail.openembedded.org (Postfix) with ESMTP id A90EB7D676
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 19:05:25 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id c16so17167344otn.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2019 12:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n4+jgOTROsrzfjUhWEZv8k5JAGgFZ16WyA65aydAOC0=;
	b=Hd8vevTbaPeM1gk95o3YdrmcYr6M5u4M4rT6xzjV6FNvCeSty15yYH6VP++SlWsB/L
	aLJDpNuNVXXefX4YDa+Mr8EAQelpOpFPkYvyb7l9iM7WmO4RCa5aaVlQmhTW4o2QpnKp
	Tgv3Rr9OhKB1g1t77fs3XXG65IGvP0RbBM9IsSZxcJ6mapSEdPHliqzLT1x8wZgklErP
	83QZ1oGlcsfrYLzRwFq0fDOf6i/IcmH8cXpvBx99t5yjwHX4fMh0314S8AUQI/T4h8cx
	oam+WGJhd/qGvd+nzAcUNtDpzgPbDWQqyNNhnubRqmbL3JuvxgFH54asgRzxvpaxhCEn
	Ok4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n4+jgOTROsrzfjUhWEZv8k5JAGgFZ16WyA65aydAOC0=;
	b=UbgEurNWu3BJNk0m6y1/r+O6tddj2R9hfZjpT0KNYF+pKC+V4o7MjI/o+AaIO3P8CN
	QUOJLJWS9ANCf7J22WgwIQ0OhyH4P2Zl3qReypuCmAn34wSp+VF102K9EwYaEjEVMvQl
	2amZUur6QiNDVwxn5WKctMB19iEn1BUBPkiP7jmS3XZeAa6/FwsmaB3Od9TxL/yJH9zM
	6t3cjcJUfvCqLks8vk9RtjN2Qh1wSrZeoZT1LkoQ4zpU7kxLhByamj/yaZWTxhe3qk40
	GnlwnAZjCKlXkC7hq0MlP/sZgNYVNT0T2i1C8txAD9avWOf7pHWtmEcWvkPKwqkUVNtm
	QHBw==
X-Gm-Message-State: APjAAAX+4Ye0OK/hp3qdo0rhOMJqMrFyud9fwt5Xif7rOJ1JGchKfmBH
	2Dl3afSAJfrj1qZ1D4x+D8nugntCGMXfav3mSMV4Hg==
X-Google-Smtp-Source: APXvYqwn0LwDdApego27a+7vC9yV4Jri/BmowAVSG8AVmCT3BfgFrWyZXgaykwD0RjQ7oz47+ZtlcoDafWn78c+orpk=
X-Received: by 2002:a9d:68ce:: with SMTP id i14mr114997oto.293.1556132726712; 
	Wed, 24 Apr 2019 12:05:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190424071955.22692-1-zangrc.fnst@cn.fujitsu.com>
	<CAJTo0LZJFLLtO7ZEX7SBUpo4T-=pSE++gKFdAAaTsd5iTZYefg@mail.gmail.com>
	<CAAPZna30Z1BydPm2YVr1VtWQf4VeK_ybK34+9Fs08O9fujMiqQ@mail.gmail.com>
	<CAAPZna1bD19D79uqKUVjBjSgTPLMamoqnRkcHeC9iSU7wqZ0jg@mail.gmail.com>
In-Reply-To: <CAAPZna1bD19D79uqKUVjBjSgTPLMamoqnRkcHeC9iSU7wqZ0jg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Apr 2019 21:05:15 +0200
Message-ID: <CANNYZj8xonoE2g7i2pxDnH-J55f8yCt29jAEfUFUV7+UPegL5Q@mail.gmail.com>
To: Fabio Berton <fabio.berton@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mesa:upgrade 19.0.1 -> 19.0.2
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
X-List-Received-Date: Wed, 24 Apr 2019 19:05:25 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Fabio,

just rebase it to the current master, we can update mesa later on.

Alex

On Wed, 24 Apr 2019 at 20:26, Fabio Berton
<fabio.berton@ossystems.com.br> wrote:
>
> Hi Zang Ruochen!
>
> You need to update mesa-gl recipe too.
>
> On Wed, Apr 24, 2019 at 3:04 PM Fabio Berton
> <fabio.berton@ossystems.com.br> wrote:
> >
> > Hi Alex!
> >
> > I'll rebase meson patch to work with this version.
> >
> > On Wed, Apr 24, 2019 at 8:07 AM Burton, Ross <ross.burton@intel.com> wrote:
> > >
> > > How did you even test this?
> > >
> > > ERROR: ParseError at
> > > /home/ross/Yocto/poky/meta/recipes-graphics/mesa/mesa-gl_19.0.1.bb:1:
> > > Could not include required file mesa_19.0.1.bb
> > >
> > > Ross
> > >
> > > On Wed, 24 Apr 2019 at 08:19, Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
> > > >
> > > > -Upgrade from mesa_19.0.1.bb to mesa_19.0.2.bb.
> > > >
> > > > Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> > > > ---
> > > >  meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.2.bb} | 4 ++--
> > > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > > >  rename meta/recipes-graphics/mesa/{mesa_19.0.1.bb => mesa_19.0.2.bb} (85%)
> > > >
> > > > diff --git a/meta/recipes-graphics/mesa/mesa_19.0.1.bb b/meta/recipes-graphics/mesa/mesa_19.0.2.bb
> > > > similarity index 85%
> > > > rename from meta/recipes-graphics/mesa/mesa_19.0.1.bb
> > > > rename to meta/recipes-graphics/mesa/mesa_19.0.2.bb
> > > > index d90be8a074..e6646e8503 100644
> > > > --- a/meta/recipes-graphics/mesa/mesa_19.0.1.bb
> > > > +++ b/meta/recipes-graphics/mesa/mesa_19.0.2.bb
> > > > @@ -7,8 +7,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
> > > >             file://0004-use-PKG_CHECK_VAR-for-defining-WAYLAND_PROTOCOLS_DAT.patch \
> > > >  "
> > > >
> > > > -SRC_URI[md5sum] = "19636bb3da35c21f43040d31e575d5ce"
> > > > -SRC_URI[sha256sum] = "6884163c0ea9e4c98378ab8fecd72fe7b5f437713a14471beda378df247999d4"
> > > > +SRC_URI[md5sum] = "7f84af1c3fe2078c35a7a991d1469921"
> > > > +SRC_URI[sha256sum] = "1a2edc3ce56906a676c91e6851298db45903df1f5cb9827395a922c1452db802"
> > > >
> > > >  #because we cannot rely on the fact that all apps will use pkgconfig,
> > > >  #make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
> > > > --
> > > > 2.20.1
> > > >
> > > >
> > > >
> > > > --
> > > > _______________________________________________
> > > > Openembedded-core mailing list
> > > > Openembedded-core@lists.openembedded.org
> > > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> > > --
> > > _______________________________________________
> > > Openembedded-core mailing list
> > > Openembedded-core@lists.openembedded.org
> > > http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

