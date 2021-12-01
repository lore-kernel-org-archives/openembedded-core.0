Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DE1DC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 21:33:41 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.3311.1638394419652274275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 13:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JPjdPhSF;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id v1so107347563edx.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Dec 2021 13:33:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9ecqEtAiZA+kXrs6rn/8BNgfn0kqG8yXwl4sOwWMffQ=;
        b=JPjdPhSFdL8bBtipwrJhRIoe+9Lp8Fn/ZSlwEoPL5CvkcWY8LcbpdVloeFuow6r1R+
         6BEvJpgw0shH7WK5DUE+CCbVK/E6e5c+cOlhXx1pUj9uzMSIpqpXT7SZ/NvurWNMkG/l
         GGNLfTdeAtjJSPaAEAcuXKTlDdaEyK0+r30PIJJbQuZWgSkUPtuWCDIssIxfk3khz1uh
         vF/Gibc/PnL/872BryNYC+pspDdoX0dfe1wk7rZbgpb+LHfcTNvqei7oVvFhnMx4/8SL
         HGXb8zjx//Cvbjg3JHy+gaifohHV4H9+mDRyvymLkOCzXnRrz2mnI+BESO0am8YodxfK
         T0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9ecqEtAiZA+kXrs6rn/8BNgfn0kqG8yXwl4sOwWMffQ=;
        b=g9/uLQB3wLkbalbItl2e/A7VEnh69ZlOrIXo36XHZ0aUA5EichyviSc++1VDqkeWsr
         pgnmYtTFJWYJ4TobbnCVZ5mTrstioRIy9Z724K4UAUS4VhftAm+jszPk5kF7NBDBjR3m
         SAfcBujenjgGXaXTPyNeQJDY8kcE8PLhv+dXR2ZlCrXnZAGbE26QFKjZ1DnEeZf77I3e
         lQ0GRZHuoqMz2FpSRVakXoiN1mPfWqViZXByYgBhbizA2JDTZ1ZpjZNvy3M851TmCtTr
         AnuFgWoqnGFMe86DtZXqja0Ya70xMmUm2RiWuLk6qYoQAU0bhP0CHdktge0h+WozWQdV
         f0zg==
X-Gm-Message-State: AOAM531D48QlC7YoBksGonNoOnQzTHd4m7dDPp6FVAk6Jw6H923mhou2
	IRnqaNxDkfMVhOPsXs83U27h9OT0AURAChEnfBQ=
X-Google-Smtp-Source: 
 ABdhPJwTp3koxSJCLt4amZFFFN0smDNhZv4vdzhRyKkzxefK9Zt+R8PtPXaIqRgup+eftMngs4iA7iFrKy3ICg/eZwM=
X-Received: by 2002:a17:907:94d4:: with SMTP id
 dn20mr10069479ejc.379.1638394418002;
 Wed, 01 Dec 2021 13:33:38 -0800 (PST)
MIME-Version: 1.0
References: <20211201203407.218692-1-bhupesh.sharma@linaro.org>
In-Reply-To: <20211201203407.218692-1-bhupesh.sharma@linaro.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 1 Dec 2021 16:33:27 -0500
Message-ID: 
 <CADkTA4NV0ix0S4rc8HqJuJJr=Os299bx5UZrQEBnx9MBW-DCzw@mail.gmail.com>
Subject: Re: [dunfell][PATCH 00/14] Backport mandatory dtschema handling for
 device trees built through the kernel.
To: Bhupesh Sharma <bhupesh.sharma@linaro.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>, bhupesh.linux@gmail.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 21:33:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159061

On Wed, Dec 1, 2021 at 3:34 PM Bhupesh Sharma <bhupesh.sharma@linaro.org> wrote:
>
> This is a backport request for dunfell, while picking up only the
> skeletal support for allowing mandatory dtschema handling for
> device trees built through the kernel, introduced from kernel
> version 5.16 onwards.

The problem with adding this support to dunfell, is obvious in the
number of patches involved.  We've also said/known that at some point
that we won't be able to support all new kernel versions with the LTS
release. This may be the start of drawing that line.

