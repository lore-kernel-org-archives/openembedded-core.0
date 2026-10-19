Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2014.1792435479241703997
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 11:44:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=3glZiEhN;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1682bff3cso11554985e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 11:44:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1792435477; x=1793040277; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=b1WAOMYg4SWGKb8G/miZf865kjR5Ru91tUHcGjO9IoA=;
        b=3glZiEhNapXugJ0San6mypGZoEg5P7uvcU34QpTfJ/YSc7FPVY1IF+m+vzcrw9ijo9
         mYDpI5DYfhvpekwQ/iP3ORfeTlJFTsf+TbG+AUeQpxaH45TDwjIsFeOlcaXPtYb0yp37
         4J/zQsDUUip+GYT0HFdiF1hbeQyt3GFoRK4LQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792435477; x=1793040277;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b1WAOMYg4SWGKb8G/miZf865kjR5Ru91tUHcGjO9IoA=;
        b=npVYZBcadK/UUm8kqfhfwz1GDBbJG3FDdlC2HLN5FQmFdNMyDuM5XpRJaZt2dvjqQX
         fDmbUQnUPvd+F5wbnOe8dDRUe1s3y2cksGwmOFil7XQDkleKYUsXaojVIaq0bQSr3kSA
         eQypXaTbkcrW5+lMqmTfnP/EQI33CwNQlUVkqop9aCfBYpaJhUGmdOaR5umfWP0sHd2H
         nHs8R+oGGQSasoMiOj/HRgP2TwuFi8d8r/YeNTJREiKpv0bvQn8jEUTbmRlPf4lnnibJ
         ReNImPdTrqauqqFkGuJIUwih5hMF1cSC3iCLi0VFTbJeShsDPxGW5blhwaTDKN/zIH6j
         L7zw==
X-Forwarded-Encrypted: i=1; AKwUvByVRUSCqzoDeuuWglnI6os/Vc9B1vJUn2b7KrzSZ+bQXBr5AEQ9f0C0r0H1ye+CjQEOd2cehqI+eMBLLs70w7XVDA==@lists.openembedded.org
X-Gm-Message-State: AFq9FYKssw1S5oeS8gVAD6wyW8dUqSW182eNQVpdr7Ujtdd18wFKHyZJ
	kx4nve8NZi5qm+upGcU2DcDA+N5S76HBOu39JmCcKjhl2DcW6pkXoaIeZIwP/459QW8=
X-Gm-Gg: AYBFou31uPf0uk6LSHwPMOyK8H+Arp3jDy82Ue3vUqpXVO9J0ARMRSi7ZZ3F1k6i89h
	/SDLCGIgCd+if58A2qQoh6c7BP4JrnISxj7HshRfmXOHRfkL/jKATLJc2fdgtPqmqWdsBSreglP
	C3tb6V38YFkug+8eLcaRmNTtwdgWhtWh74y4WcOTaGEzhEbBh1UMTODPy1RlmqXVrZaV7y7NslN
	QKv41pMJdQDYNDtW5UNeywW3Dofk2nc7vbwgr1r7hTy4xXwgtfzTHnCNe0Pz6QnUCTwEFEO4mc5
	RTq33jFzNWTriz7tXgveDTWypsYZwGC9njN3109Ftb6eUPiKBke7FXd63KguNL93Fev33LsbJMe
	X6S764zLi7XqoB5EmhuDsIyJ3jzr0U/mMdrTEXNu/txn4AkFV3EJxaFV0dlULvoHmCO/8BQRgx5
	WPGsNe1SH8Uy/WhL7qbZaYVm4vyNn6dosMrMilgeJxwrlVRtHR9wjn5EkYKNhlN3blYutJkck00
	0b4aoamSrs314Rvv14SRgi99Ol+jH/QAo3EtLHMkZm197hHj00eappwiQEujw==
X-Received: by 2002:a05:600d:4447:10b0:4a1:7d9b:d4ae with SMTP id 5b1f17b1804b1-4a1d75fe19bmr134102545e9.5.1792435477475;
        Mon, 19 Oct 2026 11:44:37 -0700 (PDT)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2c1e0e6sm15335425e9.0.2026.10.19.11.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 11:44:37 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 20:44:36 +0200
Message-Id: <DM91CIFZHG6C.1EYHKXIN5ULNT@smile.fr>
Cc: <xe-linux-external@cisco.com>
To: <hthakar@cisco.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-106584
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261016035236.442896-1-hthakar@cisco.com>
 <20261016035236.442896-2-hthakar@cisco.com>
In-Reply-To: <20261016035236.442896-2-hthakar@cisco.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 18:44:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248205

On Fri Oct 16, 2026 at 5:52 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHIPS=
 PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
> From: Hetvi Thakar <hthakar@cisco.com>
>
> This patch applies the upstream fix as referenced in [2], using the
> commit shown in [1].
>
> [1] https://github.com/openssh/openssh-portable/commit/aef20dfe30e68a4699=
11a229b9117e7134766311
> [2] https://ubuntu.com/security/CVE-2026-106584
>
> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
> ---
>  .../openssh/openssh/CVE-2026-106584.patch     | 39 +++++++++++++++++++
>  .../openssh/openssh_10.3p1.bb                 |  1 +
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-10=
6584.patch

Hello,

This patch (and a few others in the series) are included in openssh 10.6
but blacksail only has 10.5. Can you send the backports for blacksail so
I can merge this series for wrynose?

Thanks!
--=20
Yoann Congal
Smile ECS

