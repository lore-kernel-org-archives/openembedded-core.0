Return-Path: <trini@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0D6C61DBD
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 18:48:48 +0000 (UTC)
Received: from mail-oa2-f0.google.com (mail-oa2-f0.google.com [74.125.231.64])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2107.1787942923452258738
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 11:48:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=uaxkvxLh;
 spf=pass (domain: konsulko.com, ip: 74.125.231.64, mailfrom: trini@konsulko.com)
Received: by mail-oa2-f0.google.com with SMTP id 586e51a60fabf-4511f6a63edso115754fac.1
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 11:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1787942922; x=1788547722; darn=lists.openembedded.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w/wzgjb6u/4Belu41cYbx3sTlzJ1Rla9YQFkJD6bQjU=;
        b=uaxkvxLhnDvaZ6Va0z0Zox7d8dgBtqWngqxQGh0cM6/yiKzo783H/ORx5xWpZ1tsrf
         KhpoHBbCpmtoGetdLbnaj208RaOYUVdH7/NP9RFEtzeb7gQbiBddof2K4Fxg0HSb8lBp
         4qtZIXLnYD0559VBZmFJA2q5SGJokOOPgqHzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787942922; x=1788547722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w/wzgjb6u/4Belu41cYbx3sTlzJ1Rla9YQFkJD6bQjU=;
        b=EYIpryZmhfbZh1xbAr4Tbw8c4s18LlFF5rKoekpePnKNUTOgUbYvVDj5Xkl60HsZdH
         9wX76aCoLykvG/LmdRHEGuyiSM2Upp1RaM4Jk82uxrPox41Z8WGiES4weUuoK+aRAiIP
         YQnpisZbqPesFmungCGBVXOFu6buj6fF3BvCKUOaWsjXVCMQdfx7HcfYj1IJh5knGDeO
         TKd6ehZsNubDzZbi4G6H8ghhg0xA5YVqc1U4KJSl/GbmQIXsD2td3fdoLpsEpkl/lDJh
         wdAubBuuVNztnUxbS5XozYQrSpkKnf6Ms4DdpvQtzbeThcoqYWZZuBWy60oiBLte58Tl
         Pp9Q==
X-Gm-Message-State: AFuF++lBRxTUgoyWR8a9nyjs4Jj8ooYtKGHMKMGit3Wh6EZDxr8wBJ2P
	4cNXaCxvpUfDMCdtY9GG8Xv5D0XA2DlqJTsnORmRMFEvqZZFS6NVLaVlBiTHxQRCUqo=
X-Gm-Gg: AR+sD13AB73owsyOD0kq3XgCxkRgJGvaaApzoh3vs6zZga1nVKwgcvMNOzYIUzL6DZ/
	myMHPKjwNEwz7PD6XHU4Pa1K4Q3TWqfiJR7yd7/RUYXr6E6Xl6Dhzm5F5znFJsw0hhiAUWmajUq
	x8EKqsWJoi9JQ8v2OnXfPFY5J5XsN5lHIAVaZvbXawjzRu+9u4aLK7nmaBjYy75Mt5fwhjdrRFQ
	GN45chH9TCocYPZKOIxZ9WCcRcc/eHgS9C2aH4NHgb0JTf9bEF8+Ltj2xdbsGsVN74ntr1BfIsN
	vh3Cp9JqL8iHS0/IM8myzgDTehcW44BgvXeMk2Qp1eEGFBajF7ilbIbuOYmljPeCK7/GgDashxM
	A0r5WCOvHqWXAMk6AbnqSLr/F1vGARDfEqBVHQ9+7WN/lZjLbezXG2vyShm/htuuI6y3tF2rHAB
	HQLZ9fNHCicYfEbjkwoe2mGAANnO7kXEq5FLEFkd0lg6sTI1MDElxFvnILgVmRwoM0hqdYct3AU
	ywWrIU+ecX74v8Nijy+lmIE8MmNzrGBPSvI9FPdH17QHX2kpaicRYhWT9DvdKBZE46VlKTLI6JG
	ooDWpBaKzTw=
X-Received: by 2002:a05:6870:16cd:b0:45e:daba:e3bc with SMTP id 586e51a60fabf-468372379cemr10324349fac.15.1787942922541;
        Fri, 28 Aug 2026 11:48:42 -0700 (PDT)
Received: from bill-the-cat (fixed-189-203-100-56.totalplay.net. [189.203.100.56])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-468a3535e25sm2100775fac.5.2026.08.28.11.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 11:48:41 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:48:39 -0600
From: Tom Rini <trini@konsulko.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: openembedded-core@lists.openembedded.org, quentin.schulz@cherry.de
Subject: Re: [PATCH v2] u-boot: Update the HOMEPAGE entry
Message-ID: <20260828184839.GK3959812@bill-the-cat>
References: <20260828153456.413321-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828153456.413321-1-festevam@gmail.com>
X-Clacks-Overhead: GNU Terry Pratchett
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 18:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244559

On Fri, Aug 28, 2026 at 12:34:56PM -0300, Fabio Estevam wrote:

> The official U-Boot project URL has migrated to the
> u-boot-project.org domain.
> 
> Change the HOMEPAGE entry accordingly.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Reviewed-by: Tom Rini <trini@konsulko.com>

-- 
Tom

