Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC38FC00140
	for <webhook@archiver.kernel.org>; Wed, 24 Aug 2022 13:57:32 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com
 [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.11126.1661349428910215746
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 06:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SfwWab+0;
 spf=pass (domain: gmail.com, ip: 209.85.128.181,
 mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id
 00721157ae682-3378303138bso422140667b3.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Aug 2022 06:57:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=VpNJ6dTsxqvJYNeN3A5qpsfiX+A6MPKEndQ+YrjJDw8=;
        b=SfwWab+0F3P/zaRxGZhOH/ZTxOJ3bm813UmzeB7OIythfeHW+LWstZ2JSySIww2XNi
         4Kod+liJ0rQPJ4fZgxxoFJ/+HpRQiPdv0RzhWAFRa7xwWM4pEHeqFbTS7Tap18qNmwiM
         FcJLpDHa7b1vC1/2rwnD7y85GPmwyqKqHm57Be3j26jyjcJnofaZpfzuZURt0gAcSma4
         zGScy9OQ90nmgvrlkrLBpl5h42JOJclQ+joC1m9Url5cos93aosVZPP1f3GJGjZ4+erk
         tsSKNHA1zdRemy0WZd36Axqc/C/aclJ1+wC7RdpW+C2l9kiA8UYy5Yw+OhL7rlJWVW2i
         tHjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=VpNJ6dTsxqvJYNeN3A5qpsfiX+A6MPKEndQ+YrjJDw8=;
        b=cvsXKH/2KyQSNtpcX2qYAbyGNY2PVPAlChxPPS60yI/cq1hwvOkB3mI27UjSEgmOvb
         TjlsjGSL4TUJo88+9AXukPzS3a9IaUwANSjNqIvTcQJ87m9PdH9BGj5YxpusII+xzKhS
         Qx58dQceNr3ltDaDjb4xHetiQG4QpAtSJZ9wnJRB+2wjiZwvqzct1ScT3seN1f/44Iw5
         tF0EeYdX2Anl7bAMYgcBXGwFEHrtffRii+N7r/pCLcM7qKS3wWUgCY2Og/CVzR9+PuyC
         ZISQTHKqOHVYwlGow/7MZLLKEpzIjlKc1UsPQYo1ddgMowMmR1deMSnHhXxwPk+4+/H4
         Oeww==
X-Gm-Message-State: ACgBeo1Fb7T0X7H3XraGGKqVNlwyGowri+3t/8EP7LLyeUVbS6kR4Qjp
	2CBa48FACimtZuXuQIgE78K9K0miabW3ItVVKVs=
X-Google-Smtp-Source: 
 AA6agR7OviXFO/fMtB2oCJx1gkxfWY4HJeBUp8PSqEcDlDc3O6WfiZkM3Id+9UDXpEfYQczpI6GvK/OiZGUAQn156xY=
X-Received: by 2002:a81:1b84:0:b0:335:f95d:f4de with SMTP id
 b126-20020a811b84000000b00335f95df4demr31985844ywb.422.1661349427953; Wed, 24
 Aug 2022 06:57:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220824063443.1774094-1-raj.khem@gmail.com>
 <20220824063443.1774094-4-raj.khem@gmail.com>
 <20220824114410.4c9328aa@booty>
In-Reply-To: <20220824114410.4c9328aa@booty>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 24 Aug 2022 06:56:41 -0700
Message-ID: 
 <CAMKF1sqfH92QwFE15Hs4vSNhyAkDrOKb+j-EoGTLaG=5qwL0qQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/7] enable _XOPEN_SOURCE on musl for wchar
 usage in curses
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Aug 2022 13:57:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169817

On Wed, Aug 24, 2022 at 2:44 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Mhem,
>
> On Tue, 23 Aug 2022 23:34:40 -0700
> "Khem Raj" <raj.khem@gmail.com> wrote:
>
> > This is defined for glibc automatically with _GNU_SOURCE but not for
> > musl
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
> Missing 'pinentry: ' subject prefix. I added it when taking the patch
> on my testing branch, no need to resend.
>

ah thanks for help Luca.

> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

