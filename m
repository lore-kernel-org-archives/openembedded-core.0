Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C6C1C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 14:23:22 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.32247.1641824600581795842
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SwjzdoxQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id r10so19440248wrc.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 06:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=V1BZSbqFl4WWw9jxwzqfNfW/zslNve6yNOIHg9jg/w0=;
        b=SwjzdoxQlEJilkDtO1xUxtnfTgpREQNCVc7VzZb7JIXtQFCl/vF6PenIB6c9ENC0Yk
         SPVELZcT+CP7gXjUhy7qbzvG0sGsP8+T5pQ11os3+MqqNmPyKp63uWobZ3/SzhNbUhFv
         QSkEV35XeVyLCYfsLYewgp7TvBdDsv9c5PoaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=V1BZSbqFl4WWw9jxwzqfNfW/zslNve6yNOIHg9jg/w0=;
        b=sOpnISRZM6ViAE8MY/8Iv+rAD4G/yfz6SP2LWDl3x9hSjiV1AjpZYSOUD+2mqsv9cS
         mmcIbEcOSi7x2+AY4e5CIpVIU0iilBPJHnobHnJqOnv1uV6+TCS0z8Hf7h5xZMbDACnB
         sm6S+brEaAqB6BKhLrRft9BXjbl+iAKxSzOmbSXz5jpXuQBb9KugYxaUp4D+yxNH/p5s
         FyhBMGvDxq2yN5unp6kz1bERZ1LnY/2K0rn1l2YKClVmrmHeD5BOKlaFA3OoUJzvAPEd
         +jYfpeaHjojID8TcRdfoo2RX/6WiSj3OobcBDE8aaAQKGO11D+UgM3BgWUf71wp8nVBr
         G+KQ==
X-Gm-Message-State: AOAM533vKL8MhUfUFDZm4Tbie/z9zz5oWSiHvEONOHtUETPTQyzM9g7L
	u59zmoOxOFrq9ZQO+5CVjicNKw==
X-Google-Smtp-Source: 
 ABdhPJxK0C+3hI/6dEia2swbpTy4O1S1Xb0DlMDzNK5VV7cLBuvh9pmDs9UNN6DV4jLFSjBQy68fXA==
X-Received: by 2002:adf:f94c:: with SMTP id
 q12mr24537810wrr.166.1641824599020;
        Mon, 10 Jan 2022 06:23:19 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:988f:80f:f286:3191?
 ([2001:8b0:aba:5f3c:988f:80f:f286:3191])
        by smtp.gmail.com with ESMTPSA id
 l31sm2040662wms.1.2022.01.10.06.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 06:23:18 -0800 (PST)
Message-ID: 
 <043d4b73d9234292da52175adf6f59483920ced5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 01/14] python3: drop unneeded multiprocessing
 module patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Alexander Kanavin
	 <alex@linutronix.de>, Hongxu Jia <hongxu.jia@windriver.com>
Date: Mon, 10 Jan 2022 14:23:17 +0000
In-Reply-To: 
 <CANNYZj8sah0ehNNcvQqfO9hJaCLq6jx72gpTbqz2cUyLQSdstg@mail.gmail.com>
References: <20220109222732.2252416-1-alex@linutronix.de>
	 <4d829edff8abad25269693d4f199b582b5bdf879.camel@linuxfoundation.org>
	 <CANNYZj8sah0ehNNcvQqfO9hJaCLq6jx72gpTbqz2cUyLQSdstg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 14:23:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160365

On Mon, 2022-01-10 at 15:21 +0100, Alexander Kanavin wrote:
> On Mon, 10 Jan 2022 at 14:59, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > Isn't this now working since pthread was merged into the main libc library
> > and
> > therefore separate linking for pthread is no longer needed?
> > 
> 
> 
> Yes, there was a previous discussion with the same point, so this needs a
> commit message adjustment?

Please as I worry someone would try and backport it with the wrong reasoning.

Cheers,

Richard


