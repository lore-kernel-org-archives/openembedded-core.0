Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7EC1C433EF
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 14:02:53 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.25528.1647439372908099737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 07:02:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IpV6hhKc;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so1464412wmb.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 07:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=ZM7msPQK8fKXsCiIJ8e1keC4Rd+Wqxb+rZqd6lKsPb4=;
        b=IpV6hhKce1A54MVRiMfelB1irZN08JhfX1Hr+M845Ar93l8k0QSiD2p+k1lpfXlBip
         jBT7m8w1h/UFUGoLjQiRPqdKEFIeqwBydVXN1bSiziNxN80KwLJQXVWkMj6ggTFAC167
         ZbFqNtY0logW0o1puxu/vomTvV/r/UXTYuHAo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ZM7msPQK8fKXsCiIJ8e1keC4Rd+Wqxb+rZqd6lKsPb4=;
        b=Q1Ocvg2SWdxXCapoJFdyxzwCt2PcX74tQkXE4BmTFKh39ACwa4vjo2WJc+P4ExEdYX
         c3uRdpR2t/WCgLiB6LCLDcwWIlIYaRkGUYgkpgQukc7X0PIkZdj30CELU+WqTqTJM73I
         mzZcgslS/dThKakozQG3IuYsMgo1NGU+7d8xd8zSwzzqYtaOf4J9WO2BiEbQlXyR4/Fi
         d0qkH5kPie1i9BXzCxG71rho7gV+EcOAyjT0sRC3AUnkSnAUUtQC4mafRqmOpojUZ+JZ
         YPeJKhpMVtbQrrokF8uA7VDM8/N0EMkB8BOytRHde/oKkGhMVkrND6c0uRkGzkp1zYez
         aY9A==
X-Gm-Message-State: AOAM533aXNHLxTtajHVRkOZvlgdulDf5qdT6cTdC1qOkpnr06Q6moM5b
	6CgZ4ldrv6c4RiJyCfP9pEkH8w==
X-Google-Smtp-Source: 
 ABdhPJwFrgu2ec9RrNS8k4EgN0PuAozHUbofXftDc8R/EToZSDZpL01nE1Kg9UaL2hj130CIb/zkQg==
X-Received: by 2002:a05:600c:a54:b0:38c:6eb3:96dd with SMTP id
 c20-20020a05600c0a5400b0038c6eb396ddmr2387060wmq.162.1647439371443;
        Wed, 16 Mar 2022 07:02:51 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bc44:1420:18a9:e343?
 ([2001:8b0:aba:5f3c:bc44:1420:18a9:e343])
        by smtp.gmail.com with ESMTPSA id
 h12-20020a5d548c000000b001f1f99e7792sm1677958wrv.111.2022.03.16.07.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 07:02:50 -0700 (PDT)
Message-ID: 
 <3513614322f4f301ca4cd34fe6f6f0b5576562a4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] convert-variable-renames.py: add more
 problematic words
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: michael.opdenacker@bootlin.com, openembedded-core@lists.openembedded.org
Date: Wed, 16 Mar 2022 14:02:49 +0000
In-Reply-To: <20220316140007.184425-1-michael.opdenacker@bootlin.com>
References: <20220316140007.184425-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 14:02:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163333

On Wed, 2022-03-16 at 15:00 +0100, Michael Opdenacker via lists.openembedded.org
wrote:
> Listed on https://inclusivenaming.org/
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> ---
>  scripts/contrib/convert-variable-renames.py | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Not sure we want to add a whole load more work at this point in the release
cycle? This wasn't what we agreed as the first set of priorities :/.

Cheers,

Richard


