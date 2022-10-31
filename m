Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E7BFA3740
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 09:59:10 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web09.7383.1667210348913688511
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 02:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LURqtlYA;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id z24so16085711ljn.4
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 02:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PV+MTASZJxx0mAzD5376JP8JvLumouY/WoUKDmHcjcA=;
        b=LURqtlYAmeB6M2NWvIIMzl9HeMy35E6O5oVdJ91ELExTl44zXhLK28iNDc+A+VC0ia
         InBTzUBYTvCZLjT5tCgrfK6lf/7LG/6gps92kU9dW9zXXHP+ZkAbRxeC1Y21KpVljNzj
         IdeCrlLcofIBlPYSlS66W/Lm7j+icj1OwX4mQii8rsBvje9gkDQK5oDGPz6Blrkkbze/
         0zd3w0adkQfLeS7ltyUkY+GECAKBlYCS2uMoNiWA/fU7fXPWbHQJJxT+3Yfk3oJBn1gY
         UJdBlEJIUWNsiBSzzyZEs2Mnwn9BUrf1BvuG9GAWPUMqkXe/l/5bxBgxM4nJ3xSNryaV
         LkBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PV+MTASZJxx0mAzD5376JP8JvLumouY/WoUKDmHcjcA=;
        b=dc8Syi57xRSNZ+vB/iKKDAV8RO9mEgTp7fECWMZrrL9ex1BdmJ7mor/FDFmHfYH6UT
         G7ML3APYLnzWxVMPbKrKRVQL7N5vidoAffoCM993jm/pypEtykLexsO1hvQC2ST5UQnK
         pQIe7Y86N2lKjrhiF8+dUYzgLUq0dxuwvkIRtp31H3wf8LrTDsgedOyg3MQCK5S94Ks3
         Pwe3moTiEzI1Eig8oB2luPqo6CAo765Ci1+MhYxIYyeASr560phyyQAvu2nd9QJVG3cF
         jDB7dI8Ae6PHa1/q8mjY7Ul46KTgpvo1tUYMgn+YxhJkXOwxjBeug4cFh0kkrNT9/zhl
         gY7g==
X-Gm-Message-State: ACrzQf2ECT8uVJ38SlAIP0rnzPfsEIX4wgDz8GVs7X0p44RdaL0W2TX4
	6RRpb09ijo+6jbWecogUJ+x7k0IOw+m+mZJKPMg=
X-Google-Smtp-Source: AMsMyM4yflIYiowEU41IPb2LgoU80XIepw71BTchnVABoQkzkW66NnHd+YFkJh24giBbhw4UVSVeOlAym9wM/ZOLx8o=
X-Received: by 2002:a2e:bd8a:0:b0:277:280:45e9 with SMTP id
 o10-20020a2ebd8a000000b00277028045e9mr5189731ljq.31.1667210347057; Mon, 31
 Oct 2022 02:59:07 -0700 (PDT)
MIME-Version: 1.0
References: <1666840152-10530-1-git-send-email-yanxk.fnst@fujitsu.com>
In-Reply-To: <1666840152-10530-1-git-send-email-yanxk.fnst@fujitsu.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Oct 2022 10:58:55 +0100
Message-ID: <CANNYZj-dbGdfJTH_unocbxSBYfka2as_BjZ2A7gaUu3q3qxjgA@mail.gmail.com>
Subject: Re: [meta-oe][oe-core][PATCH V4] bc: Add ptest.
To: Yan Xin Kuan <yanxk.fnst@fujitsu.com>
Cc: openembedded-core@lists.openembedded.org, fnstml-fujitsuten@fujitsu.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 09:59:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172301

On Mon, 31 Oct 2022 at 10:55, Yan Xin Kuan <yanxk.fnst@fujitsu.com> wrote:
> @@ -69,6 +69,7 @@ PTESTS_FAST = "\
>      slang-ptest \
>      wayland-ptest \
>      zlib-ptest \
> +    bc-ptest \
>  "

This needs to be inserted in alphabetical order, otherwise looks good.

Alex

