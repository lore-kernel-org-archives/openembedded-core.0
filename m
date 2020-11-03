Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web09.2993.1604433637039045234
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 12:00:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fXuKd6kj;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id l2so16310774qkf.0
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 12:00:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ok3z0hIKQpS+pmlCFDgQTg3O6J0RHnRNsFRxl1B6glE=;
        b=fXuKd6kj+KPt5HETqY0yR7P63BVfAc0POPem4Tg2p7NiAiRbJTky6GxiB5PD78gXWt
         XwM3sgL5bI+Gw6RpOx5fjEwHHwOMRMg+X3ikG0a4aVsVP11EOJfl8FaYADuvIJiSWald
         e4ghr8JY7AoEccDdGQ398uZ9Tn757yFJP15JGQlXhq9nVNZwcJH7NTca9zpoDN9eyWN4
         MF16LsG5hAHEPPJb31NB3wXo9PGXFYdTKrw4/xxQwnMw+w5GJ/AQqo6VX6ouIIryKP5C
         S3WCpXkFRb7JvlvHod1cFIuzgrQh3+rWO/fnxZZtKuAehPZ5CJbmtBNlQ7m3lr6aBNDX
         /wsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ok3z0hIKQpS+pmlCFDgQTg3O6J0RHnRNsFRxl1B6glE=;
        b=V+XVF2Fmn0JIdGm84Vjn9PBCgZI+Hm8+c+isud+h+0cq5ZlzC/KZG3QJoiB9SAbIg7
         /7kPyHUlplZUXGwGQLrcIldhquF9Ody1A39lr9TxHZXHv5gpTHEOkzKuc5448gcdiGi3
         7h4DkYB0veZ+EocvOIPIIfv8GZ29NRVlwahTd1LV1Kki0BDnHUjMdOraEsttwFmXxt2e
         O+HhHU5UfsIvtQHkiCxXCtCHsT1/X/SUxj1Gnz5+wT+39tGBMf2nQuugAdlitLo0q/QO
         FV61JiNR6RBpZhXwAnNBhO1ltWRhG+80/iQic8V28Cr+hckfdvMv4E5iMbMCHiSJdGK+
         rEWQ==
X-Gm-Message-State: AOAM532r/l13dbczVVXBn0qXfPdkmChO9IEBgXcfzcNpcJ+cWGkS7wYC
	fRDHU7clAKG2WzeH9bQctzagQ3J6SWchq0Rmv7E=
X-Google-Smtp-Source: ABdhPJxmVsVMyJ2JuYI9gp4iLCdp+SEUU6P0dI3c1yNcUY7mT/lKuXh3PCLrXnYPYuPZ2xd+ev3OR6qTfFRGT0xAdv4=
X-Received: by 2002:a37:9942:: with SMTP id b63mr22757279qke.85.1604433636052;
 Tue, 03 Nov 2020 12:00:36 -0800 (PST)
MIME-Version: 1.0
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
 <20201102164907.27572-70-alex.kanavin@gmail.com> <f878d465-f694-1bf9-4db7-1b2476a8199e@gmail.com>
 <CANNYZj8hyJoeQkV_GyM7jXZh-8OVSMK=jp3pQ=nHyiFisYRUfA@mail.gmail.com>
 <395c85f0-61fe-c39f-fb5d-2aa59f22181e@gmail.com> <CANNYZj9b1w4DZAatRVG1jkyprZjov9UFaT=oa5_qbXePfm2N5Q@mail.gmail.com>
In-Reply-To: <CANNYZj9b1w4DZAatRVG1jkyprZjov9UFaT=oa5_qbXePfm2N5Q@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 3 Nov 2020 12:00:10 -0800
Message-ID: <CAMKF1sr2jiLYL+DJRNbaiTTEqLxhD+SRRu31FKp3mkp-VS3CcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 70/80] rt-tests/hwlatdetect: upgrade 1.8 -> 1.9
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 3, 2020 at 11:52 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> World builds are only done for x86/x86-64 I think? That would be good to adjust, and build at least one truly cross-compiled world.
>

yeah something like arm or aarch64 could be a good option and perhaps
drop x86 and keep x86_64 only if there is resource constraint on AB

