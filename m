Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.2026.1588879105333003721
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 May 2020 12:18:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tEyyonNL;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id g16so6528619eds.1
        for <openembedded-core@lists.openembedded.org>; Thu, 07 May 2020 12:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kVO1jpN1XmApfKPh2mEp5/NGgquM2XIB8JGNnJZJWhE=;
        b=tEyyonNLHsGJiuibrcunifhPNV1xK4HY02AG6UcqwIgP3hVwFQn/GDu8D5cyXXds+U
         wbN8kr1E1mcths6jY0nhSJMoUyjRbxMiOm9Cx2axwmkIoWLIXYNJWanXmPOL/iknVPol
         AtBbtiwdoDfZGlbOLrUMEdYiqob9rruqmreY3SB8AYJGObEnYlcncxDvAIxH39+ZnUHu
         1M7ggBiM90L5OeIH/vC47/AfPlihcAqFFIvApOcX60ry2vlpM64w19bQp+i+Yt3ZbhmW
         oDh67dWnrVZIFAQaVOTTaafz98nvLwUeEkxLW6RyEsYLOL1jaWwq2b9GsC3eHIgPrxPX
         GuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kVO1jpN1XmApfKPh2mEp5/NGgquM2XIB8JGNnJZJWhE=;
        b=XxZgy3feCHqeA+ELrCczTJ+bYOKZxfWwVvcwbBpnRgRp08mhjj1qWE/hP94bG3AhOQ
         sEkJq/s4PstmAiGPv3GihFi+PQ1180A9F6zJK+KMMA2INK+agj7/LwtD0yyx05/T8yYw
         /Nn/gnguoOiYnOVS9O8SZXsRyPTj3fJK9OUn+/Ha+p7GQHuFmCIXIrUjRXIQ1S+8r530
         ZBOCOCttvZImqcCRya+WP60ZkzQpxg/mmMEGVIVr81cFfHIeN1TaRhBrQ9MvhH+kzfQ7
         5SYT0dFPDvaXKNLvMm9yauOFNE10aaUncUgMjMN30XRbw5aswZ0W3FNA6JwfGr2yvRt0
         HzKA==
X-Gm-Message-State: AGi0PuZdI8bGRuGS26VdxyYnonYYwULbzpYz+43SQ3IKa3w86V9ynW/J
	abFSK9TOmnEQ3vfxigKY0WyIFMwZYBeVYD/1SEc=
X-Google-Smtp-Source: APiQypLJsiGy8QzwOFmpJjtzS8FHrqa+nAGCPFmVp2OkI4SmOz0F4SRnaWFXGxLibIMB6e69GoP94FDqsM+064EB5Y8=
X-Received: by 2002:a05:6402:558:: with SMTP id i24mr12919820edx.347.1588879103637;
 Thu, 07 May 2020 12:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588520452.git.bruce.ashfield@gmail.com>
 <70c6d988d291d1e2953d4b57cc9e88c146785d14.camel@linuxfoundation.org>
 <160BD489BF65999D.29536@lists.openembedded.org> <CADkTA4PjNUb8BcP3oS9Ey8atrvuP1YAhJzfoUES0Ya8eunddng@mail.gmail.com>
 <ded31e364a1c6c5bcc5bd791b9bf49d9b8747b4b.camel@linuxfoundation.org>
 <CADkTA4NST80Bx=6KCBiaU5wxR6LxS3QXUN7SJ3g1cJcY6dnpmQ@mail.gmail.com> <CAGDS+nmRH8t8cYSrqd9nFcSLPxxBH8JTD-uYvzHRrDJcvKPuqw@mail.gmail.com>
In-Reply-To: <CAGDS+nmRH8t8cYSrqd9nFcSLPxxBH8JTD-uYvzHRrDJcvKPuqw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 7 May 2020 15:18:12 -0400
Message-ID: <CADkTA4OTX_rE0PoEzWZW6Paie5inzWRUsYu0S3EEhTz-WsKe=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] linux-yocto: consolidated pull request
To: Steve Sakoman <sakoman@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 7, 2020 at 2:15 PM Steve Sakoman <sakoman@gmail.com> wrote:
>
> From the discussion to this point it seems that these patches aren't
> quite ready for dunfell.  Let me know if/when that changes, or if I'm
> mistaken in that assumption!

Richard merged 3 of the 4 kernel updates (up to v5.4.34), so they are
ok for dunfell.

