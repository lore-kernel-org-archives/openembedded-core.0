Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5882C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 21:01:40 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.web10.3051.1638910900064266701
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 13:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=e3DOdEpk;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id jo22so493420qvb.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 13:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zsu3WO1IerpAD4pxcOrO/+dSyBjXiF7A8KuA74ghNLg=;
        b=e3DOdEpkxFPZUVkaaTPF2RrSE7QILkKeSGMyT2XqIR9d/g74FiA7lMzhFdGO+1TNMS
         PEBSKKTcGTgnRHpxWcIDF8auQVRzEuhJMVqDc/c77uo9d3Hvv/MitJws19mCBEWtOTa1
         cQabey4qaGbIPZLkOlguKZzGR5j1jA8HbFvpy+m9kRZDPpkqe/HsOpaNwur5KDysYVWQ
         qe+BENLLRUFa7CX3VvMx8gqiL0NCrdOLUs3kC6YIq5tnZV63s7IE0ivRdMaziNT1kBnP
         DfL6821A7JfNmgq3O9R6Dq61ZtfrVc6qiolcU0Up/ArPoUcB9Tsb7hQCEvsaF/CPk51Y
         g5Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zsu3WO1IerpAD4pxcOrO/+dSyBjXiF7A8KuA74ghNLg=;
        b=5BnuoCAfjBk9IfpDiHt95r61vyf88G3jUKQQ29gZPu9gjyp3ZGTEPsEaWnnO9xbn5v
         335oE6iB9/khPSggV8EtmJrQ7cv1AVZljow413xZEGfkHnXuIfhUXcVbTx5ShFSJhdOY
         bcjswo6ttyncCboLV6LWKkcicxx48MQ/ZbqLLKoATETTR13h3mUDwa2yeEiKOdH5fYvX
         ywgOZ2XuG1jyIwRADY/CK6uxfwvkxCyFd6vRDUQIAWNHBGbJKTwAMF69Iwoe+uhd+iPq
         1qNWvi+QhglgKSZS51No6l4vkoJe/gsiTStUDhZ4zR971bkTvYAIm2y97yq7w6JaQacB
         xiRQ==
X-Gm-Message-State: AOAM532BzjFC0CVQ+md0BRmJ9fZnsP0XgeueJ3Abm0Uy6cjKM0uc3tx9
	3JCs1FPzvA4dr+YoT8s9uRP+0YzBruRc10ja1b4=
X-Google-Smtp-Source: 
 ABdhPJzT6VE5My5DkjElGh5kEe3KiKep+SGdagn9UO9GivhRT7XCVE9gU6C/2vt5XZ3vKRQ/Wmz0OQdCk3hFkHdlaLU=
X-Received: by 2002:a05:6214:2623:: with SMTP id
 gv3mr2167597qvb.63.1638910899133;
 Tue, 07 Dec 2021 13:01:39 -0800 (PST)
MIME-Version: 1.0
References: <20211207192454.477297-1-raj.khem@gmail.com>
 <CANNYZj853PCNuqsnieaq4LpfuH_4EzX9P42P_2nA-s+0T9Ke8Q@mail.gmail.com>
In-Reply-To: 
 <CANNYZj853PCNuqsnieaq4LpfuH_4EzX9P42P_2nA-s+0T9Ke8Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Dec 2021 13:01:13 -0800
Message-ID: 
 <CAMKF1sqawrU4nB+y_CSsjbqtiZsLvHKAEa36+oWGjDKPs=Jg4A@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] mesa: Fix broadcom vulkan driver build on
 32bit arches with 64bit time_t
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 21:01:40 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159336

On Tue, Dec 7, 2021 at 11:36 AM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> No more 'Pending' please :) mesa has a gitlab, so it's trivial to submit the patch.

Good point, I have it already under review, I should have updated the
status here, v2 has it updated.

>
> Alex
>
> On Tue, 7 Dec 2021 at 20:25, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...unt-for-64bit-time_t-on-32bit-arches.patch | 41 +++++++++++++++++++
>>  meta/recipes-graphics/mesa/mesa.inc           |  1 +
>>  2 files changed, 42 insertions(+)
>>  create mode 100644 meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
>>
>> diff --git a/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch b/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
>> new file mode 100644
>> index 00000000000..9032eaba0f1
>> --- /dev/null
>> +++ b/meta/recipes-graphics/mesa/files/0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch
>> @@ -0,0 +1,41 @@
>> +From e2e2fe86dd61b6fae682a1fec31bd0755ced5cd5 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 7 Dec 2021 11:13:27 -0800
>> +Subject: [PATCH] v3dv: account for 64bit time_t on 32bit arches
>> +
>> +This makes is a bit more portable, especially on 32bit architectures
>> +with 64bit time_t defaults. Especially on musl its a must.
>> +
>> +Fixes
>> +../mesa-21.3.0/src/broadcom/vulkan/v3dv_bo.c:71:15: error: format specifies type 'long' but the argument has type 'time_t' (aka 'long long') [-Werror,-Wformat]
>> +              time.tv_sec);
>> +              ^~~~~~~~~~~
>> +
>> +Also reported here [1]
>> +
>> +[1] https://github.com/agherzan/meta-raspberrypi/issues/969
>> +
>> +Upstream-Status: Pending
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + src/broadcom/vulkan/v3dv_bo.c | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/src/broadcom/vulkan/v3dv_bo.c b/src/broadcom/vulkan/v3dv_bo.c
>> +index 71679ce..dc5e7f5 100644
>> +--- a/src/broadcom/vulkan/v3dv_bo.c
>> ++++ b/src/broadcom/vulkan/v3dv_bo.c
>> +@@ -67,8 +67,8 @@ bo_dump_stats(struct v3dv_device *device)
>> +
>> +       struct timespec time;
>> +       clock_gettime(CLOCK_MONOTONIC, &time);
>> +-      fprintf(stderr, "  now:               %ld\n",
>> +-              time.tv_sec);
>> ++      fprintf(stderr, "  now:               %lld\n",
>> ++              (long long)time.tv_sec);
>> +    }
>> +
>> +    if (cache->size_list_size) {
>> +--
>> +2.34.1
>> +
>> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
>> index 30b9e93f630..31ff38dfdca 100644
>> --- a/meta/recipes-graphics/mesa/mesa.inc
>> +++ b/meta/recipes-graphics/mesa/mesa.inc
>> @@ -20,6 +20,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>>             file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
>>             file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
>>             file://0001-util-format-Check-for-NEON-before-using-it.patch \
>> +           file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch \
>>             "
>>
>>  SRC_URI[sha256sum] = "a2753c09deef0ba14d35ae8a2ceff3fe5cd13698928c7bb62c2ec8736eb09ce1"
>> --
>> 2.34.1
>>
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#159328): https://lists.openembedded.org/g/openembedded-core/message/159328
>> Mute This Topic: https://lists.openembedded.org/mt/87572545/1686489
>> Group Owner: openembedded-core+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>

