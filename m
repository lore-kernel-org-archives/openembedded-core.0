Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7E44C7EE24
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 06:47:20 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.6653.1685688439452094429
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Jun 2023 23:47:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Fdme4mR7;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f606912ebaso17384245e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Jun 2023 23:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685688438; x=1688280438;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xo3k6ffbrqlvJEc/bFoKmm17UwaAFbIJuxr0RU+kGdo=;
        b=Fdme4mR7qNS8zbmT7v3Z8sS74Nf4sShYSCPavrl+abtpDpP10p/BNu+0b2viPKanNI
         Mu9yJqdntRa10f3CT3QbCMhy4A0c1TNlQQCjqN6TKR9nKgzjXjbamG3gIIbp/lR+jpY8
         CEm5sMs/ZkqEPXTcnM2k4owFPXv1GT2qiWTp0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685688438; x=1688280438;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xo3k6ffbrqlvJEc/bFoKmm17UwaAFbIJuxr0RU+kGdo=;
        b=GwwpSNqoB/HE/V88XiwWeclD49KLmxKtxoVRsXb6irKmj9Wk8/2ifRZcO3DEG7NKq/
         hDCoYxAZ1jBomEG7D8LJfeeERHgqS43Vic3quHiTC9OqG+op+/BRoAHmDjncFTA5oRXf
         ghhMP7GaD2UtvyUaa12stoQQpuIGrd5ldD9XW2HSeC962BenBArZemA7snADHrAogF8N
         vN8WP804EaZUkZmREs5SXoM5cbiuSlTiGlNeXS5Iurs2B1xbTm9DisFuCdNM2a6X5x2Y
         oOXrMDv/Ygl7IGhH/hqMYm9QXB+u/OAqaktF2+pvS02rQderd3emAcor1psyprmVHXSY
         0CpA==
X-Gm-Message-State: AC+VfDxrUQPhFwwGCSG9bNuATrF+vSSY64a8SNlte14Ew6o3E12TyHBO
	ySMcwvPvWjquIo+ARVsjWJmn+w==
X-Google-Smtp-Source: ACHHUZ4RosL/rWLi2zGwHUJFQz4q0O3e6DLkXKDS/0jF/AmCIm9VWflA9R+io9cW0/9k/BVmP7bc7g==
X-Received: by 2002:a05:600c:2905:b0:3f5:6e5:1688 with SMTP id i5-20020a05600c290500b003f506e51688mr1068105wmd.2.1685688437881;
        Thu, 01 Jun 2023 23:47:17 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:527f:ecab:4831:c523? ([2001:8b0:aba:5f3c:527f:ecab:4831:c523])
        by smtp.gmail.com with ESMTPSA id m10-20020adfe94a000000b0030c6751a49dsm694205wrn.115.2023.06.01.23.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jun 2023 23:47:17 -0700 (PDT)
Message-ID: <bf33ede466ff9fe57eb11ef0d88de64d3c953391.camel@linuxfoundation.org>
Subject: Re: [OE-core] Is aarch64_be under maintenance?
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Fri, 02 Jun 2023 07:47:16 +0100
In-Reply-To: <OS0PR01MB6178318FC4E138CE82A7D60FA04EA@OS0PR01MB6178.jpnprd01.prod.outlook.com>
References: 
	<TYCPR01MB61918B757CBA93C6AD0BD80EA0499@TYCPR01MB6191.jpnprd01.prod.outlook.com>
	 <fcf04863048c9e529df03a0bc034a8f86e468865.camel@linuxfoundation.org>
	 <OS0PR01MB6178318FC4E138CE82A7D60FA04EA@OS0PR01MB6178.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 06:47:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182143

Hi Lei,

On Fri, 2023-06-02 at 02:36 +0000, Maohui Lei (Fujitsu) wrote:
> > It has worked at some points in time but isn't part of our automated te=
st matrix
> > so it looks like it has suffered from bitrot :(
>=20
> I have no idea about how to fix these bugs, Can you give me some suggesti=
ons?=C2=A0
> Or can aach64_be be added into the work of next release?

I think Alex has given some hints on debugging.

The test matrix on the project autobuilder is primarily driven by the
project members and none of the project's current members have asked
about adding BE arm support.

There is a lot of work in adding and supporting a new architecture to
the test matrix so it is something we can only really do if there was
significant demand, or member sponsorship. I'd also like to see RISC-V
there but we haven't found anyone willing to sponsor it.

Cheers,

Richard



