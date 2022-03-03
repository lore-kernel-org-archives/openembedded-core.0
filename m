Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC09BC433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 14:37:24 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.11417.1646318243702360477
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 06:37:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=astLBZFZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id r10so8178089wrp.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 06:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=MPNThHUHAqrBehkimH6EiOg4AHf6IG/mSFuDpwemaX0=;
        b=astLBZFZu+WTgjA0h1+WJJEKUqvdrvREQJc96jb/XnRV7ffulH5VnqAzYewoCARhFG
         eCosvUTk9vhDXvNONUmBiv4342lBv8GWmbwTRubgMjZw3W2nP56Qq7+B2hjdkafOTJQT
         f3RvDHioBAjW/XyZsYU5zw2NrXyzhs+yIo3UI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=MPNThHUHAqrBehkimH6EiOg4AHf6IG/mSFuDpwemaX0=;
        b=aYYrSxgbVACDV+nu3WdcDxXZgjaEAOkF6p4AG7wX0/cfjrcQFIRCChRo3usvwzWZ7v
         MwcxAk7i/qkKKzYh6OtFfDninRJZB1VX/pRCxAG3BApp5vrbaRUuedf8qMjkpaK+Zi+C
         TYw64amXraXXHuMZQW4jMJwmYNJwgwlK7RrySKrwvnQXCzYLltFsG3lJLEkHUNc/RAGJ
         OHu/oyDJA+hGMhHqLqJ8A++0MtNQs7+zNK1wM8jpV7PVTz1F6KVNW/fcy6uxegiz+yXr
         reQt7SJe8xp5EicORVYaOS0xkpPnlV5du/qHgVqlRBsiSW/1hJPcjzNRORdf98x3i96t
         QUMw==
X-Gm-Message-State: AOAM530CYlNpTX9pgZzWabCcVdLBtAvtWLku/sP4767/Gk3yMuQMdKM7
	5QyDge7TcmzIVwaVJz+MEBB2GEhFaq/jAXU6
X-Google-Smtp-Source: 
 ABdhPJxmelx40LoWJ/r2o8G9DoTKmM94qgqdn11wYjm+llMO0GsPduEYHtTgAx8wF5LkxsHZebA34Q==
X-Received: by 2002:adf:ba8f:0:b0:1e9:4afb:179b with SMTP id
 p15-20020adfba8f000000b001e94afb179bmr26877325wrg.57.1646318241748;
        Thu, 03 Mar 2022 06:37:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1?
 ([2001:8b0:aba:5f3c:68d0:4b5c:ced3:87b1])
        by smtp.gmail.com with ESMTPSA id
 p16-20020adff210000000b001f062b80091sm1105623wro.34.2022.03.03.06.37.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Mar 2022 06:37:21 -0800 (PST)
Message-ID: 
 <f7d911b79f48eb7da976002533b1f64cccc554d3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] python3-native: Drop opt-1 and opt-2 pyc files
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu, 03 Mar 2022 14:37:17 +0000
In-Reply-To: <16D8E53ED33DE8AA.24484@lists.openembedded.org>
References: <16D8E53ED33DE8AA.24484@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 14:37:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162656

On Thu, 2022-03-03 at 14:28 +0000, Richard Purdie via lists.openembedded.org
wrote:
> There are over 3,000 of these in python3-native (of 8,000+ files total) and
> copying them to sysroots all the time seems pointless, particularly since
> they're only used if python is run with the -O or -OO parameters.
> 
> Get rid of them and save the overhead. This is particularly pronounced in
> builds using the api-documentation distro feature.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/recipes-devtools/python/python3_3.10.2.bb | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/meta/recipes-devtools/python/python3_3.10.2.bb b/meta/recipes-devtools/python/python3_3.10.2.bb
> index 429839b6226..b28aa6505a0 100644
> --- a/meta/recipes-devtools/python/python3_3.10.2.bb
> +++ b/meta/recipes-devtools/python/python3_3.10.2.bb
> @@ -152,6 +152,11 @@ do_install:append:class-native() {
>          # (these often end up too long for the #! parser in the kernel as the
>          # buffer is 128 bytes long).
>          ln -s python3-native/python3 ${D}${bindir}/nativepython3
> +
> +        # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000 of them
> +        # and the overhead in each recipe-sysroot-native isn't worth it, particularly
> +        # when they're only used for python called with -O or -OO.
> +        find ${D} -name *opt-*.pyc -delete
>  }
>  
>  do_install:append() {
> 

This does pose an interesting dilemma. We could just go this far, or should we
remove the remaining pyc files (~1,500 of them) and let python create them as
needed, or do we disable them from python entirely?

Cheers,

Richard



