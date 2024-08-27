Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B8F2C54734
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 10:39:12 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.75505.1724755139269823755
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 03:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ALfx4O33;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-371a6fcd863so2946480f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 03:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1724755138; x=1725359938; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5Zh0T2fXiyrlREx1k5bylKdAbeDpcCGaxpEWXqsE2UU=;
        b=ALfx4O332A/wC9MK+/+xUWL30oQ2ph64Kyb+teWV7ks0RL4RMOwuSeLRWEWhWiLPGW
         SD69JF57YCVdIyfkjNRAozvLLhfK+UUeyuzen2eaen13VOeU+NXpYNW/Gox1Gygrk4lf
         5ja+WHAHtOIpHV3/LJZyB76WeJj1+/LOgEUcQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724755138; x=1725359938;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Zh0T2fXiyrlREx1k5bylKdAbeDpcCGaxpEWXqsE2UU=;
        b=IGmJ3UNZBZh3WVGKydfBQsw3GZ57nU/WCgLrIsrqM64Sae06C1eMUfhJlBJeajFVtl
         jFpltFqPEPoR44o3MvVvW2nI4JVp+tjK/fQuc1HSWL2UX6BnJ61MLe8kKYVIyYmaOGyk
         cRaVUGz8gbReDE1OBTGanuvnR5ekl87PB4jaYyHjqRzbhEj6JnZ0z21GpNKdXwyrR9b+
         xmPg/AmYlpd+J3Z+tkSW6JoEncrT5kEkPNvWD3xYdHR8WJ2dFxcUSRS+1KvG4MplOykS
         i1lDmd81NotiyrbCGvGsdz253//OeI7+QEP/ZB5PVqr+G8AYmeP1fdBpaQOKPzIMt4Ej
         60IA==
X-Forwarded-Encrypted: i=1; AJvYcCXkqlH3wfS1aIau+rN2XQm6DAIb3Kwy/F8NKzqWaQV8mfZJtMXXljhRIPYR4V4zs+3GH5KLhCe30qKqmRX3FscV+A==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yyx/h8C+KjoR46SJtn/8PXszIH7SW5dwQKAElLM0ja/HgGMyb6F
	Gr6g0Bh9RDOQk4pHke8zSWQjpnrdCMEWt82o38djqck6rFSTEXp9hTmoGIA4gIc=
X-Google-Smtp-Source: AGHT+IG6e+VstIKAsnaC05T0Wvx092YM3lGljXPWmHKJPPg5N7qG2+dSUOp6NT+lSL5snTr16fpWVg==
X-Received: by 2002:a05:6000:2c7:b0:367:9881:7d5e with SMTP id ffacd0b85a97d-37311841ae6mr9100420f8f.8.1724755137513;
        Tue, 27 Aug 2024 03:38:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f5f7:3b8b:ca90:386f? ([2001:8b0:aba:5f3c:f5f7:3b8b:ca90:386f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730815c0f0sm12855431f8f.51.2024.08.27.03.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 03:38:57 -0700 (PDT)
Message-ID: <bbbe564b9b6191edbe62abd69fa3b337ada2ad4a.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] rust: Upgrade 1.78.0->1.79.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com
Date: Tue, 27 Aug 2024 11:38:56 +0100
In-Reply-To: <20240825170553.566798-2-Yash.Shinde@windriver.com>
References: <20240825170553.566798-1-Yash.Shinde@windriver.com>
	 <20240825170553.566798-2-Yash.Shinde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 10:39:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203827

On Sun, 2024-08-25 at 10:05 -0700, Yash Shinde via
lists.openembedded.org wrote:
> From: Yash Shinde <Yash.Shinde@windriver.com>
>=20
> Update the patch files with rust v1.79.0.
>=20
> Drop the following backported patch which is merged
> with rust v1.79 upgrade.
>=20
> - cross-targets-backport.patch
>=20
> https://blog.rust-lang.org/2024/06/13/Rust-1.79.0.html
>=20
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>

It seems mostly ok but we did see:

https://autobuilder.yoctoproject.org/typhoon/#/builders/42/builds/9385/step=
s/13/logs/stdio

in Alexandre's build :(

Cheers,

Richard

