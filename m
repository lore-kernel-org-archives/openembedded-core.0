Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB4DC61DA3
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 14:29:30 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web10.18791.1677248960043522268
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 06:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kBrzaw36;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id f16so14301533ljq.10
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 06:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677248958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Obuap/RxPXuu3gFyy76XYrkkJMtFP328wcsNRkKRDbo=;
        b=kBrzaw36wKtHba88u9OKzI8LydArdjcaVEZ2QqXQ82OAsmcQ3ZvCPCeeOLT9P+2srI
         UsyDBFZnqKvP9+f7fsG4YBDz0rYtPNHmRQK3CNkqjghLOloIiSEL1Wvm1Hr9aSKfbZtj
         MBedgEh8Z0EwhlgUaS7oDWkh5mp2+9yBbigmY3d6hTDzX47VAsZT7DTVvQp3SoUhC0Ur
         1ZcqjrDDTJl7u3REntXG54ak3cX7anwjwtWKRrT3A0+FtubeD1W4Kx0bDdLjvKzDxAO/
         puIUC14jxrfk9sfS7JWjV7AmU6nuKT4mkmDHTtoZb850jAp50bp+gKV4vf/IK0jiBpLx
         lRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677248958;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Obuap/RxPXuu3gFyy76XYrkkJMtFP328wcsNRkKRDbo=;
        b=l1KZYlmXu9SRBeyfJp/Ia3d4AgQ8R6b/+MEuUHB6ZMd513Tlbhf+OMZmIrtPLS/dzD
         ilXFvzsw5zDf1H6pH8DJJMfVySH026/nJah8Rw+6xJSGk06T7pPmIXGNxBb7LYelwqqz
         CG7HBUDIb29ZjrjRmR4gyPuXhUvWmPs3mNxOWwatcrcMcIOGqdVlvj89eoz/8hlgbtWW
         FPOESHrOMmzsD6j5s55GYkhEMnk8GMsYT6n1nhOW+wWiBZXmFA6KbenN0xSBYLFmkCTh
         Bbgt+xtVhr0gPIxxVHF5mjPeCGElOnqTnTL+ERQBScfxkmN+wmJsQHzXX4joQQUt+RC2
         LlDw==
X-Gm-Message-State: AO0yUKVQAZzTbZj/78aQwzWyCXEex3A9dQdwx6w2mN8434lkNJNkOFIe
	GCcf8vzXvc4SPJlvTUa2UMJipLrQKLbPbx8MJ1I=
X-Google-Smtp-Source: AK7set9gue49ZV3GV88616Aarj0T1ZB1JBtDDRiLMr9zsTgi95kegKIdHEbvKnAiB1iWpV+F8s7XuLF1wL+UWUUANcQ=
X-Received: by 2002:a2e:bc16:0:b0:294:69ba:6288 with SMTP id
 b22-20020a2ebc16000000b0029469ba6288mr6283123ljf.4.1677248958099; Fri, 24 Feb
 2023 06:29:18 -0800 (PST)
MIME-Version: 1.0
References: <20230224093850.3393567-1-zboszor@gmail.com> <20230224093850.3393567-3-zboszor@gmail.com>
 <Y/itiY4MKeIn1JNd@mail.local>
In-Reply-To: <Y/itiY4MKeIn1JNd@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 24 Feb 2023 15:29:06 +0100
Message-ID: <CANNYZj_CczdamSV+ypD8XSBpXC2v4=a1wZ9MeJh2uB=feOv4PA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] mesa: Rename PACKAGECONFIG "opencl" to "clover"
To: alexandre.belloni@bootlin.com
Cc: Zoltan Boszormenyi <zboszor@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 14:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177685

On Fri, 24 Feb 2023 at 13:29, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
> > -PACKAGECONFIG[opencl] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
> > +PACKAGECONFIG[clover] = "-Dgallium-opencl=icd -Dopencl-spirv=true ${OPENCL_NATIVE},-Dgallium-opencl=disabled -Dopencl-spirv=false,libclc spirv-tools"
>
> Are we allowed to do that? It will break anyone using "opencl" in there
> PACKAGECONFIG

It's a part of the implicit agreement that bumping master revision to
a newer master revision can and does break stuff.

In this case 'opencl' is ambigous about what opencl implementation you
get. Curl's 'ssl' option was recently renamed to 'openssl' for the
same reason, and broke builds similarly.

Alex

