Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web10.27502.1601259075984481505
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2020 19:11:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R6Z+dlK0;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id gx22so6353026ejb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2020 19:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nu5UlbXablzGpuNXhkgJZSt9KYc7mLpmlqUS+QFQcDE=;
        b=R6Z+dlK0hWXGiCyFRhXVxjtORZsgHbMEEYrHniVIWq07BFxarn6iPKDwQe8bpQctx9
         n6kYqFOHOZzT1mNCNU4wRWzyqhyh0MLRZTJIZFlaLt+bQwM08Zq0utSNBAAodBLRE4xB
         yZV9Kw7PnFVK3Xuu4vFAB7DGldpOq2vjvYJd+Be7LQkB7a8e7+QWgIf04wa42oqy4HFJ
         tLJmCQ6mG2lXpwdgd9z0k9mJaSagkFbDc72pzBcGysPUKEbkvYeLL0ik/WpnZ8B5t8f7
         WYtokSbfpARVnbcNVkLT/KJ2GEPcC9P49ncFlxdUcS7r7F7tqlcfsD2OpaEoi4cvkyRx
         N78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nu5UlbXablzGpuNXhkgJZSt9KYc7mLpmlqUS+QFQcDE=;
        b=BQ8sKu1Kpx86xPGmM2Taseq72r9AEcehzk5vqG1Ily2oLo0DiwFMcFbdh3mwinNjEm
         7GiIHroZK5NsHLFGNdmgxPwQaMJg6RPPuJ2XzIgvORboz9lypc+ulb435ZVLtARbI5S2
         a93jhfPNjwA9LyzKwJ0mtR7+3xykaTztqHt7EeMdoCrJNZGbfX6WOPOpv+ZXFuBEh+E2
         KNjheuoowPXECzDusIkLkafB42B95PjF/upmSKC6X6OpI2y9frwF2NAperMUmkAl+by3
         YAa7hPTHXR1vLQh+LzzCvAfAk8Ie0gvj4D6pReQJFYOvOgeRWmKAo9SxFXWKMFOg1fMx
         k8fA==
X-Gm-Message-State: AOAM5300H9MOpnq5Q4rAzX6DeJlvmOwLMyMl0iVZRyaO9xqM3w18UYIo
	Z0KRBMivQ8rec24NW5PPzFiSbMmtYorlFUH66fE=
X-Google-Smtp-Source: ABdhPJwAAuE72QS/ZRy2WMGh9G6YQTyRV4FqPb3IDzUFtPyAGltY2w9mZPMZ6Y93VUISeBebHUfJjh/QLe9H7BICCe4=
X-Received: by 2002:a17:906:4a81:: with SMTP id x1mr13896083eju.541.1601259074299;
 Sun, 27 Sep 2020 19:11:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200925192810.1372-1-jon.mason@arm.com> <20200925192810.1372-2-jon.mason@arm.com>
 <6a248843f00759ecac0785cea187d8724bd362aa.camel@linuxfoundation.org> <CAPoiz9zS8sXVb6iFh3Yndtej_toUXKNw4nOGdUx5WpaeevQADA@mail.gmail.com>
In-Reply-To: <CAPoiz9zS8sXVb6iFh3Yndtej_toUXKNw4nOGdUx5WpaeevQADA@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 28 Sep 2020 04:11:03 +0200
Message-ID: <CA+chaQdk+xnnVMuc-MVmnKTBmtXA15av3Jv6zG6w2pNSHyjx8g@mail.gmail.com>
Subject: Re: [OE-core] [meta-oe][PATCH v2 1/6] Space-comma Cleanups
To: Jon Mason <jdmason@kudzu.us>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000512b9605b0562e13"

--000000000000512b9605b0562e13
Content-Type: text/plain; charset="UTF-8"

The last one is a symlink and sed -i doesn't follow symlinks as you haven't
used --follow-symlinks.

On Mon, Sep 28, 2020 at 3:48 AM Jon Mason <jdmason@kudzu.us> wrote:

