Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com
	[209.85.160.195])
	by mail.openembedded.org (Postfix) with ESMTP id 13ADC60E45
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 18:28:48 +0000 (UTC)
Received: by mail-qt1-f195.google.com with SMTP id w8so72376qts.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 10:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=3qAMqC5NW48KlUWcZ/thIw5UBYSrRapUqc2ZqvvT4aM=;
	b=FV0rmAJXdQ1K2A7wucOTu0fKx1A6jvckeGyX7e4h3pVdgyktEGeMq9FySJKEidmStG
	Tj/J56Ji4YaTf7rMoXceeDG4J/CKA/G9tFWIYsvgbhz/wi5IGFhu4A9LvR4kjki2XHM9
	T6fzdQk+zF4Yjiv9cxjav6co0Vpe5a2OlKT/XedxPIpIDBqcOVMetZdgfcpRJBM8M5t8
	JyDUJViNBZ7xkPgmxpr9ELSakiU/jzkpMaWk6nrRY9sG3otLmq0i+0LSfFHCZofGJEIf
	IpiFTtZ4xmZKAwR/sTC4CfSNpivAtxzwGEu7bQXtW1MQcqe6DEEIlYB6VEVfU6Ib6Xz2
	yFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=3qAMqC5NW48KlUWcZ/thIw5UBYSrRapUqc2ZqvvT4aM=;
	b=p2V8RFADXh2+TWstALurTsKmw7UjCuDNchHGKckcXY2JivMrQIqZVIp/te9t28Y3/A
	elFA225uRCgqzBvOgrct4oboitNXATEtFZO5bs0GdqMW0uXHH8OrqC49+pt/iZL+hhjA
	JnBXerYgobvmYxSBW/NtP1IdYUZPGhhKWenzY4em3+7/TltB6ryoxVRTqBt9DwjwItQb
	Ha7+KXwOC24VmAGS2y3d/l0bUzTFP+YMJyY0j1N8ztPpNa7LDlwAE1fAXWa7S72QCsz6
	pKGOwM5YIgqtkq8kpowSjdarswE7tmoNODHyzbVaigCu9GQM/kBbpdb7wwbyp9opRUve
	hoSA==
X-Gm-Message-State: APjAAAUfjLQFPlygca/PSH3BjX/bW/XANR4o6s80t7MSNGBi6MRLx3sO
	axJV0Ihsrjnu/d5lbLQvsKIOTmU1Qseh/6ZhlQE=
X-Google-Smtp-Source: APXvYqyRIEldl7k3/pvs1TxUZoseRvMs4idf+O6j82FNrMvc98UgoMKuCwddXjElwIJXNCkv+Fwtoaj6elhJiqgSBA0=
X-Received: by 2002:ac8:4419:: with SMTP id j25mr133608qtn.378.1581100128827; 
	Fri, 07 Feb 2020 10:28:48 -0800 (PST)
MIME-Version: 1.0
References: <20200205054120.1461132-1-raj.khem@gmail.com>
	<20200205054120.1461132-2-raj.khem@gmail.com>
	<396189a7541b8b73d5bfff4949d9873ab5079fd2.camel@linuxfoundation.org>
	<CAJ86T=U-i3H09en6j0k5jfs+_cFakRyKPMsTpr-ieHNAgOmPzg@mail.gmail.com>
In-Reply-To: <CAJ86T=U-i3H09en6j0k5jfs+_cFakRyKPMsTpr-ieHNAgOmPzg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Feb 2020 10:28:22 -0800
Message-ID: <CAMKF1so_g-48z24jqbWmmeRLZNMjRpqnzMZF40kJXMae98Zpsg@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Fri, 07 Feb 2020 18:28:49 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 10:18 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Fri, Feb 7, 2020 at 10:09 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Tue, 2020-02-04 at 21:41 -0800, Khem Raj wrote:
> > > since the versions of autotools might differ in OE especially
> > > so recreate config.h.in, aclocal.m4, configure, and Makefile.in
> > >
> > > [YOCTO #13779]
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
> > >  meta/lib/oeqa/sdk/cases/buildcpio.py     | 1 +
> > >  meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
> > >  3 files changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py
> > > b/meta/lib/oeqa/runtime/cases/buildcpio.py
> > > index 4bd72dd37e..9cc261c314 100644
> > > --- a/meta/lib/oeqa/runtime/cases/buildcpio.py
> > > +++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
> > > @@ -27,6 +27,6 @@ class BuildCpioTest(OERuntimeTestCase):
> > >      @OEHasPackage(['autoconf'])
> > >      def test_cpio(self):
> > >          self.project.download_archive()
> > > -        self.project.run_configure()
> > > +        self.project.run_configure('','autoreconf --force;')
> > >          self.project.run_make()
> > >          self.project.run_install()
> > > diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py
> > > b/meta/lib/oeqa/sdk/cases/buildcpio.py
> > > index b0beafb38f..ec10149d34 100644
> > > --- a/meta/lib/oeqa/sdk/cases/buildcpio.py
> > > +++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
> > > @@ -28,6 +28,7 @@ class BuildCpioTest(OESDKTestCase):
> > >              self.assertTrue(os.path.isdir(dirs["source"]))
> > >              os.makedirs(dirs["build"])
> > >
> > > +            self._run("cd {source} && autoreconf --force")
> > >              self._run("cd {build} && {source}/configure
> > > $CONFIGURE_FLAGS".format(**dirs))
> > >              self._run("cd {build} && make -j".format(**dirs))
> > >              self._run("cd {build} && make install
> > > DESTDIR={install}".format(**dirs))
> > > diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py
> > > b/meta/lib/oeqa/selftest/cases/meta_ide.py
> > > index 809142559a..46398c7e2d 100644
> > > --- a/meta/lib/oeqa/selftest/cases/meta_ide.py
> > > +++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
> > > @@ -43,7 +43,7 @@ class MetaIDE(OESelftestTestCase):
> > >                          "
> > > https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
> > >                          self.tmpdir_metaideQA, self.td['DATETIME'],
> > > dl_dir=dl_dir)
> > >          self.project.download_archive()
> > > -        self.assertEqual(self.project.run_configure(), 0,
> > > +        self.assertEqual(self.project.run_configure('','autoreconf
> > > --force;'), 0,
> > >                          msg="Running configure failed")
> > >          self.assertEqual(self.project.run_make(), 0,
> > >                          msg="Running make failed")
> > > --
> > > 2.25.0
> >
> > This breaks the SDK everywhere:
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1552/steps/8/logs/step2c
> >
> > (and many more)
>
> Configuring with --disable-maintainer-mode might be a better fix for
> the original problem?
>

yes, or just touch configure, which I have sent as v2, but I am still
miffed with why its happening on mips64 box alone.

>   https://www.gnu.org/software/automake/manual/html_node/maintainer_002dmode.html

