Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB6DC433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Mar 2022 08:08:47 +0000 (UTC)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by mx.groups.io with SMTP id smtpd.web09.6059.1646726926031928869
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 00:08:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KV0bYIZQ;
 spf=pass (domain: gmail.com, ip: 209.85.208.177,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lj1-f177.google.com with SMTP id 25so10315539ljv.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Mar 2022 00:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BB+hmcDj1CYfYx1pBjqQWeWp3wMZbHpbkxEuXU8AObM=;
        b=KV0bYIZQ+xrpSLKspY/8JVi26f8wIWHxIygGWMRSnuJWgyM+bJe/KYdrglJEk+LP1z
         oRZpNkDaYRnkudA6g0bY+41LW9cenAmwS14Jo4S+NjBIUYmrtgHYkW+JQpU8P8sZegfh
         XWFsKlhAKWC63ZmX1BU1AerVVRReCfJKJiviuPOYLb1x+wu4oSiBzTf1VWB+KxnXj3wc
         XYTosxdtTXk40ZomLntjNjUuej+9nWZMn2H5Ne2p7DNTPWsDWOWGYdDj9+Q8U3ZWnYI8
         Hsd0tG+pMWF494HMm6iAXDHhoL3J0smalV5Cfj5mE5DPaUFRNe6GTWylcV7Cirlhpnvq
         i1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BB+hmcDj1CYfYx1pBjqQWeWp3wMZbHpbkxEuXU8AObM=;
        b=Z0Ynb/ulR9cybAwk7WUEZmiQy5EnSUcZEil9CGn0uyLVKZbLmi4ErAQTS1tZgRKegi
         dvS6DT7VU8rjlaO1UYprO49eA7oxuZljadxBp2EeYK0S6snVjh/KVLTNSuG52TcomeIv
         k8PtX1wJpy0K72LL33CiEbNHyIaWO/3SZT7O+2Tg3Z+mlen3uH2B+KSStuB+jz3/Ydz9
         FwEKGBvDB/VzntjeGNYRcYxlKOzOLIm5ogG/xSjECIS9Zb6KLvrXS5bqyr+O5sBf7Ngr
         Lg+Dj0MWMgIC8vT4/VhHZHAFbBQwuhydCXEcooRelyXN/FZpHDBmk5ix7zrZYWapjHxB
         6wRQ==
X-Gm-Message-State: AOAM532rFUMnOHgIMFk2+rBpDRN63my0MNPomqQdAh/UrM51c6I3aPpS
	IMGOjKRP2v/U/5/R/ZojfBQUDzZMNEIoi4pUC8o=
X-Google-Smtp-Source: 
 ABdhPJwOHH96hK78M3jcwCiiBScwtTSnucoUXmoWwbanWewPaxmhvIeKlTJPeTzY4+AtnJkGja+cMVUZKum5Do0C8Dw=
X-Received: by 2002:a2e:91d7:0:b0:245:fce2:4551 with SMTP id
 u23-20020a2e91d7000000b00245fce24551mr9859206ljg.446.1646726923501; Tue, 08
 Mar 2022 00:08:43 -0800 (PST)
MIME-Version: 1.0
References: <20220308003334.1609494-1-saul.wold@windriver.com>
In-Reply-To: <20220308003334.1609494-1-saul.wold@windriver.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 8 Mar 2022 09:08:32 +0100
Message-ID: 
 <CAApg2=TS8O0yXVKn_N8jsTYRnO1PvVFftPrHQyPwgJKGfXEgAQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Change internal variables
To: Saul Wold <Saul.Wold@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Mar 2022 08:08:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162875

Thanks for the renaming, Saul. Some minor comments below.

On Tue, Mar 8, 2022 at 1:33 AM Saul Wold <Saul.Wold@windriver.com> wrote:
>
>
> -    # If the recipe has been whitelisted we return empty lists
> +    # If the recipe has been skipped/ignored we return empty lists
>      if pn in d.getVar("CVE_CHECK_SKIP_RECIPE").split():
> -        bb.note("Recipe has been whitelisted, skipping check")
> +        bb.note("Recipe has been skipped/ignored, skipping check")
>          return ([], [], [])

Wouldn't it be better with something like:
"Recipe has been skipped by the cve-check"
We then use the "skip" word when talking about the recipes only.
A check for ignored CVEs is done below.

> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 270b7860c7..40eba73ce3 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -441,7 +441,7 @@ def package_qa_hash_style(path, name, d, elf, messages):
>  QAPATHTEST[buildpaths] = "package_qa_check_buildpaths"
>  def package_qa_check_buildpaths(path, name, d, elf, messages):
>      """
> -    Check for build paths inside target files and error if not found in the whitelist
> +    Check for build paths inside target files and error if not paths are allowed

What about:
Check for build paths inside target files and error if paths are not
explicitly ignored

I think this is what we want to say here?

Marta

