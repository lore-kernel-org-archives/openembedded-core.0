Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5AAECAAA1
	for <webhook@archiver.kernel.org>; Mon, 31 Oct 2022 21:25:10 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web09.1566.1667251505614303333
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Oct 2022 14:25:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qwpOVAVj;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id s24so18284752ljs.11
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 14:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BoptFshCYqSqx47ziCVZIsEFZSj5RR7eAlm7EBv6vj4=;
        b=qwpOVAVj9CleyoKrqjB25T1WjRkpGVIRogh8U2MKdnKa289RLCYfPpBheTr0JfKm77
         YDKz00+Eg891Zaizl1cv/1KOfMop4TDEzgHk0SNfTXOGjQoT7S4gBdkSJatYqCwDbgUM
         p0wplMKQEnJ4h7I6nLY+/z9anXZgzw9UNDV4rShl+nNWTcOG3yQnbXruHI625pqFKt+3
         HcPe6SXA6M6ONibYnOQIILySuE1NJKTdtBpTIeS9QGXnJx8NIt9MFpsj8IBi8A+U18WB
         TrmynCD5NOfTJFVTmPrn1mxmjC6dQqhqDNJopObMbJWR6rqNGlBPRdNYRFjPsHOBrwII
         nExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BoptFshCYqSqx47ziCVZIsEFZSj5RR7eAlm7EBv6vj4=;
        b=YUSs7Q+s7UUIEEKFq+UFxdzfCt9Ut/tOrY4YGVFpK0Jtw8C+DmT2or6/sQUjAAaQ28
         +tO4WahcGnoC7qRDfU7pwFRvtVoaDT7to5qijc2lFTI+R0PK2H7OTAv7cog1KH0IK1NT
         276pnk49GGSYbxvsy/hsKe3VRfO3uh+QswKR9qt714ryBTKJg3ix7v+6Mn7W90OFYES2
         WMsmbEmKiG1JCriX7RT4phVSBMwkP1Zgy/OVxINj+VIzU1OG3qui/2FlVdo64NJ2DVml
         G3DR922KngzSTHN2XTcv3NiAWT4nKtcPH1Bs/+hPtuiOTZzMQ6E7GykRIyPEHX33Ne6h
         ftAw==
X-Gm-Message-State: ACrzQf29LP1Cj/admhl2ak+CWejbzxrn1yiaS1Zl5ER0wBIHpyDce7zl
	oQCElkAqpyJfTywmFXapF3yi1lWqVeAJItHjqJI=
X-Google-Smtp-Source: AMsMyM66oqO7pz6fb2fgqJvZnNvNF/KBYSj+Tonv8YeleZOhzkGBJ+7X1aAZl5G/WFUnRP161qCKR/B0B8NjSeArXAk=
X-Received: by 2002:a05:651c:23a5:b0:26d:d196:d04 with SMTP id
 bk37-20020a05651c23a500b0026dd1960d04mr30148ljb.403.1667251503692; Mon, 31
 Oct 2022 14:25:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221031210902.169924-1-peter@berginkonsult.se>
In-Reply-To: <20221031210902.169924-1-peter@berginkonsult.se>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 31 Oct 2022 22:24:51 +0100
Message-ID: <CANNYZj81UaR6CojRriPNwGbq76mk+0Y+j8khBy2ZTrUqm4R1jA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: change syntax for SRC_URI append
To: Peter Bergin <peter@berginkonsult.se>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Oct 2022 21:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172338

On Mon, 31 Oct 2022 at 22:09, Peter Bergin <peter@berginkonsult.se> wrote:
>
> In order to be able to override the git repo used in a bbappend
> file the additions of files to SRC_URI needs to be done with :append
> instead of +=, otherwise those will not be added.
>
> My use case for this change is to try to build latest
> systemd that is located in another repo than the one used
> by the recipe (systemd.git instead of systemd-stable.git).
> With this change this is possible to do by having SRC_URI, SRCREV
> and SRCBRANCH in a bbappend.

Sorry but overriding these three things in a bbappend is a horrible
idea, and should not be done. Copy and tweak the whole recipe please.

Alex

