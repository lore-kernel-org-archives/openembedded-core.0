Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.16915.1603306965396823095
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2020 12:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ImmKBuzF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id e2so3722489wme.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2020 12:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=9CS1JdrnAHPqHsub//5E5mP+STM+FbbcHVDkilm2wuY=;
        b=ImmKBuzFTqfwfZLtD3VMTNfMB2jnOXXBKF6hWbfNoc49tFIIhfxIAPEO29cX2lattX
         aF3LlFF+b/+IIyNKzrq3fx9LKsuS2UIKPhInQLwCX43ug2r7DsOkxiHq1t1MQbypaHT0
         NGDB/y4blTclbSKPipab1Inlk4ks1azxx5l0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=9CS1JdrnAHPqHsub//5E5mP+STM+FbbcHVDkilm2wuY=;
        b=Ewh4PHqACEzcNm1AFA+1XE09pKnMXkpTimPN4UyC/uf5HuxKUQ6oILqiVJ3QqwvcSz
         +5LlCKGZ8UMg2XWmKuV/jAIeh/jRDJZJyjtoo7og53RIvo8c2V3GesjuPq/iJuuJsgEM
         jtwyq3c+odC4sLsp/fGehI4w0upPsQG0vOizcElPLw01JdwRfMn3NJ60v7eEeqVL446t
         Np/Q+ZIrvPGqqflwSaxjQvR1ID9i9Ll1RbeasVtilM98SChRmADE8zZs7pfkNzbAT5Pr
         BEuHzFKxWJzjUnXsmQ8J/ZmIEp2OEwhmZhcfKXirKHc5owQ3UzHH1IPHUKLbQo5fiw2w
         bhNw==
X-Gm-Message-State: AOAM5334jeB0DSUT7AMEW60AXqQEIklvJ2HOW40ho7pihYzw/YkYlcfB
	Y/wo4q91VbbBaDgd2++F242cxA==
X-Google-Smtp-Source: ABdhPJzlvypyc+xRpo3dn51E52S69XV2Df+TSH7DAWIJHyvb38mC6rrbGjXk/X/nSvz+tH4xbCS3SA==
X-Received: by 2002:a1c:2e0d:: with SMTP id u13mr4907206wmu.179.1603306963822;
        Wed, 21 Oct 2020 12:02:43 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from 1.4.2.6.b.f.7.8.7.6.9.2.8.f.1.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa (1.4.2.6.b.f.7.8.7.6.9.2.8.f.1.f.c.3.f.5.a.b.a.0.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:aba:5f3c:f1f8:2967:87fb:6241])
        by smtp.gmail.com with ESMTPSA id x1sm5227734wrl.41.2020.10.21.12.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2020 12:02:43 -0700 (PDT)
Message-ID: <5d383a0d9c3aa724fc1aaac4fcd6d75fe5f2dec2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] Add new recipe for squashfs-tools-ng
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Luca Bocassi <luca.boccassi@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Wed, 21 Oct 2020 20:02:41 +0100
In-Reply-To: <20201021155857.2841570-1-luca.boccassi@gmail.com>
References: <20201021155857.2841570-1-luca.boccassi@gmail.com>
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-10-21 at 16:58 +0100, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
> 
> The main difference with squashfs-tools is the availability
> of a shared library and a programmatic interface, rather
> than just command-line tools.
> 
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
> ---
>  .../squashfs-tools-ng_git.bb                  | 37
> +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta/recipes-devtools/squashfs-tools-ng/squashfs-
> tools-ng_git.bb

Should we be switching over to squashfs-tools-ng and removing squashfs-
tools? I'm not sure we want to support both versions?

Cheers,

Richard

