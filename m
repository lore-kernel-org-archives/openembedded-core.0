Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E26BC48BC3
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 17:59:23 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.49288.1707933561506312124
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Feb 2024 09:59:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BJlBeQV0;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-411d3c75026so25315e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 09:59:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707933560; x=1708538360; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yZeWLTMSt1ZrUdpBxZGl/3g2Tz5txPtB8AkrjVXuFFw=;
        b=BJlBeQV0I4oTC3q23/+IT+50WnROw4ngclc0AD6+SWOnLXm1DyysUBRDT3Zm8Bv7ao
         N8LPOQLN5n6UZzvXJ02ROPvltmV2BRyfBf/lAMol80CTlD3c35LDWuvxh5pvm8g3aElJ
         L8O6AHPvjda4TcPR7wJ6Q3lTPYRRjh3E117Wdu3mLwehRbEa/eP2aZO9tr9Dh94F+wCm
         q0mgHXXYWDQgW6LTJtkEtBNQTbTXDZvdRttANqj9F0wHI8p6ZENzHZV+1c4tGE2b3TVO
         uYxhPdogIkXM063oTZwq72hYdyfV33r2OXcbFcfDHwwUI+xuSRWmB9XRO7k7fRvPCQFu
         4jdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707933560; x=1708538360;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yZeWLTMSt1ZrUdpBxZGl/3g2Tz5txPtB8AkrjVXuFFw=;
        b=SfPnNN74MU3piI2ENa/vKtwnB7VsVr2IMI4k57F83ZAUa1bV05GqtMBCxzyzXfP2Rd
         adVn0QuErAYMXlhWSyPwaX8Gvp4NaceeSQdvXRf/w0faW6/wyC+1+1VSrFSvKXU5Fx64
         vubwMyTHXiRIbIOSn9+ndQI5dpsUsiRhs25Z+46M9ON1ifDHqNtmvaNwo+ECUjZqtKmT
         ZtGluEwnEPGfm64C1rGbGkqYM4NSBvG3i4oJm4YsaxLAJ6Y165S922ATvOOkpspJnmh9
         0uA6KYpd5rOdrUGR8T39l1joq21/ZIh91oJl4q4fYg3xtQOL0/Z7Mgd1L8aFyg9ZlZo3
         XLUg==
X-Gm-Message-State: AOJu0Yx3JGYvdkAOPj6K7+A4L/k5xKK+stL2y525F/nF42jbyrpYHEYa
	BHsTiDZpZqDDc/6UVFmkY7sqg3/GtrRUH4XQFXB+GtTFvTHO6RJ1
X-Google-Smtp-Source: AGHT+IEiMFzWwLAESP9nezl97XEtzE9FKKeQoU0wmE2v+dckzHTYflTrfKZbVi1VA2sPqTSMYFvOYg==
X-Received: by 2002:adf:e487:0:b0:33b:45f7:636b with SMTP id i7-20020adfe487000000b0033b45f7636bmr2549175wrm.22.1707933559562;
        Wed, 14 Feb 2024 09:59:19 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ch8-20020a5d5d08000000b0033b75b39aebsm11686541wrb.11.2024.02.14.09.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 09:59:19 -0800 (PST)
Message-ID: <17f1c0ac3145018757325b6ebd5760c6ca73641c.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] oe-init-build-env: generate .vscode
 from template
From: adrian.freihofer@gmail.com
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 14 Feb 2024 18:59:18 +0100
In-Reply-To: <CANNYZj-m61r+uHvu+Op5XmeVEgbZmvxY_XdPpmhyRN3wXTssZA@mail.gmail.com>
References: <20240214173914.136799-1-adrian.freihofer@siemens.com>
	 <20240214173914.136799-3-adrian.freihofer@siemens.com>
	 <CANNYZj-m61r+uHvu+Op5XmeVEgbZmvxY_XdPpmhyRN3wXTssZA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.module_f38+17164+63eeee4a) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Feb 2024 17:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195491

On Wed, 2024-02-14 at 18:49 +0100, Alexander Kanavin wrote:
> Thanks, I have no objections to this version.

I have done my best to take all your ideas into account :-).
I agree, it is much simpler and it still does what is needed to improve
the user experience when working with VSCode, the new yocto-bitbake
plugin as well as with Git (on the command line).

Thank you!
Adrian


>=20
> Alex


