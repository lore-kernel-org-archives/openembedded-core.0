Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.1533.1615508392397243615
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Mar 2021 16:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OlDrD+Sf;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id f12so2586216qtq.4
        for <openembedded-core@lists.openembedded.org>; Thu, 11 Mar 2021 16:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LWti7cXV/E0iBhNsuxFIZRirMT4U2dSUXH/Osn9Mris=;
        b=OlDrD+SffJw515oJnHs1oZD+9Yv3HghT76Qt63ZxaY+T2PJ/qtOxlbMdy1zASrbZ3n
         7WulUvuQHhrJtz3iYx74HjZ5l5m6FFJlGDgt+pYAzyCm+TkO5SwUfRyeAouFz3eCddvr
         NByArkDaD/qVZqHnj9/au2e/gaxItqA8JblGxjIGD4o8L7AZmoBpclvoQERC1a2ByFZY
         WiHUdtJdDcQYZVaJ6RVfaHTFcFz2EX/7PTXtgq4xMaixB0oQK5x8viYtJeNhRFtesOV0
         uuS9HEY7AlhfHInR5pufXq8DCLMRJVI7ozATTwkMpHqHU0z4ODC+BgYEayOaDMnCuXm2
         hdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LWti7cXV/E0iBhNsuxFIZRirMT4U2dSUXH/Osn9Mris=;
        b=PDhtM1+0W+jT5vV7oZWGb7D2dI8TyQGRsq2XavYS1tjlMDZ/l7YmJuA5Ec43/sSe56
         rKsYfthVn7BXfMkNf1FF7rejM/vziO2g1zH15TM1Z5chtLmtptzvq15bGgE4EehxqLAp
         krSrthPF5v6MIfO1OI8q9+MCZAWNhnsPx2aGRaQ5H+OzZYOUaWuIyP/rJHrpF1iodnlo
         6sdOkX82gxL6iFzM6gBL1z49txFjok/H1Sr2mqHw56okVhlsEfyunjsHhmA+wdI5i1Bk
         rvejvuxj63Gq+DmqD7UvsuNWrdG+FGT+4LHBM6KWTKAKUU7yc24LFPFtr0mpMJw/Hkzp
         ZA0A==
X-Gm-Message-State: AOAM530kVZSdWJBpk2qjp8Yb89JLbh804lBKlBbIKsg4wqECxPex3844
	vwy0sNnYYuxqNHLqURzxA0Zmz6pw8jDpuWa7oVwuJ3zcRuk=
X-Google-Smtp-Source: ABdhPJzPw+/3Sv9a/m9t6dGpwEh4advBjI78PFRb0RL3tpSiGtOV55cv3sctgMUr4HaO56RzUT8q36I3a8ZTHCo7tac=
X-Received: by 2002:ac8:4b6d:: with SMTP id g13mr9729507qts.369.1615508391441;
 Thu, 11 Mar 2021 16:19:51 -0800 (PST)
MIME-Version: 1.0
References: <1615507876-7478-1-git-send-email-wangmy@cn.fujitsu.com> <1615507876-7478-2-git-send-email-wangmy@cn.fujitsu.com>
In-Reply-To: <1615507876-7478-2-git-send-email-wangmy@cn.fujitsu.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 11 Mar 2021 16:19:25 -0800
Message-ID: <CAMKF1soJAk5UQxHP+M2LW1uBiPB600vgWLbhsPWMZf+oFjWuEQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libmc: use update-alternatives for sha1.h
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 11, 2021 at 4:11 PM Wang Mingyu <wangmy@cn.fujitsu.com> wrote:
>
> czmq also uses the doc 'sha1.h'.
>
> czmq has a priority of 60.
>

I replied to associated patch you sent to oe-devel. We should do it differently.

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta/recipes-support/libmd/libmd_1.0.3.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/recipes-support/libmd/libmd_1.0.3.bb b/meta/recipes-support/libmd/libmd_1.0.3.bb
> index 2e6762e490..19773633f7 100644
> --- a/meta/recipes-support/libmd/libmd_1.0.3.bb
> +++ b/meta/recipes-support/libmd/libmd_1.0.3.bb
> @@ -14,3 +14,9 @@ SRC_URI[sha256sum] = "5a02097f95cc250a3f1001865e4dbba5f1d15554120f95693c0541923c
>  inherit autotools
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +inherit update-alternatives
> +
> +ALTERNATIVE_PRIORITY = "100"
> +ALTERNATIVE_${PN}-doc = "sha1.h"
> +ALTERNATIVE_LINK_NAME[sha1.h] = "${includedir}/sha1.h"
> --
> 2.25.1
>
>
> 
>
