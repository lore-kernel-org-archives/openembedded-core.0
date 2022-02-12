Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52ABAC433EF
	for <webhook@archiver.kernel.org>; Sat, 12 Feb 2022 13:27:16 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.8727.1644672435255469643
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 05:27:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ZFb/temt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id k41so5865558wms.0
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Feb 2022 05:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=rS0+qeNTVeW38NCBG2I2MN43GRCket7MwuQZEFNctnI=;
        b=ZFb/temtLYZmDuz28fuNGguiQr2gypv+dPvc35SuJ6/kd9FXKIVTy3v9j0FTVAwaw7
         GbFe7Qr0GscefXQB1r0I5RyBsYdLTyyLQm7Ewl7BCmK1mbp2ZLypLc09jARMRLiHQITM
         wQyKakkD4v0s7lFPwS2tjuQKbiiti92TKpMkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=rS0+qeNTVeW38NCBG2I2MN43GRCket7MwuQZEFNctnI=;
        b=SaLGZB8vnZdRVE8dVPCVEyq8wwVZP8MJ26B3ttp+DI9C878WoJ6qhbXpKkt1XVkfqR
         GpmowFbNnzRsu5XvtioiXXxlZ/DywCsxyPbLx1gkDcbxoVNU4yOPSv3Af6ia3TaUvhMt
         IyjsgqakcBY4eLyi1rG2L+bMLsChBJSw9lAkkT0SVtygEaawTxYo7f/G0dpjHnThL1Uz
         R07kKfS7LAeubC7cm3vp+helVhL+1a7kIzueNnJoJLwq+ndjKkvPnupLy9I5vS8GHyJj
         h1uhRIvex9x7zh/Uzk29fPNDQx1BuizbFfb3XHLO/W3tqKjJPq/Wl3lLUWhTZEj1M3ci
         JhTg==
X-Gm-Message-State: AOAM532kzmvYEL4mB+yVWyuPQ/I0DAL39hhWOqM3MlkMdS9vEQF1q3Jy
	1a4nn9heoV20Ss5jyHK/0BF/fQ==
X-Google-Smtp-Source: 
 ABdhPJxtnWd1Yaz/OdEU4DOHDLcmEkuIivIeIXiGe5ki/+G1ICCFZ+itw8AQP9Dn7rnjRmpWPEoA1A==
X-Received: by 2002:a7b:c184:: with SMTP id y4mr4170934wmi.117.1644672433562;
        Sat, 12 Feb 2022 05:27:13 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ec5:268f:bfc7:dcae?
 ([2001:8b0:aba:5f3c:8ec5:268f:bfc7:dcae])
        by smtp.gmail.com with ESMTPSA id
 u7sm12164698wrm.15.2022.02.12.05.27.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Feb 2022 05:27:12 -0800 (PST)
Message-ID: 
 <708e70534079e11e5db614f43e314aef62587a3c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: Upgrade to 2.38 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Sat, 12 Feb 2022 13:27:09 +0000
In-Reply-To: <20220210183719.3213809-1-raj.khem@gmail.com>
References: <20220210183719.3213809-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Feb 2022 13:27:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161672

On Thu, 2022-02-10 at 10:37 -0800, Khem Raj wrote:
> Release Notes are here [1]
> 
> [1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00009.html
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

So far there was a mingw failure:

https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/4729

and a qemuppc kernel build issue:

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/4688
https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/2632

The build is:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3220

and the meta-aws issue is known about and not related.

Cheers,

Richard


