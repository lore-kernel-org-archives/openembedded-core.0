Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8124AC35274
	for <webhook@archiver.kernel.org>; Thu,  7 Apr 2022 20:36:08 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web09.3205.1649360724774574161
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:45:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gRJXXoEs;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id h14so6311536lfl.2
        for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Apr 2022 12:45:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JA23ZF8msBtoPxO+O4g7CKF/W8XWrjVwqe+Fz3bm7bM=;
        b=gRJXXoEsYSAm/3GZDVx96++7GsL75gWrG9h42jqoEvWQdbzRDA8LQUdGu04CfloXbK
         AURKXP4gNPU9V3qUvhUU/g+cv+mzkvt4fUcctvrirvlqGjEuGcrOe/1a8alCgRJKgn2i
         UlHE2E741855Q2PnnHoOEG5Wd8k0YWbG2A94+Uxj6pr/OhK7kMgMqUt01v6vI1/QC+gv
         G4zDtGjO9rJQHoDWpwekyi/7O8lejDRw0Hci5qN0qomldnXU+8r8LTgL/UkCcqjfIw3U
         x28pGLU/N9Xu7qMsbVC3/ZFwcfTWjFQ1tyXLoxZjgvIe1mJ+Iw8b0X5zqxNeVc3RaiVM
         qcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JA23ZF8msBtoPxO+O4g7CKF/W8XWrjVwqe+Fz3bm7bM=;
        b=KocotxPT1WqXCdvRwprkfBV/RY6RAvUpk+klZ2n3qBp65LfYed0Ahqy7o0KtyutJop
         jCNTvvcQJNqL7Lu73E0SyBQjZAqBkRqqi3QUwJJawL38sAjft/P2I5b6lGoXUeNPNxLu
         tJPR905XMyZVCCs4YTHhOCs3pnwh3vCao51i4oCKKmfn9hDiBMoq3/PuZekUFhKIF/6w
         1LwgKnf5ptmithgFZUw5WppObZtMnQAO9rqysH9/x2kgNai6i4BeLJ5VQKFpEwEmixcT
         q9RX96LMq3++61CJwx2KW2SmJzXRa8+Nt9bVrw1uSOe8n8VIgPRVtTnYLNoAjU/VmWef
         E26w==
X-Gm-Message-State: AOAM5328/StAaVK4AwkxnNdmdK5OlH0VpKFj4crb25RijD9tA8k/U6w9
	S3/58NvvmV0cdW+r3o7mLo85ovhWJhpfO+1rWLM=
X-Google-Smtp-Source: 
 ABdhPJwp5gDAU1gE+VzcFZ3JJ5cU7UTmf8WZOToKM5sfWogDbZyy8gKOz+6qaS9zAUdgcigTspexm9jxllwSudb7hU4=
X-Received: by 2002:a19:ca14:0:b0:44a:23ab:90a5 with SMTP id
 a20-20020a19ca14000000b0044a23ab90a5mr10335211lfg.673.1649360722735; Thu, 07
 Apr 2022 12:45:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220407170029.3500874-1-alex@linutronix.de>
 <20220407170029.3500874-17-alex@linutronix.de>
 <CAMKF1sqJLvgJh__jq2biOrkm_M6zw4ibkxP7u1s1rZPEbyLa3Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqJLvgJh__jq2biOrkm_M6zw4ibkxP7u1s1rZPEbyLa3Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 7 Apr 2022 21:45:11 +0200
Message-ID: 
 <CANNYZj_eX18s-D9=_ZhOtdhOJg4PhJHgzd9Pa6Y9MscHEn5X5g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 17/17] python3-typing-extensions: upgrade
 3.10.0.0 -> 4.1.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 07 Apr 2022 20:36:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164136

On Thu, 7 Apr 2022 at 21:43, Khem Raj <raj.khem@gmail.com> wrote:
> > -inherit pypi setuptools3
> > +inherit pypi python_flit_core
>
> has this module made a move to use flit instead of setuptools ? if so,
> perhaps adding that info in commit might be good.

It has, yes. I thought such a change is self-documenting.

Alex

