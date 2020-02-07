Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id CDB1E606D0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 18:26:56 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id j5so77813qtq.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 10:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lQbgq8UmIyF+1C/NnV5wEveoCoZucfePE5XFp7GCNR4=;
	b=tT/00AViHDJilBs+0Nn8zGwqcfDnJxD71RL6AW3/owtAQPtYLQVJMB4FAgjReijtc0
	NeAsOpPq6JKdthJIUBB+6VOA/avWOdh1XN7ofY+EB+y585ig9MgWdcw9x60VNq2+fz0s
	Xuk1UO6Jt6zXa/KqRwOVXDO45VOjmdi7/LAGJKXB6C+OUBxzuUQ1bHFwz6YhE4W8k4Gf
	9+x8IOa1ioyscsHH4oDgWVtkoWjF8YfygSxHK9tZmoME6QFY8pvdvLbZ1JVKOT7/DCtR
	O8XJfOPqlGFTXAeVyBRzbOjxG/jusH48goYEi60V/B2Rx0sK35Bqnsl7sg4If6ClyebB
	9Daw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lQbgq8UmIyF+1C/NnV5wEveoCoZucfePE5XFp7GCNR4=;
	b=ekUX+XXGWhnBxSVSYblgHRA1tDbxwHHMW7sX9mHfhuPIEgGGxel2ufedQJCrkNWv9H
	Dv8CIKSY+AWh/Lm5WMSnAMyvH2D2lVBoLJNB4Dnuzh7H23jFNPZydcaia3K8KzM9nlMp
	Hhs01cbx3AsDd/jEPPNnYP6y0KV7gyPPjvyjgayVt5z9vfyyy7QGly1cbWcm7rbh0nyn
	hIGK1+1u2Hjkr3IG0YqJFHhoZhdV3ZthzOfyM2iTGhG0wZYj44mdJ41fX6K2VAYAIco+
	sa6zQKCD6Ro57JoZbAcJIbRuN8owb7uMNTCPfQy/af5t1RGFrNd2aPuK+3ppkAOMBcGw
	hIUw==
X-Gm-Message-State: APjAAAWsD6eJ5B2Xd0Q56G/I6G0jzytEqwnH5H0KeyuVe6eCOd5g3pz7
	oXG99Hseb5RKa7iX5zV0CNEfIb5aPuR2aOS0+no=
X-Google-Smtp-Source: APXvYqx29/yR3Fw3WTsqHZJW/0tZODWopaMH16sjTcAW/ofRxzTunTAmAIIxonGf9ngkAgXoCR7UB6V/VYOTErnZSFY=
X-Received: by 2002:ac8:544f:: with SMTP id d15mr120793qtq.53.1581100017524;
	Fri, 07 Feb 2020 10:26:57 -0800 (PST)
MIME-Version: 1.0
References: <20200205054120.1461132-1-raj.khem@gmail.com>
	<20200205054120.1461132-2-raj.khem@gmail.com>
	<396189a7541b8b73d5bfff4949d9873ab5079fd2.camel@linuxfoundation.org>
In-Reply-To: <396189a7541b8b73d5bfff4949d9873ab5079fd2.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Feb 2020 10:26:31 -0800
Message-ID: <CAMKF1soEmdnNMLwgK8nyMy=Bab58EeUBAVQXpDDWzDihL4o9qA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] oeqa: autoreconf cpio before building
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
X-List-Received-Date: Fri, 07 Feb 2020 18:26:57 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 10:09 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2020-02-04 at 21:41 -0800, Khem Raj wrote:
> > since the versions of autotools might differ in OE especially
> > so recreate config.h.in, aclocal.m4, configure, and Makefile.in
> >
> > [YOCTO #13779]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
> >  meta/lib/oeqa/sdk/cases/buildcpio.py     | 1 +
> >  meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
> >  3 files changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py
> > b/meta/lib/oeqa/runtime/cases/buildcpio.py
> > index 4bd72dd37e..9cc261c314 100644
> > --- a/meta/lib/oeqa/runtime/cases/buildcpio.py
> > +++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
> > @@ -27,6 +27,6 @@ class BuildCpioTest(OERuntimeTestCase):
> >      @OEHasPackage(['autoconf'])
> >      def test_cpio(self):
> >          self.project.download_archive()
> > -        self.project.run_configure()
> > +        self.project.run_configure('','autoreconf --force;')
> >          self.project.run_make()
> >          self.project.run_install()
> > diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py
> > b/meta/lib/oeqa/sdk/cases/buildcpio.py
> > index b0beafb38f..ec10149d34 100644
> > --- a/meta/lib/oeqa/sdk/cases/buildcpio.py
> > +++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
> > @@ -28,6 +28,7 @@ class BuildCpioTest(OESDKTestCase):
> >              self.assertTrue(os.path.isdir(dirs["source"]))
> >              os.makedirs(dirs["build"])
> >
> > +            self._run("cd {source} && autoreconf --force")
> >              self._run("cd {build} && {source}/configure
> > $CONFIGURE_FLAGS".format(**dirs))
> >              self._run("cd {build} && make -j".format(**dirs))
> >              self._run("cd {build} && make install
> > DESTDIR={install}".format(**dirs))
> > diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py
> > b/meta/lib/oeqa/selftest/cases/meta_ide.py
> > index 809142559a..46398c7e2d 100644
> > --- a/meta/lib/oeqa/selftest/cases/meta_ide.py
> > +++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
> > @@ -43,7 +43,7 @@ class MetaIDE(OESelftestTestCase):
> >                          "
> > https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
> >                          self.tmpdir_metaideQA, self.td['DATETIME'],
> > dl_dir=dl_dir)
> >          self.project.download_archive()
> > -        self.assertEqual(self.project.run_configure(), 0,
> > +        self.assertEqual(self.project.run_configure('','autoreconf
> > --force;'), 0,
> >                          msg="Running configure failed")
> >          self.assertEqual(self.project.run_make(), 0,
> >                          msg="Running make failed")
> > --
> > 2.25.0
>
> This breaks the SDK everywhere:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1552/steps/8/logs/step2c
>
> (and many more)
>

yes obvious oversight, I have sent a v2, anyway this patch was not fixing
original problem too.

> Cheers,
>
> Richard
>
>

