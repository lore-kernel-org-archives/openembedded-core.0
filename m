Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D736C46467
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 20:13:36 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web10.29210.1673122414593049364
 for <openembedded-core@lists.openembedded.org>;
 Sat, 07 Jan 2023 12:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dHdFzix2;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id g19-20020a05600c4ed300b003d9eb1dbc0aso473467wmq.3
        for <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 12:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HPLsqBBcYfdG7o8OqSkFjzM/XaIPLuPeM+BhWfKVCzU=;
        b=dHdFzix2e9OSakgTin9o9cfTEavfaBpuw6phJ3ASNw8lnMWyo5A0i1qUGUFJ5KyXlI
         XjGa9sZVNa/cMRLa7i7mbDfRWP+VLVv++nN/UplUR5DMJUbQgGVzJJbYrq2qz0yXPrwL
         kVsa21Yuu5EUGYGjWjPepNZv3jXJkX9ic8DJU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HPLsqBBcYfdG7o8OqSkFjzM/XaIPLuPeM+BhWfKVCzU=;
        b=IYI/xs7lMCgh8+Kto2jcTM0N4cJhO6pgIlw6FlX2KlLdsDB16XAckelZ19grRGX/X6
         lGYJsvypI6DSg0omZZznaxqyMT+j4Ws00ZuOt4cVXedOrviXiZUspxd3JLBRsBOLidq2
         FWdrq+zL3cJXwS1JGbU/E6UeHTgn6D32PVJPfRdSafZbKz7fbh29kfm9t9cAxsDRskTB
         /mq0/xaJy9mz1OOtfjm7T19ZH5SYUDxLWRFy1wXAhm+s1b9KIw9Ocm3K2nDM0M/P0spg
         oQEUmocf+wgY5Kh+S9XzhgondtBmLy41ZV3UU5pRF2YmNOzeCdH8sw893pfk2VyDS6wl
         5IMQ==
X-Gm-Message-State: AFqh2kq+K36E205vXm9WV8Due+IYzZVzQoKB6uE+7hcrWM7p4v5wylSp
	P4Kayxe4wWTDBYb1DuNwh0oo4w==
X-Google-Smtp-Source: AMrXdXtm5ipy0x/GznpORJRem3vAObFeNI9Y1pSpSOjZfUT59Xenw2FQXAk4DklHDJ0ITsyYNWumHw==
X-Received: by 2002:a7b:c7ca:0:b0:3d3:4cbf:3a51 with SMTP id z10-20020a7bc7ca000000b003d34cbf3a51mr42268589wmk.14.1673122412392;
        Sat, 07 Jan 2023 12:13:32 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:bfe1:c7b2:1d0d:49a0? ([2001:8b0:aba:5f3c:bfe1:c7b2:1d0d:49a0])
        by smtp.gmail.com with ESMTPSA id n14-20020a05600c3b8e00b003b49bd61b19sm12070222wms.15.2023.01.07.12.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 12:13:31 -0800 (PST)
Message-ID: <cb42a161e6768fccfbe86308791f3e19bd8a19ef.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] site/common-musl: Set
 ac_cv_sys_file_offset_bits default to 64
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Sat, 07 Jan 2023 20:13:31 +0000
In-Reply-To: <20230107000831.1253334-1-raj.khem@gmail.com>
References: <20230107000831.1253334-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 07 Jan 2023 20:13:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175621

On Fri, 2023-01-06 at 16:08 -0800, Khem Raj wrote:
> off_t is always 64bit on musl regardless of 32bit or 64bit
> architectures. autoconf has AC_SYS_LARGEFILE to detect correct off_t
> size but it only work with glibc since it defines feature macros
> _FILE_OFFSET_BITS=3D64 and _LARGEFILE_SOURCE but these macros are
> not used on musl headers.
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
> ---
>  meta/site/common-musl | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/meta/site/common-musl b/meta/site/common-musl
> index 86aed4a38c..23e50ef749 100644
> --- a/meta/site/common-musl
> +++ b/meta/site/common-musl
> @@ -15,6 +15,8 @@ ac_cv_func_posix_getgrgid_r=3D${ac_cv_func_posix_getgrg=
id_r=3Dyes}
>  ac_cv_func_getaddrinfo=3D${ac_cv_func_getaddrinfo=3Dyes}
>  ac_cv_func_mmap_fixed_mapped=3D${ac_cv_func_mmap_fixed_mapped=3Dyes}
>  ac_cv_func_strtod=3D${ac_cv_func_strtod=3Dyes}
> +# off_t is always 64bit on musl systems
> +ac_cv_sys_file_offset_bits=3D${ac_cv_sys_file_offset_bits=3D64}
> =20

Not sure if this failure might be related to this change:

https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/6496/step=
s/12/logs/stdio

Cheers,

Richard

