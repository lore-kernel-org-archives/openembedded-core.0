Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9091C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 09:05:10 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.128726.1671095106284263935
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 01:05:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ITODOCxZ;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id f16so9255740ljc.8
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 01:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7nf+vgcKEXxkUF77brJWeMPx+xeCsCIt3HfM/s8jUD0=;
        b=ITODOCxZK8FICI7zhNwCWA0AAP2aSXHFj3RZYIdj9ZvmGin/qr4Mqt4lgflmvG0p9N
         xJvB8aPB32K1lJUt3LSak/fW1lqMMfveJAwNP1tgZ+UbhIFijNmvZUz4C/FNpYvNxU0Q
         Fr1gGoUZiGHAe3CuWZyYA5iiy1yg7TCO/FGOB2HvxrnsFzw7hK+2WdNojr5SR8PrSQKv
         cN9l3byhMGTIh+2XpG46X4JbkAGUyuXFZpSgWdfAeD9V0PacU3ExbojKZ//YWqZ00QVJ
         r3+5+2q7A+BCyuF3NttekY7mTQyoMjX0lvLoPzwXxPGYzv1VHiZwM6xCsQ2KO4ZvyyuZ
         JT+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7nf+vgcKEXxkUF77brJWeMPx+xeCsCIt3HfM/s8jUD0=;
        b=jsgDjee4KIsSiBhRRDHSoXaOwmkewtrJtXw7HGJDC9E1sKipsrAadlML6oQlfR5VcD
         lx42oupPKTwTERljHbZvcwR/6d1CY/056awILGywk0P0BKYmUGgr6oTP6GBaElxVsqoN
         9FxyZtyQOA8xovInUWkeaDCINYHtRbfPvVX2gT/DTyprwKezuLw5lPdQm7hSd/DyEj4s
         3hKjbX2WxwAVtiIRvFHrvtOA6h8tS9QmVxI+O36IBxsOulds1L5i/SBs4NUGs9Ku7872
         envMQBBv2Lly50UxDm+SkzLMNdeQiOJUaMB1Zp6WpVmRa8b/gkMclZjUao9CuIxYgQ7T
         ovgg==
X-Gm-Message-State: ANoB5plMvhz13FgHyqiUarbyMZvU/vf7BW7EEx+3bGWZ4Kzw22VFzcBW
	6SNtp1zPYRFx+KzG51sqr4lQKpJOeniSa1JApR8=
X-Google-Smtp-Source: AA0mqf4uDwX+XmUAwdgr/mmUy1bWBpXzy/BqnajUyYSNgzsU44eSZ9ruRXQq0UNMaMLypxT1UoN+XW8ZGCzU+1sWCzg=
X-Received: by 2002:a2e:be8a:0:b0:26f:c081:9aed with SMTP id
 a10-20020a2ebe8a000000b0026fc0819aedmr30764869ljr.222.1671095104438; Thu, 15
 Dec 2022 01:05:04 -0800 (PST)
MIME-Version: 1.0
References: <20221215073224.3061128-1-alejandro@enedino.org>
In-Reply-To: <20221215073224.3061128-1-alejandro@enedino.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Dec 2022 10:04:53 +0100
Message-ID: <CANNYZj9qbT+fGQ=18hjLkzR4D=eyr1amX2qxpwM5u_XQTqLo3g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] rust: Enable building rust from stable,
 beta and nightly channels
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 09:05:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174575

On Thu, 15 Dec 2022 at 08:32, Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
> +RUST_VERSION = "1.65.0"
> +SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;name=rust"

Adding a manually set variable adds friction to updates. Can
RUST_VERSION be set instead with a helper @function from PV?

Alex

