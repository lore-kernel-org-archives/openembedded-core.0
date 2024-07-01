Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1867C2BD09
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 16:48:07 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.1804.1719852477162312429
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jul 2024 09:47:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MFVZSF8V;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-42564316479so20521315e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 09:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719852475; x=1720457275; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JtFC4wX4esr7AiTkaTk3q15H0KEUjATf8GBTzdoTl3k=;
        b=MFVZSF8Vm861B0KjvjdcVGZSmPMblVw3Nu4DTdi4YVtMriZSlW0ZgZWxpI0+aZe4JE
         /gzim3jVccNcrodW9Vy/7wVCyqTY20NbGP7EsT0FhRNvIZEk96MZB+i/GH/bAkbAl4Ve
         1C87SfqyZkR2Y9IKTnYGfgpGOBHPHW7RWEw4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719852475; x=1720457275;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JtFC4wX4esr7AiTkaTk3q15H0KEUjATf8GBTzdoTl3k=;
        b=CoCB9IQcTV1BTU6uVjXYTvIo19S1XjekH4qhItkOuawEP1nVpUnRyO3zbiA/wtvybo
         vnfGVMt1lt0XX/++nSptnTQzBlD3YE0W5ZNYv2A7c4eBqVc7BRsNLgPBs3EsWIgFP7mw
         IDN5NBSi9ylWilYTfJHjIfNLsMUD9aIEkmOwFS8so4NqpjpIyzFZftbiB6Emsvk7D9lY
         1RW/k0Uij2+H1OyovKG/Pj4y4FlmK5ClpZY6vU/MKghbYOFPhJW58NWmBuSDOKDgUWJx
         TTPGyMb9rhSl1PXoGl1cymsu487insAPWVIdbuCkby5ndLQXSn4wxd8tuXb+AKyqUyBf
         R6Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWLNuaBrLr8Q1ttSNx9aKYG6+7+fT4rtpI+zZNmeajlp0I1WZwutYk9QwCfMoQiwf5UZ9GXoSlDkykJ4hkvLaHrNHQYLGZGUuoCCE/5K4HbtxWGMIccsZd2
X-Gm-Message-State: AOJu0YxKPAvvOEjuKhPRMnKLH8GXISiqro6hbQ+Pcpi6uqy116OjflGk
	C/eTBlkhHslnKRgG0NCb8V8kRe46EgsxahTipcLqotCeTbmqr/eE2okf7gUNg6E=
X-Google-Smtp-Source: AGHT+IEmlvTsAMSIpluutpNhRId9s2F/Vgk2Rijt4HlHO80grXy8n+njrvOcACuPUeaKQ5Akixj1tw==
X-Received: by 2002:a05:600c:4508:b0:425:7f73:47ee with SMTP id 5b1f17b1804b1-4257f734c02mr28000475e9.33.1719852475585;
        Mon, 01 Jul 2024 09:47:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:476a:5554:3166:a3c1? ([2001:8b0:aba:5f3c:476a:5554:3166:a3c1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256b097b77sm159032515e9.33.2024.07.01.09.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 09:47:55 -0700 (PDT)
Message-ID: <d225589e4783add6433bd350f52da84bd468f11b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 9/9] rust: Upgrade 1.77.2->1.78.0
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com, 
	Sundeep.Kokkonda@windriver.com, Shivaprasad.Moodalappa@windriver.com, 
	alex.kanavin@gmail.com, alexandre.belloni@bootlin.com
Date: Mon, 01 Jul 2024 17:47:54 +0100
In-Reply-To: <20240701092639.1498856-9-Yash.Shinde@windriver.com>
References: <20240701092639.1498856-1-Yash.Shinde@windriver.com>
	 <20240701092639.1498856-9-Yash.Shinde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jul 2024 16:48:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201312

On Mon, 2024-07-01 at 02:26 -0700, Yash Shinde via
lists.openembedded.org wrote:
> From: Yash Shinde <Yash.Shinde@windriver.com>
>=20
> * Drop the following backported patches which are merged
> with rust v1.78 upgrade.
>=20
> - 0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch
> - repro-issue-fix-with-v175.patch
>=20
> https://blog.rust-lang.org/2024/05/02/Rust-1.78.0.html
>=20
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>

With this series applied we saw the following failures:

https://valkyrie.yoctoproject.org/#/builders/4/builds/66/steps/12/logs/stdi=
o
https://valkyrie.yoctoproject.org/#/builders/60/builds/66
https://valkyrie.yoctoproject.org/#/builders/2/builds/66
https://valkyrie.yoctoproject.org/#/builders/19/builds/67
https://valkyrie.yoctoproject.org/#/builders/41/builds/61/steps/14/logs/std=
io
https://valkyrie.yoctoproject.org/#/builders/18/builds/59/steps/13/logs/std=
io
https://valkyrie.yoctoproject.org/#/builders/6/builds/59/steps/12/logs/stdi=
o
https://valkyrie.yoctoproject.org/#/builders/3/builds/66/steps/12/logs/stdi=
o
https://valkyrie.yoctoproject.org/#/builders/67/builds/62/steps/13/logs/std=
io
https://valkyrie.yoctoproject.org/#/builders/67/builds/62/steps/16/logs/std=
io
https://valkyrie.yoctoproject.org/#/builders/67/builds/62/steps/19/logs/std=
io

and the builds haven't all finished yet.

Cheers,

Richard


