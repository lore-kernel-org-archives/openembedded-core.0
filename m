Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A612C433EF
	for <webhook@archiver.kernel.org>; Sat,  7 May 2022 04:43:33 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com
 [209.85.222.175])
 by mx.groups.io with SMTP id smtpd.web10.6775.1651898605139243045
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 21:43:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=aogp4VfK;
 spf=pass (domain: gmail.com, ip: 209.85.222.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f175.google.com with SMTP id 126so7313895qkm.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 06 May 2022 21:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ir1CBfigj3x2JK4kdXkqIDfGp/3Dibh4WKzkUAr7pH8=;
        b=aogp4VfKTIrY76Bp9+vltDgofGlpUF+fZ3za51NYv0o6dA0oz4LKu2KpgPnzzmcd5n
         2ZxUMNemsTHIMUuz0Et3Zn8jUio4a3cX5O9VPAlILw1G4R4zpVHmGx/TpUjmKYKAObBt
         lAQETqpwGKKJnGqRkes0cAPYZN8byyHfNC99+mgxIXuNpPGa4/y/66YEV77BmpfWIQJM
         4bN7jZMvl8Cf5rGcMv16L0LI/QE9kDIzZctkwqaTq9dcJ27uq0ghhWESl+p+HJ7IRfWu
         eXNiLUEzp2gbK1sptaeZ7lxdYpUI2m8bnpz6pnpyOgQTTDNnq5fVXvERohlJClAYzCTl
         mizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ir1CBfigj3x2JK4kdXkqIDfGp/3Dibh4WKzkUAr7pH8=;
        b=QAcLxOjfMEiVYsV0kvkEII0DbVwI5pcJLxgzz+xztUyvUo+q/mT+uClVTdt4Evrr7R
         SUkrF3RvySLj3gqkDVgsm2eFu/c1/0vCNl5h1jAU10ppmZJcXfu2Job5vVzMO7PBc9XO
         gGzA7rYFVlhEPSd9g3jIlVF+/tzA/J/r11dR33B8a35qNt3mgyeow0Yk5W7GFdGD1GUm
         N3u2b5OZ8+y94DInINe5+NXpt3H4yXOm4VKbgKPRr66bxqVzn8V/r86fm+rS2opBnLnV
         uuB4cXqzhiYmrT6Yqd6XLpGyDUQJbDbgMlD9ih6oILBwTKv7aJsmyMqO1Aj0d7HQvrJl
         UC7g==
X-Gm-Message-State: AOAM5336pbkQKv3wGzUD5FNMmk/Om7snLNeb/I0b+EF8UsZQBbHMeivg
	gWSsuu0vHmYnY/AgLCnJKR22eCjda3ehcWScHrrGrifHFIg=
X-Google-Smtp-Source: 
 ABdhPJzUC8WVkELAybmDSCsO1XsZ6hG3RIpNF2RUfNaRf4+d+tKYEIi2jTQn0JFjIKKocZUFyaTRQVODwbZcAApbs/0=
X-Received: by 2002:a05:620a:294d:b0:6a0:1b26:5e26 with SMTP id
 n13-20020a05620a294d00b006a01b265e26mr4741840qkp.463.1651898604093; Fri, 06
 May 2022 21:43:24 -0700 (PDT)
MIME-Version: 1.0
References: 
 <0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
In-Reply-To: 
 <0f338ca1e26012b86f183975252e670f11776e99.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 May 2022 21:42:58 -0700
Message-ID: 
 <CAMKF1srx8pESdLFi6Dv1n4cfXLvvktXbdk_PjmccivxSLAL5Kg@mail.gmail.com>
Subject: Re: gcc12 testing results
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 May 2022 04:43:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165351

On Fri, May 6, 2022 at 8:14 AM <richard.purdie@linuxfoundation.org> wrote:
>
> I reran the gcc 12 testing. We still have an issue with linux-yocto
> 5.10 and edgerouter:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/111/builds/3046
>

why are we pinning edgerouter-alt to 5.10 ?

> and meta-virtualization has a couple of issues:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/46
>
> Build is still going.
>
> Cheers,
>
> Richard

