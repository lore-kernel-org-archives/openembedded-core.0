Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D77C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 17:14:34 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.13516.1646327673794443661
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:14:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=a0RDHxRi;
 spf=pass (domain: burtonini.com, ip: 209.85.128.54,
 mailfrom: ross@burtonini.com)
Received: by mail-wm1-f54.google.com with SMTP id c192so3550645wma.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Mar 2022 09:14:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5w1/Kz6ruEpvUr8ngWfNJSo1Yl4bx0x6zu8HuUx8PaE=;
        b=a0RDHxRi3Me/Ahe9RBAx6VB1r4QMVifWbDpn6AOUMkn3OZalpOpmY46j0iESNVGZq4
         zpzQCtlW/V8Pf6RGWwxFrEEs7Uf2P8lnjQKKQLNRdDkpbQnmuJHmfB0U5nz2JImyAoZK
         aBewzy0Fn1Wtyf3pU9cwzHGVzdrU8X3hmQFw+wvZwbqdeSOAPBNdaqnHUnVGd/i/Th7t
         RnSN2EsfF/y7tSXVkpWSfo1SA9sYyOFEIATJPRRKyGrMmirDk8QWm1IyBiJ3KzJEn0ML
         f5ue37LPTBcH0ONs8p80ViYc68ortHDSSAy5Ug3tDOgVx7mRYiylQo70o8r0MKn0Jjde
         y6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5w1/Kz6ruEpvUr8ngWfNJSo1Yl4bx0x6zu8HuUx8PaE=;
        b=5YeAjCmOw5TlxH51fi4Gln5CErlUIiTYAD46jCSeZxsE2ZIdww4VhE0ibRI3CsLhU4
         uOB3ICTTL1+07hwz3xdkJMfnR85wTzqnFjwTQfWlC2oJdcypkg+abPhvhSqdzndK/+MB
         MSJ7hQMW7NzNdj7gec0vq2Nqv0xz2K8g2Sc8Z5IUc+41BcTR/wS2k/Yri2rZ5GVPbA/K
         JHHO4j4fho8xCjGXxa4s/ByVKzmtXMeW4YPX7EIlkGULnpZVCsyJrsAZ1+1gNZ1OMljf
         K09PJWOjbIKzfZn9oGEpJLBnG+/n3Nz/yPyz/GGwEXntKW4hXz1MAKqcyuM4ula67LBo
         OyBQ==
X-Gm-Message-State: AOAM532qHkPXeGZRr31iQDxvlgcwxc2nTLxwcnU344zzsL8cfoMqOCla
	DGOyNPCx229QyWxdHaB4icXjTr1PnOwRnEgGDub/Gg==
X-Google-Smtp-Source: 
 ABdhPJzE0rGVr1bID02YfiXF2QXCDNCdLzAkjd1HahmoMFPPOprN5SP+XlvYGG1OS75gnb8//i3cZ+9w+y7m2S4UAxg=
X-Received: by 2002:a7b:c5d5:0:b0:37b:fda9:a5e2 with SMTP id
 n21-20020a7bc5d5000000b0037bfda9a5e2mr4614585wmk.62.1646327672072; Thu, 03
 Mar 2022 09:14:32 -0800 (PST)
MIME-Version: 1.0
References: <20220303163451.336518-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220303163451.336518-1-richard.purdie@linuxfoundation.org>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 3 Mar 2022 17:14:20 +0000
Message-ID: 
 <CAAnfSTu78H+UG34pykED6G8M939LLmupEghxaUaz8_mToAwwFg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] python3-native: Remove all pyc files
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 17:14:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162668

On Thu, 3 Mar 2022 at 16:34, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This removes a further 1600 files from sstate handling and lets python
> create the ones it wants at runtime which is likely much better overall
> for performance.

Playing devil's advocate: doesn't having them in sstate mean they're
generated once and hardlinked, instead of needing to be generated for
every recipe which runs pythonnative?

Whilst I can't disagree that 1600 files being dropped from sstate is
good, we're just punting the recompile step to every recipe when it
runs python code.

I guess the question here is how long does the Python library take to recompile.

Ross

