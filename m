Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3728BC636D4
	for <webhook@archiver.kernel.org>; Wed, 15 Feb 2023 13:32:08 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web10.14856.1676467924218465934
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 05:32:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=abVCL64M;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id f34so27573986lfv.10
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 05:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z04JAMhf0z7xqchJT4sQDJWidqcsro7Q0Bv+MJbU1mA=;
        b=abVCL64MX1c/9Z9joB2n0rYVonF1JCn4Exfy1zr8HXDBsJCv3Kr0TVZWFDTut/ZLVi
         yjsaY6BrB31Wn3KxdFa9Ly2V/+6qs6HfdNZ0uUbcca2jekV/ky0p4DoUuQuIfCtxXVXi
         pzIZa6NGHa+N5C1uWmgLH6UOEcmQFrDDWglzMU2dqGs39y1ADf12xvIh3xyqa5K0K981
         kqJXgpc/OHRdSvEU3v9w5lEBviePrHw1LT3F7+9mmgarNFuzuhH/bh/LRqRdZ7Q9dXz2
         ftJ9oQvKbsxCsJT2xpjva9JHlFP/3Ytf/cIJ3vev3fO/nwVIA+dhgQORukUlwz4D56QV
         wbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z04JAMhf0z7xqchJT4sQDJWidqcsro7Q0Bv+MJbU1mA=;
        b=7fH4EYDpkXu98pbEfBK1T/RGvO9sLkHBlObhhRF2YOw95jUCWo0lVMak3QkfLN3otJ
         vyXiJaefLh9X/yXjAFknRkCStdOu25/c4buOJ4Q7SS9coIGcMkC/ToYN4IqXA02cKwWI
         Q/CBAnNAcwRTbrtSZylcwsyyhzFq7RZp0kELSE0FAul6BWLt4B/qtnJWYZrV9JlnCRIx
         6bQt5jQEKJKXiZKVfpUfIMu+hjuJyK25UMN5wXQiymKGf1PZNdkLv4u/+Ts7BjxitUVw
         2QXq7XQ8NjHWmCIu3SmRLi2vEWqZfXyq+kBnM7/xOJI4HpROfNYhTxNy2o5xQqjkl0sy
         jsMg==
X-Gm-Message-State: AO0yUKWiAVUlmbliAEv7rw/RFJ5isauR8aOst/r3Z1dyUlA5Ot7/eA6x
	JnTwFqzvE5wEMJs911xIKbpWpsM3kKQayeJu/p4=
X-Google-Smtp-Source: AK7set9AxkmmOwvSzBonquomneg++y2Tl6zB0Lh3HEFWqACfatdiLg2Bj0dbya4reFvQOseO6l/IyLiBHCaMX+QFDfc=
X-Received: by 2002:ac2:5088:0:b0:4d5:ca32:6aed with SMTP id
 f8-20020ac25088000000b004d5ca326aedmr523816lfm.13.1676467922482; Wed, 15 Feb
 2023 05:32:02 -0800 (PST)
MIME-Version: 1.0
References: <20230215132454.4114658-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230215132454.4114658-1-dmitry.baryshkov@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 15 Feb 2023 14:31:50 +0100
Message-ID: <CANNYZj-MLR_2AmeWe_1s=AOdy2zX1iQSvpGva0Jt=RELkAxcxw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] mesa: provide support for packing development
 and testing tools
To: Dmitry Baryshkov <dbaryshkov@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Feb 2023 13:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177190

On Wed, 15 Feb 2023 at 14:25, Dmitry Baryshkov <dbaryshkov@gmail.com> wrote:
> +# dependencies for tools. libconfig is optional, it is a part of meta-oe so it needs special treatment
> +TOOLS_DEPS_FREEDRENO_LIBCONFIG = " ${@bb.utils.contains('BBFILE_COLLECTIONS', 'openembedded-layer', 'libconfig', '', d)} "

Oe-core cannot build things differently depending on whether other
layers are present.

On the other hand, it is fine to refer to dependencies from other
layers if the corresponding options are disabled by default. You
probably want to have the option for freedreno tools separate from the
option for freedreno driver.

Alex

