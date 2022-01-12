Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CF89C433EF
	for <webhook@archiver.kernel.org>; Wed, 12 Jan 2022 14:30:49 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web08.23731.1641997848523155712
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 06:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a/optBOL;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id m4so10618657edb.10
        for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jan 2022 06:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wLXW0b2+wHc0nGljow3c/qg9OlBnYLta+eoaMYyDoKM=;
        b=a/optBOLnSR27kC0U+UEajENW6MVLhgKNt0tHF2bIAJabEcvH5/iBKOsmaFYsmjWNr
         H4EOPLtEY4q/HSpVfdTAvr0hKRNiQb30T3Jcs0cDJ7q0k/e7FfohckMgW+y0shTehkdV
         rcT5xmWbmpM50arkCePu0ZlkEGb8H7lCDCWQGPhWI2o/9f4owI2sRZWpQJ1iziCzaXMs
         7QZUipznauJoTi0Wxug8shhHZIe1JVflnd7VMsJGAfuJEoNTGqonncKOSBHUr+evva+E
         nwA+kKFSfmJzOH+xDZcivQsihy+fMQpath/by9cbtuThkSKPd66AXMm/KHRgK5QMV0mi
         1JMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wLXW0b2+wHc0nGljow3c/qg9OlBnYLta+eoaMYyDoKM=;
        b=hYcvA2QZSUyBQalF6nerruERzHSoZqqa2JLOJUko1Vg4iRVMlp4NigUuIHx2E/jPRZ
         IaD6LPbqgbf59oPC3IkKXIpxVBKMmjnCZ3NOQxF46Mu5TjHHWiPCuJn2HoKe20gWqYMQ
         G3ISEWmXokQn9d4J+FSGmijsIs0QO5YVKYHKKRxzePElWAKMjNQb4QoTvr4GlCg4bLBX
         wWy403puG3VybkL2PB7tjiLiI82weLEhhqwQjluwLCbeW/Ou6ZJVBz6zxgduCqlY/3F5
         rh1pP3GVQ/RYuk7LQuC+aJr1dx3a2ceCSdS5MliSO3fLlNOeQgcW4q9AtWuuqnvqArbr
         1KOw==
X-Gm-Message-State: AOAM532iGPWfM+LQaJFJcJaDyEfUYbgZD+agbK9eegf4Ons0KZqw8Gv/
	Su33YUcyg2L7RVXeCRIZRcTR2zSmfjUmoimgW44=
X-Google-Smtp-Source: 
 ABdhPJyLbbMMWwM1jSR3RQ34DF41zARtvbjzIiL8/T2CJocCk5sREWZY9+HdrWvYSd0wBdN9+tmgEy8V1gSCKbTLrv8=
X-Received: by 2002:a05:6402:40cf:: with SMTP id
 z15mr9128686edb.185.1641997847038;
 Wed, 12 Jan 2022 06:30:47 -0800 (PST)
MIME-Version: 1.0
References: <20220111235840.81471-1-saul.wold@windriver.com>
In-Reply-To: <20220111235840.81471-1-saul.wold@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Jan 2022 09:30:35 -0500
Message-ID: 
 <CADkTA4MtcSDEA5mrBYEAZVFateY5w7fsAGLpZRN9wfEZc2euKQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/3] Extend create-spdx to build kernel spdx info
To: Saul Wold <saul.wold@windriver.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Joshua Watt <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jan 2022 14:30:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160483

On Tue, Jan 11, 2022 at 6:59 PM Saul Wold <saul.wold@windriver.com> wrote:
>
> This second change set, enables the kernel:do_strip() to share the
> oe.package:runstrip() method. A copy of the kernel is made for the
> kernel strip processing which is ultimately deployed, while the
> unstripped kernel image can be used by package.bbclass to generate
> the extended packagedata (debug info).  The extended packagedata is
> also used to genrate the SPDX data.
>
> This change also needs to strip out the "/usr/src/kernel" path since
> the kernel uses work-shared, which is added to the search path.
>
> I have tested this with edgerouter which uses the
> KERNEL_IMAGE_STRIP_EXTRA_SECTIONS variable
>
> If this looks good, I will send a non-RFC patch set tomorrow.
>

Minor comments from my side, the approach looks fine to me .. no major concerns!

Bruce

>
> Sau!
>
>
> Saul Wold (3):
>   create-spdx: Add kernel work-shared source
>   package: Add support for kernel stripping
>   kernel.bbclass: use common strip()
>
>  meta/classes/create-spdx.bbclass |  6 ++++-
>  meta/classes/kernel.bbclass      | 44 ++++++++++++++------------------
>  meta/classes/package.bbclass     | 21 +++++----------
>  meta/lib/oe/package.py           |  7 +++--
>  4 files changed, 36 insertions(+), 42 deletions(-)
>
> --
> 2.31.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

