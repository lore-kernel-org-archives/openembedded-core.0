Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92FE0CA0FF8
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 07:20:02 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.4269.1693639200982604240
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 00:20:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ob+6sL5o;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-31c8321c48fso367228f8f.1
        for <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 00:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693639199; x=1694243999; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rL6vnMyyvoHsYcHxxnECgh6fsF7Fg/HMNtLDWofn7hc=;
        b=Ob+6sL5oopm4MtlNJS/EIsxxWOgJJJWBYaT2UWcc0imlgsU2woq3rURYRWblhYY67/
         9Zmw4JM8/kN46p8yGhT8mSldGg7iC60WKi8DTvhL7ljJdcoLwlfcjZw386N0W9KoLhHH
         gmHx9qxMwPB5xhuHXtMjndyfLpfk3H+jpBV4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693639199; x=1694243999;
        h=mime-version:user-agent:content-transfer-encoding:date:cc:to:from
         :subject:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rL6vnMyyvoHsYcHxxnECgh6fsF7Fg/HMNtLDWofn7hc=;
        b=NOXD2L/T9n+1FbkDZ7DUcgaB+yc7t3jpj+g1tBagAXsqfPhC/UJJvWnuhsaehePK/0
         1zPv4k6bj5MduKNMzZ4tXwX07Cpsih5vfcRLCpzsLFCGpHImiGfM2DqAxiaxYbekKWub
         P8dqfZzO2W5xSfyVMSsBmADHioIKN7FGRKMLh6I09ZPYeADNVsEPGtRWDNzq3aRIlhMC
         HUAkxD0lTScVigwQlFXiSvhpprjr773J7BKMd25nnaZKJX9Bu7OrlWwbOkAucW5OVTdi
         XxQVAFvUv1CS61dtRwm3I14hQ+aV6JvuFfxwwqS+sFVyGpzFqfW4EkQ9ghxlfwdr80LL
         nwLw==
X-Gm-Message-State: AOJu0Yz81HO6w/UEaX5HkyttI/sdlgP571fBkYwPE0dJfRVvYejhAhXx
	JAajeRYH9MiGkoSwazwTZ1rPa7eqRVSvLVZ84Ac=
X-Google-Smtp-Source: AGHT+IEb1HYmpjdn/K9CjRFPo2BBqd+uWdt4RUZ2AyeFJzCcgQ11VR258QOpgU8suZSu6gb5yQWtQw==
X-Received: by 2002:a5d:46c5:0:b0:317:558c:c15e with SMTP id g5-20020a5d46c5000000b00317558cc15emr5635030wrs.27.1693639198957;
        Sat, 02 Sep 2023 00:19:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bb30:48fe:2031:d024? ([2001:8b0:aba:5f3c:bb30:48fe:2031:d024])
        by smtp.gmail.com with ESMTPSA id c4-20020adfe704000000b0031c5e9c2ed7sm7523001wrm.92.2023.09.02.00.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 00:19:58 -0700 (PDT)
Message-ID: <721109e496c7c5e0459812f86feaae87fed38ee9.camel@linuxfoundation.org>
Subject: Changes needing documentation - a new procedure
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>, 
 openembedded-architecture <openembedded-architecture@lists.openembedded.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>
Date: Sat, 02 Sep 2023 08:19:57 +0100
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 07:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187024

I've been concerned for a while about the process of adding
documentation influencing changes. Our docs are in a separate repo and
this does have advantages. They do span multiple areas of the project
and in general this does work well for us.=C2=A0It does mean the docs are
consistent and have a common style/voice.

Equally, it is hard to ask users to add documentation changes in their
commits and this leads to the docs having to play catchup and pushes a
lot of work to the docs maintainers.

We're therefore going to try something new where I'll ask people to add
notes to a file in OE-Core, DOCS-WIP when they make a change which
needs docs updates. This will include changes which need a release
notes or migration guide entry. The docs maintainers will then know
what needs to be done and hopefully have at least the basic information
they need to make the docs changes needed.

This is an experiment but hopefully one that will be successful and let
our docs continue to grow.

Cheers,

Richard





