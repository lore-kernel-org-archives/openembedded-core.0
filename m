Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.8208.1608726751402449247
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 04:32:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=C2nxo5UG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id n16so1302295wmc.0
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Dec 2020 04:32:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=FALaDnt8sG8JwVz6YJQdyHdLyKSy9dkiveOlyeAGuAg=;
        b=C2nxo5UGn4zsMI9IXEcf88rRwbImpoZ9rAtT+xH9bL7cr8P5g+dNw9kFj2w9DMEdC5
         Fk8n2wSjNfJnbIkVXZriH72hocFdjIxTaqB2HQ8hGSnc4Yy0pIvQzZIBeTHap6p/MQ/N
         aoFY+ulf9G315MujYqRvD6CuWvDi/7guBfizc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FALaDnt8sG8JwVz6YJQdyHdLyKSy9dkiveOlyeAGuAg=;
        b=D4Rqh4l1Kw4mzZjoWXAwwGqsYJKHu6F0tuOPJPUET7dorNg9xZYL7a6zaWOMvAnRYp
         seL2NdEZ018XvZGEE0qyFpxm0NZam6OfBI5O+Eb5t6uFv2/jshXbRC1TwjbR4wXsQtuk
         F0UVCtuL517QiWzNS02s/jaka+z225ndiXLJ8ja9B7+MW2nDAEsGhG/1RMVFbzheejm3
         BJtxdjOPbdTZjdBEiA4WyKmFU4aLrAZPtveW9j+YSYAs6rfQ4rFxQbcQmIg3IOgbO0yZ
         gn+Kn0kp1K3GuSBNo0DLwuTdj3Wp3o3z1oV2pXvZ7OyTq9IGNFxt4NxpwaR6XvBSUQBu
         pWgA==
X-Gm-Message-State: AOAM530w1bj6XTVE5UKgRR+czcFqdsI11Il68Gp7UiAComfaitl9iXaM
	hN5AF9sxohBrLwli7JOYmoEilw==
X-Google-Smtp-Source: ABdhPJyvAsfZB+407QbkaXGICYa0Ol0HSMAw6IlsX5stu9fb8FuIdggx6SiHiqywBmtG5T+zElYHcA==
X-Received: by 2002:a1c:e083:: with SMTP id x125mr21768478wmg.0.1608726749677;
        Wed, 23 Dec 2020 04:32:29 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 6.a.4.f.7.2.0.3.4.6.1.7.a.0.b.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (6.a.4.f.7.2.0.3.4.6.1.7.a.0.b.7.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:7b0a:7164:3027:f4a6])
        by smtp.gmail.com with ESMTPSA id b200sm31383470wmb.10.2020.12.23.04.32.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Dec 2020 04:32:29 -0800 (PST)
Message-ID: <ef75b7d902ee23f65adf34742a71b1b8ee8c64cb.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/9] kernel: consolidated pull request
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com, Ross Burton <ross.burton@arm.com>, Jon Mason
	 <Jon.Mason@arm.com>, "Mittal, Anuj" <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 23 Dec 2020 12:32:28 +0000
In-Reply-To: <cover.1608646697.git.bruce.ashfield@gmail.com>
References: <cover.1608646697.git.bruce.ashfield@gmail.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Anuj/Ross/Jon: See below

On Tue, 2020-12-22 at 09:28 -0500, bruce.ashfield@gmail.com wrote:
> This is largely a resend of the configuration changes and kernel
> version bump that I had previously sent.
> 
> The kern-tools SRCREV bump has a tweak in the tools from the previous
> version, and there are specific fixups for the warnings that the
> tools were now exposing. I had to balance tiny and standard needing
> different values for some common options!
> 
> The AB run that I did is here:  https://autobuilder.yoctoproject.org/typhoon/#/builders/85/builds/1270
> 
> Everything looks good to me (but I only just realized that there are
> now multiple pages to check) :).

Thanks Bruce. This does now work on the autobuilder, it does also
expose warnings in meta-intel and meta-arm:

https://autobuilder.yoctoproject.org/typhoon/#/builders/113/builds/560
https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/1031

which gives me a bit of a dilemma as I doubt these are going to get
fixed in the next couple of weeks...

Ross/Jon: We also need to talk about the intermittent ptest results on
arm...

Cheers,

Richard

