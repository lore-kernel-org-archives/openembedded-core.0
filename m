Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F83EEEC02
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 06:32:06 +0000 (UTC)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
 by mx.groups.io with SMTP id smtpd.web10.9264.1726641116943410471
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Sep 2024 23:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O5fWxoik;
 spf=pass (domain: gmail.com, ip: 209.85.210.47, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-710de2712eeso1356000a34.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Sep 2024 23:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726641116; x=1727245916; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k145CVC+8DceW4153m/2/xzYSN5PHSzcIdTb1szmtf8=;
        b=O5fWxoikSMI6n+Btoc1AA9/hMY33DMLHttcZve1yPPgnBIeCbyD+JXZQYEuz5YXOtH
         YTIZBQQeomtM2J/9KqOQCu+EgoRJZffB5u73mkCieL/U3jg3w1tt8hWSqRWJESfA9SZ4
         Mk+M7jHhiqWfzLEKW/5zxxhEmNxxuWA+cJZVJdenhIkWjj4JhBnv55xdzYa74CPQqJ5d
         mTo8UP2CYFV85EMskBd34vjO2lAvIQwCZ9Ktk/sC4h9aEm0wQRBv6VyWWcXbESpMBn6B
         TD2nzPOLrrA+70vdAlxSc/LW+574U83b2MuiGTe/7fbaigg12DVo6FJX0vYucKmJKb/E
         SypA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726641116; x=1727245916;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k145CVC+8DceW4153m/2/xzYSN5PHSzcIdTb1szmtf8=;
        b=Xf3bhXoGxv+NkgAwE/J4+1wHQZEL1CQ5dJIC2JzIi54wTHEW53f8cWoDPDHQeDSjzm
         aC6R3uORpbDgQ5N7A/Bu+CLTlHJAPwOU/1ptetVSWKWdTa19krG5nrE+FiY0FSG2PXSE
         O5pIW2X7mXkqzcn+sfkSYrK7wKdjSvztV/vq0nsfs26vBL0AziRYG1KDpiPl0LapOwDR
         9jeAfxos5JSp9uMhDOR1/9wwAU8Qxqy1UDptCgqTgORMMlCUGn7jn4ckguTt2wA35pzS
         9sb48KgMxZZRWN2yBAIpWZBTjMCgOZBVrPPyADondhG0zkGTOwh1DiN1AoNugqNpd+9z
         Pl8A==
X-Gm-Message-State: AOJu0YyBXBVlr42CZzLCbMt2JWELZw7ge9L900dvv6Vfu2Rz1g++E7Ek
	rvPChrbQrD0dnejSIZjyna6+b4orRnWnnOX73tebjdcKvEOCTk7TTuqvl+SKP9US3/lHDhGdmD5
	XMUyK0g3Eu0PEDvRNfLpi42GDvkg=
X-Google-Smtp-Source: AGHT+IHcaYjdOS+U8sLj8p5k8Hgi2TxJxtSrjntIHuW4nJOPyhEr5/rxitFt39x4X67goESCthiscOcAMztSZwsbRcU=
X-Received: by 2002:a05:6830:6202:b0:710:faa3:d7b with SMTP id
 46e09a7af769-71116c504a0mr11271340a34.24.1726641115856; Tue, 17 Sep 2024
 23:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <PR0P264MB3595982976989FEC3ED89B43F8622@PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM>
In-Reply-To: <PR0P264MB3595982976989FEC3ED89B43F8622@PR0P264MB3595.FRAP264.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Sep 2024 23:31:29 -0700
Message-ID: <CAMKF1sro50RL831B_q2Uzv97i7iTnvp3EehJDoPWU8gGS3j_qA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] security-flags: Re-enable pie for power pc
To: benjamin.grossschartner@urbanandmainlines.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 06:32:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204633

Thanks for the patch. Overall it seems ok, would be great if you
mentioned how you tested it

On Tue, Sep 17, 2024 at 10:45=E2=80=AFPM GROSSSCHARTNER Benjamin via
lists.openembedded.org
<benjamin.grossschartner=3Durbanandmainlines.com@lists.openembedded.org>
wrote:
>
> Classified as: {Hitachi Rail - Public}
>
> From f04017bf8bc0a4325de9e51251cd4d6dcdc1ecf0 Mon Sep 17 00:00:00 2001
> From: Benjamin Grossschartner <benjamin.grossschartner@urbanandmainlines.=
com>
> Date: Wed, 18 Sep 2024 07:11:16 +0200
> Subject: [PATCH] security-flags: Re-enable pie for power pc
>
> pie now works with gcc on powerpc, see:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D81170
>
> Signed-off-by: Benjamin Grossschartner <benjamin.grossschartner@urbanandm=
ainlines.com>
> ---
>  meta/conf/distro/include/security_flags.inc | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/dist=
ro/include/security_flags.inc
> index d97a6edb0f..f713a99465 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -31,12 +31,6 @@ SECURITY_NO_PIE_CFLAGS ?=3D "${SECURITY_STACK_PROTECTO=
R} ${lcl_maybe_fortify} ${SE
>  SECURITY_LDFLAGS ?=3D "-Wl,-z,relro,-z,now"
>  SECURITY_X_LDFLAGS ?=3D "-Wl,-z,relro"
>
> -# powerpc does not get on with pie for reasons not looked into as yet
> -GCCPIE:powerpc =3D ""
> -GLIBCPIE:powerpc =3D ""
> -SECURITY_CFLAGS:remove:powerpc =3D "${SECURITY_PIE_CFLAGS}"
> -SECURITY_CFLAGS:pn-libgcc:powerpc =3D ""
> -
>  SECURITY_CFLAGS:pn-glibc =3D ""
>  SECURITY_CFLAGS:pn-glibc-testsuite =3D ""
>  SECURITY_CFLAGS:pn-gcc-runtime =3D ""
> --
> 2.34.1
>
>
> {Hitachi Rail - Public}
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#204632): https://lists.openembedded.org/g/openembedde=
d-core/message/204632
> Mute This Topic: https://lists.openembedded.org/mt/108515753/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

