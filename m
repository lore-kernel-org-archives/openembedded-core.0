Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
 by mx.groups.io with SMTP id smtpd.web12.16275.1591953540297508274
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jun 2020 02:19:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=L6psrkBl;
 spf=pass (domain: konsulko.com, ip: 209.85.210.66, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f66.google.com with SMTP id g5so6832636otg.6
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jun 2020 02:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tm75ImSfoW4UYSOFluuXNZCl9uXVoOcpWQq2kiy8jKY=;
        b=L6psrkBlHlw7LZph0KLZIRPc0xAfSk4pbi+c5vBtIjOSEyyj4CXawF4wsZIv8eyADN
         VqP5Hh6CBwfwSavtZqKZtYv0mktT1H6jdafIZMCGPCzhNaskdx+4oeYt3/2z0i/heIi4
         4IZcOM4yV7ODU+qhTQOXGkMFQtBO7GiQ4h8ls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tm75ImSfoW4UYSOFluuXNZCl9uXVoOcpWQq2kiy8jKY=;
        b=NbtV5FjAveHAX3MWMQ1WMAoBNJ04zJ454pQb3vytPZTDbBz9VkXBR0tJU/UK0MwmWK
         JGQGXi6RnTmEQY8Qqah7o7yRKDZMZOE3Jzp3WMqdIld2BsJgxzon44jXt/JTK8cEPupR
         TQeTTogxsIgAf2uH+6OzEE5+EiWZhPH0nPRvQHVZIDTFFsC2pCDVWxoxtZWvXR43+22f
         mzpoNNzEuMDUri6Qf45go4L/v4ZcTYkg9XJgs5L0JJ8Xv8ovNQFqfnLQcOTdMv4l+rFh
         Hcy4HlBaxSv2NHqEf7wegVWnt1qNuvnJS9wtLEBhBUehyMWWjQrfAKiXaGF/A+MERpRh
         fozg==
X-Gm-Message-State: AOAM531MsI66WvxidwJHGGcEK7CT6rkRw/tKn40UvzwP1MDXmqZfPSUP
	ioRcOxFhfcChZLhiaJi9OMcx0/EyKFOu44yKE12Ucw==
X-Google-Smtp-Source: ABdhPJwTtjGU7yi5Xc7PEAh2B7AO/8iXH49QSFWJuKvusX48Q3fMk/rw6FDt9rz8aUGg2BJKilpX151O+18VnainfXs=
X-Received: by 2002:a9d:6d09:: with SMTP id o9mr9176178otp.305.1591953539635;
 Fri, 12 Jun 2020 02:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20200604173301.12364-1-pbarker@konsulko.com> <20200604173301.12364-2-pbarker@konsulko.com>
 <e617e5f69e0b7779d56e5248104c007848239dc6.camel@linuxfoundation.org>
In-Reply-To: <e617e5f69e0b7779d56e5248104c007848239dc6.camel@linuxfoundation.org>
From: "Paul Barker" <pbarker@konsulko.com>
Date: Fri, 12 Jun 2020 10:18:49 +0100
Message-ID: <CAM9ZRVswfT9i_6UYR4+p7tW7TqiVBaFm9vS6Uu1QA+ZMQed_FQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/2] selftest: git-submodule-test: New recipe for testing a gitsm SRC_URI
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 12 Jun 2020 at 08:34, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Hi Paul,
>
> On Thu, 2020-06-04 at 18:33 +0100, Paul Barker wrote:
> > Signed-off-by: Paul Barker <pbarker@konsulko.com>
> > ---
> >  .../recipes-test/git-submodule-test/git-submodule-test.bb | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >  create mode 100644 meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
> >
> > diff --git a/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
> > new file mode 100644
> > index 0000000000..08089b4186
> > --- /dev/null
> > +++ b/meta-selftest/recipes-test/git-submodule-test/git-submodule-test.bb
> > @@ -0,0 +1,8 @@
> > +SUMMARY = "Test recipe for fetching git submodules"
> > +LICENSE = "MIT"
> > +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
> > +
> > +INHIBIT_DEFAULT_DEPS = "1"
> > +
> > +SRC_URI = "gitsm://git.yoctoproject.org/git-submodule-test"
> > +SRCREV = "a2885dd7d25380d23627e7544b7bbb55014b16ee"
>
> I didn't spot it at first but unfortunately this recipe is breaking the
> autobuilder. I think there is a problem with gitsm:// modules not
> mirroring correctly.
>
> Here you see the a-quick build run:
>
> bitbake universe -c fetch -k
> (meta-selftest is included and SOURCE_MIRROR_FETCH = '1' set)
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1055/steps/10/logs/step1b
>
> you do see do_fetch called for this recipe. Then later in the build it
> does:
>
> oe-selftest -r buildoptions.SourceMirroring.test_yocto_source_mirror
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1055/steps/12/logs/step1d
>
> The intent is that we check YP can build from its mirrors. The test is
> say it cannot.
>
> Any ideas on what might be wrong?

ovmf also uses git submodules and that seems to work. Also, I can see
the relevant mirror tarballs are present on
downloads.yoctoproject.org:

http://downloads.yoctoproject.org/mirror/sources/git2_git.openembedded.org.bitbake.tar.gz
http://downloads.yoctoproject.org/mirror/sources/git2_git.yoctoproject.org.bitbake-gitsm-test1.tar.gz
http://downloads.yoctoproject.org/mirror/sources/git2_git.yoctoproject.org.bitbake-gitsm-test2.tar.gz
http://downloads.yoctoproject.org/mirror/sources/git2_git.yoctoproject.org.git-submodule-test.tar.gz

So it's not immediately obvious what's wrong there. I'll run that
selftest case locally and see if I can reproduce the issue.

Thanks,

-- 
Paul Barker
Konsulko Group
