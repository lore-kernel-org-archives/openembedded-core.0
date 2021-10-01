Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47405C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Oct 2021 21:21:38 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.3454.1633123297397701855
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 14:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WyGGE3S5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso7642161wme.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Oct 2021 14:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=jMYlhuL6Of6IDN17ywnKgs5d4KV0ARh6ArfcEujBysM=;
        b=WyGGE3S5LQOfzZ3VpToMrFkrGYg6oIoSvMrP30qVyIyDtqDhr6gzQJAmqCTbSjhsbH
         Uai6WziHbAXmWIeI6c81SUersRHoKY7+9jbQ/050wrygMNpbYhLChL/TtkDj+Rq1KODQ
         bcmzfJccBW0SKxSqi95q14Z+vBx18fJvZJxs4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=jMYlhuL6Of6IDN17ywnKgs5d4KV0ARh6ArfcEujBysM=;
        b=IMKRN7tF3CcI6cGLV2kYWvKQ5H9OE4fXw/LuVEuUeepezS+k/t5g6z5li3URCi/wr0
         S+xGWQC3zPmFRraOkLA8DXrx9MDKtpXra/m854P5GpRSTT4g59dkevh/aMYX2SFijDPR
         D1r2FxtBCBgxapY2n7oSjcSWkcgEYIH03WZPYY9qWc/hP4xNEDS6ZaT4BpAoWVVMbHIq
         lmCYqlWQNpeMaoxQR7YLsaovCqLrWiNox5U2HRv6iy3uDOPyMHc0h/v8oD/94mlQhe6R
         t5dCgXHzm9MF75yOcuANVqJnrQ1NNvUQ+fzGxUCgm1bBYhc1spbj3y3pG8o0VsFo7Hsc
         isWg==
X-Gm-Message-State: AOAM532iySKz+6DrsNieNqy97B1WA/UnMfOCHz6VDV1QLMf0pLCIlh00
	fzH+1dpTvups2USONdb3six/hw==
X-Google-Smtp-Source: 
 ABdhPJxkJYPm+r85AUd6jrZiw6giO+oixNpDOl4b52+Q1A7YWRF9tDKn6l0RwY0g1Jho+AsgHVvwJg==
X-Received: by 2002:a05:600c:35d0:: with SMTP id
 r16mr6579781wmq.26.1633123295781;
        Fri, 01 Oct 2021 14:21:35 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bdad:e899:5209:16be?
 ([2001:8b0:aba:5f3c:bdad:e899:5209:16be])
        by smtp.gmail.com with ESMTPSA id
 t13sm6899795wro.76.2021.10.01.14.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 14:21:35 -0700 (PDT)
Message-ID: 
 <1fd536918660db1e2b2c2944a78f80e3dd2f59c7.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/1] binutils: use perlnative for pod2man
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Guillaume Champagne <champagne.guillaume.c@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Fri, 01 Oct 2021 22:21:34 +0100
In-Reply-To: <20211001180429.6069-2-champagne.guillaume.c@gmail.com>
References: <20211001180429.6069-1-champagne.guillaume.c@gmail.com>
	 <20211001180429.6069-2-champagne.guillaume.c@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Oct 2021 21:21:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156532

On Fri, 2021-10-01 at 14:04 -0400, Guillaume Champagne wrote:
> binutils uses pod2man in its makefile, leading to "pod2man: command not
> found" errors when unavailable. Make it available by inheriting
> pernaltive.
> 
> Signed-off-by: Guillaume Champagne <champagne.guillaume.c@gmail.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-devtools/binutils/binutils.inc
> index 2f65ae5474..6140ceaf7e 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -13,7 +13,7 @@ LICENSE = "GPLv3"
>  
>  DEPENDS = "flex-native bison-native zlib-native gnu-config-native autoconf-native"
>  
> -inherit autotools gettext multilib_header pkgconfig texinfo
> +inherit autotools gettext multilib_header pkgconfig texinfo perlnative
>  

We may want to be careful since this will significantly increase build times,
particularly if binutils-cross changes to have more dependencies. Do we really
need to use pod2man here?

Cheers,

Richard


