Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F9BC25B78
	for <webhook@archiver.kernel.org>; Wed, 22 May 2024 19:57:46 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.223.1716407864005696745
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 May 2024 12:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l9IYuiqd;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-23d38cd0df6so3479074fac.2
        for <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 12:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716407863; x=1717012663; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REe9oBHiGGzOU8LwteSy/wgcmZFcgLJj7AUX7+V34PI=;
        b=l9IYuiqdU4To4eqciupb19KkUvAg42G2h19OWKbc6kbI28JaYDnPOnG0vVR+T99A4B
         WTCGHI2oUfSkagaPVCJQW9dnXUTifOTeDGgeKv0Ns0JtWlwdguGG4yMzomshbQ0o709w
         Zn5PvieXj6cloLQiNi5HfbsvLk6qXsV4iB4bsvz8DRPMGyiOMkfi+zcU6Q8UHy/3uRoM
         vDJfnUOIzEyIYbNI4pUph0Xg/W6vxXgo9vZUOTnwlGVthj0FwycOz1ztnRzV6b0EuG5H
         BU9VmN4ZAedZgpPw9zXDgx9n8l/eNHFU69ejTciWnZWIxXnzACQBTCxDHjP0ayPdRcsz
         IRXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716407863; x=1717012663;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REe9oBHiGGzOU8LwteSy/wgcmZFcgLJj7AUX7+V34PI=;
        b=tJmxLwtAZxLts4NK5IHCSCYAZjuDZcVXwIscHQdSlyke2ybHkurUMZ03xHasqxJLAZ
         SsXLeLSVTTBC028OgcQA1ZFcWMrWz++qaFwoh7GvGLdsFKLJ3BsT778z2+dbwlZkK2EM
         MuVOYeSazqSKl79QtbZYHPCPZ2a4fquKMbfkv+/Q9gR+83NLtlYAFRTb6eKXYJFjvNPp
         0TqXDepZHQAd2XJUoKGvJhWG6yUU6G2UE+OeCgufh3I0UGxhXrIKJRitvEFQ0XuDNYuy
         +YbYryESXLWzjEXs1AAVkNF+yjRqEtX4bj2qKw8Td7w7tjIJUvoD2MrdrIaD0A19d1D5
         JEOw==
X-Gm-Message-State: AOJu0Yxh5CGOZMsIOylFVRFNBwjK+VMAUQ2u68xBmjC9hVwAZdhl5jom
	6IvowxWe0iwN5fhihA7z1TWZfVFYbuI2hcXfdRc8sGi+9dTbbfL7ysxzkRVqSNMagnZd0Yo/Nke
	xYKA9dXz9i2kMnRqi8q1i7gwFWLA=
X-Google-Smtp-Source: AGHT+IHJ8QczfpK76TrD/Mtf4AkdflulMPhyH/Aq6T1mbM+JKrjQf2gzQgMDcoaBU/rTPE6oxm0DTmeUlImln6y0WmU=
X-Received: by 2002:a05:6870:9627:b0:23c:1f34:730 with SMTP id
 586e51a60fabf-24c690dcbeamr3329736fac.49.1716407863193; Wed, 22 May 2024
 12:57:43 -0700 (PDT)
MIME-Version: 1.0
References: <1716369289-22526-1-git-send-email-wangmy@fujitsu.com> <1716369289-22526-24-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1716369289-22526-24-git-send-email-wangmy@fujitsu.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 May 2024 12:57:16 -0700
Message-ID: <CAMKF1sp6VmOvP08EjjdHq4ABHNq7pSHVeC4J1tESbbkinvrVJw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 24/42] llvm: upgrade 18.1.5 -> 18.1.6
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 May 2024 19:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199765

On Wed, May 22, 2024 at 2:15=E2=80=AFAM wangmy via lists.openembedded.org
<wangmy=3Dfujitsu.com@lists.openembedded.org> wrote:
>
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - Fixes issues where LLVM is either generating the incorrect thunk for a
>   function with aligned parameters or didn't correctly pass through the
>   return value when StructRet was used.
> - -Xclang -target-feature -Xclang +unaligned-scalar-mem can be used to en=
able
>   unaligned scalar memory accesses for CPUs that do not support unaligned
>   vector accesses. -mno-strict-align will enable unaligned scalar and vec=
tor
>   memory accesses.
> - Don't replace an aliasee with an alias that has weak linkage. This avoi=
ds
>   incorrect linkage that can lead to using the wrong symbols during linki=
ng time.
> - This patch fixes build failures when compiling AVX512 code using
>   -march=3Dnative on machines without AVX512.
> - Fixes crash in AArch64 backend when having true or false as operand for=
 a
>   fcmp instruction on IR level.
> - Fixes compiler crash when user specifies -mno-evex512 with AVX512 featu=
res
>   but no AVX512VL.
> - Fixes a bug that tries to do VBROADCAST_LOAD for f16 without AVX2.
>

I submitted this already via
https://lore.kernel.org/openembedded-core/20240521153514.271976-1-raj.khem@=
gmail.com/T/#u
but I like your commit message more. So perhaps this patch should be picked=
 too
atleast the commit part

> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-devtools/llvm/{llvm_18.1.5.bb =3D> llvm_18.1.6.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/llvm/{llvm_18.1.5.bb =3D> llvm_18.1.6.bb} (=
98%)
>
> diff --git a/meta/recipes-devtools/llvm/llvm_18.1.5.bb b/meta/recipes-dev=
tools/llvm/llvm_18.1.6.bb
> similarity index 98%
> rename from meta/recipes-devtools/llvm/llvm_18.1.5.bb
> rename to meta/recipes-devtools/llvm/llvm_18.1.6.bb
> index 9c80b46b60..189f5b1146 100644
> --- a/meta/recipes-devtools/llvm/llvm_18.1.5.bb
> +++ b/meta/recipes-devtools/llvm/llvm_18.1.6.bb
> @@ -27,7 +27,7 @@ SRC_URI =3D "https://github.com/llvm/llvm-project/relea=
ses/download/llvmorg-${PV}/
>             file://0001-AsmMatcherEmitter-sort-ClassInfo-lists-by-name-as=
-we.patch;striplevel=3D2 \
>             file://llvm-config \
>             "
> -SRC_URI[sha256sum] =3D "3591a52761a7d390ede51af01ea73abfecc4b1d16445f9d0=
19b67a57edd7de56"
> +SRC_URI[sha256sum] =3D "bd4b4cb6374bcd5fc5a3ba60cb80425d29da34f316b8821a=
bc12c0db225cf6b4"
>
>  UPSTREAM_CHECK_URI =3D "https://github.com/llvm/llvm-project"
>  UPSTREAM_CHECK_REGEX =3D "llvmorg-(?P<pver>\d+(\.\d+)+)"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199722): https://lists.openembedded.org/g/openembedde=
d-core/message/199722
> Mute This Topic: https://lists.openembedded.org/mt/106239638/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

