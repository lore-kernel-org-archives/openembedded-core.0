Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DC9CC4332F
	for <webhook@archiver.kernel.org>; Fri, 18 Nov 2022 16:09:56 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.110.1668787795598730827
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Nov 2022 08:09:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=D0KCVOwk;
 spf=pass (domain: linaro.org, ip: 209.85.167.41, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f41.google.com with SMTP id j16so8898507lfe.12
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 08:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HUCG13/cGBK6niTUDSjDfAd0jb8dj9JB/s/N+cpPMbI=;
        b=D0KCVOwkJORQhEJnzbli4DF8g3ejbF3q+uvOHrGJxH2ciq5vzIqooynY/AG1AHHjb3
         +5q3NpZrJjkSaaynE85qcsiTcSsEgykdm41tTRWQKgD0qhJ6C2B8BbLsOeaKhUSIm3Je
         gQKsM3EXFpiAXaRMIYFyRss+7vvdmdLDBnPxJypxin1yr225ukMSaAwVcHws2/GIeYr5
         2OKE7q8Z9s6XgK6dk6owlzsEeOKw40kyH2XNjyh0h5Zr4t3Qv+aS0MXS4bNZkIV2fp2S
         2sybdXwnEfRMSfEhwxJmpODVhejyGo41xPFIy3miUIP4ulN/7KpCoRcMDIN/MHSlr00z
         ZFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HUCG13/cGBK6niTUDSjDfAd0jb8dj9JB/s/N+cpPMbI=;
        b=MUvWsMnEv6F7aGCu02rmPLzFieab/87pQ9XOgIm+rf43Ch3p72lVsf9yCgyQUKUMLW
         BPOL3oHIYsViKOcmjqcc6rdlyqmzpgZZhDHPr30UemDYbUYgZxu/4o+Z78VfEdgoqnOr
         GrY0BSNF+KurWYA3kvBU90P4c7/zgHHxXPCF2fZ39EmVR1Dp2VNCVtr940rrnoWwWSQn
         MyIYS9CldArYOwgH069S4AGqfrRADworZaEhNZDMVWStQrFFBWFT/s8Ax1XkRvjW8V0I
         MGtbPvwzKWQwrRM1BoES/PIFOfUxHTl8OJKIa/blMGxHfLfRLIdqIOKwwEVwJNYhVI81
         2+XA==
X-Gm-Message-State: ANoB5plqTzz9DUtMcyyUHB9qxcuQDGCs8JRCGoiMGk2mGzrRXuofSLsi
	g9GZRpA8V+WLcqsAiCb6nawyYw==
X-Google-Smtp-Source: AA0mqf6esBRvdRiZlXeKAJ/KanDk+sjSvQXelm91CVPPWtlxle0waUlGNyLQVTOwK8nKnmkilIUnXA==
X-Received: by 2002:a05:6512:23aa:b0:4a4:65f0:cdc8 with SMTP id c42-20020a05651223aa00b004a465f0cdc8mr2503710lfv.609.1668787793492;
        Fri, 18 Nov 2022 08:09:53 -0800 (PST)
Received: from nuoska (dsl-olubng12-54fa1d-36.dhcp.inet.fi. [84.250.29.36])
        by smtp.gmail.com with ESMTPSA id be34-20020a05651c172200b0026bf43a4d72sm700971ljb.115.2022.11.18.08.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Nov 2022 08:09:53 -0800 (PST)
Date: Fri, 18 Nov 2022 18:09:51 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 0/2] image specific configuration with oeqa
 runtime tests
Message-ID: <Y3euT9EKWqACmd8q@nuoska>
References: <20221117071223.107064-1-mikko.rapeli@linaro.org>
 <5b79cba0817750882a0ef1f1dd9b9581abc9db28.camel@linuxfoundation.org>
 <Y3ZVup8YKv6LQzuF@nuoska>
 <4f16ed270c2b979839830929c703494d221b2228.camel@linuxfoundation.org>
 <Y3eXdWibCGQBV6Wt@nuoska>
 <6b088587f876fd2cf76ad8b1b13fac6a7c92cfc6.camel@linuxfoundation.org>
 <Y3erTB2Qulh8Wfn+@nuoska>
 <e7158cb97e3f8112e94296ad64df8ebf7792b995.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e7158cb97e3f8112e94296ad64df8ebf7792b995.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Nov 2022 16:09:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173474

Hi,

On Fri, Nov 18, 2022 at 04:04:01PM +0000, Richard Purdie wrote:
> On Fri, 2022-11-18 at 17:57 +0200, Mikko Rapeli wrote:
> > Additionally I'm currently interested in kirkstone LTS branch so would like
> > any changes to be there too...
> 
> The idea is that we develop things in master, then they become
> available in the next LTS release, not the previous one.
> 
> People somehow seem to think that we add development patches to master
> and immediately backport them to the last LTS. This is not how
> development or the LTS is meant to work :(.
> 
> We've not going to be forced into poor interface/API choices just
> because people want things backported to the current LTS.
> 
> This is why I'm so worried about the lack of planning and development
> happening on master, people need to be thinking and planning ahead. To
> be clear, this isn't just about this issue but a pattern we're seeing
> far more widely.

Agreed, I'm trying to get into working closer to master but not there
yet...

Cheers,

-Mikko

