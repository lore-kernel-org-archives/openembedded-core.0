Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEA03CF396D
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 20:44:04 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.3715.1726778639193823308
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 13:43:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=g/+x25N3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-374c962e5adso801533f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 13:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726778637; x=1727383437; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mZyNgSSBnBZAtfSdMBfj/D9ZTotJqZe6AbeQWlQ8GeE=;
        b=g/+x25N33nlasIe+QovMyYcVziudrkU5USMgNT9cq/iRWFwMIEegrfmW1+A3ekNDY4
         rP+ebtaeq1YTg6XSatcXws56+9zoUHAhlswOIMfO09jNrw1cTpEscz0xXhZdC0fgy/CO
         /vlBeVjonN/q5KW+8dD7KINuQS7NhQV0yYipQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726778637; x=1727383437;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mZyNgSSBnBZAtfSdMBfj/D9ZTotJqZe6AbeQWlQ8GeE=;
        b=RWTh+QxlUVKwIWtTGtrMuaTOxbmzECjSnBf+R67Rj0eR68IGNw1UDqIUwRTHWKPPEV
         j5W4r5SwxEAZBestkU7kKgaRrr3ESbEgONPqexiMu1xbtleAfeB3oBFH7WxUBoJbm8G+
         WH4zOjX6D16rD+Z8Zoe4p0rnEXNfh8TFj8bQbVUNBYtLB8F2R0hl51kFnV/xdFwbv+FP
         WNExw8HP0kszRcV28J7WGZfpnVeNG/wOHrEBvbXcQbY6+BSxBLT5dQVSTxYaCU2JfXHD
         cRQXo1zW8WffqNJFB/MZU90zz3cCVni8psjdKY2n3KTYn0r52NilKk+L3EAq3sCzMeIo
         1N5A==
X-Forwarded-Encrypted: i=1; AJvYcCX4BqWitmf1dMQGxeYHnN3rriwmSM0OR78zkRN9xG7SsyzbC7qrmCFP/zKW30twwQhOXUMFo7LcUe1L24tnOAVb8g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YydQq/v4MB7KMXCtp19shPU3qT6Df1RKenk8VS9u3l5/ZatQlEo
	lySeRUGkE1kpEAWfevizphgpmZIyKny2OksWSilg4SE6qqiy1HC1PqVg3F+W2do=
X-Google-Smtp-Source: AGHT+IEQXNRqR90DmhWY/gcssVXefZZehcz6aVRslt4FuSxlQpMG8j4VeBApnJC11iOzb+jAtTezpg==
X-Received: by 2002:adf:ef10:0:b0:374:d130:a43b with SMTP id ffacd0b85a97d-37a41496eebmr483297f8f.4.1726778637268;
        Thu, 19 Sep 2024 13:43:57 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3dff:6e76:1854:48ea? ([2001:8b0:aba:5f3c:3dff:6e76:1854:48ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e78052efsm16024346f8f.97.2024.09.19.13.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 13:43:56 -0700 (PDT)
Message-ID: <b27c1ef881c76f09191a38723fa20ae2b0829d4f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 2/2] nativesdk-packagegroup-sdk-host: Add
 missing perl modules to RDEPENDS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Naveen.Gowda@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Thu, 19 Sep 2024 21:43:54 +0100
In-Reply-To: <20240919124848.653457-2-Harish.Sadineni@windriver.com>
References: <20240919124848.653457-1-Harish.Sadineni@windriver.com>
	 <20240919124848.653457-2-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 20:44:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204713

On Thu, 2024-09-19 at 05:48 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> In SDK, missing perl modules causes 'x86_64-pokysdk-linux-gp-display-html=
 --help' to abort with below errors..
> =C2=A0 - Can't locate bignum.pm in @INC (you may need to install the feat=
ure module).
> =C2=A0 - Can't locate Math/BigInt.pm in @INC (you may need to install the=
 Math::BigInt module)
>=20
> By adding the following perl modules to RDEPENDS fixes the above errors:
> =C2=A0 nativesdk-perl-module-bignum
> =C2=A0 nativesdk-perl-module-bigint
> =C2=A0 nativesdk-perl-module-math-bigint
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/binutils/binutils_2.43.1.bb | 4 ++++
> =C2=A01 file changed, 4 insertions(+)

You've updated the commit to do what is needed whic is great, thanks.

Unfortunately the shortlog is now incorrect though. It should now read:

"binutils: Add missing perl modules to RDEPENDS for nativsdk variant"

The patch also fails to apply as I can't take 1/2 for other reasons as
discussed. I'm going to tweak the patch locally for testing though on
this occasion.

Cheers,

Richard

