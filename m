Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E176C04FFE
	for <webhook@archiver.kernel.org>; Wed,  8 May 2024 16:14:28 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web10.1050.1715184865126298549
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 09:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=AQXud0D6;
 spf=pass (domain: konsulko.com, ip: 209.85.167.177, mailfrom: trini@konsulko.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3c98820fc2cso498410b6e.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 09:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1715184864; x=1715789664; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQlLF+moVqT2eN/8OdJNM2oekcVt9OwWbRrJlmKU25w=;
        b=AQXud0D6PXfY1RQdjSbBvqfXiRRSeW9yfqy7wWtyvcKlISo8zBMgvMzte4EJmW53eX
         8Zscuve+VZkwQNiLfYGJ7ezFHcWUGfJe4/f2A1dKwp4Zho7HCIMTHbxDtnB0hojYxnKY
         IJT9KQ/VNShlmcNnjGw5nEeHQGCJWsjH6F12E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715184864; x=1715789664;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QQlLF+moVqT2eN/8OdJNM2oekcVt9OwWbRrJlmKU25w=;
        b=eSA7zVvS/Cs0ZBkqcm2SBDLuWMVNmfoWoQsk4OOgRYpwUoEUNZWCPNG/gQLjoUSpmH
         ys/mAP8bJydDa/I2j4R3IcGUB2XMAFM9Iu00Fwe9xNoYZheSdJsh1SeqkspAkBSDwWbP
         34oqRXNZaupr7ztmp7inbSyjkj/FlRbnWDOSrWnZ5inhUNOIqpxHpRIireYREMtD8TkQ
         p6/5pYOM+jJ1RD7jz3BkWC/KV4uwFpormUMEo4mJrgrPDz/LZw1Fk4yNieZITpSLox0T
         DrM5aPzY3b0w1/zrvVTAfOTiZvTzX3oeuHYXXjMDjd/dChFgaNmKlX+iJl5e3rrhc6tc
         9DwQ==
X-Gm-Message-State: AOJu0YxtK/6uTS8kgV+HGsqRL+VuDJQLyRJIuU87WOSkVkF+sb7YI0UU
	SlptBdAQh9ldMH7odIkHzG68psQ6lm7GuKdOxIpqF0sjJmEEwbnUmhlo/4Qzxps=
X-Google-Smtp-Source: AGHT+IFSv2h8Mrn4qRyE/79od/JBC5nJaB0iLpeej2NXkGLSoLPvAAihpLxWiD4Hoj8GnfGw8tgsHg==
X-Received: by 2002:a05:6808:418b:b0:3c6:574:eb45 with SMTP id 5614622812f47-3c98530666bmr3134349b6e.45.1715184862967;
        Wed, 08 May 2024 09:14:22 -0700 (PDT)
Received: from bill-the-cat ([187.144.98.216])
        by smtp.gmail.com with ESMTPSA id l16-20020ad44090000000b0069b4f48003bsm5646242qvp.100.2024.05.08.09.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 09:14:22 -0700 (PDT)
Date: Wed, 8 May 2024 10:14:19 -0600
From: Tom Rini <trini@konsulko.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] sanity.conf: Require bitbake 2.9.1
Message-ID: <20240508161419.GD2568172@bill-the-cat>
References: <20240508135739.3848839-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508135739.3848839-1-richard.purdie@linuxfoundation.org>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 16:14:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199126

On Wed, May 08, 2024 at 02:57:39PM +0100, Richard Purdie wrote:

> We need a recent siggen change in bitbake to allow SPDX to work
> better.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/conf/sanity.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/conf/sanity.conf b/meta/conf/sanity.conf
> index d2f56a3fb00..02775970aee 100644
> --- a/meta/conf/sanity.conf
> +++ b/meta/conf/sanity.conf
> @@ -3,7 +3,7 @@
>  # See sanity.bbclass
>  #
>  # Expert users can confirm their sanity with "touch conf/sanity.conf"
> -BB_MIN_VERSION = "2.7.3"
> +BB_MIN_VERSION = "2.9.1"
>  
>  SANITY_ABIFILE = "${TMPDIR}/abi_version"

Apologies if I've missed a policy change in the bitbake repository but
there's no tag for 2.9.1. For that matter there also isn't for 2.7.3,
and I only bring this up because tags do make it easier when coming back
to older releases to get a correct bitbake version.

-- 
Tom

