Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.13164.1629886813554713302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Aug 2021 03:20:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o/ZH0bsq;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: andrey.z@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id s3so42674356ljp.11
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Aug 2021 03:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NatDKb0P02w459iHdOL9ZwT7s8kM8Difc2uTftlWSVQ=;
        b=o/ZH0bsq3IjYnk7T0PjH57G7Pnxa/tCAzdxT/++oSNywbaypy54qtbuJUOEXVIHh5P
         QmYq0h8pEtdcoq5kEDy5pTElTJrNSwXTg24VTwYt4eCIgzN5eud5d5HbAsrIXggl4yMK
         NHQKvniQgXEZ0qpnFdT+IamC53aBtzNu2PMpaMHEaGRSu+ZJ8aF/whRFzRj1tK5lSy3D
         1u7MRd8l07Gd/Wrrdrr+vLDIg0+suwPFl+6bvM8S1Kdrd1phi2xCgxFgB1dPlGICMdNL
         gt/+BEHvUIO6uJ+3TRX/WtpRgpPIWBW0lvZ2594fdLmApez4+paqeY3xY2GPxk3kB8F1
         tpaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NatDKb0P02w459iHdOL9ZwT7s8kM8Difc2uTftlWSVQ=;
        b=C8YMbDCQwAiEDu4xTh+WYH8xabpY2MW+PuP6RxzxX9fbvMmwz9jFzOK74m5zjUqfIZ
         q0xVjCYlLj5IqAh6BgePvGMjPbPGVSyWDP1zlUrXXmpfDbXuqCDFnPjtmNkGrNql9PJZ
         E0/WpOPuMiQCmvFPj0pMknYspswR+Lz2IaP3KjKZRu32Z/L0v6DDzcPpYGC/YKDuUkLx
         J3n3FJ3I8jkdARPiNbFA2L7IhLDG9Kbj0GR7Vdbt9zDigz4vMCIoJtHEFQtPUTQwxwPF
         gd9YLVue0g+n9+M5y4hc6SiewFLeswUP/owgXmW74XH0sy0OQw9z7fcdWAC27w7sfKW2
         vhNQ==
X-Gm-Message-State: AOAM530VlcAx8luGvUVKzPqOtVz5bPadIR1aDT30UGNwh9ApHF1Ot+3O
	21qYLFfzF52P0BKGeUrvON1AnuGbLbvN3M00/R0=
X-Google-Smtp-Source: ABdhPJyhmS/ctwel7BKyoumsm/5xOT1SaKY8d757PzlRH0GIX8XiZnHEZJOEoAb+gER1MUcKrsan1hSZQU2nN/3VEFM=
X-Received: by 2002:a05:651c:a12:: with SMTP id k18mr14829401ljq.90.1629886808780;
 Wed, 25 Aug 2021 03:20:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210825094106.11829-1-pkj@axis.com>
In-Reply-To: <20210825094106.11829-1-pkj@axis.com>
From: "Andrey Zhizhikin" <andrey.z@gmail.com>
Date: Wed, 25 Aug 2021 12:19:41 +0200
Message-ID: <CAHtQpK7dzG3RPMbPH_5z6-o3p5e0AuLTO+xBW_UX91jSNH7YfA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lttng-modules: Make it build when CONFIG_TRACEPOINTS is not enabled again
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Hello Peter,

On Wed, Aug 25, 2021 at 11:41 AM Peter Kjellerstedt
<peter.kjellerstedt@axis.com> wrote:
>
> Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch was updated
> with the 2.13.0 update (commit 5dad15af), but unfortunately it no longer
> did what it was intended to do.
>
> Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> ---
>  ...fail-if-CONFIG_TRACEPOINTS-is-not-en.patch | 42 +++++++++++--------
>  1 file changed, 25 insertions(+), 17 deletions(-)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch b/meta/recipes-kernel/lttng/lttng-modules/Makefile-Do-not-fail-if-CONFIG_TRACEPOINTS-is-not-en.patch

I guess the patch you've refreshed is not a correct one...

There is another patch introduced by Bruce in the commit 18bf7b0
("lttng-modules: update devupstream to v2.13-rc "), namely
0001-src-Kbuild-change-missing-CONFIG_TRACEPOINTS-to-warn.patch

It make sense to refresh rather that one instead of the Makefile one,
and have it included in the SRC_URI (see discussion in
https://lists.openembedded.org/g/openembedded-core/topic/84950303#154888).

--
Regards,
Andrey.
