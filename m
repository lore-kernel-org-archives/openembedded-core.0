Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB69C4167D
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:45:44 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.46168.1702601140808504453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:45:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VHkOUSSZ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40c25973988so1509535e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Dec 2023 16:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1702601139; x=1703205939; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1OPmz2zkMnuKOwQiOiglhlwYuz11CyfeGXj5lN08gZc=;
        b=VHkOUSSZmRjmTwz+GQROT9UzCgZEJ21nlpOv97wgowxJ4WfzWTAzd3cenhT1MK3+9a
         irWYq+UTiM9le31hPRWe/uBsy9FdZ+aTNv5bp8ojAeishuhKF/9v9pfX3ygO23khTg8g
         /CBzBWjBuMhrA7v1UQQHkxQyP+xmV8EKczosE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702601139; x=1703205939;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1OPmz2zkMnuKOwQiOiglhlwYuz11CyfeGXj5lN08gZc=;
        b=bjg6u/La6CHSr+Sorb8w+YDTTCXLW2jLJxGcuvN2sXKe5yrh+tqQUpqopFO6OJ0ueH
         YKoXUs5R1uMp+J5bc8q5JHwRwPqb06h9VvGiGSTYWrAfCPLA7TFqHdNzNSsWj9NluXTL
         BoZp3glVtq1saHrz6lipEPQSVXoPud4xN9KtjLlUcy2cwzQuOpJexlu8Ghla+tblhFPv
         AQmRYNenk7nOJzdaAkEr9qfnAPIrzOqkTgxQHXViDZkrzHGgrNQ+pIpvWYtl6HRxQAsW
         GESli6xszMZc63yXan2mB6VphTZxNBnnTjcZxZuAlqd/jfvAC3XrJ/i4FWHmMtsAw9Kp
         KmRg==
X-Gm-Message-State: AOJu0YwrNdfWxrDOI1zOuxRO5Bo9SlabzwX32YkN6LNg2yskwtiTiU7X
	MQDEW7lCFbYESymlG3d84tB7Lg==
X-Google-Smtp-Source: AGHT+IFeK+vhwITDld7W46EHGdb6uUgivDnM/VJ2KZDwFv0zHBCPaxPDTvNgrf4+LLzjropcB9vWEg==
X-Received: by 2002:a05:600c:4711:b0:40b:5e21:e26f with SMTP id v17-20020a05600c471100b0040b5e21e26fmr4902009wmo.92.1702601139048;
        Thu, 14 Dec 2023 16:45:39 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:a04:9eb3:3437:42f8? ([2001:8b0:aba:5f3c:a04:9eb3:3437:42f8])
        by smtp.gmail.com with ESMTPSA id m14-20020a05600c4f4e00b0040b30be6244sm26635218wmq.24.2023.12.14.16.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 16:45:38 -0800 (PST)
Message-ID: <39e33a9ddaf716823c30792293002a211ea2181d.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] util-linux: Delete md-raid tests
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Fri, 15 Dec 2023 00:45:38 +0000
In-Reply-To: <20231214193436.224539-1-raj.khem@gmail.com>
References: <20231214193436.224539-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 00:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192411

On Thu, 2023-12-14 at 11:34 -0800, Khem Raj wrote:
> These tests are marked as known failures upstream as well [1]
> if we delete them then we can drop dependency on mdadm for ptests which
> can further reduce the dependency chain for ptest enabled minimal images
>=20
> [1] https://github.com/util-linux/util-linux/commit/7519c3edab120b1462393=
1d5ddb16fdc6e7cad5d
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/recipes-core/util-linux/util-linux_2.39.2.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/util-linux/util-linux_2.39.2.bb b/meta/rec=
ipes-core/util-linux/util-linux_2.39.2.bb
> index 927037a3429..8c081674017 100644
> --- a/meta/recipes-core/util-linux/util-linux_2.39.2.bb
> +++ b/meta/recipes-core/util-linux/util-linux_2.39.2.bb
> @@ -137,7 +137,7 @@ RDEPENDS:${PN}-dev +=3D " util-linux-libuuid-dev"
>  RPROVIDES:${PN}-dev =3D "${PN}-libblkid-dev ${PN}-libmount-dev"
> =20
>  RDEPENDS:${PN}-bash-completion +=3D "${PN}-lsblk"
> -RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs findu=
tils grep iproute2 kmod mdadm procps sed socat which xz"
> +RDEPENDS:${PN}-ptest +=3D "bash bc btrfs-tools coreutils e2fsprogs findu=
tils grep iproute2 kmod procps sed socat which xz"
>  RRECOMMENDS:${PN}-ptest +=3D "kernel-module-scsi-debug kernel-module-sd-=
mod kernel-module-loop kernel-module-algif-hash"
>  RDEPENDS:${PN}-swaponoff =3D "${PN}-swapon ${PN}-swapoff"
>  ALLOW_EMPTY:${PN}-swaponoff =3D "1"
> @@ -320,6 +320,12 @@ do_install_ptest() {
>      if ! ${@bb.utils.contains('PACKAGECONFIG', 'pam', 'true', 'false', d=
)}; then
>          rm -rf ${D}${PTEST_PATH}/tests/ts/chfn
>      fi
> +    # remove raid tests, known failures and avoid dependency on mdadm th=
erefore
> +    # See https://github.com/util-linux/util-linux/commit/7519c3edab120b=
14623931d5ddb16fdc6e7cad5d
> +    rm -rf ${D}${PTEST_PATH}/tests/ts/blkid/md-raid0-whole
> +    rm -rf ${D}${PTEST_PATH}/tests/ts/blkid/md-raid1-part
> +    rm -rf ${D}${PTEST_PATH}/tests/ts/blkid/md-raid1-whole
> +    rm -rf ${D}${PTEST_PATH}/tests/ts/fdisk/align-512-4K-md
>  }
> =20
>  # Delete tests not working on musl
> -

This sounds good to me, thanks!

Unwinding a few dependencies like this can make all the difference to
build times.

Cheers,

Richard

