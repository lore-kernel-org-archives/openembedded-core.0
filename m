Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D642BC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 09:54:36 +0000 (UTC)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
 by mx.groups.io with SMTP id smtpd.web10.17053.1713174866906192170
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Apr 2024 02:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=myM0VCG8;
 spf=pass (domain: gmail.com, ip: 209.85.208.170, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2da68af6c6fso12445901fa.3
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 02:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713174865; x=1713779665; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GyBPPD41eGhTRz2Uc1D+gr+jWdw1M0DsEsQDWBaoF8=;
        b=myM0VCG8UYpOJXlGNrA7/ONU7SC6txDWwGWdN937YSFYtk+iTZ66Wj97BGdNGE+QCF
         DoNZy3q+RyJn7j//kUzxPK9avI89W6Hw018b9moCEp+AyxpRltyExKr5WE1dFhUQR7pE
         PV6GsRL73Nn6m/cazyqDYahFDfHFbsdgmx1y9g54K3jIR2sghwXdEpjl62q8LoZKmb4r
         PZ+0OhgiRAaK2+66YVmOFUCOFGN5eY+BeLoPv4BQcJzw9/QR8pb46CuNQGsD6W7wud1t
         amOnuiRlsHa0b/rh1ouxVpvyuxoAziKuV2Z+xOH31S1DF1WpmePyYW+U9e7FrMrolSlU
         n0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713174865; x=1713779665;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GyBPPD41eGhTRz2Uc1D+gr+jWdw1M0DsEsQDWBaoF8=;
        b=uINGfzpWFmiwguofOY5XMgT6XhEcoBu6U7ulhFYlIcbGcllMUKXWxnRkEgGDNzBOrt
         +03uLDRXfRw2uVBi8VVPLwiACWpU61HzofoeGAWKJ5W+EO5xLBr6WVg6Y2jex9NxSzWL
         yKJ0pnyi5aPlL4FWOOui1I68KOGhV+vavHwzsUofllKnVwHVttt+rQyi6R3aGRK+UlFW
         1aRyDnskfFeqwlLv5yOYt00G7cgcf3w1ikAcZX1WNz6K+S10DbAckkjgBCTDL5IrSzBD
         ATb7+YAy4nb8L0xFVka3w9amq/nJumGg0fju7BfMEqQgUlg3N+SJkr+A0EW6SDUAFQPB
         Udmw==
X-Gm-Message-State: AOJu0Yw7JtoyWSJJpSreavyy3pns0Mdqb8nmoY3sTF6/omcCR3VEloI+
	hm3/6DL1f50xFw/QyevEdI7s+BaEkP4GjZKajlDz5/Bfd1xULjeRoB1FqnK39rHms5fXYQy2RVK
	fWx4YK4kyM0GqxSjUlDywcz5OJXM=
X-Google-Smtp-Source: AGHT+IEAQLMZ7e8bxjJg6EQ5qC2a0vvXUGZwrgftwP3PhYRSKpTZKSwQ7EEsJmvMkuf8J4GcRTtNbb0opwgFQ8ieQ4E=
X-Received: by 2002:a2e:8695:0:b0:2d8:a921:dfc1 with SMTP id
 l21-20020a2e8695000000b002d8a921dfc1mr6015556lji.20.1713174864884; Mon, 15
 Apr 2024 02:54:24 -0700 (PDT)
MIME-Version: 1.0
References: <17C62AA529E16CB6.8361@lists.openembedded.org> <8BRXBS.D9N3NVEBQKWZ@t-online.de>
In-Reply-To: <8BRXBS.D9N3NVEBQKWZ@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 15 Apr 2024 11:54:13 +0200
Message-ID: <CANNYZj9tH9jaoJGpJbsy1ZYDv4NQATtN6zt51zx9cHwTdY2YaA@mail.gmail.com>
Subject: Re: [RFC][oe-core][PATCH] xwayland: update 23.2.5 -> 23.2.6
To: f_l_k@t-online.de
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Apr 2024 09:54:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198226

Then the libei move should be sent together with the update as a set.
libei first.

Alex

On Sun, 14 Apr 2024 at 16:08, Markus Volk via lists.openembedded.org
<f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
>
> This requires libei which is currently in meta-oe
>
> On Sun, Apr 14 2024 at 04:06:52 PM +02:00:00, Markus Volk <f_l_k@t-online=
.de> wrote:
>
> - add a PACKAGECONFIG for libdecor ! This will require to move libei from=
 meta-oe to oe-core ! Signed-off-by: Markus Volk <f_l_k@t-online.de> --- ..=
./xwayland/{xwayland_23.2.5.bb =3D> xwayland_23.2.6.bb} | 5 +++-- 1 file ch=
anged, 3 insertions(+), 2 deletions(-) rename meta/recipes-graphics/xwaylan=
d/{xwayland_23.2.5.bb =3D> xwayland_23.2.6.bb} (89%) diff --git a/meta/reci=
pes-graphics/xwayland/xwayland_23.2.5.bb b/meta/recipes-graphics/xwayland/x=
wayland_23.2.6.bb similarity index 89% rename from meta/recipes-graphics/xw=
ayland/xwayland_23.2.5.bb rename to meta/recipes-graphics/xwayland/xwayland=
_23.2.6.bb index b934a873d1..62241a1258 100644 --- a/meta/recipes-graphics/=
xwayland/xwayland_23.2.5.bb +++ b/meta/recipes-graphics/xwayland/xwayland_2=
3.2.6.bb @@ -10,20 +10,21 @@ LICENSE =3D "MIT" LIC_FILES_CHKSUM =3D "file:/=
/COPYING;md5=3D5df87950af51ac2c5822094553ea1880" SRC_URI =3D "https://www.x=
.org/archive/individual/xserver/xwayland-${PV}.tar.xz" -SRC_URI[sha256sum] =
=3D "33ec7ff2687a59faaa52b9b09aa8caf118e7ecb6aed8953f526a625ff9f4bd90" +SRC=
_URI[sha256sum] =3D "1c9a366b4e7ccadba0f9bd313c59eae12d23bd72543b22a26eaf8b=
20835cfc6d" UPSTREAM_CHECK_REGEX =3D "xwayland-(?P<pver>\d+(\.(?!90\d)\d+)+=
)\.tar" inherit meson features_check pkgconfig REQUIRED_DISTRO_FEATURES =3D=
 "x11 opengl" -DEPENDS +=3D "xorgproto xtrans pixman libxkbfile libxfont2 w=
ayland wayland-native wayland-protocols libdrm libepoxy libxcvt" +DEPENDS +=
=3D "xorgproto xtrans pixman libxkbfile libxfont2 wayland wayland-native wa=
yland-protocols libdrm libei libepoxy libxcvt" OPENGL_PKGCONFIGS =3D "glx g=
lamor dri3" PACKAGECONFIG ??=3D "${XORG_CRYPTO} \ ${@bb.utils.contains('DIS=
TRO_FEATURES', 'opengl', '${OPENGL_PKGCONFIGS}', '', d)} \ " PACKAGECONFIG[=
dri3] =3D "-Ddri3=3Dtrue,-Ddri3=3Dfalse,libxshmfence" +PACKAGECONFIG[libdec=
or] =3D "-Dlibdecor=3Dtrue,-Dlibdecor=3Dfalse,libdecor" PACKAGECONFIG[glx] =
=3D "-Dglx=3Dtrue,-Dglx=3Dfalse,virtual/libgl virtual/libx11" PACKAGECONFIG=
[glamor] =3D "-Dglamor=3Dtrue,-Dglamor=3Dfalse,libepoxy virtual/libgbm,libe=
gl" PACKAGECONFIG[unwind] =3D "-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,libun=
wind"
> --
> 2.44.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#198210): https://lists.openembedded.org/g/openembedde=
d-core/message/198210
> Mute This Topic: https://lists.openembedded.org/mt/105517140/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

