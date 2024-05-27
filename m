Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 877F6C25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 16:28:35 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.1467.1716827313029217745
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 May 2024 09:28:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BNPQN0iP;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e9819a630fso11002571fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 09:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716827311; x=1717432111; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f/a4jRn/HE8f12Svfrvl57nJs+QZyRKrTsIVGea6Un4=;
        b=BNPQN0iP0aC/XVGRPYBfJbJfgURnASrPWKHDNKchkqN6Xdl0zZs0naM7zT0g3HayUU
         F4F8iUht+VjyH81AKlnfinIyuXNlZGTiO2jXRUkSMse0+3WG6fV2vmxev2ApqQpp+P5M
         agl4GD4iygqdSYksACIlw+uvM5sat8MuRxWT1KDGecgKfSdRsSQfuX5nwt94e7rzJdow
         Pgp/DSgO+paLSSBGfktvwuIuDgBn+H0YuEY9nFzWDqA9YOqSU1KcBW5nLknr+1nhHfv1
         YH+1dVrl8sSm0gawo8akfW2lZTpfE7epHScagOfRJafXINTgol437g0/u93yByc+i/Nl
         iX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716827311; x=1717432111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f/a4jRn/HE8f12Svfrvl57nJs+QZyRKrTsIVGea6Un4=;
        b=gnh7R8hPaLL45haVJhZxm2K4S5V5zNOSuRTFaurcO9N7EhCQzQlfHDOxYDfd8DVUKa
         uVeF7VNNzJgRBV537ugyfl3g11WtTWuD8sxN1moKpVyE0vVTtHGRwMut1O0OPeZdkdL9
         +ojvf7itcciXWED+/2uPxkGi5dwJscHAiykcyRJmvpa1Dc8YF2mfiFRUUgtdNqkksakQ
         FD6xj+8Os3CxatFrUvHST3eDiZE0gjKXoVabx3NMQSG5Ywd3rboqDFW0styUvkqA69cw
         ZMk8Q7Th2SIQmTz+aHCZHSKrZPPElOSpc3TUXKWqamG028kbqUTP9s0kG11olTVil5rO
         EqLA==
X-Gm-Message-State: AOJu0YxaCYf7QP2mpQe3pcLOjqirS7rdXH82IcOUez/4H21I4TXjAWC5
	bk7hRuQmIKI6/hAN7L6GLPD6QEKiXa+eTWVrTFSrfVSuv4/fXmhn2ONDYtkjhSqh4FbuDGXoe2u
	Vv6mt1YE04mh+vIx55ftMFxvbygQ=
X-Google-Smtp-Source: AGHT+IFh3/ecVVJuf52LFTqejj+TxhnAEMBkrE7j4RbXBbLPKzW4JV+SXHtQMsTnfO1CLzmLHjmIhYVQ0KffQFjL8A0=
X-Received: by 2002:a05:651c:4d4:b0:2e9:61c7:cad3 with SMTP id
 38308e7fff4ca-2e961c7cceemr73796071fa.25.1716827311098; Mon, 27 May 2024
 09:28:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240527161104.2954913-1-f_l_k@t-online.de> <CANNYZj-kvU_f8wxaRa-PN9DCqrfs4NZN5tUhGQueZfaavJZXMQ@mail.gmail.com>
 <O9K5ES.AUZUQVSU6DTL3@t-online.de>
In-Reply-To: <O9K5ES.AUZUQVSU6DTL3@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 27 May 2024 18:28:19 +0200
Message-ID: <CANNYZj-XCEK=-EQNZ+R9vrQWNWtngTaQRKQPHv_M4-pJB7fZtQ@mail.gmail.com>
Subject: Re: [oe-core][PATCH] ghostscript: update 10.03.0 -> 10.03.1
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 May 2024 16:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199911

On Mon, 27 May 2024 at 18:24, Markus Volk <f_l_k@t-online.de> wrote:
>
> On Mon, May 27 2024 at 06:17:31 PM +02:00:00, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
>
> No. The expectation is that patches are submitted upstream first. Because otherwise they won't be submitted at all, most of the time, from experience.
>
>
> I will send it upstream if I'm a little more sure that it's not nonsense. I was hoping to get some feedback from someone who has more experience with C code.

More research on the error is needed I'm afraid. The patch does not look right.

Alex

