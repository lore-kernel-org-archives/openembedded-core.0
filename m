Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1356CC64ED8
	for <webhook@archiver.kernel.org>; Fri, 24 Feb 2023 10:15:59 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.14526.1677233758484027894
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Feb 2023 02:15:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dvw2/18l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id fm20-20020a05600c0c1400b003ead37e6588so1743397wmb.5
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 02:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IBbB8zAXxi5OdV35lBCMxvvDEkbW10bjd+1djnv3o00=;
        b=dvw2/18lOXnIp5OtgcpDVdqZ8efld3Zbl5janWtskSaTDKDbHXP4VOElzhcS3szBsm
         mJ8V5wPOkjMcpAghWTWR7pPWe52KOY1Md0PfY9ec8/4PiLpDw1BjQvjhiXlOSgYVNDvV
         Mkx2C38Of7c1Ke2uwvBrK8Ur0WvLEMr81eBV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IBbB8zAXxi5OdV35lBCMxvvDEkbW10bjd+1djnv3o00=;
        b=l41mUML0UquFe2umIMWmS1NLUXWcQN4ZUxFjfveH9fkfsYJR4VKy43ZEKeUg8Kul9Z
         y3FQYw1cR62sCmZnOc7aOjtzD3m7UEtb8pM81+OEpq7vpDBS4KynFj4Srk+5fTnXxmEf
         +KSvfhpL+QQ477mWgYMvwNnQFirCKy+iZF8CFwMdBmjTJBlc26M4lZJCzV1VXOoRuuzQ
         foqfp5+LxDOWEZybT2MFJVnGMF0MSka1WY8k0kd1p2D5fFECWoVguVr0N66TNtWMsiTa
         b8JCx0P5i28uIw4XqyCUdmFqr+tIpV1ekGZte5wNoNeo+qQJAcXxFej8yPLxoWvB8nCt
         boCw==
X-Gm-Message-State: AO0yUKXdmaC5eKErn5DhUTQiKfUJlahiwqvGnef1u5rVZiCePSqha2E4
	RdZKj/y12ZWnvq7oWrHJnRmdaw==
X-Google-Smtp-Source: AK7set9skf+yBLRZT1iGqIoRSiWeuAUR5SH/512ji+SJDUOe02wBbEeMDC56npbKClLD3Nnr1+Y9eg==
X-Received: by 2002:a05:600c:4da2:b0:3ea:bc08:b63e with SMTP id v34-20020a05600c4da200b003eabc08b63emr3301273wmp.2.1677233756791;
        Fri, 24 Feb 2023 02:15:56 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7? ([2001:8b0:aba:5f3c:639b:9979:fd5f:bbb7])
        by smtp.gmail.com with ESMTPSA id d18-20020a05600c34d200b003e6dcd562a6sm2360110wmq.28.2023.02.24.02.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 02:15:56 -0800 (PST)
Message-ID: <cdfcc4e555f8093eb7672e167af45933ac27730e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/4] vala: Fix install conflict when enable
 multilib.
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2023 10:15:55 +0000
In-Reply-To: <1677206695-16822-2-git-send-email-wangmy@fujitsu.com>
References: <1677206695-16822-1-git-send-email-wangmy@fujitsu.com>
	 <1677206695-16822-2-git-send-email-wangmy@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Feb 2023 10:15:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177674

On Fri, 2023-02-24 at 10:44 +0800, wangmy wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
>=20
> Error: Transaction test error:
>   file /usr/bin/vala-gen-introspect-0.56 conflicts between attempted inst=
alls of lib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64
>   file /usr/bin/vapigen-wrapper conflicts between attempted installs of l=
ib32-vala-0.56.3-r0.armv7ahf_neon and vala-0.56.3-r0.aarch64
>=20
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-devtools/vala/vala.inc | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/=
vala/vala.inc
> index d3daee37dc..90689662cb 100644
> --- a/meta/recipes-devtools/vala/vala.inc
> +++ b/meta/recipes-devtools/vala/vala.inc
> @@ -66,3 +66,6 @@ PACKAGE_PREPROCESS_FUNCS +=3D "vala_package_preprocess"
>  vala_package_preprocess () {
>  	sed -i -e 's:${RECIPE_SYSROOT}::g;' ${PKGD}${bindir_crossscripts}/vapig=
en-wrapper
>  }
> +
> +inherit multilib_script
> +MULTILIB_SCRIPTS =3D "${PN}:${bindir}/crossscripts/vapigen-wrapper ${PN}=
:${bindir}/vala-gen-introspect-0.56"

This looks a bit odd since crossscripts wouldn't be installed on the
target?

Also, when posting these kinds of changes, can you show a diff of the
two files please?

Sometimes we can tweak the files so that they can become the same but
it is hard to know without context.

Cheers,

Richard

