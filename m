Return-Path: <ralph.siemsen@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6E9C433F5
	for <webhook@archiver.kernel.org>; Sat, 12 Mar 2022 23:51:16 +0000 (UTC)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web08.10508.1647129076103589516
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 15:51:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=aZcsNpgU;
 spf=pass (domain: linaro.org, ip: 209.85.217.48,
 mailfrom: ralph.siemsen@linaro.org)
Received: by mail-vs1-f48.google.com with SMTP id d64so13329624vsd.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Mar 2022 15:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2b07hNRM+wRhFguYCpTE2J8sYvPOmvTi8laouilNrjo=;
        b=aZcsNpgUgDoidqU3A5YX7GbSj661kpZJ+Quxxymq1UfFhdk0w434smsQHjETeEnm3I
         nPIemO5slfcg+Zbr4wmKBxdv8DnKE7ekmvD3PRZEbMEdPE2TvK4vfWx3V56nQ7I+zgpg
         676wLirLRtL9lp7t/VfTGsbGNkk1GLt0aBvannXcnd5wpKESar6nwIJK91Z6QYUKKzKc
         va+qviontgHAhT2rYhEA2z/u87JF0wXaY5/k+9QWheWOd+A2C/YkVVVe20cKIzl8PXuV
         ilnq1odz3pSFaute2hyq34y73z7DH4C0nP51i8fzKDgNPQ45HldOXj5q/7dVmm4ptQ6S
         Y51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2b07hNRM+wRhFguYCpTE2J8sYvPOmvTi8laouilNrjo=;
        b=FXyzq8VWiAqSQMbC7C7eaSpTd93jeT3ihd6OtDtTuxz5G49G0FSdpckRoqunKzj9tJ
         NvFkTcHjoN8Xi9xhD16Y9CJxqBc6JJyJgZpG+33pkbJNlSc7pH8odZgfOKLvK87BgtgM
         FcU5aR1RCFy9vfVP5FTsi8D9Ke1GCjbX3LckYYcXIIRNclCx1PCezXExGLLCwsU1Uin3
         0XueQFaggYj2y/mEpnQe3oQeiwJ6Xy6IoiPp5e0Fvfb3te37Yb5pTSjPWFnBKVgO2BoU
         75Yq2XiDW95RnHMyAZlyyQtiAYdd/VQoRu1przKc4H7TcIkw2tO3jjJCAvThX++gSlIt
         Hm7w==
X-Gm-Message-State: AOAM531S3kgr4QP1HDl7C8KntyR0KeAz09vJq1VAEYC/+jRUlY2x9RE4
	TOKzvt8PTHDlVOwsVRkkur7JAeuFeq+Si7jusWyqGg==
X-Google-Smtp-Source: 
 ABdhPJyY1Xd0M3cfk3ja0r1gp2hJgm9BCiFMtioKDM6lE6M9EXM+11yHIxnNz0apEYMpyPgaTlnxeA50xaRs4snSu4c=
X-Received: by 2002:a05:6102:e92:b0:322:a139:2b15 with SMTP id
 l18-20020a0561020e9200b00322a1392b15mr6995645vst.31.1647129075148; Sat, 12
 Mar 2022 15:51:15 -0800 (PST)
MIME-Version: 1.0
References: <20220311165855.3477645-1-ralph.siemsen@linaro.org>
 <20220311165855.3477645-3-ralph.siemsen@linaro.org>
 <16DB979A6291AEB5.27059@lists.openembedded.org>
 <aca7cb219caaaead1f29d3376cf0176a45b964c9.camel@linuxfoundation.org>
In-Reply-To: 
 <aca7cb219caaaead1f29d3376cf0176a45b964c9.camel@linuxfoundation.org>
From: Ralph Siemsen <ralph.siemsen@linaro.org>
Date: Sat, 12 Mar 2022 18:51:04 -0500
Message-ID: 
 <CANp-EDabBmKp_g+QHwR-8ZX0quA-g9_71Kj9+AeCWZBS3cVvBg@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/2] libxml2: update to 2.9.13
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, tony.tascioglu@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Mar 2022 23:51:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163101

Hi Richard,

On Sat, Mar 12, 2022 at 9:04 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Sat, 2022-03-12 at 09:19 +0000, Richard Purdie via lists.openembedded.org
> >
> > One of the patches is upstream, the other isn't. I can't see any patch adding
> > pkg-config support to libxml.m4?

Thank you for reviewing and noticing this error.

> I added a fix to the patch to resolve this one since it was just caused by
> typo/message fixes upstream.

And thanks for this as well! I had planned to work on a v2 tonight
after the little ones are asleep, but seems you beat me to it.

Ralph

