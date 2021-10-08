Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45577C433F5
	for <webhook@archiver.kernel.org>; Fri,  8 Oct 2021 09:38:53 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.7001.1633685932157992180
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 02:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Knsqku3Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id o20so27773930wro.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Oct 2021 02:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=54MdkIXnoZK3RT9UDpr+JOkqLBo0wwGYTgPNxxNrzA8=;
        b=Knsqku3QYUQW11r9gOzJJmPiaTEL+N7TGPoef/b2I3LuMhWejFYvmCRHqpYxPe2jgK
         jkuAevDlhEiJVAGq5dS7l2kK7L86Hb1M+YG91gfvmOmraltBGxGBivLlAAfn8tpGYOjq
         kjWzYdp0gaKK8+eghSAw/7tNYeUiMXs0r6cJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=54MdkIXnoZK3RT9UDpr+JOkqLBo0wwGYTgPNxxNrzA8=;
        b=zg/lXpt0UKCCHmfl50JOZlKAxPq8qiIEwOiFDnkNF48E6tiDeag+FZdVLNmdSkOEDY
         51TDlVZplkehGgpnXIgPu4vzN2mHkoBSuDDWBMELH2eDH3/kbzktXnHonrM25oimmKby
         BBf2U4b0WjxEljZC93sp5mPIAwsEqWgPhOLEyQeR0a7D1T8sTdA3G3/74oaIGKCP5IgM
         uhdXLNTUvzhAiIJ3SFEMN9frHpDFqxlnQAC6NL2vMN3L1JdISW3ijXSrhnOO7y74D/WC
         yxx7LRC13Z8vMWh8ZJVY++hW0hJs5Q5TT0dlJHOBdvAPnEGnUEb10Y3zLrqhWBwktWAK
         o4XA==
X-Gm-Message-State: AOAM5300Y9/WX6vvNgMT+QNyXx8Cuzr2Wbj/no4xgi7hY1eyAZ8DdySX
	Qefwan5q9WXCd2deMbzIKpiKJA==
X-Google-Smtp-Source: 
 ABdhPJw69rEqV/B/E5hsKb8xXMKBwVEfA298MWBuBap2sP4dzhCmONPqpaCgipmpTIlm7ZF0fwtQAQ==
X-Received: by 2002:a5d:690c:: with SMTP id t12mr2756382wru.56.1633685929936;
        Fri, 08 Oct 2021 02:38:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5719:ccd0:9969:333f?
 ([2001:8b0:aba:5f3c:5719:ccd0:9969:333f])
        by smtp.gmail.com with ESMTPSA id
 a25sm10835569wmj.34.2021.10.08.02.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 02:38:49 -0700 (PDT)
Message-ID: 
 <addabd95cfbb4d56b02b509e3c733b11158e6a4c.camel@linuxfoundation.org>
Subject: Re: [docs] [PATCH 5/8] bitbake: replace http with https for URLs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jon Mason <jdmason@kudzu.us>, openembedded-core@lists.openembedded.org,
	docs@lists.yoctoproject.org, bitbake-devel@lists.openembedded.org
Date: Fri, 08 Oct 2021 10:38:48 +0100
In-Reply-To: <20211007150630.22138-6-jdmason@kudzu.us>
References: <20211007150630.22138-1-jdmason@kudzu.us>
	 <20211007150630.22138-6-jdmason@kudzu.us>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Oct 2021 09:38:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156777

On Thu, 2021-10-07 at 11:06 -0400, Jon Mason wrote:
> https has been the preferred way to access websites for many years now.
> Change all of the URLs with a _working_ https server/certificate to use
> that URL.
> 
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  bitbake/README                                |  8 ++---
>  bitbake/doc/README                            |  2 +-
>  .../bitbake-user-manual-fetching.rst          |  2 +-
>  .../bitbake-user-manual-hello.rst             |  4 +--
>  .../bitbake-user-manual-intro.rst             |  6 ++--
>  .../bitbake-user-manual-ref-variables.rst     | 10 +++---
>  bitbake/lib/bb/tests/fetch.py                 | 36 +++++++++----------
>  bitbake/lib/layerindexlib/__init__.py         |  4 +--
>  bitbake/lib/layerindexlib/restapi.py          |  4 +--
>  bitbake/lib/layerindexlib/tests/restapi.py    |  2 +-
>  bitbake/lib/toaster/orm/fixtures/oe-core.xml  | 12 +++----
>  bitbake/lib/toaster/orm/fixtures/poky.xml     | 24 ++++++-------
>  .../orm/management/commands/lsupdates.py      |  2 +-
>  .../toastergui/templates/layerdetails.html    |  2 +-
>  .../templates/package_detail_base.html        |  2 +-
>  15 files changed, 60 insertions(+), 60 deletions(-)

There was a small problem with bitbake-selftest now failing due to the changes
to tests/fetch.py.

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2672/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/2648/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/2649/steps/11/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2682/steps/12/logs/stdio

I'm isolating the bits that break it out and will drop those from the patch, I
think there are only a couple of bits that break things.

Cheers,

Richard