> On Fri, Sep 25, 2020 at 5:29 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Fri, 2020-09-25 at 15:28 -0400, Jon Mason wrote:
> > > Multiple files have " ," instead of ", " in expressions.  This
> > > changes
> > > them to conform to the way the rest of them are done.
> > >
> > > Found and corrected via:
> > > git ls-files | xargs sed -i 's/ ,d/, d/g'
> > >
> > > Signed-off-by: Jon Mason <jon.mason@arm.com>
> > > ---
> > >  meta/classes/linuxloader.bbclass              |   2 +-
> > >  meta/classes/rootfs_rpm.bbclass               |   2 +-
> > >  meta/conf/machine/include/arm/arch-arm64.inc  |  10 +-
> > >  meta/conf/machine/include/arm/arch-armv4.inc  |   2 +-
> > >  meta/conf/machine/include/arm/arch-armv5.inc  |   2 +-
> > >  meta/conf/machine/include/arm/arch-armv6.inc  |   2 +-
> > >  meta/conf/machine/include/arm/arch-armv6m.inc |   2 +-
> > >  meta/conf/machine/include/arm/arch-armv7a.inc |   2 +-
> > >  .../conf/machine/include/arm/arch-armv7ve.inc |   2 +-
> > >  .../machine/include/arm/arch-armv8-2a.inc     |   2 +-
> > >  meta/conf/machine/include/arm/arch-armv8a.inc |   2 +-
> > >  meta/conf/machine/include/mips/arch-mips.inc  |  16 +-
> > >  .../conf/machine/include/tune-arm1136jf-s.inc |   2 +-
> > >  .../conf/machine/include/tune-arm1176jz-s.inc |   2 +-
> > >  meta/conf/machine/include/tune-arm920t.inc    |   2 +-
> > >  meta/conf/machine/include/tune-arm926ejs.inc  |   2 +-
> > >  meta/conf/machine/include/tune-arm9tdmi.inc   |   2 +-
> > >  meta/conf/machine/include/tune-cortexa15.inc  |   2 +-
> > >  meta/conf/machine/include/tune-cortexa17.inc  |   2 +-
> > >  meta/conf/machine/include/tune-cortexa5.inc   |   2 +-
> > >  .../include/tune-cortexa57-cortexa53.inc      |   2 +-
> > >  meta/conf/machine/include/tune-cortexa7.inc   |   2 +-
> > >  .../include/tune-cortexa72-cortexa53.inc      |   2 +-
> > >  .../include/tune-cortexa73-cortexa53.inc      |   2 +-
> > >  meta/conf/machine/include/tune-cortexa8.inc   |   2 +-
> > >  meta/conf/machine/include/tune-cortexa9.inc   |   2 +-
> > >  meta/conf/machine/include/tune-ep9312.inc     |   2 +-
> > >  meta/conf/machine/include/tune-iwmmxt.inc     |   2 +-
> > >  .../machine/include/tune-strongarm1100.inc    |   2 +-
> > >  meta/conf/machine/include/tune-xscale.inc     |   2 +-
> > >  meta/conf/machine/include/x86/arch-x86.inc    |  12 +-
> > >  .../recipes-core/images/core-image-minimal.bb |   2 +-
> > >  .../qemu/qemu-system-native_5.1.0.bb          |   2 +-
> > >  meta/recipes-devtools/qemu/qemu_5.1.0.bb      |   4 +-
> > >  .../vulkan/vulkan-demos_git.bb                |   2 +-
> > >  meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 +-
> > >  .../linux/linux-yocto-rt_5.4.bb               |   2 +-
> > >  .../linux/linux-yocto-rt_5.8.bb               |   2 +-
> > >  meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   4 +-
> > >  meta/recipes-kernel/linux/linux-yocto_5.8.bb  |   4 +-
> > >  .../libpng/libpng_1.6.37.bb                   |   2 +-
> > >  scripts/pybootchartgui/pybootchartgui/main.py | 184
> > > +++++++++++++++++-
> >
> > Cleanup is good but this last bit doesn't look quite right!
>
> I 100% agree, but it is from the the command I mentioned in the commit
> message.  In fact, I ran it again just to be sure it wasn't an
> accident.  I have no idea why that file is being so heavily modified
> perhaps the sed regex is having some unforeseen side effect.  I'll
> remove it by hand from the commit and push a v3.
>
> Thanks,
> Jon
>
> >
> > Cheers,
> >
> > Richard
> >
>
> 
>
>

--000000000000512b9605b0562e13
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">The last one is a symlink and sed -i doesn&#39;t follow sy=
mlinks as you haven&#39;t used=C2=A0--follow-symlinks.</div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 28, 202=
0 at 3:48 AM Jon Mason &lt;<a href=3D"mailto:jdmason@kudzu.us">jdmason@kudz=
u.us</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Fri, Sep 25, 2020 at 5:29 PM Richard Purdie<br>
&lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank=
">richard.purdie@linuxfoundation.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Fri, 2020-09-25 at 15:28 -0400, Jon Mason wrote:<br>
&gt; &gt; Multiple files have &quot; ,&quot; instead of &quot;, &quot; in =
expressions.=C2=A0 This<br>
&gt; &gt; changes<br>
&gt; &gt; them to conform to the way the rest of them are done.<br>
&gt; &gt;<br>
&gt; &gt; Found and corrected via:<br>
&gt; &gt; git ls-files | xargs sed -i &#39;s/ ,d/, d/g&#39;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jon Mason &lt;<a href=3D"mailto:jon.mason@arm.com=
" target=3D"_blank">jon.mason@arm.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/classes/linuxloader.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/classes/rootfs_rpm.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/arm/arch-arm64.inc=C2=A0 |=C2=A0=
 10 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/arm/arch-armv4.inc=C2=A0 |=C2=A0=
 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/arm/arch-armv5.inc=C2=A0 |=C2=A0=
 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/arm/arch-armv6.inc=C2=A0 |=C2=A0=
 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/arm/arch-armv6m.inc |=C2=A0 =C2=
