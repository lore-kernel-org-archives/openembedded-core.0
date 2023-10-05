Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2922BE7C4F8
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 08:47:36 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.11022.1696495651600362460
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 01:47:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lq+qa1Dn;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-50307acd445so939511e87.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 01:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696495649; x=1697100449; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jJa9I/VYI8wRydW78ovaQlJA8t7kygU85yt4jEr4Uws=;
        b=Lq+qa1DnE5GO9je3o2vHbz6cLzHTBFnIKsDuPOZL4k7MIRYvdPa24IYReCnbzd+vUl
         VYqYiDxZDsXuhIg675fA47Ti6N9Epg2wQE42tYOZ7vzB6Z50TlGojfyv6JjuHPLlRVi9
         v478AupJHu3+hzpViVWSL7qKirxlsPZcw+teTKIp68885CWjbwu+Gr81BwuwC+8oANAB
         Aq7P29uSw7LtEsI+expst6VhBm3W9voNn18JNfE1tnsI5qnE7CFwbWmFeou4va4c6Cej
         I+33uUyMYxtVi93n9/1i3ZdWVhWnBm6i/BPzAV3XaNgZR4v21YWRDsQF8PnF5DkIl3he
         Ojuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696495649; x=1697100449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJa9I/VYI8wRydW78ovaQlJA8t7kygU85yt4jEr4Uws=;
        b=cgAGWSTgIrASjIQg9jwNeajFET6LQxE39c891zcpy1T0B10BnS+G3YaKnVjh1SfnZC
         y9XfH3uyFcgN/7edzOKGIthinZucd35gcZGCi0vPwDoMNKLHLhe6dwuAmc4pXPuFE8wB
         r2g4vmDmwUjmbbZbm5iN7K7Kz23QQCqoeyp0iQzar5MrhcylBbtOTgrfPgx5gwIViOm7
         x3RRLqW7kZ4WlC+FRxTXtaUKjVrnc/jTVrwRrewzqMDNavLL0SLKvhUzOcmS1ipT42/G
         +1drimTvOSxFLJ37R36OKNTXAy2SQGvjrRnvYb1G+UVql6UU9o3R1u3FjA/pjNjJt7cG
         6UqA==
X-Gm-Message-State: AOJu0Yz000OikPs11WgAgs8Ib5MSxO7aEqIzsc3vqummyZ9uBSBPfzZk
	lAvhJtMxzaC9qf2GHd6+YA91zNSWmrnMie6oZ0I=
X-Google-Smtp-Source: AGHT+IGtIQyIjHbfu8a1A5xGKOFOf6bnldAetJy1gbpqCHxmVWOgymDMPmG5m8Vq1squP4gIIjotoy2f3u0ph0W8kRc=
X-Received: by 2002:a05:6512:ad1:b0:500:90d1:90a6 with SMTP id
 n17-20020a0565120ad100b0050090d190a6mr5698934lfu.63.1696495649329; Thu, 05
 Oct 2023 01:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <20231004125731.1785803-1-yoann.congal@smile.fr>
In-Reply-To: <20231004125731.1785803-1-yoann.congal@smile.fr>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 Oct 2023 10:47:28 +0200
Message-ID: <CANNYZj8ZHKMXWbiG_wRTPm3Za4bYJXhg+19F=PO4RD2BWX35aQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 0/4] insane: Add unimplemented-ptest checks
To: Yoann Congal <yoann.congal@smile.fr>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 08:47:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188706

On Wed, 4 Oct 2023 at 14:57, Yoann Congal <yoann.congal@smile.fr> wrote:
> Currently, this check find:
> * 309 unimplemented ptest in oe-core/meta-poky/meta-yocto-bsp
> * 827 unimplemented ptest in meta-openembedded

Does this mean there will be this many warnings in everyone's builds?
If so, this cannot be enabled by default; any new QA warning must
either not be triggered at all on the current revision (and is added
specifically to prevent regressions), or come with a realistic plan to
address the warnings. Implementing hundreds of ptests in a short time
frame is not realistic.

On the other hand, the output could go into some kind of report, I'm
just not sure which one.

Alex

