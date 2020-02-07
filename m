Return-Path: <raj.khem@gmail.com>
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
	[209.85.219.52])
	by mail.openembedded.org (Postfix) with ESMTP id 4A46B60E45
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Feb 2020 19:01:46 +0000 (UTC)
Received: by mail-qv1-f52.google.com with SMTP id o18so124793qvf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Feb 2020 11:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iamcDTU0qTPoYRZ256Bhj4cnSHgJuvpmsILHd0b4lNk=;
	b=MLZV6YCOdMxlY59hhssSTaNe/5v6pc6x9tH8YpudKppZhfZ8iCc5ozZxh9JsANYP0c
	7vQHuNOGH6Nzec4mdvpCvBRKEMcCgMcOP/TwH6ZBzC2CLC3juagiq0sCSq/tIIUrDwL7
	Uouacy7+oB8cfStZh+LHtLZ5/ZEZL2Qks1wnQHHk8tJRuGKO/6Ew7jYgvVl+FqFfjQzt
	jC1Qd5TvkMt2ig0aFU9VqmLGShwwYfvxqFw9jSTBfE8S6qIdfGd0efoAzbwYeSE+0VJS
	H94ksg2qq1TyXSZTkiUjscNeTm391132Hsq/58RY5F9PbWX4Dp/0HnFG7jv4j363IfZv
	XtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iamcDTU0qTPoYRZ256Bhj4cnSHgJuvpmsILHd0b4lNk=;
	b=MIubCoGi7WY79dF3B0FF2bqxoYi2K0Ewa1rjjp9MfjXspWf1xzWlUbjmbBZBLyU5Nh
	wb8WLGwMXOXUYj79R52rG6rlX99CGgrp2VNUx63ujRX08OTSBQPkikP+sLDzPPIFrK7I
	9PHW1K7SI+SizNxn1+lMBpiT9N6oNraBGKW22nQtzprOSEv7D/sNaWlpjwGQSOiKARJh
	13py5aeO3gl8y8Lq8lo36R/U554ABOXbFcEMND84xGEGmeg2lHWDV5kK7xpkGEqeLKcO
	9gqTPCE+rnyYsKI1I+Gu8aUMWOmL8GhEPAHmyc2mqlPlCXlK8zWjn4iV0XyPkZHcq58f
	ijVQ==
X-Gm-Message-State: APjAAAVfc0rBf6QmX0eY/KF8I7L8iArHVOEj/mCmTQHrEbWFam7F1YGx
	vK2pQx0SxoT+GJJCcRz7Kguq7aq9ZcORD2fZy7Q=
X-Google-Smtp-Source: APXvYqyIaj1WTF/lCKoALLshSSEItcc5Mu2qOnVDBgTirQ5JIlx2gJIh5AMKcNcR0uA6qwa5NuV6/sw/Ke9bt+/hxFc=
X-Received: by 2002:a0c:f513:: with SMTP id j19mr301133qvm.206.1581102106805; 
	Fri, 07 Feb 2020 11:01:46 -0800 (PST)
MIME-Version: 1.0
References: <20200207182542.300768-1-raj.khem@gmail.com>
	<CAJ86T=VX3N9fchLbA0w-pxuuao-Nn6B9N=pvtxe1efSH9qogQA@mail.gmail.com>
In-Reply-To: <CAJ86T=VX3N9fchLbA0w-pxuuao-Nn6B9N=pvtxe1efSH9qogQA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Feb 2020 11:01:20 -0800
Message-ID: <CAMKF1soB+X2aK9RyzQgEUJJ1BBFo_8r6iPaBS0jQKXP4yu-gEQ@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] oeqa: Touch cpio configure script before building
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
X-List-Received-Date: Fri, 07 Feb 2020 19:01:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 7, 2020 at 10:40 AM Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Fri, Feb 7, 2020 at 10:25 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > since the versions of autotools might differ, and difference in
> > timestamps for configure and system can result in reconfigure lets avoid
> > that by touching the configure script to match system time
>
> This is probably only a partial fix. If you look at the various
> dependencies in Makefile.in, ensuring that configure is newer than
> $(am__configure_deps) is only one case that needs to be handled. You
> also need to ensure that e.g. Makefile.in is newer than
> $(srcdir)/Makefile.am $(srcdir)/Make.rules $(am__configure_deps), that
> aclocal.m4 is newer than $(am__aclocal_m4_deps), etc.
>
> Touching various files in the right order can be made to work, but
> there's more to it than just touching configure. Configuring with
> --disable-maintainer-mode and therefore disabling all these autotools
> rules is probably a more robust solution.

