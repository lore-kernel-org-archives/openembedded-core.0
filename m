Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C89EFC433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 10:10:54 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.9828.1633515053350745940
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 03:10:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=1D+c98PF;
 spf=pass (domain: burtonini.com, ip: 209.85.221.43,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f43.google.com with SMTP id r10so7130853wra.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Oct 2021 03:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lgTbgod7KglD5zp1jtLcZFBbfYoZH0P6SPe6Pe9mbvA=;
        b=1D+c98PFeVHyBCrCY0eSgSKmGA4/cFD+oFYGbOiOx7uWYUmpF6aNBt5RNM0fInxOyI
         qIaz42hXu/aYfvEFJyYzV4tuDhGvhIiuSeYR0TkKlhQZqzlNz6xWGdq+J7AJjM7Bo4+B
         3P+ArMxBEFn4pDlkGyDjHbd1YbdiLBH1PPATslQI1fagKfGj5MTrsUGGOrTCJ5fgBsx5
         Ebqo3f1NlkL3s0UWDYrFfQoFKIyV83Tj8AUIU+yTdXN6I4QDzqK5C1LrFzWJQLf5Tm/M
         UEcuZGHllDLfJeVecJVMCL+sZxV5+twwPhbFqcojqTSZgSgbVU98oGYuYdsPLoIT4c4i
         iYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lgTbgod7KglD5zp1jtLcZFBbfYoZH0P6SPe6Pe9mbvA=;
        b=Mdr6Tyax8Av4EatKslG3NW6n2R3CfRth7rNAWpDBjx3lm8AoZUN3SXU717eEUZ2/Jq
         oz0tpPJnsZlI6UbcQj6ox+5zFVUCCHKquBaU4Q7Yd8z5BvXCVk95li0uhpBbTV6cqsKH
         WZiFO9vtR6oOMZsbSvO2bbBAH5rgyxv1g9fBsilEQmM8ab5h7YtLf8wRn/H3D9q0x0WE
         gt7LZ03hXBJk83k9gCaoqvzTFzR1K658CBdFyNsRl4dZIiYLrj2PR8nJqJKfjKuNa877
         El/OXEdJhoJvW1WArD+YLi9R8qeOXQdhhzf/Lfv3CuCeHfBlDmqCRLnGWQA/wHYs+RN7
         nXzQ==
X-Gm-Message-State: AOAM530wEfVf90ko7GH9gjslIMMq3gfl/oewqS7kVkaJVhDbL8VhV5z5
	69EjfueEZrhKhx7LyhrX1zfuq0WgVVBqfa6aEFRVgA==
X-Google-Smtp-Source: 
 ABdhPJxIdAzVGs1JjHOjn48I9bsnlaGlKSAxxhsPdCnE/lJokbKIM1Eg+wK89TVp+ktnGrcYHPqAN86Is0B/QnK4qJc=
X-Received: by 2002:a05:600c:210f:: with SMTP id
 u15mr8737918wml.157.1633515051701;
 Wed, 06 Oct 2021 03:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <20211005130411.2712850-1-ross.burton@arm.com>
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
In-Reply-To: 
 <CADkTA4NFGhRcQCj+sHLENM38eWEkjE4aLT1adj_KWoj=nKmpoA@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 6 Oct 2021 11:10:40 +0100
Message-ID: 
 <CAAnfSTtg7NmNi6Hu0+-LK41ya7--BPnwpzACFipePOUFqyX6wA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add libmpc-native to DEPENDS
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Oct 2021 10:10:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156685

On Wed, 6 Oct 2021 at 01:17, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> What's the symptom when the native dependency isn't around ? I'm just
> wondering why none of my tests have picked this up. Is it only showing
> on ARM hosts ? Something else ?
>
> linux-yocto-dev can use this as well,  I can take care of that, if you
> don't have the cycles.
>
> I'm also factoring some of these things into kernel.bbclass, but this
> makes sense in the recipe for now.

This depends on CONFIG_GCC_PLUGINS which I don't believe is enabled in
any of the default configurations.  meta-arm builds a few kernels with
defconfig, which does.

Ross

