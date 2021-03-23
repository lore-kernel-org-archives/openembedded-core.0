Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web12.693.1616539537038773376
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Mar 2021 15:45:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=IE3Zia3X;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id x7so10717wrw.10
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Mar 2021 15:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=R0Ozn/WxfdAQCdIeBFjp70z0KpEgkF3sWxKHFaBv6t8=;
        b=IE3Zia3XMVlV4HsZewD0sqObx/elMzwZ68QgO+z6ok8L2P+P20bh255PPv/hL7zZih
         14boZBdMUzyBt5jno64ykqusHrx2EBovPe5ztrK7Xjvbe93oKWbyd+BAs63BaiZuuUk0
         eS2lbRHynsfkrKhhWphbESH1W41MjZQe+5ZsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=R0Ozn/WxfdAQCdIeBFjp70z0KpEgkF3sWxKHFaBv6t8=;
        b=md+Z0vXYKWXzTTu2a93S0QAZben032B9lrQV3JyOpfws3rCq2nS8fDEpdRVvvwkama
         3VSr1OdxoKKWNSUE2kJNs+OHnGB/tEPFHjpSXnJ0MMHr12r6VEEgQ/3G6eUgFogQoTVF
         Aw7KlN7y4FQzcON/Ju9Bby/x9Yf3kPULcVX+S2tu0ntQRRpIS6O+IKhns8NFIw8L0CJ+
         T6aSAhCsQrJjNRh0oeei3vckBsJbTC3twmvLMVXrKJm+KIrKzihqFg5+DbZSePiz8HI5
         9mBLlEt0VgGyIcKkDqrVAIug4Rig4AvvhZxGG+SlO+KlEAa41nWKE9LQ9rbqmjg1WojU
         0Rvg==
X-Gm-Message-State: AOAM530VmBE98yfooigWw1BJj20cU0VcvN4i0GWhulaexAatksu/7Q2X
	IaQcGCwO+oFc9Z603EFNe0apuQ==
X-Google-Smtp-Source: ABdhPJwSRE/82sdoqdd78Cdoh3g9mPNw7VeDSioEJaqEx0iZCjcMqndXTe4lmTWgPrKBSQ52Fd1B6Q==
X-Received: by 2002:adf:f841:: with SMTP id d1mr241789wrq.36.1616539535211;
        Tue, 23 Mar 2021 15:45:35 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from ?IPv6:2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93? ([2001:8b0:aba:5f3c:6fe3:771d:8d45:4b93])
        by smtp.gmail.com with ESMTPSA id f126sm234664wmf.17.2021.03.23.15.45.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 15:45:34 -0700 (PDT)
Message-ID: <48a1fdaf1535daf49500ed7ae3551bc7099e4940.camel@linuxfoundation.org>
Subject: Re: [OE-core] PR Service and eSDK
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, Patches and discussions
	about the oe-core layer <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Mar 2021 22:45:34 +0000
In-Reply-To: <4196565e-34b9-ae0d-dbaf-c3292efa1ba0@kernel.crashing.org>
References: <4196565e-34b9-ae0d-dbaf-c3292efa1ba0@kernel.crashing.org>
User-Agent: Evolution 3.39.2-1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2021-03-23 at 17:34 -0500, Mark Hatle wrote:
> For some reason I thought if PR service was enabled, when the eSDK was generated
> it would export the pr service information and include it within the eSDK.
> 
> I'm not finding the file, or even code that does this.  Am I having a fever
> dream, or is there code that should be doing this?
> 
> What I'm trying to build is an eSDK that the user can use devtool and construct
> a new version of a package, then they can deploy the new package within their
> package feed to update their targets.  Without the PR service in the eSDK, there
> won't be any way to get a correct PR number.

I know we copy bb_unihashes.dat into the eSDK with code in populate_sdl_ext.bbclass
for this reason for hashequiv.

We do have prserv export and import code but I'm not sure anyone has integrated it
with eSDK, or if there is integration, I can't spot it atm. I wondered if it copied
the prserv database from the build directory over to assist with this issue but
again, I can't spot it.

Cheers,

Richard

