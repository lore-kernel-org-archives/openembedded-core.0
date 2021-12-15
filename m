Return-Path: <pgowda.cve@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B593C433EF
	for <webhook@archiver.kernel.org>; Wed, 15 Dec 2021 04:00:06 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com
 [209.85.221.182])
 by mx.groups.io with SMTP id smtpd.web09.36214.1639540805072528659
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 20:00:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fRYiljhk;
 spf=pass (domain: gmail.com, ip: 209.85.221.182,
 mailfrom: pgowda.cve@gmail.com)
Received: by mail-vk1-f182.google.com with SMTP id m19so13803162vko.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Dec 2021 20:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eUM5WbqT9RXedgDbG2wHCeHy9h0BKDOcyTt+/HF8arc=;
        b=fRYiljhknDy9bW7qgWVXhdI7a4LnpelQO+VVa1ARazHZungZqk1GbVyBnbe+BGCeI1
         b6vubj4KYnLSs7kODsUBUc9EufUo+9vSqCR+GqhVq+zxltmKIqYhjBIiWDvsA/mF33Se
         xW17s/bLcx71hFP+sIMTIYBv8QaqoL5/28uv2vSKAkbits+tsyCqqhzQbRNMUxb/Imoh
         ekPKibr26YwHbrjGc/vfamdXDYA/xBodGKofc5szgVy6nsIxnend+o1iFjX4Dotj4+kR
         Wnsq2bZ9mQI1zRqxv+w1Y/E5Nj/gO0s/AjhDJKMg1dainKcS/8tXUQmmacdjfcOojxNo
         QMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eUM5WbqT9RXedgDbG2wHCeHy9h0BKDOcyTt+/HF8arc=;
        b=p5f/9YftItmKTv28Ybwp5rgjXz6WDhWUPw/gQUnoES1WnvxCQqFOcxW1k9h89562eP
         G7VoNPgl5jkcdGLJh2irP9lNkQ2MZW2atUt4cl3PDvPG3BMAVsRNQl6HqAgK/qA3O7Ns
         0xqR6x1V0uvFWB0/eLbZ/gKSDOjzrKgFrX5sX6UnC842vXqrQFu7HKK/dFy6L+7sKKSd
         85eJWUJabduiPZUmUhJoUVKd8hZprXbiWljhCmm9v+O3XFXtOgOlK8nV8/94JwCRq9Ul
         H3HrTwSKi48e9uFrn3hAF5HOYVhjQ7FmFVVy8tWLbPoZMjrGMY4cUSrkVzAPAMA59rHq
         UYrw==
X-Gm-Message-State: AOAM530sBStzezr8RmeUKI/I5/4qfHdutizRgfI3Fjc0v5TI6XIs6tSi
	n5mK+bY1D7e/GNfpVYEmS7+XxSO4wfmRV6DFn0w=
X-Google-Smtp-Source: 
 ABdhPJxegse+rj9x42w+AoMcfc8JFoK/hd2fdBRfXoqB4HtQDucJgNsmAT0ce0oNBQw7lBYaTDzGMVP/eHe905lona4=
X-Received: by 2002:a1f:9803:: with SMTP id a3mr2471849vke.6.1639540804266;
 Tue, 14 Dec 2021 20:00:04 -0800 (PST)
MIME-Version: 1.0
References: <20211214104613.19264-1-pgowda.cve@gmail.com>
 <e76b64a8-5651-378d-2e50-68dde5add6c1@windriver.com>
 <CAMKF1spjF4dus=QLGLbZSPFfv5knJ5_NDFgXZM7fyVtA2EOQMQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spjF4dus=QLGLbZSPFfv5knJ5_NDFgXZM7fyVtA2EOQMQ@mail.gmail.com>
From: pgowda cve <pgowda.cve@gmail.com>
Date: Wed, 15 Dec 2021 09:29:55 +0530
Message-ID: 
 <CALY4987tmbdSiDQtMyOKZ8cmMRZGwGWumNbv-KPdZ2niZhViXQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: Fix CVE-2021-42574
To: Khem Raj <raj.khem@gmail.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	"Mittal, Anuj" <anuj.mittal@intel.com>,
 "steve@sakoman.com" <steve@sakoman.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
 Randy MacLeod <rwmacleod@gmail.com>,
	umesh kalappa0 <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Dec 2021 04:00:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159711

Hi,

> this is adding a new warning to help mitigate the problem, this is not
> a gcc CVE per se.
> so perhaps backporting to older branches makes sense, this looks ok

The patch "0001-CVE-2021-42574.patch" is a dependency patch required
for these 3 CVE patches.
It adds 2 MACRO definitions that are present in the CVE patches.
We can just implement those macros and drop the complete patch which
is quite large.
Please let me know if we keep the patches as is or just implement the
macros to make patch smaller?

Thanks,
pgowda

