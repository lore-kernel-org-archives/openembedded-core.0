Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95EF4ECAAD3
	for <webhook@archiver.kernel.org>; Wed, 31 Aug 2022 16:31:07 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web12.1034.1661963465046596309
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:31:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pqHx3IkV;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id bq23so20720555lfb.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Aug 2022 09:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=LDqKBiR6jEUpJafcrQMRblTedJkgHRc2slOFQWF4sTM=;
        b=pqHx3IkVOz3LLC9tl/puvUpuip9aqIfCodlWGVjgQ+MREL6Rl04c+KDet7QT5X3Eop
         bjwuvK1YQdQgFB/gG3j5q9U4JLqs28KwhkSxdHXMFrz+FuK9YBcOd7rZcW5oFR7Pjt8B
         i+BBzGZ1FXizo58gQfcFw4yD7SKtSsKD+vwAZFzFuBn327SRUNZsRUeKb6v2IrcbXMPU
         03StwLG7N31fUuyi2xnDkF44Z+QIFMAu7261HeHGIKoL/EcDaizAw35dFkJWy9wnY5IC
         MoGSEz+scf2yK0jb3lmSMQ0Nsk/70aUrJ476gL4U5+5z3ANg8Qoh+ikVBeE8eawowjN9
         aNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=LDqKBiR6jEUpJafcrQMRblTedJkgHRc2slOFQWF4sTM=;
        b=uWn2KqsyOsA6J9esdJ4uhlnlVlmHXgspFz55IMM/28sQNmUsrI2sP+K8PmV/TBAKka
         ysV5Eszo/9V4c6A8Sm7f2Mvz3q3DvGvTWEUkS9twiFQY7UCk6uajP1Bkis7/iLG1zseG
         P8Q2TycC1pnK4kh+TFPcwkj4Tg+nHkR3FWkWxR7ywmBee/ecZubvK5TnNg7Jg36GewUB
         sEVCasoyaNTNhT+g6xlQwSNuu5JZKBsOiD2r9qL3YU+ED4I+u0RD7OdBBORB6K+C77aW
         2yFPWTVbZoR4295TTE+dQeGcDDCew+exeQf60u58ci2PdCWnJrFPYPXodEMD0OgRTfT9
         vnwg==
X-Gm-Message-State: ACgBeo1Aq0DCaBOlqnafb6I6ujAmyoK3HgDzSglNlqqOxppTPrPG3cPW
	rF3gSRfNsgAmQP+/ARNn/uHUGClI3hNmyyEYTes=
X-Google-Smtp-Source: 
 AA6agR5Y2sJU1ovK36CJb90dUSlTfSY7OYvVCQ2771aiof80CpvFus+2TP3rFT2ByQXKdG7sfecXDR7dAFIcXCUcvog=
X-Received: by 2002:a05:6512:2511:b0:493:50c:ec3 with SMTP id
 be17-20020a056512251100b00493050c0ec3mr9230809lfb.665.1661963463262; Wed, 31
 Aug 2022 09:31:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220831160712.189938-1-richard.purdie@linuxfoundation.org>
 <CANNYZj8T_Cntva5-+YXX7Dzhf2YJNOyPkbbEYWWZAmHUm4g3xA@mail.gmail.com>
 <bf42031e0112176dc1efea54df994161f2e554b3.camel@linuxfoundation.org>
In-Reply-To: 
 <bf42031e0112176dc1efea54df994161f2e554b3.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 31 Aug 2022 18:30:51 +0200
Message-ID: 
 <CANNYZj8tRkG3783-+t-Xo1B5MkjkwmLVw4kr_i=-cCoE-bPq8g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] vim: Upgrade 9.0.0242 -> 9.0.0341
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Aug 2022 16:31:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170138

On Wed, 31 Aug 2022 at 18:21, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> > I have to wonder, what is really going on there? :-) This never ending
> > stream of CVEs makes vim formally the most insecure item in core. Does
> > anyone know?
>
> Personally I suspect some kind of bug bounty system may be influencing
> things. I have wondered about removing vim from core.

As someone who writes all his code with nano, can I vote for that please? :-)

Alex

