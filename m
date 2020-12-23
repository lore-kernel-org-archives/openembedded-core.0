Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.6832.1608715330075759834
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 01:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=PgyNtXwM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id y23so5488533wmi.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 01:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=kQT5uVVAhJ8NLD70rDs3BiP4wS9xIxCG71vod/L2D30=;
        b=PgyNtXwM4qS6M+45hLfIHyfsl9FnH4t1WPcs4SQVBKByoecgSyLdG/h7No2a4+P4BM
         saE+JwyzZVOG9JzHhmoyzhnPo5ybRkEAfcaltIDR6wMVLdvUhvgGIoH8lJB7i5XMViY0
         FRXEzCXiOmJqMBIuoIGYr6IBLKDGAj/an8p0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=kQT5uVVAhJ8NLD70rDs3BiP4wS9xIxCG71vod/L2D30=;
        b=rZAlrY4IL2sowYs1PP5zjpWybERyfm8YKQjWwSLqFbsmntufjIZGgBtIF7TvgEDycp
         QiZNRuGWo6YuTMw8zIQAdwyT25SHfF//bLQmrlYwIuAAZ2iqZ7oznRzGxCA5CsmVaOEM
         beZrPDkXTwFP/fIKfgpmIrr0l+muQ9wuWrJiate/5NOMkfXo4gGDfop7kjYvZ0Q5PJg9
         bUcaPo0Q4+gXAxb5LoDuJVtyUV+/GcNbnRkJbb+aZpIyF4oOtg47AmJ4YAWaGBcd0Wz9
         skTJ1hKh8sIhkzFXYL6HGWoFc5dRxK9GLQppgPyKaspb1XfdqNdio/OvA0T2w3MZwDoI
         ln7g==
X-Gm-Message-State: AOAM5315zj5fbaTpgz0KnGZJd9z9PzjJNeWu5OgEzWLCYbcgMg1sDZUa
	zIL3BVwnOC18jokyh3XO6XH+Xg==
X-Google-Smtp-Source: ABdhPJwYyn+vOIdwVt9RtY0oaMRMWrPy6hC8nBPt58LixJJwk4HfC8DP6kjLxozgo8WwWKapZpuI0Q==
X-Received: by 2002:a1c:e902:: with SMTP id q2mr25456953wmc.143.1608715328440;
        Wed, 23 Dec 2020 01:22:08 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.a.4.f.7.2.0.3.4.6.1.7.a.0.b.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.a.4.f.7.2.0.3.4.6.1.7.a.0.b.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7b0a:7164:3027:f4a6])
        by smtp.gmail.com with ESMTPSA id y68sm33240328wmc.0.2020.12.23.01.22.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 01:22:08 -0800 (PST)
Message-ID: <ae25e706b2f0074470d34553e14294ca77e5be55.camel@linuxfoundation.org>
Subject: Re: [OE-core] [yocto-security] [PATCH] openssl: drop support for deprecated algorithms
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Shachar Menashe <shachar@vdoo.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2020 09:22:05 +0000
In-Reply-To: <17790.1608715114795205463@lists.openembedded.org>
References: 
	<CAMKF1so=HXKOc0uqaWLVDu8fvQVBYms2W-N2y0S2vBSuPBYnHg@mail.gmail.com>
	 <17790.1608715114795205463@lists.openembedded.org>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-12-23 at 01:18 -0800, Shachar Menashe wrote:
> Yeah, the patch is actually targeted for dunfell branch, but I
> understood the policy is first merging to master...
> So I will rebase the patch on master and retest everything

I did rebase the patch and its currently queued in master-next to see
how it worked out.

Khem has posted a good follow up showing it caused some issues for
recipes in meta-openembedded so we have a list of the software removing
those algorithms caused problems with.

We'd need to sort this out in master before we can think about dunfell.

Cheers,

Richard

