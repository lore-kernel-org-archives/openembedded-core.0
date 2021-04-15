Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
 by mx.groups.io with SMTP id smtpd.web10.1105.1618450244135275680
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 18:30:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OERY10Wl;
 spf=pass (domain: gmail.com, ip: 209.85.219.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f173.google.com with SMTP id 65so24317208ybc.4
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 18:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FXYg5kWnv+KZ6zlpHgoiirAToRxl+ZFYS2XQMZDBuf4=;
        b=OERY10WllJH1p84F39/OSndaI1jbIOY5HM3W5mD1tuYIbHz8dSnaMxbASYREBZ5qXf
         hGwyx3hHklCHV7GzD8KjtbpD3L3gc8g1yzSYMUEd1iDBQji9hpV1GByk1MTNdHS2MO6E
         c204HllFA4oM5H0uyuTkWoLssuOJteZM6YZvkYy2CC1AuLHQZ/qRcGCRWY33pP6tk513
         NXys3CCikqIG+6M47JLBUjsjLHt3wmsxr4Vd4H1PYcm8smJeLVUL4hzkKAI/gzoWSfyC
         MNFst2I6jR5iBK5MST1tKV1PhDQs54mMfqQFIGTAVxP9y93Nh5QTof6mGf7Hm/UBx0Vr
         cKzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FXYg5kWnv+KZ6zlpHgoiirAToRxl+ZFYS2XQMZDBuf4=;
        b=b9cDCwRI+hpRV+s6ZfXMmdUdP/m3PrvQ1X8vBa9DvQHNNq9bz+3HjZlGhC045i1dqx
         Xr3HO/hADOz+r16Ku2xe/NIdRq9RYuwEmFscX880Xp3b+lU+6I6e2P79BPW/9LrcQN/7
         59CB/Znmdm81ZYeKeQ/VC8KP80sloer7wGqE+znrWKcI4YnMUCsxswBaiZoMCE0g3ZER
         ij/sRg6iGx5T1a0wrdOI+6FKSGxdAymLTlgs5tvlcm1GUXLihoea3rmay0iv2uuWXSja
         +1u+t2S0O7dqJ0rWfrQewmUDOCAJFLQ266hD0VvCSy//7Q3k9kUlkErtlo6kMipJ00XW
         dAHA==
X-Gm-Message-State: AOAM533eFAsIS0V3XrUdfWnHHEfx2w6M+Yr0vR3jOmXYiDWTknHNLTYr
	WY6WXQOSdPmc4Fr/ENvZEHCJCcd/JM6CRYPFBfhO5yT1HRA=
X-Google-Smtp-Source: ABdhPJzIU7035yOEkojtZiC7RZeIH1U/YZGkzwNHGHr89qyy5+Vm/oRrv2ZvC9aIjHneICGd66owf0jwhdj61K3gSfk=
X-Received: by 2002:a5b:ec1:: with SMTP id a1mr1017934ybs.369.1618450243365;
 Wed, 14 Apr 2021 18:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210411202746.388822-1-raj.khem@gmail.com> <dd4c72b2aaf48cb7f015030e232bc2641e38f2ef.camel@linuxfoundation.org>
 <CAMKF1spL71KJfmpPT7F09gc=RB8NPgKFRewAtHhj7bFNp-H8Sg@mail.gmail.com>
 <b5a702f99841616420c8d82b013fd91aa0c11d9d.camel@linuxfoundation.org>
 <2fa1da72-593b-a064-5591-f75e571fe11b@gmail.com> <60020db7-baa5-029b-75dc-6bbc6b97fff2@linux.microsoft.com>
In-Reply-To: <60020db7-baa5-029b-75dc-6bbc6b97fff2@linux.microsoft.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Apr 2021 18:30:17 -0700
Message-ID: <CAMKF1sr0t2BqXXLjLCG_WqYHBjUP7Shn-O+QBtNjJJKPNpnE1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] gcc: Upgrade to 10.3.0 bug-fix release
To: Alejandro Hernandez <alhe@linux.microsoft.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 14, 2021 at 2:30 PM Alejandro Hernandez
<alhe@linux.microsoft.com> wrote:
>
> Hey Khem,
>
> In case you're not aware, the Distrodata.test_maintainers fails on this one:
>
> The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
> gcc-source-10.3.0 (/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/recipes-devtools/gcc/gcc-source_10.3.bb)
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2022/steps/14/logs/stdio
>

RP fixed it locally on master-next, is this run with latest
master-next ? if not then perhaps it will be interesting to see if you
can get a run with latest master-next

> Cheers,
> Alejandro
>
>
> On 4/12/21 3:27 PM, Khem Raj wrote:
>
>
>
> On 4/12/21 2:54 AM, Richard Purdie wrote:
>
> On Sun, 2021-04-11 at 16:20 -0700, Khem Raj wrote:
>
> On Sun, Apr 11, 2021 at 3:12 PM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>
>
> On Sun, 2021-04-11 at 13:27 -0700, Khem Raj wrote:
>
> Drop aarch64 backports which are already upstream
> List of bugs fixed is [1]
>
> [1] https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&list_id=298084&resolution=FIXED&target_milestone=10.3
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
> v2: Fix BINV
> v3: Fix maintainer entry to use PV
>      Fix include poison patch which was old version
>
>
> Not sure we can put PV into a maintainer's entry like that as it is in the global
> namespace, it isn't gcc specific.
>
>
> I checked it with bitbake -e and seems to be effective.
>
>
> "bitbake -e" didn't show the correct thing for me so I tweaked the patch
> in master-next.
>
>
> OK but its a bit confusing, here is what master-next shows fot me
>
> % bitbake -e gcc-source-10.3.0 | grep "RECIPE_MAINTAINER="
> RECIPE_MAINTAINER="Khem Raj <raj.khem@gmail.com>"
>
>
>
> I also couldn't get this patch to apply, is it on a branch somewhere?
> ]
>
>
> Its on kraj/gcc11 branch on contrib tree
>
> https://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/gcc11
>
>
> Thanks, I've queued up another test run.
>
> Cheers,
>
> Richard
>
>
> 
>
