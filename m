Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.web11.6209.1588599283567459404
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 May 2020 06:34:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ae7mvp2j;
 spf=pass (domain: gmail.com, ip: 209.85.218.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f67.google.com with SMTP id pg17so13890691ejb.9
        for <openembedded-core@lists.openembedded.org>; Mon, 04 May 2020 06:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r0UI1AYTriGh7ZPbRliAOHU63EUFA6aRW+6DkTwchM8=;
        b=Ae7mvp2jFiTr8y3SNjNt5fU0ZdTkN4wHKcxxezTvRU1J0RJPe6YWEg5cxsUpp1TytX
         fN5xSmgnqpZEMj2bWzTtrAlIxtbqFu2jcaX2nj7VazlmjYKROrlliO6cKpjIa/oVeVHR
         q+uj6EO+ct5lKbDfkLzypwhQjtHeYw9m0jDzK9mtwyBMe8L8dPOs7fryS1kt4Lg45a4b
         8bpcnXx2uSgO10Rt/3PJVfYhvTnkMxzyobgk6EhR4E0JCzVnH6RaqqIUOTH7e3T7ODYj
         Sq4Cqbf5N2YfnWXZvql2k4wV3j3ljG53NFw6aFHedcc2R+c734mjOjc5VOZy/E4OrbPR
         Tjnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r0UI1AYTriGh7ZPbRliAOHU63EUFA6aRW+6DkTwchM8=;
        b=JaSDmAiMoJuU0j8DuMnTX+SBYwUgnh5O86j/W9BdQkAPNGPxrZwq2jB4xtnh8yRbqd
         KLWducs+o56j5Fiiqi9hQ6c9nwrNDBnSnx5Z8w8EO6YsohZmo0GjpcFF9t3Os+8Zv4L8
         iD8a5z2UoHX9xmh++8wOwkfHex0AeKzTtBaO//Kw4qzc1G2SBKJZN0crR2HiLriteWca
         RnlCzaz8b2CWPBt32pOcPFm+N8AW3vlnoPV1DHQF50ZB1CG0IJGet54iuiC/nvLwu6it
         2s3CoN3OrpC0dqUcCJ/+zmC6+CK0278tsGP/y377aOjI7rzdNv+phx8nSEBDrsoE55pI
         vsew==
X-Gm-Message-State: AGi0PuYZgzl/XIUTfj425t27D+46hj691phycNwaqTj9cEEYm1spNDI2
	WBP1MgIHinI9ypurx/wbuZMXt1HIBjPL9OCvIhM=
X-Google-Smtp-Source: APiQypLbc8wnvEwtZXUdOA449SoSY7FMo/GocPkfiF1TYmeb6EuJZiSct521Ij8DHb7VtoVlXS8uJq3KtqBQISmNthg=
X-Received: by 2002:a17:906:add7:: with SMTP id lb23mr15636216ejb.6.1588599281710;
 Mon, 04 May 2020 06:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588520452.git.bruce.ashfield@gmail.com>
 <70c6d988d291d1e2953d4b57cc9e88c146785d14.camel@linuxfoundation.org>
 <160BD489BF65999D.29536@lists.openembedded.org> <CADkTA4PjNUb8BcP3oS9Ey8atrvuP1YAhJzfoUES0Ya8eunddng@mail.gmail.com>
 <ded31e364a1c6c5bcc5bd791b9bf49d9b8747b4b.camel@linuxfoundation.org>
In-Reply-To: <ded31e364a1c6c5bcc5bd791b9bf49d9b8747b4b.camel@linuxfoundation.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 4 May 2020 09:34:30 -0400
Message-ID: <CADkTA4NST80Bx=6KCBiaU5wxR6LxS3QXUN7SJ3g1cJcY6dnpmQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/5] linux-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, steve@sakoman.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 4, 2020 at 9:24 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Mon, 2020-05-04 at 09:06 -0400, Bruce Ashfield wrote:
> > On Mon, May 4, 2020 at 8:56 AM Bruce Ashfield via
> > lists.openembedded.org
> > <bruce.ashfield=3Dgmail.com@lists.openembedded.org> wrote:
> > > On Mon, May 4, 2020 at 4:31 AM Richard Purdie
> > > <richard.purdie@linuxfoundation.org> wrote:
> > > > Hi Bruce,
> > > >
> > > > On Sun, 2020-05-03 at 11:44 -0400, bruce.ashfield@gmail.com wrote:
> > > > > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > > > >
> > > > > Hi all,
> > > > >
> > > > > Here are the -stable updates I've collected since m3 of dunfell. =
I
> > > > > ran things through the autobuilder, and no new kernel issues were
> > > > > picked up.
> > > > >
> > > > > The -dev bump is good for master, while all of the 5.4-stable bum=
ps
> > > > > are good for both master and dunfell.
> > > >
> > > > I pulled these into master-next and saw reproducibility issues. I
> > > > wondered why your test build didn't show it, turns out it also did:
> > > >
> > > > https://autobuilder.yoctoproject.org/typhoon/#/builders/56/builds/1=
024
> > > >
> > > > 2020-05-04 05:18:46,863 - oe-selftest - INFO - =3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > > 2020-05-04 05:18:46,863 - oe-selftest - INFO - FAIL: reproducible.R=
eproducibleTests.test_reproducible_builds (subunit.RemotedTestCase)
> > > > 2020-05-04 05:18:46,863 - oe-selftest - INFO - --------------------=
--------------------------------------------------
> > > > 2020-05-04 05:18:46,864 - oe-selftest - INFO - testtools.testresult=
.real._StringException:
> > > >
> > > > AssertionError: The following deb packages are missing or different=
: /home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-36044/repr=
oducibleB/tmp/deploy/deb/./qemux86_64/kernel-module-kheaders-5.4.38-yocto-s=
tandard_5.4.38+git0+f405543442_6cb5b11e83-r0_amd64.deb
> > > > The following ipk packages are missing or different: /home/pokybuil=
d/yocto-worker/oe-selftest-centos/build/build-st-36044/reproducibleB/tmp/de=
ploy/ipk/./qemux86_64/kernel-module-kheaders-5.4.38-yocto-standard_5.4.38+g=
it0+f405543442_6cb5b11e83-r0_qemux86_64.ipk
> > > >
> > >
> > > I don't see any changes in the kernels that would have triggered it,
> > > but they never are obvious.
> >
> > I am working on some kernel reproducibility changes that were
> > discussed about three weeks ago.
> >
> > Is the default for reproducible builds in master-next different from
> > what it was before dunfell was releases ? If so, that might explain
> > why I'm not seeing a change that would have triggered it (i.e. this is
> > unrelated to my -stable changes).
>
> There are no reproducibility changes between master-next and dunfell.

