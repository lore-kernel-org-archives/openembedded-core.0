Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71006EE4996
	for <webhook@archiver.kernel.org>; Mon, 21 Aug 2023 15:47:47 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.368.1692632860087955125
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Aug 2023 08:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CSaZH/b9;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fee87dd251so17100525e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 08:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692632858; x=1693237658;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ULhBlM/2j7Xy8wZx3Y6BsbCAJCjqRAMiOQrXduZdBm0=;
        b=CSaZH/b9HQ9IVBmxRZd44EMcM7CFtlUrwTV3wrDkmjlpE9UlS4Lf2Y/yj7MbTBVGfo
         qgCfCBjnu/YyRj4pK6dgeeuuLGrTvwUUxv0q6KIjbUALPVGrZdMp7QhqAAipf4WQwydx
         Kc3K5PqJhgGJoxIZnIq/JBG+4iTi/RalU0fEM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692632858; x=1693237658;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ULhBlM/2j7Xy8wZx3Y6BsbCAJCjqRAMiOQrXduZdBm0=;
        b=kIxALH3mnKdVCXwZ5dPpXkK4m3/k4GE7Ig2xU+WFjZ7PoU44pWCVbHzU+6CoQyuj2x
         kaXVzdwhLeKYnO2YF4waOUI7l5bxp7YqMTY5cqDLsDu8a/vxfH5tOYK3LuNfnBMpuZ4K
         WoRxssyhukDUcXzBDIplmIlkx98V1gXXIrMwqh6mPIjSLVjsxFD15vK2R3adVVIaO/6b
         jBmE4RoM7o0z1X5snFMeJ1gxQ79z4OrgY6gOVMDK9gHTgRoWUa+O+wiEDiD6kwat+cIE
         SAQRM5nrzMVlIymAS9WsAeHrjCrv8GWfU8Z6wZ7Y/CUcpt6KZcEVEAe60Ckozac1ebgk
         JPsg==
X-Gm-Message-State: AOJu0Yxd57zPBt1BSTPFt9Rtzk7LfNwfeDIlzExz4TmeRl/uwgvr01ct
	2SBKoYjoFda7M+NEgr/eGzyChA==
X-Google-Smtp-Source: AGHT+IHdlCJyhMPauhf9v1rCGXJ9lrDbUSh7nlDdoq+m1bnzEVj2hSa40X3EK/8E4dMS6Ll38X8F4w==
X-Received: by 2002:a1c:7508:0:b0:3fe:21b9:806 with SMTP id o8-20020a1c7508000000b003fe21b90806mr5562784wmc.0.1692632858413;
        Mon, 21 Aug 2023 08:47:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d0e2:cd7d:2223:a8d7? ([2001:8b0:aba:5f3c:d0e2:cd7d:2223:a8d7])
        by smtp.gmail.com with ESMTPSA id p14-20020a7bcc8e000000b003fe1cac37d8sm16516396wma.11.2023.08.21.08.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 08:47:38 -0700 (PDT)
Message-ID: <dda1aed14e449ff1516bb5e12a4e700b26314d59.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/10] linux-yocto: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 21 Aug 2023 16:47:37 +0100
In-Reply-To: <cover.1692632563.git.bruce.ashfield@gmail.com>
References: <cover.1692632563.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Aug 2023 15:47:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186461

On Mon, 2023-08-21 at 11:44 -0400, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>=20
> Richard,
>=20
> While we track down the remaining 6.4 boot issues, here is the
> set of -stable and specific fixes that I've queued in my kernel
> testing tree.
>=20
> It is possible that some of the 6.4-stable's have fixes for our
> boot issues, but I didn't see anything obvious.
>=20
> In particular we have the -rt warning fix from PaulG and also
> a fixup on our isocpus patch.

Thanks! This means we should revert:

https://git.yoctoproject.org/poky/commit/?id=3Dd57e6de496621cb721ef0eb23efa=
1bdb1363d8cb

?

Cheers,

Richard

