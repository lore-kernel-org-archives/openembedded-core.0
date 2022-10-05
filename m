Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A13C433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 03:05:02 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web08.19505.1664939100254137044
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 20:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=f9GOu71B;
 spf=pass (domain: gmail.com, ip: 209.85.167.179,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f179.google.com with SMTP id s192so2140891oie.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 20:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=VhiNxRf6DQwXW9ch5sIbd3YFDJl0Ew4BTh5cqeOodVc=;
        b=f9GOu71BPzy0qQioofjwxLM/JmDjxarqQUq6Eu4y3E9jD/dKzO8JDc+l99+6PWdjKG
         9eLigJspq4JQUedveVhWFDvJUfUFVB+gG9VXYk9T84B28obW67G0zST5FA+k/FhXEobu
         Yc6FNewCFMByHAWb2DE2ymlOIoosYbvyY+2QCAiTmNWt+sWY01Ju6u6jUbL6vydkw6dF
         dOkzrLyygGy9dBu+KzQai17YEuvsJRVrDWrbUmKgncyAwVuV7/hdEpCLjRsUQg0U55B2
         Q8UscoK9ZFm7c1nU2xPFia8rvwb4Wnoc285HrdDYMy8xL3C0oXK5FXW+dTDUKFRCtc7Y
         DU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=VhiNxRf6DQwXW9ch5sIbd3YFDJl0Ew4BTh5cqeOodVc=;
        b=rmV8MR8iKzlYBDNHin8cJQ3HrbRVAb+uSh5KGsK7wqwH7ap5ksrS9qEKcP7qJ0YQbh
         1xJHqPcPW19I7e6gCLwTIEcCgovzaLbjFgbjruHjIIQGfvF35IvJaR76oHSWEDqQ3Buz
         wDP+z/HhbqqQupkDoxMx8/XmeemCshFzcsNuKRkADqlM1Ej1bS8iADW+cna2ECmdDgEW
         Wvw+bgua8c5w5D1B2/yTlkbwPa6sB0B2lFqNIaibcEKvJv3EUY7qhbsOFwa9wSdT37Og
         YGoYf2sYMXRAjOjFmoakMKnGotxDfSv57Ie9VPUvEh+ket6LVXaszjTOCLo9ELJ3sh8J
         qOMA==
X-Gm-Message-State: ACrzQf13mgs1CV4m+iNQRg6kjGieePczAbcGw4KsWkU5pg002LyTJS2H
	hgdOC7U0u7bx8QHhaEt1j6/A3HM6h24QJ/UW+qIqVGfH0jSFuQ==
X-Google-Smtp-Source: 
 AMsMyM4J0gjSwSAR1ye0EBcVw6ij90sehExHcQt0+rH3hsDITYCDCNM3spZne8HjrrwgqGd8s554PHRVC1oQjyumu0M=
X-Received: by 2002:aca:1b0f:0:b0:353:f306:198b with SMTP id
 b15-20020aca1b0f000000b00353f306198bmr951589oib.96.1664939099377; Tue, 04 Oct
 2022 20:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <20221005025625.64000-1-joel@jms.id.au>
In-Reply-To: <20221005025625.64000-1-joel@jms.id.au>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 4 Oct 2022 23:04:48 -0400
Message-ID: 
 <CADkTA4O+S5yOgz+gbpnGP5pkPL-ZoTdcDLJqn-_388SHnuVqkg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] perf: Depend on setuptools
To: Joel Stanley <joel@jms.id.au>
Cc: openembedded-core@lists.openembedded.org, openbmc@lists.ozlabs.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 03:05:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171438

I sent this change a few hours ago, along with lttng fixes for 6.x.

Cheers,

Bruce

On Tue, Oct 4, 2022 at 10:56 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Linux 6.0 requires setuptools for building the perf Python bindings.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  meta/recipes-kernel/perf/perf.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/perf.bb
> index edb133515423..c87880b2c14c 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -48,7 +48,7 @@ PROVIDES = "virtual/perf"
>  inherit linux-kernel-base kernel-arch manpages
>
>  # needed for building the tools/perf Python bindings
> -inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native', '', d)}
> +inherit ${@bb.utils.contains('PACKAGECONFIG', 'scripting', 'python3native setuptools3', '', d)}
>  inherit python3-dir
>  export PYTHON_SITEPACKAGES_DIR
>
> --
> 2.35.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171437): https://lists.openembedded.org/g/openembedded-core/message/171437
> Mute This Topic: https://lists.openembedded.org/mt/94128875/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

