Return-Path: <erik.schilling@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E193FCDB483
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 10:40:35 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.278233.1697625627194407832
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 03:40:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=gb1Y0NBK;
 spf=pass (domain: linaro.org, ip: 209.85.221.41, mailfrom: erik.schilling@linaro.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-323168869daso5992963f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 03:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697625625; x=1698230425; darn=lists.openembedded.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT6uVrI07mNHP5Cb2zfhLj7tkbDAyZjeAS5iqkxEqK4=;
        b=gb1Y0NBKbFHkFlP3rvISsWdGjXngWYyt7xzIfFp3zo7eB27SkS86dsockD401ZMS2W
         a60Jsi5IUsBCt/6lMCKz9VnqGOzEr2BrknTGOblsZhg+J11Lf3PJvFYtkwVzePRTPGs1
         GFlLTyZAAjfIQ8kKFxnyLve1pSc7jhSKfhazYiBadNpb20lkb7jmvZzAyVQHOM6s/ulL
         IR63Ul+iG5I58kINb/FYlBQZfgnVfmt/JnGm0A7C5F87cj0f73QK3sUPnn2gVkXEVSyZ
         iTP0PrA9j6kg/BziBY21ralwvVNErbjh4bDfiVfLoLOX5+YOOaDx46AhbL+uz9wPi9kE
         zv5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697625625; x=1698230425;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XT6uVrI07mNHP5Cb2zfhLj7tkbDAyZjeAS5iqkxEqK4=;
        b=Pnov0Z1LD+PCmM2coWT4rxKcXswsub7HeQZYV/ZfOUT/NUpd/dc6bPL1i5khDjhsUt
         PlRDWucSEgudrESQjTj+jHLX3oabqF4oUvw/Vn0Yul2UVI5idEkT548c+jhMMRegOeTy
         uBnsLw2esURXE9ksbcMgg1kyDvQNIFm17++9zxMU/fW3GXikQlTeSR0mQJLv7X1giQeH
         R6Ylqqk/McHQxSOTH7j3q+eFxKyMMkNDsHcmpKnrDFsb+IDUNd+MaH52AFy9NEirQaUL
         s4/u3CgjqUEQwhD1Eb9QC/M7PFrj3BodfPEaIaLUyP7xa91Id7W09F0W80RrfU8abE/C
         J8Qw==
X-Gm-Message-State: AOJu0YzSk75f0Nbw13G0cOl5bEIcc73b+jObkyCdIRe3TzdOclZ2bsEO
	EjuFlkA1jQ9ykvoJd2skPzckxw==
X-Google-Smtp-Source: AGHT+IFDA82RwZCgAoiVGD7xqOqCBLFOYH/OXlqGbc6mB6AsSoyy+32eWgAB6doQg91OzTQ0BePWTg==
X-Received: by 2002:a5d:4086:0:b0:32d:9d99:94e7 with SMTP id o6-20020a5d4086000000b0032d9d9994e7mr3656773wrp.49.1697625625479;
        Wed, 18 Oct 2023 03:40:25 -0700 (PDT)
Received: from localhost (i5387884E.versanet.de. [83.135.136.78])
        by smtp.gmail.com with ESMTPSA id t1-20020a5d6a41000000b0032d9efeccd8sm1816732wrw.51.2023.10.18.03.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Oct 2023 03:40:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Oct 2023 12:40:24 +0200
Message-Id: <CWBI25L28WY3.2OKCTDSP9F4ZK@ablu-work>
Subject: Re: [OE-core] [PATCH] systemd: fix packaging tpm2 plugin for
 cryptsetup
Cc: <openembedded-core@lists.openembedded.org>, "Kristian Klausen"
 <kristian@klausen.dk>, "Mikko Rapeli" <mikko.rapeli@linaro.org>, "Javier
 Tia" <javier.tia@linaro.org>
To: "Jose Quaresma" <quaresma.jose@gmail.com>
From: "Erik Schilling" <erik.schilling@linaro.org>
X-Mailer: aerc 0.15.2
References: <20231016-b4-systemd-tpm2-crypt-plugin-v1-1-21fef10601ff@linaro.org> <CANPvuRk9GopD1yCbmSPk_pS1M=bC8drdAefYSpJ95cEQBq6Wdw@mail.gmail.com> <CWAHA5EQL45Z.3HPZNQBIRGUUL@ablu-work> <CANPvuRnyvniBMEhWU2Jzrd4scx=1K4PkMy8w2VG3y8MSB4Bv8w@mail.gmail.com> <CWBCTF54QUSS.3DJVMJ9KMORGK@ablu-work> <CANPvuR=KEWP1Mqw1q+co7hRTP61QNphj48N7mVNPjXFBHqZZqw@mail.gmail.com>
In-Reply-To: <CANPvuR=KEWP1Mqw1q+co7hRTP61QNphj48N7mVNPjXFBHqZZqw@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 10:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189377

On Wed Oct 18, 2023 at 11:26 AM CEST, Jose Quaresma wrote:
> Erik Schilling <erik.schilling@linaro.org> escreveu no dia quarta,
> 18/10/2023 =C3=A0(s) 07:33:
>
> > On Tue Oct 17, 2023 at 10:51 AM CEST, Jose Quaresma wrote:
> > > Hi Erik,
> > >
> > > Erik Schilling <erik.schilling@linaro.org> escreveu no dia ter=C3=A7a=
,
> > > 17/10/2023 =C3=A0(s) 06:51:
> > >
> > > > On Mon Oct 16, 2023 at 6:31 PM CEST, Jose Quaresma wrote:
> > > > > Erik Schilling <erik.schilling@linaro.org> escreveu no dia segund=
a,
> > > > > 16/10/2023 =C3=A0(s) 13:02:
> > > > >
> > > > > > When building with `cryptsetup` and `tpm2` in the
> > > > > > PACKAGECONFIG, this plugin will be emitted.
> > > > > >
> > > > > > Cc: Kristian Klausen <kristian@klausen.dk>
> > > > > > Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > > > > Cc: Javier Tia <javier.tia@linaro.org>
> > > > > > Fixes: 7b7dfbfaed ("systemd: Add tpm2 PACKAGECONFIG")
> > > > > > Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
> > > > > > ---
> > > > > >  meta/recipes-core/systemd/systemd_254.4.bb | 1 +
> > > > > >  1 file changed, 1 insertion(+)
> > > > > >
> > > > > > diff --git a/meta/recipes-core/systemd/systemd_254.4.bb
> > > > > > b/meta/recipes-core/systemd/systemd_254.4.bb
> > > > > > index 77724eb822..6ecfbaf293 100644
> > > > > > --- a/meta/recipes-core/systemd/systemd_254.4.bb
> > > > > > +++ b/meta/recipes-core/systemd/systemd_254.4.bb
> > > > > > @@ -645,6 +645,7 @@ FILES:${PN} =3D " ${base_bindir}/* \
> > > > > >                  ${sysconfdir}/X11/xinit/xinitrc.d/* \
> > > > > >                  ${rootlibexecdir}/systemd/* \
> > > > > >                  ${rootlibdir}/systemd/libsystemd-core* \
> > > > > > +
> > > > > > ${rootlibdir}/cryptsetup/libcryptsetup-token-systemd-tpm2* \
> > > > > >
> > > > >
> > > > > The systemd-cryptenroll was packed in the systemd-extra-utils so
> > packing
> > > > > the plugin
> > > > > on the main systemd package is a bit weird.
> > > > > I wonder if a new package like systemd-crypt is better appropriat=
e
> > for
> > > > this
> > > > > where we
> > > > > going to put the systemd-cryptenroll and all the plugins availabl=
e in
> > > > > ${rootlibdir}/cryptsetup
> > > >
> > > > Ah, did not realize that... I agree that breaking up systemd into
> > > > smaller packages would probably be a good thing. Currently building=
 an
> > > > image with systemd in the initramfs and main image gives little cho=
ice
> > > > over which components go where... I will try a systemd-crypt varian=
t.
> > > > Will also take a look at how other distros solve this.
> > > >
> > >
> > > I've been using this systemd-crypt package on my distro for some time=
 now
> > > but I've forgotten to send it.
> > > In this package additionally to the TPM plugin I also have another fo=
r
> > the
> > > PKVS#11.
> > > I have all of these in a bbappend and I can easily extract.
> >
> >
> > Ah that sounds great!
> >
> >
> > > So you don't have to worry, I still do it today.
> >
> > Sorry, I do not understand what you mean here. Did you mean that you
> > plan to send a patch?
> >
>
> I apologize for not being clear. I sent the patch serie yesterday
> [1] https://patchwork.yoctoproject.org/project/oe-core/list/?series=3D178=
34

Thanks a lot! Will try it out in the next days!

- Erik

>
>
> >
> > - Erik
> >
> > > > >
> > > > >                  ${libdir}/pam.d \
> > > > > >                  ${nonarch_libdir}/pam.d \
> > > > > >                  ${systemd_unitdir}/* \
> > > > > >
> > > > > > ---
> > > > > > base-commit: 97f0a73c0a9db5506310328cd29f165eab3c509d
> > > > > > change-id: 20231016-b4-systemd-tpm2-crypt-plugin-5064c458e726
> > > > > >
> > > > > > Best regards,
> > > > > > --
> > > > > > Erik Schilling <erik.schilling@linaro.org>
> > > > > >
> > > > > >
> > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > > Links: You receive all messages sent to this group.
> > > > > > View/Reply Online (#189288):
> > > > > > https://lists.openembedded.org/g/openembedded-core/message/1892=
88
> > > > > > Mute This Topic:
> > https://lists.openembedded.org/mt/101993740/5052612
> > > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub
> > > > [
> > > > > > quaresma.jose@gmail.com]
> > > > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > > >
> > > > > >
> > > >
> > > >
> >
> >


