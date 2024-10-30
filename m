Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 045DDD6B6CF
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 19:40:31 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.24146.1730317228478980444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 12:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=NCVw7z3t;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-37d808ae924so157938f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 12:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1730317227; x=1730922027; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=O4zn8PTyCy2ackkK2JlSVuE7Ji47KWaCFacJ7E3SZOc=;
        b=NCVw7z3tQliluJsjm/zF/7YiCgwC+9LYnNjHYJ2ToZP+OkCuvmdN+ssu05zrRcwJN7
         QaZORbLhfWjxAO6zX4NcWxHZjtSeMeZrTc6IlHIo2e9PlStewjz5y0cSNiDxMFkd6Nkf
         X85iqJprizsdilIz/lR4SBfId8YeklkJcMsEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730317227; x=1730922027;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O4zn8PTyCy2ackkK2JlSVuE7Ji47KWaCFacJ7E3SZOc=;
        b=bogk/1haiGQgGFUKjKaKWC1nAF6eqgmn29pVvFFW4yOBgF7KF5CmAsuO4rnHPqCTlJ
         JD3rQ4dbKP3Q4HFegN+dW1fuUwAXegcVUP4yCE7BfVERzzbOAYDI/Ed2NgNXlJIFcvUy
         Ma2IFtScg5I9vnwOyjUa5l09ICiH+CL/WoA7cpP6m+Jw5kbbnyd/JaK3ayzbHpATj8Dm
         FLwp374O8S6XI6k0UgjvRmIvkaoUZDwD7zM9aNRFns13D38MkrJ6VJqlWJVmBcqySDRz
         CnOJfi0fDTC042VgyPsGhpI+jzp3ffyO0bParckj5ouh2pmrCm478dFjNby2wui7C02g
         UmvQ==
X-Gm-Message-State: AOJu0YyUAIMU+RFCDUlfCPCqV5nWmhx3EZFQCejpjRoqe/dVnKIWp9UW
	iDf0oQYepJ3FIWEwwxeZNqx3qBLWU6bM5h00wK7ZGcJBhAiTcdvcmqub5HXndRw=
X-Google-Smtp-Source: AGHT+IEtAdbSp5Z0s1KHgeqN7Z9O3sHZzlAv4RfNdE+c0e4buSY/utKW8Zzee04dMowMrmiox2dWAA==
X-Received: by 2002:a05:6000:e88:b0:37d:4f1b:359 with SMTP id ffacd0b85a97d-38061220a5emr14215726f8f.53.1730317226857;
        Wed, 30 Oct 2024 12:40:26 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:65f1:8463:55dd:142d? ([2001:8b0:aba:5f3c:65f1:8463:55dd:142d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1c4d8sm16204648f8f.2.2024.10.30.12.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 12:40:26 -0700 (PDT)
Message-ID: <5058dcd07acb650e0add0d5d828d77c996fc509a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC OE-core][PATCH 2/2] go-runtime: fixme: buildpaths
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quaresma.jose@gmail.com
Cc: openembedded-core@lists.openembedded.org, Jose Quaresma
	 <jose.quaresma@foundries.io>
Date: Wed, 30 Oct 2024 19:40:25 +0000
In-Reply-To: <CANPvuRkm06vDmUuFieQLGUo+brfZh+BUo3AzKOQH-JHCCVXxVQ@mail.gmail.com>
References: <20241030181725.214754-1-jose.quaresma@foundries.io>
	 <18034DD8CF292769.12341@lists.openembedded.org>
	 <CANPvuRkm06vDmUuFieQLGUo+brfZh+BUo3AzKOQH-JHCCVXxVQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 19:40:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206561

On Wed, 2024-10-30 at 18:19 +0000, Jose Quaresma via
lists.openembedded.org wrote:
>=20
>=20
> Jose Quaresma via lists.openembedded.org
> <quaresma.jose=3Dgmail.com@lists.openembedded.org> escreveu (quarta,
> 30/10/2024 =C3=A0(s) 18:18):
> > Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> > ---
> > =C2=A0meta/recipes-devtools/go/go-runtime_1.23.0.bb | 1 +
> > =C2=A01 file changed, 1 insertion(+)
> >=20
> > diff --git a/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > b/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > index 63464a1501..a9a4e2a044 100644
> > --- a/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > +++ b/meta/recipes-devtools/go/go-runtime_1.23.0.bb
> > @@ -1,3 +1,4 @@
> > =C2=A0require go-${PV}.inc
> > =C2=A0require go-runtime.inc
> >=20
> > +INSANE_SKIP:${PN} +=3D "buildpaths"
> >=20
>=20
>=20
> Send this as RFC mostly because of this.

That suggests it will fail the reproducibility tests too :(

We're going to have to address those issues really. I guess the patch
gives us something to start with and collaborate around...

Cheers,

Richard

