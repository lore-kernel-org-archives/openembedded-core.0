Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30390C433EF
	for <webhook@archiver.kernel.org>; Fri, 11 Mar 2022 17:01:42 +0000 (UTC)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com
 [209.85.222.50])
 by mx.groups.io with SMTP id smtpd.web10.7780.1647018100628411202
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fJ3CSMer;
 spf=pass (domain: gmail.com, ip: 209.85.222.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f50.google.com with SMTP id k5so3912705uao.2
        for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Mar 2022 09:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9r6KxwDVkREpaznjBnYaiHiS3FOYVWQI7dFsx8QkZVU=;
        b=fJ3CSMerAC8FznSL0XV+qalddSYeJw96ZhnW8rkmkVP3f/qtWfOljutYODTBauBezf
         XH9YOPka8A4NESPBnHZdCbzd6yJ9231Sugyv7BX4RecwGi6D/cGW/9YckY7nljQYWzL0
         goo1rSwDCVRfbDx/DAkAWYPVO0xNU5JqMhrdmJuollS7MncFCvEE1ZGsjRe1+UskC3KR
         oVk4XtFYVIqpzm/HJO4PtCeIXP3qP9UyaX38ls0Eu41ZN3xWSPJVw2ileGArGkqH0rxp
         nnPFiW280BBk/uPo+IbAY8eB+HCAzQg8mm03E6dbrnBSHGYll+N5UOk0eoho4D8ooqgd
         a0dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9r6KxwDVkREpaznjBnYaiHiS3FOYVWQI7dFsx8QkZVU=;
        b=RF2b3f2JHSIjLLAJgnR7vzIXbHO8ZuM/GPpi6dA0cgQgQSp4h8hwtt1MWNpJMvue4c
         6rua06v0U5cmOeV+PdwZ+GJxgSL4zzVFuL8A8VFvR+uTPNkhYyMRi2PhutWlcsJIPvoO
         5KIWjwXPZ+BJTmW7WkQiSOXtj5nBcYOpExXI1zNjFya6Hv2te8O+SiVQzpf5foZmsYdM
         aAM5i3ZkJeC7I1yRBWjr82e9Vxa0FasrK0BPpE+sPft2/H5cLXiPMbvOiQvfgIReTmaq
         IBVaN3O53CQUW7hW8dhPxAJRyL2Fjq9eL0QCheH4LOvq5bVphlFIxHk20Ru0DVDwQR6F
         McrA==
X-Gm-Message-State: AOAM530e65Bow3Lh6wDG+n1iV+MRKFxOkXfgpcWq8QTxhu/zJqLi77c8
	XJwD+SQPt2u3+VkPjHkE26CJ3hQkcoY9sB2cwcA=
X-Google-Smtp-Source: 
 ABdhPJwT3isQgppbiVmxTRNJSnBmybHn1mgRxwHZXMNtemDF9y/vtjhykwCBR3TA+nTPyABqD8VtS7tLv4DHXX0tZWg=
X-Received: by 2002:ab0:415:0:b0:347:76ea:178f with SMTP id
 21-20020ab00415000000b0034776ea178fmr5146024uav.20.1647018099510; Fri, 11 Mar
 2022 09:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20220310183234.608500-1-ralph.siemsen@linaro.org>
 <CAOSpxdYpQn_wMjHSQjkb23yeg+5hP=LMUCUZNiWyJ6_9t7b-nw@mail.gmail.com>
 <CANp-EDYr1D974n-Gbuppr3DL=E1J0Pwa3p3uSg3X6TUwGCYd6w@mail.gmail.com>
In-Reply-To: 
 <CANp-EDYr1D974n-Gbuppr3DL=E1J0Pwa3p3uSg3X6TUwGCYd6w@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 11 Mar 2022 18:01:28 +0100
Message-ID: 
 <CANNYZj93wOH7-GHqsdqNVppAeSphGD=mD2j_FB0aSgyouYdvcg@mail.gmail.com>
Subject: Re: [OE-core] [dunfell][PATCH] bind: update to 9.11.36
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Steve Sakoman <steve@sakoman.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Mar 2022 17:01:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163063

Any interested parties should arrange a dunfell mixin layer for bind
9.16 (or even 9.18) then. 9.11 recipe should also print an EOL
warning.

Alex

On Fri, 11 Mar 2022 at 17:28, Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
>
> On Thu, Mar 10, 2022 at 9:34 PM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > This passed a-full on the autobuilder:
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3347
> >
> > So I'll be including this in my final pull request for the 3.1.15 release..
>
> That's great, thank you.
>
> Note that this is likely the last release of bind 9.11.x series.
> This branch is EOL according to [1] and [2].
>
> So that will make things interesting if/when the next CVE comes out...
>
> [1] https://www.isc.org/download/
> [2] https://kb.isc.org/docs/aa-00896
>
> Regards,
> Ralph
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#163058): https://lists.openembedded.org/g/openembedded-core/message/163058
> Mute This Topic: https://lists.openembedded.org/mt/89693205/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

