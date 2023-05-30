Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE48C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 21:23:46 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.786.1685481818145952733
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 14:23:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=LNPCwwpG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f70fc4682aso10135005e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 14:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1685481816; x=1688073816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCLzCnH5aU41aDo7AxsRa7sd38l86O+0V0D0Y81IiNY=;
        b=LNPCwwpGm747eetoPFH9262FfDTAxWhrwy4OotM7G3EZsIqF0aNNBWDWW76e+WwxA9
         merTYg+Y4ISjvIOrW303lmR4CWYpddLoGZIpUwx++M/Y9Lx7fRB9DV/yQPvkEiOIJJlL
         WQM/S3828ZVyxXZsKHUeH4qrjduO1avC4FUcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685481816; x=1688073816;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fCLzCnH5aU41aDo7AxsRa7sd38l86O+0V0D0Y81IiNY=;
        b=koLk32kfzzgoDR2L45y5TE8Ap456MBI6owS7ueH304RiTIAtJ/fIbE/t6q8axmhgTY
         oUseYpL6+VPIwAFHgLxWcS43RAcNGJqg2SlVOWFLapTtia++sJH1HHG7k9ju5v9I/xxf
         i5OcsyZkvlHQbzWevtygkNSbdXHSFaO6Ffh+2Mn06kGDnsjyGR6/GrdkaGKiiqk+CvuR
         eGiUjcgs8Lq0we5HRrTuCb9TPQIgeH3VrwhWlmzUQ6YQunuO5XiSAUm3VO+rlJUJNq7q
         tDXFMuzjNnxN8hbWpR0PIpZ7hKZYrdCqGvpS5697KyeA/++jCEFsWJ8kim3CfREAWKaL
         EwXQ==
X-Gm-Message-State: AC+VfDwuCXpa6HID+v1QU+g2pPskY1KitaLj+GGJ6eqoqvO//mUaJHWN
	RoN4uQuiYHxCqBjYfGYLGrkFAw==
X-Google-Smtp-Source: ACHHUZ7tvJEVRpEQqJPCFfkvIsJm0DAU4vrCiz+a+gqjt9lOMroBljZV0Ypi9YS9hQpemp8NtjviTw==
X-Received: by 2002:a5d:6188:0:b0:309:33c4:52e1 with SMTP id j8-20020a5d6188000000b0030933c452e1mr2295817wru.64.1685481816430;
        Tue, 30 May 2023 14:23:36 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c24d:d0cb:1f56:b422? ([2001:8b0:aba:5f3c:c24d:d0cb:1f56:b422])
        by smtp.gmail.com with ESMTPSA id x11-20020a5d490b000000b003063a92bbf5sm4393714wrq.70.2023.05.30.14.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 14:23:36 -0700 (PDT)
Message-ID: <bf7d98b4ee31c416072db5437da44ce7a4c0f841.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] classes/package: mark PKGDATA_VARS as a
 dependency of emit_pkgdata
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Joshua Watt <JPEWhacker@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 30 May 2023 22:23:35 +0100
In-Reply-To: <20230530204117.949199-1-JPEWhacker@gmail.com>
References: <20230530204117.949199-1-JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 21:23:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181953

On Tue, 2023-05-30 at 15:41 -0500, Joshua Watt wrote:
> emit_pkgdata needs to re-run when PKGDATA_VARS changes, but bitbake is
> unaware of this because the code that uses it is in a python library.
> Fix this by explicitly marking PKGDATA_VARS as a dependency
>=20
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes-global/package.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/pa=
ckage.bbclass
> index e8055a9cdc5..c466601266e 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -381,6 +381,7 @@ python emit_pkgdata() {
>      import oe.packagedata
>      oe.packagedata.emit_pkgdata(pkgfiles, d)
>  }
> +emit_pkgdata[vardeps] +=3D "PKGDATA_VARS"
>  emit_pkgdata[dirs] =3D "${PKGDESTWORK}/runtime ${PKGDESTWORK}/runtime-re=
verse ${PKGDESTWORK}/runtime-rprovides ${PKGDESTWORK}/extended"
> =20
>  ldconfig_postinst_fragment() {

Is the auto dependency code somehow breaking for that function?

Cheers,

Richard

