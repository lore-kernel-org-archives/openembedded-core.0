Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9678C433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 10:45:00 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.5082.1641293100032935985
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 02:45:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FxenVAzg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id r17so75259852wrc.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 02:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=IMxSS02Skt9YF+NXNU2FpC2FhbS/gsbAiOR1g6Q0Jp4=;
        b=FxenVAzgs5if4u8vBzgbz3lff2yR/F8q20VGSpTnCvZUCPAuu3SuKzMZAtggYcwFqV
         7eexX9eYJLsixCYIqfwf81lGOcx1GL34Wlk0HmMpYw3dkjwu/QbujxyDbEYw1WbtHFt+
         o6DOC/1CpIhkCOo/zQYGaKtXslkaK851KkIcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=IMxSS02Skt9YF+NXNU2FpC2FhbS/gsbAiOR1g6Q0Jp4=;
        b=0v8Nr5GSWmskzQGlb6xjOLANyvDlKcENlA036rISt6cxUFGG0+ZaZbu15TDTw1u2IO
         5Apj5GVo/6wD0iJAh1RG5Ka4mEvAW0o+/Kfo3MeAbo4PwvDibllrzWBDnrIs367Z/quA
         jbiq00K4yb4uW1eAbjjiJYveK3anYvzaRw2nI7JSMycLQead3sNWE4EyBc9YAIl4tEfE
         hGQKIh8J8/dn+Hu2rmTT6fRD39WhJLTozqdgJO/xNnOzC1nReYyq/fu0KkIDj3vNm8P/
         +26jpM/EFZeMs5l8pEXkN3btrwsTTheOWeP7W6+3sYhElczzO1P++xL8YtNbUn4zUpXa
         X6dA==
X-Gm-Message-State: AOAM532ltAbDZjQLJnEFYlivPJpE9gRLsNpMz8bCa8GpZhIRw18twc1z
	diL+HnYGpZz+ZkhA1uqdrmkFkA==
X-Google-Smtp-Source: 
 ABdhPJwAhTjYXMA20YCyBEpRLe3w6Y3kVZYFBwaEcWNQWGrrcOFbMKUZP7zmj6DmwERnVi4K1p/Pcg==
X-Received: by 2002:a05:6000:382:: with SMTP id
 u2mr43163748wrf.331.1641293098497;
        Tue, 04 Jan 2022 02:44:58 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:da22:f51:54c3:4a4f?
 ([2001:8b0:aba:5f3c:da22:f51:54c3:4a4f])
        by smtp.gmail.com with ESMTPSA id
 m10sm38287263wms.25.2022.01.04.02.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 02:44:58 -0800 (PST)
Message-ID: 
 <0b92edf20359639cfa8fb63e4a0a909acf683bba.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 05/24] e2fsprogs: upgrade 1.46.4 -> 1.46.5
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@gmail.com>, OpenEmbedded Core Mailing
	List <openembedded-core@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Date: Tue, 04 Jan 2022 10:44:55 +0000
In-Reply-To: <20220103161854.301148-5-otavio@ossystems.com.br>
References: <20220103161854.301148-1-otavio@ossystems.com.br>
	 <20220103161854.301148-5-otavio@ossystems.com.br>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 10:45:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160161

On Mon, 2022-01-03 at 13:18 -0300, Otavio Salvador wrote:
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
>  ...ct_io-expect-correct-expected-output.patch | 69 -------------------
>  ...-missing-check-for-permission-denied.patch |  3 +-
>  .../e2fsprogs/e2fsprogs/quiet-debugfs.patch   |  3 +-
>  ...2fsprogs_1.46.4.bb => e2fsprogs_1.46.5.bb} |  9 +--
>  4 files changed, 7 insertions(+), 77 deletions(-)
>  delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-tests-u_direct_io-expect-correct-expected-output.patch
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.46.4.bb => e2fsprogs_1.46.5.bb} (94%)

Unfortunately this also breaks all the ptests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/2963/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/2691/steps/12/logs/stdio

(arm and x86)

Cheers,

Richard