Also, we've had to do some license tweaks in master just today for one
of the added packages (idna), so that would be needed as well.

The validation isn't absolutely critical, I'd suggest that just the
wrappers and pkg-config fixes would be a smaller footprint to allow
the kernel to build, without the new package/feature additions to the
dunfell release. The new packages (and full validation) could still
possibly be done through a secondary or mixin layer.

I'm not sure which way to go on this, but I thought I'd offer those
points for discussion.

Bruce

>
> Without this backport compiling 5.16 kernel leads to the following
> error in the dunfell stable branch:
>
> scripts/dtc/Makefile:23: *** dtc needs libyaml for DT schema
>  validation support. Install the necessary libyaml development package..  Stop.
>
> Bruce Ashfield (14):
>   kernel: export native PKGCONFIG variables
>   python: introduce python3-dtschema
>   python: import jsonpointer from meta-python
>   python3-jsonpointer: Update 2.1 to 2.2
>   python: import jsonschema from meta-python
>   python: import idna from meta-python
>   python: import rfc3339-validator from meta-python
>   python: import rfc3986-validator from meta-python
>   python: import webcolors from meta-python
>   python: import ruamel-yaml from meta-python
>   python: import pyrsistent from meta-python
>   python: import rfc3987 from meta-pyton
>   python: import strict-rfc3339 from meta-python
>   python: import vcversioner from meta-python
>
>  meta/classes/kernel.bbclass                   |  7 +++
>  ...e-pytest-runner-to-test_requirements.patch | 32 +++++++++++++
>  .../python/python3-dtschema_2021.10.bb        | 16 +++++++
>  .../python/python3-idna_3.3.bb                | 19 ++++++++
>  .../python/python3-jsonpointer/run-ptest      |  3 ++
>  .../python/python3-jsonpointer_2.2.bb         | 26 ++++++++++
>  .../python/python3-jsonschema_3.2.0.bb        | 48 +++++++++++++++++++
>  .../python/python3-pyrsistent_0.18.0.bb       | 14 ++++++
>  .../python/python3-rfc3339-validator_0.1.4.bb | 20 ++++++++
>  .../python/python3-rfc3986-validator_0.1.1.bb | 23 +++++++++
>  .../python/python3-rfc3987_1.3.8.bb           | 10 ++++
>  .../python/python3-ruamel-yaml_0.17.16.bb     | 23 +++++++++
>  .../python/python3-strict-rfc3339_0.7.bb      | 10 ++++
>  .../python/python3-vcversioner_2.16.0.0.bb    | 12 +++++
>  .../python/python3-webcolors/run-ptest        |  3 ++
>  .../python/python3-webcolors_1.11.1.bb        | 27 +++++++++++
>  16 files changed, 293 insertions(+)
>  create mode 100644 meta/recipes-devtools/python/python-rfc3986-validator/0001-setup.py-move-pytest-runner-to-test_requirements.patch
>  create mode 100644 meta/recipes-devtools/python/python3-dtschema_2021.10.bb
>  create mode 100644 meta/recipes-devtools/python/python3-idna_3.3.bb
>  create mode 100644 meta/recipes-devtools/python/python3-jsonpointer/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-jsonpointer_2.2.bb
>  create mode 100644 meta/recipes-devtools/python/python3-jsonschema_3.2.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-pyrsistent_0.18.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-rfc3339-validator_0.1.4.bb
>  create mode 100644 meta/recipes-devtools/python/python3-rfc3986-validator_0.1.1.bb
>  create mode 100644 meta/recipes-devtools/python/python3-rfc3987_1.3.8.bb
>  create mode 100644 meta/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
>  create mode 100644 meta/recipes-devtools/python/python3-strict-rfc3339_0.7.bb
>  create mode 100644 meta/recipes-devtools/python/python3-vcversioner_2.16.0.0.bb
>  create mode 100644 meta/recipes-devtools/python/python3-webcolors/run-ptest
>  create mode 100644 meta/recipes-devtools/python/python3-webcolors_1.11.1.bb
>
> --
> 2.31.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

