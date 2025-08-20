Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE79CA0EE4
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 17:17:54 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web11.2838.1755710269216416755
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 10:17:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HMNuQpgu;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e95026b33eeso330759276.1
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 10:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755710268; x=1756315068; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqiIwdEMsn3N+9/gjBOTfsHXkYAQhcaHKflIGFlShWY=;
        b=HMNuQpguQZALsPWWQEAqeW7tNVD0hXr0lJnnxrzzYmTzjgcTqObC6Know48eXmjxx1
         n22lJoFaLUQEvtw9u1rqX5WKw4fKYLxsNX9bqNCv7M+y+RxECu1UOLT/BM4EWbN2zfH8
         s/grihHOu1HMnH9uz5QNFRaz0pMr7Fp86Ajwl+ZiTh4pwGE4Aw3JSoieZ1VGRBVXkSgb
         6g4fLOawGvOyJcRZVfaAx1m6rqbqTInKhTsz+n9NVNWEz4QYpxLWgs4Scw2pPIUv8CqT
         BKdSUc0fwnYGJQlRE1cOxO3k13eQ4/IyZDZZluO5rdIsnsfGJjiz5/y85na8sJCgKVh1
         0Igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755710268; x=1756315068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqiIwdEMsn3N+9/gjBOTfsHXkYAQhcaHKflIGFlShWY=;
        b=kBX9zjrrpT9K1dbhJ5ia+JD6rtDTb8bORskGyDyZ7W/47IaTz+DkBn604CDVXRMCI/
         /544tsh3EYZCAXlKHXFX7HZ/v9m2LTtxh3TCT03l8wsDLyip2oRRdrDYfyF6O5XiOTLS
         pbE1IvCtRV0hIjolhlkIE8CYW8s66D6OTP5fdyIjN8fkJLm3+G+N6VmqlFSKRzI5vAvq
         JsnXAy3d0dKVJlLVtdCKxkYZ6Qz6LaXOLTtcZJ7NzZDKWOZgi+HLjj2HJzjvZTq51ps0
         KaEwMP4hURCavS8B/MphWVJAYxRgtkIpHzyGErdziiKURP8bCqE1SOlMHQF1twNHc5FP
         PHdg==
X-Gm-Message-State: AOJu0YwW9GzeHMhiCK6nJmo+tg6xppw508UFhjkU4L39rNdKdcUPZiKW
	PhSKkrmAjgHs4kRd44QmrO3pqjAnIok7DtfUqgB+Ltl1gBAzFBxwKJVwGxi8t5QZr2QiHINb9ns
	U9X+DhlvHF/Yzg9wRKCwJWl0axveGiYr0z/WK
X-Gm-Gg: ASbGncvhqshVp5hmQhSOWG2Gl7gitrNDB2wBVOmIRR8NYhHZO1halr04eW1Y3ADDyai
	f0pQkB8oHreHXbKkNvI8sSErK2jzKtbwKnFuJIzHNluzuSMe0SMVzfRVH9e1Dd+1+FAFRhfzH5p
	6elEayIgGesK4mO8HeMjyVn5/K9iwry1mQrr5f8lK7Od7Gl0cOBP3yyn8x2pBVcmkFexsU9dopi
	/oaNz7Quj8xOoxr6vyhtgUy2enp5vhogM3g
X-Google-Smtp-Source: AGHT+IELmXxZODRYIJ8SAyx2NNY81PSLEGdOs2nLfO39EToHuXjE92Fcd3GwOFihLa4YOF3JLQiWftTaUGtLY0+Po+c=
X-Received: by 2002:a05:6902:841:b0:e94:d1d0:7b29 with SMTP id
 3f1490d57ef6-e95048f9e6dmr452993276.20.1755710268178; Wed, 20 Aug 2025
 10:17:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250820132929.2644708-1-ross.burton@arm.com>
In-Reply-To: <20250820132929.2644708-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 20 Aug 2025 10:17:20 -0700
X-Gm-Features: Ac12FXzKkCZ006TBKbZXPb7Nr42Y7h2ha8IEZ5SeVN7Zq2n2b6a7NGNakcBg7V4
Message-ID: <CAMKF1so0oZt04POpvabf3k1J0WNk_7eRW1wYQ5uwt4xOT61X2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] spirv-llvm-translator: small recipe cleanup
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 17:17:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222193

On Wed, Aug 20, 2025 at 6:29=E2=80=AFAM Ross Burton via lists.openembedded.=
org
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> - There is no need for python3native, as this recipe doesn't depend on
>   other python modules.
>
> - Inherit lib_package so the llvm-spirv binary is in a separate package
>   to the libLLVMSPIRVLib.so library.
>
> - Remove obsolete CMake options that no longer appear to be required.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  .../spir/spirv-llvm-translator_20.1.4.bb               | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
>
> diff --git a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb b=
/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> index 64a73ce55aa..3a090b7b5cb 100644
> --- a/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> +++ b/meta/recipes-graphics/spir/spirv-llvm-translator_20.1.4.bb
> @@ -15,18 +15,10 @@ UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+=
)"
>
>  DEPENDS =3D "llvm spirv-tools spirv-headers"
>
> -inherit cmake pkgconfig python3native
> +inherit cmake pkgconfig lib_package
>
> -# Specify any options you want to pass to cmake using EXTRA_OECMAKE:
> -# for CMAKE_SHARED_LIBS=3DOFF see https://github.com/KhronosGroup/SPIRV-=
LLVM-Translator/issues/1868
>  EXTRA_OECMAKE =3D "\
>      -DBUILD_SHARED_LIBS=3DON \
> -    -DCMAKE_BUILD_TYPE=3DRelease \

Is Release already the default ? Usually this option reduces the debug
info size, which may not matter
for this but would be good to know.

Other changes look fine.

> -    -DCMAKE_POSITION_INDEPENDENT_CODE=3DON \
> -    -DCMAKE_SKIP_RPATH=3DON \
> -    -DLLVM_EXTERNAL_LIT=3Dlit \
> -    -DLLVM_INCLUDE_TESTS=3DON \
> -    -Wno-dev \
>      -DLLVM_EXTERNAL_SPIRV_HEADERS_SOURCE_DIR=3D${STAGING_INCDIR}/.. \
>  "
>
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222179): https://lists.openembedded.org/g/openembedde=
d-core/message/222179
> Mute This Topic: https://lists.openembedded.org/mt/114799103/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

