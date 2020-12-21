Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.39132.1608555796048815150
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Dec 2020 05:03:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=W67eiofa;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: andrey.z@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id l11so23538091lfg.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Dec 2020 05:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/crkc5LMXcDcGglYPvqCbBEVRuUYEYW+4uNvo81DXbA=;
        b=W67eiofaGLd/MRFDHIrY6OEUz3lThKX9Nc//f899NE7lqS2I59uEIe4edfutSEzgLh
         HijC/Xxyu+e6NMSLz4H8hcMd9hBjggXrWp5nbNcFIONsG7wRt2t4DZ6MQB4A1oFqpIb5
         Lqfx/PxAOaRvCuQXNRFs4V3Yn2pjXHV8bCOl0w1B4TL29LhICp5HKqQ1qlIAt7vz92lH
         6WJDIx87Cu9GMwDhmdhciXeCop9wAqCeYa+4uBd3pqn8LI/fGpJCfAQJ2yH+Lg1vVC0r
         JS3I/1JC0MiUKio5HCv+PwkWfI4u5sOyVKEHIxTt6ADEsZSyTMxPSQ31yu461FL9vsoK
         lX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/crkc5LMXcDcGglYPvqCbBEVRuUYEYW+4uNvo81DXbA=;
        b=sv64Z9Vr+IXoXe6WRtZ1tWiWHrKuKH3tX1v4wPtAL0uBeFRqAAXVaTBPxe0xOBBJfD
         L86GBhqsO7BSx/HrOK7ycZBVjYjrdY8T+xOYELVT3ZYRLst3zpx9Z8Cs/kvbbdZKk5gb
         WpsCHYzzgNVf3t75tS+ZVjwC7bbStnAEXcaEEWkEOl959jHhbqWvCp78JhKOn1NpTmaA
         ivxzue98lUjcJOJZesECqhkffILVyOS1rkL7eRJ6PoyGJMNOhd5QShXuejL2NP+ouE6V
         o4OwNL4e/NidEyqtGJMjqg+9yGt2IAOwlndT8YmtcB7FP3ByVV5rnHrdSprYp7UTI2Bj
         +bqA==
X-Gm-Message-State: AOAM533lyBCQUmqt5q6ap3kNTglgqNou1XJuwQzRdznFGOrkD1YdkFSI
	BT4yu884joTiAm/iz8c2DgRonCpoYfBh89VHCxk=
X-Google-Smtp-Source: ABdhPJyzby07KaxodxVpY+izOaeRQZlzaIYO4skMYQAIw/SEu4zqJG1IcaiK1CoPiklidcuZN/ii4TOo2zDLeJOMKmU=
X-Received: by 2002:a2e:9ed5:: with SMTP id h21mr7031372ljk.125.1608555793944;
 Mon, 21 Dec 2020 05:03:13 -0800 (PST)
MIME-Version: 1.0
References: <20201217192738.14311-1-tanuk@iki.fi> <CAMKF1soQmWKFmpaEkcE7E_as0iKDS01e8mwTiGLKYSSQ3_x5bQ@mail.gmail.com>
 <CAMKF1spAAi=rDLYNHQWk3XpsyCv9=qDxJgG0d7nwrpaxSYM6gQ@mail.gmail.com>
 <d09a75fc25bc9d36c6f9227cc94f4e58d7f985fd.camel@iki.fi> <CAMKF1soBt5ifPhNj0h_DE+NY7jVTz4C3Ch13A=xEY-KZ=s4XtA@mail.gmail.com>
In-Reply-To: <CAMKF1soBt5ifPhNj0h_DE+NY7jVTz4C3Ch13A=xEY-KZ=s4XtA@mail.gmail.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Mon, 21 Dec 2020 14:03:02 +0100
Message-ID: <CAHtQpK4hjWnuVj+b=_joyf5pG=DsbA4UL6QMpj1o-0=D1iYpEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/4] pulseaudio: Autotools to Meson
To: Khem Raj <raj.khem@gmail.com>
Cc: Tanu Kaskinen <tanuk@iki.fi>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Tanu,

On Sun, Dec 20, 2020 at 5:09 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sun, Dec 20, 2020 at 6:26 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> >
> > On Sat, 2020-12-19 at 12:36 -0800, Khem Raj wrote:
> > > On Sat, Dec 19, 2020 at 9:24 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > > On Thu, Dec 17, 2020 at 11:28 AM Tanu Kaskinen <tanuk@iki.fi> wrote:
> > > > > The PulseAudio project plans to drop Autotools support in 15.0, so let's
> > > > > switch to Meson. The first patch removes OE_LT_RPATH_ALLOW, which is
> > > > > some old cruft that sounds like it has something to do Libtool, so it's
> > > > > perhaps relevant for the goal of dropping Autotools. The next two
> > > > > patches disable features that aren't available with Meson. The last
> > > > > patch does the build system switch.
> > > > >
> > > > > Tanu Kaskinen (4):
> > > > >   pulseaudio: Remove OE_LT_RPATH_ALLOW
> > > > >   pulseaudio: disable EsounD support
> > > > >   pulseaudio: disable GConf support
> > > > >   pulseaudio: switch build system from Autotools to Meson

I'm seeing a build failure after this upgrade, thought you might
advise here what could be wrong.

Following is produced at the end of do_compile taks:

| sed: can't read src/client.conf: No such file or directory
| WARNING: exit code 2 from a shell command.
|
ERROR: Task (/development/yocto-master/yocto-build-appliance/meta/recipes-multimedia/pulseaudio/pulseaudio_14.0.bb:do_compile)
failed with exit code '1'

Have you experienced the same error, and what can be missing here?

> > > >
> > > > I am seeing build failures with this patch series while using clang
> > > > for compiler see.
> > > >
> > > > https://errors.yoctoproject.org/Errors/Details/539474/
> > > >
> > >
> > > It turns out that new meson checks are a bit different and if
> > > -Qunused-arguments is used with clang then the test for neon passes
> > > because its a simple compile time check in meson, So a workaround that
> > > I have done is to remove using -Qunused-arguments on clang
> > > cmdline and then it works ok.
> >
> > Ok, so the Neon check in Meson is somehow too lax if it passes with
> > -Qunused-arguments. Thanks for the initial debugging! I can look into
> > the issue, but I can't promise to do it quickly. I see these patches
> > are in master already - should the last patch be reverted for now? Or
> > can your workaround be applied to master (or meta-clang, if that's
> > where clang workarounds belong)?
> >
>
> I think its ok, I have added the relevant workaround in meta-clang for
> now. there was another
> issue I ran into non x86 builds with clang, which I have sent a patch
> for. Please review it and see
> if its worth upstreaming into PA and help it upstream if you can.
>
> > --
> > Tanu
> >
>
> 
>


-- 
Regards,
Andrey.
