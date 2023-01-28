Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ECAC27C76
	for <webhook@archiver.kernel.org>; Sat, 28 Jan 2023 18:10:37 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.19017.1674929433042206844
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Jan 2023 10:10:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=gj3mbXJf;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id y19so8835633ljq.7
        for <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 10:10:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LbysNDoMV5XrMu+SmbUldfuVb8Nhkh+8Nu6nB/o95xs=;
        b=gj3mbXJfMDJ3IF+aNCvJlFM/c8TH3SkWl5/TugUVu/3AwlWnG2UxA9OWNP7lGJye5r
         bbmvKeZDBcOEuReGNBneegrCszUtBcSnKfR7P2k+yTwYODHULphpDw10QevAYbslF4lQ
         PsRGeLutho7+h6Ty/Ta5UyNIm0uSzxY2819Vf5W9RBhAMOArmMEPjIf7c5DPQi4P4OF8
         mmKLkve+wTQOFWGl+7mL/JAR1X6W4nD5EUJ6ZZsG700sPQVEP1aIiomlY/SoSHl+0etY
         vOzZ0pvJe7XfzFR/XeLWyL+DVVsQjOY1fP1rZYZ+UHYjWHc1nABxIkCn0G5AHYROedoS
         LBPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LbysNDoMV5XrMu+SmbUldfuVb8Nhkh+8Nu6nB/o95xs=;
        b=nik8+g/30BBI5xDDYkA72e3NfhRR2jadTL5LODBoAnEUHzFOr/Mmvn0rf0PMbN220r
         fq4XCWZkILuRB9FhAiUhapLrt+aqYYnQ2Mn1FKjxlTtnaG0uL0Gf2TtT3Gn9feSZGBQp
         +Xj0L0TmVINwDMCCfORsixRRlxoPG8jQ1iMgtX6qMGavTZM2iuUsJlp2R2neEx+2Vo91
         IXuDnqL4yPaHBI0Z4VhXmfi/3d/TNiWJZnxiJA+AcotvnCksHzBzQUnm422ypeH5bA8L
         zievuVwGyO4h8J+vnvr8UMar9HjEJj6wK7e4MiDq8hVgsvI9TexJsTxiRiOnxiGJ2b4x
         yKyA==
X-Gm-Message-State: AFqh2krnG2mqkD9StVxv30HpOInm9iVK9N237A/Y9GTbSycTOyWShAAf
	8g65iRz91VT2hgM5/4+CdofSuM4kPCpMxc8kGCw=
X-Google-Smtp-Source: AMrXdXusPjK5+NPPXhrEwR9YwAwJtI6gluBwBgy6UixAIIelH8pvcmWxOU21hRICMBIpUKVme8jOpvISgXqwtaeqLZw=
X-Received: by 2002:a2e:8ecb:0:b0:27f:b765:d0c1 with SMTP id
 e11-20020a2e8ecb000000b0027fb765d0c1mr2301061ljl.169.1674929431139; Sat, 28
 Jan 2023 10:10:31 -0800 (PST)
MIME-Version: 1.0
References: <20230128173912.27980-1-alex.kiernan@gmail.com>
In-Reply-To: <20230128173912.27980-1-alex.kiernan@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sat, 28 Jan 2023 19:10:19 +0100
Message-ID: <CANNYZj--ggHWpFWQRYaEyuDWBoMEBJYNtdGDE3agSCjsM8uCow@mail.gmail.com>
Subject: Re: [OE-Core][PATCH] rust: Upgrade 1.66.1 -> 1.67.0
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Jan 2023 18:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176461

