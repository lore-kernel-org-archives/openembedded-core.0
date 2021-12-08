Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6EE5C433EF
	for <webhook@archiver.kernel.org>; Wed,  8 Dec 2021 21:54:37 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.3036.1639000476328853296
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 13:54:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SFmZokKH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id
 c6-20020a05600c0ac600b0033c3aedd30aso2746083wmr.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Dec 2021 13:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=nZFd/+Z+DhT2SxA9FU6sflESaFLAM6jCB6G9CglNF5k=;
        b=SFmZokKH/OBsuTt18Z3Mbz5ZA1aBsH2sUuJttf4c71bCZqZJ8OPfxhkvKBRn+DsDUh
         LHCf3sXp4PEK/WIQJrfv/PaY6Owi32/KntkvPM+1sjwdc3MdEZkbgPlXGeboqtlrb7F6
         dKC0Dwhmd6tkxkxsJdkPLIKYjMVKSzcHo5mCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=nZFd/+Z+DhT2SxA9FU6sflESaFLAM6jCB6G9CglNF5k=;
        b=khhC5/OpNhnNaTng3AjYqQ/jnNYr4cyu36PP9ucHQNbMABI9yhAO5x+qkXVfv5jkS8
         mKwg3yidMPMn+CGFctPcxcmhbONdkQnTXTc8hsVji7lYTK0YKx3umo1a58RaftCw6cEr
         j6u+Yue7hGsbcnkw65QBKKWeujoKqsq0qGf+ZURn5m6IdwnWEU2/Vwc72Rh2ezn8TXHL
         p22XJebdQRjtmQhi18uZQOL3eKqpMhRvOcAUrfHzk3iLTM2Z7aPPsdI13pYphogkx04K
         Fk+AAWi2Z03tp0rWhm8yldOHsgRbm9kXUQE6/qEw92qeak4CA+HbRtlVZnWJ+wMrCDiG
         9GNg==
X-Gm-Message-State: AOAM533OGh9sEJ6O18ciLIJ1N3M/xBx3TLP26HAs7l0yACwOPHw0B0Xi
	66A2coFxcHw7rltV1054UP4YyQ==
X-Google-Smtp-Source: 
 ABdhPJy+O+uWlwyqOs0xCy5BPO2lH94xTL3gt4glWiCmNKPOJkIG3f3b0cakk4dT7m8Hg1UXcXqVWg==
X-Received: by 2002:a05:600c:1914:: with SMTP id
 j20mr1879194wmq.26.1639000474748;
        Wed, 08 Dec 2021 13:54:34 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:7bcf:b0b3:a8aa:29ed?
 ([2001:8b0:aba:5f3c:7bcf:b0b3:a8aa:29ed])
        by smtp.gmail.com with ESMTPSA id
 r83sm7033576wma.22.2021.12.08.13.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 13:54:34 -0800 (PST)
Message-ID: 
 <22cddc60203813674e67babd517b4ac9719911f8.camel@linuxfoundation.org>
Subject: Re: [PATCH 0/7] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 08 Dec 2021 21:54:33 +0000
In-Reply-To: <cover.1638895732.git.bruce.ashfield@gmail.com>
References: <cover.1638895732.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Dec 2021 21:54:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159366

On Tue, 2021-12-07 at 11:52 -0500, bruce.ashfield@gmail.com wrote:
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> Here's the next set of -stable updates, a -dev kernel branching tweak
> (as discussed on the mailing list) and the kernel tools that I presented
> during the YP summit.
> 
> I also have patches to make 5.15 the default kernel for qemu*, but I
> wasn't sure if you wanted those before -m1 or not. Let me know if there's
> interest, and I'll send them along.

We're a bit behind on the M1 build so I think we'll save that for M2 :). I'll
try and get this series in though.

Cheers,

Richard


