Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E931FC77B7F
	for <webhook@archiver.kernel.org>; Wed, 17 May 2023 09:00:48 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web10.45048.1684314041808939215
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 May 2023 02:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=lViHfiqk;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f387d97dddso690362e87.3
        for <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 02:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684314040; x=1686906040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tKv5IQA4keJ3KfqvmmfIIx4qoe7n6Gl4WuyCVcsXs/8=;
        b=lViHfiqka7JQetDjYgHJcQtMUUJDikN+iAs8daf17gCcWocILPcD7SqkpN66fgbRUM
         ojIeJl2kgUyiyBgZcBldPeLCRzCzWvoo/8fBpK2eQlKIL9CyNUAnnPMbYbeCjObRjvOO
         TzEhNdqmr7J2HLR9pLXoN/g27ocPGjtwLHbL4NU/2FVlUksPA0oe+GtH7D3fPKgE1o80
         Uhh47MF6bP52K9mzoOQhpZ0nDoWupih6H50XVFynXVsLJ/yVEgBQMPtHuQP0Q/S1/5JA
         qQScKcWA+nI49TfPmOQ4J2a45oxJ2hgZkjNpEJ9qBsLMGfX2ZoC9H8vtI7zX+AZJTwmc
         En/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684314040; x=1686906040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tKv5IQA4keJ3KfqvmmfIIx4qoe7n6Gl4WuyCVcsXs/8=;
        b=F7xtj5dcoTYH8Zv5zjgxBJA1I77hkkCf7ijiiaoLeN75Z6e8PjndhJkwb++CWF7JCR
         PUuMIuoRosbPLm4oMRXqnsXvNrd+PoMleVp6yDoRchFDqwpWXAsQ6EVvXyBtFmxZa1BR
         my6p7IuvxwvEBLD7UfVpPOk01XK5sJHZol+9w09t+4f9+GmJ3ayFQaI5Na+Oi9doGUGE
         MulKjEU9Ky4aZKGucdCT9K7tys6Ha3KrLZii931XlsLRVLaYjM2kCluhFxL30QVAj0lX
         llZgXVTywXmHE6eI/aVlHzrUJ/JIZXjyJABgsX7ayOnb8/8/OAohXTNunzlR+BQzXsJw
         JhSQ==
X-Gm-Message-State: AC+VfDwBDl98DmwSz+/XhF5AwWyJPw6alPC5z/tZB06rZGYD0mCoqZmr
	n2hn5jg4Q1b1XvTcmmDSXA6zdfbfFXwWL7fS4I0=
X-Google-Smtp-Source: ACHHUZ5zHc4+FWhIKgvqmvSerHpnZVczojUQx+QYSF0JL9oN61NeiXyVcnY17HrxeGNFclgl6obeZv8CVlp8lH4xm+Y=
X-Received: by 2002:ac2:59ca:0:b0:4ed:d629:8d26 with SMTP id
 x10-20020ac259ca000000b004edd6298d26mr26292lfn.10.1684314039838; Wed, 17 May
 2023 02:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj9aZbX9Ftjy=3r7m2LdTqfO9joiNPpQjcOTj1xcSDK9QA@mail.gmail.com>
 <22909.1684313758905019494@lists.openembedded.org>
In-Reply-To: <22909.1684313758905019494@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 17 May 2023 11:00:28 +0200
Message-ID: <CANNYZj-sr-8_5gdts577BEhVh2z5g2FhVu9kvTXLHeQ9Z__K4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ncurses: Update 6.4 -> 6.4+20230514
To: Florin Diaconescu <florin.diaconescu009@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 May 2023 09:00:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181483

Right, but if you can backport the CVE instead, that would be appreciated.

Alex

On Wed, 17 May 2023 at 10:56, Florin Diaconescu
<florin.diaconescu009@gmail.com> wrote:
>
> Thanks for explaining this. In this case, the other patch that I made to =
ncurses ("ncurses: change GitHub mirror") is not necessary (at least until =
they release ncurses 6.5). I made that commit so that an updated developer =
snapshot can be applied on top (this patch).
>
> Florin
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181482): https://lists.openembedded.org/g/openembedde=
d-core/message/181482
> Mute This Topic: https://lists.openembedded.org/mt/98944133/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

