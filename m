Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CF59C433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 21:44:51 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.4334.1637790289951327201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:44:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pFpQIZeK;
 spf=pass (domain: gmail.com, ip: 209.85.208.45,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id r25so16514691edq.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 13:44:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zJQ2SP9t4fbWEvyD2Y8fqFFBObn0wBkYeQf/qcjgl/c=;
        b=pFpQIZeK6RPYVQYCXYWFOyk0qIzGi6sqj4qY0n7OGE6bSQCT8Ud52GYtoKnbM6fSBq
         Dl1u+6B62Jkwr5Pa5L99TkYN9M6T3X/qGpI5zXk4/UpGDWNvoM1r1dz726rTHTV1Jiiv
         TlG7TjO2p5jMccUVNmBpmqHCvGpEpW6TzRUnEitsn/0eUdenpYIFxNXOFw5/8IAs3OLB
         LQaJdcxfRDZm4KkWjzdWBO9abeAlFYCaPEuMH6cVyC2OcjEH7Zho9V19WpiEEgjBAa1M
         /els7JHKg2f1zH8Y8LRaGWd0mG2tgi88ajMaHu/UpW7tW39ZNljm+uetuVHWvm1G3D8R
         dgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zJQ2SP9t4fbWEvyD2Y8fqFFBObn0wBkYeQf/qcjgl/c=;
        b=JB+9ypmoSzUbGcMqwNK3X1DpE8FWTK8H/Ni9vCV2MjaCLjRcygEEBfpUXzntyxFuSU
         9ITb+N+XoQlZ4lwsUAEHcIF8SrQrviGVwk6wIiIzTUNrc4MzfS/8rgzqU/kCJjEYajie
         weTo08aoizht6dTecmSYmc8G1nsxX+k4ynF8JWLaf+Ijl+td1VcgdmBElQUUILc0UsKf
         y+oxpM4NzqvUJzTaCbz/FcE4xo7fwg6gvvSOj4joEVY5WMtNGckULQtpHFOEx3wTvNWG
         cApUiZPhewxo2yDaqK7JbrJ/g7leQJAM1SlsN0eWVnphaLHWuMQnWsAvG4gB54qp/ZCy
         G1Yg==
X-Gm-Message-State: AOAM530EXCklMeZiFOpt21QRXlKZr6U5ECOP/E+jjD4igAtsjNveOGbR
	oqXSzQVGsYNt9pH0s2d+5725JWyM8eIJ1cFnMv4=
X-Google-Smtp-Source: 
 ABdhPJzTY5TV2fEab7Wkm316LuOJ/MF9i6AooceTbQuMEYU+0thL/dKARIh5cEtdDvU/4MRakIF87ihYYD9oiSDUWlM=
X-Received: by 2002:a17:906:48cd:: with SMTP id
 d13mr24115483ejt.35.1637790287902;
 Wed, 24 Nov 2021 13:44:47 -0800 (PST)
MIME-Version: 1.0
References: <16BA97EFBEC64BAB.4083@lists.openembedded.org>
 <16BA988DC0E76AA8.14741@lists.openembedded.org>
In-Reply-To: <16BA988DC0E76AA8.14741@lists.openembedded.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 Nov 2021 16:44:36 -0500
Message-ID: 
 <CADkTA4PrDjRDRsRLec9_C8CyVdsCQFSvLUfW-wBhqmiPjwBQZg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/20 v2] kernel: consolidated pull request
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, Tim Orling <TicoTimo@gmail.com>,
	Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 21:44:51 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158768

