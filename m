Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F30C4C4167B
	for <webhook@archiver.kernel.org>; Wed, 29 Nov 2023 11:50:12 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.30968.1701258607616793199
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Nov 2023 03:50:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N3TqKF6U;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3316d09c645so4598156f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 03:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701258606; x=1701863406; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=svtdoTbJwDaGAw8J3snu8H64yMa9tyKLWwM2UpTnvSo=;
        b=N3TqKF6UoZHh2q28WEUYrrxgUcLrI3Ydbjxk7eK1ud1x7LEAiwygWQwWD4TW0if8fq
         C5+V+iiEueP1MlM3P/+AFpqw1/Zsosp/7CGX9prVlO9pVmn27rDii3z+ISMmfZPcpKcy
         heXFw2fKIb+H75wT9p2v4jmYDGz3vMxVZFx98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701258606; x=1701863406;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=svtdoTbJwDaGAw8J3snu8H64yMa9tyKLWwM2UpTnvSo=;
        b=VA2KhgFHp9Ac7IFb7M8HwO3oCdrVjhfT+UL4fD6vEZUvcyDOY5awrkE6cXb5fCa+vY
         OFD8ThuU/wI+i4eh+l8yYOS3I7fgOp061eikgee1stkbkWutzkCPGaaHtMk8/FyPB+lz
         gpYqM5Svfnt9zpg9GYxKY8G/EcbUohQWwtjmBq6MFSiMqJFigc373JzaDFyDyyWaGJkn
         op2J0oTcLFIUHZBiKUE5G7JqpP4JRdBL8D4w29Cv0bf0UoE72vkXhVMtRpasu/5IBjfl
         7dvr5YGcCDHo5t4rRrHNAST9pyY/cpkzH4pqHkbedZu/ebW14CwPonjttI3GdhSoXZHh
         ibIA==
X-Gm-Message-State: AOJu0YzLJJhqezK0pTIaYKOCt5mnHxZ6tlU9HPivf2E6FBnxryOaY/ME
	/NLiN68yUt9+vssRJprG2n0GgQ==
X-Google-Smtp-Source: AGHT+IGGJbn0cioZyIkTNwTPz2zAePXDNzWFwEaacVgNpFDL4eahQqSyPkVU88h0kz+DeRQ5ZhQnOg==
X-Received: by 2002:adf:e10f:0:b0:333:145c:37db with SMTP id t15-20020adfe10f000000b00333145c37dbmr1560458wrz.39.1701258605964;
        Wed, 29 Nov 2023 03:50:05 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8ea1:d952:d81c:3bac? ([2001:8b0:aba:5f3c:8ea1:d952:d81c:3bac])
        by smtp.gmail.com with ESMTPSA id e11-20020a5d500b000000b00332cba50ac3sm17429080wrt.45.2023.11.29.03.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Nov 2023 03:50:05 -0800 (PST)
Message-ID: <0e68fbea240a1dcbbdd6654ed21a026ed91eb71f.camel@linuxfoundation.org>
Subject: Re: [OE-core][master][PATCH] cmake: Unset
 CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES variable definition from toolchain
 file
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: aszh07 <mail2szahir@gmail.com>, openembedded-core@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com, Zahir Hussain <zahir.basha@kpit.com>
Date: Wed, 29 Nov 2023 11:50:04 +0000
In-Reply-To: <20231129112843.4368-1-mail2szahir@gmail.com>
References: <20231129112843.4368-1-mail2szahir@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Nov 2023 11:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191444

On Wed, 2023-11-29 at 16:58 +0530, aszh07 wrote:
> From: Zahir Hussain <zahir.basha@kpit.com>
>=20
> As discussion in [YOCTO #14717] cmake contains a OEToolchainConfig.cmake
> file to configure the toolchain correctly in cross-compile build for reci=
pes
> using cmake.
>=20
> The variable CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES value updates incorre=
ctly
> during do_compile the code. Due to this getting sporadic error like below=
,
>=20
> fatal error: stdlib.h: No such file or directory
> >    75 | #include_next <stdlib.h>
> >       |               ^~~~~~~~~~
> > compilation terminated.
> > ninja: build stopped: subcommand failed.
> > WARNING: exit code 1 from a shell command.
>=20
> As cmake already correctly initializes the variable from environment, So =
we have to
> unset it in the toolchain file to avoid overwriting the variable definiti=
on again.
>=20
> Signed-off-by: aszh07 <mail2szahir@gmail.com>
> Signed-off-by: Zahir Hussain <zahir.basha@kpit.com>
> ---
>  meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake b/=
meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> index d6a1e0464c..6434b27371 100644
> --- a/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> +++ b/meta/recipes-devtools/cmake/cmake/OEToolchainConfig.cmake
> @@ -18,3 +18,6 @@ file( GLOB toolchain_config_files "${CMAKE_CURRENT_LIST=
_FILE}.d/*.cmake" )
>  foreach(config ${toolchain_config_files})
>      include(${config})
>  endforeach()
> +
> +unset(CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES)
> +unset(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES)

Can we add some kind of test cases for cmake so that we don't go in
circles with these bugs?

Cheers,

Richard

