Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BEC9E77370
	for <webhook@archiver.kernel.org>; Sat, 30 Sep 2023 11:07:40 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.38911.1696072058986914223
 for <openembedded-core@lists.openembedded.org>;
 Sat, 30 Sep 2023 04:07:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=YYShujiF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-406618d080eso10628315e9.2
        for <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 04:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1696072057; x=1696676857; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SYDyU1hhHmVL6ucM8BjE135x17B2MUrfRxOf+6A4PlE=;
        b=YYShujiFSYRzE+AXnTnr138r+VA2MTr2RkIyNmxDNFj1zPm5ZaYiMZLT1rZJzg+RjN
         lUvQzoEC3zTGRQNbs4YUD9GiFSxj4Wl4w0PjUysvvoQ/Nhe1JXIFlXvnPwmTE6zoNlrg
         IIN5rF/RCeoloLgWXTm1M7/wXMFsAkvM9fGys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696072057; x=1696676857;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SYDyU1hhHmVL6ucM8BjE135x17B2MUrfRxOf+6A4PlE=;
        b=ki5/autTwkFqCrwTd7G2xOLXxfta0kSyBSB11mQCHk02czaWGILtFzo39LrGB5KNVc
         PyLERVhKyVtQJvElGk/sLaoL3JksIKKFHa+LxeTmJaiQNtgjAyNAnUsIjoXun99AfSM4
         pMX+U2/2GpCrcDN1FDJw+juY83sgUXFgIc5HzO6/9D0CICDWSxovz3LrdW9wHptywst9
         /e9UvHdFu6YqBIYQm6Y1oMsxrxzdzEdMyg2CXYugZ/+xViDizN7MTfGHa024ujdB+8bF
         hIl3RW7TPGXj6mfjlTTv0xlwOhDPMbg+R2L5+SQu4quxBGwb4HC5r9RCED1Q+9z+LBKC
         CimA==
X-Gm-Message-State: AOJu0Yw3oLKYaFflEhOjoM1w3WeFlk+gkn0Da//xlS9f6FnKCKRNbOPo
	UnfXSprMYxTLo5yMklrHblWsWQ==
X-Google-Smtp-Source: AGHT+IFqiYBB+J1gUydp9JDLKL2DW1onmocorD9a40PdX0ts+tjOL5keNhdSvxrcmLkwY0DHqpGYtw==
X-Received: by 2002:a7b:c3c1:0:b0:404:7670:90b8 with SMTP id t1-20020a7bc3c1000000b00404767090b8mr6023243wmj.27.1696072057311;
        Sat, 30 Sep 2023 04:07:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a077:4896:f66b:df48? ([2001:8b0:aba:5f3c:a077:4896:f66b:df48])
        by smtp.gmail.com with ESMTPSA id n9-20020a05600c294900b00401c595fcc7sm3175667wmd.11.2023.09.30.04.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Sep 2023 04:07:36 -0700 (PDT)
Message-ID: <fa84ffaabc1616f617555fbf7cc2d46fb2358e51.camel@linuxfoundation.org>
Subject: Re: [PATCH 00/10] kernel: consolidated pull request
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: bruce.ashfield@gmail.com
Cc: openembedded-core@lists.openembedded.org
Date: Sat, 30 Sep 2023 12:07:35 +0100
In-Reply-To: <cover.1696017123.git.bruce.ashfield@gmail.com>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 30 Sep 2023 11:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188457

Hi Bruce,

On Fri, 2023-09-29 at 16:04 -0400, bruce.ashfield@gmail.com wrote:
> Given where we are in the release cycle, this clearly is NOT a typical
> consolidated pull request.
>=20
> I've done what normally takes about three weeks in about 4 days.

Thanks, I know this isn't where any of us wanted to be.

>=20
> With 6.4 going EOL before expected upstream, it really isn't a suitable
> reference kernel for the release.
>=20
> So we've decided to take on the task of getting 6.5 ready and available,
> and at the same time moving the -dev kernel to v6.6. The -dev kernel
> testing for 6.5 was critical for this, since I already knew the core
> was sane.
>=20
> Also we've never shipped purposely mismatched libc-headers in the release=
,
> so I also took the leap to update the libc-headers to match.

Agreed on both counts, I think we need to make 6.5 work.

> I've already sent fixes to meta-oe, and there's a btrfs update in this
> series to fix breakage that I found in the tightly coupled packages.

I think btrfs-tools was already upgraded in master?

> I've built and booted core-image-kernel-dev, core-image-minimal, core-ima=
ge-sato
> for both glibc and musl for all the supported architectures.
> There will be some things that break regardless, but this needs the
> better coverage of the AB.
>=20
> If this causes too much problems, our choices are to ship 6.4 EOLd, or
> fall all the way back to 6.1.
>=20
> I'll remove 6.4 from master once we've figured out the fallout from
> this kernel, and which direction we are going.

I had some difficulties with this series since it doesn't apply against
master. The issue was that someone else had updated the kernel CVEs and
those changes weren't in your tree (nor was the btrfs upgrade). This
meant all the cve inc changes threw errors. We will likely need to
assume someone will update the CVE includes semi regularly just so we
can keep the noise on the CVE reports down.

Since we're short on time, I regenerated the series re-running the CVE
script and rebuilding that piece of each commit. I suspect now we
understand what happened we'll be able to better handle it in future.

The first autobuilder test run crashed and burned due to unrelated
patches. I've a new build running:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5969

Cheers,

Richard

