Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C75C4167B
	for <webhook@archiver.kernel.org>; Wed, 14 Dec 2022 12:00:04 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web10.100714.1671019195058756614
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Dec 2022 03:59:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BdEEqDP5;
 spf=pass (domain: gmail.com, ip: 209.85.167.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f41.google.com with SMTP id p36so10014956lfa.12
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 03:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d2iCBW0Wa4xAhvNlWoiCmr8jso86EeiOX1mARjFDfLM=;
        b=BdEEqDP5961PAEQ7wfeBECZeNEy13Kgiw6oFuC0u/2ZDPkNIqpBGP13Wd79hKC6e8J
         Hg0GHLz17R8DlyYHoeAjaxOWwFUA+0d0tpq6s88wEK8IuQDslvwaOOGNCvV9D8XxOFF+
         RXYd658lWTknesKhA0/LBMU/1/1HciZL8x3FGGmxoM6T9mVJ/5cAjYn5ajZ16lTpHnfO
         UlvL/nbCrp+xPNSzX1Cu+l+zoz0T21vNFnzOui6h50/yViZv49tqZk+imuZM2nUlwUJJ
         F6m5dHFtvmdptJCwzmWadzAE9kpzDcdFm6KQrZNFmRL8VydAzaarlpU/OHO/BU7Z3qXE
         AqvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d2iCBW0Wa4xAhvNlWoiCmr8jso86EeiOX1mARjFDfLM=;
        b=mMoWBhSBS51Untu2/RSlHrQwdkErHh1SAaPonEkxXzA/3KBzYAnnZDW0h2KPZkwBy3
         jASSZ7XQXNIhQf41IdegwMqPhpPzFJUwmzj869ZYkTuAgnR7hIu3hVjI2Lj1/1mxTvdx
         24KwDJr9Zn1f5sdLiOvoTDtb7uTmSXNxjE2UbtB8p8oGZCl/E5L8XhJ3fSlIpY0WVxxQ
         rbEnJ3vGZvkUk3h1zlK0Mg7RSFYUvsIxIQ4NaLmym0JItd4ECMYCBI7bQjmo1fV2SQfP
         6wBlY2XH9xXS2WgocjV3sxt6zBLIvHLpWOjCO7xJtC4VYofWqCOHPfsB/Ho6hHay0yXa
         /JJQ==
X-Gm-Message-State: ANoB5pn1UEx93JZUzz3421hvv9rX1Hq2lOgENcR9xBMUkJK/7MCAk5y8
	mDuHYR1scHXOTjTA75yIZnMo6cIPZ3QwCJNGZ24=
X-Google-Smtp-Source: AA0mqf6BRylsHeuHnZL1mKdx4wekkcJX0EHdlOdezxnrXLOQ0h2hf2s1WkZGZE46q8qNKHN3gCnviiFX2g5BbJWeJ+0=
X-Received: by 2002:a05:6512:259f:b0:4b5:a6ba:b1e4 with SMTP id
 bf31-20020a056512259f00b004b5a6bab1e4mr2307703lfb.393.1671019193018; Wed, 14
 Dec 2022 03:59:53 -0800 (PST)
MIME-Version: 1.0
References: <20221213111118.149697-1-alex@linutronix.de> <20221213111118.149697-6-alex@linutronix.de>
 <CANx9H-DpJD=DVadew-BeAfhcTC9dqrEWbtx2WxFFCMBUPoXU0w@mail.gmail.com>
In-Reply-To: <CANx9H-DpJD=DVadew-BeAfhcTC9dqrEWbtx2WxFFCMBUPoXU0w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 14 Dec 2022 12:59:41 +0100
Message-ID: <CANNYZj-knMgt1gTw5W1QDOp=FzCJhivrezBQPg-RZx747PGGtQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 06/24] python3-poetry-core: update 1.3.2 -> 1.4.0
To: Tim Orling <ticotimo@gmail.com>
Cc: Alexander Kanavin <alex@linutronix.de>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Dec 2022 12:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174554

On Wed, 14 Dec 2022 at 01:44, Tim Orling <ticotimo@gmail.com> wrote:
> Thank you. I had this staged but my local tests showed =E2=80=98devtool c=
heck-upgrade-status=E2=80=99 went wonky.
>
> I appreciate you keeping us up to date.

Cheers. I picked this one up because it was in the list of fails that
AUH couldn't handle.

I think it's time we move a big bunch of listed maintainers who never
react to AUH (this is not you) to 'Unassigned'. The problem should
then at least be better seen, if not solved.

Alex

