Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29D6C433EF
	for <webhook@archiver.kernel.org>; Fri, 28 Jan 2022 02:10:34 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com
 [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web10.1903.1643335833860615837
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 18:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QylkWFK+;
 spf=pass (domain: gmail.com, ip: 209.85.160.173,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id b5so4071739qtq.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 18:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=crBIsfMvdyko9ABYRaN9lg9FpNN1twhPEKo7EzpLIb4=;
        b=QylkWFK+yyu6cWPNNyTRF/1GbYdZDbik7O6ERkEW7zRHQ5nYVkAn6FSLz4xIRHyL2E
         eTrV25LKVstIEfHO+SXmIDEoFo8xr/IGE1WyjlKlNlRbDghfxjH9oN/Lus9Rw7wy8tMA
         WWiCpzJoHLIKrbVApK7QWt7RTgVVDv2ERWQC3nZFD9PsD7xXH6HpLMYEjtsVHBaxogpR
         FCQgpFS/XmIL4g+a+IQkIVfN2z9ZbkxTK2KT6Df450hOLgMXBX9H/rzfmMG+zGkds5gD
         VH9YfWs3XTYKgSiAEWgcyVCjF0VpCs4Nt5A2UIwFwZzD+9ryTmO0gPynbAiPC5w+LC9t
         xIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=crBIsfMvdyko9ABYRaN9lg9FpNN1twhPEKo7EzpLIb4=;
        b=N+v1lDi9qNpxf8c/o9kLhRNGld/JWncqdqhlnxzyPpattRA0smyg2syvE55WeKoMok
         J3jc95HV9yj/aXBKaqF3UxUsNZDYtNVyo2K2uJnhjAlSCH5H9l/B7gECC1NmkOAxcixR
         HZp2q8+Nf1Wqfs55+R59UGV0XtJDCB9jTYOWg7+ZqA4EHIjNObx6ZcVTcn769c5b5gB9
         3YSV+B+g6x2hUATLQL5p3u/vwe1bFLgrcmVBbyyHg8ocIkiGUKFkATnN49TpjiHTCs8U
         TOjuftRTBYRqGoR0NLrOT24PJKxw3hfOS5BViiYb563JgSXUcxkjphifNtQLknnM+WSV
         hlOA==
X-Gm-Message-State: AOAM530kF4bxSIWJc5nKmaRQ/U8mz+Zyi437f6ZZs3z4mVmnmkW0BXtg
	jRrv6hxnomhMt4RNKqBKUqweT1L2Knz59v5HUD0=
X-Google-Smtp-Source: 
 ABdhPJxjl8jwQkzGQwpFfVAa8D7tSWl9rxio3kO3wAxZK7BZJi02mUQtorWQNu4X+wNX0Zrp3Ys0VAcUsc8A9Aia+28=
X-Received: by 2002:a05:622a:1a99:: with SMTP id
 s25mr4768406qtc.634.1643335832827;
 Thu, 27 Jan 2022 18:10:32 -0800 (PST)
MIME-Version: 1.0
References: <20220128014022.3144694-1-alejandro@enedino.org>
In-Reply-To: <20220128014022.3144694-1-alejandro@enedino.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Jan 2022 18:10:06 -0800
Message-ID: 
 <CAMKF1sp0RjKegHg6nRFW_NSEk+q+ErA78=n9yAjVkocTdeuomg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] newlib: Upgrade 4.1.0 -> 4.2.0
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Jan 2022 02:10:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161065

On Thu, Jan 27, 2022 at 5:40 PM Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>  .../newlib/{libgloss_4.1.0.bb => libgloss_4.2.0.bb}  |  0
>  meta/recipes-core/newlib/newlib.inc                  | 12 +++++++++---
>  .../newlib/{newlib_4.1.0.bb => newlib_4.2.0.bb}      |  0
>  3 files changed, 9 insertions(+), 3 deletions(-)
>  rename meta/recipes-core/newlib/{libgloss_4.1.0.bb => libgloss_4.2.0.bb} (100%)
>  rename meta/recipes-core/newlib/{newlib_4.1.0.bb => newlib_4.2.0.bb} (100%)
>
> diff --git a/meta/recipes-core/newlib/libgloss_4.1.0.bb b/meta/recipes-core/newlib/libgloss_4.2.0.bb
> similarity index 100%
> rename from meta/recipes-core/newlib/libgloss_4.1.0.bb
> rename to meta/recipes-core/newlib/libgloss_4.2.0.bb
> diff --git a/meta/recipes-core/newlib/newlib.inc b/meta/recipes-core/newlib/newlib.inc
> index 23cd172008..5e488d0848 100644
> --- a/meta/recipes-core/newlib/newlib.inc
> +++ b/meta/recipes-core/newlib/newlib.inc
> @@ -15,13 +15,19 @@ LIC_FILES_CHKSUM = " \
>                 file://newlib/libc/sys/linux/linuxthreads/LICENSE;md5=73640207fbc79b198c7ffd4ad4d97aa0 \
>                 "
>
> -SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}.tar.gz"
> -SRC_URI[sha256sum] = "f296e372f51324224d387cc116dc37a6bd397198756746f93a2b02e9a5d40154"
> +# Newlib maintainers sometimes publish the source
> +# from a specific snapshot, after an upgrade we can
> +# delete the following line and keep the empty default
> +NEWLIB_SNAPSHOT = ".20211231"

hmmm so its not 4.2.0 release yet ?
maybe just rename the recipe accordingly ?

> +NEWLIB_SNAPSHOT ?= ""
> +SRC_URI = "https://sourceware.org/pub/newlib/newlib-${PV}${NEWLIB_SNAPSHOT}.tar.gz"
> +SRC_URI[sha256sum] = "c3a0e8b63bc3bef1aeee4ca3906b53b3b86c8d139867607369cb2915ffc54435"
> +
>
>  INHIBIT_DEFAULT_DEPS = "1"
>  DEPENDS = "virtual/${TARGET_PREFIX}gcc"
>
> -S = "${WORKDIR}/newlib-${PV}"
> +S = "${WORKDIR}/newlib-${PV}${NEWLIB_SNAPSHOT}"
>  B = "${WORKDIR}/build"
>
>  ## disable stdlib
> diff --git a/meta/recipes-core/newlib/newlib_4.1.0.bb b/meta/recipes-core/newlib/newlib_4.2.0.bb
> similarity index 100%
> rename from meta/recipes-core/newlib/newlib_4.1.0.bb
> rename to meta/recipes-core/newlib/newlib_4.2.0.bb
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161064): https://lists.openembedded.org/g/openembedded-core/message/161064
> Mute This Topic: https://lists.openembedded.org/mt/88736577/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

