Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.1131.1622760883440112813
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Jun 2021 15:54:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZmYwiqtY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id i94so2348868wri.4
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Jun 2021 15:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=JbpQDsBl1QLvMwmdR+FjWxrkerR/Gf0y1jLWNMrHblk=;
        b=ZmYwiqtY8KR6/CfK4RcDF7lRehin+V70tXhNZ5aY5To4kgdkYcXxVDToYN141J1+D3
         PdTOpcKU8UF29iYqpViBrl1d4clemk36TfNkDONySvRwa9sP8h0gvUpMhfL+j2Mv5BqY
         EZrRHp6s2rVRajknnZqx2tI/NKvogmSEWxJYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=JbpQDsBl1QLvMwmdR+FjWxrkerR/Gf0y1jLWNMrHblk=;
        b=FwkC1qv7GKPwiikjrxtavk5H6KeJ3CLU4u9Ljxxyo5mpFw/Jxbgq9BC2Y0TWuRmmBG
         bAB/rNz8L/Vxkt/vSRKiJ3mdocHscnsX/9qCTZ7SLqut8GKdyoLKTGaQiWf0xXfPBViT
         uuSu/ZuewiXkj/N6w1gAQNx39NH9AafHB1wsNs387cwaTDw4jyWMgnXRE3q6D8PbXJfD
         ZoejLMvatsb8jAYVLokSa1PYoyuoPzrFw3Kf/wz71LwcbLfQOFdj/cjLBMWjC0MKFw32
         2ZGxwTPFw/ct1oL6CDUsyucA8zGrvWThDCU58BB6+JSz4oB5l908Kvy9fAlxdj9ulScv
         dZSw==
X-Gm-Message-State: AOAM530RcWhIMFDigiXay/5o6XCnBm9cRcLk/VpwMPcLmLcnC2eIvGk1
	8bbHOfIU4UTXBi+662o81uMqiA==
X-Google-Smtp-Source: ABdhPJwwcSNsvc3nuI46VUKAmTtdJXZ2J5EDzxnQAOClcGFr3SioVIR8HAHYkBGRI9gcMGagPAX1iQ==
X-Received: by 2002:adf:dcc3:: with SMTP id x3mr647534wrm.177.1622760881695;
        Thu, 03 Jun 2021 15:54:41 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:1fce:265d:903f:2948? ([2001:8b0:aba:5f3c:1fce:265d:903f:2948])
        by smtp.gmail.com with ESMTPSA id 125sm7488131wmb.34.2021.06.03.15.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 15:54:41 -0700 (PDT)
Message-ID: <25117a5d416119bb7432e250b9d5377d073c4251.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] util-linux: upgrade 2.36.2 -> 2.37
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Thu, 03 Jun 2021 23:54:38 +0100
In-Reply-To: <1622704403-26153-4-git-send-email-wangmy@fujitsu.com>
References: <1622704403-26153-1-git-send-email-wangmy@fujitsu.com>
	 <1622704403-26153-4-git-send-email-wangmy@fujitsu.com>
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2021-06-03 at 15:13 +0800, wangmy wrote:
> avoid_parallel_tests.patch
> Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
> removed since they are included in 2.37
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  ...d_2.36.2.bb => util-linux-libuuid_2.37.bb} |  0
>  meta/recipes-core/util-linux/util-linux.inc   |  4 +-
>  ...RA_LTLIBRARIES-instead-of-noinst_LTL.patch | 49 -------------------
>  .../util-linux/avoid_parallel_tests.patch     | 20 --------
>  ...til-linux_2.36.2.bb => util-linux_2.37.bb} |  0
>  5 files changed, 1 insertion(+), 72 deletions(-)
>  rename meta/recipes-core/util-linux/{util-linux-libuuid_2.36.2.bb => util-linux-libuuid_2.37.bb} (100%)
>  delete mode 100644 meta/recipes-core/util-linux/util-linux/Automake-use-EXTRA_LTLIBRARIES-instead-of-noinst_LTL.patch
>  delete mode 100644 meta/recipes-core/util-linux/util-linux/avoid_parallel_tests.patch
>  rename meta/recipes-core/util-linux/{util-linux_2.36.2.bb => util-linux_2.37.bb} (100%)

This threw warnings on the autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/3794

I aborted the build run.

Cheers,

Richard

