Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16E6C43217
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 15:33:50 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.120848.1669649625340927962
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Nov 2022 07:33:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=OOd0mnqq;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id s8so17951882lfc.8
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 07:33:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cYcE6FW5PErAUwArWLjvOmjYMkgBJ8xX1l85PGv385k=;
        b=OOd0mnqqhDpKpR7saQhjfx7LjidjyWYysvqktlsA1okGT0gS+VHk2Hlf4SC9FgG7lM
         SMBgb+nzGcgvLaUmcVAp0dqvArkWmcf2jwkMZEHr+SlOvYT1U4GuljVCxXhr7lq2nlMJ
         4YXicmIv/ZTSQaRI5S1H6xkduddvCc+Bssy7EAM6fkmOTLELHzCgCKRyuv/l3ALzwpbm
         15guTrS3alyD9feb4JNha019Xy4BkbNOCbwiscCQWs71sfkl+x6CJuvXpUfMmhO+mdvL
         GE5NGR8FWc4kEpb12RxsSAho0gWN8Z4OZYzQ++3AUMURHe/fDZ/d5G6V/4LJO8eSHRCC
         MlKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cYcE6FW5PErAUwArWLjvOmjYMkgBJ8xX1l85PGv385k=;
        b=CTHY+Sqc8iq6BO2xPN3RWRSHTaD93g0vR9Cnfox29STGZE0gJo4GpE2Nf6R7ufWV9h
         5ZvDI5GLZot7ESmMkoT4kdNS729e7KuRFlmHyOgwuN7woYJzE77EPCqG2D3pUUwBrkFN
         NB46OAQEXMfPwHdgYBt1sQ/VL7nO7T3qxdl9j/fk3bIwteRMwZTmATRVX0K6Zk6YnAwh
         Fstf42WAllwd64HZy9/8/RoKBc2/5uTsGHRNjbgeOd38Ta5Gjvb+ENwY7zqAwWLcFyoG
         TvjzCWAB+SUnTy6mosCv93ujmnvs/lXPN5GRs17gyzyk34HA+0Mjxiule0KsExjAr+uj
         NuBw==
X-Gm-Message-State: ANoB5pmIpfnPeqUD8Dj/ROq7FsQXg9vEY90P90Jdiu7lGTmorNotS8bx
	VRcPY68eyGbLb+sB70Fv9U/IkzTungPTjn5joMQ=
X-Google-Smtp-Source: AA0mqf4KWUvz/OB+c9XtG+IehiUw1Q3NZDoWyjbVUBbFgeGuBy5dUZgAwcudtCjNxRHcC3F09RnXDXAeOTxbvLve1P0=
X-Received: by 2002:ac2:4c47:0:b0:4a2:4d53:8294 with SMTP id
 o7-20020ac24c47000000b004a24d538294mr16116694lfk.263.1669649623378; Mon, 28
 Nov 2022 07:33:43 -0800 (PST)
MIME-Version: 1.0
References: <20221128151122.317262-1-f_l_k@t-online.de> <CANNYZj-u-9qbexJvrhnjA=tnd08vnathK8zJdSwUcpykys9XvQ@mail.gmail.com>
 <LOD2MR.LVNPXKRBX1HA3@t-online.de>
In-Reply-To: <LOD2MR.LVNPXKRBX1HA3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Nov 2022 16:33:30 +0100
Message-ID: <CANNYZj_V0D35j00OEZHTybduQdttzNKt-bFT0m2pZ=BsRx-Rvw@mail.gmail.com>
Subject: Re: [oe-core][PATCHv3] gcr: add recipe for gcr-4, needed to build
 with gtk4
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Nov 2022 15:33:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173926

Yes, otherwise I'm fine with it :)

Alex


On Mon, 28 Nov 2022 at 16:29, Markus Volk <f_l_k@t-online.de> wrote:
>
> I know that ;)
>
> Just sent to see, if it would be ok for you like it is. I'll send the pat=
ch upstream.
>
> Am Mo, 28. Nov 2022 um 16:21:35 +0100 schrieb Alexander Kanavin <alex.kan=
avin@gmail.com>:
>
> On Mon, 28 Nov 2022 at 16:11, Markus Volk <f_l_k@t-online.de> wrote:
>
> +Upstream-Status: Pending
>
> Please submit upstream first and include the link to the submission. I'm =
highly allergic to 'Pending' without a reason. Alex
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D- Links: You receive all mess=
ages sent to this group. View/Reply Online (#173923): https://lists.openemb=
edded.org/g/openembedded-core/message/173923 Mute This Topic: https://lists=
.openembedded.org/mt/95309600/3618223 Group Owner: openembedded-core+owner@=
lists.openembedded.org Unsubscribe: https://lists.openembedded.org/g/openem=
bedded-core/unsub [f_l_k@t-online.de] -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