On Sat, 28 Jan 2023 at 18:39, Alex Kiernan <alex.kiernan@gmail.com> wrote:
> Generate complete list of rust-snapshot artefacts from src/stage0.json.
...
> -# TODO: Add hashes for other architecture toolchains as well. Make a script?
> -SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "2b588cd2d49688c0c33b7466614123e8fe4c910f4d802fc0ff0662b1772816a9"
> -SRC_URI[rustc-snapshot-x86_64.sha256sum] = "62b89786e195fc5a8a262f83118d6689832b24228c9d303cba8ac14dc1e9adc8"
> -SRC_URI[cargo-snapshot-x86_64.sha256sum] = "82547aacaf42fc3c2970ec31b96751dfbeba3dffe1a042a3780bd670c29a89bf"
> +SRC_URI[cargo-snapshot-aarch64.sha256sum] = "61736a6ec61a4eaa9a7b3f219d9f8166ae97c1acd54b5e904c15fb8caff06250"
> +SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "9d96ba6a5a255339cd04af079d906753d56c85503c727279c227d24bd4987e24"
> +SRC_URI[rustc-snapshot-aarch64.sha256sum] = "b4d842594ba11a84712c2d1bbf7f7945cfcc2485c72861a23b488fefba5c6a45"
>
> -SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "735b681c8a6e60925c76d6cc899e78b4cb4562ada24a1f265b2021c1faad78ad"
> -SRC_URI[rustc-snapshot-aarch64.sha256sum] = "67c3d3545fd898c1383071c0f6296453565e0da10903c50652d7bf679b53e8a2"
> -SRC_URI[cargo-snapshot-aarch64.sha256sum] = "3fd483c0d58673ab69862824408c8a48612827ddcdeaaca0f8fbe5ca02214a4c"
> +SRC_URI[cargo-snapshot-i686.sha256sum] = "fb0c1aa922c4e41fead9d35090769309cb45648d6f77ccbe8d2ba125a75cc2af"
> +SRC_URI[rust-std-snapshot-i686.sha256sum] = "b32cbbb9002f8a20b302823a2ff122a91f077b5e1a7bc1340de690ded86bf10b"
> +SRC_URI[rustc-snapshot-i686.sha256sum] = "e2ab464f43d6319ddb9796cbfacd444dc40f3d0e7503d672c23ecbe0daf11e1c"
>
> -SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "ce18b44300f7d5d94856cef5b270ba010061fafa411beb9782207e26cbab88a6"
> -SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "a6ce7aadd10a3fd84fe4717a59378421a65b101b61f27eed8b09336b8daf62cf"
> -SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "9393de910df7cd6947e380460a1144ac2373a36c776c7367a81212a51a92d9a7"
> +SRC_URI[cargo-snapshot-mips.sha256sum] = "0f03d6d35b6044dc81a4d5eb9bd42c9d1e8c0e85363f960ff921ebe46294ae45"
> +SRC_URI[rust-std-snapshot-mips.sha256sum] = "e6029b4cec5d6c06c34a0dbec614fa252fdc8cf31013d6e561112cf90f742568"
> +SRC_URI[rustc-snapshot-mips.sha256sum] = "64ad92525ae1f018e08c055d7892e0fc613437bde8cf614b1c2a8986488290e7"
> +
> +SRC_URI[cargo-snapshot-mipsel.sha256sum] = "74d757a456d2fbb418c253db203c0bb3f71d797e4ab3e2804b6c594a18e0f199"
> +SRC_URI[rust-std-snapshot-mipsel.sha256sum] = "8bfa3d6079c6df049978fe61b1ccaf992aecd006e23df2439ecfc883bd8bc31b"
> +SRC_URI[rustc-snapshot-mipsel.sha256sum] = "f2674d60ce52c49048e9823af57aae24bb6722e8998783819ec884222caeccf3"
> +
> +SRC_URI[cargo-snapshot-powerpc.sha256sum] = "f771fa4294c8e0d5d0e58129fe9d4e0913566dd43523b6f0af19a08004004df8"
> +SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "417b12a9bf090d694514937cd8c321ed625f155248f63c0de8207b17fa4b35b1"
> +SRC_URI[rustc-snapshot-powerpc.sha256sum] = "ff16d02c100086175b9fbcfff4d3705fb4f5b58a6506ec7667dc86c56b8bb3c7"
> +
> +SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "9a933d39e6b028e73db9cc0959af84128824e0b11554e3a0171cad7635a343c7"
> +SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "7074c4ea9fcc683ceb0adcca6ba07544a1d91f0e5d2a4cf14c81eb14316ebf35"
> +SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "f5bff79d517e2f721839462881331bdc1b8323a434f4ebe0529f93213adb2a24"
> +
> +SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "29fa2e003f4bf3e37a3fb506d5b7ab19eb6412b5966d865e082b354637d5d84a"
> +SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "4c64a09be872b5832b50d681fbe29691b6a5d3e23ee5535020fa22b8b453c770"
> +SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "3b4322b519b0f7fbcf88511b2061be1499921517d810d7696be58a16467d4589"
> +
> +SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "f362cf575fde92f988d5b1fe19fd463a1905d8d2a3844168034df49b1dffb10b"
> +SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "776eff6f451845e88224714ee6da7819e34f01b7625bf927394c2b91e5c8243c"
> +SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "84bea70d3acb6af04ae4c0f49f904bba4e2644b92c5996aacbafd7610dd0e147"
> +
> +SRC_URI[cargo-snapshot-s390x.sha256sum] = "f69ea091fa1ee4871a46cb9fa1da5b81fa2980687f3bedbc4677a4a82f8da0c0"
> +SRC_URI[rust-std-snapshot-s390x.sha256sum] = "51d1567e1d28e43c2165886f5a4955dcdaa41aa5ddcec5fb08200491fd1f6062"
> +SRC_URI[rustc-snapshot-s390x.sha256sum] = "25a047db8ec0627bb7054eafe6edca6ce4c473b30d6766b30cbff1c536d0673b"
> +
> +SRC_URI[cargo-snapshot-x86_64.sha256sum] = "a636f83eb2327a66f484b9592ab305c6642df16fc80d0d1cb727e766a60da904"
> +SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "c5e2c9b160bd8d99514f13cfbc0e42a722fd9ca14e6aaca4b9b77731a7a48377"
> +SRC_URI[rustc-snapshot-x86_64.sha256sum] = "242855e2626860aede6957dc56481cc02acf8cad12fa5bbbcbd93f9c51f0b3ad"
> +
> +SRC_URI[rust-std-snapshot-i586.sha256sum] = "90eb8e2490283930e682b79842d664d4867414563353d53dafc47eccf44aea17"
> +
> +SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "3aee03fa61c28bb242023efb09a22e38a76b075cc72bcad9894560be8b28a927"

How would this amount of entries be kept up to date with each new rust release?

Presumably you did that with just such a script? Can you put it into a
task in this recipe? You can check the crate updater class for
mechanics.

Alex

