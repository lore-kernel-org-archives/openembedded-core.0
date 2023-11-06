Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93833C4332F
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 10:45:09 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.50919.1699267501125181952
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Nov 2023 02:45:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ccg/Mb4Q;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.171, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c514cbbe7eso60919311fa.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 02:45:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1699267499; x=1699872299; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6iJTQWhRiR/Y5gFCE7GE2cexdi2uwxclWrOlIivgx7Q=;
        b=Ccg/Mb4QCuTm7U/ex+/SlBfsHp/hqDiaUyELEiWqaLnu45O8ohgtiSenUNKOT96jaN
         Cg8DVfOJkAesBL2iAokMTZEjb0VcwZajXeniWxkweon/mPiOtjqHooMoxR8g7JYRnRRa
         c5qBfSrG6yaB29sH1iuVL57/yOL+n8jKEzoLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699267499; x=1699872299;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6iJTQWhRiR/Y5gFCE7GE2cexdi2uwxclWrOlIivgx7Q=;
        b=EaovcF2EB4MuGDUJ8SSLZu8diW7R3js6P4e8p2S10P1b7coJ+RWqB+qykvsxs4pRaW
         o8jxdbErtluZcDvF8wyd52WT3JKeaxeIOfozTtbihR/8LB1UKoKjdzREVyqr2a7YhOql
         xarTWXM76zAlRjfn5WOCIgNrg2PRW8KWinf/dPuo9vA6FLHqA4xARC9NypSJEphMX1m+
         7BI6S3dbyb3FLdlzL8GfGIlqnrAusyrdTtP4518MP8UzK/GDVz09sApadqOueRpxpVR7
         FMUL5+OZiUtHbPOSAMK1k1woMAvF+D3lZaH6TXldPgjXq9h8xU9Bzx8z1Y+Jr54VkBpB
         PxPQ==
X-Gm-Message-State: AOJu0Ywyr/Jk1ycAP62YFY1e9aC2mL/WFQ8efMjLv7mVGqosgdtKj5xt
	nu/J12KNHNIwMw3tNtG0bs8w0Q==
X-Google-Smtp-Source: AGHT+IHzo1EoBmJxort6HRsig1GU4g7gMzz9ePOf2nhubSO4xvNzxcW3ZVClrYVxZ4NFF/GuMnzvMw==
X-Received: by 2002:a2e:a793:0:b0:2c5:8b1:7561 with SMTP id c19-20020a2ea793000000b002c508b17561mr28093601ljf.10.1699267499066;
        Mon, 06 Nov 2023 02:44:59 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:1ccc:c310:74c7:1597? ([2001:8b0:aba:5f3c:1ccc:c310:74c7:1597])
        by smtp.gmail.com with ESMTPSA id l26-20020a05600c1d1a00b003fef5e76f2csm11057746wms.0.2023.11.06.02.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 02:44:58 -0800 (PST)
Message-ID: <f772002b508b7a29fec7957f072a33dee36bf627.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH][master] poky-tiny: fix PACKAGE_EXCLUDE
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Mon, 06 Nov 2023 10:44:57 +0000
In-Reply-To: <20231106103516.361162-1-ross.burton@arm.com>
References: <20231106103516.361162-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Nov 2023 10:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190200

On Mon, 2023-11-06 at 10:35 +0000, Ross Burton wrote:
> From: Ross Burton <ross.burton@arm.com>
>=20
> poky-tiny does a PACKAGE_EXCLUDE on shadow-base as the kernel doesn't
> support multiple users.  However it does this by assigning to an
> override, which makes it impossible for images or machines to extend
> PACKAGE_INCLUDE with their own exclusions.

PACKAGE_INCLUDE?

>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta-poky/conf/distro/poky-tiny.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-poky/conf/distro/poky-tiny.conf b/meta-poky/conf/distro=
/poky-tiny.conf
> index 32c2ec3e1fa..24bcbee9bb6 100644
> --- a/meta-poky/conf/distro/poky-tiny.conf
> +++ b/meta-poky/conf/distro/poky-tiny.conf
> @@ -125,4 +125,4 @@ PACKAGECONFIG:remove:pn-opkg-utils =3D "python"
> =20
>  # If shadow-base is brought into the image, logins will fail because it
>  # doesn't have the heuristics to work when CONFIG_MULTIUSER is unset.
> -PACKAGE_EXCLUDE:poky-tiny =3D "shadow-base"
> +PACKAGE_EXCLUDE +=3D "shadow-base"

Does yocto-check-layer still pass?

Cheers,

Richard

