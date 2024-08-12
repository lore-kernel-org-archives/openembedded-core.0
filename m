Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B15C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 07:52:02 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web10.41326.1723449114920266462
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 00:51:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CbZrHW+B;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-52fcc56c882so3069810e87.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 00:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723449113; x=1724053913; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K9YKouY1mRXH5FEZmDWbr323dLVfYlSITDwZ2BRvYgs=;
        b=CbZrHW+B6DgAqF6xM7LR4Lh/UJVNIGvd1QmGkJzB1NQPYMlSiCjtSmYHwTCzBNjLyN
         KlQsvgpwg39myxBPdSZugpAiEm4BNr6vguxXs9a40gbRw0WBs0R27SSBuFqunHI2E1sd
         VtcGZm2ikYnz+olq2/OBPTZP2303L+43lMCuqgMOBcbI9jmy0X8pspXiwBoaF54mCPgu
         teUD1q7/htXFtecrSlSwLTaHZ9pn1xKz/K00iXgIaRyyASW+xsagzdf6j8ghrlT6vyEz
         SMmc9OwDrqGdelniYbKAqHuSq/wQSShR+T232KLYogvwPN9SQJ11o6+oRSBl1jVpI8yw
         +lew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723449113; x=1724053913;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9YKouY1mRXH5FEZmDWbr323dLVfYlSITDwZ2BRvYgs=;
        b=chh2YsVBdqp2OaAtBl0PA2rNMiH3HF07Fd8OexOJ5c/t2ze/Zh0MkZRtl40vSGltnJ
         qWqyK8+VxiXg9zhDxoH6IEdG7S73+lvsyLg1TPoaSFVzzFslyvUBPZ4Kx8HfIyuMmpAr
         Cho7Kra/pkk4R4Kf2/a/f4tXMaNoWKanK6ccbpsTYOTe75O2rbz2RYygxMvpNxvSuURm
         G1hKIGzqks43qtw6kKBzOzKLoaPDHPfEcVl0H7n3OvTI0Xko6tto9uMX9VgPS66j7yFs
         V+u1nIye6a/Xlci3ryuWtxszQcfATL0ntQaCWXGotXSVIfXmdXzQuqTqnLEY2ccpARqJ
         CrYA==
X-Gm-Message-State: AOJu0YzRmmUEODWOQHMOb58Z+VGM4/N2SgQkREzeSexDhRklcZWvRloC
	VmBmN6LMkHR5wPFj2DYJEBFLcNsG1cG7Yh5+ksFvt9sblkqfIfcUaa7AC4kFmgJFnjbJ6Cpksqh
	vsm/k/VvQGLUV16RpuOHsWxAflw4=
X-Google-Smtp-Source: AGHT+IGEbwzJP7t0oR0Kg1zIZPpN4icSE7SM882fkM9p4mQCIuLq6VQ2Xd78LarJibmnIgIJXwU+CQamFp/ufT+taQQ=
X-Received: by 2002:a05:6512:3195:b0:52c:72b4:1b24 with SMTP id
 2adb3069b0e04-530ef53889amr2241586e87.12.1723449112655; Mon, 12 Aug 2024
 00:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <9d12e616-a06c-4182-95bc-a6bba7f9e422@skyrain.eu>
In-Reply-To: <9d12e616-a06c-4182-95bc-a6bba7f9e422@skyrain.eu>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 12 Aug 2024 09:51:41 +0200
Message-ID: <CANNYZj9v2KksePBij2yF64OX+yQCR6M+RGfcgqhS7AC5dfVXJw@mail.gmail.com>
Subject: Re: [OE-core] [oe]printhello
To: andrej.v@skyrain.eu
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 07:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203203

On Fri, 9 Aug 2024 at 08:41, Andrej Valek via lists.openembedded.org
<andrej.v=skyrain.eu@lists.openembedded.org> wrote:
>
> Dear community!
>
> I know this could be a funny question, but I wanted to use the
> "printhello" recipe as a basic example. But looks like, that is little
> bit "out-of-date".
>
> I know, that I can crate a custom recipe, but I wanted to use something
> "standard", so I took
> poky/bitbake/doc/bitbake-user-manual/bitbake-user-manual-hello.rst and
> created an "printhello.bb" out of it. I made some modifications to try
> to make it working.
>
>   DESCRIPTION = "Prints Hello World"
> +LICENSE = "CLOSED"
>   PN = 'printhello'
>   PV = '1'
>
> + inherit allarch
>
>   python do_build() {
> -   bb.plain("********************");
> -   bb.plain("*                  *");
> -   bb.plain("*  Hello, World!   *");
> -   bb.plain("*                  *");
> -   bb.plain("********************");
> +   bb.warn("********************");
> +   bb.warn("*                  *");
> +   bb.warn("*  Hello, World!   *");
> +   bb.warn("*                  *");
> +   bb.warn("********************");
>   }
>
> +SSTATE_SKIP_CREATION = "1"
>
> Even if I made these modifications nothing has been printed in terminal.
> So the question is how good is the example?

You need to look into ${T} where the logs for the recipe tasks are. Is
there anything noteworthy there?

Alex

