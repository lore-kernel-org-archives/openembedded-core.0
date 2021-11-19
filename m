Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80F92C433F5
	for <webhook@archiver.kernel.org>; Fri, 19 Nov 2021 02:14:48 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web08.2868.1637288087471836359
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 18:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E7cjr7Ra;
 spf=pass (domain: gmail.com, ip: 209.85.210.48,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f48.google.com with SMTP id
 x43-20020a056830246b00b00570d09d34ebso14449452otr.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Nov 2021 18:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=YPm1Lvuz0romBDRD3xC+8YTBHE53Kyeplae71qUO+As=;
        b=E7cjr7RatCd2nEYO3975/VYhrPI7mJrc+hj1DdChDRFxo1freYW7h1XBkg7nY3H+vc
         yzjXv1SmvmMAKk46O0I/3sfvHw1ql3VA1YCIFFXabZOtHFpkmMlCYJl0JLrN80DLBsMd
         tvcN+jP35qtiixFpRPjNo++TmZWIUbmttPKp9Sxo+VCl6bejjjoBDdvmrOyzyfmiGRhd
         ASTxEJdjdAiG6pyVJMKLOb3bIa2LdJLrUSe8bdjnIFyXqjctcGslW8G6j6N7MBEshgyX
         qwH2nTmMLf2PhcLoc4pl8Bb5fK/fKT2xJhIs3eqzLr0/c/K9SsAWFvjxKZh+rVGtOl+0
         HC5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=YPm1Lvuz0romBDRD3xC+8YTBHE53Kyeplae71qUO+As=;
        b=GTabfKjxbWtSDkfPg6tH+XV2oeCEl9Ct5Qc55wrdE6D4ppvx/OAaki1uMl0vwdKk9p
         Eqoaz6IwbVQYMBhbC8iVkzrIfTwyi0oIf2UF/+muAXRcfdPtcQeanZuNGVJ45L2Bwtck
         K/jGeWch/9WnHNt2Bt9bSeJzGD1E9hEJIYlX4mw2Mw8Aix7L605R9K5BbQ3wAcoqgPw6
         Q4hKAP2Tc/vPyV5zYRA2SmJfkz3a7XwqtyefbzLDgkxFNblm4/H5XooM1cpPtt/Cot1W
         IFYBXwdWbrlbV4dJRr1SZisUQ0SJlwj5Q8SgtBPpS2ChZNBsK584XmQiGn/75oxk9Y2Q
         6Aeg==
X-Gm-Message-State: AOAM532VG1XhJz35JUK+E4ruBbQqsR5jhVsOM2RAj87SxOrjFY7UpRcj
	atQ/0jbbfJe3O5AUytAquSA=
X-Google-Smtp-Source: 
 ABdhPJx/ZCsH8m7kBqW/g7ITKmHndLbOssVa+yo/ljvwyT5U0t28fJytU7PWJ0BHbas9Y9GKbHjLjg==
X-Received: by 2002:a05:6830:1258:: with SMTP id
 s24mr1670716otp.226.1637288086781;
        Thu, 18 Nov 2021 18:14:46 -0800 (PST)
Received: from ?IPv6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d?
 ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 m12sm466430oiw.23.2021.11.18.18.14.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Nov 2021 18:14:46 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Subject: Re: [OE-core][PATCH] classes/crate-fetch: Ensure crate fetcher is
 available
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
References: <20211119021249.113892-1-JPEWhacker@gmail.com>
Message-ID: <35a0fe07-df32-0f7f-7c28-1772d9abd14e@gmail.com>
Date: Thu, 18 Nov 2021 20:14:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211119021249.113892-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Nov 2021 02:14:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158490

On 11/18/21 8:12 PM, Joshua Watt wrote:
> Reworks the crate fetcher class to have it install the fetcher at recipe
> finalization so that it is always available before SRC_URI is expanded.
> In addition, override the value of SRCPV to also install the fetcher
> when SRCPV is expanded so that AUTOREV works.
[YOCTO #10867]
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>   meta/classes/crate-fetch.bbclass | 21 ++++++++++++++++++---
>   1 file changed, 18 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/crate-fetch.bbclass b/meta/classes/crate-fetch.bbclass
> index c0ed434a96..a7fa22b2a0 100644
> --- a/meta/classes/crate-fetch.bbclass
> +++ b/meta/classes/crate-fetch.bbclass
> @@ -7,7 +7,22 @@
>   # crate://<packagename>/<version>
>   #
>   
> -python () {
> -        import crate
> -        bb.fetch2.methods.append( crate.Crate() )
> +def import_crate(d):
> +    import crate
> +    if not getattr(crate, 'imported', False):
> +        bb.fetch2.methods.append(crate.Crate())
> +        crate.imported = True
> +
> +python crate_import_handler() {
> +    import_crate(d)
>   }
> +
> +addhandler crate_import_handler
> +crate_import_handler[eventmask] = "bb.event.RecipePreFinalise"
> +
> +def crate_get_srcrev(d):
> +    import_crate(d)
> +    return bb.fetch2.get_srcrev(d)
> +
> +# Override SRCPV to make sure it imports the fetcher first
> +SRCPV = "${@crate_get_srcrev(d)}"

