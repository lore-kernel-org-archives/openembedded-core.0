Return-Path: <cazfi74@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE5F2CCA485
	for <webhook@archiver.kernel.org>; Wed, 20 Jul 2022 10:00:05 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web12.52015.1658311202410644797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Jul 2022 03:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mm4OS0Nc;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: cazfi74@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-31e64ca5161so29719677b3.1;
        Wed, 20 Jul 2022 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LSqtxaLFpIvmStNLJmgQdd3ZTmMHWgTZakaM2mSBCdU=;
        b=Mm4OS0Nc0XrIc+U9s3NiVp7jEKZ5PK8GB4bXux84KFm7c5oIMkXPK8C26Ohc9qRPl+
         aEU6KQD7qGHhIL21hVj3MbaF4ySxg7LB1qpKQVOOp2Dkp4709zbGy3qJFy2Jh/Xz5aMk
         aXCAgB8oRDfeRtBgQisYVGD88u7Z5UCzUSzLr/ATY9/Gp9mRNOmm1xVMp5nNQrtrT7es
         fWaG02pH6yoaYwowGHJKeg1vwH45kn0QtWCD/wtm8YEgXlcm7HPUT8zwSrS+Bpt0DhRJ
         sfLuaAVFuDAbIlv7qXucheKAbOaoWYzdKDKGyindH0TJv8QK6VhZ38etchcZE6yz9S9a
         1KUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LSqtxaLFpIvmStNLJmgQdd3ZTmMHWgTZakaM2mSBCdU=;
        b=gIoh20FwyzADFUWqzqbduasAQxAGadwtJMdJnUQzUTUJ92T2/4+efBrCRNUzxBrzQY
         FlA6ytrYkpPxdR7H37b2vb6IvZULX9MBgKbFDsbjfaEQM2n3fzfgKm6dZDh6hxSnPiPB
         EfFY+TLp06jDCjl3v3q9bTCRGjhj9DAUzAJKeT7QHBvjGxiEGZ0g+elzXzHeV13U3COA
         3325yRkR9J4ukapEUGpYJhgbKnAd7s+lEM+bSpoIIPoOZlCVgzUNbJpECUgvMB1D3nj8
         hm3TsfHXA5q84ppO1j7HidGlYpc872zbJ0fxnV7P9fDc4IUTCZIYN8ughoeNpG054Ts6
         OlcQ==
X-Gm-Message-State: AJIora8uHZNcF2t6iF16yedsUgxiIriL3HJCOT2iR2roSFL0Tt0TOIUj
	aqs+SxpwRUzrBD8UA6pI5ll96fcWuU9UrMzxq5arSGC8
X-Google-Smtp-Source: 
 AGRyM1sfX+4Y+kvvUEFqkrBj1B4eQbDE79/+5zNjBiGt8Er5/ToqDQB26HNZjW1ibGCnvzr8uGOarbJGApVln+VaG4Y=
X-Received: by 2002:a81:47d6:0:b0:318:38b0:55e6 with SMTP id
 u205-20020a8147d6000000b0031838b055e6mr41256976ywa.89.1658311201655; Wed, 20
 Jul 2022 03:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220720084442.2940187-1-alex@linutronix.de>
 <17037D268C38CE83.21682@lists.openembedded.org>
 <CANNYZj9KKfqK8fH6HB3mLP8Vhi=U-VCMOus1uAq9kUQ7+6D74A@mail.gmail.com>
 <ee397d3552782e6fd969a497e55396ff474fee92.camel@linuxfoundation.org>
 <CANNYZj8EVF79=r4agVTa_5rfqtsU_mdBu2bD8eLv9TbD8U3fHw@mail.gmail.com>
 <0A7591F9-3D0D-49E2-A067-67485A8B3B0D@arm.com>
In-Reply-To: <0A7591F9-3D0D-49E2-A067-67485A8B3B0D@arm.com>
From: Marko Lindqvist <cazfi74@gmail.com>
Date: Wed, 20 Jul 2022 12:59:50 +0300
Message-ID: 
 <CAF6bG8cvrkhXbRLYaJh5Lmi+Z=0txpJfiGJLY1Ryn8qt66oOzg@mail.gmail.com>
Subject: Re: [Openembedded-architecture] Let's drop x86-x32 (was Re: [OE-core]
 [PATCH 05/51] rpm: update 4.17.0 -> 4.17.1)
To: Ross Burton <ross.burton@arm.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>,
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Jul 2022 10:00:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168354

On Wed, 20 Jul 2022 at 12:50, Ross Burton <ross.burton@arm.com> wrote:
>
> On 20 Jul 2022, at 10:28, Alexander Kanavin via lists.openembedded.org <a=
lex.kanavin=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > On Wed, 20 Jul 2022 at 11:23, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> That amounts to dropping x32 support because as soon as we remove thes=
e
> >> tests, it will bitrot.
> >>
> >> There is still some value in the project being able to support
> >> different architectures and different type sizes so I do still lean
> >> towards keeping this alive at a minimal level.
> >
> > But then why not replace x32 with riscv32, which as well has 32 bit
> > pointers but 64 bit integers and thus trips over the same type size
> > issues?
>
> Does the RISC-V ecosystem care about riscv32?
>
> The problem with Intel x32 is that very few people care, so we end up fix=
ing upstream software.  If RISC-V cares then we won=E2=80=99t be alone.
>
> Also, Intel should get to have an opinion on this.  If they actually care=
 about x32 then they can help fix the issues, if they don=E2=80=99t then we=
 can easily switch to a platform that has support.

 How much difference is there between x32 and riscv32 in upstreams? As
they would trip on the same issues, one would assume that if the issue
is fixed for one, it gets fixed for the other too.
 But might be that relevant upstreams need to have much of the code
duplicated (fixing one copy does not fix the other)


  - ML

