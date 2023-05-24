Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2E80C7EE23
	for <webhook@archiver.kernel.org>; Wed, 24 May 2023 15:02:25 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.11225.1684940540132159312
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 May 2023 08:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Z49BheTX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f6a6b9c079so921125e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 08:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1684940538; x=1687532538;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VMxdO3tSHXoFD4pg8JgmxYppyESttHGAU0RAaroYrx4=;
        b=Z49BheTX7wlKKT6bke54QkVqPOPQWCvfivwgr2hvtjkGaRhQWJhmh+wJ9ppU3ZzmAi
         Y57kcXhTCnggk0jzfslbE5IeUr6TgXppFrH0Kr5L6ylKdN+/CmDO/brUtjBGHy8KEgqs
         oOWEIev6s8r12fnfOuRbOuCZdWoNa0rmU8qnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684940538; x=1687532538;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VMxdO3tSHXoFD4pg8JgmxYppyESttHGAU0RAaroYrx4=;
        b=NXA/8f9x/CFv9fQO9hfp+CcXCDeyiNJ+XCL1hqVmOy3E8AdA5qJyO1eS+3QU6zK3Sn
         ubkyH/pxuovtmc6VRrk7ea9lRW9HpZT0DKs9c1hRwuLKqw6CB8Tkvr01JSuLgFLLxgZl
         iK4le2wqcGhwckjAlDZmWwVL5KUfmS/ncbBPPSFvGh1yNBDul+bvXomDMM6Tr65t3BYV
         YVUCGJaVEqB22IkFTaTOxokUTGCIdAdi8YhOWQySO31A31cA11estHoDkrPlRG6QH4Cj
         X5MTsGv0Z1wZ+yCbJVJLerssDWlEkAhoXmXVYS4AB9dBs2uC94SlW9EPHheJv7aRTyqk
         Vlcg==
X-Gm-Message-State: AC+VfDxqlUpks3AE43q5t1yL96XJPR2xqmFAKY8x/GSSi+Xq/Xb4COb+
	dmFrA8EZ6cRgNYI+rV/Q/FJxHRKQbmwa3kvln0U=
X-Google-Smtp-Source: ACHHUZ5OFBwbtAUlR24oOPt9kw9HKF4qnabL/03bB78nNe+ERQ8dJ2orZ68XR7Qt5+4rjT0OHwQfgQ==
X-Received: by 2002:a1c:7910:0:b0:3f4:bb58:d174 with SMTP id l16-20020a1c7910000000b003f4bb58d174mr37123wme.22.1684940538581;
        Wed, 24 May 2023 08:02:18 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e50f:20dd:d0e2:cad5? ([2001:8b0:aba:5f3c:e50f:20dd:d0e2:cad5])
        by smtp.gmail.com with ESMTPSA id o19-20020a05600c059300b003f60119ee08sm2549754wmd.43.2023.05.24.08.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 May 2023 08:02:18 -0700 (PDT)
Message-ID: <445f641488427440bbaf60ec1418d81abdfd06a5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] base: add ability to provide further details
 when using LICENSE_FLAGS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, "docs@lists.yoctoproject.org"
	 <docs@lists.yoctoproject.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Wed, 24 May 2023 16:02:17 +0100
In-Reply-To: <5432CF2D-FEFB-472A-A980-0D05A1AEE7E8@arm.com>
References: <20230524145721.3628187-1-ross.burton@arm.com>
	 <5432CF2D-FEFB-472A-A980-0D05A1AEE7E8@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 May 2023 15:02:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181680

On Wed, 2023-05-24 at 14:58 +0000, Ross Burton wrote:
> Hi,
>=20
> If this merges, this new variable should be covered in the section about =
using special licenses.

Shouldn't there be a documentation patch here? ;-)

Cheers,

Richard

