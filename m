Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA31DC001DF
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 22:59:35 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.web10.450.1690844365906847858
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Jul 2023 15:59:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZPGdycqK;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-6bca66e6c44so1022072a34.0
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 15:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690844365; x=1691449165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FG1rZz1BJbmTf5igqxB2yDxo9VEuex9wk7H+GF3Q/4k=;
        b=ZPGdycqKG8ywKuRKrk/8Qb4Z6rnjhhJt5PLxpft/8QD7cmlyM6qMuMy4XYmClSWeDg
         ir/kKmdWqyvuGGv3y2+mOk0+VemQLgTU3itCGWCWgjPUaJCHmKQKNbkk8bLM83uVTXuZ
         UnUscC8o2COEqB31VQ4bqOF3u4emVqPbhWUd28hO0xZmMz+0bMplTCkKDj4eGW3B6cnL
         +j4N2nPjESF1fib8w5o2jAlkMZEqA6Xf3L0Ox1YgiD+XE1FM405r1xmOUrPwKOZMPLx7
         eIcaobrqoSsPjBBh4X/Qf1GJaFi1IhxlQOkH4VwmAym7b2bp1c5cmHbOUkBroTk/8vDU
         YleA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690844365; x=1691449165;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FG1rZz1BJbmTf5igqxB2yDxo9VEuex9wk7H+GF3Q/4k=;
        b=aljoTCQPi0IDC+hdWrbT1FXP8A1iYAjhwhu/UZMbIrvTcxwn4WVIyWvQrv34OpP1ra
         IZoyaNxH81LkcWNTjJ10meKVkLmR4J4NajIVQXgUKzSOGHXp2Ke5fx8qfx/lqk8Iz0d4
         1+AeoQkIfzTlMLldxYcpOxhvmzMcCnBB0VAiXBiIngTghz/DtYl1uSTJSQc924zuUBtv
         T972/welRLaIXs4+/O517UdDXLFG0FF+pdiu0eyNgp+ztcparOGJbheskdalwaYnK1BS
         yTbyJXoJSj6raiDd5rhl+isyZOsfqkSB1QdKyPL9W0UIfBU21QLzmkEvtnzP/f3tiVot
         jfGA==
X-Gm-Message-State: ABy/qLbjyOC5Mq1d710gvXn0JgcyK2QVs7bTzgS7FFPDUVGl1DfXbWk/
	oaRqHMBxfbTaYPF3t7tywufiQaMCTrGPQXyXgz9ABx1J6LI=
X-Google-Smtp-Source: APBJJlEfLjdF6sAo3NqWOa4L1uno42fMQRtVbBxXejcmk1ra2TEjxkb4T1gHOk+dDouSxNn03tNiFCzHw5wEO/GbPJE=
X-Received: by 2002:a05:6870:a2ce:b0:1b7:2edd:df6d with SMTP id
 w14-20020a056870a2ce00b001b72edddf6dmr13359705oak.10.1690844365026; Mon, 31
 Jul 2023 15:59:25 -0700 (PDT)
MIME-Version: 1.0
References: <d106870a-120c-7c32-8a12-8bcd9ef52ddc@gmail.com> <24636.1690825719292717322@lists.openembedded.org>
In-Reply-To: <24636.1690825719292717322@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 31 Jul 2023 15:58:55 -0700
Message-ID: <CAMKF1spOdFdb1ZmM7W-aRTkUF2GnOf7RMFKy+_Z3scY_rNgTKA@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] gcc : upgrade to v11.4
To: sundeep.kokkonda@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Jul 2023 22:59:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185182

On Mon, Jul 31, 2023 at 10:48=E2=80=AFAM Sundeep KOKKONDA via
lists.openembedded.org
<sundeep.kokkonda=3Dwindriver.com@lists.openembedded.org> wrote:
>
> Hello Khem,
>
> There are 393 New Test Cases added with this update (Refer the attachment=
). Out of those,
> 88 Failed cases: Mostly from gcc.c-torture, gcc.dg, gcc.target, c-c++-com=
mon modules
> 13 Unsupported cases: All from gcc.dg module
> and other 292 Passed.
>

Thanks as long as we dont have failing cases which passed in the prior
release. Its fine

> We are currently working on glibc failures as reported earlier by Richard=
 and we will look into these gcc failures after that.
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185157): https://lists.openembedded.org/g/openembedde=
d-core/message/185157
> Mute This Topic: https://lists.openembedded.org/mt/100387943/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

