Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC5BC433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 12:02:40 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web12.8879.1647950559343530015
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 05:02:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fYLFP8BW;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: rybczynska@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id h7so11918689lfl.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Mar 2022 05:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dZl1BlXSJfB+xhBIO7J5JDrkvb2nLTdObxB6ud8rkoc=;
        b=fYLFP8BWAdnMIXr/acHDD4cWfsKs9DVBmUIY6p+/NMrTdLg9rNJvGQgEn36N/X6sHU
         d0yBLFwMdeoP+p9CZRB5IJCCPMNW+Ef916czWuSiM8h9I0gSwrL+B9CR+LQA2RSr/wrt
         4AS18o6CQPQkVQpIM2MAzl+vCsy6kgK7AUvdGc5F4tfOmvK2X9n91V4RzJpdvFLbOvJS
         ECNebpKjUS5A1+4QwJZgqSFNvII3zzmGOrtRv3F0G6W1nc/bj4a+tL1Mqq/uvYrGVcdl
         x5Wr8qmXBVa3OBiJiziujzp4HVoBKXppEcrpMQ/stbQjycnfRJbHzPyRw0AI81af1s4j
         GL6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dZl1BlXSJfB+xhBIO7J5JDrkvb2nLTdObxB6ud8rkoc=;
        b=KMXl9fBr8Lb4FUmnr4qaV+wVet6DeKVxVYOk3UbDmoUfFSYvguSY68Ugbr3LRD0uT/
         dJUaWGDOjPTLCAowekYWKteLbtx28d8rM3VIJYl311Y8q7CfxxjqiKbs6XuVaReHq6Ab
         30AaBMR2nHHxcUDEWuLpoSIl2GexinQTLSnp3fiaKeCDF6jUDbK/xLBUKyg0xqk8r1RE
         ofIPiTkhOmDurHwuUNgHuVXY2Z0uUY+uuG7kf35YdNaZbXRDbUmGHMrRGjt4XpIEJiWo
         l5U1aJqEKs8FkcWMTb079vDrAWql/Hv45kqLkNKDSrgHej3c4xy5gyVOlxHro8hRIvxm
         ryCQ==
X-Gm-Message-State: AOAM531qEw9MrVwdXRD3f6grlbIeQI09eypBx+ClwBg9ezw3CGuYSdl7
	c11I0annTWhLhMx6pbd0kk8Xm/UNToKhxL1D6Ag=
X-Google-Smtp-Source: 
 ABdhPJxTyzKkU/WWMZOGwmXEv4ypc1yHDSJvq+qsK31Gdcv0vEu42opYVxhLbTy5Mda9NPGvSGRZ40QXMevmdvSqNKk=
X-Received: by 2002:ac2:5d70:0:b0:448:5d7b:dcb1 with SMTP id
 h16-20020ac25d70000000b004485d7bdcb1mr18139814lft.352.1647950557210; Tue, 22
 Mar 2022 05:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <bed867f3-8226-701c-0ee7-ac8f02723edc@bootlin.com>
 <CAApg2=Q5PufyYtb5B6ZXevZwRBTEzAzJHeLJ5-5ej1_KJYT=qA@mail.gmail.com>
 <28b80b8e-45df-bfc3-3455-e7d3e4bcaee2@bootlin.com>
In-Reply-To: <28b80b8e-45df-bfc3-3455-e7d3e4bcaee2@bootlin.com>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Tue, 22 Mar 2022 13:02:26 +0100
Message-ID: 
 <CAApg2=QgX-Ps5CbGmY24ooGAL+NOXBQy6HxvmTu4Q4t41_zCNw@mail.gmail.com>
Subject: Re: [OE-core] List of changes for Kirkstone migration notes
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	YP docs mailing list <docs@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Mar 2022 12:02:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163551

On Tue, Mar 22, 2022 at 9:53 AM Michael Opdenacker
<michael.opdenacker@bootlin.com> wrote:
>
> Hi Marta
>
> On 3/21/22 16:22, Marta Rybczynska wrote:
>
> > Heads up: I'm on the inclusive language migration + migration script docs.
>
>
> Thanks for helping!
> You probably have seen
> https://git.yoctoproject.org/yocto-docs/commit/?h=master-next&id=a6650fd55259c5d7cf3cf9579e9ecd1184b1b155
> which was merged yesterday, but you can probably expand or improve what
> I wrote.
>

I will extend it, thanks for starting it!

Kind regards,
Marta

