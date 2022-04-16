Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14138C5AC75
	for <webhook@archiver.kernel.org>; Mon, 18 Apr 2022 14:25:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.17159.1650102646972462266
 for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 02:50:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SPd4ZPTg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 123-20020a1c1981000000b0038b3616a71aso6205593wmz.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 16 Apr 2022 02:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=LmL1HwxUbK9SRMKA2Jp+NgX/9jlvhRfBjThI3praLYs=;
        b=SPd4ZPTgL+CjbF/DYCSkYd/3LbL2BdP8MIcxTsOI2YtX4A4yNA+Me6M8CV/aR8USBx
         OIV4wiE2TM+h1nmuDtVNTbdPWnhSGiFcWq4PR9tjfPlR9hecn1Fi36o6zu/UIJFaoPES
         9Hf8gM2Gc4iCevEX3+sbufizKV96RZIvGc2pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=LmL1HwxUbK9SRMKA2Jp+NgX/9jlvhRfBjThI3praLYs=;
        b=1LQJKMGcnFvLNZlyZrtm9sCazpvTqmUzAL9qlJbA7p6nPUzibAXw4zRRodL8/FdL7T
         +b8d7wASEOWghWLMhdJlXTS5AkPHSBbzzSLJ6Fw9srn/qUVmq5GB6zv9AS8hfc4K9JSG
         yvqFxeHQb1GY57Etgcw67Y+sKS2L7RyiLn/aRHL/NRsnL0sBTYkzTcU869tfYSNuUsRH
         Z+AA4KpIHfyoz/OhuklV51sEMwexA0XNujrPYpfjyX9mVjY51je2Wmgb5ABrAzWk5wef
         QJI0bNV5zJ07TnBDepB/Ran/4VNmZaK+bW+DuC5EXaxI+qbQZsm0ec1ojdlWT3yqaHyW
         vYBg==
X-Gm-Message-State: AOAM531XC1EOMjRu+MxAPdS4m+TOKEHEP5/qI8Zw2n1DGYNuQduXydT9
	TzFCTevAWBJ8gXMjueMmM/M2zDvk3KDHAg==
X-Google-Smtp-Source: 
 ABdhPJwSxOb8zIqy2pDO6nKveYxTpnOHaywNvrbmxTw1L6CZhiAajNXafy/gs0auRMlOuR4O6218pA==
X-Received: by 2002:a05:600c:4255:b0:38e:d7c5:d77e with SMTP id
 r21-20020a05600c425500b0038ed7c5d77emr6702342wmm.115.1650102645455;
        Sat, 16 Apr 2022 02:50:45 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:78b1:67ef:e54f:6288?
 ([2001:8b0:aba:5f3c:78b1:67ef:e54f:6288])
        by smtp.gmail.com with ESMTPSA id
 p125-20020a1c2983000000b0038e5ca446bcsm10895629wmp.5.2022.04.16.02.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Apr 2022 02:50:44 -0700 (PDT)
Message-ID: 
 <428626f1e547d6d3c17c3b6f19ff3f161fb6d8e9.camel@linuxfoundation.org>
Subject: Re: [OE-core] License mismatched for libxshmfence_1.3.bb and
 recipeutils-test_1.2.bb
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>, oe-core
	 <openembedded-core@lists.openembedded.org>
Date: Sat, 16 Apr 2022 10:50:41 +0100
In-Reply-To: <8062c9cb-3fee-7c9c-ef87-a19b777ca2c1@windriver.com>
References: <73be0c1d-e8e8-5361-5132-62f2c837205c@windriver.com>
	 <c79d74d02d7f6b58628fdb4521f60808c2d55020.camel@linuxfoundation.org>
	 <8062c9cb-3fee-7c9c-ef87-a19b777ca2c1@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Apr 2022 14:25:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164529

On Sat, 2022-04-16 at 17:48 +0800, Robert Yang wrote:
> Thank you very much, I'm trying to run the test cases, but I found that you've 
> already fixed them, thanks again.

I don't know why it was set to proprietary in the test but it doesn't seem to
cause any regressions so I removed it. It is at an older version which should
mean it doesn't affect other builds so I'm happy to leave it on the older
version.

Cheers,

Richard



