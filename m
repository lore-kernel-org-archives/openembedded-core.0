Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA0EC71136
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 05:56:20 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.5818.1692338176098893265
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 22:56:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=bXgAYqwB;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3a3efebcc24so388118b6e.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 22:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692338175; x=1692942975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W/RgODnorh6Dbd37JtEw/tDP8ywYNUjcsL40dBceot8=;
        b=bXgAYqwBwLntFA2KIBqF5NgmB7z1dQ0kder0Kt2ES3wravmMZ3uXNC78JbabsCQvw7
         MKWqbQJx9MieOP1spVIY9MWgiG+gEe8yKBH7u3LZKKAdMZrbBiSJ5r1Rszph1t2unZW4
         GUlBiaDe/+GfWcAYydtVLEQLipNaO35KKY6PsUK9ZOD5A2KuONSa1KuZhIKKCkuRVrYs
         /iXCLHhsYd/yhvWtG5ayjTBR/rb2XaLNylZc6uTtdlu2fx8NcLlxabI5qrPwMQcvhPhC
         y2Z1A0fAYC3XsXhP6H+o02F4J3JXD6nV4zPkOrD/edr4chGpYPA2ULUPBLYM1n33eJ0l
         vX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692338175; x=1692942975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W/RgODnorh6Dbd37JtEw/tDP8ywYNUjcsL40dBceot8=;
        b=ChXI4fuxucMzcAKLVCAp11RAO2CKJN2Ft6ID6wA2CO5ycBctKittBYbKcLfKZjQrA0
         LRGRMA57XDtevuvd11JqtCu7wG1q/kXu4z4BfYG1k55EiTRmHavKDlUogajgT8VHIUAe
         ySWD8nv8HUplWskatUGF1VhAcC+prUI0qfmhIHCCOyHDr8iGh16HZTZPAX8jtK6zFKDh
         yjnPYK5DqXoCPSASkFhoYzzVdlQnZ85CAyHHtEZh4Y56KVJqQwQUZLYSCTkN45M2p7Nf
         PDi0k9Sdlzx9eDP9eDB9dFK8k89LBrq8QTNfNSY2k8KPiVuIWk+8+ewS1IyfvzUhmacS
         WARQ==
X-Gm-Message-State: AOJu0YzhNcMQiL37nFrCc+FxOqDmyPh7ZJJLriw1+PviVKFMGOpcUABz
	PssOkJGUgWCP//r7MRow8uRcErijtoz6DT+9bBw=
X-Google-Smtp-Source: AGHT+IEvRS204WusAWqRkN1ls5Rcxe6ab72STS/sBvOrTf7P0eFhiLP5J9xh5cXTZnFJNPsya4wNJkQOn9a5DHzBYZw=
X-Received: by 2002:a05:6808:1290:b0:3a7:7bd3:7ab7 with SMTP id
 a16-20020a056808129000b003a77bd37ab7mr2467501oiw.51.1692338175258; Thu, 17
 Aug 2023 22:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <4191.1692268389206468459@lists.openembedded.org> <Groupsio.1.4191.1692268389206468459@lists.openembedded.org>
In-Reply-To: <Groupsio.1.4191.1692268389206468459@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Aug 2023 22:55:47 -0700
Message-ID: <CAMKF1spebjQjonfGFM-Eer-0HcM-D2YnDYAb+b_+kb21029B0w@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH] glibc: stable 2.37 branch updates
To: Sanjana V <sanjanasanju1608@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Aug 2023 05:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186347

lgtm

On Thu, Aug 17, 2023 at 10:51=E2=80=AFPM Sanjana V <sanjanasanju1608@gmail.=
com> wrote:
>
> [Edited Message Follows]
>
> TEST RESULTS SUMMARY
> BEFORE GLIBC UPDATE
>  PASS : 4728
>  XPASS : 4
>  FAIL  : 237
>  XFAIL : 16
>  UNSUPPORTED : 220
>
> AFTER GLIBC UPDATE
> PASS : 4731
> XPASS : 4
> FAIL  : 234
> XFAIL : 16
> UNSUPPORTED : 220
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186305): https://lists.openembedded.org/g/openembedde=
d-core/message/186305
> Mute This Topic: https://lists.openembedded.org/mt/100797397/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

