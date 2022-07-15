Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5458C43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 16:45:14 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.1544.1657903505067788285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KIvKYtDh;
 spf=pass (domain: gmail.com, ip: 209.85.167.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id e28so8726816lfj.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NuobBKQOeUSxLWkglFDS6sv50uPSH/DfvQkLePy2dns=;
        b=KIvKYtDhnlUivz4Iycf6T9/203q0GSM0wdmYVI3u7fykMbOpXn65LxQ+waSLHjHo6X
         WgbIY5efEXysOo6SistsfaVqxXtzPMI15R6nyExGD5umVs3XQDTrJekIoBUWecKeWO5t
         jn6AfzWkS7KU4vlPBkS0lUQf3v6WCEnkcbp73N4vjK3NXo8jfZWGhggjqt3+ffkvEIJM
         KXUTWDruPxKyLnU9/1zquD9SlWHyp49X7MtNhAAsBZOE3NCcAFAOO17cHyDy7crSrlzo
         lp/yk2UhEOuB+tC2tfRF0kOeoKQQb46XNUr7utAonf3bVr7IRc15qD4koNaPzym3aEEw
         Di2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NuobBKQOeUSxLWkglFDS6sv50uPSH/DfvQkLePy2dns=;
        b=kxbB5NYYIWNtWEJCd6mW4gWToW7mcekVTY7b8UGa0IfJbe4QqRK+cXg7VPfm8WQpV0
         TkxHcQnrzXlYz2kFV5Fr9TxlSDc1ngEcNxMqQmWqJ8tPgRCA91U0gC7MPuA+z3SSsE6L
         Cmnq1EIFgus/74SbLaABugWWNj+QNJr0TYLUJfLK2hzTgzC4ZBEJrAWIYboa1daNtSy5
         zyS3k7MiC7fai33ylauYTfejaCrFU37fwG5BlCIx8TV5/+/6McrI31niHVdayTWz57rg
         pOxhkaFlgn7WMj8hssYae+IQ1+cdj28cJHfT6ScqG2BroaJuilFjOkHJiV/GxNsAt6Kn
         /N6w==
X-Gm-Message-State: AJIora/dvcM3G3FLvGUNbvWhyDoN+2BIa0KSKXvnygPYCw+cGB3i4BMe
	AkweBxZHaHzgG7tZmZymaC0jFTTx4Lepijsk2VE=
X-Google-Smtp-Source: 
 AGRyM1tNvtsNTSV45h4f3sJl/aG/Nv5UkM7iuvAo2whKZYovjdwAo2SJc/uJVGjwqdHBxpqVYM2p8nRWZnB2a5ojOJ8=
X-Received: by 2002:a05:6512:13a4:b0:479:3b9f:f13c with SMTP id
 p36-20020a05651213a400b004793b9ff13cmr8350569lfa.380.1657903502955; Fri, 15
 Jul 2022 09:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <1657611899-30825-1-git-send-email-wangmy@fujitsu.com>
 <c26547d12783ebb94f1d2222403c11cc7c9633d8.camel@linuxfoundation.org>
In-Reply-To: 
 <c26547d12783ebb94f1d2222403c11cc7c9633d8.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Jul 2022 18:44:51 +0200
Message-ID: 
 <CANNYZj9vT+YqW6qHqCLMoxzfc9G=ZdJzYW03qsQBF=eP6+d0yQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-docutils: upgrade 0.18.1 -> 0.19
To: wangmy <wangmy@fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 16:45:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168129

On Fri, 15 Jul 2022 at 18:41, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > License-Update:
> >  year updated to 2022
> >  url of some reposity and license changed
> >  exceptions of BSD 2-Clause License changed
>
> This last bit sounds a little worrying. Is the code still under BSD-2-
> Clause? How did the exceptions change? Were new ones added or removed?
> Does it change the license?

In cases like this it usually helps to include a link to the commit on
the web (e.g. github) where the changes are. If there are several
commits between the two releases, then include all of them, there's
usually a way to browse history per-file.

Alex

