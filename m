Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B8BDC433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 07:24:44 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.4659.1654068279450730744
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 00:24:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UQeXjZA/;
 spf=pass (domain: gmail.com, ip: 209.85.208.176,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id z13so999124ljn.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=e0diocxVkVQ+uxQQjb1lCHqFKUXJlvoIMZB5Jntnhfc=;
        b=UQeXjZA/eI/1WVOeEZaiHWov7UC8hIa6CmrvLQAlb/MRyVhhIlWULYqiqZIJDnjhiA
         DZN0PDx1Z19dvacQlzUggbMVfODv1Yo0iynggOvY01wrLKvObmL33qWVFjv1sRGvy39o
         ZiP4VMi7fhI9dT3G05ru6x2QacnNl41p9NKhJl6IIjj3Apj2yXkYUZSF76ah0HgoVlPa
         UuEJKKvOMm4PI3CZOmshRlK6OV1rhgN5SbQl4WTfpKQrcOeHf4Kq/fNVC22gwMMmiXa1
         x6gu6HLLnk1MYntbVHwN4r/T/jcpnYZE4l/Baypj9U0OlQhkV28CZG8ymiJNSnKo71J9
         b3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=e0diocxVkVQ+uxQQjb1lCHqFKUXJlvoIMZB5Jntnhfc=;
        b=nUWiXaXOs7XfTTgRJ3hbMBsUDXlOhnxMz6DZGyJRBC+ccSOWCwgnuQ3dRbzu462xxR
         /BvDSPNagpN4XevChYxA7s3PtAdAdjNttRTv7MpixXZhy3Rw3dt/bIqbh6Vg6DiS6r+7
         tGvhrZ4BgB/o/SCfLNwZ/JaLlhl0Enybpmj961cWKzd1408MFGyBN5jKnoBYinQLSHUn
         H2kQcMgzE+mcQVzExs9+0UME1iefnsCHYK2chX74HypNGf7ovcEkpNIl9DKIQoV9k+ml
         DySkl1Rpr3U6buxXicmHFoMQmWAFhzGKwslpTy/K5UzHDJQWzuNj39AIpHQbQvvpcIqI
         38Cw==
X-Gm-Message-State: AOAM531e7xswQdC4aaFwD6hcBnxCmJCHxHuK7o1EuY+du+mT50BioO8A
	oxZmBbu9a9hERx/2Ztxm4WG7LTgUfccaYrk55Xs=
X-Google-Smtp-Source: 
 ABdhPJxVbvAntG2jItWix3PG8+SjgpgDmQS1Qj/d3uMt955DG0TN5gG5icYvpOpstl9kjELpjvTZog3kh15iBJOTLUI=
X-Received: by 2002:a2e:97c7:0:b0:255:69f4:b9eb with SMTP id
 m7-20020a2e97c7000000b0025569f4b9ebmr1490048ljj.109.1654068277581; Wed, 01
 Jun 2022 00:24:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220531141645.3401821-1-davide.gardenal@huawei.com>
In-Reply-To: <20220531141645.3401821-1-davide.gardenal@huawei.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Jun 2022 09:24:25 +0200
Message-ID: 
 <CANNYZj-r853z=4LHDusy0QrQi73AfwrMe_DoF2hwqjEsZpkFJA@mail.gmail.com>
Subject: Re: [OE-core] [master][kirkstone][PATCH] ncurses: update to
 patchlevel 20220423
To: Davide Gardenal <davidegarde2000@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Davide Gardenal <davide.gardenal@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 07:24:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166357

This is effectively updating to a development snapshot, would it be
better to backport just the CVE fix like was just sent for dunfell?

Alex

On Tue, 31 May 2022 at 16:16, Davide Gardenal <davidegarde2000@gmail.com> w=
rote:
>
> CVE: CVE-2022-29458
>
> Signed-off-by: Davide Gardenal <davide.gardenal@huawei.com>
> ---
>  meta/recipes-core/ncurses/ncurses.inc                         | 2 +-
>  .../ncurses/{ncurses_6.3.bb =3D> ncurses_6.3+20220423.bb}       | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-core/ncurses/{ncurses_6.3.bb =3D> ncurses_6.3+202204=
23.bb} (77%)
>
> diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/nc=
urses/ncurses.inc
> index 7a7c7dd227..1abcfae1fe 100644
> --- a/meta/recipes-core/ncurses/ncurses.inc
> +++ b/meta/recipes-core/ncurses/ncurses.inc
> @@ -2,7 +2,7 @@ SUMMARY =3D "The New Curses library"
>  DESCRIPTION =3D "SVr4 and XSI-Curses compatible curses library and termi=
nfo tools including tic, infocmp, captoinfo. Supports color, multiple highl=
ights, forms-drawing characters, and automatic recognition of keypad and fu=
nction-key sequences. Extensions include resizable windows and mouse suppor=
t on both xterm and Linux console using the gpm library."
>  HOMEPAGE =3D "http://www.gnu.org/software/ncurses/ncurses.html"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D9529289636145d1bf093c96af0676=
95a;endline=3D27"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc5a4600fdef86384c41ca33ecc70a=
4b8;endline=3D27"
>  SECTION =3D "libs"
>  DEPENDS =3D "ncurses-native"
>  DEPENDS:class-native =3D ""
> diff --git a/meta/recipes-core/ncurses/ncurses_6.3.bb b/meta/recipes-core=
/ncurses/ncurses_6.3+20220423.bb
> similarity index 77%
> rename from meta/recipes-core/ncurses/ncurses_6.3.bb
> rename to meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
> index f0256dad22..f67a3f5bf4 100644
> --- a/meta/recipes-core/ncurses/ncurses_6.3.bb
> +++ b/meta/recipes-core/ncurses/ncurses_6.3+20220423.bb
> @@ -5,10 +5,10 @@ SRC_URI +=3D "file://0001-tic-hang.patch \
>             file://0003-gen-pkgconfig.in-Do-not-include-LDFLAGS-in-genera=
ted.patch \
>             "
>  # commit id corresponds to the revision in package version
> -SRCREV =3D "51d0fd9cc3edb975f04224f29f777f8f448e8ced"
> +SRCREV =3D "a0bc708bc6954b5d3c0a38d92b683c3ec3135260"
>  S =3D "${WORKDIR}/git"
>  EXTRA_OECONF +=3D "--with-abi-version=3D5"
>  UPSTREAM_CHECK_GITTAGREGEX =3D "(?P<pver>\d+(\.\d+)+)$"
>
>  # This is needed when using patchlevel versions like 6.1+20181013
> -#CVE_VERSION =3D "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").spl=
it('+')[1]}"
> +CVE_VERSION =3D "${@d.getVar("PV").split('+')[0]}.${@d.getVar("PV").spli=
t('+')[1]}"
> --
> 2.32.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#166312): https://lists.openembedded.org/g/openembedde=
d-core/message/166312
> Mute This Topic: https://lists.openembedded.org/mt/91451965/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

