Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF93AC02192
	for <webhook@archiver.kernel.org>; Fri,  7 Feb 2025 07:54:20 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web10.64292.1738914848757247948
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 23:54:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KtSspk25;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4362bae4d7dso11776225e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 23:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738914847; x=1739519647; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GF8HqnrAnYSvsnLK5MLeiof48aqm6oOEYp8m0duF8Es=;
        b=KtSspk25ItL2ZVXO07+gTXfK0TOsy4WmkziMPESk2IMR3pPBodaKDQIXSPBLijTY8U
         CZ7oP9eOjwPW5i2XTSSvewIlZVaptqfOH8/BFF8CwQWGPYiUmAxJCRoIqLqKbwuc4IvY
         1NL4KKt6/cWn2kfjeGXnh4j0yQ6YROWAlk1Pw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738914847; x=1739519647;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GF8HqnrAnYSvsnLK5MLeiof48aqm6oOEYp8m0duF8Es=;
        b=dZLGaIorrryPSJUzw5s7V/9apkUy2fEN528YkgcKsOP5U64zS6chtXQ1PTFwuz9Vaa
         CZOqmgOVcZnTTfGzP4VjFsOP8tEMDRCLFgYWLDZBfGFehU3zAaBnHK3VxVBW1Y/3BzTi
         1E7wusHe0FlSQoFctvKw3kcq6V1TUrzEWpfekRRA4i+ZvRswvSkf05MytXAJBbm1+POE
         s85IDPrM8laNrSCPuoz+WQqviclb5LocrOyym1rHUg5DGaiZAS15AjkAdCp1Gei2MZ8U
         SqteY5eNV0GGxoo8QPnQEhN0IaO9V7VR9RvTZy1fkKcqsFOrCSDiEXkA6knWmD99O3z/
         erbw==
X-Forwarded-Encrypted: i=1; AJvYcCXvLRTu+5Fmkxspnx1aozAGH1KpgzeGf4VaYAmpukI6/XqfWb/Q4zsUKqbUXNOWqZtY3p8ni5YAJVhShQ8zHzIoSg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6TYX1bpG/pFt+yL6L/VEgkWTqIBPJyOJfRAuwmY4q8CoeSd4t
	omtOAAQhMe+ouk5VrNyvSBRJbOLkMABNDFiQL0Us1+cNFEHKA2E7uNqLr8MVLi8=
X-Gm-Gg: ASbGncsEw1yy2MuF5nLYtB3q8joCmbcMlStQ7zAu2xEyGyUflK6p1S0RsIjNGriU3p3
	3eD34IBwOzc4cJOtfyN5RDKXhPKVZeRI/+NPl/GyERTXEaPxssxTHtZnSXyQsxZFqcjxtPY2RyL
	cTQBgkvylkf5akqPmveeDo9PUFyoJjh1FlicL4/rrDTKZUZnt7SzD7gtZ62dolgaAG0ZMVf0f0O
	AOgRB5vmCdv79nHoLIatmpQZu1Ns1Lhv2N5rHfNS9hUwsB3ZyLxki54upRl8U8P2g0p9sjStk2U
	lFbwCffRzrRiu5zEuhq1Bfkba8jtp5E1ehunpehkf2xCxyZyyP0uMchFPAkld647vF2anGR31o+
	ZT25v
X-Google-Smtp-Source: AGHT+IHpV0BpCd2d8K7Z23pDBwx6rQ8UC6uSIreW5S7Y2HuNHF/lujUwrbQhy5PVw+yxKi+GOWeO6w==
X-Received: by 2002:a05:600c:3b20:b0:434:fec5:4ef5 with SMTP id 5b1f17b1804b1-4392498fe53mr19900785e9.14.1738914846917;
        Thu, 06 Feb 2025 23:54:06 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:dcae:28d1:c97a:4196? ([2001:8b0:aba:5f3c:dcae:28d1:c97a:4196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390daf3c70sm80898705e9.26.2025.02.06.23.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 23:54:05 -0800 (PST)
Message-ID: <f852cc146fcdd173f016d4542568908203a0be18.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] rust: Fix multiple rlib conflict when
 building with rust and libstd-rs
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Yash.Shinde@windriver.com, openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Date: Fri, 07 Feb 2025 07:54:04 +0000
In-Reply-To: <20250206100419.2539364-1-Yash.Shinde@windriver.com>
References: <20250206100419.2539364-1-Yash.Shinde@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 07 Feb 2025 07:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210973

On Thu, 2025-02-06 at 02:04 -0800, Yash Shinde via lists.openembedded.org w=
rote:
> From: Yash Shinde <Yash.Shinde@windriver.com>
>=20
> When building an image with IMAGE_INSTALL:append =3D ' rust libstd-rs',
> a conflict arises due to multiple candidates for the rlib
> dependency `std`. This results in the following error:
>=20
> error[E0464]: multiple candidates for `rlib` dependency `std` found
> =C2=A0 |
> =C2=A0 =3D note: candidate #1: /usr/lib/rustlib/x86_64-poky-linux-gnu/lib=
/libstd-20c3de2d9292cd03.rlib
> =C2=A0 =3D note: candidate #2: /usr/lib/rustlib/x86_64-poky-linux-gnu/lib=
/libstd.so
>=20
> The issue seems to be from an extra copy of the rlib as both the recipes
> generate the same rlibs, causing conflicts when using std lib to compile
> rust programs in the image.
>=20
> Remove the redundant rlib copy ensuring only the necessary rlib is
> present and prevent the conflict.
>=20
> Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
> ---
> =C2=A0meta/recipes-devtools/rust/rust_1.81.0.bb | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-devtools/rust/rust_1.81.0.bb b/meta/recipes-dev=
tools/rust/rust_1.81.0.bb
> index 288b0fbb44..70c2f3fbf8 100644
> --- a/meta/recipes-devtools/rust/rust_1.81.0.bb
> +++ b/meta/recipes-devtools/rust/rust_1.81.0.bb
> @@ -272,6 +272,7 @@ rust_do_install:class-nativesdk() {
> =C2=A0=C2=A0=C2=A0=C2=A0 rm ${D}${libdir}/rustlib/install.log
> =C2=A0=C2=A0=C2=A0=C2=A0 rm ${D}${libdir}/rustlib/manifest*
> =C2=A0=C2=A0=C2=A0=C2=A0 rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/li=
bstd*.so
> +=C2=A0=C2=A0=C2=A0 rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd-=
*.rlib
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 ENV_SETUP_DIR=3D${D}${base_prefix}/environment-s=
etup.d
> =C2=A0=C2=A0=C2=A0=C2=A0 mkdir "${ENV_SETUP_DIR}"
> @@ -310,6 +311,7 @@ rust_do_install:class-target() {
> =C2=A0=C2=A0=C2=A0=C2=A0 rm ${D}${libdir}/rustlib/install.log
> =C2=A0=C2=A0=C2=A0=C2=A0 rm ${D}${libdir}/rustlib/manifest*
> =C2=A0=C2=A0=C2=A0=C2=A0 rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/li=
bstd*.so
> +=C2=A0=C2=A0=C2=A0 rm ${D}${libdir}/rustlib/${RUST_HOST_SYS}/lib/libstd-=
*.rlib
> =C2=A0}
> =C2=A0
> =C2=A0addtask do_update_snapshot after do_patch

This seems to cause build failures, e.g:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/962/step=
s/11/logs/stdio

"error[E0463]: can't find crate for `std`"

Cheers,

Richard

