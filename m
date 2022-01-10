Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D9BC433EF
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 15:44:24 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.33590.1641829462775957042
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 07:44:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KB2meGMj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id a5so23615661wrh.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 07:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=Y2n39fY8OvM7N+Kt49bEywWXapvCeP6w5oW6AShlT4Q=;
        b=KB2meGMjkHgRRok5kfd/7BEOJSY9OQwjYAdSU2/tcPMxm5EwZSB9DjngskchcCxsa+
         tHcMZinqxZB7EC6hiFeHLttXTHaLcVnzhDIXhLiIWu9QnJZJ/tX6TPWUPBgu20ar7wm9
         nx9Jt6ibwxQDDSXJ5GLkBir9BgPl5LEhuCZHg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Y2n39fY8OvM7N+Kt49bEywWXapvCeP6w5oW6AShlT4Q=;
        b=F/sRHRpEXXtUEI+IZLX5YHxvlaRYnaB7+HIWHAXi+xX4Mizf4K/dykLORNG17ORAuA
         LnvtKX4SrSrKK/g4CYdKsTUN0V0HJCfgQpMHGi2hLPj8Dm2lW18Hku0lgSvb+RY//RSv
         RlU5xx0p0PhduUcsURNN9X09cxFjs1DuQgSca+u29nnQuf5iAknRe6nw9mWVW7T+rHYf
         QtYiJztQm9PI+CR5hKT8OZSED4BlNgkBrorpjlmirv45VdPCcV4Fv1ZTfPB1LwAR9J73
         0Ye+4yYk0fv3A1c0KOsNEaak9OO6tRRLsEYh8zXVDrg2o9wdREgrdfRyGgvkKOoU0I9L
         uqbg==
X-Gm-Message-State: AOAM53389stYXW1plnqivW7eSD/PD98/LXZTibMzkl56zVvcK3KUC+vb
	nDYP11wji/w6msCy9YZ09M+d4A==
X-Google-Smtp-Source: 
 ABdhPJzEMwMODV8/1nGza6kHSQKVg/j0KOVUUZOwC5ZczX/CXTC7MqohZQ15GFNKBKk9KtchMkJM2g==
X-Received: by 2002:a05:6000:1e1b:: with SMTP id
 bj27mr194406wrb.648.1641829461241;
        Mon, 10 Jan 2022 07:44:21 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:988f:80f:f286:3191?
 ([2001:8b0:aba:5f3c:988f:80f:f286:3191])
        by smtp.gmail.com with ESMTPSA id
 a2sm8002718wri.17.2022.01.10.07.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 07:44:21 -0800 (PST)
Message-ID: 
 <71cf0c9e5896ea005d3cfb75a67e8982f2a9aff0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rootfs-postcommands.bbclass: Change the
 default.target location
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 10 Jan 2022 15:44:20 +0000
In-Reply-To: <20220110153733.29006-1-pkj@axis.com>
References: <20220110153733.29006-1-pkj@axis.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 15:44:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160371

On Mon, 2022-01-10 at 16:37 +0100, Peter Kjellerstedt wrote:
> Rather than adding a default.target in /etc/systemd/system, modify the
> one in /usr/lib/systemd/system.

Why?

(the commit message needs to say why as well as what it does)

Cheers,

Richard