There's just a reproducible issue that we have to look into more
(there's no runtime issues with any of them).

Bruce

>
> Steve
>
> On Mon, May 4, 2020 at 3:34 AM Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
> >
> > On Mon, May 4, 2020 at 9:24 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Mon, 2020-05-04 at 09:06 -0400, Bruce Ashfield wrote:
> > > > On Mon, May 4, 2020 at 8:56 AM Bruce Ashfield via
> > > > lists.openembedded.org
> > > > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > > > > On Mon, May 4, 2020 at 4:31 AM Richard Purdie
> > > > > <richard.purdie@linuxfoundation.org> wrote:
> > > > > > Hi Bruce,
> > > > > >
> > > > > > On Sun, 2020-05-03 at 11:44 -0400, bruce.ashfield@gmail.com wr=
ote:
> > > > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > > > >
> > > > > > > Hi all,
> > > > > > >
> > > > > > > Here are the -stable updates I've collected since m3 of dunf=
ell. I
> > > > > > > ran things through the autobuilder, and no new kernel issues=
 were
> > > > > > > picked up.
> > > > > > >
> > > > > > > The -dev bump is good for master, while all of the 5.4-stabl=
e bumps
> > > > > > > are good for both master and dunfell.
> > > > > >
> > > > > > I pulled these into master-next and saw reproducibility issues=
. I
> > > > > > wondered why your test build didn't show it, turns out it also=
 did:
> > > > > >
> > > > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/56/bui=
lds/1024
> > > > > >
> > > > > > 2020-05-04 05:18:46,863 - oe-selftest - INFO - =3D=3D=3D=3D=3D=
=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > > > 2020-05-04 05:18:46,863 - oe-selftest - INFO - FAIL: reproduci=
ble.ReproducibleTests.test_reproducible_builds (subunit.RemotedTestCase)
> > > > > > 2020-05-04 05:18:46,863 - oe-selftest - INFO - ---------------=
-------------------------------------------------------
> > > > > > 2020-05-04 05:18:46,864 - oe-selftest - INFO - testtools.testr=
esult.real._StringException:
> > > > > >
> > > > > > AssertionError: The following deb packages are missing or diff=
erent: /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-36044=
/reproducibleB/tmp/deploy/deb/./qemux86_64/kernel-module-kheaders-5.4.38-yo=
cto-standard_5.4.38+git0+f405543442_6cb5b11e83-r0_amd64.deb
> > > > > > The following ipk packages are missing or different: /home/pok=
ybuild/yocto-worker/oe-selftest-centos/build/build-st-36044/reproducibleB/t=
mp/deploy/ipk/./qemux86_64/kernel-module-kheaders-5.4.38-yocto-standard_5.4=
.38+git0+f405543442_6cb5b11e83-r0_qemux86_64.ipk
> > > > > >
> > > > >
> > > > > I don't see any changes in the kernels that would have triggered=
 it,
> > > > > but they never are obvious.
> > > >
> > > > I am working on some kernel reproducibility changes that were
> > > > discussed about three weeks ago.
> > > >
> > > > Is the default for reproducible builds in master-next different fr=
om
> > > > what it was before dunfell was releases ? If so, that might explai=
n
> > > > why I'm not seeing a change that would have triggered it (i.e. thi=
s is
> > > > unrelated to my -stable changes).
> > >
> > > There are no reproducibility changes between master-next and dunfell=
.
> >
> > interesting. I'll take a closer look at the changes again and see what
> > might pop up as a culprit.
> >
> > >
> > > > Like I was mentioning before, if there's a document or pastebin of
> > > > steps I can follow, I can run the tests against my pending changes=
 and
> > > > finish them for master. They of course would not necessarily be
> > > > suitable for dunfell.
> > >
> > > The good news is the autobuilder has some debugging built in for thi=
s
> > > kind of problem. You can see the diffoscope output here:
> > >
> > > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200504=
-vhr0o_t9/packages/diff-html/
> > >
> > > which tells us its kheaders.ko in .rodata by the looks of it. Some
> > > changes are cause, some are effect, e.g. the build ID is different a=
s
> > > the sections are different so that isn't the issue but an effect of =
it.
> > > It looks like diffoscope doesn't know how to decode the .rodata whic=
h
> > > could be compressed?
> > >
> > > The raw data is also there (the packages that differ), e.g.:
> > >
> > > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200504=
-vhr0o_t9/packages/reproducibleA/tmp/deploy/deb/qemux86_64/kernel-module-kh=
eaders-5.4.38-yocto-standard_5.4.38%2Bgit0%2Bf405543442_6cb5b11e83-r0_amd64=
.deb
> > >
> > > https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200504=
-vhr0o_t9/packages/reproducibleB/tmp/deploy/deb/qemux86_64/kernel-module-kh=
eaders-5.4.38-yocto-standard_5.4.38%2Bgit0%2Bf405543442_6cb5b11e83-r0_amd64=
.debe
> > >
> >
> > cool. That's definitely useful, I'll have a look.
> >
> > At the same time, I'll try and clean up the documented kernel
> > reproducible changes and trigger another run to see if they help.
> >
> > > which would allow you to look further at them by hand.
> > >
> > > You can manually run this test locally with:
> > >
> > > oe-selftest -r reproducible.ReproducibleTests.test_reproducible_buil=
ds
> > >
> > > but it will take a while to run as it has to run two builds and comp=
are
> > > them and only uses sstate for one of them. To make it faster since y=
ou
> > > know where the issue is, edit
> > > meta/lib/oeqa/selftest/cases/reproducible.py to change images (core-
> > > image-sato, core-image-minimal and friends to simply "virtual/kernel=
".
> >
> > I'll do that cut down of the tests and see if I can trigger it here ..
> > With those full builds, I'd be at about an 8 hour cycle to see the
> > results!
> >
> > Bruce
> >
> > >
> > > Cheers,
> > >
> > > Richard
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> > >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >=20



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
