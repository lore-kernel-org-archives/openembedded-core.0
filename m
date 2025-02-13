Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79CC3C021A0
	for <webhook@archiver.kernel.org>; Thu, 13 Feb 2025 09:54:40 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.7469.1739440477790348851
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 01:54:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FNkWTm0w;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6e442b79de4so6257896d6.2
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 01:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739440477; x=1740045277; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tRIukruhtxFPp7GNbttsxyH2Nu9ZyzqA7pqpxSyu6+A=;
        b=FNkWTm0wISbioK5N9QfdkbWAs0NF1IA2N0BrVy/xYoVak5q+ydNq02TNPprRqZjYJO
         AGo/IJNZAr6Z+T0HUfVBN8+Cne1LLt3VrPkewhfNDwptkSD9Wf10tcNpFNytcZNYrO51
         HcCcR0eTxoNqQNJcQxUgY7lt25NTRXM/aecEojrGTFc524Kgaw3NTCbPhaB7QTCiBUaV
         SLrfQpJmSvQrZc4n4zcBvMfhW+g6jJLJV2gbyUGjGH+rVWkW6TBeA1B85hTeh3MTGKXS
         qYmnloXBIpi7to2p3TTQLAYMEU/mHFYcajJtKgIvLZSDAai/KgLfhWeHOH4qnqRfRPUB
         iBFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739440477; x=1740045277;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tRIukruhtxFPp7GNbttsxyH2Nu9ZyzqA7pqpxSyu6+A=;
        b=s1pkd1XYGOD/jenK1aBg/OPLZjytjVW6/WmON2J5B1KVXiKGDWOIjIGB4mrrZiSzZx
         d9Xioh6DPEIG2BcL+XW82RMBcl3e/HFbWIKscYdFETrfosCpTtTo7HvKcZtCz3+5ohf0
         vkIujt/qeo9S8VNc6T9U4eYmH1mmcvATD2ID+cGUlW9pvRu9Kt2CEh6RMQRbjU/DrKVv
         1GnkV6NyuzX13el3ymFi9DLhSnj86r86mOnKdjumii1yFE4r4NPrG0J2jEr/UjPx9dIU
         ML0binis4YbhRHOKoFxVOadmxpOtyIEzIYE5p1WN22PLQbgE259LTjd9qshhC75K2BzE
         ltrA==
X-Forwarded-Encrypted: i=1; AJvYcCXfaLxoO8g02k2vnILymdxwPzYpywiz0thAWbyUo6zzb0KT6l+6t27XC43WUA+vTenryL7RswD8csZPOR1f3z6M3g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwurnUSAME5s5k09YTYvbV1NJLvMQFKQPbE43E5Lg6RKZpxBAaK
	rPVJHpYwoT8ThlKpck3mF63H3O0RhF8q1j5Tj9h4gL4Zqo1981j+WT7Pu8En7GwFNgFuswBmhsn
	ERADQBRfw1zjW/tOMEQ+MliYiHfc=
X-Gm-Gg: ASbGncs91Ytpf2piudCIqCQDVkm8FMOobRgejBpYvsF9WvO21zjbg1x25fwBVO9MCjP
	A5AMwMDDNzz1iF0zMFQ2dUe1u7E0tyDWNtSwnVa09xrqChg9XZvZVuRMYCgDBZ6hTkXwLwrOrqd
	AmYzWXDqXbkPYt82M5Fq9glViPRfIC9Us=
X-Google-Smtp-Source: AGHT+IFBWHHgVbWtXHE5Wlqeq64h0EU6ghYYqjZfQe0ES9Euxx9Exicw/eCXFRmG8t1CbJdYaMScT3eLCUH6RIrmdAk=
X-Received: by 2002:a05:6214:27c9:b0:6e6:60f6:56cf with SMTP id
 6a1803df08f44-6e660f65961mr5492076d6.5.1739440476861; Thu, 13 Feb 2025
 01:54:36 -0800 (PST)
MIME-Version: 1.0
References: <CAK5yBb9Fr9MFy5uub2_pTRWmVbt96OWBJ5ty+eAB9Qn+LYa_Wg@mail.gmail.com>
 <CANNYZj-PbWQDa5hAc5X6sqHVMvJ0QE01XXwytya8rprwvSsqag@mail.gmail.com>
 <d22a4cec5e317e62f1f44d8d9a810cf4745ccb48.camel@linuxfoundation.org>
 <CAMSfU+6d7gvYkjC5sbUPu6D_hOOF43ZUnM_NMEwmLUxZn6ysSA@mail.gmail.com>
 <4e883a56eb9b74a5663d7ad258194d16b1c79912.camel@linuxfoundation.org>
 <CAMSfU+44qwScnoDP4As37TNHYvwx5mBmTdGEQgq_VVz7woh6sQ@mail.gmail.com>
 <CAMSfU+4MY-JVmWPUixJYiUrtKd2CXHrJuQ0sMJJrrkLzrvAuvA@mail.gmail.com>
 <CANNYZj_8o=SHOn-kRBxzwc8vp3omCL290SA-jKkL_En1m2SWEA@mail.gmail.com>
 <2c1bcbb1d5b75b925d9af2bd300d376a973e314e.camel@linuxfoundation.org>
 <CANNYZj88RSkyChK6NwJU2OVxmGXzD2W8UcGyYe92ii8v8hdFqQ@mail.gmail.com> <CAMSfU+5Af0=w0N_kK1HLx4nNnQqGOv54C2qC-e7Q0Lm5NQ0Vrw@mail.gmail.com>
In-Reply-To: <CAMSfU+5Af0=w0N_kK1HLx4nNnQqGOv54C2qC-e7Q0Lm5NQ0Vrw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Feb 2025 10:54:25 +0100
X-Gm-Features: AWEUYZm_YgjDjWALnOOxRjWVXUFRoquoFmZVEoqxzK97qkS7kS4-Q3OH7JlmlkU
Message-ID: <CANNYZj_8qPoOjhR=uR_7WRZu0V0YdhbcN43fA6mbnQBU5198fw@mail.gmail.com>
Subject: Re: [yocto] [OE-core] Yocto Project Status 11 Feb. 2025 (WW07)
To: Yoann Congal <yoann.congal@smile.fr>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Yocto Mailing list <yocto@lists.yoctoproject.org>, 
	",openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Feb 2025 09:54:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211313

On Thu, 13 Feb 2025 at 10:53, Yoann Congal <yoann.congal@smile.fr> wrote:
>> > I don't think the github repo is going to work for either YP or OE
>> > since there are repositories in both that use pull requests and we
>> > can't have a one size fits all message. I think that means we would
>> > have to do this with a .github directory in the repos themselves.

> That would mean to create a ".github/" directory in those. Are we ready to do this?

I think so. RP pretty much confirmed this just above?

Alex

