Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB42C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 15:38:51 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.46422.1670859528438047809
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Dec 2022 07:38:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=DpVnPRC3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id i187-20020a1c3bc4000000b003d21f02fbaaso32156wma.4
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 07:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BEp3PYmmlq8eO7n/mGvU3kFIE8G+qn8D5NOcN/3vKwM=;
        b=DpVnPRC3Ivt7tZgSTY41BPIoL21s/Qg7qVobNwS2hFnx3052I3PVXGLcM/XAema2SH
         c7glxEikwhp0frZtoK69RqmwFHQr1qk8cIUMZC0wqJl1OrREfQtR9OfXw0PLYYBntC01
         qYM/hRqcGrBct14RPG27R7WKq/I/3lejJxRc8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BEp3PYmmlq8eO7n/mGvU3kFIE8G+qn8D5NOcN/3vKwM=;
        b=Yu++vubFRY1RcXphZm/hN5f7JpuvhsYPB67B1dgoqJ7P4fZxfLXsWNCMqlaj+VZnZX
         kwr5DkAMQZ1pxI6g6ZzYuiwNDiF3DILpzOaoMEewDVn1YNvwKcW05yIAsprjGDevLwDv
         yXjlwQSjHaAbI5HQLOBH8hj16JpLTYYrWqGej1gXmCeYDaA6IhHwNV2+Ntg6bLRtIOu3
         Bs9TgvYpi4FHrTb9xBvZnvqQbgvH5E2Dno2sfCyRUuDf00HL/licSNDmPHdZdy9tWVmb
         PuY53ZqGX1lT4DgMf3jdntzr6Or/Z3ug6rHjpX7jZAMxk6HI3B5KdZXKKNpQUH5N6pyt
         FC4w==
X-Gm-Message-State: ANoB5pmpOMtwtygpMN0OaLJW9hb/YQuiqdN+GBrNowp1KfWEjFBjp0id
	i+mDBEHBg5qzCYO9huf+ZZQNLg==
X-Google-Smtp-Source: AA0mqf4broEab64GvT58J9tLnoXmdq3I85nyjPLNdbCbjyPmEqef85ssEDpPFa9W7FVSCdJWUEHoSg==
X-Received: by 2002:a05:600c:3d92:b0:3c6:e60f:3f4a with SMTP id bi18-20020a05600c3d9200b003c6e60f3f4amr13080872wmb.1.1670859526828;
        Mon, 12 Dec 2022 07:38:46 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:cbbc:8f6d:4f6e:ffe4? ([2001:8b0:aba:5f3c:cbbc:8f6d:4f6e:ffe4])
        by smtp.gmail.com with ESMTPSA id p4-20020a1c5444000000b003d1e051f671sm9499577wmi.9.2022.12.12.07.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 07:38:46 -0800 (PST)
Message-ID: <b6e6a28b7a6ca8f283f1a726504f9be9032d9921.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 1/2] meson: drop redundant is_debianlike()
 patch
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@arm.com>, 
	openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Date: Mon, 12 Dec 2022 15:38:45 +0000
In-Reply-To: <20221212152542.3762880-1-ross.burton@arm.com>
References: <20221212152542.3762880-1-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Dec 2022 15:38:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174496

On Mon, 2022-12-12 at 15:25 +0000, Ross Burton wrote:
> This patch disables is_debianlike() so that it always returns False in th=
e
> name of deterministic builds.  However, the caller default_libdir() then
> looks at the host filesystem to decide if /usr/lib64 exists and will
> return either lib or lib64, so it still isn't deterministic.
>=20
> This is only used for the default libdir value and meson.bbclass
> always passes an explicit --libdir, so this is moot.
>=20
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  ...01-is_debianlike-always-return-False.patch | 27 -------------------
>  meta/recipes-devtools/meson/meson_0.64.0.bb   |  1 -
>  2 files changed, 28 deletions(-)
>  delete mode 100644 meta/recipes-devtools/meson/meson/0001-is_debianlike-=
always-return-False.patch
>=20
> diff --git a/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-=
return-False.patch b/meta/recipes-devtools/meson/meson/0001-is_debianlike-a=
lways-return-False.patch
> deleted file mode 100644
> index a9a32e2b7a1..00000000000
> --- a/meta/recipes-devtools/meson/meson/0001-is_debianlike-always-return-=
False.patch
> +++ /dev/null
> @@ -1,27 +0,0 @@
> -From 361f51c2c7685491186703e8f26be991ab698edc Mon Sep 17 00:00:00 2001
> -From: Alexander Kanavin <alex@linutronix.de>
> -Date: Mon, 18 Oct 2021 15:55:59 +0200
> -Subject: [PATCH] is_debianlike(): always return False
> -
> -Otherwise, host contamination happens.
> -
> -Upstream-Status: Inappropriate [oe-core specific]
> -Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> -
> ----
> - mesonbuild/utils/universal.py | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/mesonbuild/utils/universal.py b/mesonbuild/utils/universal.=
py
> -index 570edd6..4119aa5 100644
> ---- a/mesonbuild/utils/universal.py
> -+++ b/mesonbuild/utils/universal.py
> -@@ -634,7 +634,7 @@ def is_cygwin() -> bool:
> -=20
> -=20
> - def is_debianlike() -> bool:
> --    return os.path.isfile('/etc/debian_version')
> -+    return False
> -=20
> -=20
> - def is_dragonflybsd() -> bool:

I have a nasty feeling that there may be meson users out there which
call into this as an API function :(

Cheers,

Richard



