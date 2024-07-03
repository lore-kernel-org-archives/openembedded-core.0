Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B0EC2BD09
	for <webhook@archiver.kernel.org>; Wed,  3 Jul 2024 17:41:27 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web11.57289.1720028481396878884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jul 2024 10:41:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EycrMSWH;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3678f36f154so802903f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 10:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720028480; x=1720633280; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=csT30PLnr3JM2iYmNEWarE4h9/mp20bvFphPyyZr8pE=;
        b=EycrMSWHwkf33xB9hu1GtA8LZolbUBOaHLgWB3A/QPZVOgq9LBWGniP4Kqem4JVMMN
         iO6PcLdDBLCuBzGXuyjcoJYC96RRQ6fsPQOsSgXA7TEd4GnE1mCQOQIxtbuvH5mN5Lb5
         6Z8ZIetRyCyj+rDQ9imHmF46HqIt2a3bCLMHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720028480; x=1720633280;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csT30PLnr3JM2iYmNEWarE4h9/mp20bvFphPyyZr8pE=;
        b=E+qO8tpeK9X1xrq7PMzuZma4jKFmLSdAtd0hkIUOsYnJuJSGO7ARo7l8CdDcxMPKIO
         Nq49I68O/hpGPS6cvrW9iMrZi0CKUwtujwzkYzRvw5NXh95dPjZOKYnLtmzIDk9hrGM0
         OXCY9YMOkwep8ODzB6HbDTPzgGBfavsvyfcWBYwZHLXuxlH3lsvrIAtArIfjLksH9m28
         pOp1NRgiVxBv/9Bs/tGgzKAZ2XDO2bO9kHGVNg9Bfd1p2A0plzg6jhBAqty+fdLQsDKw
         uL7/UD2zqmMHSF85bzIwHarX3NQYPkwTulczWW78lr1v4eCpll7CI9qU4qRiujTZ+G94
         XM0A==
X-Forwarded-Encrypted: i=1; AJvYcCWjfE5XOLN5/zoQ6r3FzPtPIjzLhpkstmPnNFU9ExtGIWP5dKdtzcAXS8fkVvXcNYKiygHZp+bGl9VM1UljrkhfRBd3AgQdgUAUbzch69eOXLKJFxyj3L7x
X-Gm-Message-State: AOJu0Yz9q0xWmkwGjCe5c7OPQ/5tahqhAD4eMb9g3UHIRRg1y5pP/Neh
	M+q7m3PdsnhLOZDnomBpBmp4PjB4iviZLm1lsHrezKBFA5erWIuQCZtbXzioQhM=
X-Google-Smtp-Source: AGHT+IFtqHG1KhItb68tmolgvnk5qhFsM2vAwxdUL2x5NNxd9uBwtrKRTmVOpP4Toxl3UnEw8Do+wA==
X-Received: by 2002:a05:6000:400d:b0:367:402f:805b with SMTP id ffacd0b85a97d-36775699442mr9955075f8f.2.1720028479850;
        Wed, 03 Jul 2024 10:41:19 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:fad2:e8e1:212e:cafd? ([2001:8b0:aba:5f3c:fad2:e8e1:212e:cafd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a103e5esm16395316f8f.108.2024.07.03.10.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 10:41:19 -0700 (PDT)
Message-ID: <ce52f2465b097e9b1fedb37bee9f65ae0c24606a.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] openssh: upgrade 9.7p1 -> 9.8p1
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: quaresma.jose@gmail.com, openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Date: Wed, 03 Jul 2024 18:41:18 +0100
In-Reply-To: <20240703154004.2632376-1-jose.quaresma@foundries.io>
References: <20240703154004.2632376-1-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Jul 2024 17:41:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201495

On Wed, 2024-07-03 at 16:40 +0100, Jose Quaresma via lists.openembedded.org=
 wrote:
> Release notes at https://www.openssh.com/txt/release-9.8

Thanks for the upgrade, it does look important. Unfortunately it had a buil=
d failure for musl:

https://valkyrie.yoctoproject.org/#/builders/3/builds/68

Also may be related:

https://valkyrie.yoctoproject.org/#/builders/74/builds/60/steps/15/logs/std=
io
https://valkyrie.yoctoproject.org/#/builders/18/builds/61/steps/12/logs/std=
io

The build is still ongoing.

Cheers,

Richard


