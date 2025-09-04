Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CDD7CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 17:44:40 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.1182.1757007871659707405
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 10:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d3USHUaT;
 spf=pass (domain: gmail.com, ip: 209.85.128.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-723ad237d1eso12898407b3.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 10:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757007871; x=1757612671; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RK+GpAfXIRzcxXVR+yI9AS/Qj8Ulj9HOnb4n85ch8Fw=;
        b=d3USHUaTmJPIM9yg9629RGEjZ1hRarBYyOJpH2RzMkKonU2ddQzj7l54uoLDEqzHwe
         MR3WEybxTVjiEG2oDIdDNweISQZRqQ9vln4xPg0RhJS+LoWdxaQRJv5CTEglHMgRuQQ3
         sQ2Y8HloSRvAXGfOLrnHpCxxXRuZyppfwdhAQQSBPDDW6ivBJNJZkXAWfSFf84Vs2KTy
         MKs3RdTjAEcr5x5ShfGRrB2LsLEUZUz08LfLSgFNipxuK4vc6Hl2dDY+JzODv5E+kUE5
         RfevB0A1yog20diYvrdRdZyqdfqUfuunSTOSyhW01ILFH3GV/rYgq+WZhXEtUMalM8Jv
         Bo7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757007871; x=1757612671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RK+GpAfXIRzcxXVR+yI9AS/Qj8Ulj9HOnb4n85ch8Fw=;
        b=pjmpWJQLjFcefYCRN4qJNCE6oprq0v+cGYSKnbO9jXEO+8VAZUfB/+3WyKBs+Xn+HW
         vveOkZoW2C3fh8sdGyCJAuNlbewqOOQZ8sIsuuMHsN/C031/trTW67xwyrOkIh3rW0Ca
         Iwv8CjoTCaYqBu578y5hRKSh4I1HuFnXCwkId7CFkTX7lwCsZlY+4wgueGhqYlHp8EKk
         8riMs1lleOQ7xOdlCXc7x93zeT2LBq2w2Fn5ibX+HLvnl3U8iAUIfeTyZzsM3CKqSuRX
         Bir0YdGTf7pw2dC01i7ZzOhSVOHk6fh1F1CoktV3DAkey+39p3ZRTss/JuLCwMKEjBra
         eFEg==
X-Gm-Message-State: AOJu0Yw+wrfP2lkMFMKDCIx8r/cPCGztiFGYRiCG+0gjCqoyiC9KRyZc
	itcc+nWpPTAdjHAhlaSGZZ4itfrxSaFYHkVdfPcABJ8wfxOsK6btSgKW+iqEnT7hTdOhQdG/23v
	MCoZ097cdi6rnLaqU0SydwKstyvaRYcOpwd52
X-Gm-Gg: ASbGncuPa1YwhlND4NJonXQ3QzfQQdKlO/yZgnoDGoBGQYGgz5gGK9SvlQlf2KtGB3K
	TGtpB2q6IRpjyR2n5rotT6v69IlfVtswz1NtzsgcS9WWrl3yjIGDzDcmzwt4qLwpZrqdDQwUrn3
	htAOzzpqrRZSgGP3e+NZkB4Q8avLB5slPSFGUqsqUwJCW2YFEJ/J+/0fO1Bx3G/TODjkKB6YZYm
	28ni7Yz0QvZDjKyoZUAuJ0VMT6nJfwBH3eW2Vh5+f8b6tMEYNOo4q9QN8WP/2k0snsbp0ul8KLp
	8tpo2XIklB7Cw98T/oYaiQDwY17CC3psq5ESe3Qsy+1ef8xPwtzanQ==
X-Google-Smtp-Source: AGHT+IHaI5GubCcquMDGTKx65pUyxL5OAIWHo3cf8j1Np4sXQRKGp8GH8MOUkEGkhTTw5W//Y3Wbuxle/FbcQR36Q50=
X-Received: by 2002:a05:690c:fd1:b0:724:c055:3cdb with SMTP id
 00721157ae682-724c0554137mr35525367b3.12.1757007870551; Thu, 04 Sep 2025
 10:44:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250823200405.680409-1-raj.khem@gmail.com> <20250823200405.680409-2-raj.khem@gmail.com>
 <133B9C5D-1469-4443-9855-FFFA8360F72A@arm.com>
In-Reply-To: <133B9C5D-1469-4443-9855-FFFA8360F72A@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Sep 2025 10:44:03 -0700
X-Gm-Features: Ac12FXwT6l0bRCTqZYh7drTYDHvY4neQWx8IfYmILtzulxr0k0990KzUxbr6c8U
Message-ID: <CAMKF1soMk8AD1gHu=9LiieMVVKoSuOJxWZ7fjKWVs7L4Ut8rxg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] lttng-tools: fix unix socket high FD count test
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 17:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222964

On Thu, Sep 4, 2025 at 5:11=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 23 Aug 2025, at 21:04, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> > +tests: fix unix socket high FD count test off-by-one
>
> Is this an off-by-one in the test suite (in which case it should be upstr=
eamed), in musl, or in glibc?
>

I saw it on musl and this machine was running a lot of parallel tests,
but it's not happening all the time. It's fine to drop this patch

> Someone has a bug and we should endeavour to fix it at source.
>
> Ross

