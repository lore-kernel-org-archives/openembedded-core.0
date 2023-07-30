Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF57C001DC
	for <webhook@archiver.kernel.org>; Sun, 30 Jul 2023 12:46:40 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.71915.1690721193282306913
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jul 2023 05:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=gHo+HrS+;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4fe1489ced6so5820213e87.0
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 05:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690721191; x=1691325991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dIwd8+x3Ts2GN35jRjYgnt3d3rZav57ncToFNVxrVTs=;
        b=gHo+HrS+KhsMRAJ5aO/O5BnXGOYq/cz3l850rPgyEjqxs9XjzHReRqZTfKyP8rV9/B
         TO6i3MzwLzwUPhXbcwNj65w/nZw3zriqlCSg/XEpuh4mBXX0DIfL25wPGS5lIEX0E34P
         sYaJfJ8rh0lriRn/kk+N2TVEz2sJDMez/k5GYS68MwhxhfsKTdTWcdmnnIuYs32jbcqi
         vipZQnqx0zGTxUNdnPP+o0hnfqvcnsUjT3ZUS6SC6O55b+7zYiKpfYWGXvT7RPQxizEx
         ZsMVNeek38I41EgZS4MLX1NxQTfkPDMe3Fz6AMzjhUAOxeYov+q+ZepyXerZMPQGgWXR
         vB4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690721191; x=1691325991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dIwd8+x3Ts2GN35jRjYgnt3d3rZav57ncToFNVxrVTs=;
        b=BCH+pn1cotJieE5+LUZXpGFLCzych+A2l64KU7kpVCWd6Q42EMdzX90z9fW3PjM32T
         cEPIhCUPBhgG6PZ3PBmC3QqXJ4YKUc50kq71WuRpEjqFJqDHXIIwXjM4fcD62X3A8h/V
         lsrwOgpBMoKnA+ytTEQGP6wRrcBC8+3gbWCD5BGjoHJpeIdhWF581UGypyPE+2CYYb/i
         EecbCZDuUErQWfgKFXaJPtonHqmL7pNK10h2AC7R5v5b2bpFc3ldVm79hYoirA0k6f4r
         fIr9INx2D1+vjJfKbeX8quVfobAxa8hXL9eypzUUfJ9jybt/7bUkc1e+6JYqf1B/cwBB
         km2g==
X-Gm-Message-State: ABy/qLbGGFZA2J+3itFxTYDSHcsFvJwtKAjqGMhBVyfNSIOUWzxNn/8k
	9R3vwnAgV9qjcmUoDpHwIArdLu3TsGpcq7xYo+Y=
X-Google-Smtp-Source: APBJJlF6G5BzK77OdQQEjhV7PWkezKAvpuwq0cmg9QkERfEkzQA5kL48rU+H/bmJWjGP+RJI9MQIR1PdO5dMwSTx25A=
X-Received: by 2002:a19:9116:0:b0:4f8:6625:f2ca with SMTP id
 t22-20020a199116000000b004f86625f2camr3691325lfd.61.1690721191243; Sun, 30
 Jul 2023 05:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230714133400.3463291-1-jose.quaresma@foundries.io> <AS1PR10MB56975B56CC9A0C107CD110A3FD07A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB56975B56CC9A0C107CD110A3FD07A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 30 Jul 2023 14:46:20 +0200
Message-ID: <CANNYZj_Uw5K-960QrW8dQr-fZyy1T7On6qvBn_q0df6rbyScLQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH] go: update 1.20.5 -> 1.20.6
To: peter.marko@siemens.com
Cc: "quaresma.jose@gmail.com" <quaresma.jose@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"yocto@lists.yoctoproject.org" <yocto@lists.yoctoproject.org>, "alex@linutronix.de" <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jul 2023 12:46:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185069

On Sat, 29 Jul 2023 at 21:19, Peter Marko via lists.openembedded.org
<peter.marko=siemens.com@lists.openembedded.org> wrote:
> I could not find documentation how to handle mixins layer.
> Could you please pick this to kirkstone/go meta-lts-mixins?
> Or should I send a patch to yocto@lists.yoctoproject.org (or other mailing list) instead of asking for a cherry-pick?

Either is ok, but a patch is usually better because it can be quickly
applied and pushed. kirkstone/go is handled by Jose, not me.

Alex

