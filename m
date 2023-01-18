Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33136C38159
	for <webhook@archiver.kernel.org>; Wed, 18 Jan 2023 17:26:15 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.22285.1674062764908542450
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jan 2023 09:26:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mzomNLqJ;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id q130so3769240iod.4
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 09:26:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sgjRT1ek/Te+0THXClc3XYguldtufYjAL1VkhzWXb04=;
        b=mzomNLqJG6fadRB7plsAEhqoGviMK37Wq/SWa+VCqpUUw5DJsxBtMQ5e5cpFJenQOC
         Z96LFtPDHkhpRg65n7SbL1iZCAKqBW3uW3xxFLbTx2KmsHHFwjNR+DSWMrAUU6FZJVQn
         enxtnuKTtZVYYEWUMweXHnVjmG9mki03uk+IzEWIuA2Sdc/LCQCc8tr0F3YR8OwZ46eq
         4sMIgrF15IZM55v/orDukU2tnARJvaHandEdHQgzxypzFXsDf9s8ldw5MBnCWzP9zsHJ
         ydqjkTlth1rOK3iH6vE5ssmU5nm3n7G1TCf5M3j9osHLfYaoHpTib4201U0g4vBlTF9o
         VsgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sgjRT1ek/Te+0THXClc3XYguldtufYjAL1VkhzWXb04=;
        b=nBclbQH/IIZdh3ktSugDkpfUCgr8ATvDsab1pkyT2hBJzYlrNaojOnWwp5NipR18SR
         uk44F1FO5wkP2IrPbcl5CfOJMKJelOLVg2JsVhGn9931wtxQ/lKgnHJkGoEGyVRPCsBr
         p1hKUzjhwe8tSUq47e4ryoR1G9XxrDM504miBuCug1XcNtE+fiMRJE8CGOpSmN1N9ni5
         mZGOmLIPncqMXTCl78aEintDWyNiCXJGpgcJ4XnZWWDAcmxRhi243rRAvD6fDp89Bdhf
         g3HeOBZ4IXP5+G0ht0wkMlylGyVHNAg2r97vvnbkQ8tBxLomyLhxBOv2fdrMKCHNCS9M
         OoRQ==
X-Gm-Message-State: AFqh2kosRasXWNi1b3kDEK4K8Vq4Uc9gGq3fGwa9T64pEqO5hFFQJkZq
	YRRzEo5+dNOpLZtS6YNFqaegOI71MWAqocps9BbzSlybRL0=
X-Google-Smtp-Source: AMrXdXsvaI2LvWdfrOW3XyVc6jBMvjXuitb5vq5XESmh8AOn/sh32kZNxaOBq+MiiKHP2/QeKg3JoSfxczKQQT6Qqeo=
X-Received: by 2002:a02:c605:0:b0:3a0:794e:93b1 with SMTP id
 i5-20020a02c605000000b003a0794e93b1mr657374jan.74.1674062764110; Wed, 18 Jan
 2023 09:26:04 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5TRYjO+pUmoMur4O_jwZYJT1xuYk1iHkpMXjU2nofXYzw@mail.gmail.com>
 <17348.1674061522006889046@lists.openembedded.org>
In-Reply-To: <17348.1674061522006889046@lists.openembedded.org>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Wed, 18 Jan 2023 17:25:52 +0000
Message-ID: <CAO5Uq5T3852c2GD0F_P+FPdD+CRJJWsYU2Y2M9s7bRntQVKENA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Merge all rustc-source patches into rust-source.inc
To: "Kokkonda, Sundeep" <sundeep.kokkonda@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jan 2023 17:26:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176110

On Wed, Jan 18, 2023 at 5:05 PM Kokkonda, Sundeep
<sundeep.kokkonda@windriver.com> wrote:
>
> Without 'binutils' the required linker 'x86_64-poky-linux-ld' will not be added to the image (getting error - cannot find 'ld').
> And, 'g++' also a required package along with 'gcc'. When removed 'g++' some required libs are missing. See below error.
>
> root@qemux86-64:~/hello# cargo run
>    Compiling hello v0.1.0 (/home/root/hello)
> error: linking with `x86_64-poky-linux-gcc` failed: exit status: 1
>   |
>   = note: "x86_64-poky-linux-gcc" "/tmp/rustcZTUudY/symbols.o" "/home/root/hello/target/debug/deps/hello-366ba9a14b055dd9.1rbu6cyq0fbr2z03.rcgu.o" "/home/root/hello/target/debug/deps/hello-366ba9a1"
>   = note: /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find Scrt1.o: No such file or directory
>           /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crti.o: No such file or directory
>           /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crtbeginS.o: No such file or directory
>           /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lgcc_s: No such file or directory
>           /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lutil: No such file or directory
>           /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lrt: No such file or directory
>           /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lpthread: No such file or directory
>           /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lm: No such file or directory
>           /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -ldl: No such file or directory
>           /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find -lc: No such file or directory
>           /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crtendS.o: No such file or directory
>           /usr/lib/gcc/x86_64-poky-linux/12.2.0/../../../../x86_64-poky-linux/bin/ld: cannot find crtn.o: No such file or directory
>           collect2: error: ld returned 1 exit status
>

Those look like glibc-dev to me - something like add a dependency on
${LIBC_DEPENDENCIES}?

-- 
Alex Kiernan

