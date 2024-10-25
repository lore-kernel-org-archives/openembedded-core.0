Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42D8FD149F4
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 21:43:03 +0000 (UTC)
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
 by mx.groups.io with SMTP id smtpd.web11.379.1729892574680282434
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 14:42:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Cruuqry+;
 spf=pass (domain: gmail.com, ip: 209.85.167.176, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3e612437c09so1480785b6e.2
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 14:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729892574; x=1730497374; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9BGdWvTXhaV5NNTiwxwqWVbprUCQhwH6CJgomNXJKx8=;
        b=Cruuqry+GQ9+0/WQG+kDnWCkXuWr0H5kE/UmtH01C8j+Byq8k6RcW/B25CAW3ja2KQ
         em4TcC5k7wIAxj7e7rab179TGjiNbe5+9g61vJkOw++Yi/YsgdVmULU9yXUKOvPToCuG
         yRkwumcQS932fxpcMdUsFlDeUX4Hzn1hIZGrsoaVKuGKsZcFdukIdCYxEHAP7Hggohkl
         O+29nuKbl8FltOocKhCOfRnHCemOBfTaf5oGA/zRMEEgDFq8KXgYv2wbD0i6kORbSMkW
         goSCXwvNsvwOqjRsGxXs7D8SXbmXYFYx5hl51alvcBYVGNJXPzITFEGv7ha9sFDMGpf0
         dSqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729892574; x=1730497374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9BGdWvTXhaV5NNTiwxwqWVbprUCQhwH6CJgomNXJKx8=;
        b=iR299VK9yilSlGy/WHMt01HTYTwgFc6s4ZFBQV8IrzmHej6eRnv89sluS9nian1Sq5
         1ly25OYgZObLyWdgbc8mtxmHh8iN/r2om8yLGP7kAEgODguXGfqDpib8NdmvEkB5FGZe
         tcoCm83ww+IfgLvoLvGE5FhZ2ZDWF+/N9+OXFwxr9qFeOM7kl3iG1KhuJnF1yMQC2qmL
         3d9XF0xvSzoPbQQJOmEZmtvUTa0bUVB33PhZBqq83n/TIKJ7yrnDBnDrANpzbasBCFuf
         0gnjQd45hqEjwZMC86epZJw8z+TgtSoJhbh55uWxNLSXP0lcPF+E4Iz/UMo7Dm2UhpSw
         UIIw==
X-Gm-Message-State: AOJu0YygsARH3oqk73MA0ddolXVE3KGJJPOBNiJFszrXtY/DVpZtnC6m
	d9uOZRyGMPDYdOe8IZoF62okwjuadRGwGSthRI6TKjEDi72K9qDOPGzGrjZ2NKN33Wmw+u9zJBD
	lLAwVSBuJzvqwbgmfCtsxW9jBXc4=
X-Google-Smtp-Source: AGHT+IG93wi2R4wREjA9MaTdrYY05gA2Yt/oJkKstVF0b/ThZPCA5Cxoz+akOJN4+PSCKjSobeuqto1oKfrKIaL62ho=
X-Received: by 2002:a05:6808:4445:b0:3e6:1fdb:1a88 with SMTP id
 5614622812f47-3e638239147mr967740b6e.8.1729892573900; Fri, 25 Oct 2024
 14:42:53 -0700 (PDT)
MIME-Version: 1.0
References: <20241025091614.2034294-1-fathi.boudra@linaro.org>
In-Reply-To: <20241025091614.2034294-1-fathi.boudra@linaro.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Oct 2024 14:42:28 -0700
Message-ID: <CAMKF1spWjScdE8iL1oUj7Zg_8U4hceuQ9K7TNpviiUmZTFSJiw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libksba: add bison (yacc) dependency
To: fathi.boudra@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 21:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206378

On Fri, Oct 25, 2024 at 2:16=E2=80=AFAM Fathi Boudra via
lists.openembedded.org
<fathi.boudra=3Dlinaro.org@lists.openembedded.org> wrote:
>
> Add build dependency to bison because yacc is required:
> https://git.gnupg.org/cgi-bin/gitweb.cgi?p=3Dlibksba.git;a=3Dblob;f=3Dcon=
figure.ac;h=3Da2b213f245786d010e0fbf3e19291f0b1ab2373e;hb=3D3a4382259c3c6e7=
ef38cd33626fe2c1da282f816#l162
>
> Fix ftbfs (triggered on scarthgap, but same apply to master):
> | test -f asn1-parse.c || /bin/bash ../../libksba-1.6.6/build-aux/ylwrap =
../../libksba-1.6.6/src/asn1-parse.y y.tab.c asn1-parse.c y.tab.h `echo asn=
1-parse.c | sed -e s/cc$/hh/ -e s/cpp$/hpp/ -e s/cxx$/hxx/ -e s/c++$/h++/ -=
e s/c$/h/` y.output asn1-parse.output -- yacc
> | ../../libksba-1.6.6/build-aux/ylwrap: line 175: yacc: command not found
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  meta/recipes-support/libksba/libksba_1.6.7.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/libksba/libksba_1.6.7.bb b/meta/recipes=
-support/libksba/libksba_1.6.7.bb
> index b7a9fc4050..7d308c66fa 100644
> --- a/meta/recipes-support/libksba/libksba_1.6.7.bb
> +++ b/meta/recipes-support/libksba/libksba_1.6.7.bb
> @@ -14,7 +14,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfd541d83f75d=
038c4e0617b672ed8bda \
>                      file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d98368=
0233ad02 \
>                     "
>
> -DEPENDS =3D "libgpg-error"
> +DEPENDS =3D "bison libgpg-error"

I think we need bison-native here.

>
>  BINCONFIG =3D "${bindir}/ksba-config"
>
> --
> 2.45.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206344): https://lists.openembedded.org/g/openembedde=
d-core/message/206344
> Mute This Topic: https://lists.openembedded.org/mt/109204960/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

