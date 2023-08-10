Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101A7C001B0
	for <webhook@archiver.kernel.org>; Thu, 10 Aug 2023 15:10:47 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.19693.1691680239701849018
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Aug 2023 08:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=e3JKn9pO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3178dd771ceso997627f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691680238; x=1692285038;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O1UDo0Rg4HSMmXm4y3Gq9PQAhlNgQ2fxRHyDqCBGzb0=;
        b=e3JKn9pORGohks4zH8RpWAJ4zBs5ot1DfQLCo6U0u8eptcqxOxNFc71f0xLkht12IL
         JGSOx7EFofIelxsI0xfLrSm/jBIPCIZNYCF40/AXa3xNvZ07LdnuXZc1avORkGZmFyjT
         +tsDNbKcWGsaiDGrewGD4I3SnH1pgmLwjE1VY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691680238; x=1692285038;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O1UDo0Rg4HSMmXm4y3Gq9PQAhlNgQ2fxRHyDqCBGzb0=;
        b=NZWDweR2utZZdRY1ZGTz/fKOpb8VvP2ORYEuwGnN+5jlw5lnjVRqH0rCODiLksqbKX
         lXhT2W8Ma3y9r2ut4/2HbLJQUh7BNFelvZMtCyLcOM5w6tsyaj7Y0Dq4phRLmJ0/Q0GO
         3P0dPiKRLoWOUoYfDhuEeIx+oFvcqUgRjCIt3F6tF5uQeg3KyHqmYgiwbPAJzHrw1qYA
         ZmXWr/LNYeDPfhm4lip4+wUMnFBw/NjqK6VKArSlZEniGcL0sAoHIepJUgUOC0LpK+E7
         O9xT83rZA03hkFO5dSJU96VqTPEdqk8MZ7goUF56BGoXY9fjsDpLmveRLN1rut2aQ/n9
         OiCw==
X-Gm-Message-State: AOJu0Yzzl3JSZBapal9p1w40hIoRvsL2tmaQB8kEQfCFsgMRYI4L/FHv
	YSUix3AfZPux+TrzMMBGxM3EhQ==
X-Google-Smtp-Source: AGHT+IFY9pIq1Ai6HKbrp3OMVJOh8BiI0CkKyUFQ98BipfllzeGS1Gr4iQCTKCfrGy2p+VW+WJFE9Q==
X-Received: by 2002:a5d:6182:0:b0:315:96ca:dcab with SMTP id j2-20020a5d6182000000b0031596cadcabmr2628806wru.35.1691680238084;
        Thu, 10 Aug 2023 08:10:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ad4:8961:8732:8a5a? ([2001:8b0:aba:5f3c:8ad4:8961:8732:8a5a])
        by smtp.gmail.com with ESMTPSA id l6-20020adff486000000b003143867d2ebsm2493413wro.63.2023.08.10.08.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 08:10:37 -0700 (PDT)
Message-ID: <eb94b91c02dbade5945a8883a95ed04d2ee31961.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] selftest/reproducible: Update config to match
 ongoing changes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 10 Aug 2023 16:10:36 +0100
In-Reply-To: <CANNYZj9AacW-XB2G-6sHQobui1LGBHUMQTxV5EU=7ordJayWQw@mail.gmail.com>
References: <20230810133450.237127-1-richard.purdie@linuxfoundation.org>
	 <CANNYZj9AacW-XB2G-6sHQobui1LGBHUMQTxV5EU=7ordJayWQw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Aug 2023 15:10:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185760

On Thu, 2023-08-10 at 16:57 +0200, Alexander Kanavin wrote:
> I don=E2=80=99t follow i am afraid. How would having separate usr expose
> issues that merged usr would hide?

Most host systems are moving over to merged usr. If host paths to a
binary were to creep in (e.g. the path to a tool, /usr/bin/xxx), our
non usrmerge config would be more likely to generate a reproducibility
mismatch than one with usrmerge enabled.

Cheers,

Richard



