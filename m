Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D935C433EF
	for <webhook@archiver.kernel.org>; Tue,  7 Jun 2022 16:18:22 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web09.14552.1654618693280815959
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 09:18:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=tAsiPFAF;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.45,
 mailfrom: steve@sakoman.com)
Received: by mail-ed1-f45.google.com with SMTP id h19so23708180edj.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Jun 2022 09:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6EiZJQz9SlM8Ki8JJF6pP+N8gUu4J5xHmumsUNGanBI=;
        b=tAsiPFAF8IN+RaugdFFUSxHTMB6TrpZ12iu3+SnlHwmxC+4fMTIwzXczhqzGXRk4zQ
         v3SjIu4k6lhIiCFTw48A7ySPefVEogf0e5PhY0oyEM4EE9mMIwlKa+NB0GXA036p+xer
         I49/NKQBI1oI951EKlmYa+v8EZGg4y/o4GQNTJlxXg2fI3gNCp+X9t3La9Nc52UPFwaU
         jT6Px5MLIue9aMKkyaciH7OBCOq6Qn8z8I5mDzGMvPiREUedlvMcfnwwtOMBWVdnnv2Q
         4kecqgx6K5dviRISTW7MTXt5SXglT6Ot+TluhCevdu+C/i2Vx0PqWcq20dii2QNdeCsm
         ITtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6EiZJQz9SlM8Ki8JJF6pP+N8gUu4J5xHmumsUNGanBI=;
        b=wczv6Om6If20qvhIAZ1vcDqJnW/Gwln/Xh+LOKXEGbvZAjNuse8PyITdCpAx5y8woy
         /gsIBHZlIMhiCfDYSc3a/N8/swgfa790IBnicoAezBK3f68x0BuLNZXgnTK4NNyxZROD
         N/oHTeyf3WEvDnM/54EXXU+3fvKgK1aNBYIVz0VEOsA256yCL7t+Fpyz/qagXOIassp2
         8DUTl9/0kxAf6gUmvroGAv42IsMu61jN/SHEvuKgs9UqFUUm+wNdvmQanLWNv/4ojV9a
         3iAkN1qkjy6+fVnjkuUIqhwiIzqEi0eSuc5jVkh+T0dNkZZkTjXvnttO1iYDrbV/sirC
         WqXQ==
X-Gm-Message-State: AOAM5333otO//8ItUdRFADvhdtIyE99tapolxc5GhmbjcMz74SIXLDBq
	NO1TGjFasgyeFGHmO+0UjWCI+JBrMq6tiAEy3KQzGw==
X-Google-Smtp-Source: 
 ABdhPJzXC3CExay9Bq8DB8aaAHN/B/ovXpLIIMIrU+iIMXoTw5KjD8BZ8JLhEZVmhcw3nIPXJUVBx5b69daFhDcM3ds=
X-Received: by 2002:a05:6402:11cb:b0:431:3903:eb15 with SMTP id
 j11-20020a05640211cb00b004313903eb15mr18842863edw.330.1654618691653; Tue, 07
 Jun 2022 09:18:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220602122005.17173-1-anolgajbhiye99@gmail.com>
 <22204.1654618205983575596@lists.openembedded.org>
In-Reply-To: <22204.1654618205983575596@lists.openembedded.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 7 Jun 2022 06:18:00 -1000
Message-ID: 
 <CAOSpxdYoYPS0Fjgfyt8uug8ozGdrU2qKSq2DaYY6P3oW_H75CQ@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] systemd: Whitelist CVE-2018-21029
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Jun 2022 16:18:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166678

On Tue, Jun 7, 2022 at 6:10 AM Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com> wrote:

> Is there any reason to not take this?

I'm puzzled by this question! A patch with this subject line hasn't
been submitted to the list for dunfell. Also, the referenced CVE
doesn't show up on the CVE report for dunfell.

Steve

