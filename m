Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC6AEC3DA59
	for <webhook@archiver.kernel.org>; Sat, 20 Jul 2024 11:04:13 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web10.4237.1721473447092178996
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Jul 2024 04:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ck56RZWz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-427cede1e86so17761085e9.0
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721473445; x=1722078245; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AJFKR5dpoVz1gnTO2EFvsOVtP3P1ydA5j2o57zvv+Kg=;
        b=Ck56RZWzODMxk4m2x724W/pyrM2iEtlSWe8W0fIKXE497KqTc0y0COD5WevcqQ0QlQ
         6jfF5ksILrmgRtYwbCtEEXB34/2snSt71E1tu8NphMeIUBrcCwMJgc1KlXdsPtcA5IQ+
         ZKqd5YjwL1/p/7fAC+5m9+UHSHL5bmd3b+X5A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721473445; x=1722078245;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AJFKR5dpoVz1gnTO2EFvsOVtP3P1ydA5j2o57zvv+Kg=;
        b=skXEYw7U/RojjNee/sUAG1WsKOMzq8RCrDpP79JzsDtG708ZZgJtBVZZeiz9E/Vm1J
         W9xfexJcyjTSmwQC/CFwA+vxlg1+p+8C76gJTsHJpdj18PrRAKEUa4c9s/7qjDgtKRee
         tazrkUYEp1Pip2WnEy8tEcJ3pFip/+qABr9K32iDIj5Bue1NVOYIPZ8F3E722n6F5kS5
         ilC+vdTrQa/5xnIoY0BzwqLZ1IOHS+NehDXt1vBDr1OmRDveNtxTPy37Y9KvrCbxdq+V
         wMZLgaK2ZzXMPEL1Lrl3wIGGPPmFTZg5ikhOvZ42TKtqwXMqaLLU/ZMlOGta+ghsreHl
         LYsA==
X-Forwarded-Encrypted: i=1; AJvYcCUQiOTro0E2Ig5xp1QdoT1giVIPXyYI6l37QD6wFvsPzfCIyQz1spi8wfjQ0BO5JrYaGWxvHD3OJtEH6YnK2YzYWFrWPvPE8HS6PEpShvjra8fWzqg/OThA
X-Gm-Message-State: AOJu0YwFwQoZHmJc4Z6qzKb1y4S3uGGG0mZ9fjgX0e4bgjKR29oDMeKR
	cozgy/R38iLZR1K1anSGHVr97+6ijIj4egO9bpGwmG7oNsp5VVfe2mP7s4e28qw=
X-Google-Smtp-Source: AGHT+IHcq2+Y/8bYqNFS5pQiwjJcfBqxk5E05Weq0RGNj17Ihr+oK39Ebvq8gfZfQB7fDqEt+u2ygA==
X-Received: by 2002:a05:600c:4f0d:b0:426:5ee5:3129 with SMTP id 5b1f17b1804b1-427dc515367mr7696715e9.2.1721473445335;
        Sat, 20 Jul 2024 04:04:05 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:47af:df48:475e:ef50? ([2001:8b0:aba:5f3c:47af:df48:475e:ef50])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-368787ed28dsm3641935f8f.104.2024.07.20.04.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Jul 2024 04:04:04 -0700 (PDT)
Message-ID: <e60b141e96810107ceda0be06d4a084f0ff0fd88.camel@linuxfoundation.org>
Subject: Re: [oe-core][PATCHv2] mesa: update 24.0.7 -> 24.1.4
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: f_l_k@t-online.de, openembedded-core@lists.openembedded.org
Date: Sat, 20 Jul 2024 12:04:04 +0100
In-Reply-To: <20240719081047.2382310-1-f_l_k@t-online.de>
References: <20240719081047.2382310-1-f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 20 Jul 2024 11:04:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202276

On Fri, 2024-07-19 at 10:10 +0200, Markus Volk via
lists.openembedded.org wrote:
> =C2=A0- Remove two patches that have been merged upstream
> =C2=A0- Remove 0001-Revert-meson-do-not-pull-in-clc-for-clover.patch
> =C2=A0=C2=A0 Upstream managed to fix this:
> =C2=A0=C2=A0
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/main/meson.build?ref_type=
=3Dheads#L839
> =C2=A0- Drop OPENCL_NATIVE since the according option has been removed
> from meson_options.txt
> =C2=A0- Update 0001-freedreno-don-t-encode-build-path-into-binaries.patch

https://autobuilder.yoctoproject.org/typhoon/#/builders/57/builds/9096/step=
s/12/logs/stdio

(and lots more in that parent build)

Maybe the option was removed as it probably became mandatory? :/

Cheers,

Richard

