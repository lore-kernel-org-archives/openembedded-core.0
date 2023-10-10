Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE35ECD690C
	for <webhook@archiver.kernel.org>; Tue, 10 Oct 2023 09:13:56 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.86704.1696929226779197890
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Oct 2023 02:13:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=nOzdyv1H;
 spf=pass (domain: linaro.org, ip: 209.85.208.174, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2c00e1d4c08so69529341fa.3
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 02:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696929225; x=1697534025; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uL2ftmh3HfksnK9w8Ml9FctKTzeqjkKvuVK/zd7Mpv4=;
        b=nOzdyv1HFgejdyME/G5yhHcDzdVa0cWWM5V5MtkfoZxFVGBifVv1SKcR5rzP9JgyvP
         JRBU6JK74rW4g5WNSurdqCmzOZybRCjz2oM0GgG8jDOSMhj/+7LLrd8GuGrjQh1fVoR+
         15xFq8K8YzdzNtESo2bMQsOtalBHvD8W+Eg04G7EOGEaft0X0wrLb3cftVQtzAqxm2nh
         Prv9GTByYybIIZxGjnNHGph2rpPzVZlneRgCrQFdqbAfTc4PNdzfsDfi197dWuqRrOl1
         0x3juasWF3cUkY9QxvBcAWQnPeHsJxSRNHAjnlDAftStYBKKUJzxYIF1uymhLdKdzPWM
         HqAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696929225; x=1697534025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uL2ftmh3HfksnK9w8Ml9FctKTzeqjkKvuVK/zd7Mpv4=;
        b=u/5dC15jrmBKiKUCxzJ7sMmi0lDkAKLZF9LWEw742g/MaeSyntpVhKxBli0GbQygh+
         +AN/W5xrCnTqrkJnWcTEx3HC5pkQRWHbo/IhzjfhC4y3da6ynAQTMfzz7Tn8F4NSMZSN
         weLAkUNwhFUPYitROtDa0+WYGZzKe/BpVR+eV+FGk4dIGFBZ3AoqD8Yg9aEM2Tne67D8
         FZJIPJyp8UqyLGlSg5XiPFTzZGp8rwlKlVDMoCMZza7t7QDjy3SDrM3Yocp8kpka92NV
         yv1Q1utQFTizBsJxqVNJCepcpG9iuj9nnjqEuQbrp/YOwWy2EJPgFmEeEXc29A/oRTkt
         opyQ==
X-Gm-Message-State: AOJu0YxRDFtKs2ugyzRc41Z9daDvjJsfcTfHemRmnHqXOmDTN9mvNDp7
	bFmEwdohDv67HRu0lTw1iCWWhA==
X-Google-Smtp-Source: AGHT+IEMasUWDUM6fvQMj+Jl1jGGxQMYfGSoFw5szLupYoOOUjJF7FgtU99lB7eDZ0/dWX4pNwS40w==
X-Received: by 2002:a2e:9455:0:b0:2bc:bf29:18d3 with SMTP id o21-20020a2e9455000000b002bcbf2918d3mr16157561ljh.31.1696929224826;
        Tue, 10 Oct 2023 02:13:44 -0700 (PDT)
Received: from nuoska (dsl-olubng11-54f814-94.dhcp.inet.fi. [84.248.20.94])
        by smtp.gmail.com with ESMTPSA id r25-20020a2e9959000000b002bfba0d26bcsm2374554ljj.8.2023.10.10.02.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 02:13:44 -0700 (PDT)
Date: Tue, 10 Oct 2023 12:13:42 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/2] oeqa/qemurunner: Add newlines serial
 workaround
Message-ID: <ZSUVxs9mKcX_iT1W@nuoska>
References: <20231009165330.3580227-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009165330.3580227-1-richard.purdie@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 10 Oct 2023 09:13:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188874

Reviewed-by: Mikko Rapeli <mikko.rapeli@linaro.org>

