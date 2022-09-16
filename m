Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD779C54EE9
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 10:34:18 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.4536.1663324454147725859
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 03:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=j3jVV8Mc;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id f9so34153083lfr.3
        for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Sep 2022 03:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=8eqJ/q91EencyIbyYOK2t5XS+8Qt2gyVtce5m/WV2TI=;
        b=j3jVV8McB3zCWkl4YOR36EHGVi5X9Bf7OHOyRMqn3icIyq4bFh2+g9V1qMAMPzcWVu
         GLPTl9rwKRJ0xu5k/8hCGCdOxh0/s3NODJRjk1jsvQ4tuY4wiR2TNtouM3kRsAvPudw9
         nB47JehVmALnjYt/jB6MPp5/GDvy+np9PHYwWp6+NKhqd5DjT5Ph+ZDl47uIaf2nD76P
         RbKJwSpugmg/psSsnY6AdcGm/GsdaIxf6XP8t3q26I0EXwEE8XkQ+PiWFe+chueuzrqm
         RMt8AEB5wlZViFVSyTcHqkUEfN2ZtO6o2yLWe8QM6OiY6dUjXssJrsY/gRqnGaKsBEZd
         A9lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=8eqJ/q91EencyIbyYOK2t5XS+8Qt2gyVtce5m/WV2TI=;
        b=g3Odtg3S/Eo3EDsDIhibWFdqVa/zvG2u+0fndiHFI385UyoojS+cEfrjg9nQMHNAxn
         D1QDgfEHtsUD1pWwwdFi5sH2f9SSdS7UkTqovJf88LnIe1uj499U2Cr7Oo+Ht6d65fGj
         5e5m0t4MYVtUjWgT6huO/rqvyg9ZOItWssK0wDfG07Wt9YrXijN0GUPPlybYgBrGk1X7
         9nFDSDKIu0n+1HK3tjQLSQZ4SgK3FIqXOt8+Fbd1fofovv2snjz4rzDJH+84Iy8oSjdJ
         bcOQpB3Jl89YmIveEDNKknDQ4d9QQ5O42/r/ownv9UlKWzdt+qDceMsDhcxSy7KdtIgU
         dRdg==
X-Gm-Message-State: ACrzQf1wwKWosKIW0J3/fEjhKLhY+W2WgFVqiFgzbCExgPXLlRylGEXC
	MARNhMYz1AtagdVCviGzaYJolR3+JueEtUyguyE=
X-Google-Smtp-Source: 
 AMsMyM6Rpy/DXnCH8NwXEXIvl+danodSwp3r8CoP+XL4h6DxXq7VARueKwM959OyFcBpz2R2P3rirkUklnH7ozEnG58=
X-Received: by 2002:ac2:5d26:0:b0:494:6d31:4c5b with SMTP id
 i6-20020ac25d26000000b004946d314c5bmr1526950lfb.358.1663324451718; Fri, 16
 Sep 2022 03:34:11 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0101018341840303-0b2daec8-9d75-4213-9067-f3d9092f7bca-000000@us-west-2.amazonses.com>
 <CALT56yP0sutR1zeU=H1Bs3M5zFnN0ZUJF-fLDw5LNsA+tegHeA@mail.gmail.com>
In-Reply-To: 
 <CALT56yP0sutR1zeU=H1Bs3M5zFnN0ZUJF-fLDw5LNsA+tegHeA@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 16 Sep 2022 12:34:01 +0200
Message-ID: 
 <CANNYZj9rUTOnMmKt0jHTQ2QPAFoMN3SP-wQD-ZA9JgUCFrkKFw@mail.gmail.com>
Subject: Re: [OE-core] [AUH] linux-firmware: upgrading to 20220913 SUCCEEDED
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: Auto Upgrade Helper <auh@yoctoproject.org>,
	Otavio Salvador <otavio.salvador@ossystems.com.br>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Sep 2022 10:34:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170785

On Fri, 16 Sept 2022 at 11:26, Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> Note, the patch again rewrites the LIC_FILES_CHKSUM, which results in
> dropping the separate WHENCE_CHECKSUM variable.
> Can we please teach the autoupgrader to handle such cases and to keep
> the LIC_FILES_CHKSUM if it contains anything other than the raw value?

The actual rewriting is performed by 'devtool upgrade' (code in
scripts/lib/devtool/upgrade.py), and seems that preserving variable
references in LIC_FILES_CHKSUM is a corner case it can't currently
handle. If you can fix this, patches are welcome.

Alex

