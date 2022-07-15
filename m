Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BF0C43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 20:51:07 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web09.1965.1657918258826095943
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 13:50:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IJPqDvsq;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 19so6961933ljz.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Jul 2022 13:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TS2oMc4zfb0cL198E43RKVzK6bubUP5uMpXwZg3eDYQ=;
        b=IJPqDvsqHNrrLkN/20J9PjH3XOQnyGLjX37nzmuHqu75aMdE2x9n+dPIgxnRkVi/Zl
         RZrmml+wcFmpJIWyoQ6urJrGZXlFF+PUGTJLbQ5g6nORaHdIL6n4BoOMt1C9H9y5VLPP
         yR1x3lYwhk4so7DPY1k0absrgu9EyfYE8sP5BDnAzI8E3LpxH6VuNPK+JCPO7zuYYei3
         mO+/l2zbV32wvRIMi5FGryscDKp8uPb6Tby7XvBooZZcG/dZCyfehhDVqdIKKIxltueQ
         IDqxsOjFC6PTdl2x4rHnRSBAR4GKq5eQZ/wS+1ejf9fdcrkSNNj9PXM7nR9tg0L0+jOm
         RMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TS2oMc4zfb0cL198E43RKVzK6bubUP5uMpXwZg3eDYQ=;
        b=5RyxhhKlYVNeQH8gdp1RPqV8b34HOXjjB81inCxrs8FYef17jYBzy4VUY48DqZZOA+
         NmFQQ3AJ04LjKUyJjXSWL4G3V7gDkP6fmDOL8l8WIY5Gifa7Sy9/3Tpy5Xvt6huLUKP9
         84925Nu+/Li9/n4KqpEbV5QcAoLu7gVoOio8T2swzncQoMk/qnHWlP2I6SVSyeO1t2d3
         XItIAuKGEeb6jrVl47m1f7ElN/w3ehTHjmzAsgiS6ZMV7RtOth6VEfgmyNwRP7Qd4FjW
         /KcNWvlPGq1PzafuxEBaId3UyION6MysQRTpr5L60JA19mhJzSnP4ZohQBNAmgFiFy80
         zhIg==
X-Gm-Message-State: AJIora+VMdvkj7PHywt7lguz82hneOVti16Y/q8Iy7C35JOnCAgGhlTa
	FBZ09ZJhI4Kx93KOlad1mQ7Rr6DdSzKt9mJ0gSQ=
X-Google-Smtp-Source: 
 AGRyM1suTdE7pXHxXqbsHCcKwpZWjIFfEQVgYs41nIzoYTJnGeaL49FIbvkkWr5P3ft8RwcuDx5VSBdVw5pCeS2tyT8=
X-Received: by 2002:a2e:b98c:0:b0:25d:4aae:d042 with SMTP id
 p12-20020a2eb98c000000b0025d4aaed042mr8023770ljp.191.1657918256735; Fri, 15
 Jul 2022 13:50:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220715155859.665686-1-richard.purdie@linuxfoundation.org>
 <CANNYZj8FT-H9-0qB+9VrAiiKjEQ=jj3aG0GB1MFJU67umQpqpg@mail.gmail.com>
 <17b18a74f7af9e01bd16c029063f41ce56029466.camel@linuxfoundation.org>
In-Reply-To: 
 <17b18a74f7af9e01bd16c029063f41ce56029466.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 15 Jul 2022 22:50:45 +0200
Message-ID: 
 <CANNYZj9aHsb54Xv2ybOiKwmajHi2wmmGY+kn3JAtkeObbmtaKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] selftest/runtime_test/virgl: Disable for all
 almalinux
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Michael Halstead <mhalstead@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Jul 2022 20:51:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168138

On Fri, 15 Jul 2022 at 22:42, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Michael basically said that we were unlikely ever to get vgem working
> with Alma. It was almalinux-9 that I was adding but I think we wait and
> evaluate the situation with 10 and then someone can send a patch if we
> can add it.

Michael, can you share the findings please? Is 10 and beyond unlikely
to fix this for some reason?
(from what I remember the problem is lack of vgem module in any of the
rhel/alma distro packages, which strangely is not a problem with
fedora)

Alex

