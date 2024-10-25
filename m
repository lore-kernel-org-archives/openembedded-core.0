Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDB5DD0C5F4
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 09:20:26 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web10.7959.1729848018752413604
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 02:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EkZNIakh;
 spf=pass (domain: gmail.com, ip: 209.85.167.43, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-539f58c68c5so3350132e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 02:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729848017; x=1730452817; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8c/5n+IcXDu4rju6Qu+pkGVkQzw5elPTr2Bb7dHRDrg=;
        b=EkZNIakhBGqynupxCUv+X89+XD99lo3/rdJwYpF3o085thLC0kptSPz1UxxSWC8G0D
         SUKTUk0JVzhuzfkBFKUQK0ZvfX2C96lm6fsCNmrtWRGXqPHZWpAMYgvONc/nTDdhfDRD
         7dmJLkkHnSIO6wcYjiDKmyNUQ+JCFmazEFXVhdqAieAUz+gAS2h9eGX8mWdT7ormWQRv
         AImL6ApvbwGeq17xmMTZgb41EK2Ld+KC1waj/iUe2QchUccVUtlA8TnfxWq+Oi02cKrs
         GTspGmpHarqQpaqHl3EDQvfG1mn5ge1GTRobuubAVgn0DDX98NZkKyAl4XTYN8jcoHo4
         KXEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729848017; x=1730452817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8c/5n+IcXDu4rju6Qu+pkGVkQzw5elPTr2Bb7dHRDrg=;
        b=pmBaFWy6k44Jo2HJ/bj9GyRWt8MiVdec9BiJ4E7Kyo3XgcLE5c1FrkU1l8gb8j6EQb
         FrW+ZT+aPF0gI6YFL77CCyEuMBW2LVkR6CovArfpX0/BrITW1vKwThekGniuesCSBI6z
         mutwckJdgnLKqkR+zUI+KNMFu3113QO79jQRMkagZlNiEborW6opwP3UVZcSkN7175tN
         OBx1olB8VGsu2NFdLjtahogF1pUdHPLcn2YkWHrU4invrOWAzAKr0w3Xg/N/3/9/SnDN
         SXhJkgnhDznEvs5sax7/z6khzuiSer/QOySj5pifZMUYdP4AAmXDAL3KWDH8rXxil79F
         Vz4g==
X-Gm-Message-State: AOJu0YyaGNhVcoeW4fsdLbS58UfOlItPaUKLXilY5IWsjqwlOmB35vd5
	ThJKAEDNdjKBR6Sa4FnhvtebkJqt8PkDFbwxgj+xAbctqbCSQkOeK1fQU2Qmr5T1agwuGtTsLCB
	GV/6wCDNS6hf/LcSRpq3zF8HJnHl4pA==
X-Google-Smtp-Source: AGHT+IHsoNCwki6QFrSifForf7ta8HEzsrNiY0vBrCG4DmqnpXxhCPuVjMnPqwc9FY1s2MXd89b0n9Gl9FCU889OYwQ=
X-Received: by 2002:a05:6512:3d06:b0:539:9720:99dc with SMTP id
 2adb3069b0e04-53b1a39ae7dmr8517984e87.46.1729848016650; Fri, 25 Oct 2024
 02:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20241025091614.2034294-1-fathi.boudra@linaro.org>
In-Reply-To: <20241025091614.2034294-1-fathi.boudra@linaro.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 25 Oct 2024 11:20:05 +0200
Message-ID: <CANNYZj_pSeCcgMhT_d9R6tNvmgeT4HgHnEc4jcnPCn-BD2Osjw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libksba: add bison (yacc) dependency
To: fathi.boudra@linaro.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 09:20:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206345

Why is this not a build error?

Alex

On Fri, 25 Oct 2024 at 11:16, Fathi Boudra via lists.openembedded.org
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
> Mute This Topic: https://lists.openembedded.org/mt/109204960/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

