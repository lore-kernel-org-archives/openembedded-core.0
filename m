Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88A8CC433EF
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 23:20:22 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.960.1641597621498813397
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 15:20:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=WC3WwgDe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id l10so13814770wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Jan 2022 15:20:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=AE/rnQ0zTB5Uj4yacsrsvrmq6dFCijcMljfJyk2Whi4=;
        b=WC3WwgDeLzQQN1EKMynES/hwyDd2AI0HkUuIohxUwN0CCKx3Ic2ea+lrGwKLpoGGI0
         iK7FGVeFXUr7RUALa9yIcTZNG27EluuR8zYVCBW7dv3uj3XhGwUsvo/FBjmJITkySWze
         PPsqkoMGpl/s2K7/XzGbcTdlOR+CpDNnKSs1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AE/rnQ0zTB5Uj4yacsrsvrmq6dFCijcMljfJyk2Whi4=;
        b=F4JCU7I+QPSIzh+9vstC1h97brYcAr+ssG5jY8kc8W6wfX7jkJdufXfM5bmyp1RgbR
         BAzqk9Z1y8SRHmslgsStkpY+trdQeKRTMdB6HZ66XLNU4CRgzPOM1M2mn0r62npX21ii
         /maoss395k8k0dkP7XGm3FCzR9uRifXUmgpkB85cnUQTUAEKDIEkNoIFpy27DAN2umIq
         gfAJlfczxFP9Z0Q2P5tSSB3AmI6mmvfvNaZjbRI8roFhYDB5dNqjSFzd2hDAo9ND0MqC
         Qzj9ZioCq/4NQr3WF4e06t0PBDsNVz4tCdCqUXTF2+Ndh+RuSO9xXSdqdBeyghzu0uxL
         3TcQ==
X-Gm-Message-State: AOAM532cihJgItvm6HbV1ZrJOi6XwjOsE6QGRS3Q2Vz+j413QjrVGbP7
	HzOgRhYs4e2ysO+eI1U9PMKtrTAIUP3WxA==
X-Google-Smtp-Source: 
 ABdhPJxMq5W7kQii9rQZDVjDD8N3cE9ka0BRssl9tG9+X1nILtPqBA3SRoqga6E9/GKFVvf2p/bQzA==
X-Received: by 2002:a05:6000:118e:: with SMTP id
 g14mr3748853wrx.12.1641597619958;
        Fri, 07 Jan 2022 15:20:19 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:9055:f73b:1aa9:bf82?
 ([2001:8b0:aba:5f3c:9055:f73b:1aa9:bf82])
        by smtp.gmail.com with ESMTPSA id 1sm75863wrb.13.2022.01.07.15.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jan 2022 15:20:19 -0800 (PST)
Message-ID: 
 <857c4913071abe70b2387967d8cba8e35eca56e0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] xserver-xorg: 21.1.1 -> 21.1.3
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, openembedded-core@lists.openembedded.org
Date: Fri, 07 Jan 2022 23:20:17 +0000
In-Reply-To: <20220107151918.2061-1-kai.kang@windriver.com>
References: <20220107151918.2061-1-kai.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Jan 2022 23:20:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160274

On Fri, 2022-01-07 at 23:19 +0800, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> Upgrade xserver-xorg from 21.1.1 to 21.1.3. It fixes CVE-2021-4008,
> CVE-2021-4009, CVE-2021-4010, CVE-2021-4011 in 21.1.2.
> 
> Adjust indent as well.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  .../{xserver-xorg_21.1.1.bb => xserver-xorg_21.1.3.bb}      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.1.bb => xserver-xorg_21.1.3.bb} (84%)

I merged an upgrade to .2 so could you rebase please?

Thanks,

Richard


