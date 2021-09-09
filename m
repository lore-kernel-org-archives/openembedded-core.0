Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.676.1631202243798845007
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 08:44:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OHUgiGlx;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id a10so2227810qka.12
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Sep 2021 08:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7O6X2A/eQ3qgV/y4ge3uu02YQ3JlWBIjSZFr0kvl+I0=;
        b=OHUgiGlxZtHDi9McGK/Euqs9nY0hO2bFawJ+l7z0NUyOqJWGFKMEFx8mrJ0wy5ePqi
         TKNO4lSEYKHS9Czj0Gp8GAlYkQorkn617aBuzpPQD6cspGOpQhToySwnQwmht/k9K7Ci
         VVpQ5Kh3LdRvhitkbGjDaUhw9r2nXqv7ahlSTi/rS74K8vqVgnfXRii9LqAiJpHnCDYo
         Sq3d9KVQ7u91AEgAQ9wRajl3JlfsPZ3qnPa8JcMirr0MOki8PM4HSq6qV+n74+z51mgt
         NgBoaFK01OGvy1Y6ncx+vroiJOfY7AeEPBFegzijAUoIi09wAG46vVrbxxTdDkGUUVup
         2UWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7O6X2A/eQ3qgV/y4ge3uu02YQ3JlWBIjSZFr0kvl+I0=;
        b=s27ESl3Vvwy4ZvtfHiz3hzsRmgoMbmiQngg/5fN3OmC3hLg/TSG+0kJwV+3bRMKk4+
         ulB+kDt2aTv0XoZ1hEwHALZN8KqsEuGWZg9e76YTJtQB17cVvfnKtIug90yIhgRMJL+f
         I2v8FPxVT3b4xLxPwUAI/ffSIqIlcdI47qn7GG5RqAF8bbjXyUW6V4YCnjG/sm1JP3ak
         L2i9El/2Oa4sklGIvZYS4b3CqDr/jGUy9P35guhz6Ca1/teiuRo9Z3d8orl3PMSTrQRL
         ydn2x3S6pSn/YYMZBoVgELTUN9mC7kHi6wPz675OerB3qd2g0V2Lj0vjErYxYrrTXgtv
         rkbA==
X-Gm-Message-State: AOAM5305g0RxxqMIRWSg/5Jaejt9YFWi/CJYv2uX8Io7/S5gOxpixXhA
	jtuvPCCdEII0/c8Ki/hvWiiEqp/b5F6DjHqaPIE=
X-Google-Smtp-Source: ABdhPJymmuqL6qcEuaS1jprhh+OU0FbNiKKKRvecvo14gsSxzf1B+L9BdJg+x0RZnmV7JwmLlhVQU0b9iyGduxWjISM=
X-Received: by 2002:a37:a04e:: with SMTP id j75mr3350557qke.98.1631202242731;
 Thu, 09 Sep 2021 08:44:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631006167.git.liezhi.yang@windriver.com>
 <CAMKF1soGYd6t=1NaTTnD0482JOZWBx=M2HxDUnmHY8MX-j4aWw@mail.gmail.com> <5f2fa859-8638-118b-8c5a-d35a6d265a64@windriver.com>
In-Reply-To: <5f2fa859-8638-118b-8c5a-d35a6d265a64@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 9 Sep 2021 08:43:36 -0700
Message-ID: <CAMKF1srsvAGLdzp7hkz68uC7qWWzsgkM9ZacrJ+BTB69DTfc=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/1] assimp: Remove it
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 9, 2021 at 3:26 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Hi Khem,
>
> On 9/9/21 1:06 PM, Khem Raj wrote:
> > also delete meta/lib/oeqa/sdk/cases/assimp.py
>
> It's a test case for testing cmake, it should be OK to keep it? Or we need add a
> new one to replace it.

is it downloading assimp code etc. ? if so I would suggest to replace
it with something else too as a followup.

>
> // Robert
>
> >
> > On Tue, Sep 7, 2021 at 1:46 AM Robert Yang <liezhi.yang@windriver.com> wrote:
> >>
> >> The following changes since commit 70de1dbb660461bdf0613494f53ec4c78738ae2a:
> >>
> >>    vim: Add packageconfig for sound notification support (2021-09-06 09:49:13 +0100)
> >>
> >> are available in the Git repository at:
> >>
> >>    git://git.openembedded.org/openembedded-core-contrib rbt/assimp
> >>    http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/assimp
> >>
> >> Robert Yang (1):
> >>    assimp: Remove it
> >>
> >>   meta/conf/distro/include/maintainers.inc      |    1 -
> >>   ...hared-lib-from-_IMPORT_CHECK_TARGETS.patch |   32 -
> >>   ...hub.com-assimp-assimp-issues-2733-up.patch | 1664 -----------------
> >>   .../use-GNUInstallDirs-where-possible.patch   |  257 ---
> >>   meta/recipes-graphics/vulkan/assimp_5.0.1.bb  |   26 -
> >>   5 files changed, 1980 deletions(-)
> >>   delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-assimp-remove-shared-lib-from-_IMPORT_CHECK_TARGETS.patch
> >>   delete mode 100644 meta/recipes-graphics/vulkan/assimp/0001-closes-https-github.com-assimp-assimp-issues-2733-up.patch
> >>   delete mode 100644 meta/recipes-graphics/vulkan/assimp/use-GNUInstallDirs-where-possible.patch
> >>   delete mode 100644 meta/recipes-graphics/vulkan/assimp_5.0.1.bb
> >>
> >> --
> >> 2.17.1
> >>
> >>
> >> 
> >>
