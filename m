Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65275C001DF
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 13:00:18 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web11.53738.1697806809201417271
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Oct 2023 06:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gNkdsbmM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.180, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2c503da4fd6so11338821fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 06:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1697806807; x=1698411607; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KF9xpnnoA56BYeKEH2GLJMSL7I3KhPfOEb0OZ2wOQAo=;
        b=gNkdsbmMTqLEPhaN4HKnrjIvb6xHLgvTwKyE2q5NmNMojhsqh+30TOa4PlR5q+/gz4
         gOSOiwTmzKCHQviOMxMx8eHwTBa7aJZBjoUYtqIIioWU5z8PPjp58O62dYMdSM8/dKXO
         buJYSh8aY9aLGyVGkwj6Sy1ivDspeuexy2VVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697806807; x=1698411607;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KF9xpnnoA56BYeKEH2GLJMSL7I3KhPfOEb0OZ2wOQAo=;
        b=CAjNG8VS54baMOPG5h3AG3YwCu53x5Tzg4nY5f1cObwjutCnbbTA/toiW44xthUPRN
         u7bTT3t/VYA8zIYNyceKdVuF4jk2s7NGmZoGPABLBC2D9s7P+oMOVnQD74dLDwZqJ3tu
         eu47G3CyC3E0caHGltf48AMFxgrB0ClGYeuI7nFdSxgNvDCLB98TR5gXoOYs1QY8YRvo
         3HQxOtM8odimf8sftY7GlHORaDlz+zg5p0RB2EwvVYpP7+EfP7yLNtNxKfOvio9uhe1O
         bMUQ4IfCWzS5mxEmlYFNsdCC4U7N3Sju4QyYpc/fQUdl66RNrRuXTPjBgYF9KagqtNEe
         UwGA==
X-Gm-Message-State: AOJu0YwQemVbxbHgWZmhGIv2f24A8YEUPRvVZmTFJe6wlMzyRaF+UPc6
	LqcAKdzNxTnhKxcPSXnmNzazKdhcW0NV6iptfQk=
X-Google-Smtp-Source: AGHT+IFf3guPbfSeTRZZiVM2FJvTD5HBCH25jpHwzDslNPaqImQzwdxitqdBgKGyn58gU82Z5hQcfw==
X-Received: by 2002:a2e:a543:0:b0:2bd:1cd0:6041 with SMTP id e3-20020a2ea543000000b002bd1cd06041mr1517889ljn.0.1697806807384;
        Fri, 20 Oct 2023 06:00:07 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e461:a77:598a:10d6? ([2001:8b0:aba:5f3c:e461:a77:598a:10d6])
        by smtp.gmail.com with ESMTPSA id ay20-20020a05600c1e1400b00407460234f9sm2141957wmb.21.2023.10.20.06.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 06:00:06 -0700 (PDT)
Message-ID: <d53085e46d3b3af2071bc3c1b4cfdb0f6517b1a5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 4/4] package_rpm.bbclass: Support compression
 override
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
Date: Fri, 20 Oct 2023 14:00:06 +0100
In-Reply-To: <20231020124450.9736-4-niko.mauno@vaisala.com>
References: <20231020124450.9736-1-niko.mauno@vaisala.com>
	 <20231020124450.9736-4-niko.mauno@vaisala.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Oct 2023 13:00:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189526

On Fri, 2023-10-20 at 12:44 +0000, Niko Mauno via
lists.openembedded.org wrote:
> From: Niko Mauno <niko.mauno@vaisala.com>
>=20
> Commit 4a4d5f78a6962dda5f63e9891825c80a8a87bf66 ("package_rpm: use zstd
> instead of xz") changed the rpm package compressor from 'xz' to 'zstd'
> which results in decompression failure with BusyBox-provided 'rpm2cpio'
> applet and 'rpm' applet when given the '-i' (Install package) option:
>=20
>   rpm2cpio: no gzip/bzip2/xz magic
>=20
> In order to maintain compatibility with BusyBox introduce new variable
> which can be overridden like:
>=20
>   RPM_COMPRESSION =3D "xz"
>=20
> to enable rpm decompression without including the full rpm package in
> the resulting root filesystem.

Is it common for people to need to manipulate rpms on target without
rpm being present using busybox? Do you know if busybox plans to add
zstd support?

As far as I could tell when we looked at this, the rpm world was moving
over to zstd so adding in conditional xz support for a limited use case
probably just creates a maintenance headache going forward as it isn't
something we test or plan to test?

Are you using this on an LTS release or master?

Cheers,

Richard


