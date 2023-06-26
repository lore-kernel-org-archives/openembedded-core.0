Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B28CEB64D7
	for <webhook@archiver.kernel.org>; Mon, 26 Jun 2023 10:29:03 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web10.4530.1687775337233001328
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Jun 2023 03:28:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=WkWZUS8w;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.44, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f9c88ac077so39956855e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 03:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687775335; x=1690367335;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MFRtwRikxTS2zxFHTu3h7dERIhYmnAd5UISFqc3ezvA=;
        b=WkWZUS8wBi7TPWF4XbXUN3/MAEcaJ9zuZlmt/02/VtFaI8SWKaGefuoSfzQtHN3Crc
         qIwqbgMwtHNfV0dy4xtUnsvJ5PtmgRTqP0z7jwpKR8LzenqJSnNNoYHTv1GBvQ2lvv6E
         /2KZgvnijjK8rNGT2UkNGGdM633e9mUziWq2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687775335; x=1690367335;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MFRtwRikxTS2zxFHTu3h7dERIhYmnAd5UISFqc3ezvA=;
        b=aWpBYIJyWWI/rIchF0Kr/tfULbKnhY9r6arZCmzm2SzKn2bAhhWN30tFpCmIt+jARU
         lGx2dV+a58I5J/fPT9MJ/oPZt2hslk6bUZToxHuMnE6TjBQgzvWi+kiraw7dgNrGFp/0
         qwWi7bUhwswZPZULGlkA95GV3VdcdcRq7gYQgjWOKAPwDemWA9hFh/I/IEk1WZhrpMQH
         D5Nnm11DbqOnVWqn+jQLRcNm2MdcnB5dzBKPuUOS0FsatoN7dsnDj9tK72D5oMtzqnaz
         ZjpjakBF1rn88+R2mBc4OaWRPNmfPZmvPvxgCuQgHOC2CntyifpfCGoDwfL3UJCzZilj
         rcIA==
X-Gm-Message-State: AC+VfDz2DtVVum2eeOobEzOdpA8NeRGW1cBCMLX4wLKu+t0RU/L+aUu/
	ortLeSSh+9gals/TStOjyNjfGA==
X-Google-Smtp-Source: ACHHUZ5evtveyj6SbJUqF3yNnP9xTX4t6P9bI8JB1PLYqmuzgv3Jrt8AeoPqbbpC28YZ4N6ugOk58g==
X-Received: by 2002:a7b:ca4c:0:b0:3f9:b30f:a013 with SMTP id m12-20020a7bca4c000000b003f9b30fa013mr15761358wml.6.1687775335603;
        Mon, 26 Jun 2023 03:28:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3f54:77a:5419:fb87? ([2001:8b0:aba:5f3c:3f54:77a:5419:fb87])
        by smtp.gmail.com with ESMTPSA id k37-20020a05600c1ca500b003f9b3829269sm16522983wms.2.2023.06.26.03.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 03:28:55 -0700 (PDT)
Message-ID: <00b7c129a959d0a53f218513106c46241976d466.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] qemu: Install the default qemu emulation rpm
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 26 Jun 2023 11:28:54 +0100
In-Reply-To: <20230615081705.96399-1-mingli.yu@eng.windriver.com>
References: <20230615081705.96399-1-mingli.yu@eng.windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 Jun 2023 10:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183410

On Thu, 2023-06-15 at 16:17 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> The qemu rpm can be split or not via customize PACKAGESPLITFUNCS and
> there is no specific qemu emulation rpm installed when we choose split
> the qemu rpms now.
>=20
> To gurantee the basic usage, install the qemu emulation rpm which
> corresponding to the target arch by default when split the qemu rpm.
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/=
qemu/qemu.inc
> index 7d39f0a25d..c9df43a5a2 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -248,6 +248,9 @@ python split_qemu_packages () {
>      mipspackage =3D d.getVar('PN') + "-user-mips"
>      if mipspackage in ' '.join(userpackages):
>          d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX"=
) + 'bash')
> +
> +    targetarch =3D "${@'i386' if d.getVar('TARGET_ARCH') in ['x86', 'i48=
6', 'i586', 'i686'] else d.getVar('TARGET_ARCH').replace('_', '-')}"
> +    d.appendVar('RRECOMMENDS:' + d.getVar('PN'), ' ' + d.getVar('PN') + =
'-user-' + targetarch + ' ' + d.getVar('PN') + '-system-' + targetarch)
>  }
> =20
>  # Put the guest agent in a separate package

I did originally say that I thought the qemu package should pull in all
of the sub packages to maintain compatibility. I'm not sure having it
pick the host architecture like this is a great idea and certainly it
changes the default behaviour again.

I'd much rather than picked a design then implementing it than keeping
changing behaviour like this :(.

I'm not seeing many other opinions though.

Cheers,

Richard



