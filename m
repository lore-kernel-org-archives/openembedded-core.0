Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84083C6FD1D
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 19:29:40 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.29575.1680377370095862009
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 12:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Te53t3AO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id q19so22488861wrc.5
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 12:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1680377368;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wOgegQyYkYq7SQkrhrCqaGanEue1nbzBH2ikfCbpu5w=;
        b=Te53t3AOEgQPDBmcGyJeT5M4C0MIa2CXL1H+n/H/zJtPaoz4FMidTumFquv8JF3j4+
         ufQcxjH6khIM41ANJKzYJQnpLrdZcfsZZai9boWPUSw9LpYO0Q0+snnZWXNapxbibD0C
         uDay5C+gMnFMpEJGJR0b5HiW0PF1+iR++TyCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680377368;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wOgegQyYkYq7SQkrhrCqaGanEue1nbzBH2ikfCbpu5w=;
        b=QLvkGiR5MHYp+QMHW12rbDEExeGNx5NBNTEnNOt/+tVHdoirKFl+Kh1krETfI82CqI
         49BV+DOhlns0xR9xFskRtIYeIIOPfmTY3DtxgDgHeirsEa9DyvlCjWLyxUSiUQOb8Ba8
         KcM5FRCE4X/YlZ4+l/o6piSiXST6PJoYQ0B15c5xCyPnLYebLyfG9ZknSfkvtb2F2e/Y
         ceNqcioMmmp8ruswOgbcgwKbz0okvFDdjkMrxdAk9v5Mo8udmaNrKmMul9wybmA2/Our
         k9wRSWs+pbGqLe+avyeInzzaZfQp5tPYmiRtoUElXNRBCMavOTwmyUGa26nZ+2FrkzOP
         OEnQ==
X-Gm-Message-State: AAQBX9ep7YQwNjkLf/CS84CfWIIv3xPMokR3EU3EIlXTUfMHBUqso33A
	3r2dG+VPjfNJHMI28BH1rLriJA==
X-Google-Smtp-Source: AKy350bY7swlS3JuKiDm9b5zWanMupYXZoFH9ElD3eilDfl8SbNQcK8gtIXVItanCZ1PKy5kMfB1nA==
X-Received: by 2002:a5d:614f:0:b0:2e6:348:5fef with SMTP id y15-20020a5d614f000000b002e603485fefmr4400561wrt.55.1680377368352;
        Sat, 01 Apr 2023 12:29:28 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e3d2:bb2b:b7e5:a8c4? ([2001:8b0:aba:5f3c:e3d2:bb2b:b7e5:a8c4])
        by smtp.gmail.com with ESMTPSA id m3-20020a056000180300b002e5f3d81c06sm5048018wrh.89.2023.04.01.12.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 12:29:27 -0700 (PDT)
Message-ID: <826207c3d7353efcd21b2d14301bf5ee1c0516cd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC][PATCH] tcmode-default.inc: Add
 LLVM_PREFERRED_VERSION
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Martin Jansa <Martin.Jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: khem.raj@gmail.com
Date: Sat, 01 Apr 2023 20:29:26 +0100
In-Reply-To: <20230401163241.354257-1-Martin.Jansa@gmail.com>
References: <20230401163241.354257-1-Martin.Jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.47.3-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 19:29:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179471

