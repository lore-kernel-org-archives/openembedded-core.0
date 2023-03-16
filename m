Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FA7C7618A
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 08:11:06 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.7284.1678954265001330077
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Mar 2023 01:11:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RjAT34/c;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id g18so616999wmk.0
        for <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 01:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1678954263;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8psbrGCKIB+f6U93otkoQ7X+9OwfBcsoEARSqiW+pmU=;
        b=RjAT34/cR4/fuL5j2iy6in1eKm7+iwO794hYAtBDaZYMydBVzbZgIszMQmMeLweNxD
         0ba7ZvVFBO/buO2kT0xVq+553S6KEm8kZRrksONWVGF7FX2UsjhX8r3tKrXeDHLrq9g6
         phHOvA0ahBBflou9UBsGasEYSWD+f5zFyLr4I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678954263;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8psbrGCKIB+f6U93otkoQ7X+9OwfBcsoEARSqiW+pmU=;
        b=xiac5ZBRpkYOqcEw/7WxsFWd3KMyyWUmb1o5E4X/4/6FF9J3klqfIuaNC4NJa0NLOQ
         WyzZYxU3M5XNkI4gae0a6XIywtC/dogEhkM6MCWHTl2fM5g5LmXdNFf5D81raSVQikjD
         gHBCxHKXgJxAShzJpZ/1X1H6YLFRPqxHi+plhqJcweEn9ThUJ2PELnHbLTLCTtqMKcin
         YAdHJa61d0iUHrKq3i7lwylyx/z/P30Mkmt4cNdfvuNXOAjUvcLqe+DT2awYpA1weB4d
         VdGrCeCqXr/HxNfRstyS6jVnkFPFXoyEZdh8SE1jHyNOiaJ6ETS7g9ApYShAJQ7YGDKC
         6m8Q==
X-Gm-Message-State: AO0yUKVtIl8eaotW6aJWRKviSEnTAxrBFHA7fbBXd4CgaKhZT+3SlKtE
	mgdlkITW5oAus+pe54jrxhnEvA==
X-Google-Smtp-Source: AK7set/Xvc+gyCSdQ33OJelfMxSbsRqHsbDkcRh1x4emZ9NiAwPboT0IAtc0/7VqPtR1P140qsJkKg==
X-Received: by 2002:a05:600c:4f54:b0:3ed:454d:36a1 with SMTP id m20-20020a05600c4f5400b003ed454d36a1mr2078626wmq.2.1678954263326;
        Thu, 16 Mar 2023 01:11:03 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:4181:67:6e43:6a9? ([2001:8b0:aba:5f3c:4181:67:6e43:6a9])
        by smtp.gmail.com with ESMTPSA id z13-20020a5d4d0d000000b002cfe1377fb1sm6483052wrt.70.2023.03.16.01.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Mar 2023 01:11:02 -0700 (PDT)
Message-ID: <4909d0d1ebf1cb85ee289d31a301f70df3a5ec0d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] grep: upgrade 3.8 -> 3.9
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Cc: Upgrade Helper <uh@not.set>
Date: Thu, 16 Mar 2023 08:11:02 +0000
In-Reply-To: <1678878683-19486-1-git-send-email-wangmy@fujitsu.com>
References: <1678878683-19486-1-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Mar 2023 08:11:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178675

On Wed, 2023-03-15 at 19:11 +0800, wangmy wrote:
> From: Upgrade Helper <uh@not.set>

I noticed a number of your patches have this set which is incorrect!

Cheers,

Richard

