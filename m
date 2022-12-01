Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C118DC43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 15:24:32 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.46644.1669908264711998628
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 07:24:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CkbZZMaE;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id a19so2304583ljk.0
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 07:24:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bn0dQK6KvdgDtPPE7qRSjRXrHLmlF+A1ZZHnAIj08rw=;
        b=CkbZZMaEuRfTlFL8xlQ6H/KSksBHWhBkPBmiS2Y0yIOcQpu42YsnPPEhlKJl0GJkYZ
         O+c5v/5ucrf/Ju9L12o4j3XnjywwKcRm/IyG5uJ4JucIwNsaVdcbNpcSiN/TZd9c/bjr
         heZF8VOKUH0sUQCz21SlV377ZZM7USv1N3+tSO9G1a5Y3tleeDpiTTzMOfv04390RXHH
         UGmUDpRsySDYsuYRlgQAYLrfA+Ienjk2wUYbOsmQJ4EDvwcLlBvMBAg4FxrtR8apO1YN
         CIU7/9zsOulhteJ02of6lj1FSguba5lFjOg2iRKWLoUesPMTQm8oJxBJR87fXi2+CjlE
         /sPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bn0dQK6KvdgDtPPE7qRSjRXrHLmlF+A1ZZHnAIj08rw=;
        b=S8JO0cy7qleAX2qr9skp2k4i1/Eou5e3vuTR+P7aU49wkXqSrWeV3jpdL4R/44j/Ab
         OgVQmBUFqSX+BbZx39TwQwIxFRTGA1fmnY+HLqAa7vB9IwHAg/nDIVIKteBsDsqPA5Mc
         oHaPt1UjdQv0FfpVWDeq9ikkkeB8CjdS0Di6nyn9pGLbEg19x/im0KUTdmtNLlzMVU+s
         qra6J9weoJbsiMg1+VozoDeakwb0T6nFoe2rbKkg7GaHFeMspPzG41OlS12K0N1cY+5+
         GymNkfWdgGg57UO4f1twRlRBExMLBDdode7xnrJKehUUY2S9mf+4IAnvtPxbXV6PuiHp
         8fqw==
X-Gm-Message-State: ANoB5plQjrVUkbtNzFpPMltyHecYWKgWVnHSocqguZ61sfF47lN3TXGS
	kHj0GWqOxEGoVklFTPkMjczHjFg97HROAh0S0A8=
X-Google-Smtp-Source: AA0mqf4cE3kXWMyaX3a3c9cjYefzzwAi6haCkFPIoQTa0WjR6e/dqxw7tQno9U07ZMoJjrycLl2wvGYcXXOkljfCgD4=
X-Received: by 2002:a2e:3a07:0:b0:279:43be:97d6 with SMTP id
 h7-20020a2e3a07000000b0027943be97d6mr19512542lja.33.1669908262920; Thu, 01
 Dec 2022 07:24:22 -0800 (PST)
MIME-Version: 1.0
References: <20221201075324.353632-1-f_l_k@t-online.de> <0496E9D1-8A87-4F2C-9C6E-43CA4929D17E@arm.com>
 <a695e77fb8a6dbb8d9deec953b2767750aa3bbfd.camel@linuxfoundation.org>
In-Reply-To: <a695e77fb8a6dbb8d9deec953b2767750aa3bbfd.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 1 Dec 2022 16:24:10 +0100
Message-ID: <CANNYZj_=E4wm3UumY41XpVBsM1Zi=z-0WGJgP9mR4-E7Qy5oVw@mail.gmail.com>
Subject: Re: [oe-core][PATCHv9 1/4] graphene: import from meta-oe
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@arm.com>, "f_l_k@t-online.de" <f_l_k@t-online.de>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 15:24:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174112

On Thu, 1 Dec 2022 at 14:15, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Should we get rid of sato? I'm reluctant as we don't have a good
> replacement plan. Ideas have been proposed but nobody is willing to
> step up, propose and maintain something. We have a number of areas
> where we could spend time and there are probably higher priority
> issues. How much work is gtk4 in sato? No idea to be honest.

Here's mine. It may not be good, but I believe it's still ok. And good
may simply never show up, while gtk3/sato/x11 continue their slow but
steady slide into obsolescence.

- core-image-weston[-*] replaces core-image-sato[-*] as the
'workhorse' of the test matrix. The patchset for that is ready, with
additional provisions to ensure sato/x11 continues to get testing.
- epiphany is added to core-image-weston, and visible in its app launcher.
- as many tests for the browser and web engine are run at runtime as possible

Alex