right. Lets see if we run into that as well, I would send a v3 if this
is effective then we know we are on right path.

>
> > Avoids
> > error: newly created file is older than distributed files!
> >
> > [YOCTO #13779]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v2: Touch configure to match timestamps with system
> >     Move the touch cmd to configure step itself
> >
> >  meta/lib/oeqa/runtime/cases/buildcpio.py | 2 +-
> >  meta/lib/oeqa/sdk/cases/buildcpio.py     | 2 +-
> >  meta/lib/oeqa/selftest/cases/meta_ide.py | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/lib/oeqa/runtime/cases/buildcpio.py b/meta/lib/oeqa/runtime/cases/buildcpio.py
> > index 4bd72dd37e..a2cc8148db 100644
> > --- a/meta/lib/oeqa/runtime/cases/buildcpio.py
> > +++ b/meta/lib/oeqa/runtime/cases/buildcpio.py
> > @@ -27,6 +27,6 @@ class BuildCpioTest(OERuntimeTestCase):
> >      @OEHasPackage(['autoconf'])
> >      def test_cpio(self):
> >          self.project.download_archive()
> > -        self.project.run_configure()
> > +        self.project.run_configure('','touch ./configure;')
> >          self.project.run_make()
> >          self.project.run_install()
> > diff --git a/meta/lib/oeqa/sdk/cases/buildcpio.py b/meta/lib/oeqa/sdk/cases/buildcpio.py
> > index b0beafb38f..e412ee189f 100644
> > --- a/meta/lib/oeqa/sdk/cases/buildcpio.py
> > +++ b/meta/lib/oeqa/sdk/cases/buildcpio.py
> > @@ -28,7 +28,7 @@ class BuildCpioTest(OESDKTestCase):
> >              self.assertTrue(os.path.isdir(dirs["source"]))
> >              os.makedirs(dirs["build"])
> >
> > -            self._run("cd {build} && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
> > +            self._run("cd {build} && touch {source}/configure && {source}/configure $CONFIGURE_FLAGS".format(**dirs))
> >              self._run("cd {build} && make -j".format(**dirs))
> >              self._run("cd {build} && make install DESTDIR={install}".format(**dirs))
> >
> > diff --git a/meta/lib/oeqa/selftest/cases/meta_ide.py b/meta/lib/oeqa/selftest/cases/meta_ide.py
> > index 809142559a..16acd1154d 100644
> > --- a/meta/lib/oeqa/selftest/cases/meta_ide.py
> > +++ b/meta/lib/oeqa/selftest/cases/meta_ide.py
> > @@ -43,7 +43,7 @@ class MetaIDE(OESelftestTestCase):
> >                          "https://ftp.gnu.org/gnu/cpio/cpio-2.13.tar.gz",
> >                          self.tmpdir_metaideQA, self.td['DATETIME'], dl_dir=dl_dir)
> >          self.project.download_archive()
> > -        self.assertEqual(self.project.run_configure(), 0,
> > +        self.assertEqual(self.project.run_configure('','touch configure;'), 0,
> >                          msg="Running configure failed")
> >          self.assertEqual(self.project.run_make(), 0,
> >                          msg="Running make failed")
> > --
> > 2.25.0
> >
> > --
> > _______________________________________________
> > Openembedded-core mailing list
> > Openembedded-core@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

