Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FA43C07E9D
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 06:49:54 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.7497.1664434184315890829
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 23:49:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N7aTdnEA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id x18so610549wrm.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Sep 2022 23:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=WBeQF6c+aSNIy0SV1EdEwVT52MQnxM1Cmt1IVHQFvjQ=;
        b=N7aTdnEAzoq95tz8v3sWnc2GHappNdNi48RqWrtmkWDHcdH13rojBHhPRMbLS51o64
         KG7b2Fpgcl5Jn2oUYUlDGHvCD1qKVLBTLw11kXSBs4gkLcOqggkobOl6h/0NczzUSDwy
         tLp+BxmHqMmx7llcv/4S8m+p7bOwwGZnDQiVs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=WBeQF6c+aSNIy0SV1EdEwVT52MQnxM1Cmt1IVHQFvjQ=;
        b=CsDSS12jNQf6vz2VkiP4IHx9Hl0bpaNanz5QXob9N6y1Qf7GTVUKcfmEJQfG96I+Ly
         Z0HBs71CUjj4fTJ1yw/bi6XapCDjEU+9qFnWhjNTrjPKwUIgGvZo39Zn5UzJzKrgQdPx
         Q7FfxeHAaUn6Zf6+rKWQMSnFHUWSSF+2UAISbQd8YbCFYQm0xABzrega4B31YXQ8L5Mn
         rpKbA9ev1x7G2ROv/LRR8drWnXVgWdxNkXbXICrFja0Q/XJPrvsjMzxWcWiIEdh/BWz8
         vNanm+IXmBTc1dvRd1fKIm29ARk0AMsMMXC0xKvEO9dp/TRWK3DIzDRjApaK2WtQltf7
         fOpw==
X-Gm-Message-State: ACrzQf0jKLfpTYM0Kg3T81+Hp/LPYMlQi9UQmGNNmJXm+FQoYhTmjr6W
	VzjnmYc523sS8T1yMNYhBF8t/A==
X-Google-Smtp-Source: 
 AMsMyM5IfdhVlbXoX8fFBLGWXsGzyoi/bRaM4daLjXrliYU0sz8zReAZnzCpeEYXDby2HWBXKyFm5w==
X-Received: by 2002:a5d:6d0f:0:b0:228:e075:b148 with SMTP id
 e15-20020a5d6d0f000000b00228e075b148mr967626wrq.156.1664434182710;
        Wed, 28 Sep 2022 23:49:42 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:6fd0:d3d3:fcc6:1fd6?
 ([2001:8b0:aba:5f3c:6fd0:d3d3:fcc6:1fd6])
        by smtp.gmail.com with ESMTPSA id
 z2-20020a05600c0a0200b003a4efb794d7sm3853314wmp.36.2022.09.28.23.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 23:49:42 -0700 (PDT)
Message-ID: 
 <52f69af19ea8a1876dab73ce1bebc795f71d4ab3.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] binutils: apply override toolchain-clang last
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: kai <kai.kang@windriver.com>, Ross.Burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Date: Thu, 29 Sep 2022 07:49:39 +0100
In-Reply-To: <20220929033210.13292-1-kai.kang@windriver.com>
References: <20220929033210.13292-1-kai.kang@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 06:49:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171166

On Thu, 2022-09-29 at 11:32 +0800, kai wrote:
> From: Kai Kang <kai.kang@windriver.com>
>=20
> It disables gprofng for toolchain clang, so it should clear GPROFNG_ALTS
> when clang is used. But override 'toolchain-clang' is applied before
> overrides 'TRANSLATED_TARGET_ARCH' such as x86-64, then GPROFNG_ALTS is
> still set and not cleared. Append 'forcevariable' to apply it last then
> make it work as expected.
>=20
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/binutils/binutils.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/binutils/binutils.inc b/meta/recipes-d=
evtools/binutils/binutils.inc
> index 4dde387a8a..c7113f8a1f 100644
> --- a/meta/recipes-devtools/binutils/binutils.inc
> +++ b/meta/recipes-devtools/binutils/binutils.inc
> @@ -50,7 +50,7 @@ GPROFNG_ALTS:x86-64 =3D "${GPROFNGS}"
>  GPROFNG_ALTS:aarch64 =3D "${GPROFNGS}"
> =20
>  # it disables gprofng for clang and musl in the bb file
> -GPROFNG_ALTS:toolchain-clang =3D ""
> +GPROFNG_ALTS:toolchain-clang:forcevariable =3D ""
>  GPROFNG_ALTS:libc-musl =3D ""
> =20
>  LDGOLD_ALTS ?=3D "ld.gold dwp"

I've never wanted to see forcevariable used in layers, it is really
there as a last resort for end users. There must be some other way we
can arrange this?

Cheers,

Richard

