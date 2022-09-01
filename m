Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1AA5ECAAD1
	for <webhook@archiver.kernel.org>; Thu,  1 Sep 2022 14:12:47 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.12641.1662041557490933189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 07:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=puZQA6WQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id g7so7658953lfe.11
        for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Sep 2022 07:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=t+zrhZ6gxhAAV70YWb1A2AFAURUcDpExZdst8Q/Cstg=;
        b=puZQA6WQpQkyBLcWGOhkoQEzqf0INNZC0Bfvkv/RGfsgxeOyh/zOWKlpnoKiklufJ7
         wIKuKpcUyKPqh13eK0TbirpWm/WYtj6tFx9fMhQWGTOg3+Ah7ZpNCfJ848OeaX5GaYsw
         /fvqltyTi1MqHcKBg2BfAJKQ5NgavmRhdfHzob4I6v4dC+vfdTCh26F5TqBd+cyZLAzK
         Yp1h3lp94XkkNhqNmWxpxOufnV4DRFeFmXLUhoMUt3mjN1yU+Z+o169haJuERoyKz8l6
         1U99wf38GcUMIXW+Ya51G8wwYLIsOAmhH6UNAk8cVDFRiUcY53mD+FoUKvAS/eionE6M
         tgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=t+zrhZ6gxhAAV70YWb1A2AFAURUcDpExZdst8Q/Cstg=;
        b=bsL06oVHJfLK07VqeTG5g6ctC4eP5t5tpNMab/aGV7cZL21AEG7SrWEUPDAxI881GG
         4ZjvaQvIN7vrj7FBjv5OjmcjLIgHsAKmNTokENX2dZ9nLT1slujnyriXoII+cGcH6e46
         7nx2pLoHYHiPW3JXY7UL0F2CAAeyoZ48lYYgwMosdX45M2KDBGcQDjA9LBVJi2miEJrI
         LWTC11/KtUBSvMyoWWZQ4o9xj96ff/FK7yPTY3SzJV/L2HHZwSVbj++De56HWk1U/+TR
         hsv6Yk6sIRAFk804THejNViqdX6rSPxK1/LBj6s3ZbrAlsJ/I5ybGoUrJPqTECCU7yNS
         9sfg==
X-Gm-Message-State: ACgBeo3MVhsc8r9VSi2BJJjPLkGYPqZIYGsN/Pv4yw97vbzJoYPlh4xz
	nISB1Sh/tXK7qMXeJjF9xROgo+Hh09oLR9pd4FA=
X-Google-Smtp-Source: 
 AA6agR6Ka3iAXX71QYPOp0m6JSIQV30TsltqcW9d+h7yQ/XygX2o72xWFuN35Bevo5T3aM+4fN0fiBAzzVbO7HmXD40=
X-Received: by 2002:ac2:519c:0:b0:494:9f3e:3c5 with SMTP id
 u28-20020ac2519c000000b004949f3e03c5mr727294lfi.665.1662041555299; Thu, 01
 Sep 2022 07:12:35 -0700 (PDT)
MIME-Version: 1.0
References: <1710BA34037FD8E9.1438@lists.openembedded.org>
 <dd196c7c-93e5-2854-1479-8e51996929fd@gmail.com>
 <CANNYZj9wiX4MPLwqrtMXtPqwMMWrQPmrDZ186vahPcDpmZk9pA@mail.gmail.com>
 <4bab9a949e5f6766e6dd611a21803851881ee972.camel@linuxfoundation.org>
In-Reply-To: 
 <4bab9a949e5f6766e6dd611a21803851881ee972.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Sep 2022 16:12:23 +0200
Message-ID: 
 <CANNYZj-hh5_PBAEbJzpy7LCrPe-FWOaN97Ockz6P3+rd+=CMgA@mail.gmail.com>
Subject: Re: [OE-core] Error with TEMPLATECONF value
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Jacob Kroon <jacob.kroon@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Sep 2022 14:12:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170220

On Thu, 1 Sept 2022 at 15:43, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Ideally, the checks in sanity.bbclass would migrate existing builds for
> this issue...

The check and the error is in oe-init-build-env, so cannot be fixed by
anything in meta/. But I think I can add a special case for the 'old'
values to the script.

Alex

