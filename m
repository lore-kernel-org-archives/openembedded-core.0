Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.web10.6733.1616262389581366178
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 10:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F0bZ7QFQ;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id by2so6659309qvb.11
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 10:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3xX0VNTrhk4pPn4IumBqNSvi1nEhetnot9psRFh/Q74=;
        b=F0bZ7QFQJeaCMgYwKB1Zx666lXM4jdqY/Cx18XkpdkZa7SrVJG3v96MuJ2Zu/F06IP
         ISmlvKlFQRfep5Cu5fXPrpFcvBafP77EE9eL7dR5x90aX7MEK6wOJHgdSkhmUGAwil3s
         DlSRWoAMHG2XasoLPbF/fJF9mNvrx4/15EsWoGWijx5EdWQGUzT/Yu5a/7lTxvXUEcQT
         H1B73xYXi3nvoQrKKOyVQskj9GQP7i2yDB5e7uPY8uQYL73DVXWK6Ov3ls/h6kabkv1U
         huAM8qT0xJaaGyVOiiLx6TzKZ9RAczeO06s3Y+ibv/IyGQQiKEGNZAwKJdDXZ6ztOZ93
         Wsbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3xX0VNTrhk4pPn4IumBqNSvi1nEhetnot9psRFh/Q74=;
        b=cd3yB70cbvrqwxQDbfb08awqZaRjMGXnzrmb5g/zwa4ki37z8BxLU2N5f51ltB6Ip2
         CRg1U6N3qdOHl/TtMFjJz3oYJdzuJ3JAB98voSNe6iPvTB+Og4cfbeulApO78qftOIWX
         RD58U/re2WRA5fD21m2n/wKVo+1ps1tUceMK4nYMdIHvl12m2eJPal3AZy1DPW4QVf88
         ew8DNnD3uSJocpCq0544kcT4tffiJvoUI/s03WJYJ65fGVDSmniQKG6I2DGt7pXEzzrZ
         hDognKmAxpI/Q9gvSPGJxPBLQAzBHpeFcfmJCCBkb+tlXeVO1k0agLT6bAhYOWpyZIiU
         4M4Q==
X-Gm-Message-State: AOAM530ciZq8kmEXIHQUe/GwBUgJt75MfI3ysFWkw8oSBAn4SSG+jVjY
	nXkpnPgwktBEhxFyONTDfMQHuBzgpSzMGfdEhGQ=
X-Google-Smtp-Source: ABdhPJwqinSWPCjpS4P0NK7u4FsTHsscKxlBES3yTkevO5PaZLU2aTli0dtwHVjYwBHiQS6o6jNxHbrzxcK5D5v6wLw=
X-Received: by 2002:a05:6214:f27:: with SMTP id iw7mr2437481qvb.50.1616262388673;
 Sat, 20 Mar 2021 10:46:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210320173124.890-1-anbelski@linux.microsoft.com>
In-Reply-To: <20210320173124.890-1-anbelski@linux.microsoft.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 20 Mar 2021 10:46:02 -0700
Message-ID: <CAMKF1srdMNAN=0Q1jn7zu0iSrvbzzS6gF_kY14H+c2KciQyBGg@mail.gmail.com>
Subject: Re: [OE-core] [gatesgarth][PATCH] glibc: Pull latest 2.32 HEAD
To: Anatol Belski <anbelski@linux.microsoft.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

looks ok

On Sat, Mar 20, 2021 at 10:31 AM Anatol Belski
<anbelski@linux.microsoft.com> wrote:
>
> New commits:
>
> $ git log --format="%h %s" df31c7ca927242d5d4eee97f93a01e23ff47e332..f84949f1c4bbf20e6a1d9a5859cf012cde060ede
> f84949f1c4 powerpc64: Workaround sigtramp vdso return call
> 5e43566f0f nscd: Fix double free in netgroupcache [BZ #27462]
>
> Note also that additionally CVE-2021-3326 has been whitelisted as it was
> already present in the previous state.
>
> Signed-off-by: Anatol Belski <anbelski@linux.microsoft.com>
> ---
>  meta/recipes-core/glibc/glibc-version.inc | 2 +-
>  meta/recipes-core/glibc/glibc_2.32.bb     | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-version.inc b/meta/recipes-core/glibc/glibc-version.inc
> index 586b2e207e..84d199bb1d 100644
> --- a/meta/recipes-core/glibc/glibc-version.inc
> +++ b/meta/recipes-core/glibc/glibc-version.inc
> @@ -1,6 +1,6 @@
>  SRCBRANCH ?= "release/2.32/master"
>  PV = "2.32"
> -SRCREV_glibc ?= "760e1d287825fa91d4d5a0cc921340c740d803e2"
> +SRCREV_glibc ?= "44b395932961a29825da4ad025124a6760858d9c"
>  SRCREV_localedef ?= "bd644c9e6f3e20c5504da1488448173c69c56c28"
>
>  GLIBC_GIT_URI ?= "git://sourceware.org/git/glibc.git"
> diff --git a/meta/recipes-core/glibc/glibc_2.32.bb b/meta/recipes-core/glibc/glibc_2.32.bb
> index e4fe9b87b5..03aea52508 100644
> --- a/meta/recipes-core/glibc/glibc_2.32.bb
> +++ b/meta/recipes-core/glibc/glibc_2.32.bb
> @@ -2,7 +2,7 @@ require glibc.inc
>  require glibc-version.inc
>
>  # whitelist CVE's with fixes in latest release/2.32/master branch
> -CVE_CHECK_WHITELIST += "CVE-2019-25013 CVE-2020-10029 CVE-2020-27618"
> +CVE_CHECK_WHITELIST += "CVE-2019-25013 CVE-2020-10029 CVE-2020-27618 CVE-2021-27645 CVE-2021-3326"
>
>  DEPENDS += "gperf-native bison-native make-native"
>
> --
> 2.17.1
>
>
> 
>
