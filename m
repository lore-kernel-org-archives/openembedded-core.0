Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36856C433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 19:39:05 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.664.1643053144326748124
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:39:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=frEb5VgN;
 spf=pass (domain: burtonini.com, ip: 209.85.128.42,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f42.google.com with SMTP id
 f202-20020a1c1fd3000000b0034dd403f4fbso128913wmf.1
        for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Jan 2022 11:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m7SyGdNELHwcW3OHxtcbeVA6Qnnaf44WQokMJNoQ7Os=;
        b=frEb5VgN4ZiX/yZYkeQSS5PqpOAQEyHFTc/dfo6mx+5hOTwa2yQ/Al08mCrfKhv012
         Sfjn8CfQ4H7QIzSfO3bWxiw76LknWcXsjLu6lk0JnDd3SVKdvmQBn8TS9CGF11ZYi4Za
         7UuOT+wsO02qO8cGG5knMW2etJ318p/hpkcagLpNgN+5uGdQoJ9rKaZt3deAdD4yqaWe
         d76MpyzvYaHf1Z6VPKJhyG7A6fPvTaQP30P1tsrJ49L8aNJe2Vk/NbNEa1WqUz4TCgFt
         bYfPe3OXSeDUa3eagIXst0bKsJ6NmWJvA4k7lthM3u8+CtFLtJbM6wLPjTXoBB7mmHPl
         wlFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m7SyGdNELHwcW3OHxtcbeVA6Qnnaf44WQokMJNoQ7Os=;
        b=SF1bPw5IZjh+2rFrwibXFfTbEahQy4x3L+8EgXw9s8R76StrfZT7ENajb1K8dJB2Xe
         zl+0ITqU9EUPEdHawVWZe0ITqt0O7a69EraLMcG4cdob5IJjaX4OkDSA2hPFDXJqaieT
         GyU+C2NgQms//oPD1cFSfzcQmi455Z13Xi1pbtkeBClSJJzoqWwrkQKiXtsEQG705F40
         MkGmpPMXJsziIYZY97SdagLMDkeUswJ+DR1ywRBGLhuUDebTNg4TOnfCOBURGsZi6Cky
         p0mY/w2SrFpTjAqvPj9fCs2yxo5rOnuOF0JPnamHem8OPtNX4Pj3z5Nwr7G7HfvgDqUM
         c+4Q==
X-Gm-Message-State: AOAM530jCyhNlU5GWbKkThQEkov4c2cgSJxwMijnxQAXWVYZbljtUh/2
	MY/lak7NaqYd8C4EL23Km1ou7nkQ67YC9CvFKLAIFA==
X-Google-Smtp-Source: 
 ABdhPJyDg9AUQVqpSjV1icZdBNpfUTF7Fa/FGr0uWf3+Vzccr+orc/8H5K5qBzGTCXWFMfcRAL9BSQaVgMzbFDzd5ho=
X-Received: by 2002:a05:600c:3d85:: with SMTP id
 bi5mr3173783wmb.62.1643053142638;
 Mon, 24 Jan 2022 11:39:02 -0800 (PST)
MIME-Version: 1.0
References: <20220124181219.2764108-1-raj.khem@gmail.com>
In-Reply-To: <20220124181219.2764108-1-raj.khem@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Mon, 24 Jan 2022 19:38:51 +0000
Message-ID: 
 <CAAnfSTvR3oeghGh8aDJmGkM2eWvgGqeAyYtvZSd8uOJ0KiYGuQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-dbusmock: Add native recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jan 2022 19:39:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160895

Seems like a workaround for a bad dependency.  Can this be disabled in folks?

Ross

On Mon, 24 Jan 2022 at 18:12, Khem Raj <raj.khem@gmail.com> wrote:
>
> Needed by apps like folks
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
> index e64e343a1e0..4a857eaf5ae 100644
> --- a/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
> +++ b/meta/recipes-devtools/python/python3-dbusmock_0.25.0.bb
> @@ -16,3 +16,5 @@ RDEPENDS:${PN} += "\
>      ${PYTHON_PN}-unittest \
>      ${PYTHON_PN}-xml \
>      "
> +
> +BBCLASSEXTEND = "native"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160891): https://lists.openembedded.org/g/openembedded-core/message/160891
> Mute This Topic: https://lists.openembedded.org/mt/88653359/1676615
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

