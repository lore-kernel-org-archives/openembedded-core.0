Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531B8C433F5
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 20:38:52 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com
 [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web12.770.1644439131431152097
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 12:38:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CoEFPGjv;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id a28so2794694qvb.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 12:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3g644IISTAAQs5EyLwOiV+5RKYT5knKxs+dIWQaulyE=;
        b=CoEFPGjvXIbItCtAfcnbKJQOvTwU9uEMaHHmi6nbxUJ4176ByuK6HBsOJjwVjQLOn4
         FpHNztGZVrcFM+OJdwzn3GSDXlKyBilc2bBZ9fY4XNqZ82i9e87sn/L2zEM7OIiCcX+5
         /WpO/lPyscLbGLgG0kHaNkx82AwOHW5Vy6pWjjXbbE4wIbTUxZUSPFY487+NRpT2vmAI
         aXW0owB+EWLl10Mp6QSukjsMSZMpqvFMdqTw7dVl7AWIpfo7spwNsvTFHQiC6IHFpKIP
         JCB+Pq9MjLaYj3f2SxEl8x5leqsp4XBQpz0dYYO/wlN3sRjk4gnSKrI3JaELSCw0uswk
         JaRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3g644IISTAAQs5EyLwOiV+5RKYT5knKxs+dIWQaulyE=;
        b=DVsbgfvmrVZtovprxlawBsn/XHMdDG93MalaN0fadrhYkbUTm5+vfijSn2Q14+2/N1
         ePutYkhsrw9LO54x5etlqHF6Bj7CoPU7Gb75BO06HaiDoYBj9og3S/CJR3vNSTiITcmV
         9gKxIgdWXL/eI1PLUulOaO4VM7jt8nHxMztm6N8LU/sdpqx1kaN+qIzcRvt6JUL3wr3q
         RgPBB2wfKwpeq16DLkVtKbLWxrgj6JIRoleCZ3v+E6nAX9HislO6BYpU8K33QEc/IhhY
         7BXqocDg1VorvQKjQeBaS/2Ft8EV4wiZy8phqZhi6wVzMdUXmTwsoWIoVXlIzFg4IdIt
         qm+Q==
X-Gm-Message-State: AOAM530TJNkLhV8tlaQ+9NjvBw3OUVcRHAezPzfxVoiOS4JiGgjH5mTq
	W5Tl9Abr0I2coEjbnLAbvN+snTzaq3tnPOj/YHY=
X-Google-Smtp-Source: 
 ABdhPJyW8UNqsW2e6aV9Geo+tVsTDAv+iM5JWQyCEossER2kxOJR7oxUjNnl/HHqa7I5Wu36JQ/i43CfR+VCuWG2aEo=
X-Received: by 2002:ad4:576f:: with SMTP id r15mr2893410qvx.16.1644439130453;
 Wed, 09 Feb 2022 12:38:50 -0800 (PST)
MIME-Version: 1.0
References: <1644308922-5558-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1644308922-5558-1-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Feb 2022 12:38:23 -0800
Message-ID: 
 <CAMKF1spW5Go=vUSje2h+V+G9wGFTe3ypax9gg6f2uNkDqAViZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] man-db: upgrade 2.9.4 -> 2.10.0
To: wangmy <wangmy@fujitsu.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 20:38:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161589

This is failing on musl see
https://errors.yoctoproject.org/Errors/Details/624476/

On Tue, Feb 8, 2022 at 12:29 AM wangmy <wangmy@fujitsu.com> wrote:
>
> License-Update:
> ==============
>  COPYING : "GNU Library" changed to "GNU Lesser"
>          format changed
>  COPYING.LIB : "51 Franklin St" changed to "51 Franklin Street"
>                format changed
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../man-db/{man-db_2.9.4.bb => man-db_2.10.0.bb}            | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-extended/man-db/{man-db_2.9.4.bb => man-db_2.10.0.bb} (90%)
>
> diff --git a/meta/recipes-extended/man-db/man-db_2.9.4.bb b/meta/recipes-extended/man-db/man-db_2.10.0.bb
> similarity index 90%
> rename from meta/recipes-extended/man-db/man-db_2.9.4.bb
> rename to meta/recipes-extended/man-db/man-db_2.10.0.bb
> index f97974abb8..6a8ac2e3e3 100644
> --- a/meta/recipes-extended/man-db/man-db_2.9.4.bb
> +++ b/meta/recipes-extended/man-db/man-db_2.10.0.bb
> @@ -2,13 +2,13 @@ SUMMARY = "An implementation of the standard Unix documentation system accessed
>  HOMEPAGE = "http://man-db.nongnu.org/"
>  DESCRIPTION = "man-db is an implementation of the standard Unix documentation system accessed using the man command. It uses a Berkeley DB database in place of the traditional flat-text whatis databases."
>  LICENSE = "LGPLv2.1 & GPLv2"
> -LIC_FILES_CHKSUM = "file://docs/COPYING.LIB;md5=a6f89e2100d9b6cdffcea4f398e37343 \
> -                    file://docs/COPYING;md5=eb723b61539feef013de476e68b5c50a"
> +LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
> +                    file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
>  SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/man-db/man-db-${PV}.tar.xz \
>             file://99_mandb \
>             file://man_db.conf-avoid-multilib-install-file-conflict.patch"
> -SRC_URI[sha256sum] = "b66c99edfad16ad928c889f87cf76380263c1609323c280b3a9e6963fdb16756"
> +SRC_URI[sha256sum] = "0a8629022f7117dc7fc6473c6fdb14913b24b106059bb056abee87dbd6070c79"
>
>  # remove at next version upgrade or when output changes
>  PR = "r1"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#161485): https://lists.openembedded.org/g/openembedded-core/message/161485
> Mute This Topic: https://lists.openembedded.org/mt/88992456/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