=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/arm/arch-armv7a.inc |=C2=A0 =C2=
=A02 +-<br>
&gt; &gt;=C2=A0 .../conf/machine/include/arm/arch-armv7ve.inc |=C2=A0 =C2=
=A02 +-<br>
&gt; &gt;=C2=A0 .../machine/include/arm/arch-armv8-2a.inc=C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/arm/arch-armv8a.inc |=C2=A0 =C2=
=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/mips/arch-mips.inc=C2=A0 |=C2=A0=
 16 +-<br>
&gt; &gt;=C2=A0 .../conf/machine/include/tune-arm1136jf-s.inc |=C2=A0 =C2=
=A02 +-<br>
&gt; &gt;=C2=A0 .../conf/machine/include/tune-arm1176jz-s.inc |=C2=A0 =C2=
=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/tune-arm920t.inc=C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/tune-arm926ejs.inc=C2=A0 |=C2=A0=
 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/tune-arm9tdmi.inc=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/tune-cortexa15.inc=C2=A0 |=C2=A0=
 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/tune-cortexa17.inc=C2=A0 |=C2=A0=
 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/tune-cortexa5.inc=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 .../include/tune-cortexa57-cortexa53.inc=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/tune-cortexa7.inc=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 .../include/tune-cortexa72-cortexa53.inc=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 .../include/tune-cortexa73-cortexa53.inc=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/tune-cortexa8.inc=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/tune-cortexa9.inc=C2=A0 =C2=A0|=
=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/tune-ep9312.inc=C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/tune-iwmmxt.inc=C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 .../machine/include/tune-strongarm1100.inc=C2=A0 =C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/tune-xscale.inc=C2=A0 =C2=A0 =C2=
=
=A0|=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/conf/machine/include/x86/arch-x86.inc=C2=A0 =C2=A0 |=
=C2=A0 12 +-<br>
&gt; &gt;=C2=A0 .../recipes-core/images/<a href=3D"http://core-image-minim=
al.bb" rel=3D"noreferrer" target=3D"_blank">core-image-minimal.bb</a> |=C2=
=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 .../qemu/<a href=3D"http://qemu-system-native_5.1.0.bb" re=
l=3D"noreferrer" target=3D"_blank">qemu-system-native_5.1.0.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/qemu/<a href=3D"http://qemu_5.1.0.bb=
" rel=3D"noreferrer" target=3D"_blank">qemu_5.1.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 =C2=A04 +-<br>
&gt; &gt;=C2=A0 .../vulkan/<a href=3D"http://vulkan-demos_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">vulkan-demos_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-de=
v.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-dev.bb</a>=C2=A0 |=
=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-rt_5.4.bb" rel=3D"=
noreferrer" target=3D"_blank">linux-yocto-rt_5.4.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 .../linux/<a href=3D"http://linux-yocto-rt_5.8.bb" rel=3D"=
noreferrer" target=3D"_blank">linux-yocto-rt_5.8.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.=
4.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.4.bb</a>=C2=A0 |=
=C2=A0 =C2=A04 +-<br>
&gt; &gt;=C2=A0 meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_5.=
8.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto_5.8.bb</a>=C2=A0 |=
=C2=A0 =C2=A04 +-<br>
&gt; &gt;=C2=A0 .../libpng/<a href=3D"http://libpng_1.6.37.bb" rel=3D"nore=
ferrer" target=3D"_blank">libpng_1.6.37.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt; &gt;=C2=A0 scripts/pybootchartgui/pybootchartgui/main.py | 184<br>
&gt; &gt; +++++++++++++++++-<br>
&gt;<br>
&gt; Cleanup is good but this last bit doesn&#39;t look quite right!<br>
<br>
I 100% agree, but it is from the the command I mentioned in the commit<br>
message.=C2=A0 In fact, I ran it again just to be sure it wasn&#39;t an<br=
>
accident.=C2=A0 I have no idea why that file is being so heavily modified<=
br>
perhaps the sed regex is having some unforeseen side effect.=C2=A0 I&#39;l=
l<br>
remove it by hand from the commit and push a v3.<br>
<br>
Thanks,<br>
Jon<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; Richard<br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000512b9605b0562e13--
