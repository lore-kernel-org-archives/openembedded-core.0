Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B6A3C433F5
	for <webhook@archiver.kernel.org>; Thu, 11 Nov 2021 10:52:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.8854.1636627972657517705
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 02:52:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JMUZKgVh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id z200so4685880wmc.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Nov 2021 02:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=1HLEm2Dqh0vtXDujlwWblnrfVJHmxlpzxVNZZUX+3oI=;
        b=JMUZKgVhu5NniEjmn9yzaW+ol5hQbRNTRxwlR2BpRuVlzjhOip8DJ1s+3MIWqqlkrI
         FOn1QYk5qzHYBSlAJ9xqytPIDdYdqOQC+HUFZpM9a1lxOQtMkIjqxYtavOoWhK6Cc159
         ZRKLeKDjZqU+aqkXLF7wCa4KCWLGu0fxwnCh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=1HLEm2Dqh0vtXDujlwWblnrfVJHmxlpzxVNZZUX+3oI=;
        b=I40Yt+zac0ckYh9CN/JA1Qdbpda8WDxiUYIKXY582cpe0j8d1xZe9sbo7DVw+KykZt
         3wk3WEEFIJyyANQLp+M5O0RLl9lKM0rIVrOooIS5RBQHwuBk7jSeuBLJ230GlVGJ6y1Y
         6JkxbVL9TL2aQXHV0GdKO4SwFH4rraDobjq6E5ZZlpMJU0WPVTnXmSrSylW5zL6vwSga
         Ubv7V0+DtMqeF27hc90HjFqSjTZUmY862BwjmmZVkr53GuU+V5r1d+llhnsqS3qi+B3Q
         uqb5LOLL0wgPGXAYXSOjBBvNET9EtXQxXm/48an+PWezqBmC7t7XldI/gVYPARa9lvPC
         OXdQ==
X-Gm-Message-State: AOAM5306qEnY/ogKr3uh6GyDV1swcH9UBAzvMEUgDOKVlYDmDrI2Y0PO
	H6PmWC/zMjFXHs4+HxYGfFO+4g==
X-Google-Smtp-Source: 
 ABdhPJzEiy4UDMZFAJNiMQa+6GVskhbmlI/6DT5teErmU19cvHwckrVS2a9JmREt9uuCMUXeH+XlAA==
X-Received: by 2002:a05:600c:1c8d:: with SMTP id
 k13mr24272238wms.177.1636627971096;
        Thu, 11 Nov 2021 02:52:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:b19:11f4:a3d9:cabc?
 ([2001:8b0:aba:5f3c:b19:11f4:a3d9:cabc])
        by smtp.gmail.com with ESMTPSA id
 h17sm2618460wrp.34.2021.11.11.02.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Nov 2021 02:52:50 -0800 (PST)
Message-ID: 
 <2b9ba7bd51f000db26c242f5ca3553b78b661a17.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/7] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 11 Nov 2021 10:52:50 +0000
In-Reply-To: <cover.1636549444.git.bruce.ashfield@gmail.com>
References: <cover.1636549444.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Nov 2021 10:52:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158163

On Wed, 2021-11-10 at 08:07 -0500, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> Here's the next round of -stable updates ... more active kernes, means
> more -stable!
> 
> I've also added -rt to 5.17 in this series.

5.17 is out now?! (sorry, couldn't help mention I'd noticed :)

> Finally, there is a non -stable patch for providing virtual/kernel to
> all kernel packages. I've had this patch done locally for ages, but
> my configurations are not as complex for multiple kernels and composite
> images as many .. so this is more of a RFC, to get feedback on cases
> that i've missed, or if the AB will pickup a problem (I've marked it
> with RFC).

It makes sense to me and seemed to work ok on the AB so it merged, thanks.

Cheers,

Richard


