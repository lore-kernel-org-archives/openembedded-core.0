Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 330BCC4332F
	for <webhook@archiver.kernel.org>; Sat, 11 Nov 2023 17:36:46 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web11.243.1699724195907856577
 for <openembedded-core@lists.openembedded.org>;
 Sat, 11 Nov 2023 09:36:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GvVbB5wA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40a46ea95f0so13322785e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 09:36:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699724194; x=1700328994; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z3LL2mW0zD0I4GGQZmMzmqf+5hnzEcClVxOjdGf05Eo=;
        b=GvVbB5wAtu2OnKzVlAf6kXed742wTLNfYoKa84oOhKiiBLSE2LX5+PHycSZV2axwM/
         2u4j4Qm2esSsR2D6EP10LAkRcgOJnlIRJuyfRPhkEiU2mNPi+e0fcj39dawVj4n/7nPT
         JcwQa5nV1nnsjLnD9jG0S0hvmkss97Qs6Gl20=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699724194; x=1700328994;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z3LL2mW0zD0I4GGQZmMzmqf+5hnzEcClVxOjdGf05Eo=;
        b=hiXHuS4T9YOCxm524vKwRY1rzZPvKc0U9KHVHztWIeuO0v+3mY2WVyQuaq81gXNWl2
         fhiZ4FP5NtE8jVJ6kJWJjlqJEiM24pjyy7TD6Vlpi744S8khKcoWkYlp3YtJt6KrRW5N
         iLq1XHPyI64Cv+xSgqbo3tKvEVWpatD4jlZ+7BKXdpGCjIW1XIpmeISuxumBaM58HwCD
         MXiBuzNVIWemoYFTZo5TBUkKGHfc8f+oqXIjfU7EplqO/+puHVUpmE9MB4EJ+XDuzkYT
         wifIWtyMkMoF5haHn1va+UwgtIGbMtVg8BygirnWY/p+jAICSQBffwDPE/vbT9Reaw0e
         ZCqg==
X-Gm-Message-State: AOJu0YzWzfhcwUrqDSHHvLQ2b32rFu5KKmzbkol91H1PfAtrQ/fYEY7f
	B8WAPJJzdQoQuLaKxNqRxwResA==
X-Google-Smtp-Source: AGHT+IGyXfb6Lufsx3BOEIo2+y6Pwh+N+nl+IHXLqWcF4+65cMXL4SjvBrtW5DM+2JGgyIdQlspPeg==
X-Received: by 2002:a05:600c:4c12:b0:401:d803:6243 with SMTP id d18-20020a05600c4c1200b00401d8036243mr2187372wmp.32.1699724193790;
        Sat, 11 Nov 2023 09:36:33 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:53e5:ae40:81ca:e333? ([2001:8b0:aba:5f3c:53e5:ae40:81ca:e333])
        by smtp.gmail.com with ESMTPSA id bi15-20020a05600c3d8f00b004095874f6d3sm2735052wmb.28.2023.11.11.09.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Nov 2023 09:36:33 -0800 (PST)
Message-ID: <98dcc905adef3d2d828af60abdaa40291abd458d.camel@linuxfoundation.org>
Subject: Re: [OE-core][dunfell 15/15] lz4: specify gnu17 in CFLAGS to fix
 reproducibility issues
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 11 Nov 2023 17:36:32 +0000
In-Reply-To: <ce826b01d93ac99ce089c2212cb0cbff61cee1e4.1699714834.git.steve@sakoman.com>
References: <cover.1699714834.git.steve@sakoman.com>
	 <ce826b01d93ac99ce089c2212cb0cbff61cee1e4.1699714834.git.steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 11 Nov 2023 17:36:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190434

On Sat, 2023-11-11 at 05:03 -1000, Steve Sakoman wrote:
> We are seeing reproducibility issues where gcc-cross sometimes defaults
> to gnu11 and other times to gnu17.

Why is gcc-cross doing that? It is supposed to be deterministic so we
really need to get to the bottom of this :/.

Cheers,

Richard


