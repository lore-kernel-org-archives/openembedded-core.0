Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D856C001B0
	for <webhook@archiver.kernel.org>; Tue,  8 Aug 2023 17:06:01 +0000 (UTC)
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
 by mx.groups.io with SMTP id smtpd.web11.67407.1691514353099975125
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Aug 2023 10:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=ZCPdpYRH;
 spf=pass (domain: gmail.com, ip: 209.85.167.173, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3a7556e4edcso30186b6e.1
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 10:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691514352; x=1692119152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=544yY44QjT2vvLps0AJAvJ33RVRhUFlxrLMj2jxbdLg=;
        b=ZCPdpYRHoqIhN3QVao/LVGSsos261lUyHD0Uc/eSaKdyDJaryQAmCQNlJoxgsKcgxa
         2PQAalZ1j6XJUm1jddp8smdiuKwQVUAVRQYMsOgwNRYlCQQajQ0/OLce2IrxMdfgf8Of
         JsOWuPw2ep0Ucw0adl4sdoyTRQapFq51SpJSmFeMBbnDYpAxy3Ze72dKIv1lgi/vDqps
         e2kvKpuDGOCidhGjYx5zOQHfTwYMdG29paojw0UwSn+jRyiYI8BSI80GMVRMxiMA2VyK
         xptl752An+6taFYHRY6v8uUr4z+SViY7yXjmFzLRArvlmqX1syoiUcPS2Ighri94Yxhe
         D26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691514352; x=1692119152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=544yY44QjT2vvLps0AJAvJ33RVRhUFlxrLMj2jxbdLg=;
        b=LMWFkYPGmBqWOw/UPkSx6xEZ1vPe6B0GkcajaoQVQv1OIk4YbZeRYlrjutvR9SPEpe
         p7+2U5CXmdkWni/ulJSo7RGjc4UvtP0uMUayRSpmOEYvP1FVo22SRPMM17thoH9oUe28
         nckLC0JKSYnnwzAKAVXS/YQRJIVhL8MBhWFZHCFr1F7lqoRHabJMDa0uHXDeAnmNHz0v
         6/+MlHpKgrbOsss+91VeA90q4oKK/z+3DappJDPALRfJvfGUNP94M0nBnC39KRuoPkQs
         57lKiB7ysa8rIH/uHq3dPXc72YUIEct/hAxCDvrWqbh1i691v6bFy86ffcJ85SGDtdBm
         sy+g==
X-Gm-Message-State: AOJu0Yx1X+XI7qfkOqgIf09+KcOfyv7taeqZg7QJakc2dvmPA2ah/XDr
	VZBKfMuAh8/oK/zpm9tZnn4h+MsSTukFeQ8m4Mw=
X-Google-Smtp-Source: AGHT+IGxDCkfBOnSZsipFRSFvhalWr+fsD4tsMdDc32xP7/GmWXoAc5zl0xKOyphGjy9yV17balcIqQgtkCVGBzp8wg=
X-Received: by 2002:a05:6808:b34:b0:3a7:507d:7b20 with SMTP id
 t20-20020a0568080b3400b003a7507d7b20mr7721715oij.8.1691514352331; Tue, 08 Aug
 2023 10:05:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230808160828.3045524-1-jose.quaresma@foundries.io>
In-Reply-To: <20230808160828.3045524-1-jose.quaresma@foundries.io>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Aug 2023 10:05:26 -0700
Message-ID: <CAMKF1sr4azY=E9XUz4946qWByrMFHbVM-jCACFtgF93_ry4DpQ@mail.gmail.com>
Subject: Re: [OE-core][PATCH 1/2] systemd-boot: enable verbose compilation
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Aug 2023 17:06:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185675

On Tue, Aug 8, 2023 at 9:08=E2=80=AFAM Jose Quaresma <quaresma.jose@gmail.c=
om> wrote:
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  meta/recipes-core/systemd/systemd-boot_254.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/systemd/systemd-boot_254.bb b/meta/recipes=
-core/systemd/systemd-boot_254.bb
> index 5d69cf83ab..b91bbfe485 100644
> --- a/meta/recipes-core/systemd/systemd-boot_254.bb
> +++ b/meta/recipes-core/systemd/systemd-boot_254.bb
> @@ -53,7 +53,7 @@ COMPATIBLE_HOST =3D "(aarch64.*|arm.*|x86_64.*|i.86.*)-=
linux"
>  COMPATIBLE_HOST:x86-x32 =3D "null"
>
>  do_compile() {
> -       ninja systemd-boot
> +       ninja -v systemd-boot

I think this is only useful during debugging. So perhaps a comment to
enable it is better than enabling it always.

>  }
>
>  do_install() {
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185665): https://lists.openembedded.org/g/openembedde=
d-core/message/185665
> Mute This Topic: https://lists.openembedded.org/mt/100625045/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

