Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0367C001B0
	for <webhook@archiver.kernel.org>; Sun, 23 Jul 2023 12:08:34 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.24143.1690114110299786473
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jul 2023 05:08:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=NRKmIwrq;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2b974031aeaso28603691fa.0
        for <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 05:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690114108; x=1690718908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sKlvcwD9VvnQGQy+AQj7tmXQRb+/kTZq8OHvTJ7US9E=;
        b=NRKmIwrq2J7G0wrgUrm9TYfWjM4HrGT9tBkbbG6Ja4n5MqFtG18AdSbhusu73t8owg
         4yKr60UMzNdv05P1wgFtcOshOvA3o0HSNT85vl/814Q3zu0j3T+FZrdrk98WM27uy0iC
         YSpiRZdJQvv/3c6V+5VQxioPIKyJg6OwR+AK8DOamQY3X9qM/AueNusrkZMctFiwSEtk
         SgMLqByLEzcNwjz9BQleT7v7Y61n1AWj7dP2dCsG3YT7icGkwPJYi5dcnyNUwfaI9OtN
         LbSMQBnt2ei01vBQxyuMUkl0gVo8doBZmZ10Bz1tsDOfpieeUppEZLWhd4LUMrOZopZo
         HrBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690114108; x=1690718908;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKlvcwD9VvnQGQy+AQj7tmXQRb+/kTZq8OHvTJ7US9E=;
        b=CfofZo0QqawbtAH7h7q57+GYag032Wb8MyRAC13gug3lukVlHICmaqYd7XCAWq3fpJ
         ucwLeORB2MtDVtzFUltoh7UhFw7KTZxlIb+fQeAngH9kF6MDefd6XbVDzxAc+/083k0Q
         I/RRZuIb+ANdfJt4knolLbvmX24DW4zS0HXFYwhnzrfnKIOwy0KpwOGUSxUJysBVq+dx
         IqaFz79UGqupe953t2Xm+dV3JmSZGDp/jTjetnSidZYAdkxC3b/5uqGzyQxiKVu5AEU8
         4pjGEXWRd/15oO1aHMFU+n2tlqbIkdjTtl0BF3v2SsJ85elbU5YK87Bp61Jdl8CvBcyL
         2RMw==
X-Gm-Message-State: ABy/qLbv+AbPqxdHsYpaoGKHwVixJ6aVWJKrJZTpmUDsf4C7hVQNTQn4
	6GYkZNH/jYoN/lG8u9ihfOYZ1puaMjGC1s4TJEU=
X-Google-Smtp-Source: APBJJlFjpZxwTFyzBiwKyGv0Ha4Twy9Yn5CWpi8fxv5Q0svd0tXUrjvRZjb3r6VtD6tcV/anoPnZBQ34peiCgG+ugv8=
X-Received: by 2002:a05:6512:12d1:b0:4f8:5ede:d447 with SMTP id
 p17-20020a05651212d100b004f85eded447mr3929442lfg.28.1690114108249; Sun, 23
 Jul 2023 05:08:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230721105827.1637688-1-ovidiu.panait@windriver.com>
In-Reply-To: <20230721105827.1637688-1-ovidiu.panait@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 23 Jul 2023 14:08:17 +0200
Message-ID: <CANNYZj_a-+9MdidiWv0bRtQZWuyDebJmWGBSbyikfpkbsFeoYA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mdadm: add util-linux-blockdev ptest dependency
To: ovidiu.panait@windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 23 Jul 2023 12:08:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184749

Can you please check why the test doesn't fail with the dependency absent?

Alex

On Fri, 21 Jul 2023 at 12:58, Ovidiu Panait via lists.openembedded.org
<ovidiu.panait=windriver.com@lists.openembedded.org> wrote:
>
> From: Ovidiu Panait <ovidiu.panait@windriver.com>
>
> 07revert-inplace test logs contain the following:
> func.sh: line 335: /sbin/blockdev: No such file or directory
>
> Add the missing util-linux-blockdev dependency.
>
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>  meta/recipes-extended/mdadm/mdadm_4.2.bb | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/mdadm/mdadm_4.2.bb b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> index 50d9548747..fa50325f1f 100644
> --- a/meta/recipes-extended/mdadm/mdadm_4.2.bb
> +++ b/meta/recipes-extended/mdadm/mdadm_4.2.bb
> @@ -107,7 +107,14 @@ do_install_ptest() {
>  }
>
>  RDEPENDS:${PN} += "bash"
> -RDEPENDS:${PN}-ptest += "bash e2fsprogs-mke2fs util-linux-lsblk util-linux-losetup strace"
> +RDEPENDS:${PN}-ptest += " \
> +    bash \
> +    e2fsprogs-mke2fs \
> +    util-linux-lsblk \
> +    util-linux-losetup \
> +    util-linux-blockdev \
> +    strace \
> +"
>  RRECOMMENDS:${PN}-ptest += " \
>      coreutils \
>      kernel-module-loop \
> --
> 2.39.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184682): https://lists.openembedded.org/g/openembedded-core/message/184682
> Mute This Topic: https://lists.openembedded.org/mt/100274537/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