On Sat, 2023-04-01 at 18:32 +0200, Martin Jansa wrote:
> * Allow to independently set P_V for llvm* recipes and actual llvm versio=
n used in other places
>=20
> * This is needed for meta-clang which provides different llvm version fro=
m clang recipes, see:
>   https://github.com/kraj/meta-clang/pull/766
>   https://lists.openembedded.org/g/bitbake-devel/message/14521
> * as reported in:
>   https://lists.openembedded.org/g/bitbake-devel/message/14523
>   the other places in kirkstone and langdale which use LLVMVERSION
>   (which doesn't have to be the same as LLVM_PREFERRED_VERSION) are:
>=20
>   meta/classes-recipe/meson.bbclass:llvm-config =3D 'llvm-config${LLVMVER=
SION}'
>   meta/recipes-graphics/mesa/mesa.inc:MESA_LLVM_RELEASE ?=3D "${LLVMVERSI=
ON}"
>=20
>   these were removed in mickledore, but there are other places which
>   use LLVMVERSION as the actual LLVM version as reported in:
>   https://github.com/kraj/meta-clang/pull/766#pullrequestreview-134917059=
1:
>=20
>   meta-intel/dynamic-layers/clang-layer/recipes-opencl/igc/intel-graphics=
-compiler_1.0.12812.24.bb:                  -DIGC_OPTION__LLVM_PREFERRED_VE=
RSION=3D${LLVMVERSION} \
>   meta-intel/dynamic-layers/clang-layer/recipes-opencl/opencl-clang/openc=
l-clang_14.0.0.bb:                  -DPREFERRED_LLVM_VERSION=3D${LLVMVERSIO=
N} \
>   meta-intel/dynamic-layers/clang-layer/recipes-opencl/opencl-clang/openc=
l-clang_15.0.0.bb:                  -DPREFERRED_LLVM_VERSION=3D${LLVMVERSIO=
N} \
>   meta-intel/conf/machine/include/meta-intel.inc:PREFERRED_VERSION_opencl=
-clang ?=3D "${@bb.utils.contains('LLVMVERSION', '14.0.3', '14.0.0', '15.0.=
0', d)}"
>   meta-intel/conf/machine/include/meta-intel.inc:PREFERRED_VERSION_opencl=
-clang-native ?=3D "${@bb.utils.contains('LLVMVERSION', '14.0.3', '14.0.0',=
 '15.0.0', d)}"
>   meta-riscv/recipes-graphics/mesa/mesa-pvr.inc:MESA_LLVM_RELEASE ?=3D "$=
{LLVMVERSION}"
>   meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:# C=
heck the LLVMVERSION defined in the meta-clang layer. Given Chromium is
>   meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:# d=
eveloped using new C++ features, the LLVMVERSION has to be >=3D 12. Otherwi=
se,
>   meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:  l=
lvm_version =3D d.getVar('LLVMVERSION', False)
>   meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:   =
 bb.fatal("Your LLVMVERSION (%s) is lower than the minimum required "
>   meta-browser/meta-chromium/recipes-browser/chromium/chromium-gn.inc:   =
          "LLVMVERSION (%s). If you are using dunfell, make sure you "
>   meta-clang/conf/layer.conf:LLVMVERSION =3D "16.0.0"
>   meta-clang/recipes-devtools/spirv-llvm-translator/spirv-llvm-translator=
_git.bb:        -DBASE_LLVM_VERSION=3D${LLVMVERSION} \
>   meta-clang/dynamic-layers/openembedded-layer/recipes-devtools/bcc/bcc_0=
.26.0.bb:    -DLLVM_PACKAGE_VERSION=3D${LLVMVERSION} \
>   meta-clang/dynamic-layers/openembedded-layer/recipes-devtools/bpftrace/=
bpftrace_0.17.0.bb:    pvsplit =3D d.getVar('LLVMVERSION').split('.')
>=20
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta/conf/distro/include/tcmode-default.inc | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/dist=
ro/include/tcmode-default.inc
> index 30408e0729..2a3074b940 100644
> --- a/meta/conf/distro/include/tcmode-default.inc
> +++ b/meta/conf/distro/include/tcmode-default.inc
> @@ -24,7 +24,11 @@ GLIBCVERSION ?=3D "2.37"
>  LINUXLIBCVERSION ?=3D "6.1%"
>  QEMUVERSION ?=3D "7.2%"
>  GOVERSION ?=3D "1.20%"
> -LLVMVERSION ?=3D "15.%"
> +# Allow to independently set P_V for llvm* recipes and actual llvm versi=
on used in other places
> +# This is needed for meta-clang which provides different llvm version fr=
om clang recipes, see:
> +# https://github.com/kraj/meta-clang/pull/766
> +LLVM_PREFERRED_VERSION ?=3D "15.%"
> +LLVMVERSION ?=3D "${LLVM_PREFERRED_VERSION}"
>  RUSTVERSION ?=3D "1.67%"
>=20

I don't think someone coming to this is going to understand whether
they should set LLVMVERSION or LLVM_PREFERRED_VERSION.

I also don't think someone is going to know which one to use if they
ever do reference an llvm version in a recipe.

Can we find a more descriptive name for one of them that would make
things clearer?

It doesn't help that the commit message says "read this, then read
this, then read this, then things might make sense". Commit messages
are meant to explain things in their own right. Linking to things for
more information is fine but this is relying on that far too much.

Cheers,

Richard



