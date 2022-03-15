Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2808DC433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 00:10:04 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web12.4369.1647303002646374395
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 17:10:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=A3rjFMPj;
 spf=pass (domain: gmail.com, ip: 209.85.160.178,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id n11so9010409qtk.4
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 17:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RWqYRIZfdl5MZT++pJmVcGtE3m6jKbA4nar1LpVipeA=;
        b=A3rjFMPjR/VLUJjddiUFO1LfkXwLiZnKW5Jm8DN5g70eW/yWfxISokphtWB2WciWWo
         xyh9KXj08ARRrtXvIAPCg/05BLdNO2Np7+SdP5Dp0Jg2wJ5smySj6iuvuu7HfzZOu1FW
         1jnPomQtdM7jjG9Sd6oF9mLuc32LXren9d8Q4hUM55lG6yDI6ytorrq+Xv9wmqTiUrYy
         e6unj3m+h1gSyf5Ds+DHQNFk5ZEA5Y0pyPOk4UrTlLCNc0A+F3psct+Vc+hs4hthy+oc
         g3ruJD2F0lfrYZG5q+69nK7g3nLy+M+NR3tViUJW/1rk/S3XVCjuqBFarZlTiJpcqpth
         uQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RWqYRIZfdl5MZT++pJmVcGtE3m6jKbA4nar1LpVipeA=;
        b=vTvNNeDwyEU+JnHzqBWj+dTBnAA7JNBT4gN1yt2sMVHSKZQTONDovhkOF2YbjoWjKW
         O/ZOhOxpt2QEUMcOVFh01IjbuEBlPWE/KqyUvCdVPHsRhONfuf7rPLPBodsqRSi2BTfG
         gdoObi+otz5cZsSumpKiLkmQ2t2FFNarse7NH2/Tg6zDuPzNgAT0L3Ri6BvjKjj6pZqD
         kjmIcFvKunuJynNPMNyc9DxkrDEZiFdkZVay9GOAGDS/TWUx9NkN9Aix8rL7O8rtAC8V
         eRQ4+kOQzhLbaJkoE7zZhpF9Q0BsLbJ8tzzOYzr2oOCnfsqxWKE6w8joHKQpfCd9AyJN
         u6Hg==
X-Gm-Message-State: AOAM533i7RT7i0uT6Wnfa/BXQZQn6JZqUSmHwVpmzQGpQWyw1p6PnwFI
	oPkc94ii0RK8iCV9cHC4UyJcAAnm3MvQZo+P1Mw=
X-Google-Smtp-Source: 
 ABdhPJwZkYMn+mc18RWmOMtisFfXfzqTuFvikyPW1gGtGCUg2OvH97Uct2a7AAd5aZWyd8t3RzwZ5iEfNiJq/7UauOQ=
X-Received: by 2002:ac8:5842:0:b0:2e1:aa10:e7cd with SMTP id
 h2-20020ac85842000000b002e1aa10e7cdmr19878378qth.330.1647303001656; Mon, 14
 Mar 2022 17:10:01 -0700 (PDT)
MIME-Version: 1.0
References: <16DC60EA44823A9F.11325@lists.openembedded.org>
 <426ed1452a5cc0c052c0218ce4865bf935e4aac1.camel@linuxfoundation.org>
In-Reply-To: 
 <426ed1452a5cc0c052c0218ce4865bf935e4aac1.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 14 Mar 2022 17:09:35 -0700
Message-ID: 
 <CAMKF1soQUjMeTOvKdfXQYjO93f5ZSx3MKAxhsJLO05dcgdDZ-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 00/33] Add python3-cryptography from meta-oe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Tim Orling <tim.orling@konsulko.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 00:10:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163218

we need to remove all of them from meta-python too.

On Mon, Mar 14, 2022 at 3:54 PM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> It is late in the cycle but is has become apparent that the dependencies we're
> weaving with layers and meta-arm was reaching a point where it wasn't working
> well for anyone. BSPs and hardware layers needing to pull in meta-oe/meta-python
> isn't a good situation. Whilst late, it does seem better to sort this now before
> the LTS ships rather than live with it for much longer.
>
> This series brings in python3-cryptography and it's dependencies to OE-Core,
> bringing everything to the standard needed (maintainers entries, homepages,
> reproducibility), tweaks to match the recent python changes and some ptest
> fixes.
>
> It also namespaces the classes with a python_ prefix since this makes it much
> more obvious in core what area of the system the classes belong to.
>
> Cheers,
>
> Richard
>
>
>
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163200): https://lists.openembedded.org/g/openembedded-core/message/163200
> Mute This Topic: https://lists.openembedded.org/mt/89786369/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

