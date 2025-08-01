Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2E8C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 16:08:06 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.91992.1754064482887477657
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 09:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EBsB7V6i;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e740a09eae0so2225493276.1
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 09:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754064482; x=1754669282; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WuSh1d+OG/mChAbPI4A+97C+52phYsIQOS/mcSQL8Fg=;
        b=EBsB7V6ioxzDvNHytOPA8YD7FGnoeUeFAuA1mZIhFfWmDglp+cX321kvQcLXxfmiaQ
         1s5bbfGlagHZ07jJVYufU8LQAluL8mcEv1YKcbQKGxtX7i8cX7dvYH+ME31HYtnwOktO
         flmnhYBtACUIYJUkUPKcCc+ikvaFPo5eQm2nFqDMoxt5GIxAIp6MbZGoyevUuMFwtiCx
         F++OSqy8olR5M3TY30MR9Pa8jusqdrnVg7jIzSTH38fbzUDay+zVypyb2ug4s4g1jFSR
         HgwiiX2JIyot9jJ+OLxIwmPh0kNovsUVovhzS4BlCBiG56NiUREtQDhM76ar7k5NHwnA
         1OhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754064482; x=1754669282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuSh1d+OG/mChAbPI4A+97C+52phYsIQOS/mcSQL8Fg=;
        b=GLVYJFaA14hNrhlLXOd4/Z+FL/FZ6uioUboPUQBCsjMgoAk1i3dGzyhsgS+5NqyrsG
         hEKuiGPF3svu1oX7UItq/96lpDiTU99ujDTwYwd1FZXOfilPg7CavUmarI8tLGgle+Zc
         qr8uANLM8oRiIHpyYRVu4aBn8EHPExVADMpuw+ucmBCZNvXLNAVOfx1PmeJGJwGqpCPF
         fmgGbSvGxzCX7ui1HtAjxfKvwv9DVVNNkT5Z41VLBa1fCLi01lRVeuYmYiaW2Sohkj6j
         nswZxU1yp/8wqWyXPUb5A2qdsrEZVr9oMZSzp5b6ikj4TZwLdIDMUQai63Mygg/aM4Np
         EMkw==
X-Gm-Message-State: AOJu0YxQiILBIYnC6OEHePWTaap0IMCDfTF3jyoOKygU+AD7XSqhUJBG
	fJkgbuUlU7wGSb6FM9kcXA0qBIAwEEMOvWEHFERD2TpFdFZT/NRJe2otOwPuFyRvYBwi8Iy+rUx
	ocBajHnZiqcLp+P6XzILpAVveMK9ScEQ=
X-Gm-Gg: ASbGncvLs5XujHEZUM/X+87tjuUYveTGPBs+k6z+CZc8JiklwqZZws++fBAiPflCNo6
	DOJyZhKEtq0Gd05wS14Jza1TnGoj9b0/D9LuSKRMXDhMMoHR60+lJvBlRwYDoSuU1tWkcZUD2Rx
	M0wBsnL5CX/95NuU9axGTFRpvT3/+o1qB2z/6FNQ6USUMfTP1S6f7L9Bot0bBOnwkjjzWtVWoKx
	tlAE45HnVtltFxxVG6jBJYmHEaUP6U5xFFJND86
X-Google-Smtp-Source: AGHT+IHW447BNXV9mQPs6kjXkZAEjAeLlC8cgfCb0EUhUuIWbi3Cx06IHKE1RWmzGlDUHFqo9yNCdILjmBhYqvufDSQ=
X-Received: by 2002:a05:690c:385:b0:71b:70ce:a861 with SMTP id
 00721157ae682-71b7ed743aamr3174047b3.12.1754064481706; Fri, 01 Aug 2025
 09:08:01 -0700 (PDT)
MIME-Version: 1.0
References: <20250801125827.2349417-1-ross.burton@arm.com>
In-Reply-To: <20250801125827.2349417-1-ross.burton@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Aug 2025 09:07:35 -0700
X-Gm-Features: Ac12FXw3AmY8eew1ffOQrVsm9eWfJoBk2vnsqqZEihgBqDkFh_37Sd95klpmHMk
Message-ID: <CAMKF1soOzyjrOWB8xnGgN_VZoc+7Ogy0ARDY_+eYtHBwidbdoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libclc: do native build of prepare_builtins in
 a fresh environment
To: ross.burton@arm.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 16:08:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221367

On Fri, Aug 1, 2025 at 5:58=E2=80=AFAM Ross Burton via lists.openembedded.o=
rg
<ross.burton=3Darm.com@lists.openembedded.org> wrote:
>
> The environment has variables like LDFLAGS set which CMake will try and
> use, so until our cmake class is comprehensive enough to nuke those in
> the native toolchain file (if that is possible) do a build inside a
> clean (apart from PATH) environment to avoid cross-contamination.
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-devtools/clang/libclc_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-devtools/clang/libclc_git.bb b/meta/recipes-dev=
tools/clang/libclc_git.bb
> index 04b76c55d26..e56cf2eb6c0 100644
> --- a/meta/recipes-devtools/clang/libclc_git.bb
> +++ b/meta/recipes-devtools/clang/libclc_git.bb
> @@ -28,7 +28,7 @@ EXTRA_OECMAKE:append:class-nativesdk =3D " -DPREPARE_BU=
ILTINS=3D${B_NATIVE}/prepare_
>  # Need to build a native prepare_builtins binary in target builds. The e=
asiest
>  # way to do this is with a second native cmake build tree.
>  do_build_prepare_builtins() {
> -    cmake --fresh -G Ninja \
> +    env -i PATH=3D$PATH cmake --fresh -G Ninja \

This works too. Although, it will be good to preserve the commit msg
info I had in prior patch for context

>          -S ${OECMAKE_SOURCEPATH} -B ${B_NATIVE} \
>          -DCMAKE_TOOLCHAIN_FILE:FILEPATH=3D${WORKDIR}/toolchain-native.cm=
ake \
>          -DLIBCLC_TARGETS_TO_BUILD=3D
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221243): https://lists.openembedded.org/g/openembedde=
d-core/message/221243
> Mute This Topic: https://lists.openembedded.org/mt/114484448/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

