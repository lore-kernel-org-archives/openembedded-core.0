Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E33E8ECAAA1
	for <webhook@archiver.kernel.org>; Tue,  6 Sep 2022 10:59:24 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web08.2640.1662461962990700310
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 03:59:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GD9t7wnt;
 spf=pass (domain: gmail.com, ip: 209.85.208.179,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id x10so11864782ljq.4
        for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Sep 2022 03:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=FeLVb9FxM3bAvv9Mx6rYyN19n/bcgO1bwAGE+9dd8KA=;
        b=GD9t7wntPHX2zRHhAXGA8oGjbn3LuYo7c/ACkunupqGotZh243DlS4rNwUNWxC33Kg
         JG8SssYKGdFP1zm9kkuOLXskIOELfvAr+6UANgnb28Q6TZ5862rt44v8BY9QBJGoHWAX
         uz5MdcFZkEau6iOHE5DBT6o4kZcx2D/Q7WuNCVFex2Xw31FSqIBUjHQUEOTH1lNtKpx7
         126BJUDetG+khFwczD3jJJVUqBH/vqppCRqiJMbmhOJ/+AM7AViEJwhN9N26+UcmDqGP
         d4QDnkWwxF6RRPi2YHBtgBKD+me06Xx9X80EHCYjufrFSZ4vkwCHPZ1RlwLkfBy8F4Ht
         PCag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=FeLVb9FxM3bAvv9Mx6rYyN19n/bcgO1bwAGE+9dd8KA=;
        b=4yhg4NEP5sRp2qmBZ/xLYr/P1oO0UpqxII3LYZNPQ5UuyyMs1ygP8d5N5X2wxnch1j
         pLROquFevFa3rBj1Xf9z3Zs//9dtzBxatkzXdHpkAW2B1ycf4TJJj6s2H/zvL+X9dxls
         1jZaE9O4d/E4Bq/WNowAeCmOZLGKWsvpuG/etqGFv/FaPZyLftrWaGgUQmFicnaeCfi2
         YO6Et6+c1jjwvKfAS/wEH/G6nucKOrf6xfqy3hs2562lmnEcXjvspY9ihnYVZmdD82sd
         wqxhxqWUjFq6T5SyviIPA+/I9dcGvA9R74EYcBTddF7rqKaklNvUbCbomnEu14wJU2FK
         RzhQ==
X-Gm-Message-State: ACgBeo1fsvr/4R9s0cG0FRft1A/vpNMMhG8Fbp8Cj1ggmn9o8UbV/jJa
	mK7jsxLedl34GmBDmzI3hxzzi9orUPoLAN/GiXw=
X-Google-Smtp-Source: 
 AA6agR6ZXa40kADRUv94RLOwQ/BVAJjE+KfDxf+PlgkQlcr16SKuZ6Dh/tUPLxowG7m/lXoWSv5jLZnw9ngyQyPYqiw=
X-Received: by 2002:a2e:161d:0:b0:264:87b0:fc7e with SMTP id
 w29-20020a2e161d000000b0026487b0fc7emr12978178ljd.191.1662461960886; Tue, 06
 Sep 2022 03:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220906103614.37073-1-joshua.downer@gmail.com>
In-Reply-To: <20220906103614.37073-1-joshua.downer@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 6 Sep 2022 12:59:09 +0200
Message-ID: 
 <CANNYZj8sQCyaBeGPs7vdDWY4GFWijy5LGV+MMaTV+gnX-h3CcQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] scripts/oe-oe-buildenv-internal: add SCRIPTSDIR
To: Joshua Downer <joshua.downer@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Sep 2022 10:59:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170344

Can you explain the use case please? I'm not sure this should be added
to core if there are no uses or examples or tests for it.

Alex

On Tue, 6 Sept 2022 at 12:36, Joshua Downer <joshua.downer@gmail.com> wrote:
>
> The addition of the SCRIPTSDIR variable allows the user to customize the
> location of the scripts/ directory. The default remains $OEROOT/scripts.
>
> Signed-off-by: Joshua Downer <joshua.downer@gmail.com>
> ---
>  scripts/oe-buildenv-internal | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/oe-buildenv-internal b/scripts/oe-buildenv-internal
> index 485d4c52e1..564b7c8b55 100755
> --- a/scripts/oe-buildenv-internal
> +++ b/scripts/oe-buildenv-internal
> @@ -77,6 +77,11 @@ if [ -z "$BITBAKEDIR" ]; then
>      test -d "$BITBAKEDIR" || BITBAKEDIR="$OEROOT/../bitbake$BBEXTRA"
>  fi
>
> +if [ -z "$SCRIPTSDIR" ]; then
> +    SCRIPTSDIR="$OEROOT/scripts"
> +fi
> +
> +SCRIPTSDIR=$(readlink -f "$SCRIPTSDIR")
>  BITBAKEDIR=$(readlink -f "$BITBAKEDIR")
>  BUILDDIR=$(readlink -f "$BUILDDIR")
>  BBPATH=$BUILDDIR
> @@ -93,7 +98,7 @@ PYTHONPATH=$BITBAKEDIR/lib:$PYTHONPATH
>  export PYTHONPATH
>
>  # Make sure our paths are at the beginning of $PATH
> -for newpath in "$BITBAKEDIR/bin" "$OEROOT/scripts"; do
> +for newpath in "$BITBAKEDIR/bin" "$SCRIPTSDIR"; do
>      # Remove any existences of $newpath from $PATH
>      PATH=$(echo $PATH | sed -re "s#(^|:)$newpath(:|$)#\2#g;s#^:##")
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#170342): https://lists.openembedded.org/g/openembedded-core/message/170342
> Mute This Topic: https://lists.openembedded.org/mt/93497736/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

