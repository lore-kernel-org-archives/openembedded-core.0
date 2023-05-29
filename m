Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D253C77B7E
	for <webhook@archiver.kernel.org>; Mon, 29 May 2023 07:08:22 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.44561.1685344092204228063
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 May 2023 00:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=IqxNQdqe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f606912ebaso30237635e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 00:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685344090; x=1687936090;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4k+XbTgXI/kCBgJxiLMW8tfaxX8bU8uVRPWPhLPQ56c=;
        b=IqxNQdqeP/Ny3lhkoTTNktDquRGGWX7AeOOW2JSsSorjlOyXg+QyP3A6itV/2JcGJK
         FDSAaGg10TKNfIe+CUXJJ0Ss8t58x5cOB3o3yFCvVLfGnyy+MnyPBm8c7AxPG9LcvnOU
         nmMUSM9PHmjcFXsma28agdnesZ2HadYTRWEyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685344090; x=1687936090;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4k+XbTgXI/kCBgJxiLMW8tfaxX8bU8uVRPWPhLPQ56c=;
        b=WgXQCrjx/w0zRN6k4D26dVPW+p3FbHymr3OfOGvknuelFKHgLb9pCHFXIZ9dqjfyFl
         elmCRxX+HST0wB6xFVNjM3q1FGxiXb0KURcw7x09hwodU+Ms95E/ViPmfdikXX0DNRwY
         kxi3sjxrWHf8x5aTkVmQUuFT3BeezN93Hs58D4m/fnowatQW5T6Nuqk2NSxV1Yu26N+T
         cDMjQgdysdKJ2IS9ZeWy8OIz0hym96sOnQmJdLQMlcO/eurbbLiz102tsQ5zsmC+CvKJ
         H7Jq5jFDWdcHnFEs+XvXFgqvQcE2zGn8jS5+QcW5f8Re4KKJJFzhQrM+vmbMyHcohaZT
         CX0g==
X-Gm-Message-State: AC+VfDwCjW7jy2oPOJcunaoEhHbMsvfwgOhllIM+HUOcP6MHmL7Pp697
	e9DzSE03SpzTHrsqLC8Tc2zlRA==
X-Google-Smtp-Source: ACHHUZ5E0OQwNJmG2wuC8F4P0ZAEYB5BFxnDW3lS9wW9iwWyHLkeGLHk7/uOx1Mt3HnUGEs5md6xMg==
X-Received: by 2002:a7b:ca4e:0:b0:3f6:7f0:c9a9 with SMTP id m14-20020a7bca4e000000b003f607f0c9a9mr7873965wml.33.1685344090430;
        Mon, 29 May 2023 00:08:10 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ec8d:e49e:8d5e:e7d5? ([2001:8b0:aba:5f3c:ec8d:e49e:8d5e:e7d5])
        by smtp.gmail.com with ESMTPSA id z22-20020a7bc7d6000000b003f4fbd9cdb3sm13163198wmk.34.2023.05.29.00.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 00:08:10 -0700 (PDT)
Message-ID: <7bb5f101af77af3a051a1b049206800aec542ccd.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCH 2/4] python3: add libxcrypt-native dependency
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, Markus Volk
 <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2023 08:08:09 +0100
In-Reply-To: <CANNYZj_-ptiJqvmf+cU0qV7VkKG0ds=guN9aTU1VirjcG8WjQA@mail.gmail.com>
References: <20230527133252.284132-1-f_l_k@t-online.de>
	 <20230527133252.284132-2-f_l_k@t-online.de>
	 <17635252DFD4EDDE.6918@lists.openembedded.org>
	 <CANNYZj_jz-SCh4kq33fe7_uiVRAvL+15i4kQ=U9Dkv84W2s+xw@mail.gmail.com>
	 <VDGDVR.YBUKQ953M2TP3@t-online.de>
	 <CANNYZj_0ASF5ERsCgrB3W3qYgGJFwJzXn35cgc6ojQf0fi1Yxg@mail.gmail.com>
	 <POIDVR.URDIMNIKV0SE3@t-online.de>
	 <CANNYZj-megU_4p_eR84XiSt7YvwWu57tWBEZDKoBFkjRj8ZKVQ@mail.gmail.com>
	 <MEJDVR.WDZW7MFB3W9N1@t-online.de>
	 <CANNYZj_-ptiJqvmf+cU0qV7VkKG0ds=guN9aTU1VirjcG8WjQA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 May 2023 07:08:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181851

On Sun, 2023-05-28 at 17:16 +0200, Alexander Kanavin wrote:
> Adding libxcrypt-native to DEPENDS definitely isn't correct, so you
> could check why virtual/crypt dependency isn't working properly for
> adding the needed headers into native variant's sysroot. If all fails,
> adjust DEPENDS:append:class-native.

Alex is right and I should have spotted this, the -native dependency
definitely isn't right. We'll either need to fix things or revert them
and wait for the right fix...

Cheers,

Richard

