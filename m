Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A20C5C369C2
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 21:14:48 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.2035.1745356486132582993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Apr 2025 14:14:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=E5i5Jh82;
 spf=pass (domain: gmail.com, ip: 209.85.208.169, mailfrom: alex.kiernan@gmail.com)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-30bf3f3539dso3174601fa.1
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 14:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745356484; x=1745961284; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihhtt3Bo4Bzfqj45tiNEjlB+WyuuhK4vUXEbYrNRc0A=;
        b=E5i5Jh82Mf2NehXmR8bKYHZ+6Rsna/XABhmEiLhm6zSvwzz8UwEMr1pRdbZayRPJRg
         utgZRs7clPd0tolD+4p1jJOuz0KCmul2+TweEt0im0eeIA7MN5DAtJiItyc3v+7haBQ6
         NA8C9jc9bwhwa67FTfTU4kTmrUJprZ605rpH23YHedeIZNeRGc6mkkx5ufBqiTqsSHWV
         aVYsgZOR4OrkrsntG8l5JYhmqtQqV8bpQthlyYG80miwIgSln090kQsBdxQBhgd2T3v8
         N2xFXBtnp6UzrL2lWv4ujVlMHpMC4UZS4d2YvivXd/NIWo49b5P24kCIzix6ZsPAcokz
         aPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745356484; x=1745961284;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihhtt3Bo4Bzfqj45tiNEjlB+WyuuhK4vUXEbYrNRc0A=;
        b=fRUwK3y2sc8P+8url8ij6FrU8pyAcwA6Z554E545taUHkrIpZGBtzMt/X9aXyO1j7O
         yCZOAf576JGQnSgoWixOl3picc1COdzL9DY8Qhqf3fk96kP8TFb2J3wpA4apGjKmyqG4
         DKmkB9UCl2Dgaoqndlf5Wt8i0LXv2/jJRWCt+VRL06hZI/Qmr8+458uBDNC4hsobmkrk
         9Zs3bFr2BdHZDv5Yeu+g5V+JOna/c7YOmeeEZO3S21eoN4vezf3vY+O++tqfZinML6aK
         NsdCXpjwrSUl1HesqVfTB9amJiYP3YSNIBlOJUkava02rFM750ouvQM4Z2LDZfx5DlVp
         0dUw==
X-Forwarded-Encrypted: i=1; AJvYcCW2WW39F4jF/ARCK/Ys7DddawttrWkpYHXfSF26Q6QGZZ8DTLd7hHDuiewmkAuk4DWKyCtZHC8fVyW25eSl7wbZJA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyapKMXCkcjD7CHiFU1kWXjJCPcyR86ZlyC6HfRALcqFahDAy0P
	ieeOp2AI+kgNVhqFZIh2Hti4EtR/dWkpgOGnC0RUZ9mT4ipv+LGhVDGsRYyxRvYFTOSEinB2/OM
	N3fGqQhtb/ABYNNisTJ/NJ1qL1WI=
X-Gm-Gg: ASbGncve0nSmuxm2LOlIgW0nEZzsMRizIyW8F6vMXUAkA+MSsUFB+LHGi231BxIXJgq
	8UNfHHOExQOlhyMzbuRQtbSw+6FHiTczmeY7HdletvsZUBE0gA/kH62HH6rWf9GiqKbMMBJcm02
	y+tIndx/mk7hvIv8xCCAnz
X-Google-Smtp-Source: AGHT+IH0QURDdi8SIkVcMDUNJ8n4A53hyc6ZWtMOAeEXHeS8bJKN/6Rs9mM9F5qZy7jjcqHcjUjJNtAL5KrAq+n8ftM=
X-Received: by 2002:a05:651c:1448:b0:30d:e10c:cae0 with SMTP id
 38308e7fff4ca-316702ac60cmr1274441fa.20.1745356484019; Tue, 22 Apr 2025
 14:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAOf3PZyrgCJviBHSBeDMmdcH+possRxwmNRoNOyXzRQtabV8iQ@mail.gmail.com>
 <DB5PR02MB10213F71504E2AA09A113921CEFBB2@DB5PR02MB10213.eurprd02.prod.outlook.com>
