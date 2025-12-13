Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C328D5B15D
	for <webhook@archiver.kernel.org>; Sat, 13 Dec 2025 12:44:20 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4800.1765629843502136346
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Dec 2025 04:44:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SFfBDkku;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-45391956bfcso1691494b6e.3
        for <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 04:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765629843; x=1766234643; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ThlSOS+gWPru5auPS/sW9okYMtyS2Pj4KL9g2r2tD8E=;
        b=SFfBDkku5FzyubHNhcx8Fj8Ala6yje+f14OpOIPvAa/UuKKAMTTAgpFuidgKIlGx3w
         iuaRNTMvxs0V17LpHX3l8xtNNT5FSJndY7IpwwrakW6bKx0SUBKQCweZKZjjz0dJlkTA
         SPg7mMXD3XCxEQsYy5U/b+0QkJHM7ruIZEZPjNdR92KCsHR0wOHtiCABFf5/mdtHTSzk
         8pnFy0FqELf4Iik+SWA+CCeNTcywYRaIWwI1qVvJsJqv5ibME3S+UqU87chan1dxGSS8
         iieBLT1cKqjwGtmmL1MQ5TyZLSQFApTwtuBEqZK3rs3Pyo+Zx1THxZiB7xS71lsgFl5N
         lPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765629843; x=1766234643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ThlSOS+gWPru5auPS/sW9okYMtyS2Pj4KL9g2r2tD8E=;
        b=bagGRZl1hvtlEN2TUr/H9YxMx/yOYE/ckYzd/kWvVpbOhoNYpPdlhxw7ukuwz0UUp5
         nTpg50P3UQ393lihb/Ky0LsWFXp+HFlbkt/4y7y1+iUs+BG8ssFLAQJDfyj8YE1ZwwkD
         FR4vHRdE+Ud4gohgWAL0S0a2G33Ojc1iOKe6mVlfsXm6pWCCovBaEmB0muImN9ghCF8d
         gd0NXlFt9CbfpGkV1MMWpPcoFqBmeAaD4p+LpK42khrLT3Kv1lhvEEZvoE0KaCu6mEiS
         7WJGiSZiDVeKEn880oRaHWwj7jn7ieniRz/8l9ytG8bcLQPf00HY3rALBBa3knJN++KU
         E5yA==
X-Gm-Message-State: AOJu0Yy4FV0JcS1d3+Migl4NR3alHUx777t7V2xf78GONMuXp8gvElG0
	mXB4fj5gxRwrZXzmhRM/+QJO/KZKf7kOrERzi9nVsFM8rRhhbl8mwY3a3R5rbn1mvmIBu0D4LSD
	aLGQFFlDWu+MbJ/t8hj5mbjqtg5AR90s=
X-Gm-Gg: AY/fxX532ipFN1zbUq1Vyq1LsyD4MzJdqcIIwAZDs4frdUiKOn8jvqiFjjvW+gxE9P8
	JOmMBiXZsbvCyh62AB16ughbq94mn2Yr2KoP/NKtQoFeq2WYSF2p3BHlVFI9X9hVs19OqYrw+rM
	LJ/I5GoQDvXeH3k4t6dMaqVOyvT3A35bx6/Tza4ZuBbW7b8hR9OQ9VU/zXfw2VL8Gu0qiz384QV
	iL62dmVOblg1ovZ6qA9f9NF3e10M+XDZq43Nl6LV7VO5JYpB4REp2LeTSsmRsWAgisnkQfjsQ==
X-Google-Smtp-Source: AGHT+IEmHG2q76QITIWCBioXs/TkZDB5oOFsa1CDyIVFEDte1gnt+9idyZQ2QTwFeVq6y3OrZpeX9Di92Rd1mzuA+6o=
X-Received: by 2002:a05:6808:30a8:b0:44f:6a32:535e with SMTP id
 5614622812f47-455ac81faf3mr2789431b6e.10.1765629842608; Sat, 13 Dec 2025
 04:44:02 -0800 (PST)
MIME-Version: 1.0
References: <20251213095931.2571498-1-ankur.tyagi85@gmail.com>
 <20251213095931.2571498-66-ankur.tyagi85@gmail.com> <1ed25eb81b19a2c92bbb2d802fccc2afd15a8ace.camel@linuxfoundation.org>
In-Reply-To: <1ed25eb81b19a2c92bbb2d802fccc2afd15a8ace.camel@linuxfoundation.org>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Sat, 13 Dec 2025 18:13:51 +0530
X-Gm-Features: AQt7F2qlQk4K2FlKQPdMk7dKg3xR42QscRJO7-4K1BxE0Mg6wpmMfQCwdsn8I3I
Message-ID: <CADySD0ELk1D35KYVsraUy896brQjELFvH+0ng5dq1z2uWG4J8A@mail.gmail.com>
Subject: Re: [OE-core][whinlatter][PATCH 66/67] mesa: upgrade 25.2.5 -> 25.2.8
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Dec 2025 12:44:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227688

On Sat, Dec 13, 2025 at 4:51=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> Why 67 patches to whinlatter? Half haven't arrived in my mailbox yet
> but it looks like a copy of what was merged to master?
>
> You need to say why you think these should be merged. The don't look
> like stable backport material to me.
>

Hi Richard,

Thanks for your response. I will include cover letter from next time
to explain the rationale.

You are right, these patches are cherry pick from the master.

After whinlatter was branched, few recipes in master were upgraded to
include bug fixes.
Intent is to include those upgrades in whinlatter so that users can
benefit from it.

In case either of these patches is not meeting the criteria then
please let me know and I will re-review it.

cheers
Ankur

> Cheers,
>
> Richard

