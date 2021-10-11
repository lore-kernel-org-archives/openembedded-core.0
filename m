Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E4ECC433EF
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 16:48:17 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.1029.1633970895675605764
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 09:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ax+5zBrE;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id r16so16942307qtw.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Oct 2021 09:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JUHt1WN3qxDJLraBOvW240RfH30WFLJjEAQ3NgumLzM=;
        b=ax+5zBrEJ/2IbS2bl6kZOvlOrIy77g8Kdf5Kn14AFsd6OXB4oS71uwV7bx4oyDjMnj
         AfWP8o1jTv6oLrDblYjy64E3EDd2zKm3VqsQ+fes5pi6ULTR0FKyrQ889J6UiId/qvOc
         firBuP7fJPe0Z4ULaFrF41BYONv0QzzbOmqZjoPt/D2t+S4n4yBe5ox23eTEcvMa/zrs
         +vA3Agq/EYSKtcujpy7Ynu37H5+1wemVSZGf9E6fis7HAcGyJJ8Avqr5QZcLnvbrO2Le
         E8vQc8J1NDxBnP/1Ox59WK7Y1at+VIkoNBckTP77YeCGdgTjSpHd7DteLIg+BmZ1+j+Y
         h+3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JUHt1WN3qxDJLraBOvW240RfH30WFLJjEAQ3NgumLzM=;
        b=g+3+xxnbB3HN+A33I1yIKfGGW7y8TNMw1UdEYhBvk8VV77BWl5gRKH5BPsdZmUFYX2
         TQZX/yPyBL1jf5zhvZKhfsl9HMN69XpLqCc7+XDFdM09wbZp/XaqD4nvOA03Wy8CGLHq
         436K/EQi86Gtdab7L2oW2She2GFBnqvEP3e385VxVpmssPEEW44QRi2ZLiGgXk/yjA78
         0ZQ2IGkIOBFff1XDnnBDzm+BiDYi5LW1Ppft6mo3x558J/wC2d1XatduMR/WVgI57UIS
         Aw8gVpVC0x2yM99nTXd6MoUTVRsvNdnDnQGZFqlQKrZ0qOFxqpfOEP4+WFCcONZZdwSI
         H3mg==
X-Gm-Message-State: AOAM532sScg1Wg+fbJY6Yl0mkpKw5A3Dp9jvHhi2GLw0VU+UO3uoRKcA
	HMWaGi2gFYXWvZmiysT9IVdIEHnfFhYwpJHT+8tifrlJ7TA=
X-Google-Smtp-Source: 
 ABdhPJwZCQ0wgJZPvelGO8y1D3cKyhWcrcsaWEx0jvkUt53EYxvJWvQam1p7X3LX3fd2vAS8yIieA+RNDI9tbzMp9TI=
X-Received: by 2002:ac8:6893:: with SMTP id
 m19mr16143347qtq.116.1633970894686;
 Mon, 11 Oct 2021 09:48:14 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CAE84iWW+eiFK7bEU3fRZL62G7L2xmEbSQQfAkpzj5oQwM-fWgw@mail.gmail.com>
In-Reply-To: 
 <CAE84iWW+eiFK7bEU3fRZL62G7L2xmEbSQQfAkpzj5oQwM-fWgw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Oct 2021 09:47:48 -0700
Message-ID: 
 <CAMKF1so5t-v0Xt0dQbnP+dZYKk7pyVGG7kbrt+QkTz9PvsmgDg@mail.gmail.com>
Subject: Re: [OE-core] [meta-java] OpneJDK nativesdk recipe
To: Akira Shibakawa <arabishi900@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Oct 2021 16:48:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156842

On Mon, Oct 11, 2021 at 2:50 AM Akira Shibakawa <arabishi900@gmail.com> wrote:
>
> Hi
> I want to let my customer compile java code on Yocto SDK.
> But, there is no nativesdk recipe of OpenJDK in meta-java.
> Is there any reason to it ?

I guess no one submitted a patch to enhance the recipe to do nativesdk
builds so far.

> Or, is there any plan to add it ?
>
> thanks
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156839): https://lists.openembedded.org/g/openembedded-core/message/156839
> Mute This Topic: https://lists.openembedded.org/mt/86232870/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

