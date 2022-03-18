Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321A8C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 11:35:47 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.8685.1647603346525400487
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 04:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dfiYOQUI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id
 bi13-20020a05600c3d8d00b0038c2c33d8f3so3886994wmb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Mar 2022 04:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=yZHs1UJ7X5S1VGXeq1Pp7uX/F8ejuNsxX4qyKIvpwVg=;
        b=dfiYOQUIqG4GIi/cuIW58BfUSSWVPX/XW24UJW6s2NRxbIsZ3k1+FOstkgtYPR98ou
         RVLzbBTz95KDcUCijCfGfY1j2gb8nxIKF6OWZouF7iPw9jvypDupIO8SqSn+p2Ir4V/h
         38D2W0MO8RhKpqVKPyrBdq0AzCEP6xNgtx8Kg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=yZHs1UJ7X5S1VGXeq1Pp7uX/F8ejuNsxX4qyKIvpwVg=;
        b=IX4cBep4eScl8EFxfvgOtDy9uDVHWIiHLPckRpTfDDularbpH//uVwiQJS9tfiH9SN
         v/2KX7CTXxQgQhKtW1hM8SJQ3l0NUZ9avm90kwrwmxF7IdZk9nK/S//dwTic3a0v4ZCo
         OPkt+I6/GO4olc+xSb1E/j1sYCSQB0UlDkOrMPoD8cqP1GC1dbeGqQsWTBK6CbBZ4/fi
         YjKlwTslah9bppftpJvU97KQ85da9uAEqerdK5h6m1lFQsIKC+5DkSc7yeyPykGBfmCR
         7zDSNxSBY6N0IGAIgyY8Qt+ZwwL7Vvg8zqFnGKaD/gzdBvf09hO3EC9HE7G3NCBmnSfa
         COBQ==
X-Gm-Message-State: AOAM532KQhDYGfOCiXIO1nKj0i5kgYeMJWe/G3p6SJUrbCOU/Aa6Zf45
	un632UP6mDURWZEvE3DmTZkcKg==
X-Google-Smtp-Source: 
 ABdhPJxoiTe66JMA9QGk9755HvBxObki7aP6ISf8lYGv5PgZLHDHk/+1ITz55NK2KxlAMAkZzAwCYg==
X-Received: by 2002:a05:600c:3c8a:b0:389:cf43:eaf6 with SMTP id
 bg10-20020a05600c3c8a00b00389cf43eaf6mr7632315wmb.199.1647603344969;
        Fri, 18 Mar 2022 04:35:44 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac92:797e:3dcd:ed37?
 ([2001:8b0:aba:5f3c:ac92:797e:3dcd:ed37])
        by smtp.gmail.com with ESMTPSA id
 n1-20020a5d5981000000b00203d8ea8c94sm6972427wri.84.2022.03.18.04.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 04:35:44 -0700 (PDT)
Message-ID: 
 <0911125867a6623a06458da10cbc6ae911c04409.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] libsdl2: Make libunwind dependency optional
 for native builds
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: crg7475@mailbox.org, openembedded-core@lists.openembedded.org
Date: Fri, 18 Mar 2022 11:35:43 +0000
In-Reply-To: <3565a11a-1343-caf8-df96-b2bcb02e9c01@mailbox.org>
References: <20220307080750.489418-1-crg7475@mailbox.org>
	 <16DA0F4A680FB7A0.15718@lists.openembedded.org>
	 <CANNYZj8W_Zpae8GjiaJBasg8eQxsyZHDbtK7WFpNHLjZTrPCxQ@mail.gmail.com>
	 <1c35c3cc1c02cff551da6b43e39a500ec36493bb.camel@linuxfoundation.org>
	 <3565a11a-1343-caf8-df96-b2bcb02e9c01@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Mar 2022 11:35:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163447

On Fri, 2022-03-18 at 12:08 +0100, Carlos Rafael Giani via
lists.openembedded.org wrote:
> I am preparing a patch for this. I am somewhat uncertain though if this is
> considered an OK approach or a hack, since we could in theory add libunwind-
> native as a libsdl2-native dependency, but libunwind-native itself has build
> issues, as seen here:
> https://autobuilder.yoctoproject.org/typhoon/#/builders/91/builds/5624/steps/12/logs/stdio
> To me, it seems that the "clean" solution would be to fix libunwind-native
> then. But that may take longer (just guessing here, I have no idea about
> libunwind).
> Thoughts?

The key questions are:

a) Can we fix unwind-native to work on centos7 where it breaks? If so, that is
the best solution.

b) What functionality do we lose if we disable unwind in libsdl? Is it minor
debugging info or something we really do need?

I'm afraid I don't know the answers to those questions so it makes the correct
course of action hard to see.

Cheers,

Richard



