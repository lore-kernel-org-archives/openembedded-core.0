Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5D5CC001B0
	for <webhook@archiver.kernel.org>; Sat, 12 Aug 2023 22:53:52 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.76228.1691880831835684895
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Aug 2023 15:53:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YVFu3Tom;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fe2048c910so28526885e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Aug 2023 15:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1691880830; x=1692485630;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=anDUK7Hy1RZt+wpsN//7PxkzWli69hSM1jDJIDSoUmk=;
        b=YVFu3TomR0GybAUxVhBQAOlv70cFgEA6trqhPaXj2df2zQk702xLlhfJ2LeGryayb2
         Ykwud3L+QXRRzkGHIN+utEPAuIQfmEwoM6fakNMkB8wECbRfAwdqTUftC0c1Hcqvr0MW
         /45KxFdLn+vpclLoM1FjzN0bkCUPjeQPdDEdA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691880830; x=1692485630;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=anDUK7Hy1RZt+wpsN//7PxkzWli69hSM1jDJIDSoUmk=;
        b=fxwC4SmzNHRhYOVR6cgpIc0yIO5cvFYCAuFp7le3xRb16A7FDazddsK155QAmfkfHB
         2cpFMPHYcqT0q78J+1y/5AeFgox7xuFf18TfX+FGLt6HEjcsYJEWDDUkImhtBDKQJe0/
         nQv0WJES+8ejAMCEJiGmq2jmoHZsH534qI4aaYyWF0Iy6OXg7FtoOvXM2r0kkYJQ/4m0
         vGeab/hm2qdv+EZ4wQLouSlgp8ygQSjnqMYro47gRmhXX2yA+tuPHT8kD+PpxMqwKFqO
         0HtqPqIO5FRUIPW7hc2GMYkbQry93I4tk864j9LHjLbr0w1Lrw6BATIe4C2GhtSWFDxm
         LAsg==
X-Gm-Message-State: AOJu0Yy4dB+236BhmLJNFLVRiiq7t2ml0eNJ1CFd9Y3rW1VEU5/kPt2J
	HQXzBlkuho0qxerBLZijotBfzQ==
X-Google-Smtp-Source: AGHT+IGL/WVhASSKoQIQxqsr/k33YR1uQfyKpPapbsFf/RNLs1Y2Ehr7yk1U4xZUiorEjEdzYFlYlg==
X-Received: by 2002:a7b:ce96:0:b0:3fe:1b9e:e790 with SMTP id q22-20020a7bce96000000b003fe1b9ee790mr4805570wmj.2.1691880829538;
        Sat, 12 Aug 2023 15:53:49 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:17a:7286:2cf2:8a86? ([2001:8b0:aba:5f3c:17a:7286:2cf2:8a86])
        by smtp.gmail.com with ESMTPSA id k1-20020a05600c0b4100b003fbb5506e54sm9542943wmr.29.2023.08.12.15.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Aug 2023 15:53:48 -0700 (PDT)
Message-ID: <8755eee162bd115e370593e5b5901ccc13f12cc5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH 0/3] Introduction of cargo-c class and
 recipe
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Frederic Martinsons <frederic.martinsons@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 12 Aug 2023 23:53:47 +0100
In-Reply-To: <cover.1691851365.git.frederic.martinsons@gmail.com>
References: <cover.1691851365.git.frederic.martinsons@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 12 Aug 2023 22:53:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185861

On Sat, 2023-08-12 at 16:49 +0200, Frederic Martinsons wrote:
> From: Frederic Martinsons <frederic.martinsons@gmail.com>
>=20
> This is an RFC for introducing a new class and recipes that
> help building C-ABI compatible header and library around
> rust code.
>=20
> The third patch is not meant to be merged (at least I'm
> wondering if this is really usefull in oe-core) but
> this could help the review and comment since it
> demonstrat how to use the class and for what
> purpose.

We do have meta-selftest in oe-core where it could be added. It is
really helpful to have something to build tests around, at least
initially until we get real world examples and it is no longer
needed...

Cheers,

Richard

