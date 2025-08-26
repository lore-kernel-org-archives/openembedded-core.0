Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE4AC8303F
	for <webhook@archiver.kernel.org>; Tue, 26 Aug 2025 03:00:12 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web11.56200.1756177209616713259
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 20:00:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EUhFL42O;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e9537c4a2cdso1974144276.2
        for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 20:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756177209; x=1756782009; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SiEFtytazzrMWXRVaGqPHXoTjbyIKSMI51lHeH+TQXE=;
        b=EUhFL42O99ztdXCFUnNvRpFDNtyxysa7MRCHwgs01EwxJtCU9kFRBRN+5/tEzpjOAj
         MjsUnOhLLWMdCrh2XrHIU4lB0TilrfCvGqU9fcmC+G+ldUdSYJIThsbID6iX/j+1TP1W
         8QqwXqPMi3OWAxf5xlcagqKDZt8xKUzMfxpHoctwrZP29wu2br0/JQsTm1ahlu4JGyqd
         O6589UGwLHcwV1PAtOhQ+nUSbtoCpfeQ/G8NKa6bOVkLs6Qct6DEkTVwiBSbOfh3ll9C
         VW71KyBHInp9rN41aLcYUFXKvKzGjvmxX8jLlf7qse51KfOkvzLszV02TpExKC5D61lg
         +X2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756177209; x=1756782009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SiEFtytazzrMWXRVaGqPHXoTjbyIKSMI51lHeH+TQXE=;
        b=tU/JixoTxTazCjOFXAf5+OWydtE4ZEVrj0qS0BEYOCrbLe1Mi0aDrvuHSOXdw6U6P0
         DOKV+DQWnhVLkyh0sPjleXMzq98lCTdN8KLkAsS2UAXe7160GP02G5rnpSG0EhtTNy89
         1sbcu2LI6nNvMS2gDbUgd2LpjZVTrB11drj7cSRjl7KwRYM7SfLnJyqzsGPuAPEBqs1o
         nXZrwCiQ4xgeQ0TKCBd3npu82D7ds1qWgjpQ7K/T7fVUnSwQjE6X0QKOQchdyqhfjcml
         bwxKqSQ6yXLhnTcPJEvmkPQ54hULV4rEwrNLwtHKnpLozqoVB+yHk5Vdm3gSAFc/7Wcg
         Nvbw==
X-Gm-Message-State: AOJu0YxgLpbBA6K9ll+jpu3ztNOhrkcQ6nninpioRB+WCA6nAf+6gfaw
	BhNPIInco3b+eloffWXguvOrey8K+e1k2c6ZEu77+Mj/i3TfgZxDoZYnHDuzZFwZM+0I60hkuAy
	GG9zSZx6KYREB4pv1+L9R92K9nfgPHH+nrYuE
X-Gm-Gg: ASbGnctmcvaHgD4pHjs2nsYFAeX3O05w7Ovxpb1BVC8Np4Hzrdn1oZUHB6XFeP0YPp5
	GR4TGLaadJFfKthqkr+mFh5DwCOnYfHLTeOA1IyALR/AQeNOjF71lwH2njK2EPFEhIqlFQA1Syd
	2qWMaymMBUeMOG4fmGUsr1iuwqsa5tdv2/FFT3J4eXmHcQf1bh+lOCrFFypju/578dqBgY5Lhsw
	8kRSJBz7JVfny67dC0CFI+O1Y/JLw4LxoKU15H0SGoQWDP1RoJe7SQCxbdG9F7wH6Lss23gkYce
	u8fwbXGYuuxIki1SFN+ZBrbWuUemkZaMMnI=
X-Google-Smtp-Source: AGHT+IGnJdvf4oPiWb+o6TNcf4pZKCoLQaMbbLjG8/kY4STzJzY6CKYkSPqmG7MazyJinca4r8QfcZQGKsFGNdG951A=
X-Received: by 2002:a05:6902:2886:b0:e93:3b68:2b0c with SMTP id
 3f1490d57ef6-e951c27ddc6mr15859129276.20.1756177208450; Mon, 25 Aug 2025
 20:00:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250825165026.681972-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250825165026.681972-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Aug 2025 19:59:42 -0700
X-Gm-Features: Ac12FXwZKppZ3cPN3-j11GloVbgsf5wUDN9NftxzmTCBxBX3ppxklM27xD3k8_E
Message-ID: <CAMKF1so8YHaBFxw1SJq87Q4siPcTSY9kaoXzDqhOTcAGyWH8ZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] gcc: remove .gnu_debuglink from SDK toolchain binaries
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com, 
	SunilKumar.Dora@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 26 Aug 2025 03:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222428

On Mon, Aug 25, 2025 at 9:51=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> SDK toolchain binaries (nativesdk and cross-canadian gcc) currently
> contain a .gnu_debuglink section pointing to separate debug symbols.
> These symbols are not required in SDK builds, as SDK users do not
> need production debug information on the target, only the compiler
> and headers for development.
>
> Including .gnu_debuglink increases disk usage for distributed SDKs
> without providing any benefit for SDK consumers and so removed.

I need to understand the problem a bit better. Is the system not able to
specify ignoring debug info from SDK, if we include debuginfo with the
 binaries how does it change things ?

>
> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-common.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devt=
ools/gcc/gcc-common.inc
> index 8d95698743..3793aff0a1 100644
> --- a/meta/recipes-devtools/gcc/gcc-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-common.inc
> @@ -144,3 +144,8 @@ remove_sysroot_paths_from_checksum_options () {
>  cleanup_installed_include_fixed () {
>         find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type =
f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm=
 -f
>  }
> +
> +# Disable splitting debug symbols into separate -dbg packages for SDK-re=
lated gcc builds
> +# (covers both nativesdk gcc and cross-canadian gcc)
> +INHIBIT_PACKAGE_DEBUG_SPLIT:class-nativesdk =3D "1"
> +INHIBIT_PACKAGE_DEBUG_SPLIT:class-cross-canadian =3D "1"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222417): https://lists.openembedded.org/g/openembedde=
d-core/message/222417
> Mute This Topic: https://lists.openembedded.org/mt/114885056/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

