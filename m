Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05DCC3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 21:45:47 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.30242.1721684742165047475
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jul 2024 14:45:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=akWgW5aL;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-427d8f1f363so25335065e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 14:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721684740; x=1722289540; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RR0WXPuEh+6bVKNkxnPYpWfErvdCXCXrLrlrQdjmxsM=;
        b=akWgW5aLn8QnBU2YTnU4Gyzxz+Q/V3RTrueuimrXzpo/72B0n0EUoUGb06Z3LZ+/nc
         wjfomF1WIREU3IFIxMKU1p6Ht7wtIhkQQwPUHXYm9UapNJ0+Xo7mTOTNUW9Ig7hkGI/g
         SIghNcljmbG81pKWCNQRP0Htnx7bQCJmYMH+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721684740; x=1722289540;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RR0WXPuEh+6bVKNkxnPYpWfErvdCXCXrLrlrQdjmxsM=;
        b=fhxiSdcFkgB489Ps/mRmbtaDEosrXp8aMLk4gAHy8VBnVAyrsLr72WS/tbaXSW1l3t
         CWVfEsjNeAxj6BKge/mNnp5v6WDu7YwpHfErQQZ64iI1O1LrPnasZM4O+hobT+wSLoFg
         WmpSQlk5CzcCC3bXf1ysmuv9FJ053Au1iEikWpZtmv5WT+pewQiWcNt5T0lEHFl4EBPJ
         saI8H/YuEgmKYflnQkdMZmJaF8MDoU8rywSYvkQ2MrGsH2FNYrgwailpo4AlbxQ8neYO
         NLT++ua51QzxTruj1Bq4MJN70SoyfsQthLERVelIEoQuauOw6tm4GHFdPuAPrEIHg02h
         GCLw==
X-Forwarded-Encrypted: i=1; AJvYcCW7wcuuPmtLVozV3+PxJX6YopdFS9d+HIx8iadRUtQvFd7Yo+gX3SHHPvlmSpyccHqiAElKHYxvFzbIDANcGxOOacwO120GVw7qf1QO0BsH4OK5owuHKX3K
X-Gm-Message-State: AOJu0Yz3o34Pxm8F1zJh4jS6cMW8/lkKqZCfqoAXVNca+mWXsq9tU/n/
	6g0vxGI0vkBFkoS09Xi9MLseVlZZBp+npDmQapV/STFNZgzYhM7QHoBLey//PII=
X-Google-Smtp-Source: AGHT+IHM8BpUqphDSRa995t66qFwRaoWBvrhrRjTdmWyhEpn1649k1M7987wX2/7KhzYCTtRlVQRYQ==
X-Received: by 2002:a05:600c:4710:b0:426:8884:2c54 with SMTP id 5b1f17b1804b1-427dc5680b3mr47187025e9.35.1721684740531;
        Mon, 22 Jul 2024 14:45:40 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:2981:be39:a4a4:14a2? ([2001:8b0:aba:5f3c:2981:be39:a4a4:14a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2a8e436sm169482875e9.33.2024.07.22.14.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 14:45:40 -0700 (PDT)
Message-ID: <29dc1c80950b25530d55427c1cd97e5be4c0c6e0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [scarthgap][master] license archiving is failed to
 tmp/deploy/licenses
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: egyszeregy@freemail.hu, openembedded-core@lists.openembedded.org
Date: Mon, 22 Jul 2024 22:45:39 +0100
In-Reply-To: <ylX1.1721248085237883271.dozv@lists.openembedded.org>
References: <ylX1.1721248085237883271.dozv@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Jul 2024 21:45:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202327

On Wed, 2024-07-17 at 13:28 -0700, Livius via lists.openembedded.org wrote:
> License file archiving is broken, package/recipe folders are fully empty =
in tmp/deploy/licenses directory after the finished image build, manifest f=
iles also missing in it.
>=20
> It seems to me this is broken for me since the following patch:
> https://github.com/openembedded/openembedded-core/commit/1a4ab9fc26659507=
e678e87312b514e8ea515673
>=20
> This is my settings for it in my local.conf. What goes wrong?
> INHERIT +=3D "archiver"
> ARCHIVER_MODE[src] =3D "patched"
> ARCHIVER_MODE[compression] =3D "bz2"
> ARCHIVER_MODE[mirror] =3D "combined"
> COPYLEFT_RECIPE_TYPES =3D "target"
> COPYLEFT_AVAILABLE_RECIPE_TYPES =3D "target"
>=20
> # Don't filter the license
> COPYLEFT_LICENSE_INCLUDE =3D ""
> COPYLEFT_LICENSE_EXCLUDE =3D ""
>=20
> # Deploy licenses
> COPY_LIC_MANIFEST =3D "1"
> COPY_LIC_DIRS =3D "1"
> LICENSE_CREATE_PACKAGE =3D "1"

I wanted to say yes, I have seen this report and yes, I'm aware I wrote
the commit seeming to cause it. No, I'm afraid I don't know what is
wrong.

The mailing list is the right place to discuss things (or the
bugzilla), not github issues.

My patch added in a directory sublevel to the structure and it would
seem that some piece of code wasn't translated properly. The change
likely needs to be debugged with the settings you're using to find the
issue with the change.

I did make best efforts to ensure everything worked but our test
coverage isn't always 100% and it would seem we're missing some test
case.

Cheers,

Richard




