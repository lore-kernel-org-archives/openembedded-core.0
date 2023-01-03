Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1148AC53210
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 18:50:38 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.1840.1672771835172523905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 03 Jan 2023 10:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=O+Plmo4e;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id d127so26450138oif.12
        for <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 10:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ouwHm1zWrsK4DCtUqoC40JVoKnuVbbUSv782RM22HLc=;
        b=O+Plmo4eMIM5b5FtBEz4NnZwme/2Mrb1uyo8T98AuC5aIGV530s2cAHQ7I5jQ1esBU
         IC4Sjb+Bps8DGuxMkWkcQC1hEsWnyG2tbQJE/Cc3eitqJ7zxIEhBYEkSrsvhbQkFuWqz
         7JpNlQeT3JfSsfkSLp9IyKtqrMnAFcYH8AFB8NHyWeugYb6g9WGqhDSC0R69ZHQTwiV/
         eZ6CaugjDy+JhW0UdWFD7MiKwQ6u+wCwxw7GIC4Nz/BRmC7oqTVGLHMmLNFG30nz8FVj
         3+Gn1B0NWSV7AO2PK581x3oewoqHQ0JFTOeh+iA5IAfLzG1wc3+uDcvbnkWJT80qBmg6
         LNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ouwHm1zWrsK4DCtUqoC40JVoKnuVbbUSv782RM22HLc=;
        b=ZvBdgiUFZublLAvacXT0F2XIPTGKmEB3qM0r2JPALscduiNpMXWcX+NBRpF6wh/E+d
         SkLQ5JT1TJn+o3StJf3pnwqXF+NGnHjpLWttBMm9BW92+t2RIb6X4uD2fH81BJKZENlI
         nDJ3Kix/hk66cyOfErAHB80+jpYvhK87/32WcyQOhoXZyP9xhLnAPXBQdEe1tnLogpmH
         7Qa5qZSGGv3J31+UQ+6BptEF8pT/0pecCUcS6o8ZzgBoQp9JWaPFsP5z0hky/F0jLgMt
         om/+zPCDnJsNZTouX+gp6taP20KUhkmHlCqztH6b5gzFuumc1qnHSN0at0v3i3vJ2+iN
         OOTQ==
X-Gm-Message-State: AFqh2koO7epS47aaljOyn3ni5Al1ZYBFEVEXVjiT0tLbRfbmcaaXFd4x
	GlGnhe/hPLLwzxAc99AjSaFYmm75ABVdSUpYgo0=
X-Google-Smtp-Source: AMrXdXuYKoRmGTXXqtvoaW55fMpzYqZbfhIOJTpKitcZLNtOeCZk8pj9vVnjcfFIGJSOmzl80DxEJEr/pq5n6YKF9Yc=
X-Received: by 2002:aca:6085:0:b0:363:240c:bdc7 with SMTP id
 u127-20020aca6085000000b00363240cbdc7mr1764783oib.55.1672771834264; Tue, 03
 Jan 2023 10:50:34 -0800 (PST)
MIME-Version: 1.0
References: <52dceb5d7867a60a1da6c6f5879f4d949c9be483.camel@linuxfoundation.org>
 <29497.1672753788020339166@lists.openembedded.org> <a801ec1885aee5847acdc047b9fe133d9250d8b2.camel@linuxfoundation.org>
In-Reply-To: <a801ec1885aee5847acdc047b9fe133d9250d8b2.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Jan 2023 10:50:08 -0800
Message-ID: <CAMKF1sqe3K6y1=0xsB_B=ZbK4KMoiXteUFpUL==EZvRpbxMSTA@mail.gmail.com>
Subject: Re: [OE-core] [master][langdale][kirkstone][dunfell][PATCH]
 glibc-version.inc: Use https protocol for fetch task
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Jan 2023 18:50:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175364

On Tue, Jan 3, 2023 at 6:02 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2023-01-03 at 05:49 -0800, Ranjitsinh Rathod wrote:
> > Hi Rechard,
>
> Whilst that typo doesn't bother me, it does make me wonder about the
> effort you're putting into these patches and I will judge them
> accordingly.
> >
> > Thanks for the input.
> > But is it okay to change protocol from git to https. I can change the
> > commit message if it is possible
>
> If I took this patch, I'd then get a load more changing all the other
> git protocol usage to https and you'd point out I'd take one so lots of
> others should be fine too. We've not made any decision to do that and I
> doubt we could guarantee that they'd all work with https anyway so I'd
> suggest you sort your network out so git works or have a good source
> mirror.

Some orgs do not allow anonymous git protocol through their firewalls.

>
> > I hope it will not harm anything if we change the protocol, right?
>
> According to your commit message, it wouldn't fix anything either. I
> don't actually know what issue you're trying to solve as you've not
> said. I can guess but that isn't really the point.
>
> Cheers,
>
> Richard
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175354): https://lists.openembedded.org/g/openembedded-core/message/175354
> Mute This Topic: https://lists.openembedded.org/mt/96026992/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

