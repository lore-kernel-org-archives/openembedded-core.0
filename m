Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06EA6C4332F
	for <webhook@archiver.kernel.org>; Fri, 16 Dec 2022 10:58:14 +0000 (UTC)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
 by mx.groups.io with SMTP id smtpd.web11.10413.1671188292077707380
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Dec 2022 02:58:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vs3IW5rK;
 spf=pass (domain: gmail.com, ip: 209.85.167.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f52.google.com with SMTP id b13so2936010lfo.3
        for <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 02:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+ItJk64ooZT+FK6lnUHDRnJ2/yU7q5agyJ1AYXRoRaE=;
        b=Vs3IW5rKLmtsW7fTtK3UuqJnvtT/e7M4cidVCQSRBotkjmjl0F+D+qIV/Lrcjg5YB2
         PkqzS/3o3ruxYFbMgTY5EyIifC7Zl+0EMbxusIXD2TOqzfo4Rzi4vjjd1Muk3nrKcJRG
         NJtzimZ3OmC4i/wfEHuBWg0b6izaPjN9hve3ZQxW8zKuf7i37MLGlVq0tinahdlvllUU
         Zm1sn8JC/OfTHCkyKJ81XEQDjRFyDER7i67I+vJtg2j3hEhJVj6ByJ+kdgtebBTjHxsz
         nUMJnQzFKfqAdvbJsmu2coFuiLMXmVkIlMVKYj8egLKApF+Mgc7PJg1DuY1Mqxa2+pix
         F0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ItJk64ooZT+FK6lnUHDRnJ2/yU7q5agyJ1AYXRoRaE=;
        b=OMZhdQDERc+9m8kbvOdEu1Xodc88+Fi8xlc4jqe1oF7yx2jDts5YzWk5dw/LbcFwFG
         NVnxxFrmFtMUQrED+TPW+QU+m7cWQABsjJp8XIqb0+4yb6CAHXNxvhoOnozXJLgf0Kxi
         TIbXRRXTXb30f4e7hBwtA5QaBumlgsJz/hjSuvGM8GGlrCzQWuI/e1edUY1Ae60+r6HG
         vW/ezZ4Gph5s6tQuYS8Qasx8Y6GNpCIeKn8Lan08PQpwzgULbCRbJIm8wqxPdVIcJbfD
         +DPqaA+3ppVw0bwJf7Yag93/B5oBE4b3SP1LLMiQBFIS3ncDGsuFGXWcElVgeadCCqCe
         8++Q==
X-Gm-Message-State: ANoB5plkjuPIHa0TAvzVpkL5M+KWrTXO/uSnmKRU1DxBXzf9IQGZZBOq
	PMeRUfty+9K8TKPTUtbyRjSxCHlxPin3Fwdsy/g=
X-Google-Smtp-Source: AA0mqf7lksI4k8HGVlDn3qVIx/tcRuxqGFiipR+ogxF7TANczctMpMUtNYAB4Qab11hXeZwU1aTmP5QtOurf2kvAvF8=
X-Received: by 2002:a05:6512:746:b0:4a2:4f74:f47c with SMTP id
 c6-20020a056512074600b004a24f74f47cmr32155137lfs.367.1671188290228; Fri, 16
 Dec 2022 02:58:10 -0800 (PST)
MIME-Version: 1.0
References: <CAO5Uq5R6p-cWBUDVtULZou_1XSae4AnJRmEgr9pw6ORZ-fQpjw@mail.gmail.com>
In-Reply-To: <CAO5Uq5R6p-cWBUDVtULZou_1XSae4AnJRmEgr9pw6ORZ-fQpjw@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 16 Dec 2022 11:57:58 +0100
Message-ID: <CANNYZj9EovrkE9vD+yZmR4Dcu81h5T7zBTOiiF=862MVBUAYGg@mail.gmail.com>
Subject: Re: [OE-core] Target rust
To: Alex Kiernan <alex.kiernan@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Dec 2022 10:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174736

I think before those fixes, target rust would not even build. Now it
builds, but is not verified to work :) One step at a time I suppose,
no need to be perfect upfront, as long as the overall direction is
right.

The correct place for the runtime test would probably be
meta/lib/oeqa/runtime/cases/rust.py and it should do something similar
to meta/lib/oeqa/runtime/cases/gcc.py.

Alex

On Fri, 16 Dec 2022 at 11:42, Alex Kiernan <alex.kiernan@gmail.com> wrote:
>
> Does anyone actually use target rust? I thought we had some test
> coverage, but I'm failing to find it.
>
> After the thread on stable/beta/nightly, I started playing with it on
> target and so far have:
>
> * we're missing the rustlib/<target>/target.json
> * we don't have gcc/binutils in RDEPENDS so there's no linker
> * no libc-dev/libgcc-dev
>
> I'm not sure how target dev tools ever get used/installed as it's not
> something I've ever touched, so maybe the last one/two are expected?
> But the missing target.json just makes rustc bail on startup - looks
> like 16b4ac3f558f ("rust: Enable nativesdk and target builds + replace
> rust-tools-cross-canadian") might be where it got dropped, just
> checking.
>
> --
> Alex Kiernan
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174735): https://lists.openembedded.org/g/openembedded-core/message/174735
> Mute This Topic: https://lists.openembedded.org/mt/95707414/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

