Return-Path: <festevam@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54006C5479D
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 19:13:42 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.33638.1673464417688940201
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 11:13:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=k07pF67w;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: festevam@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9so17781556pll.9
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 11:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4mgSCBTDjs6+e/zQV74eGi8DRaqQ/g0QwKiWoElnHLo=;
        b=k07pF67wPUzEAH16G+qXI/rSNXev4IHQic+h/uX684lMXFU4cbZOodOcn9BPLoe8vQ
         R7Ca8hRBWPzy2s5JbaDZE6n3TeCz9RN/9a+CSADtSrQBhMKeYv7GIrhZdFgW0Cl2QMWA
         R/qgaw3nfLZ4jhcKh07K6INIgM+eQNl/8E+/hK63/Dr2CqbHDv04qF8PZDdM/uR/qESk
         4pI1w/9Efrlqws123RNoe2zkQAezw0RhvkItPZ5JLXPv4/vr8fcfxft+aJiqGrjyhu0h
         KWEvX0uKAxRRsgr6NE6TDLKbsossJkhwu/SuE7PMzCi6kN3W/aRTsvUBdvMF/X05wOgc
         hv2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mgSCBTDjs6+e/zQV74eGi8DRaqQ/g0QwKiWoElnHLo=;
        b=WZjMxab9vUtCYvZ5Oso9n4hZr+5v/lgAj6iGfvs6IWRYn/aBtp+aYtLK8NnIbwVkSB
         T0mtCRHEuE0ngt6QW3aqP5Dnj76GAOJAtgXRbrSCT20fbN7d4SZHVAEuSGxzLWf8r1Mz
         IEHaXr2yF/L+njEiu/VAeWL4kAdnAaIo/+42YVs3g4LGbrsulhVC3l4DHsxxUEEl21qA
         EpkcjimE/rafEmuuJfPOExt07NoSI18li5ZtkJBjBQHS+r77DvpKJDeQ3C2ELy6N8sK/
         XSGMKKEV9wlAEJzy/nrj7m700brQFh+7M7rB/38LAfu39NUGb/lob/22IM3/VDuxqnJW
         LTbA==
X-Gm-Message-State: AFqh2kqAmSaKbafHsAlmomGUW9i6tKyMl1XR+mHhu/R2zGxdM19wQvP9
	HN7wTvZRrSwSt4AedytjOhJslO3GrmrHRh/wIiE=
X-Google-Smtp-Source: AMrXdXsBSER3HqlmfTGQP4XX4zd/lgghHfPjAhIpZXydtbizB64igq1aEpENKDB9T6xiHXTnkSDfrTNZLO1aIsgXYqw=
X-Received: by 2002:a17:90a:b016:b0:228:cb89:67d5 with SMTP id
 x22-20020a17090ab01600b00228cb8967d5mr592409pjq.172.1673464416974; Wed, 11
 Jan 2023 11:13:36 -0800 (PST)
MIME-Version: 1.0
References: <1739556B485EAAF9.23170@lists.openembedded.org>
In-Reply-To: <1739556B485EAAF9.23170@lists.openembedded.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 11 Jan 2023 16:13:25 -0300
Message-ID: <CAOMZO5DUXonPg7U247M1KcegVkZbQ6AWen27NV27fhyqMmwkoA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] u-boot: Upgrade to 2023.01
To: festevam@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 19:13:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175771

On Wed, Jan 11, 2023 at 3:44 PM Fabio Estevam via
lists.openembedded.org <festevam=gmail.com@lists.openembedded.org>
wrote:
>
> Upgrade to U-Boot 2023.01.
>
> Remove the two patches that are now upstream:
>
> e67f34f778ba ("riscv: support building double-float modules")
> 1dde977518f1 ("riscv: Fix build against binutils 2.38")
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
> Changes since v1:
> - Rename u-boot-tools_2022.10.bb to u-boot-tools_2023.01.bb

Please do not apply it yet. I have just noticed a build failure on u-boot-tools.

