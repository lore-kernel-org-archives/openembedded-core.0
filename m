Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BD7C433F5
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 13:38:49 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web10.7034.1641908328405873724
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 05:38:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=q05OgfqI;
 spf=pass (domain: gmail.com, ip: 209.85.208.44,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id m4so25821997edb.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 05:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZR2GN9NgCQ+dTZo0c4zfwavSVrkW4rHNZK+H4w3n/a8=;
        b=q05OgfqIEHDTqVnwsHwipP9JqIxrxf6A8e07PvqX3sYSBLw4waQLDLbQCgE1JL8+1h
         PRGN6NTe2xTdyC+h5oRYoh1vsrQgbaI1OPc+DEzPlraWQgjk74nsP86YH4y963yYdZop
         y0pV0z88mhZZBNA5+d5AmhQJzQWy7GdoMqEfRr9rxnNZ0JdfrdQ+/u9uAz3A8CpOzleB
         73YZD+fFPfS3T/c8XOssdD3oGs0EA9VYaeRseiJ3lnWz4ZEW9/Yk+FGs+pHfAD0HUx+P
         olBNlQ9RPeU9CpuXS10sno4Tbvrt4V+VfPRN/vIk2HN7I+Cg2Oxa/qURHFdzQfUx8qLM
         zo1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZR2GN9NgCQ+dTZo0c4zfwavSVrkW4rHNZK+H4w3n/a8=;
        b=bERqtdw9yyTtJNLI9iatkXoYB582aKB2lASujci9kzWZ7RrY+Akv9LZGMsBEOsXWfB
         3G6OfETkf0ea6FXIFINjx+4jjlr4jWqSJheEhQ85fYO+r6HYsJj80YWCQyae9VIMrQfJ
         YYqEHJiyTQHzv0M2quzWaxRK81jd9/iKNNFPEuDivpDdhUaYTtut1qy8A9qnLkzeVK5Q
         Qat6AOmG88VjdpTEYBUTfIMikHRPy1/0eOR1Ff8uxxNhtj/MBw0rCC8xSI1ieKiKK7QL
         iooxUxnywSONfe1UW92IivEg3GdEhaSO+SfPTyDfP8Fz1dOuFzOx8JvK0ITEB0NWl65B
         Fjsg==
X-Gm-Message-State: AOAM5321iW30k1APu8hzCnIOgJDQnkMsVMXsfeGOTjX1eOODtoindDiU
	OsDqO3ElQSzEm7zz7LsIMRKs1T4a1rs4gvvG5lY=
X-Google-Smtp-Source: 
 ABdhPJwjn7Mq7C3rOeZc7qolampAlyok5ga0zqMTXtupQBb7Ukp56d58X8DTgZYQkojal6xBSe5f1/h/cEFOUP3B9Jc=
X-Received: by 2002:a17:906:5048:: with SMTP id
 e8mr3693555ejk.651.1641908326829;
 Tue, 11 Jan 2022 05:38:46 -0800 (PST)
MIME-Version: 1.0
References: <20220111031616.43536-1-zhe.he@windriver.com>
In-Reply-To: <20220111031616.43536-1-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 11 Jan 2022 08:38:36 -0500
Message-ID: 
 <CADkTA4N1XycXj9xY+LM1iehVzsLA8dQxwg6enyS34nhsHmuXYQ@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto-dev: Set KBRANCH with =
To: He Zhe <zhe.he@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 13:38:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160400

On Mon, Jan 10, 2022 at 10:16 PM He Zhe <zhe.he@windriver.com> wrote:
>
> The "?=" assignment to KBRANCH in kernel-yocto.bbclass is selected prior to
> the one in this recipe and makes it "master" as a result.
>
> Change the KBRANCH assignment back to "=" as how it was done before.
>

Right! I was trying to make the switch way from standard/* to be a bit
more flexible, but didn't notice that master was building, since it is
typically in sync in my local tests.

The change is fine with me.

Bruce

> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto-dev.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto-dev.bb b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> index 80f62a0412..0d94637352 100644
> --- a/meta/recipes-kernel/linux/linux-yocto-dev.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto-dev.bb
> @@ -16,7 +16,7 @@ inherit pkgconfig
>  # provide this .inc to set specific revisions
>  include recipes-kernel/linux/linux-yocto-dev-revisions.inc
>
> -KBRANCH ?= "v5.16/standard/base"
> +KBRANCH = "v5.16/standard/base"
>  KMETA = "kernel-meta"
>
>  SRC_URI = "git://git.yoctoproject.org/linux-yocto-dev.git;branch=${KBRANCH};name=machine \
> --
> 2.17.1
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

