Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E6E3C433FE
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 17:01:05 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.506.1633539664398584355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 10:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Qc3WdPJE;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id r7so10796995wrc.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 10:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1QWVvoOWAcyn+3qG8p6zIn76Zs18PTFTqjxWI23CBYw=;
        b=Qc3WdPJE0HtEzy3laTPDHyiEOAfXI5XTE8xsVmIi2OfqPAgfsTImkQVQ0UAd1OEUzh
         XMs9UQvw3HFSyYoK8tZmwnPpbk2ldEwz+vh8rpfk6qlscwVudTJJ5Z5XQWve6CMBl1IQ
         zzZytLgimP/ELVnTHnm17I3KUv3JPEgQ2Z67w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1QWVvoOWAcyn+3qG8p6zIn76Zs18PTFTqjxWI23CBYw=;
        b=Kl1JVYy5z9NJxuxx/Gd46VeaWY9mwBToruWWfs4Kc+ygBrKnBQ5BKXjuU5anZNlXxK
         ZHxjhHImmpr4JO3fuo3CYoS5PF91jCuC++6QCB0P9u9SujtO5yJ5aN03UJrAi/JxZ2ex
         ZJ3o8M6apL6AqW0r+5msOq1VgOfOp79ZnIf3MGYnGVUoHFDwgkIuCoyxNG6yft+OhG2T
         S+72bN61GY6j4bW9e+tiQu8fB5PY0mCko5t/X8p8lbEez+R83PNraVG/zWcBX1rGfEvI
         3J+zXhoIcn95aWYiNEJTZ5t4U5L3JLUQQ0rLZDSWVEKAJ5UyX26NGbTAILsuJ6fPzUwH
         vFAg==
X-Gm-Message-State: AOAM5332O9NVlU733fRMp9LqoKGjmjR8sUrJ4zExatPuzPg8Z7QhSHfi
	QFj2iP7hX3Ixbbmdp5stVrdmdw==
X-Google-Smtp-Source: 
 ABdhPJxikFEoqxZrP+cqbK9c8m2ihAs9B1axqU239hNUC7+8GnOEi/C39TqgxXSgaux3D7Er/O0R2w==
X-Received: by 2002:a1c:ed13:: with SMTP id l19mr11111137wmh.48.1633539662796;
        Wed, 06 Oct 2021 10:01:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:afdc:71b4:d5f9:44fc?
 ([2001:8b0:aba:5f3c:afdc:71b4:d5f9:44fc])
        by smtp.gmail.com with ESMTPSA id
 s13sm20694447wrv.97.2021.10.06.10.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 10:01:02 -0700 (PDT)
Message-ID: 
 <df755fcfe28bc98a227c99e6cb034242f7063e8b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] cairo: use ${PN} in package name
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bkylerussell@gmail.com, openembedded-core@lists.openembedded.org
Cc: Steven Walter <swalter@lexmark.com>
Date: Wed, 06 Oct 2021 18:00:58 +0100
In-Reply-To: <20211006143606.55529-1-bkylerussell@gmail.com>
References: <20211006143606.55529-1-bkylerussell@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 17:01:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156698

On Wed, 2021-10-06 at 10:36 -0400, bkylerussell@gmail.com wrote:
> From: Steven Walter <swalter@lexmark.com>
> 
> Without this, bitbake complains that the license for cairo-gobject is
> incorrect, because the license is set using ${PN}
> 
> Signed-off-by: Kyle Russell <bkylerussell@gmail.com>
> ---
>  meta/recipes-graphics/cairo/cairo_1.16.0.bb | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/meta/recipes-graphics/cairo/cairo_1.16.0.bb b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> index d76d935c30..b5d4b7eb22 100644
> --- a/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> +++ b/meta/recipes-graphics/cairo/cairo_1.16.0.bb
> @@ -77,17 +77,17 @@ do_install:append () {
>  		rmdir -p --ignore-fail-on-non-empty ${D}${libdir}/cairo
>  }
>  
> -PACKAGES =+ "cairo-gobject cairo-script-interpreter cairo-perf-utils"
> +PACKAGES =+ "${PN}-gobject ${PN}-script-interpreter ${PN}-perf-utils"
>  
> -SUMMARY:cairo-gobject = "The Cairo library GObject wrapper library"
> -DESCRIPTION:cairo-gobject = "A GObject wrapper library for the Cairo API."
> +SUMMARY:${PN}-gobject = "The Cairo library GObject wrapper library"
> +DESCRIPTION:${PN}-gobject = "A GObject wrapper library for the Cairo API."
>  
> -SUMMARY:cairo-script-interpreter = "The Cairo library script interpreter"
> -DESCRIPTION:cairo-script-interpreter = "The Cairo script interpreter implements \
> +SUMMARY:${PN}-script-interpreter = "The Cairo library script interpreter"
> +DESCRIPTION:${PN}-script-interpreter = "The Cairo script interpreter implements \
>  CairoScript.  CairoScript is used by tracing utilities to enable the ability \
>  to replay rendering."
>  
> -DESCRIPTION:cairo-perf-utils = "The Cairo library performance utilities"
> +DESCRIPTION:${PN}-perf-utils = "The Cairo library performance utilities"
>  
>  FILES:${PN} = "${libdir}/libcairo.so.*"
>  FILES:${PN}-gobject = "${libdir}/libcairo-gobject.so.*"

How do we reproduce the error? We're not seeing this and this change shouldn't
be needed, PACKAGES just needs to match the variable usage which it does here.
I'd like to understand the issue before we can try and fix it.

Cheers,

Richard


