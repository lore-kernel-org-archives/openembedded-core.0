Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2214C433EF
	for <webhook@archiver.kernel.org>; Tue, 11 Jan 2022 21:38:07 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.14684.1641937086404900207
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 13:38:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KrLTuU0p;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id
 25-20020a05600c231900b003497473a9c4so2264932wmo.5
        for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jan 2022 13:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=ysq8kEmcNE2daf2L0LITAoDCKHzh+1eDRctX299c3p0=;
        b=KrLTuU0pl+AEOB3kSXIl0uVwHbxTHIWIQD+Bdm9XZxcKpg4oCJDkdmAaEKiAKTtpPJ
         Tgef6ELx0Z+I+e2T6vhRCoEOq2zYStCLQnSDzfRm5T93FuvyAS1alWwkcscB+Z4lKLpl
         tOytq0EIRmQXxRglXCWIFLZHy1OahPptrD7xU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=ysq8kEmcNE2daf2L0LITAoDCKHzh+1eDRctX299c3p0=;
        b=NJG52aHfj8+V3NpBgubaIomRibsAj9RAHJDugaUkO7erhL0eWTsOWKA99Lskji/27c
         wjQiNpk89Z7dqIret6VAtvIzDljgimvCN/xjcM770E/dJaJosvVIWa/S8Q7jtO7SZnhe
         Pv9yk1aLsEYAw4RC4nPtUKpeU91/7v5Dib3eWDtJ+pRBhOp4KKfUlwCdkYTD/aQxSp5x
         0HlZMnTrXckhwjHHt+hYiDZutAzQfjCg8Rt4sBVk1Dck3HSmc/JvBPmOllRfVGZNJWCv
         VybOV/+LMfnE4SP2XRj8zJvQH38mtAkj691er3LBB07vV6PxsDHtLxvrU2EB9eyBaMOT
         yPWA==
X-Gm-Message-State: AOAM530GfBF+wGf+eA6+/PiILbnbVjjwP6DuJjF2a+B/AzrcjnRjOuJn
	W0zDoxxLb0zIqcwLjfh6PNwIDA==
X-Google-Smtp-Source: 
 ABdhPJwo+no921LSqpGwbBK3xIqYFNVupLsHb2F3HNlu8Vfwe/4WohpHvthviNjSG7WdQK/iamx73A==
X-Received: by 2002:a1c:2b42:: with SMTP id r63mr3994062wmr.80.1641937084889;
        Tue, 11 Jan 2022 13:38:04 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:60d:9770:8e9b:817?
 ([2001:8b0:aba:5f3c:60d:9770:8e9b:817])
        by smtp.gmail.com with ESMTPSA id
 v5sm8659676wrq.80.2022.01.11.13.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 13:38:04 -0800 (PST)
Message-ID: 
 <78b27a311d2c7367edc36ed3dc7f59451e5b9fb9.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/10] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jan 2022 21:38:03 +0000
In-Reply-To: <cover.1641923693.git.bruce.ashfield@gmail.com>
References: <cover.1641923693.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jan 2022 21:38:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160466

On Tue, 2022-01-11 at 12:59 -0500, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> Here's my next consolidated pull request. The -stable updates are
> routine, but I've included the default version bumps and dropping
> of 5.14 in this series.
> 
> My AB run showed some ping/ssh failures on sato, but I haven't
> reproduced them locally. So I wanted to send the series to see if
> the issue is real or not.
> 
> There are updates to 5.14 for configuration in here, followed by
> removal, but I wanted to make sure the SRCREVs for that version
> are fully up to date before the drop, so we can use it as a reference
> for older releases and any remaining users.
> 
> We've already sorted out 5.16 in master, so I'll be moving -dev
> to 5.17 in the next couple of weeks, and we'll be ready for whichever
> kernel version fits the release timeframe.
> 
> I'll send updates to poky/yocto-bsps separately.

Thanks, my first try at testing this blew up as the bbappend for 5.14 was still
in meta-yocto. I've added a patch to remove it there too.

Cheers,

Richard


