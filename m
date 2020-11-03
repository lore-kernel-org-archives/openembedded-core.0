Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web08.2524.1604431513750568468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Nov 2020 11:25:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N/k6uqP2;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id g11so2527961pll.13
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Nov 2020 11:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JI1kVuDbTk42U0UNfU99KXHbAUVUSbCZv77VVYYuc2w=;
        b=N/k6uqP2VJO7aMKeJPo7ejM38PzX5rbnOs+FFdh4nq8GiRPTSsXgIUTRaZuC4n8ksz
         og48/smI5NBplZA3koLOiuAAXQQgPqp+p86fDF983axS5Vjg5qADj4bR786eM9isc9Ja
         MfR1IbBEw+RXdtCvHOM5Hr/HRb4hJQ3r0enqr8tPBMjOf+w3ks+gE4WMqz6Bpoffbh/z
         LdkZw0+Qw3SpYb/+VJuls2c9kj4Kdkp44fe7aUZWaGdxEFExKBFSHJVDn/ZezFOoEXJk
         vS0yklbSMc7wg1XQuGmVWia73o2D0QZP/28Du03ss7BRb0T1J60U+sU8UNaxo/L0l3BB
         dSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JI1kVuDbTk42U0UNfU99KXHbAUVUSbCZv77VVYYuc2w=;
        b=WuyxzDNIk/cPaQ7D+YAuSihlmWLFTZOsj1L2NTCe5mLjIpILDfa5RfYthgPCLZRiur
         HuN+S0VzjGragXDZSYrS+BX5dE3/VZsoaiE/Blg/CYT/QbN18FQSB7SKUr8ZsgZp0dih
         //c98mF7R1Cqb85Z1UYbdsxIwQ1wr8PIvENYmiN5kT9Xb3gFY+Y2QnnFqNURhLXPX9sh
         rVkd12z3vLNzIJTwFm6uh9poRiRvf7Ji1iZC6whIsFVztuyUGJT5LSxxLSGvmBgfOgEH
         0CfXwy4j4AuT7/jArN9H2qzFnlK8+8qSIhYC5R4hztenSI7wWE6VDcd22cS2CTU9XpDT
         CDWQ==
X-Gm-Message-State: AOAM532DyD3wQmnkeLFktKRw7nQKNOsYvnI8LR7GTkN9ZkmRBT3oaKrJ
	P4F8fellhQEIgcHkiF1Iq37mfb7sFxLb7g==
X-Google-Smtp-Source: ABdhPJzVY+U9YtITmDJCqzp7Hht7dgtpI2E3l3pLlJh40wIVuyszXeW0v3Vdko118PcBQNBn7vgcLg==
X-Received: by 2002:a17:902:9b93:b029:d6:d0e3:10c6 with SMTP id y19-20020a1709029b93b02900d6d0e310c6mr9339544plp.41.1604431512878;
        Tue, 03 Nov 2020 11:25:12 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::4b05? ([2601:646:9200:4e0::4b05])
        by smtp.gmail.com with ESMTPSA id w187sm17739619pfb.93.2020.11.03.11.25.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2020 11:25:11 -0800 (PST)
Subject: Re: [OE-core] [PATCH 70/80] rt-tests/hwlatdetect: upgrade 1.8 -> 1.9
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20201102164907.27572-1-alex.kanavin@gmail.com>
 <20201102164907.27572-70-alex.kanavin@gmail.com>
 <f878d465-f694-1bf9-4db7-1b2476a8199e@gmail.com>
 <CANNYZj8hyJoeQkV_GyM7jXZh-8OVSMK=jp3pQ=nHyiFisYRUfA@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <395c85f0-61fe-c39f-fb5d-2aa59f22181e@gmail.com>
Date: Tue, 3 Nov 2020 11:25:10 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj8hyJoeQkV_GyM7jXZh-8OVSMK=jp3pQ=nHyiFisYRUfA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 11/3/20 11:17 AM, Alexander Kanavin wrote:
> Can you send a patch for this please?
> 

thats fine,

Richard,

How does this not get detected in world builds ?

