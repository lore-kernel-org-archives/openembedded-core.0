Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556ACC433EF
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 14:28:50 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web08.6663.1637764129458577096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:28:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aI3lxn5a;
 spf=pass (domain: gmail.com, ip: 209.85.208.50,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id w1so11366294edc.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 06:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rfk+9YrUn0fFf0fhasBzpPRkwbWbIs0Vu8m2COEpPkY=;
        b=aI3lxn5ab80dBQwDfF/3007AhCepNoHtL1Tw1P0+10nI2g5uenXGR5b5LLR0OapYwp
         xL/pqGlSlHjnQ9lTLhq4rbTJCIohiG6QUVrclwpnrgOXGhSq8GGlyNr+h3XuWRfw7j/m
         Ud58nuTxZMhPrSm+KuHaDHtbZKEZDO4fF9hMa46zUoWqdLAnNP5TTP0aA4sQkNKvrZ0L
         TR9XBsgMqMXsAh54+SOQbt5zMXwiTkGG/nw5E5fS50JedtLnWlr/Nb2p7TLYzJhnR8Ge
         tDeavJ0V148TvdSiO3z7aBDgUCfh34bt/2mIt+datZGqzGqW1poeBk0BWpx/ZLZ952pL
         +Cxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rfk+9YrUn0fFf0fhasBzpPRkwbWbIs0Vu8m2COEpPkY=;
        b=X0DwC6xOmH+SMQcVJywz95O/wYs8ZA8fEfnfmRWeuJ4B53k1tynDpm2eR3lzZH/i2O
         B463IERzBnZlRCpGakN1wJrZR1tmCLlZEt0bWbhrZeE9fSRKRjskBo9yJKIC71fZ/Qgp
         Yb/rOFGjS8vrrT6S+JuI5SEWJMfEyJzYAj2Zw2u4wcKh1Z7x+Knl7nTN2gIXXDIqomBq
         y9poqjY3j914QID+7OSKWF20f+62jUe26YGcY40DzLT+d7FoAZ+YYDZpv0DMPszvXlyK
         ngJxAzvdRvUqRgSKbtlpPOevZIXNzPZK/26GGeFe/3+Hc7acmgIjvP5A2RNKthqZvDR+
         Hx/w==
X-Gm-Message-State: AOAM532jOQevjnBYIvx5sD1nmMOhYmsG1xrXdaN/m2DLHbjdtwBKj3xU
	M46rycAVR7Dyr52umsDlUjMCclBKWigRNo4i5hQ=
X-Google-Smtp-Source: 
 ABdhPJzG3YM3R7plo+YXjB4Gh/Fbl08Nsn7H49umpafMrC5z76N1cUYSBSEKYtIJgF0tDiC/bE6kOwiRrf6H8AiemlY=
X-Received: by 2002:a17:907:94d4:: with SMTP id
 dn20mr20675540ejc.379.1637764127680;
 Wed, 24 Nov 2021 06:28:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1637703810.git.bruce.ashfield@gmail.com>
In-Reply-To: <cover.1637703810.git.bruce.ashfield@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 24 Nov 2021 09:28:36 -0500
Message-ID: 
 <CADkTA4N+mUNAUyFy9Sud=FBKx7wOqBUU0Qh6_AZbTOnh8FP21g@mail.gmail.com>
Subject: Re: [PATCH 00/20] kernel/kernel-yocto: consolidated pull request
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Tim Orling <TicoTimo@gmail.com>,
 Trevor Gamblin <trevor.gamblin@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 14:28:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158691

On Tue, Nov 23, 2021 at 4:57 PM <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Richard,
>
> There's a few routine -stable updates at the start of this, and then some
> more painful (and RFC) commits.
>
> As part of this series, we fix one pkg-config issue that was preventing
> x86 from doing stack valildation during build. At one point it was
> increasing my build times signficantly, but that seems to have gone
> away now. If we see something like this on the AB, we'll have to keep
> the fix, but disable it by default.
>
> The next big chunk of changes are the ones we talked about during the
> tech call today. The 5.16 kernel has introduced mandatory dtschema
> checking for device trees built through the kernel.
>
> That checking pulls in a reasonably large amount of dependencies to
> the kernel build: libyaml, dtschema, jsonschema, etc.

I missed some dependencies for the new recipe. I started an AB run,
and will stack any new imports on top of my queue.

I may have also gotten the rdepends -> depends wrong for the -native
recipe, I never get them right for native / host tools the first time :D
I'm looking into that now.

Bruce

>
> We weren't able to even run the validation at all, due to the kernel
> calling pkg-config directly to check for libyaml, which is the target
> pkgconfig and failing on missing dependencies. Rather than patching
> the kernel, I've finally given in and made the do_compile task set
> the PKG_CONFIG variables to point to our native-sysroot. Since the
> kenrel doesn't use pkgconfig for target decisions, and has quite
> a few calls directly to pkgconfig, this is the best short term way
> to get all those checks working.
>
> Once we are past yaml, we need to create the dtschema recipe, and
> bring in the dependencies from meta-python. I've put myself down as
> the maintainer for all the new recipes, but otherwise, I haven't
> changed or modified them.
>
> BUT! there are scenarios where a non-conformant dts file is being
> built, or we just don't want those dependencies in the built. To
> work around that, I took the suggestion from this morning and
> created a python3-dtschema-wrappers recipe. It contains three
> scripts of the same name as the ones from the real package. When
> put in the dependency for a kernel build, it can pass the dtschema
> steps.
>
> Finally, I created a reference PACKAGECONFIG for linux-yocto-dev
> to enable/disable the main package and wrappers (the wrappers are
> used by default). I haven't put this into kernel.bbclass yet, since
> it is version specific, and it needs to soak for a bit. But if
> there's demand, it is something that can be moved to kernel.bclass
> (along with a few other version specific dependencies).
>
> Note: I haven't done an AB run with these yet, so I could be
> missing some python dependencies, etc, but I wanted to get this
> out to the list in case others are running into this with
> v5.16+.
>
> Cheers,
>
> Bruce
>
>
> The following changes since commit 60409917ea3e7353f5b7ee831fe4ffaff0957d94:
>
>   glibc-tests: Do not set SYSTEMD_SERVICE (2021-11-23 14:04:02 +0000)
>
> are available in the Git repository at:
>
>   git://git.yoctoproject.org/poky-contrib zedd/kernel
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
>
> Bruce Ashfield (18):
>   linux-yocto/5.15: update to v5.15.2
>   linux-yocto/5.14: update to v5.14.18
>   linux-yocto/5.10: update to v5.10.79
>   kernel-yocto: conditionally enable stack protection checking on x86-64
>   linux-yocto-dev: bump to v5.16+
>   kernel: export native PKGCONFIG variables
>   python: introduce python3-dtschema
>   python: import jsonpointer from meta-python
>   python: import jsonschema from meta-python
>   python: import idna from meta-python
>   python: import rfc3339-validator from meta-python
>   python: import rfc3986-validator from meta-python
>   python: import webcolors from meta-python
>   python: import ruamel-yaml from meta-python
>   maintainers: update for kernel dtschema checking dependencies
>   linux-yocto: export pkgconfig variables to devshell
>   kernel: introduce python3-dtschema-wrapper
>   linux-yocto-dev: introduce dt-validation PACKAGECONFIG
>
> Max Krummenacher (2):
>   perf: sort-pmuevents: don't drop elements
>   perf: sort-pmuevents: allow for additional type qualifiers and storage
>     class
>
>  meta/classes/kernel.bbclass                   |  7 +++
>  meta/conf/distro/include/maintainers.inc      |  9 ++++
>  ...e-pytest-runner-to-test_requirements.patch | 32 +++++++++++++
>  .../python/python3-dtschema_2021.10.bb        | 15 ++++++
>  .../python/python3-idna_3.3.bb                | 19 ++++++++
>  .../python/python3-jsonpointer/run-ptest      |  3 ++
>  .../python/python3-jsonpointer_2.1.bb         | 26 ++++++++++
>  .../python/python3-jsonschema_3.2.0.bb        | 48 +++++++++++++++++++
>  .../python/python3-rfc3339-validator_0.1.4.bb | 20 ++++++++
>  .../python/python3-rfc3986-validator_0.1.1.bb | 23 +++++++++
>  .../python/python3-ruamel-yaml_0.17.16.bb     | 23 +++++++++
>  .../python/python3-webcolors/run-ptest        |  3 ++
>  .../python/python3-webcolors_1.11.1.bb        | 27 +++++++++++
>  .../python3-dtschema-wrapper/dt-doc-validate  | 20 ++++++++
>  .../dtc/python3-dtschema-wrapper/dt-mk-schema | 20 ++++++++
>  .../dtc/python3-dtschema-wrapper/dt-validate  | 20 ++++++++
>  .../dtc/python3-dtschema-wrapper_2021.10.bb   | 17 +++++++
>  meta/recipes-kernel/linux/linux-yocto-dev.bb  | 10 +++-
>  .../linux/linux-yocto-rt_5.10.bb              |  6 +--
>  .../linux/linux-yocto-rt_5.14.bb              |  6 +--
>  .../linux/linux-yocto-rt_5.15.bb              |  6 +--
>  .../linux/linux-yocto-tiny_5.10.bb            |  8 ++--
>  .../linux/linux-yocto-tiny_5.14.bb            |  8 ++--
>  .../linux/linux-yocto-tiny_5.15.bb            |  8 ++--
>  meta/recipes-kernel/linux/linux-yocto.inc     | 13 +++++
>  meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++-----
>  meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++-----
>  meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++-----
>  .../perf/perf/sort-pmuevents.py               | 28 ++++++-----
>  29 files changed, 429 insertions(+), 72 deletions(-)
>  create mode 100644 meta/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
>  create mode 100644 meta/recipes-devtools/python/python3-dtschema_2021.10.bb
>  create mode 100644 meta/recipes-devtools/python/python3-idna_3.3.bb
>  create mode 100644 meta/recipes-devtools/python/python3-jsonpointer/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-jsonpointer_2.1.bb
>  create mode 100644 meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
>  create mode 100644 meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
>  create mode 100644 meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
>  create mode 100644 meta/recipes-devtools/python/python3-webcolors/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-webcolors_1.11.1.bb
>  create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-doc-validate
>  create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-mk-schema
>  create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper/dt-validate
>  create mode 100644 meta/recipes-kernel/dtc/python3-dtschema-wrapper_2021.10.bb
>
> --
> 2.19.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