On Wed, Nov 24, 2021 at 4:25 PM Bruce Ashfield via
lists.openembedded.org
<bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
>
> On Wed, Nov 24, 2021 at 4:14 PM Bruce Ashfield via
> lists.openembedded.org
> <bruce.ashfield=gmail.com@lists.openembedded.org> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > Richard,
> >
> > Here's v2 of the pull request. I see the -stable updates merged, so they
> > are obviously not in v2.
> >
> > New in v2:
> >   - reworked the python-dtschema recipe to properly have depends/rdepends
> >     to fix warnings
> >   - imported 4 new dependencies for the recipe
> >   - fixed up the kernel-dev PACKAGECONFIG to not generate a QA warning
>
> Right after I sent this, my AB run shows some sort of error in the
> reproducibility
> test for the new dtschema recipe.
>
> I'll pick this back up on Friday (if all goes well), and it may be
> worth a AB run,
> but i expect that the same error will pop up for you.
>

I was so focused on the kernel dt validation (and the -native version
of the recipe), that the target one was broken. I just pushed a fix to
the branch, so if you re-grab the changes from zedd/kernel, the fixed
dtschema recipe is there.

Bruce

> Bruce
>
> >
> > The v1 pull request text follows from here:
> >
> > There's a few routine -stable updates at the start of this, and then some
> > more painful (and RFC) commits.
> >
> > As part of this series, we fix one pkg-config issue that was preventing
> > x86 from doing stack valildation during build. At one point it was
> > increasing my build times signficantly, but that seems to have gone
> > away now. If we see something like this on the AB, we'll have to keep
> > the fix, but disable it by default.
> >
> > The next big chunk of changes are the ones we talked about during the
> > tech call today. The 5.16 kernel has introduced mandatory dtschema
> > checking for device trees built through the kernel.
> >
> > That checking pulls in a reasonably large amount of dependencies to
> > the kernel build: libyaml, dtschema, jsonschema, etc.
> >
> > We weren't able to even run the validation at all, due to the kernel
> > calling pkg-config directly to check for libyaml, which is the target
> > pkgconfig and failing on missing dependencies. Rather than patching
> > the kernel, I've finally given in and made the do_compile task set
> > the PKG_CONFIG variables to point to our native-sysroot. Since the
> > kenrel doesn't use pkgconfig for target decisions, and has quite
> > a few calls directly to pkgconfig, this is the best short term way
> > to get all those checks working.
> >
> > Once we are past yaml, we need to create the dtschema recipe, and
> > bring in the dependencies from meta-python. I've put myself down as
> > the maintainer for all the new recipes, but otherwise, I haven't
> > changed or modified them.
> >
> > BUT! there are scenarios where a non-conformant dts file is being
> > built, or we just don't want those dependencies in the built. To
> > work around that, I took the suggestion from this morning and
> > created a python3-dtschema-wrappers recipe. It contains three
> > scripts of the same name as the ones from the real package. When
> > put in the dependency for a kernel build, it can pass the dtschema
> > steps.
> >
> > Finally, I created a reference PACKAGECONFIG for linux-yocto-dev
> > to enable/disable the main package and wrappers (the wrappers are
> > used by default). I haven't put this into kernel.bbclass yet, since
> > it is version specific, and it needs to soak for a bit. But if
> > there's demand, it is something that can be moved to kernel.bclass
> > (along with a few other version specific dependencies).
> >
> > Note: I haven't done an AB run with these yet, so I could be
> > missing some python dependencies, etc, but I wanted to get this
> > out to the list in case others are running into this with
> > v5.16+.
> >
> > Bruce
> >
> > The following changes since commit 0ec51bf52a930982ac03976781010a638d4cb0ef:
> >
> >   logrotate: add a link to upstream review for one of the patch (2021-11-24 10:00:10 +0000)
> >
> > are available in the Git repository at:
> >
> >   git://git.yoctoproject.org/poky-contrib zedd/kernel
> >   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> >
> > Bruce Ashfield (18):
> >   linux-yocto-dev: bump to v5.16+
> >   kernel: export native PKGCONFIG variables
> >   python: introduce python3-dtschema
> >   python: import jsonpointer from meta-python
> >   python: import jsonschema from meta-python
> >   python: import idna from meta-python
> >   python: import rfc3339-validator from meta-python
> >   python: import rfc3986-validator from meta-python
> >   python: import webcolors from meta-python
> >   python: import ruamel-yaml from meta-python
> >   python: import pyrsistent from meta-python
> >   python: import rfc3987 from meta-pyton
> >   python: import strict-rfc3339 from meta-python
> >   python: import vcversioner from meta-python
> >   maintainers: update for kernel dtschema checking dependencies
> >   linux-yocto: export pkgconfig variables to devshell
> >   kernel: introduce python3-dtschema-wrapper
> >   linux-yocto-dev: introduce dt-validation PACKAGECONFIG
> >
> > Max Krummenacher (2):
> >   perf: sort-pmuevents: don't drop elements
> >   perf: sort-pmuevents: allow for additional type qualifiers and storage
> >     class
> >
> >  meta/classes/kernel.bbclass                   |  7 +++
> >  meta/conf/distro/include/maintainers.inc      | 13 +++++
> >  ...e-pytest-runner-to-test_requirements.patch | 32 +++++++++++++
> >  .../python/python3-dtschema_2021.10.bb        | 16 +++++++
> >  .../python/python3-idna_3.3.bb                | 19 ++++++++
> >  .../python/python3-jsonpointer/run-ptest      |  3 ++
> >  .../python/python3-jsonpointer_2.1.bb         | 26 ++++++++++
> >  .../python/python3-jsonschema_3.2.0.bb        | 48 +++++++++++++++++++
> >  .../python/python3-pyrsistent_0.18.0.bb       | 14 ++++++
> >  .../python/python3-rfc3339-validator_0.1.4.bb | 20 ++++++++
> >  .../python/python3-rfc3986-validator_0.1.1.bb | 23 +++++++++
> >  .../python/python3-rfc3987_1.3.8.bb           | 10 ++++
> >  .../python/python3-ruamel-yaml_0.17.16.bb     | 23 +++++++++
> >  .../python/python3-strict-rfc3339_0.7.bb      | 10 ++++
> >  .../python/python3-vcversioner_2.16.0.0.bb    | 12 +++++
> >  .../python/python3-webcolors/run-ptest        |  3 ++
> >  .../python/python3-webcolors_1.11.1.bb        | 27 +++++++++++
> >  .../python3-dtschema-wrapper/dt-doc-validate  | 20 ++++++++
> >  .../dtc/python3-dtschema-wrapper/dt-mk-schema | 20 ++++++++
> >  .../dtc/python3-dtschema-wrapper/dt-validate  | 20 ++++++++
> >  .../dtc/python3-dtschema-wrapper_2021.10.bb   | 17 +++++++
> >  meta/recipes-kernel/linux/linux-yocto-dev.bb  | 12 ++++-
> >  meta/recipes-kernel/linux/linux-yocto.inc     |  9 ++++
> >  .../perf/perf/sort-pmuevents.py               | 28 ++++++-----
> >  24 files changed, 419 insertions(+), 13 deletions(-)
> >  create mode 100644 meta/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
> >  create mode 100644 meta/recipes-devtools/python/python3-dtschema_2021.10.bb
> >  create mode 100644 meta/recipes-devtools/python/python3-idna_3.3.bb
> >  create mode 100644 meta/recipes-devtools/python/python3-jsonpointer/run-ptest
> >  create mode 100644 meta/recipes-devtools/python/python3-jsonpointer_2.1.bb
> >  create mode 100644 meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb
> >  create mode 100644 meta/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
> >  create mode 100644 meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
> >  create mode 100644 meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
> >  create mode 100644 meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
> >  create mode 100644 meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
> >  create mode 100644 meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
> >  create mode 100644 meta/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
> >  create mode 100644 meta/recipes-devtools/python/python3-webcolors/run-ptest
> >  create mode 100644 meta/recipes-devtools/python/python3-webcolors_1.11.1.bb
> >  create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
> >  create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
> >  create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
> >  create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
> >
> > --
> > 2.19.1
> >
> >
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158767): https://lists.openembedded.org/g/openembedded-core/message/158767
> Mute This Topic: https://lists.openembedded.org/mt/87290452/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

