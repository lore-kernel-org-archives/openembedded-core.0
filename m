Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB5DC77B78
	for <webhook@archiver.kernel.org>; Wed,  3 May 2023 12:43:09 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.17993.1683117786649325967
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 May 2023 05:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=PW7obHGN;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-4efe9a98736so5841049e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683117785; x=1685709785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nVHfCXIyFvORIt3Gn4qsf6HzAo3YerkWx6GVGBdqvpw=;
        b=PW7obHGNkJe7AC0qo8dGErb2uJmQDLimlB4+pUbbBZIrC13pCdJ16A7Bah1k/0vzL/
         OZi3uC0gBml3ZKaXHLaUU1KpFjn/beSdTWNHXuIPAftW0X4vLeBmaDfboBqqeXaBEpuQ
         NDZmfs9WVuBCa0YhuMOawkGWvyvbfeJyAfFLyR2DWo/xntXqfczBq0dx4NEAEfYeyNXa
         +Z8Ayz0sRPnL6WhajemLMux4BKWSJrmZ9wYY1ZErZtr9wuNxvDT0rgfLcNiX8B9hLyar
         bFjqLEDZAcrcsugkHZfcNVrC80T5xyC5wMgGTuMRhtvZdfNU48F/IGBmOTr52f+W3ktK
         EzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683117785; x=1685709785;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVHfCXIyFvORIt3Gn4qsf6HzAo3YerkWx6GVGBdqvpw=;
        b=YV3nCQMM4FBUhmgkA8V5SvQ6yBpj5RQBzpyI0Pg1nkb1SgzNJs1UP98TvEm2Zvmtbx
         NJs5Lku4X0X5yTkvKjFxfP45mVIGp3+Xv9q7P0IKNM1Lu8Pi/pOCJJTnfjoNNzlfwybC
         MKFD2h8bHU0/tiWN+JcLC6zeUojPpRMKc9fKhAQDxpj+H5J53PqfUHMxUeo9XAgN17ND
         iJZY2cYV9zWM8adM97nqGIcphsYvMQEz/IpzjLayVJ/KYhRTRBjV9kebNWVooOzuxF71
         B7GYkEvHbuHf/MTpp09Vz6YKB1EqfUxQ6vYPNQN0KnOEIbTxIbzcgvsJ0zkp2Zl70pPb
         m+tA==
X-Gm-Message-State: AC+VfDwFFCVqhysJQUrNgfrJnDjQWF4hmPQTSVYV1AMgBxuTei66LewK
	XZFJN5YYGVbZVZwXDMdhIt+/uWmjtEnrwG9Nnbo=
X-Google-Smtp-Source: ACHHUZ6NBSjlwcKnYkmm8EOUUNCfdcMxf0Cgr5GxxtOllaK3Z1mjZOnI3ES9rGLu7PK2KbFKi6aggFqh1C54HjtTQtA=
X-Received: by 2002:ac2:52ad:0:b0:4ec:a48a:28c0 with SMTP id
 r13-20020ac252ad000000b004eca48a28c0mr886051lfm.25.1683117783238; Wed, 03 May
 2023 05:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230503095239.2487980-1-michael.opdenacker@bootlin.com>
 <b8d70b39c6cfd3127a6871f6666e86de0eaecc77.camel@linuxfoundation.org> <fe25f670-5d6a-45a8-fdd8-301c44ee7e7f@bootlin.com>
In-Reply-To: <fe25f670-5d6a-45a8-fdd8-301c44ee7e7f@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 3 May 2023 14:42:51 +0200
Message-ID: <CANNYZj81SkyZ_vZmeR4xvOSBAMWihxpravM4LB5sO4Uauc+6iQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] bitbake.conf: add "xz" to HOSTTOOLS
To: michael.opdenacker@bootlin.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 May 2023 12:43:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180817

On Wed, 3 May 2023 at 14:39, Michael Opdenacker via
lists.openembedded.org
<michael.opdenacker=bootlin.com@lists.openembedded.org> wrote:
> Then, we I ran my tests on a fresh Fedora container, bitbake didn't warn
> me but "xz" was missing, but this prevented the uninative shim from
> being installed. It seems that at least on Fedora, "xz" isn't pulled by
> the other host tools we install.
>
> I guess most people has "xz" anyway, which could explain why this wasn't
> reported before.

HOSTTOOLS is used to filter tools from the host in $PATH, at least in
bitbake tasks, so is uninative extractor bypassing that somehow then?

Alex