> Alex
> 
> On Tue, 3 Nov 2020 at 19:43, Khem Raj <raj.khem@gmail.com 
> <mailto:raj.khem@gmail.com>> wrote:
> 
>     rt-tests now have added code which only works for x86/x86_64/ppc64 in
>     src/oslat/oslat.c, so either that will need fixing for other arches or
>     limit this recipe to above said arches. see a failure here e.g.
> 
>     https://errors.yoctoproject.org/Errors/Details/511500/
> 
>     On 11/2/20 8:48 AM, Alexander Kanavin wrote:
>      > Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com
>     <mailto:alex.kanavin@gmail.com>>
>      > ---
>      >   ...001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch | 7
>     ++++---
>      >   .../rt-tests/{hwlatdetect_1.8.bb <http://hwlatdetect_1.8.bb> =>
>     hwlatdetect_1.9.bb <http://hwlatdetect_1.9.bb>}    | 0
>      >   meta/recipes-rt/rt-tests/rt-tests.inc                      | 2 +-
>      >   .../rt-tests/{rt-tests_1.8.bb <http://rt-tests_1.8.bb> =>
>     rt-tests_1.9.bb <http://rt-tests_1.9.bb>}          | 0
>      >   4 files changed, 5 insertions(+), 4 deletions(-)
>      >   rename meta/recipes-rt/rt-tests/{hwlatdetect_1.8.bb
>     <http://hwlatdetect_1.8.bb> => hwlatdetect_1.9.bb
>     <http://hwlatdetect_1.9.bb>} (100%)
>      >   rename meta/recipes-rt/rt-tests/{rt-tests_1.8.bb
>     <http://rt-tests_1.8.bb> => rt-tests_1.9.bb
>     <http://rt-tests_1.9.bb>} (100%)
>      >
>      > diff --git
>     a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
>     b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
>      > index c18928ed02..8fd94b176c 100644
>      > ---
>     a/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
>      > +++
>     b/meta/recipes-rt/rt-tests/files/0001-Makefile-Allow-for-CC-and-AR-to-be-overridden.patch
>      > @@ -1,4 +1,4 @@
>      > -From caaa142826504ad0375f9d21c558f10f31305cdb Mon Sep 17
>     00:00:00 2001
>      > +From f89d6d6d23e0dacfd0008f686a457d536edc406a Mon Sep 17
>     00:00:00 2001
>      >   From: Randy Witt <randy.e.witt@intel.com
>     <mailto:randy.e.witt@intel.com>>
>      >   Date: Fri, 16 Oct 2020 16:54:30 -0700
>      >   Subject: [PATCH] Makefile: Allow for CC and AR to be overridden
>      > @@ -9,16 +9,17 @@ commit 7763cf316d7896fa05b816a46998f0827ab6e6eb.
>      >   Signed-off-by: Randy Witt <randy.e.witt@intel.com
>     <mailto:randy.e.witt@intel.com>>
>      >
>      >   Upstream-Status: Inappropriate [other]
>      > +
>      >   ---
>      >    Makefile | 4 ++--
>      >    1 file changed, 2 insertions(+), 2 deletions(-)
>      >
>      >   diff --git a/Makefile b/Makefile
>      > -index 05fc5ed..7a289c8 100644
>      > +index c3ebbd7..2176835 100644
>      >   --- a/Makefile
>      >   +++ b/Makefile
>      >   @@ -1,6 +1,6 @@
>      > - VERSION = 1.8
>      > + VERSION = 1.9
>      >   -CC = $(CROSS_COMPILE)gcc
>      >   -AR = $(CROSS_COMPILE)ar
>      >   +CC ?= $(CROSS_COMPILE)gcc
>      > diff --git a/meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb
>     <http://hwlatdetect_1.8.bb>
>     b/meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
>     <http://hwlatdetect_1.9.bb>
>      > similarity index 100%
>      > rename from meta/recipes-rt/rt-tests/hwlatdetect_1.8.bb
>     <http://hwlatdetect_1.8.bb>
>      > rename to meta/recipes-rt/rt-tests/hwlatdetect_1.9.bb
>     <http://hwlatdetect_1.9.bb>
>      > diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc
>     b/meta/recipes-rt/rt-tests/rt-tests.inc
>      > index 5d28c7e63e..2dd890cf95 100644
>      > --- a/meta/recipes-rt/rt-tests/rt-tests.inc
>      > +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
>      > @@ -1,5 +1,5 @@
>      >   # Version 1.8
>      > -SRCREV = "9f78b91f057e63b0c241012ce36b57168133eefb"
>      > +SRCREV = "21c1df7d2ee199ac619cbb1806a38d15e7e95c09"
>      >   PE = "1"
>      >
>      >   SRC_URI =
>     "git://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest
>     <http://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest>"
>      > diff --git a/meta/recipes-rt/rt-tests/rt-tests_1.8.bb
>     <http://rt-tests_1.8.bb> b/meta/recipes-rt/rt-tests/rt-tests_1.9.bb
>     <http://rt-tests_1.9.bb>
>      > similarity index 100%
>      > rename from meta/recipes-rt/rt-tests/rt-tests_1.8.bb
>     <http://rt-tests_1.8.bb>
>      > rename to meta/recipes-rt/rt-tests/rt-tests_1.9.bb
>     <http://rt-tests_1.9.bb>
>      >
>      >
>      >
>      > 
>      >
> 
