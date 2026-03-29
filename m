Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFE1FC981A
	for <webhook@archiver.kernel.org>; Sun, 29 Mar 2026 22:43:49 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38690.1774824222889905871
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Mar 2026 15:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=UP+RdBFr;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43cfb723793so289866f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 15:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774824221; x=1775429021; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2xEjrhoXVONeHWiU2WvWfXUqQwAPVghEk9sddGQGujs=;
        b=UP+RdBFrcC8E4a709+h4wynM1H5gmx9CjEjfqVACGNmHHFIjen9+ZBONbFbuRZW1a7
         caEQAlQwRn2+tRCpdXnvGMeW9aLh6mFGN6ErKMxXFcRLpSQN2kenP1Gr/SkmxgK2fAzR
         jnQH/LER5jHX9NyniHc0OQet7dpsOhSz14eFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774824221; x=1775429021;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xEjrhoXVONeHWiU2WvWfXUqQwAPVghEk9sddGQGujs=;
        b=sLx3h3+YkTDr6V1lBesLpDVrrB1cUYuqQGka+QFkQGolRlBoi1Ogxg006CNgp56Gu2
         KxF1URbj1h3suhklebbSQ7a06wGd2AgxhLfz85DqKjnPzyVY0bE+SRHIxj+KfsOAQsxw
         Q2QZ7JYfnWlBKRUrW/1wKm0H1xMiYogj5RHASP9EluProE+bLiIAhL0qtVZO2wTOIYvL
         B6bgpPJ0abQmYTw5OeROlASje+28suaqYgt296t4uKazDj7JyDx1yYLRkFIciMswA7KN
         2UlBYc/ztFVjgTGLjrlkx8SK37YTOLRfjOQq6Mla2bAShD/rd38dsTtx8Wkox/LCuT1S
         fB5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxmySE7NJtjcga3qtpdXdsRRJUW27IbGQrD/AGcAeTAmuREDzVKRjVNrYF8aIrJU7xyID89YnuqrMfix7OlOfQOg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz6j2dgOO+BzHVAn45Pkk3O7ecZZA57iB+UhFIFIfpIu4uX4dbn
	MxkPImorCSJagIRnqwQTCrSyiJdkQEuefoDsPSHRGIY6qaOT9At835MnT3JuxFJwkPk=
X-Gm-Gg: ATEYQzzxHEuT364laxJvqsSLbzJ8JJNy8YD6ifMji09x7qkxovvhGm10hLucHKMq5E3
	H9+J1wEs80r7ch4y4XsXyV4XSogcPDiUPmA1gO9aDy9iHO1K+19X4BEFbc3v0EFLsXzuLrGJi3U
	Rkx7EEjLGt1mwZmGX6HG7bxm6jyWjVfH4GIFPvgEfbFrozsNulArSHfi1dA3+gQMxJUuSEu3tQa
	Ug3hN0R0AgmyqS6PkjxnzaneT/r0XtHGq1dvR+1ZlB2Xp8sOSKm/qtFGd/RVKYwNlI4ZkRwK/2y
	C2M+w5QChuwY65ufROfDKN5Ejb0ib+xPfD3GzBCkbNjw3QlavJXZKajeQZpal9VjoHse1IZGq9k
	2LtguFMkjnGEAP267hlY2cprRZj+AHCcC4bqDnaGBReZaMY9tD9lSFDBTpvdl4NAVVeiTy8YyN+
	RwAqbOQb0VA74v0sKwtnHlnMdIpxzoRGi2NY806jH7s6Hu45eqdnGPGXrd5uazNTGYx8aoq/Wa3
	O3XUFcO0TX1qzH2eujGa/TDfg==
X-Received: by 2002:a05:6000:18a3:b0:43c:fe66:43ec with SMTP id ffacd0b85a97d-43cfe664656mr3004715f8f.14.1774824221226;
        Sun, 29 Mar 2026 15:43:41 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21e265fsm14871047f8f.1.2026.03.29.15.43.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 15:43:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 30 Mar 2026 00:43:40 +0200
Message-Id: <DHFMOF1U1YKZ.37REF3IE5WWLM@smile.fr>
To: "Yoann Congal" <yoann.congal@smile.fr>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap 16/16] rust: Enable dynamic linking with
 llvm
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <cover.1774823430.git.yoann.congal@smile.fr>
 <cb0608195e2c2893b4915f4d0f62679afbc1f2b5.1774823430.git.yoann.congal@smile.fr>
In-Reply-To: <cb0608195e2c2893b4915f4d0f62679afbc1f2b5.1774823430.git.yoann.congal@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 29 Mar 2026 22:43:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234180

On Mon Mar 30, 2026 at 12:37 AM CEST, Yoann Congal wrote:
> From: Sunil Dora <sunilkumar.dora@windriver.com>
>
> Fixes [Yocto #16058]
>
> A segmentation fault occurs in rustc (e.g. in
> llvm::X86ReadAdvanceTable) when reusing sstate artifacts built with
> different host toolchain versions.
>
> Issue sequence:
> 1. llvm-native is built with a newer toolchain
>    (e.g. GCC 15/Binutils 2.45).
> 2. rust-native is later built with an older linker.
>    (e.g. GCC 12/Binutils 2.40).
> 3. The older linker statically links parts of llvm-native into
>    librustc_driver.
> 4. The resulting binary crashes at runtime inside the statically
>    linked LLVM code.
>
> The corruption happens at link time when mixing static native objects
> produced by different toolchain generations.
>
> Enable dynamic LLVM linking (link-shared =3D true) for rust-native so rus=
tc
> links against libLLVM.so instead of static archives, avoiding host linker
> incompatibilities when reusing sstate artifacts.
>
> Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
> Suggested-by: Alexander Kanavin <alex@linutronix.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 74ba238ff1ba1e9b612aece1989b828f3a8f8770)
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> ---

I did not wanted to send that patch, please ignore.

>  meta/recipes-devtools/rust/rust_1.75.0.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-devtools/rust/rust_1.75.0.bb b/meta/recipes-dev=
tools/rust/rust_1.75.0.bb
> index b9348bf0507..f037bb33715 100644
> --- a/meta/recipes-devtools/rust/rust_1.75.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.75.0.bb
> @@ -128,6 +128,8 @@ python do_configure() {
> =20
>      # [llvm]
>      config.add_section("llvm")
> +    if d.getVar('PN') =3D=3D "rust-native":
> +        config.set("llvm", "link-shared", e(True))
>      config.set("llvm", "static-libstdcpp", e(False))
>      if "llvm" in (d.getVar('TC_CXX_RUNTIME') or ""):
>          config.set("llvm", "use-libcxx", e(True))


--=20
Yoann Congal
Smile ECS


