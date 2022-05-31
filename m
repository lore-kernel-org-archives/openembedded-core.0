Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4C04C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 16:38:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web12.52156.1654015131710288855
 for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 09:38:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NKDOsjjj;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id
 f23-20020a7bcc17000000b003972dda143eso1563923wmh.3
        for <openembedded-core@lists.openembedded.org>;
 Tue, 31 May 2022 09:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=dkp+WytHhz9wwdO4abZanJ3KoUKV6qbBn0GDoZ6/eBg=;
        b=NKDOsjjj+zlMF0s6r6WuSDkG7o4sNYx7qjR2FgD8dUeAbtT/DAOlYeRSvD6Ddtu+y7
         5j7yZH6hsR6URgJxzi7ahc3WQJ/KGUCLQW24/G8i692fEQ/6zgL5YFLyh/B/rhxazsC5
         614jlHXy9Yq91cKmhFjRFp+wsi1LHoF6zAymM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=dkp+WytHhz9wwdO4abZanJ3KoUKV6qbBn0GDoZ6/eBg=;
        b=a3A1bIbky4NXO4awJwdJHEplLaVZyPPiSv2VkoOKJoe/CdNAEPvFTJ2XfBOxuL/aIf
         df82h2HYfcFWLl3QEKqOJZ7p9488QSagi3Hw+FKAr5cROglbzrrX/6Q6Tix/XthpSJua
         LlzAJoYcg/e9B4S+QRpegIIxe2tyCg6OBTN+SBYM+47kcJCvwmH9Z/0RkzK6Rfwhl20u
         1ivjHk0Jz8qVEonaFc1T8FsDmYEnOFs2EejJM3dGNIu0ZRdlAJvY9O4D2hS9rhXPfvQp
         ea9UYck+qSKVqjMfO8M5r+PZg9jz5/b/S1zwTj7Tuk5Yrjxc6Lzm3cCX+koU6X8ntFhO
         1I3w==
X-Gm-Message-State: AOAM533QEOGGafOC+kpE/Cn60ErNzottBPQZuRL8Ld7P4IBkf4FVHcsl
	GGKTRo2i+4AI5wgehuQGHOR4cg==
X-Google-Smtp-Source: 
 ABdhPJxFiY1bCU3ia+TKoRcdPcbGHQLt3c3f8PctON3XW+hDd9sQw5bGeA0NeaTRH7lrCoXQbiDydQ==
X-Received: by 2002:a05:600c:1d03:b0:397:5f4b:2e46 with SMTP id
 l3-20020a05600c1d0300b003975f4b2e46mr24417327wms.121.1654015130088;
        Tue, 31 May 2022 09:38:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:d16:2159:4370:b82e?
 ([2001:8b0:aba:5f3c:d16:2159:4370:b82e])
        by smtp.gmail.com with ESMTPSA id
 26-20020a05600c029a00b0039bc95cf4b2sm2575510wmk.11.2022.05.31.09.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 09:38:49 -0700 (PDT)
Message-ID: 
 <2466db8789991de49e05649d678f677e331009c4.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv2] libva-initial: unbreak do_populate_sdk
From: richard.purdie@linuxfoundation.org
To: Markus Volk <f_l_k@t-online.de>, openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2022 17:38:48 +0100
In-Reply-To: <4e844184-370f-77a4-2500-a4fd9367496d@t-online.de>
References: <20220524155021.416611-1-f_l_k@t-online.de>
	 <ca1c9481a03622d6dc3136db5f59c8602b0722dd.camel@linuxfoundation.org>
	 <4e844184-370f-77a4-2500-a4fd9367496d@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 May 2022 16:38:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166323

On Tue, 2022-05-31 at 17:02 +0200, Markus Volk wrote:
> For my build libva-initial is empty but libva-initial-dev contains=20
> headers and .pc files

That doesn't change my view that it shouldn't create any packages at
all though!

Cheers,

Richard


