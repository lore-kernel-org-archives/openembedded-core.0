Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD6EC77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 10:40:29 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.34264.1681900819554890354
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Apr 2023 03:40:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PYQeZ3sf;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id a10so16991310ljr.5
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 03:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681900818; x=1684492818;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s3NG0wwdWvJDTal5nUlMDJhjOM5JxOVG4Rr3QgVD/c0=;
        b=PYQeZ3sf5L726SIc8HFDC9whkAwPkcg3sMYfUXOowe1Pc01MVlD2H9QPM68Lf0fCOE
         ievu4MlQg+YHL+Tipm4mwU4EH81zQ4X0z57LhAn2zxOyHintZg+mNxgIURqEby0delW7
         +WlSwE8tfuDp1ilW9F4EnYTPyUVUu7UYrpqPCcNLOgQdcxdCihMj3/SFT48XqRzMe+3i
         6J1nmCCeQgZE0jqcEpJrBwP/KdLB4jeAWQUMTOmMJfFuM6PAHFb/IyAothrwU3N5vaJW
         GjvOWcPKQGufDkZDufWqwMlM6qvZ+AXZLE80d44IVTpNDrzsUF0vX14Spn5+dzqsA4+W
         a1UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681900818; x=1684492818;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3NG0wwdWvJDTal5nUlMDJhjOM5JxOVG4Rr3QgVD/c0=;
        b=WVSQxqd9uQ77DZFcZIqmy0nuFmlZZB7nXWIfLhNh9IPqmfdEvl9zOBQdhG7n6Psmsh
         rCEC4yAqmHeHGrxKb7m/p8lu/8mUKWtMRX9834Vt746lCcCKrAytk0QYlUr54Ij/jZbf
         AibMDQh7ITU0TKt/fbU26iJ4/GC+zC92VEJwhm8LYlzBnDR5oGYvxI4pEd+oy4ksAwo2
         9QhPWLaef1JKf7oIsivHYFjSPFAugENaG+kpPg1oSGgRkubfAH+03CwokAOeW5uSVph/
         Ox7+oSy2LN1rbjKcGNSjPnYXXcvRKu8C/FskupItJ6c557zDMYN8M5iVaGe7MVa3Dsxa
         4elw==
X-Gm-Message-State: AAQBX9dUQvIHJLOP//vcjl3u02RYgMNH/J6JO4W7PMyLS15JvD6NHyNX
	u3z7ApBCOXCKC7UXNpzjZ+mx/Aem1cvWnjryjt8=
X-Google-Smtp-Source: AKy350Zpa0nBU/DC8bLdVSbM8l7PrMTBYbzyOyy/E6ZgsfKQru/mXcXTi/Bem0O67U7Esx/SRXW3WXoPbMPKiJ6+7Ew=
X-Received: by 2002:a2e:9018:0:b0:2a7:6f68:a820 with SMTP id
 h24-20020a2e9018000000b002a76f68a820mr2114961ljg.17.1681900817461; Wed, 19
 Apr 2023 03:40:17 -0700 (PDT)
MIME-Version: 1.0
References: <jwqildtsa37.fsf@axis.com>
In-Reply-To: <jwqildtsa37.fsf@axis.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Apr 2023 12:40:06 +0200
Message-ID: <CANNYZj8qEpp9=myqEotpkp2=oix9P7_4=khZi_mqu=xsE+wJrA@mail.gmail.com>
Subject: Re: time64.inc
To: Ola x Nilsson <ola.x.nilsson@axis.com>, 
	OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Apr 2023 10:40:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180216

Hello,

I'm working to fix the known failures that come when enabling
time64.inc and run as much runtime tests as I can think of. Work in
progress is accumulated here:
https://git.yoctoproject.org/poky-contrib/log/?h=akanavin/y2038
I hope to get the patchset to the point where it can be submitted in
the next couple of weeks.

I didn't look at any specific rust issues, so you can continue that as
a separate track.

Alex

On Tue, 18 Apr 2023 at 13:28, Ola x Nilsson <ola.x.nilsson@axis.com> wrote:
>
> Hi Alex,
>
> I saw on the chat that you want to enable time64.inc by default.
> Did I understand that correctly?
> How much testing of 64bit time have you been able to do?
>
> I have been working on fixing rust to use the correct glibc APIs, the
> pull request to the rust-lang/libc project to do that is
> https://github.com/rust-lang/libc/pull/3175 .
> Unfortunately I have not had any feedback so far.
> I have not even tried applying that change to the stdlib-rs recipe yet.
> I think there are 3 or 4 instances of the libc crate that have to be
> patched in the rustc release.
>
> --
> Ola x Nilsson

