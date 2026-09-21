Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3983C982E6
	for <webhook@archiver.kernel.org>; Mon, 21 Sep 2026 17:10:53 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1417.1790010653227616217
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Sep 2026 10:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=HtnwMQE5;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccead2aecso15870855e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 10:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1790010651; x=1790615451; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=k8vha1nO5u4WsxO8vgJ+sL59TMHS8WmgDBEh22m3m+U=;
        b=HtnwMQE5kKb1qI99anrj1IxJybXxcBOPpSKxhODyqdwf7BPc9bl/XdIIrAVYChAB69
         vC2MBGPuVbt2uwUmgOJuLFxKDC1hHnjV1onaFfIQ3v6VtudWfppJZwQwizLgUTKPBXFg
         8b39Vi7l7Y+z/KKQ2F3K19kWD4/NfPogZsWkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790010651; x=1790615451;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k8vha1nO5u4WsxO8vgJ+sL59TMHS8WmgDBEh22m3m+U=;
        b=yxwJVPFRM4Y7MvGtw/ocHa38EGfm27BrTuA9iipvs+1ViOjY+JwR5NN0m/lFjeDdfu
         Plmv7MYWuVoUHjNd8uF0lngx+EC9rvJC0M1ilartq91n8SsdOBSQmFzszp0c5jgbR2kW
         8EfcqFG2VXUBU3pwBNsEXkU2wtykhskf/+R34XYZehaVTSNw7slZDz/6u2d4//xWIst1
         vPkHhfR2hNarsEXwSfEt0jKXBEuNvB/h5n46FNKZ0UVxZDTTCom6Us6NQm0wnXs7vEuC
         HNtvZL/IOJGfrW5dmoUmKiLTbvliz7SwdMYMNjnLNgiZ+sdftHtjMeGx5kJ9+fcG8Ldk
         LJeg==
X-Gm-Message-State: AFuF++kusqX5JinNYqbHi5O6CZRvvItn8JIVhPIAGJQNIutvfGnnZK87
	5zWrIo2m41KZKEIV4nMFbQBPRB5pCbnIs7eh5cqJ+QbA9y9da0lE1qzuhO+6e0BgnYs=
X-Gm-Gg: AYBFou2CpSuadz+vs4sg3U5HnzB1ievQSvyiloPQqjk+7IlgOUQhy0D3NXGWo6XfiFs
	bo/8xaCxLA4HYRXWdjwa4eackBjPRv+LUrgDHv5TTGm29ho8JaGHTQhBkdTHoV29WiRgYo97Scm
	2qoMsWmo9TI16HjsUwyf85JXwNuG2s+/aFL0P3G3G63BRYA2hzyBdfsh04R5qVnl/gINlTnGc5z
	YcQSrQXX6MylSHpljnMujqlfgIChorIuWs8LXtGjzBV9gjDDevVOHOmB7C1oiQw4nDbD8pTYozu
	uNSmIAxFpxyLNyw9tZnHUGuqUYUOn/rImN18sg+OYZQ6jtezkN/OUJLQjSxLiRiUSp0ysZVsAQE
	A2zHFbK6JdcJxBJpVnWF2U//naRKcvqfdYMPbhKAM43MjvkrHsU0j2p2rD8SW28YmUdatEFZhfu
	PbTvojz9P9yI1tQ3KwotbUZu/wGW39tfPmTPvKXacnoV2gw+wMayPUiLSqTVntePfru2SYNkYbN
	6YEDhE1Nbsse4/eQl80bHv/SFGtPXe+NdIUp2Z3iX1V/NM8Nb5mnk49nnKVh9Vvz9bc9nc1
X-Received: by 2002:a05:600c:83c8:b0:49d:2536:402e with SMTP id 5b1f17b1804b1-49fc5851e92mr151173725e9.30.1790010651350;
        Mon, 21 Sep 2026 10:10:51 -0700 (PDT)
Received: from localhost (2a02-8440-3504-3a4c-d277-8df5-ce7c-5c26.rev.sfr.net. [2a02:8440:3504:3a4c:d277:8df5:ce7c:5c26])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fd8cb5e75sm4697975e9.14.2026.09.21.10.10.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 10:10:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 21 Sep 2026 19:10:49 +0200
Message-Id: <DLL5TG2FV5JQ.YWBC42KSFSSG@smile.fr>
Subject: Re: [OE-core][scarthgap][patch 2/3] python3-cryptography: Fix
 CVE-2026-69248
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
To: "Vijay Anusuri" <vanusuri@mvista.com>
X-Mailer: aerc 0.20.0
References: <20260901092741.34198-1-vanusuri@mvista.com>
 <20260901092741.34198-2-vanusuri@mvista.com>
 <DLL3Z9HE1TTX.36E2F147N6AS9@smile.fr>
 <CANQUz18EMCq2YXUagfO1nWmaAp4_11NCmoRJUODp1FOMRVkf5A@mail.gmail.com>
In-Reply-To: <CANQUz18EMCq2YXUagfO1nWmaAp4_11NCmoRJUODp1FOMRVkf5A@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 21 Sep 2026 17:10:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246344

On Mon Sep 21, 2026 at 6:26 PM CEST, Vijay Anusuri wrote:
> Hi Yoann,
>
> I downloaded the python-cryptography-42.0.4-slfo.1.1_6.1.src.rpm from the
> link below:
>
> https://download.opensuse.org/distribution/leap-micro/6.1/product/repo/op=
enSUSE-Leap-Micro-6.1-x86_64-Source/src/python-cryptography-42.0.4-slfo.1.1=
_6.1.src.rpm
>
> Thanks & Regards,
> Vijay

Thanks!
In the future, please put that URL in the patch body.

Regards,
--=20
Yoann Congal
Smile ECS


