Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9D4C4167B
	for <webhook@archiver.kernel.org>; Wed, 28 Dec 2022 17:33:06 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.185571.1672248780123491005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Dec 2022 09:33:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vehoy0Dw;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id p36so24433923lfa.12
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 09:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+cc5obda+AHbSAQ+MpKciH8jWVPD4LmsKRnpATEmmK4=;
        b=Vehoy0Dw3RF4pFYlTp/gIMEFeZ5Ki3LJ3XUGktKBjREOd7u4Bnw5CvBavYn28EPYnk
         t+G8VQ2xgBjMbNzc28y3JdfYmjNMIf8Ot4/91XI3HNmWvxr3BesJP3UBSdZInL3Qrr/G
         A1nKbGr80NHCU8Th+lY4NUwwBUJYx9VUYDuszIHq7O4/G+FpMsWTXIdOS5VcOCnPY08K
         KdYqGucuWyK/3ArQ6FrF+M47nfc1q6Cez/kcAhDa28WnqmTq5W4quvxikrMF2dmdjkgq
         sEB6t9Ve0X5BE7R8zdJXWqiW7dIvm6X24FzPm9PADrxYjlRIU9UzXhOMSwEJPI9+5Xu3
         WUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+cc5obda+AHbSAQ+MpKciH8jWVPD4LmsKRnpATEmmK4=;
        b=hMXLzMRq0McWmMq2BaCoX/Uv1K1ErB8WHBwwNrdZrGLMznn7450HfVx0oWMl9JCkQx
         tupaN8lukbncowcVz1g8LZm1kefA4ydisxULjvwE0GtI8WT4FsLCFEjXVZMwmiOXMra+
         mFePAiaKyFKC4DcUfkCHguo+y/GUTqWfgQsek+z4ZSlL1GITiRPxdU8FP+JT7JqIhLvY
         nfDyzfU6mSoTz+ZFgQWjBucRM5bRfIjJUXRArr6HwYlSKeeZhA0KQyZHGNORA+PInLJZ
         yFVsa/T3og9f8/9Ue2m4LnunHg9LSkLuO2NUWbpnat150SKV1Bq08QKcMDPsmfWq5dow
         EJoQ==
X-Gm-Message-State: AFqh2kpeLPuBy3RW+RdlHImAV7Ua7CEp7mhrosZTkds7736RV1KUMCXe
	yPQR48tfBVdkmq0q9hnekeR0YnV//7G1MLh3nfw=
X-Google-Smtp-Source: AMrXdXupkckyEWHPUH+xZxV16HpHTXvXUbl8LIWgKjFs4C8qEKtQInUJWEjfCp9yM/IYMlnl+tYQyPxT++nHPxnV96k=
X-Received: by 2002:ac2:5281:0:b0:4b7:13b:259e with SMTP id
 q1-20020ac25281000000b004b7013b259emr1970381lfm.131.1672248778417; Wed, 28
 Dec 2022 09:32:58 -0800 (PST)
MIME-Version: 1.0
References: <20221226084455.2835751-1-alex@linutronix.de> <b02a88ae46a84e7ad04702b925d2800519d5cd20.camel@linuxfoundation.org>
In-Reply-To: <b02a88ae46a84e7ad04702b925d2800519d5cd20.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 28 Dec 2022 18:32:47 +0100
Message-ID: <CANNYZj80BT79Y7MTrSkPLCacTw22YH5=jdLdbGdw6ThMWUmWRg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 1/3] conf/machine/include: add x86-64-v3
 tunes (AVX, AVX2, BMI1, BMI2, F16C, FMA, LZCNT, MOVBE, XSAVE)
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Dec 2022 17:33:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175084

On Wed, 28 Dec 2022 at 15:32, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> I suspect we may want to call the x86-64-v3-64 tune simply "x86-64-v3"?
>
> Also, does a 32 bit version of the tune make sense? Is that useful to
> anyone? I appreciate the x32 case is marginal as well but at least
> there it is something designed for 64 bit processors.

Right, I can drop the -64 suffix, and the 32 bit option. There's no
chip that supports these instructions but is otherwise 32 bit only.

Alex

