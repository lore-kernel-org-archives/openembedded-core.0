Return-Path: <armccurdy@gmail.com>
Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com
	[209.85.217.67])
	by mail.openembedded.org (Postfix) with ESMTP id 38C0F60B01
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 18:48:05 +0000 (UTC)
Received: by mail-vs1-f67.google.com with SMTP id g15so266056vsf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 10:48:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ixKL3fAUyyrhURHGfwljOoEnneyfhckaCYSOLVOfiZw=;
	b=Bumb+/pJ7lQ3bhWlVzVGWKMaZ78HgQP9DgkRgSi79KbTiFLYngcBp3X0UpKhaVKHcP
	N8eak1tZIJK5dUuKO80rqRt3MX7xs1l0P359mPsKs/7538tALega2vNDvWSesyZsW26+
	qxnPB4iyhpGk8izo+Dz6EOwJFNADblLZ1PqwWmi8IboNdYzw5OpvvH5LIdCRuEuVWcRv
	xxMH5goZkFVRMfncwK/stP3JwJO2NkzRlNOaMX8ELXy6E0JVCYPDspXQkiqgO8Q0TKCu
	TZwiLw80XrJIyMEA+3GI5AE00gA2xY0lFfVUYc0igJrxavorQYDxfzm6Vnd1Baw6swUD
	wlpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ixKL3fAUyyrhURHGfwljOoEnneyfhckaCYSOLVOfiZw=;
	b=CQIyZ/FA3j84x7BZQQ5+BbDKTJiKagPzL1CPFNsX3puGrdhzELotuj6QAaaRq0I3PG
	2D9hpHuAaALnBGB+pP/oMky/lq2zoLZy0qaK8fmaO4i40cOe2pxTEctfYsN3KCuKhtYV
	vTi6y6j4RN3Rn7lYJxI67h3IsWWAH2Zo8zzizmHfZNQRHMULr1Y2+yjroG3Wci5CUGXN
	suArVfyWqOifRZUzW7X91fzgI1Vxi0JX8S+Goaq9mZb+eQkaojHys7IhOyFhBvdg3Mhh
	oWcO1CHIQqo9KAFSfwkeocBWDLXICJHpdB1/xSE9BqIDyXRVbGvz6AOdqxn3zooDUJrk
	zCbQ==
X-Gm-Message-State: APjAAAVGHI4Kc6whNHPHy6SpRozcK9KjI7dY6gqsa9HAPgr5lkaC2Vz0
	KQRVmhLXQNGaJ5+yUIS5icdV7WtxkSi0tSyPsyo=
X-Google-Smtp-Source: APXvYqwhJQ/GtEr3am2UVkXRrXayR69BXDjo5iyv/Xkk99Ce32+iTwuDzusqCJcYTxZze7wY24Zhj+kN3fzViXZva4o=
X-Received: by 2002:a67:ee4e:: with SMTP id g14mr349777vsp.223.1581101285914; 
	Fri, 07 Feb 2020 10:48:05 -0800 (PST)
MIME-Version: 1.0
References: <20200205054120.1461132-1-raj.khem@gmail.com>
	<20200205054120.1461132-2-raj.khem@gmail.com>
	<396189a7541b8b73d5bfff4949d9873ab5079fd2.camel@linuxfoundation.org>
	<CAJ86T=U-i3H09en6j0k5jfs+_cFakRyKPMsTpr-ieHNAgOmPzg@mail.gmail.com>
	<CAMKF1so_g-48z24jqbWmmeRLZNMjRpqnzMZF40kJXMae98Zpsg@mail.gmail.com>
In-Reply-To: <CAMKF1so_g-48z24jqbWmmeRLZNMjRpqnzMZF40kJXMae98Zpsg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 7 Feb 2020 10:47:54 -0800
Message-ID: <CAJ86T=U_t9qfz_ZyRMM2ZUNoF0e2M=Uu=0APkdTjQ9xj4AMEPw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
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
X-List-Received-Date: Fri, 07 Feb 2020 18:48:05 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 10:28 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Feb 7, 2020 at 10:18 AM Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Fri, Feb 7, 2020 at 10:09 AM Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > On Tue, 2020-02-04 at 21:41 -0800, Khem Raj wrote:
> > > > since the versions of autotools might differ in OE especially
> > > > so recreate config.h.in, aclocal.m4, configure, and Makefile.in
> > > >
> > > > [YOCTO #13779]
> > > >
> > > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > > ---
> > > >  meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
> > > >  meta/lib/oeqa/sdk/cases/buildcpio.py     | 1 +
> > > >  meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
> > > >  3 files changed, 3 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py
> > > > b/meta/lib/oeqa/runtime/cases/buildcpio.py
> > > > index 4bd72dd37e..9cc261c314 100644
> > > > --- a/meta/lib/oeqa/runtime/cases/buildcpio.py
> > > > +++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
> > > > @@ -27,6 +27,6 @@ class BuildCpioTest(OERuntimeTestCase):
> > > >      @OEHasPackage(['autoconf'])
> > > >      def test_cpio(self):
> > > >          self.project.download_archive()
> > > > -        self.project.run_configure()
> > > > +        self.project.run_configure('','autoreconf --force;')
> > > >          self.project.run_make()
> > > >          self.project.run_install()
> > > > diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py
> > > > b/meta/lib/oeqa/sdk/cases/buildcpio.py
> > > > index b0beafb38f..ec10149d34 100644
> > > > --- a/meta/lib/oeqa/sdk/cases/buildcpio.py
> > > > +++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
> > > > @@ -28,6 +28,7 @@ class BuildCpioTest(OESDKTestCase):
> > > >              self.assertTrue(os.path.isdir(dirs["source"]))
> > > >              os.makedirs(dirs["build"])
> > > >
> > > > +            self._run("cd {source} && autoreconf --force")
> > > >              self._run("cd {build} && {source}/configure
> > > > $CONFIGURE_FLAGS".format(**dirs))
> > > >              self._run("cd {build} && make -j".format(**dirs))
> > > >              self._run("cd {build} && make install
> > > > DESTDIR={install}".format(**dirs))
> > > > diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py
> > > > b/meta/lib/oeqa/selftest/cases/meta_ide.py
> > > > index 809142559a..46398c7e2d 100644
> > > > --- a/meta/lib/oeqa/selftest/cases/meta_ide.py
> > > > +++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
> > > > @@ -43,7 +43,7 @@ class MetaIDE(OESelftestTestCase):
> > > >                          "
> > > > https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
> > > >                          self.tmpdir_metaideQA, self.td['DATETIME'],
> > > > dl_dir=dl_dir)
> > > >          self.project.download_archive()
> > > > -        self.assertEqual(self.project.run_configure(), 0,
> > > > +        self.assertEqual(self.project.run_configure('','autoreconf
> > > > --force;'), 0,
> > > >                          msg="Running configure failed")
> > > >          self.assertEqual(self.project.run_make(), 0,
> > > >                          msg="Running make failed")
> > > > --
> > > > 2.25.0
> > >
> > > This breaks the SDK everywhere:
> > >
> > > https://autobuilder.yoctoproject.org/typhoon/#/builders/47/builds/1552/steps/8/logs/step2c
> > >
> > > (and many more)
> >
> > Configuring with --disable-maintainer-mode might be a better fix for
> > the original problem?
> >
>
> yes, or just touch configure, which I have sent as v2

If only it was that easy! :-)

