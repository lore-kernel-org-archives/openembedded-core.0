Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0323EC433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 14:09:18 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.10930.1664892548937767009
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 07:09:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zw+RIDY3;
 spf=pass (domain: gmail.com, ip: 209.85.167.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id g130so14466534oia.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 07:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=oxT18csnSQS5AMa6m5JwK21nZ0JcIqS09m+GyJ4g5QE=;
        b=Zw+RIDY3HgthlXemrvQs2uCjmJ6+VlnbYR558eP38N0flno+yoYsm0/F5+qMdjTieL
         FQijUu30g6bs1Y1y3fCFTOx4s0T+dU5+dTfaNyVmK1TuqF1PCuibt0t9Y/6WU6Rn5/NC
         +Td6u08dyGlaZ1zv08w4gbpe50x3Z2Z+zP4AkiMncOb1Y50GCM4MV3IEN9d77VHnJlkf
         I5y4l5fboMgWP0tpae0ikXcLCEKPRKOpgJrrl/sZOfzcXw08950nUoY/ZTiOX7HYC+qM
         Ipgl8p7vuN/UJd631SKQJpAuYWVmy+GMTa46y1KvSWf+X5x5DIYoV/sCA3uOy3SesE1q
         43QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=oxT18csnSQS5AMa6m5JwK21nZ0JcIqS09m+GyJ4g5QE=;
        b=SEHMecOZi1rgnCjsiXzxt7VAbMy5qhSQ6mB+8cS7eeZO/QnqqtsSibRIz4lDoUWecz
         aAceuMmyCLev+3T5ZMCJQLbVfCMaaNhW1jcOIlg6eAG5InQLEnB8wLF8cQFNaCvL6iWK
         xxuBKJ61BxkFwXSOFdmhFy9bmcIawntevAg/PB8le+RdPHT24LiJQPyaC2Jd2R+zte41
         D6HxefRz0ziX/ak0ydCkI8MDbl0DExwW0kRR/mQe0zTBhtj5kdcgllijsJ8KDyPlcigk
         BgfIIVL2hjnKP5SyuT+9ZEFttXOV2vwNTR2ktHd74IZwUbzSFAxzGlQZZche6MjIzEWS
         ZzPA==
X-Gm-Message-State: ACrzQf2+ILK5ErYd2oKBXUPA5t/X1DdlFm4XFVqJLK3ol+piAb+dRw8p
	uaBgKBXx9rqy0oxficY7THgINeI+qIx2Uo7b5s0=
X-Google-Smtp-Source: 
 AMsMyM6xbJ7UWTjBjMAvgc5gcRf3SFiS9RxdIJQufS9nEAJcKFPzdDicGO1RbVYs1nl3q8pZQwl2QoVjmpYikCNQKtk=
X-Received: by 2002:a05:6808:1988:b0:34f:de19:411c with SMTP id
 bj8-20020a056808198800b0034fde19411cmr5972912oib.262.1664892546690; Tue, 04
 Oct 2022 07:09:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221004105106.1556357-1-ross.burton@arm.com>
 <20221004105106.1556357-4-ross.burton@arm.com>
 <CAMKF1sqk1eK0RVhQtj6WjYi4n=WrBfkP5VmgpZUdp=18dHsmgg@mail.gmail.com>
 <720037DF-9057-48C4-B5FA-D5BDE584A240@arm.com>
In-Reply-To: <720037DF-9057-48C4-B5FA-D5BDE584A240@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Oct 2022 07:08:40 -0700
Message-ID: 
 <CAMKF1soNXOp6ZXDihRPw1qTzG8p01bqHfo+m4R6LO1TjL-96cA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/5] piglit: upgrade to latest revision
To: Ross Burton <Ross.Burton@arm.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 14:09:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171397

On Tue, Oct 4, 2022 at 6:39 AM Ross Burton <Ross.Burton@arm.com> wrote:
>
> On 4 Oct 2022, at 14:36, Khem Raj via lists.openembedded.org <raj.khem=3D=
gmail.com@lists.openembedded.org> wrote:
> > How does debugging piglet looks like after this change ? I wonder if we=
 can reduce debug info by
> > Using something like -g1 maybe a good middle ground
>
> The binaries have been stripped since 2016, this change simply stops do_p=
ackage from trying to split/strip the debug symbols.  There=E2=80=99s 2GB o=
f already-stripped binaries to process, which on my machine takes over a mi=
nute.

yeah understood, I was trying to see if we can make it optimize a bit
while you were here.

>
> Ross

