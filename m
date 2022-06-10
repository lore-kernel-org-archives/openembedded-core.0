Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D78D8CCA47B
	for <webhook@archiver.kernel.org>; Fri, 10 Jun 2022 10:48:48 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web11.25634.1654858120804298824
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 03:48:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GYNhvDBL;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id h23so42196787lfe.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jun 2022 03:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gQlivJ96NbGGxSO2ayab3+6oOu3aQIAhgnAie0/7hZs=;
        b=GYNhvDBL7IN4LkaYUJuQVkb9Momqpg+NoTeDPlTNFN3Kmb+PnWumMIuLZ2IB/XuM24
         h0jujl3Bgd0kUiiECjkRQmAskX4vtRpnOTb/hoD8zdGFKdnHdnHuxq+unqzC4Ca0Xblx
         +gdlpbsFd1UGucajAYSBR23ycB6aqqt+z+YIQw6BUErZIAdCmxMDOemHoPKvqhUzQJw7
         Y7zfbMSAnKjMAohZ9hj0n1pgBhMan0GhTapxbrbDgUH3v4p/3xRWhLz/D3wTZwixSDsk
         j3G2mwC5N5i6esSsweAAf+3jd+AIxx6NXXkRB9Hh4sbw+a3Skq1zOK21Vb0FPSuMzSP5
         8CRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gQlivJ96NbGGxSO2ayab3+6oOu3aQIAhgnAie0/7hZs=;
        b=ePam3fR2/uUGdzgEjeUZ44bMknSs34Ron6c8O3Js/kdd+fKxslIiHOWDUYHypFmDHE
         3lzkBmefCrv7zg0HrBtCx4AsIeAjv5/ikqE65g/CBKZoBU2kDKyCNVxl3wnwwcqL/PQe
         ssSziolRmND4acX8BEsqfgBv9lcFZVh8wPAcSM2N6pROz9bm/V9fss5hx2iwuV9XWPto
         kXXRT0n+efuVrbRdtV7FOVco0L9nsoDYPOXxuO/YaOh4i8dZPijON+APCkHnpaXvoqS/
         1XX/SaGdbXqdwhvk7eeLcBNNrTPSMObUtq/FwchZO8wGfrXyFZR+humg+xjNbPl/OoW9
         LdXg==
X-Gm-Message-State: AOAM530dszb4hNZCZNLMyU6MvX/nnJBk4ouVLwUKKwix52yqTEDaopR6
	hWls2tUN8FGVHbbhcM8xFjnP0WmqL+bI4bi7WE4=
X-Google-Smtp-Source: 
 ABdhPJzzuI0oPWiRBDKhTKkfZHaeGgQNPrlEOiCk8xXeIzo/NsHrUjNb/YzSxcnXwAeKDNOCirT056pKMiNsmdoz8to=
X-Received: by 2002:ac2:48ab:0:b0:47d:af82:65e9 with SMTP id
 u11-20020ac248ab000000b0047daf8265e9mr1791136lfg.673.1654858118923; Fri, 10
 Jun 2022 03:48:38 -0700 (PDT)
MIME-Version: 1.0
References: <aURC.1654854497455875682.GtQ3@lists.openembedded.org>
In-Reply-To: <aURC.1654854497455875682.GtQ3@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 Jun 2022 12:48:27 +0200
Message-ID: 
 <CANNYZj_-fR3=Hj7UayvQpYeMUstP+imD6S645=eGBHWS=oGejA@mail.gmail.com>
Subject: Re: [OE-core] [honister] test and patches for xwayland support
To: Sebastian.Suesens@baslerweb.com
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Jun 2022 10:48:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166796

This means the weston process is crashing. You need to handle it like
any other crash: collect a coredump file and inspect it with gdb.

Alex

On Fri, 10 Jun 2022 at 11:48, S=C3=BCsens, Sebastian via
lists.openembedded.org
<Sebastian.Suesens=3Dbaslerweb.com@lists.openembedded.org> wrote:
>
> Hello,
>
> I wrote a test (0001-PATCH-honister-weston.py-added-xwayland-test.patch).=
 It tests if weston supports xwayland.
> I tested core-image-weston on honister without my patches and with my wes=
ton patches (0002-PATCH-honister-add-xwayland-support.patch).
>
>
> Test result:
> In this file result-honister-core-image-weston-without-patch.txt the test=
 weston_supports_xwayland test failed.
> In this file result-honister-core-image-weston-patched.txt the test westo=
n_supports_xwayland test passed.
>
> Note:
> When I enable xwayland support on master branch I get following error mes=
sage:
>
> weston[325]: segfault at 28 ip 00007f4e36fb8259 sp 00007ffec0d9ae00 error=
 4 in libwayland-server.so.0.20.0
>
>
> Please help me to get xwayland support on master branch.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166793): https://lists.openembedded.org/g/openembedde=
d-core/message/166793
> Mute This Topic: https://lists.openembedded.org/mt/91664874/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

