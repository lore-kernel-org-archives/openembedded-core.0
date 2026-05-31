Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C15CD6E52
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 17:26:48 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11234.1780248399644560922
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 10:26:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=CLbXfBwx;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4905e190c71so84263025e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 10:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1780248398; x=1780853198; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UGJ9t40lHZbmWe9rgW9OcmSlRksxN+4Ps222eJi/C8=;
        b=CLbXfBwxpPpWgxOXrZYu4scQEI2/JcTcoGScTsfFctN2gdVQLRRtO3qf3SEveEI/Fe
         dwdErIr0OQbiB+RVPFWhAuvO9PoH8wIOZuEYvt5/hRaWCLMV3B0uo02TALf3hOQoc8mW
         IOrFjoGhYggdYUzfD35JBpElw3VH/5KvDO/no=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780248398; x=1780853198;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+UGJ9t40lHZbmWe9rgW9OcmSlRksxN+4Ps222eJi/C8=;
        b=NX7LiZcyS0VH9EAV7A+exl37brb6FsqfI3g2F+iSjEQJdvR9o+gb5YAvpVmZu3biM+
         ho2rcUojIF5LL4azRTGqJEakuNAMlDhpo8lpu6QTTJRHxthecqCnoyg15M8oNVD//+zo
         C8AMnPFOjb8qrjcDpC+w4Vei4FrvIHgkxmxXXfKGUl2nl6rPBDqvaf+k0D8CfC9w6IUl
         CiMmhVYJALJT72kHG0kXqlSjov73kPWKcjmMj7tOpdDMHhyc8QMYphBVGeUd+xv5JIGn
         kLe07OMh56O+IddKHMy/eVi2vO6oxz59YoWRvwep9FZrxCMR8Ltp/R5Cph8oTjHavdrl
         3Vng==
X-Forwarded-Encrypted: i=1; AFNElJ/e5ylBYrETADgZVmBGujvufPrCxA4/K2w6JayEvTOZVd23ofvJGnAH41M7hJjQXVT/lGwHtoo4rHOBgeAemyKBAA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw5wkiAJOtEw88cyziaRV2luweMPxZMNowinUz07AnHRhOUsnfX
	ssvRBb2VkdKe561qkITHkYt+wy8PYgV1SXhrwOu3gQ6aDJI/jcYdg9EreWRYsr80SQU=
X-Gm-Gg: Acq92OGKRdLokuApgdYJMwMgknbqQfm/CJ3gAs1EbLkAvJCNPu0kUEoeiV5CPYbnkw0
	s9sOTkiLIvl6cKMKjQrSDc4pycVxNmXLKlFVW4WV9WD7A2b0maOloHONou8re5H0As9R8qNnCeC
	gvCB5bRYvO6bMsF8PmhqhV2Vd9R2EJdtuLoOq3vINLlXmPoqRL6cP2Edms66Nqjq7W8MPeQPIcL
	YJh/Yuyo4/grxGWHIqrE0bA1B7j0IanhN/+Nmnq5KuwJpdfSmWJPc1Vn04sN8hSsHAIyH1+wQTu
	4csamnjquOh8yrWMUnfclk0+WSp3ZT+jiw5YOEv+IjnlVzvaqLux+8pksFLVGx89jBNS8VpjfiV
	FkpF3TF7OD1J9psJumFb3rCOz20pqduZOORUyvk02+idwH5D0unABk1kJpkJJgXfIKy+k9siF2Z
	zgMPml0Hh+TOJdsq3j3rYabg0Jp77JjZZ6Bn1chs9DjUWK18TiWXG4OVWyl0STNNS89S3TAJbaZ
	CRTlHiRA8GoKnMnvQFlTFFXseCDchhK/++t0Q==
X-Received: by 2002:a05:600c:3553:b0:490:9588:bd6a with SMTP id 5b1f17b1804b1-490a29341c6mr142384355e9.21.1780248397825;
        Sun, 31 May 2026 10:26:37 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:229e:2449:eb7c:dbd2? ([2001:8b0:aba:5f3c:229e:2449:eb7c:dbd2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb470sm161670005e9.10.2026.05.31.10.26.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 10:26:37 -0700 (PDT)
Message-ID: <2c47dc98209c6874d1e2c9726a5d24881b059d6e.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] vim-tiny: bugfix lack of defaults.vim
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: zhengrq.fnst@fujitsu.com, openembedded-core@lists.openembedded.org
Date: Sun, 31 May 2026 18:26:36 +0100
In-Reply-To: <20260528020658.789-1-zhengrq.fnst@fujitsu.com>
References: <20260528020658.789-1-zhengrq.fnst@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 17:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237799

On Thu, 2026-05-28 at 10:06 +0800, zhengruoqin via lists.openembedded.org w=
rote:
> When vim-tiny was used in image, it lacks defaults.vim file which will ca=
use following error
> root@qemux86-64:~# vi
> E1187: Failed to source defaults.vim
> Press ENTER or type command to continue
>=20
> So add vim-common as RDEPENDS to provide defaults.vim file to fix this is=
sue.
>=20
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
> ---
> =C2=A0meta/recipes-support/vim/vim-tiny_9.2.bb | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-support/vim/vim-tiny_9.2.bb b/meta/recipes-supp=
ort/vim/vim-tiny_9.2.bb
> index e4c26d23f6..b6ddded381 100644
> --- a/meta/recipes-support/vim/vim-tiny_9.2.bb
> +++ b/meta/recipes-support/vim/vim-tiny_9.2.bb
> @@ -8,5 +8,7 @@ do_install() {
> =C2=A0=C2=A0=C2=A0=C2=A0 install -D -m 0755 ${S}/src/vim ${D}/${bindir}/v=
im.tiny
> =C2=A0}
> =C2=A0
> +RDEPENDS:${PN} +=3D "vim-common"
> +
> =C2=A0ALTERNATIVE_PRIORITY =3D "90"
> =C2=A0ALTERNATIVE_TARGET =3D "${bindir}/vim.tiny"

Doesn't adding dependencies like this defeat the point of vim-tiny in the f=
irst place?

Can we configure that out instead?

Cheers,

Richard

