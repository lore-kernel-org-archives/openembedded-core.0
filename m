Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD1CC25B08
	for <webhook@archiver.kernel.org>; Wed, 17 Aug 2022 22:16:37 +0000 (UTC)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by mx.groups.io with SMTP id smtpd.web09.35675.1660774593497072442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:16:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZIaapExv;
 spf=pass (domain: gmail.com, ip: 209.85.208.182,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f182.google.com with SMTP id v10so78769ljh.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Aug 2022 15:16:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=mA1xUfIDZrwQUHE2FMjWi8FppilbxKnXFXkP+W0JDxg=;
        b=ZIaapExvDI5l9Z82L4fwIqzcfWfIz9uN2ucFx0yFxyE72n6l+cGulQt8tzxuSDl6VD
         Sw9H7upB+dXeGV/9hIK2JL4Ns1TI55GD8Q6+X6uwFk4s0laxIO/NjOYQ9ArCkho5odui
         VcJAEr51K1Yj6a+K8fxuh0nyhREiBJcrruhq/3uOle8HPg6mvP4+OlX5K+D2Yj2RvQ9W
         HBi20b0HZ8A4bXuhOQnwnl177xQrUf5AdJeXyiUlxK1FpzVYCk36xQlMmYrQL12pjyg8
         /vPKX1NpsjdowRs1j2SNvT/M6+T838LZPIr1gbEFU8AWpNKZLJiqom4bH3Rd2tfy0Vyc
         H46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mA1xUfIDZrwQUHE2FMjWi8FppilbxKnXFXkP+W0JDxg=;
        b=YLMGHcI74Ys/RxBRSKEv00WdC6QMGToMUV5fgbcLHII5s1CLmgYvG47uZHx7G6GbSK
         RSXPpb4mZtb1T1sm5cbRHC26KFVSkBTb0QI6JUuDh+6JkYPneEcPmySW2ZM/g1CahgU6
         1GWXYUopgwsbDSosg35eigrR60wIyhi/0m6nQ0gr+ZnwINXV/OI+1sHFAkfdD2rCeE6s
         gB+Kb1oBwTvE6LgFHBmKxG9a2fFd5TqrBtqWzVQ0LTJ5bCjwiJs5vG9NVgCaXpwtZKWd
         dul6m17CqA6q0OU5cx1xq8x55MhMo65Tr1EluNPlc91UZj3t3QFaf8zfs3t2nFB5NUYS
         zgCw==
X-Gm-Message-State: ACgBeo217sWA+WfCExO7Agry3Zt9MrtPJX7WlTmAv6m51sGmJXxApO/+
	PsCn8LedJF37AEyTxppv8ge5EUMSFEgXANUttao=
X-Google-Smtp-Source: 
 AA6agR4RNS1qW7KNUaAphm26RotT7ZF5pNT1G+l2QjxoadTpd58epaG8DMe9In2t8v8QiX2hI5SGO/6FlgKW0R/nMAQ=
X-Received: by 2002:a2e:7d12:0:b0:261:81ae:f804 with SMTP id
 y18-20020a2e7d12000000b0026181aef804mr90737ljc.56.1660774591656; Wed, 17 Aug
 2022 15:16:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220817131023.4093773-1-alex@linutronix.de>
 <20220817131023.4093773-2-alex@linutronix.de>
 <bff578854db1852bc0891463e6eecd3c892876bd.camel@linuxfoundation.org>
In-Reply-To: 
 <bff578854db1852bc0891463e6eecd3c892876bd.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 18 Aug 2022 00:16:20 +0200
Message-ID: 
 <CANNYZj9k-WxkGPLeE6PzZMSyy8xjtU94ghV465JP8EZu1oFKow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/5] meta/files: add layer setup JSON schema and
 example
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>, Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Aug 2022 22:16:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169508

On Wed, 17 Aug 2022 at 22:52, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:

> I'm still worried about bolting a format directly into one of our core
> tools as it effectively means it is a definitive standard. We do
> probably need one but I'm not convinced this is quite right, perhaps
> because of the above reason. Not 100% sure but something doesn't feel
> quite right.

This part can perhaps be addressed by the venerable 'adding an
abstraction layer', in the shape of config format generator plugins. I
can supply the native json plugin, others can add kas, repo, or
whatever else they find useful.

Also, the json is versioned and almost nothing in it is required. If
some ideas don't work out, or are found to cause problems, there are
ways to transition out of problematic bits - perhaps even as simple as
dropping the bad ideas from the generator, or the setup script,
without modifying the schema.

We do need a starting point though.

Alex

