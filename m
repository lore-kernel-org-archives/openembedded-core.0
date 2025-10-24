Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5640CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 02:25:56 +0000 (UTC)
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
 by mx.groups.io with SMTP id smtpd.web11.736.1761272747321548110
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 19:25:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZmlEzczU;
 spf=pass (domain: gmail.com, ip: 74.125.224.53, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-63e336b1ac4so2592824d50.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 19:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761272746; x=1761877546; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hh1ngnxdguTgYTr2+kdiBBtJ6mCMydO2d2o3K/NFKNo=;
        b=ZmlEzczUm/7PEs/nC/B/EKSKkXnNxpcBkOfJSA/txaKUTuJXhcRcsrO4eEvcaznJPf
         b9ZIWHu4XlXSIrrre+jBMJIpbFknnFqzfRQJzXdTZdC1Z8DSSgR6JcyMfX2v2fnXZwjW
         xwnH70UTwpZ9yqSD+TSCsRsQq/u/RuobaLmUUyF7/+NNmvEgLcH+9EiEeGOd2Eo0UIdY
         0SY5iijlthwmjK6JF3abXZHStHhjR5v/f32CWXaG0z1p0XGpgltvvAg6CUpi6oTBPv2/
         Sy3syAxb4vAES/1MwKdm9Bm91pP3mZLULKn+wqGfABc2OgO00jYiss6lwDlpkq8Xz3Tg
         h0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761272746; x=1761877546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hh1ngnxdguTgYTr2+kdiBBtJ6mCMydO2d2o3K/NFKNo=;
        b=jdFpRarzbdcT7+tbA8yYwLlJyqoCO0rrUHWCg73D+sFX2JJrxYJRGVPCd4JI7oXhs5
         g02sNq/E+FFmbNl0p6YbOTTLlAa931mQUr7a8rHpBk+2a2B5eZ5pz5dVtKDJ9ogR49he
         9x8UKjUwp3tQUXaEbiP1k6g3ZYLml1E65vAqR/eIVE/SAdRUltoQkqrCi3E2Jyavklob
         ONhK1V2YdZyBNUZmGJSG7UoO/KGOWDkJYwj3gevjS4cghT596b0UQCEagjqUY9b75+LM
         0mHyIC4dHqBgz48r9gYKS+rasIQRPdxXapWgS91Vg/FoT1y7VwGmJEWk0E24ZCag0hs7
         py/g==
X-Gm-Message-State: AOJu0Yx6jAX29bUVh65h8vE7DFSw/tirbZe+08ql1Ce7o9Vu+zyTDMm/
	0FjyNeswu6bT7xkCEIgrNKdU9bG90SeFh77ZD1jAUgw9ljCvkS0OfDSr30kUPoBH0p3RGEMO2Xf
	HSsWzDE/MEtdtj1ELrHFfozl06MNMQDE=
X-Gm-Gg: ASbGncuPE80aIKiCGhYn5Xs2/7RYgzhys60hwNXYVROaTEvpf08nblLBMpTysqMq50/
	mXS/qHuq2dPskf4F69xAmJAVI6mNaRXgiaA8MTPS3yQJCW0uFHziO9q0ldnyHiIb6/abtiIGrH/
	Qt+mPFaAMVd42corNEpJUKX9+olTISqjowxs96GHrESRTiiXLnFuBFNRUZkiTu3zLKjjHasLlme
	d5m8Ly40c459cVfX4KwPhfgbppCtXEuNcOyROpiL1fIPoDci5J0oUUy5xws/9hmqBTnsT2QHytQ
	K/88LlDk4S02iY+M0AGWUVEp1lpdjfnJHDB7/MkklYOHBO3CogbkmMz2SR2aYJpFUI8ylD+HupJ
	412WHNNDbYyEIqkeAMGiL8w==
X-Google-Smtp-Source: AGHT+IHU+dM/gk/NnRjSggy/nVMcw7O1hb1tI6rZtIkwAda+02ediE6fmizIDdEhteAscGMpz0A9FWyXVJKeFnn4Fk0=
X-Received: by 2002:a05:690e:1247:b0:635:4637:116b with SMTP id
 956f58d0204a3-63f42b2641dmr837679d50.9.1761272746443; Thu, 23 Oct 2025
 19:25:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251022050810.1572184-1-raj.khem@gmail.com> <20251022050810.1572184-5-raj.khem@gmail.com>
 <F47FB95C-77CA-46C7-925D-DC1BB0C078A2@arm.com>
In-Reply-To: <F47FB95C-77CA-46C7-925D-DC1BB0C078A2@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Oct 2025 19:25:20 -0700
X-Gm-Features: AS18NWAPuxRrcmo9V9Ym7KqElNaQe9UAsDkqziYOEaamNdesHrdwcnx2H_AmrGk
Message-ID: <CAMKF1srq0fgYanAmSj0cetgV5jxr1A2UYVZk=SVXYTO1iGVaAw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/5] elfutils: Always use gcc for native compiler
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Oct 2025 02:25:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225277

On Thu, Oct 23, 2025 at 5:17=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 22 Oct 2025, at 06:08, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> > +TOOLCHAIN_NATIVE =3D =E2=80=9Cgcc=E2=80=9D
>
> Can you add a comment showing what the error is so that we can test it in=
 the future?

sure. I think it will be good to fix them but until then some comments wont=
 hurt

>
> Ross