> Alex
>
> On Tue, 3 Nov 2020 at 20:25, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>
>>
>> On 11/3/20 11:17 AM, Alexander Kanavin wrote:
>> > Can you send a patch for this please?
>> >
>>
>> thats fine,
>>
>> Richard,
>>
>> How does this not get detected in world builds ?
>>
>> > Alex
>> >
>> > On Tue, 3 Nov 2020 at 19:43, Khem Raj <raj.khem@gmail.com
>> > <mailto:raj.khem@gmail.com>> wrote:
>> >
>> >     rt-tests now have added code which only works for x86/x86_64/ppc64 in
>> >     src/oslat/oslat.c, so either that will need fixing for other arches or
>> >     limit this recipe to above said arches. see a failure here e.g.
>> >
>> >     https://errors.yoctoproject.org/Errors/Details/511500/
>> >
>> >     On 11/2/20 8:48 AM, Alexander Kanavin wrote:
>> >      > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>> >     <mailto:alex.kanavin@gmail.com>>
>> >      > ---
>> >      >   ...001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch | 7
>> >     ++++---
>> >      >   .../rt-tests/{hwlatdetect_1.8.bb <http://hwlatdetect_1.8.bb> =>
>> >     hwlatdetect_1.9.bb <http://hwlatdetect_1.9.bb>}    | 0
>> >      >   meta/recipes-rt/rt-tests/rt-tests.inc                      | 2 +-
>> >      >   .../rt-tests/{rt-tests_1.8.bb <http://rt-tests_1.8.bb> =>
>> >     rt-tests_1.9.bb <http://rt-tests_1.9.bb>}          | 0
>> >      >   4 files changed, 5 insertions(+), 4 deletions(-)
>> >      >   rename meta/recipes-rt/rt-tests/{hwlatdetect_1.8.bb
>> >     <http://hwlatdetect_1.8.bb> => hwlatdetect_1.9.bb
>> >     <http://hwlatdetect_1.9.bb>} (100%)
>> >      >   rename meta/recipes-rt/rt-tests/{rt-tests_1.8.bb
>> >     <http://rt-tests_1.8.bb> => rt-tests_1.9.bb
>> >     <http://rt-tests_1.9.bb>} (100%)
>> >      >
>> >      > diff --git
>> >     a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
>> >     b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
>> >      > index c18928ed02..8fd94b176c 100644
>> >      > ---
>> >     a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
>> >      > +++
>> >     b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
>> >      > @@ -1,4 +1,4 @@
>> >      > -From caaa142826504ad0375f9d21c558f10f31305cdb Mon Sep 17
>> >     00:00:00 2001
>> >      > +From f89d6d6d23e0dacfd0008f686a457d536edc406a Mon Sep 17
>> >     00:00:00 2001
>> >      >   From: Randy Witt <randy.e.witt@intel.com
>> >     <mailto:randy.e.witt@intel.com>>
>> >      >   Date: Fri, 16 Oct 2020 16:54:30 -0700
>> >      >   Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
>> >      > @@ -9,16 +9,17 @@ commit 7763cf316d7896fa05b816a46998f0827ab6e6eb.
>> >      >   Signed-off-by: Randy Witt <randy.e.witt@intel.com
>> >     <mailto:randy.e.witt@intel.com>>
>> >      >
>> >      >   Upstream-Status: Inappropriate [other]
>> >      > +
>> >      >   ---
>> >      >    Makefile | 4 ++--
>> >      >    1 file changed, 2 insertions(+), 2 deletions(-)
>> >      >
>> >      >   diff --git a/Makefile b/Makefile
>> >      > -index 05fc5ed..7a289c8 100644
>> >      > +index c3ebbd7..2176835 100644
>> >      >   --- a/Makefile
>> >      >   +++ b/Makefile
>> >      >   @@ -1,6 +1,6 @@
>> >      > - VERSION = 1.8
>> >      > + VERSION = 1.9
>> >      >   -CC = $(CROSS_COMPILE)gcc
>> >      >   -AR = $(CROSS_COMPILE)ar
>> >      >   +CC ?= $(CROSS_COMPILE)gcc
>> >      > diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb
>> >     <http://hwlatdetect_1.8.bb>
>> >     b/meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
>> >     <http://hwlatdetect_1.9.bb>
>> >      > similarity index 100%
>> >      > rename from meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb
>> >     <http://hwlatdetect_1.8.bb>
>> >      > rename to meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
>> >     <http://hwlatdetect_1.9.bb>
>> >      > diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc
>> >     b/meta/recipes-rt/rt-tests/rt-tests.inc
>> >      > index 5d28c7e63e..2dd890cf95 100644
>> >      > --- a/meta/recipes-rt/rt-tests/rt-tests.inc
>> >      > +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
>> >      > @@ -1,5 +1,5 @@
>> >      >   # Version 1.8
>> >      > -SRCREV = "9f78b91f057e63b0c241012ce36b57168133eefb"
>> >      > +SRCREV = "21c1df7d2ee199ac619cbb1806a38d15e7e95c09"
>> >      >   PE = "1"
>> >      >
>> >      >   SRC_URI =
>> >     "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest
>> >     <http://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest>"
>> >      > diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.8.bb
>> >     <http://rt-tests_1.8.bb> b/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
>> >     <http://rt-tests_1.9.bb>
>> >      > similarity index 100%
>> >      > rename from meta/recipes-rt/rt-tests/rt-tests_1.8.bb
>> >     <http://rt-tests_1.8.bb>
>> >      > rename to meta/recipes-rt/rt-tests/rt-tests_1.9.bb
>> >     <http://rt-tests_1.9.bb>
>> >      >
>> >      >
>> >      >
>> >      > 
>> >      >
>> >
