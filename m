Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 292F9C54EED
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 12:55:28 +0000 (UTC)
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
 by mx.groups.io with SMTP id smtpd.web10.40027.1675083326110040677
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 04:55:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aO8vrVxa;
 spf=pass (domain: gmail.com, ip: 209.85.166.54, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f54.google.com with SMTP id l128so425469iof.2
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 04:55:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=RRDfYe6j463GfPMxbkSZMBzNSaLerNj1vlf7XaTev2I=;
        b=aO8vrVxaE6NpIXfdiKpQyU04Y1lyJCLI0icQDBDKnH6JqhNOuargkKvMRm7kAffQlw
         YPXxLy7tiEgmQ6t25cf9s//C3Mzq+6HyDHOy74kz3ZhWupLC+Fj93nAQ033HKh/RM/6i
         mFBExAPAXZQ/HK8O+hxtbGIU9gO4hWUZAUIfv5VvO1QTOGK+bt0dhXc3aSRqG+LxhC57
         2cijcNwD19T4ciixLaVeSGldIG47GbK1sm62L4cBzpehF+UkhQM44fcxSSXPf2KqBHzG
         r6dGCAC9o6V3aC8jsDBlIKlXPF+/jBZFPva3LtHUH+3gANkB8vEAKNCswGOEnHspPs+f
         GoTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RRDfYe6j463GfPMxbkSZMBzNSaLerNj1vlf7XaTev2I=;
        b=6Xlz6OuVIYucjB/4bZ1tkVllpqkYweCRbe6iwvzzxbcdNINM0qFRPwbsP0tJ1filt+
         cCgnHSss5NU9pWPe2b3IkfdHbskV2mz6jQv0sQbUAklb7RKLW3xyUZdU5IqgGAUQNp3d
         Wy67DaJhc+BY+BNffUKSPDWkhAPUv+sAlryscrnUmB6md3PT1bWp1Pq8/2wRaZbQgFON
         tsD385OjXLHmyOeeLkD0Br1NuO3KrQx8ZFSOljBy5+VCTFp11tsUqEGH1d0MEPEpWtFX
         r76mLYE1mWvu72ieB7pOlZ9zeagYBEf7MqSxdjqa/9cLFDziU/FwkeKs5JtFYkPe3lzi
         PJSA==
X-Gm-Message-State: AO0yUKUhGVDAOfuWUNa096jftkC+PLczp5woROwVuFssCMTohwSYlylU
	2OPPG4bitjqBalXr6OuFWy770TOupgkg3+2eyoI=
X-Google-Smtp-Source: AK7set+42oYmGBfNCIn65/23/8P9tQMg1kh8iXfYl9n0+tx0eJNEuk8OW0SGnvt/jMB5XU1VB0NA/gsIyVNSmWz9Yhw=
X-Received: by 2002:a02:1641:0:b0:3ad:9cd8:45e4 with SMTP id
 a62-20020a021641000000b003ad9cd845e4mr1325971jaa.122.1675083325374; Mon, 30
 Jan 2023 04:55:25 -0800 (PST)
MIME-Version: 1.0
References: <20230128173912.27980-1-alex.kiernan@gmail.com> <CANNYZj--ggHWpFWQRYaEyuDWBoMEBJYNtdGDE3agSCjsM8uCow@mail.gmail.com>
In-Reply-To: <CANNYZj--ggHWpFWQRYaEyuDWBoMEBJYNtdGDE3agSCjsM8uCow@mail.gmail.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Mon, 30 Jan 2023 12:55:14 +0000
Message-ID: <CAO5Uq5RDp4yVXfY_RMdqtMF4kgqwtbHOzK5QP5Etm3_XUFDyjw@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.66.1 -> 1.67.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 12:55:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176490

On Sat, Jan 28, 2023 at 6:10 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Sat, 28 Jan 2023 at 18:39, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> > Generate complete list of rust-snapshot artefacts from src/stage0.json.
> ...
> > -# TODO: Add hashes for other architecture toolchains as well. Make a script?
> > -SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "2b588cd2d49688c0c33b7466614123e8fe4c910f4d802fc0ff0662b1772816a9"
> > -SRC_URI[rustc-snapshot-x86_64.sha256sum] = "62b89786e195fc5a8a262f83118d6689832b24228c9d303cba8ac14dc1e9adc8"
> > -SRC_URI[cargo-snapshot-x86_64.sha256sum] = "82547aacaf42fc3c2970ec31b96751dfbeba3dffe1a042a3780bd670c29a89bf"
> > +SRC_URI[cargo-snapshot-aarch64.sha256sum] = "61736a6ec61a4eaa9a7b3f219d9f8166ae97c1acd54b5e904c15fb8caff06250"
> > +SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "9d96ba6a5a255339cd04af079d906753d56c85503c727279c227d24bd4987e24"
> > +SRC_URI[rustc-snapshot-aarch64.sha256sum] = "b4d842594ba11a84712c2d1bbf7f7945cfcc2485c72861a23b488fefba5c6a45"
> >
> > -SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "735b681c8a6e60925c76d6cc899e78b4cb4562ada24a1f265b2021c1faad78ad"
> > -SRC_URI[rustc-snapshot-aarch64.sha256sum] = "67c3d3545fd898c1383071c0f6296453565e0da10903c50652d7bf679b53e8a2"
> > -SRC_URI[cargo-snapshot-aarch64.sha256sum] = "3fd483c0d58673ab69862824408c8a48612827ddcdeaaca0f8fbe5ca02214a4c"
> > +SRC_URI[cargo-snapshot-i686.sha256sum] = "fb0c1aa922c4e41fead9d35090769309cb45648d6f77ccbe8d2ba125a75cc2af"
> > +SRC_URI[rust-std-snapshot-i686.sha256sum] = "b32cbbb9002f8a20b302823a2ff122a91f077b5e1a7bc1340de690ded86bf10b"
> > +SRC_URI[rustc-snapshot-i686.sha256sum] = "e2ab464f43d6319ddb9796cbfacd444dc40f3d0e7503d672c23ecbe0daf11e1c"
> >
> > -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "ce18b44300f7d5d94856cef5b270ba010061fafa411beb9782207e26cbab88a6"
> > -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "a6ce7aadd10a3fd84fe4717a59378421a65b101b61f27eed8b09336b8daf62cf"
> > -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "9393de910df7cd6947e380460a1144ac2373a36c776c7367a81212a51a92d9a7"
> > +SRC_URI[cargo-snapshot-mips.sha256sum] = "0f03d6d35b6044dc81a4d5eb9bd42c9d1e8c0e85363f960ff921ebe46294ae45"
> > +SRC_URI[rust-std-snapshot-mips.sha256sum] = "e6029b4cec5d6c06c34a0dbec614fa252fdc8cf31013d6e561112cf90f742568"
> > +SRC_URI[rustc-snapshot-mips.sha256sum] = "64ad92525ae1f018e08c055d7892e0fc613437bde8cf614b1c2a8986488290e7"
> > +
> > +SRC_URI[cargo-snapshot-mipsel.sha256sum] = "74d757a456d2fbb418c253db203c0bb3f71d797e4ab3e2804b6c594a18e0f199"
> > +SRC_URI[rust-std-snapshot-mipsel.sha256sum] = "8bfa3d6079c6df049978fe61b1ccaf992aecd006e23df2439ecfc883bd8bc31b"
> > +SRC_URI[rustc-snapshot-mipsel.sha256sum] = "f2674d60ce52c49048e9823af57aae24bb6722e8998783819ec884222caeccf3"
> > +
> > +SRC_URI[cargo-snapshot-powerpc.sha256sum] = "f771fa4294c8e0d5d0e58129fe9d4e0913566dd43523b6f0af19a08004004df8"
> > +SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "417b12a9bf090d694514937cd8c321ed625f155248f63c0de8207b17fa4b35b1"
> > +SRC_URI[rustc-snapshot-powerpc.sha256sum] = "ff16d02c100086175b9fbcfff4d3705fb4f5b58a6506ec7667dc86c56b8bb3c7"
> > +
> > +SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "9a933d39e6b028e73db9cc0959af84128824e0b11554e3a0171cad7635a343c7"
> > +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "7074c4ea9fcc683ceb0adcca6ba07544a1d91f0e5d2a4cf14c81eb14316ebf35"
> > +SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "f5bff79d517e2f721839462881331bdc1b8323a434f4ebe0529f93213adb2a24"
> > +
> > +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "29fa2e003f4bf3e37a3fb506d5b7ab19eb6412b5966d865e082b354637d5d84a"
> > +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "4c64a09be872b5832b50d681fbe29691b6a5d3e23ee5535020fa22b8b453c770"
> > +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "3b4322b519b0f7fbcf88511b2061be1499921517d810d7696be58a16467d4589"
> > +
> > +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "f362cf575fde92f988d5b1fe19fd463a1905d8d2a3844168034df49b1dffb10b"
> > +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "776eff6f451845e88224714ee6da7819e34f01b7625bf927394c2b91e5c8243c"
> > +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "84bea70d3acb6af04ae4c0f49f904bba4e2644b92c5996aacbafd7610dd0e147"
> > +
> > +SRC_URI[cargo-snapshot-s390x.sha256sum] = "f69ea091fa1ee4871a46cb9fa1da5b81fa2980687f3bedbc4677a4a82f8da0c0"
> > +SRC_URI[rust-std-snapshot-s390x.sha256sum] = "51d1567e1d28e43c2165886f5a4955dcdaa41aa5ddcec5fb08200491fd1f6062"
> > +SRC_URI[rustc-snapshot-s390x.sha256sum] = "25a047db8ec0627bb7054eafe6edca6ce4c473b30d6766b30cbff1c536d0673b"
> > +
> > +SRC_URI[cargo-snapshot-x86_64.sha256sum] = "a636f83eb2327a66f484b9592ab305c6642df16fc80d0d1cb727e766a60da904"
> > +SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "c5e2c9b160bd8d99514f13cfbc0e42a722fd9ca14e6aaca4b9b77731a7a48377"
> > +SRC_URI[rustc-snapshot-x86_64.sha256sum] = "242855e2626860aede6957dc56481cc02acf8cad12fa5bbbcbd93f9c51f0b3ad"
> > +
> > +SRC_URI[rust-std-snapshot-i586.sha256sum] = "90eb8e2490283930e682b79842d664d4867414563353d53dafc47eccf44aea17"
> > +
> > +SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "3aee03fa61c28bb242023efb09a22e38a76b075cc72bcad9894560be8b28a927"
>
> How would this amount of entries be kept up to date with each new rust release?
>
> Presumably you did that with just such a script? Can you put it into a
> task in this recipe? You can check the crate updater class for
> mechanics.
>

Yes, right now it's standalone, I was looking at trying to add it into
the devtool upgrade flow, but its so specific, that doesn't seem like
a good fit. On the same basis a class for it seems overkill as it's
only usable in this one place. I was leaning towards just adding it
into `scripts` ?

-- 
Alex Kiernan