In-Reply-To: <DB5PR02MB10213F71504E2AA09A113921CEFBB2@DB5PR02MB10213.eurprd02.prod.outlook.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Tue, 22 Apr 2025 22:14:32 +0100
X-Gm-Features: ATxdqUFrR1nFmTa_yk8NgPyLprYvWxy4XNBUQGfdXC_q20W5dBwm8sbm4QuiXxY
Message-ID: <CAO5Uq5Rp5Z1N9Rhh05XHaVUtTfEinhNFSACwU2kEdi7nBaRjEg@mail.gmail.com>
Subject: Re: [OE-core] linux-firmware-rtl8723 RDEPENDS on entire linux-firmware
To: peter.kjellerstedt@axis.com
Cc: "patryk.seregiet@gmail.com" <patryk.seregiet@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Apr 2025 21:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215246

On Tue, Apr 22, 2025 at 8:36=E2=80=AFPM Peter Kjellerstedt via
lists.openembedded.org
<peter.kjellerstedt=3Daxis.com@lists.openembedded.org> wrote:
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org <openembedded-core@lists=
.openembedded.org> On Behalf Of patryk seregiet via lists.openembedded.org
> > Sent: den 22 april 2025 18:50
> > To: openembedded-core@lists.openembedded.org
> > Subject: [OE-core] linux-firmware-rtl8723 RDEPENDS on entire linux-firm=
ware
> >
> > Hello,
> >
> > Today I noticed that even though I only install few selected
> > linux-firmware-xxx packages I end up installing all of them. Finally I
> > narrowed it down to linux-firmware-rtl8723 RDEPENDSing on
> > linux-firmware.
> >
> > from build/tmp-glibc/pkgdata/iot-gate-imx8/runtime/linux-firmware-rtl87=
23:
> > ....
> > 11:RDEPENDS:linux-firmware-rtl8723: linux-firmware linux-firmware-rtl-l=
icense
>
> The problem here is rtl8723d_config.bin, which is a symbolic link to
> rtl8821c_config.bin. The latter is packaged in Linux-firmware and thus
> an automatic runtime dependency is added from linux-firmware-rtl8723 to
> linux-firmware.
>
> My guess is that the files matching
> ${nonarch_base_libdir}/firmware/rtl_bt/rtl8821* should be included in
> the ${PN}-rtl8821 package instead.
>

Oh nice catch... I had image size explosion for the board using that
firmware on my todo list, but hadn't got to it.

> >
> > Another package that has the same problem is linux-firmware-adsp-sst.
> > I've looked at all the code, bbappends, different confs and could not
> > find how linux-firmware ends up as RDEPENDS of this package. The only
> > commit related to this package I found even remotely likely was this
> > in oe-core deaaf43b8f6c905f04f3d0c56693c027ceac3e3a
> > which adds 2 lines to the FILES
> > FILES:${PN}-rtl8723 =3D " \
> >    ${nonarch_base_libdir}/firmware/rtlwifi/rtl8723*.bin* \
> >    ${nonarch_base_libdir}/firmware/rtw88/rtw8723*.bin* \
> >    ${nonarch_base_libdir}/firmware/rtl_bt/rtl8723*.bin* \
> >
> > and what do you know, removing the last line "
> > ${nonarch_base_libdir}/firmware/rtl_bt/rtl8723*.bin*" makes this
> > problem disappear. I can't figure out why. Seeing this I took a look
> > at linux-firmware-adsp-sst. It only has one FILES line
> > FILES:${PN}-adsp-sst              =3D
> > "${nonarch_base_libdir}/firmware/intel/dsp_fw*"
> >
> > just for the test I removed the asterisk and it also fixed the issue.
> > Not sure if changing the FILES variable here makes any real difference
> > or if it just flushes some bad cache... no idea, i tried
> > do_cleanall/sstate and all the usual stuff but this is the only way I
> > managed to create these two packages without them having RDEPENDS set
> > to linux-firmware.
>
> The problem here is similar. There are a number of symbolic links
> included in the linux-firmware-adsp-sst package that link to files in
> the linux-firmware package.
>
> Moving the files matching
> ${nonarch_base_libdir}/firmware/intel/avs/*/dsp_basefw.bin to
> ${PN}-adsp-sst should solve it.
>
> >
> > Pozdrawiam / Best Regards
> > Patryk Seregiet
>
> //Peter
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#215245): https://lists.openembedded.org/g/openembedde=
d-core/message/215245
> Mute This Topic: https://lists.openembedded.org/mt/112401003/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kiernan@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Alex Kiernan

