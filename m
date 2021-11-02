Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A147C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 05:12:09 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com
 [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web08.5329.1635829928241822365
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 22:12:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cQBkHKqI;
 spf=pass (domain: gmail.com, ip: 209.85.222.48,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id i6so21559166uae.6
        for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 22:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f3L98/hU9UQ7bhtNHlmCmGM2j0gLnSgz97O8D/x0iao=;
        b=cQBkHKqIcbKtDRGvtVjaFuHBx+X7ex52q1ot2OiRWVXtuRZzQq2P4zCz9MEeVLJKzW
         zETX/pNrVLlTpctrtkQGv5CKSNKq7m2uowklQjDVk2rewCL4Qp+TLd38wzK2KpevM7cT
         ZTElTgdocw63RJMQ3fEVt66sNZoudHb6q5QPrh/iQ8p92DjhflPH+7cT970O7G8JoDqU
         2lB2eY7utirkJsL6lVRi35tkiB71UY6L8FaKKAokU0aGla3vzAo+ub5qNXeXsYhQM73K
         yyIKs869w3ggRrkRvdF2eDnTie3PbMtody529QzbKroZIzgPlrpf3L7I3Yap2Vx4AB6/
         87Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f3L98/hU9UQ7bhtNHlmCmGM2j0gLnSgz97O8D/x0iao=;
        b=3JMLhHwrUxUqvZRKRTKA74JeffyXcBwrq8HObuarWmphMJW8v6dI14AjjBwJPPyRxz
         w6rpsm7zM/hCZqrMFBBixgioiZMpVpW9rDmQyZkkoG4dD7RhwB4sKVil2yFllkZi+pTF
         ZLoqbwq9h5uAhD8e0+MBhLtsO5/AGY7gnMexJw58tEq4YZCRpzkS0gyz8VU0H10eieQf
         +2znRSp68x+2cShv+2V33JsMm2Im2A/8V9LJ9faQtq3+rTByjVnEaD26AbWv89EjdoKt
         64Pww/VzGynsVnKS4nIFkMf/IYQ9SYXFK4CrOKKmd3DL5QMgJGwamTJkrJ/ABDmucB+M
         MhJw==
X-Gm-Message-State: AOAM532SOkR1smkXU78ImEVX5+wLf4oUp0fXYV8zSNZyn8/dAIcA8LyQ
	kAXE5OUvi08PevkjPfhbhMuJ6kfyBMvonYS78MA=
X-Google-Smtp-Source: 
 ABdhPJy7b/F9xPPJfnI29dCmvGYmi9yuEEbL52mpPI6UU+7G5s0C6sXxdtLZUN+FFXhWxqQBAuXQ30D5XYw4vaokQ2s=
X-Received: by 2002:a05:6102:b01:: with SMTP id
 b1mr20547728vst.58.1635829926277;
 Mon, 01 Nov 2021 22:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <YVTwuSLx+HyyIDkV@piout.net>
 <16A988E1BC842A91.3292@lists.openembedded.org>
 <CALY49845oK2-9FQz0Qo5GM0eZ35FePWhuB_Baa=_tK8TC99a=A@mail.gmail.com>
 <YW/IZh8+WQlBWSlw@piout.net>
In-Reply-To: <YW/IZh8+WQlBWSlw@piout.net>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Tue, 2 Nov 2021 10:42:00 +0530
Message-ID: 
 <CALY4985qUwZYSswozfRVZ2Xc2L82-Shn7UxX09wbmXzuPeKSTQ@mail.gmail.com>
Subject: Re: [PATCH v3] Re: [OE-core] [PATCH v2 2/3] Rust cross testing file
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <rwmacleod@gmail.com>,
	alex.kanavin@gmail.com, umesh.kalappa0@gmail.com,
	Vinay Kumar <vinay.m.engg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 05:12:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157736

Hi Alexandre,

>> There are still issues with that series and I replied the following a
>> https://lists.openembedded.org/g/openembedded-core/message/156655

I had a detailed investigation on the cryptic errors which was
mentioned in the build.
Those are the tests that are supposed to FAIL in the rust testsuite.
The current patch provides the framework to run the rust testsuite
from rust sources.
It does not modify the test case or results and hence is unable to
deal with failures
from rust source.

Hence, we see the final message as "command failed" at the end of testsuite run
due to some test case failures from rust source.
Can you please let me know how to deal with this?
Is there a way we can provide these failures as expected or ignore them?

Thanks,
Pgowda

