Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F36FC43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 13:58:18 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web08.38673.1656683894008072896
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h2Z51qHb;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id cs6so4138666qvb.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 06:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SUe/60qDKGfZAOvLmDNiRgrWvtisI3CQhjxaklmm6LY=;
        b=h2Z51qHbfRGuB7W2W5rxy0db3TUQT3mmfATB/7ZW3EsKqaIjMYqUIMi2181ieKcBMP
         8jMQzuL8z1GCebwpuY3I5+L0qZ0mte+3AaHnzxFSRDHkZScwwdgBoobnz8yy62BsG7iK
         FhNbvugU17XDkMdgezuduMvyDx3n2radWM348a2rH8ZGvzbsgokmkz8V/zHDMwAEaAl6
         uuldBxJ5UhBABL3UUECWTkhEuIBQa6zPQY7R5wAJDiZ5bSErYRAfxYjdwXxh76tJS2OY
         1Aa7Bl0cGoxQwoxNi6kCVlIQNbN33rcCKXqUCGYkU7iqBVnBAy7W6GdV3ghnQ+q49pnE
         N74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SUe/60qDKGfZAOvLmDNiRgrWvtisI3CQhjxaklmm6LY=;
        b=63h9bh7WOvnOQeCdZ+Kyw1cHL6P1RUWYYc2CBHU2GHJz0f0ckQPx7NOVlJR3NAvhGX
         ct+7hSWIMVehARSqVFLxw/vAgqSub2NYR2cHXaqnM3tkRgLf9f2mfzNH07lW4kNqtguj
         wWWUs9lhDYt5sGOGmMZsZh8DZ0t2GuHNP7/mQRZZxLu1iaaAM8CyEhT4920MWj8MkoJ5
         FbZs3iCbI4Ns5qx+YniJtWPXvd9kqWjhfWk5+DWnLfV+8tWeE8YcjAbVH3XO/hWqM5FJ
         27Xv9BkGJ9Ael/feWiZpHCX0gOr68lfdOC2+KP7/V/R/36Q8TyRzV1Q56j98bNjxUoiC
         TU/w==
X-Gm-Message-State: AJIora+G7f9mlvKVZfOKtD7quLq/JXxuMO9SVK+1OW6opjJguFiNREXy
	kjZaDAUgq5ANf8/hfV2LXk8eA92KtnXYtXzkYA56R4Li+8w=
X-Google-Smtp-Source: 
 AGRyM1ve7UYm1qa3Frplxs1p6PKdVbmKG8FEeoXlxkh40QYjO+BQSStZ++kes8e3esnO/m+aoabmFCCXDQ4NrYIQ+Bw=
X-Received: by 2002:a0c:a9dd:0:b0:470:9229:66c5 with SMTP id
 c29-20020a0ca9dd000000b00470922966c5mr17454703qvb.63.1656683892921; Fri, 01
 Jul 2022 06:58:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220701134413.99129-1-jose.quaresma@foundries.io>
In-Reply-To: <20220701134413.99129-1-jose.quaresma@foundries.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Jul 2022 09:57:46 -0400
Message-ID: 
 <CAMKF1sqar94+9M_WO+V3eMjxuqVq8PrakX7T7sYJep3-EtfRog@mail.gmail.com>
Subject: Re: [OE-core][PATCH]] Update to 7.84.0
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 13:58:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167470

subject is missing recipe name.

On Fri, Jul 1, 2022 at 9:44 AM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/recipes-support/curl/{curl_7.83.1.bb => curl_7.84.0.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/curl/{curl_7.83.1.bb => curl_7.84.0.bb} (97%)
>
> diff --git a/meta/recipes-support/curl/curl_7.83.1.bb b/meta/recipes-support/curl/curl_7.84.0.bb
> similarity index 97%
> rename from meta/recipes-support/curl/curl_7.83.1.bb
> rename to meta/recipes-support/curl/curl_7.84.0.bb
> index 1d9de29a65..ade2846a64 100644
> --- a/meta/recipes-support/curl/curl_7.83.1.bb
> +++ b/meta/recipes-support/curl/curl_7.84.0.bb
> @@ -10,7 +10,7 @@ LICENSE = "MIT-open-group"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=190c514872597083303371684954f238"
>
>  SRC_URI = "https://curl.se/download/${BP}.tar.xz"
> -SRC_URI[sha256sum] = "2cb9c2356e7263a1272fd1435ef7cdebf2cd21400ec287b068396deb705c22c4"
> +SRC_URI[sha256sum] = "2d118b43f547bfe5bae806d8d47b4e596ea5b25a6c1f080aef49fbcd817c5db8"
>
>  # Curl has used many names over the years...
>  CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
> --
> 2.37.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#167469): https://lists.openembedded.org/g/openembedded-core/message/167469
> Mute This Topic: https://lists.openembedded.org/mt/92109630/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

