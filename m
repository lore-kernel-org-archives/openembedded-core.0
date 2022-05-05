Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31BDCC433F5
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 15:19:18 +0000 (UTC)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by mx.groups.io with SMTP id smtpd.web08.12399.1651763949091378115
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 08:19:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pVaWj1jK;
 spf=pass (domain: gmail.com, ip: 209.85.167.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f47.google.com with SMTP id p12so8037210lfs.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 05 May 2022 08:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V++yNf2VVyvwgQJ5wVyGromCxoMNRjO4NWSVomHJ/gQ=;
        b=pVaWj1jKpdUqxEZUJm3uP2lFihNDZU0MdiJaa/FsF4OS80QQrnjB/fnPEsDAqrhsEW
         F39IQ93u8Rz+bSPEkEzaWLqUgoezg2ZrIRoWQdDlkihmViXhXANzJFRAshXceWbVja+i
         h4TRrjs3hFrVX2ugFnbR4T4iJjLUyDEJ17ERw8m0/fHXJm4aw6iWeOWZb+JiYdQW063q
         G7YqnRrfo8vsyfG2TfVBNkKylTPToip+6DTzoB2zx9AVvbcbLs4BE0K6GyOPbADyKMuI
         1JhhkL+0aOz2UhcowVboXt2jWICqzutFuYI7tFzDUf39LJReSoJZWzYzB978VP/JLbHl
         XpgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V++yNf2VVyvwgQJ5wVyGromCxoMNRjO4NWSVomHJ/gQ=;
        b=GTHeBGnQK4ZtWlQPYsFVHeuNw2YXn7rPh3FCKyUyQBsdQnDCWwD3tu3Lwukr4YssFC
         FA5vEK9bRgzb8YqqeByrQcckYSrxagNyCh66moxrPsSy2XJ91RCRzZvS06wh2HzjFaMd
         oVRx7KXDOB/PdWXmvhGeoBiNP0XU2OCEWmxMVpx8iEcgBYDQnm0icaU428BdbZgD9Ecn
         I4nW2YWHt1C7156Bb6L6+161YCVwDbyxSGvOr/9MwKGS+crk2Fqo8JBFSsNdAF6jr+PP
         r1NU5POXjhMyD1dnnGlO/9Bpm2NZ5ItPXCLpgcUYzW3oWnFHRE0IEjatZ9oDL+OEVP9c
         K97A==
X-Gm-Message-State: AOAM530pooe1MZyW0uM+2ltCa8p1/TyAZ/nyl0UqWwxLqTEqUIeFz3wU
	DGauObzjIBCvt7IftHaNDQMjIATVP5wagfa5w3A=
X-Google-Smtp-Source: 
 ABdhPJwi904OmNd4aSZQRYr1tQ7+aJnKN865Z8SifVwjeaau8XY6Mvi6vTQubxwrB5trP2/58hml3ZlAN6+KsYSRf7U=
X-Received: by 2002:a05:6512:3047:b0:473:cf43:6d8f with SMTP id
 b7-20020a056512304700b00473cf436d8fmr3871667lfb.380.1651763946435; Thu, 05
 May 2022 08:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220427084009.3406717-1-alex@linutronix.de>
 <20220427084009.3406717-18-alex@linutronix.de>
 <20220505155758.2838a016@melee>
In-Reply-To: <20220505155758.2838a016@melee>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 5 May 2022 17:18:54 +0200
Message-ID: 
 <CANNYZj8t3eJ4jugk0TR79E_RgcKJdx_6Od_ygovRE+O4-GUVYg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 18/18] stress-ng: upgrade 0.13.12 -> 0.14.00
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 15:19:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165303

On Thu, 5 May 2022 at 15:58, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> Il giorno Wed, 27 Apr 2022 10:40:09 +0200
> "Alexander Kanavin" <alex.kanavin@gmail.com> ha scritto:
>
> > Disable apparmor via empty config file creation.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>
> We have a build failure while testing with this patch:
>
>   .../ld: cannot find -lapparmor: No such file or directory
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/5169/steps/14/logs/stdio

Thanks, I just sent a followup patch that should address the issue.

Alex

