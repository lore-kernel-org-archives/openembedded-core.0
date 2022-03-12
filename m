Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CC9C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 14:04:37 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.4738.1647093876576096026
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 06:04:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=XGAJrH3W;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id c192so6690958wma.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 06:04:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=cN8X5eYc3WiJR6nrYevLB0LKWVoBMMJwD1NPdAqKBho=;
        b=XGAJrH3WE/FLlDQC9N439K8Obi0v6/cgj43k1d+tMGNASozguiYwvn3HXMhrcctOKi
         NQ9oQMHTvCuWkyncxymfwdoia4yTh/HmSlkmExsav2cArAXcR3QtGQjfKnRasdInz4ln
         CdA7/9qJE81OoziS2QYAfWH/oyBYz90rbT8Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=cN8X5eYc3WiJR6nrYevLB0LKWVoBMMJwD1NPdAqKBho=;
        b=G/EhGuCeTFQbnF3GXyBYhtllr15z85te9N/syNmLkCgHYz0rEqxFQjk7Z6dyqRYxbU
         7Q4m60pbuGUDtVRrtXpI73MVc6XViBn/8ft/Z3Rx7hsCqbHq8HTmJ9an+FLP6wIQfoUC
         TpuYCX7tedCsQQdPcCOZRuY9VmCrBrB2KmvkE7Zm3+Ypnw1KDPzYKD+dLySMKw10IKqU
         7gABamLZzVVKKyRCrCOUkJZX320rKGO2N0zi3aJKfLCnJtdXcbBFk90VjkiBfJelqofG
         PIlgqXJMPi339nnHudwZqFDpVRaUEKK5PlCHa4aixXOYZ9xY1Cne4ZtKRpTqIY1goGHt
         wbsA==
X-Gm-Message-State: AOAM530+2/oM90uUgwdp/X8ngyVQJUnfJ3r3jukClg7CSaTzEDtJLqNs
	KuAADWvJrWnYBluNpBuMzXW9DQ==
X-Google-Smtp-Source: 
 ABdhPJwpOk8Qq+3szZ9Ev860f7srBHcKcfKyKYY6j8hp9zyl7QiU9pQ+D1z2TQ8U+JDA5MoSStR2Fw==
X-Received: by 2002:a05:600c:1990:b0:389:d72d:ca77 with SMTP id
 t16-20020a05600c199000b00389d72dca77mr11046517wmq.1.1647093874697;
        Sat, 12 Mar 2022 06:04:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fe04:8f35:800e:f4a7?
 ([2001:8b0:aba:5f3c:fe04:8f35:800e:f4a7])
        by smtp.gmail.com with ESMTPSA id
 q23-20020a1cf317000000b003815206a638sm13187913wmq.15.2022.03.12.06.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Mar 2022 06:04:33 -0800 (PST)
Message-ID: 
 <aca7cb219caaaead1f29d3376cf0176a45b964c9.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 2/2] libxml2: update to 2.9.13
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ralph Siemsen <ralph.siemsen@linaro.org>,
	openembedded-core@lists.openembedded.org
Cc: tony.tascioglu@windriver.com
Date: Sat, 12 Mar 2022 14:04:32 +0000
In-Reply-To: <16DB979A6291AEB5.27059@lists.openembedded.org>
References: <20220311165855.3477645-1-ralph.siemsen@linaro.org>
	 <20220311165855.3477645-3-ralph.siemsen@linaro.org>
	 <16DB979A6291AEB5.27059@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 14:04:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163089

On Sat, 2022-03-12 at 09:19 +0000, Richard Purdie via lists.openembedded.org
wrote:
> On Fri, 2022-03-11 at 11:58 -0500, Ralph Siemsen wrote:
> > - new version includes fix for CVE-2022-23308
> > - drop two patches which are upstream
> 
> One of the patches is upstream, the other isn't. I can't see any patch adding
> pkg-config support to libxml.m4?
> 
> https://gitlab.gnome.org/GNOME/libxml2/-/commits/master/libxml.m4

I added a fix to the patch to resolve this one since it was just caused by
typo/message fixes upstream.

Cheers,

Richard


