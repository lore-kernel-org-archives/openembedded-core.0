Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B609E7107E
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 14:20:32 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.18910.1695306027583265193
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 07:20:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=RsX8sA97;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4051fea48a8so11861785e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 07:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1695306026; x=1695910826; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OyfveXeWFNONO/6Ei8IMOrD0BFI5wvLTPjZGcF3Y2j0=;
        b=RsX8sA97KBh6rcb5w2pmolsrSd1ipCSrt+UWr3NEVLMGjVatdqdm9w2V091MDYayXc
         MbJ9Bnbpv3Zm7K3kdaUnRzYNW51XVCl6gi+SAo5ZvWx+9jhdGaysr/hIZK2V2TEn8GNf
         YSj6EmYqjtq/DLuGI0ax3lPqHqYXD9b8t4iXc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695306026; x=1695910826;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OyfveXeWFNONO/6Ei8IMOrD0BFI5wvLTPjZGcF3Y2j0=;
        b=f7rL2mhkD+E/eK+3RcnGF93Ipd/y0JNO/dpmh9PISDa5mNfh0eM6QFA9BNt+II10Sg
         d/n/zRjuoCBxFjuZvrvZnisKQ5hcuAgsf8zHZnN4/Jun8FMnRirV7jTYDN18gxz7oJGo
         dsCVaXEACG630hFvReCWYAgFeCJnR2VP5TECrnvz+5Y70dbhWNyxQr5GzVVwGR5DF31Q
         L9OPoKaEM9yvOESlsxUmEN4XSzcXI15MVOTkgxTknVT+Igksv7RgPccbaiMHNa6ZDKdU
         XIt8zwJnG8TMx8uWTfAt6ysQF5X/SzesGyIiaBZZcp5RUJw6K1v2nhwvgIa2kPkWImPR
         Z1UA==
X-Gm-Message-State: AOJu0YwN4StsYX+OeG45m6RPArXVSdLy9RpOOlEaOdKirZqLCebDijL+
	UM1yR/I9vv9iPoD/Mk3mi8dKeQ==
X-Google-Smtp-Source: AGHT+IGOReg9mDNXK5CownNHGzwUuWAdF6LWs0eUSqkimBGPXGocSvwJZYPhh+O0FX00s35+gEDLlQ==
X-Received: by 2002:a05:600c:acd:b0:401:b2c7:34a8 with SMTP id c13-20020a05600c0acd00b00401b2c734a8mr4845017wmr.7.1695306025818;
        Thu, 21 Sep 2023 07:20:25 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a109:22f2:cbec:fa4e? ([2001:8b0:aba:5f3c:a109:22f2:cbec:fa4e])
        by smtp.gmail.com with ESMTPSA id 14-20020a05600c230e00b00402f7b50517sm2100119wmo.40.2023.09.21.07.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 07:20:25 -0700 (PDT)
Message-ID: <da3ee4d7f5897ac07bf73206178438ea0a3da916.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 3/3] common-musl: Disable error_at_line
 detection for musl
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Thu, 21 Sep 2023 15:20:24 +0100
In-Reply-To: <20230920220935.970957-3-raj.khem@gmail.com>
References: <20230920220935.970957-1-raj.khem@gmail.com>
	 <20230920220935.970957-3-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 14:20:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188006

On Wed, 2023-09-20 at 15:09 -0700, Khem Raj wrote:
> bsd-headers provide error.h file and static functions to implement error
> API and related functions, which confuses gnulib provided functions. So
> lets prefer gnulib provided functions if they are used by a package
>=20
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  meta/site/common-musl | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/site/common-musl b/meta/site/common-musl
> index 0fd0413819e..003e46b51dc 100644
> --- a/meta/site/common-musl
> +++ b/meta/site/common-musl
> @@ -54,3 +54,6 @@ ac_cv_func_posix_getpwnam_r=3D${ac_cv_func_posix_getpwn=
am_r=3Dyes}
> =20
>  # Xorg
>  xorg_cv_malloc0_returns_null=3D${xorg_cv_malloc0_returns_null=3Dyes}
> +
> +# gnulib error
> +ac_cv_lib_error_at_line=3D${ac_cv_lib_error_at_line=3Dno}

This is better but our on target cpio build test is failing:

https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/7826/step=
s/13/logs/stdio

probably as it doesn't see the site cache entry on target.

Cheers,

Richard

