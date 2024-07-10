Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EFF3C3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:32:58 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.10101.1720603977831647772
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=eoF7U4sC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4266ea6a488so19599525e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 02:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720603976; x=1721208776; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9d5saxH+QAFbaTsmQbuxri0c2e4tOMqP32nCLXwuNys=;
        b=eoF7U4sCErlZHxSJeASGh8b+rCKiSZ66uy8pjtWh8j4lCASem8TJxMsqBhydycilO4
         Mq6hO9sp53z/bhxWnGAGnVJJF6l+HCXNwBAsCfm2plR5ZQUbXW5vCj+5cvr98mXwU0A+
         fnbjbqfcgMzgOhvDYUPxmBOPGhjkF+k3UAuA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720603976; x=1721208776;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9d5saxH+QAFbaTsmQbuxri0c2e4tOMqP32nCLXwuNys=;
        b=ww46Ohxyqou1feSWtbOOQse4Gp2ORUBZKcpMbdhEh1GTDjIhHvkQsEA8bJWMmNDEXv
         Y0za/m0tLoDDLKw19CpLcggcrKFTxWa3v41EjOQ730Kp748V6m9DNKuFO0rGt1hXn3cq
         +VITCPQkLN2RlpGZWvqXrIjV+YR4n9BsVFGdNBmwEzcgPS6vdego/nXZw37CNEtnDXsq
         IBZBAxLQgzOx1DPd1ykkcQdgdg9RZtPn+YwTl+ZaxpXHANtmclBAQC7cd81GaIn/lcau
         zBrIqiDhHqPJRZoWrxsUmPwxNsjaX0UVvH4YvgWJ9ru8hxUT98V2EUwKGV8d6rbZdXPF
         f8wQ==
X-Forwarded-Encrypted: i=1; AJvYcCU06kbqcelRRI+uvqBi6VKtJoIs7r7k1bnS30AhTBWPbprITKfkWY39+MVf9Epe5k0WMGzsXZx4C9hYiv6bIrZbcRJpmiuoAWOu2dLCtRCjGcSVi6aFvxJW
X-Gm-Message-State: AOJu0Yx/zILOB+Lpgzo2oud5E2Wfawm/PHrvNyodV/WGMJz+g03PQgoa
	WHmsAcdBN0LJjvNCSs1ZcbWvWdbEV/Ge65C//ds10wr7gx8RyzH/JdKDuGHb+Ps=
X-Google-Smtp-Source: AGHT+IFAceoh8uw1ocBqK6wiTYusGKNHM3AeXWsH21Fo2RL7w7dKCUfrcHMDinhMf8INFU4WtOkSFA==
X-Received: by 2002:a05:600c:2e4b:b0:426:6230:b03c with SMTP id 5b1f17b1804b1-426708f9f63mr34915195e9.41.1720603976209;
        Wed, 10 Jul 2024 02:32:56 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:40c6:a25f:553:e199? ([2001:8b0:aba:5f3c:40c6:a25f:553:e199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4266f6f1182sm73015445e9.14.2024.07.10.02.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 02:32:55 -0700 (PDT)
Message-ID: <65c634e7dc5119e37c68fc7ea2b966e5b9d63e1d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] bluez5: upgrade 5.72 -> 5.77
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: gudni.m.g@gmail.com, openembedded-core@lists.openembedded.org
Date: Wed, 10 Jul 2024 10:32:55 +0100
In-Reply-To: <20240710091353.48197-1-gudni.m.g@gmail.com>
References: <20240710091353.48197-1-gudni.m.g@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:32:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201696

On Wed, 2024-07-10 at 09:13 +0000, Gu=C3=B0ni M=C3=A1r Gilbert via
lists.openembedded.org wrote:
> Changelog:
> * https://github.com/bluez/bluez/releases/tag/5.77
> * https://github.com/bluez/bluez/releases/tag/5.76
> * https://github.com/bluez/bluez/releases/tag/5.75
> * https://github.com/bluez/bluez/releases/tag/5.74
> * https://github.com/bluez/bluez/releases/tag/5.73
>=20
> Signed-off-by: Gu=C3=B0ni M=C3=A1r Gilbert <gudni.m.g@gmail.com>

Thanks for the patch. I didn't see any fix for the permissions issue in
here? We need to fix that before we run this on the test infrastructure
again as it caused a lot of problems last time :(

We should be able to tweak things in a do_install:append function?

Cheers,

Richard

