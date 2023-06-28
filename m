Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80E01EB64D7
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 22:04:01 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.2240.1687989835462933208
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Jun 2023 15:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=aWVsRGVC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3fb10fd9ae9so162435e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 15:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687989834; x=1690581834;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KPB+WbHMexCPqMTei+kPPjX6pMfUzY8xrvrIDHZjs4o=;
        b=aWVsRGVCnF1FlzinONFrzDYgoQtErs8y0nXeW9cNmDK2uU2hjW6jttE/llTTE2PLKb
         mpqAV7X8fLtMryOJ5q1vUzKdNxfr0CvAdUewAY8XE+YArrw4KxTcysPRTpiQsiRL56TW
         q9AGEfZEg3+mxLDSSncynZnyAR77/BPlV1Dys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687989834; x=1690581834;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KPB+WbHMexCPqMTei+kPPjX6pMfUzY8xrvrIDHZjs4o=;
        b=QugYjyfcp5XrE3+p0FuvDLhQEFy2DfIgb7ewGOA4MtSKaGkg7xf7V6idNgu5oNY0nQ
         uRIl2OsJDWovSnr9bSSbiQzuhY8CY7gULcRGUJM5/tvcuZ4BcFdNYz1nU1+YFGqur8Bw
         oSmpGNVj8+Akrg4tyZTxrtQFCHJbYGrQtOfTMTKRW6MWWwQShCY1nzgXPOVBTY1Du1yz
         JxjpuGN0dqVGsgRDg0RSY72ykcfywl5cCncM2KzS1xBmlyhJMIKLrnXCJH3X0D2Ryz9F
         tzplMYvCD1PIunnep8AaUGf3wdO0BDdkklWQXfRKCSXgRFnxTiZE544oa+y/Cjtg0qCY
         dwGQ==
X-Gm-Message-State: AC+VfDxT/8lB4jOPegHyA9TXnyGH86Jc/4RdfboxaxlbAlF+FSV660dN
	mVuVIK15FKiTGU896gy8Vj83GA==
X-Google-Smtp-Source: ACHHUZ7KkjEZq33fyXsl7rfC05BD5ZHkXElpSl/sRU7oWDdXM6jrRbaZTvgZcWHU6EG1BiOEbYrmiA==
X-Received: by 2002:a05:600c:3658:b0:3fb:b1fd:4172 with SMTP id y24-20020a05600c365800b003fbb1fd4172mr2339481wmq.22.1687989833812;
        Wed, 28 Jun 2023 15:03:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717? ([2001:8b0:aba:5f3c:5a50:d5ad:bafb:a717])
        by smtp.gmail.com with ESMTPSA id q17-20020a5d6591000000b0030796e103a1sm14495019wru.5.2023.06.28.15.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 15:03:53 -0700 (PDT)
Message-ID: <1a0b9d4f242c13cb524d587661b02688d607a30e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 5/5] init-manager-systemd: add modulesloaddir
 and modprobedir
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Date: Wed, 28 Jun 2023 23:03:52 +0100
In-Reply-To: <20230627101644.881715-5-jose.quaresma@foundries.io>
References: <20230627101644.881715-1-jose.quaresma@foundries.io>
	 <20230627101644.881715-5-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 22:04:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183603

On Tue, 2023-06-27 at 10:16 +0000, Jose Quaresma wrote:
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>=20
> v5: introduced in v5
>=20
>  meta/conf/distro/include/init-manager-systemd.inc | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/meta/conf/distro/include/init-manager-systemd.inc b/meta/con=
f/distro/include/init-manager-systemd.inc
> index 7867d90028..4989b93502 100644
> --- a/meta/conf/distro/include/init-manager-systemd.inc
> +++ b/meta/conf/distro/include/init-manager-systemd.inc
> @@ -5,3 +5,7 @@ VIRTUAL-RUNTIME_init_manager ??=3D "systemd"
>  VIRTUAL-RUNTIME_initscripts ??=3D "systemd-compat-units"
>  VIRTUAL-RUNTIME_login_manager ??=3D "shadow-base"
>  VIRTUAL-RUNTIME_dev_manager ??=3D "systemd"
> +
> +# Use modules-load and modprobe config path distribution specific
> +modulesloaddir ?=3D "${libdir}/modules-load.d"
> +modprobedir ?=3D "${nonarch_base_libdir}/modprobe.d"

Not everyone uses INIT_MANAGER and we don't really want these set in
every recipe. I think this should be in the bbclass based upon some
conditional, not here...

Cheers,

Richard