interesting. I'll take a closer look at the changes again and see what
might pop up as a culprit.

>
> > Like I was mentioning before, if there's a document or pastebin of
> > steps I can follow, I can run the tests against my pending changes and
> > finish them for master. They of course would not necessarily be
> > suitable for dunfell.
>
> The good news is the autobuilder has some debugging built in for this
> kind of problem. You can see the diffoscope output here:
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200504-vhr0=
o_t9/packages/diff-html/
>
> which tells us its kheaders.ko in .rodata by the looks of it. Some
> changes are cause, some are effect, e.g. the build ID is different as
> the sections are different so that isn't the issue but an effect of it.
> It looks like diffoscope doesn't know how to decode the .rodata which
> could be compressed?
>
> The raw data is also there (the packages that differ), e.g.:
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200504-vhr0=
o_t9/packages/reproducibleA/tmp/deploy/deb/qemux86_64/kernel-module-kheader=
s-5.4.38-yocto-standard_5.4.38%2Bgit0%2Bf405543442_6cb5b11e83-r0_amd64.deb
>
> https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20200504-vhr0=
o_t9/packages/reproducibleB/tmp/deploy/deb/qemux86_64/kernel-module-kheader=
s-5.4.38-yocto-standard_5.4.38%2Bgit0%2Bf405543442_6cb5b11e83-r0_amd64.debe
>

cool. That's definitely useful, I'll have a look.

At the same time, I'll try and clean up the documented kernel
reproducible changes and trigger another run to see if they help.

> which would allow you to look further at them by hand.
>
> You can manually run this test locally with:
>
> oe-selftest -r reproducible.ReproducibleTests.test_reproducible_builds
>
> but it will take a while to run as it has to run two builds and compare
> them and only uses sstate for one of them. To make it faster since you
> know where the issue is, edit
> meta/lib/oeqa/selftest/cases/reproducible.py to change images (core-
> image-sato, core-image-minimal and friends to simply "virtual/kernel".

I'll do that cut down of the tests and see if I can trigger it here ..
With those full builds, I'd be at about an 8 hour cycle to see the
results!

Bruce

>
> Cheers,
>
> Richard
>
>
>
>
>
>
>
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
