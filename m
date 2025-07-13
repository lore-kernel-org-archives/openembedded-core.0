Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D8FC83F1D
	for <webhook@archiver.kernel.org>; Sun, 13 Jul 2025 05:45:31 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web10.51902.1752385528054241632
 for <openembedded-core@lists.openembedded.org>;
 Sat, 12 Jul 2025 22:45:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b0LwgeJH;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8600c87293so2588433276.1
        for <openembedded-core@lists.openembedded.org>; Sat, 12 Jul 2025 22:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752385527; x=1752990327; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uM+zZYlNddeEubcCVOs0nPyEOIcZqMXJX1cDbhe1TyM=;
        b=b0LwgeJH3bLT5XyP2BoX83MdGfBvqpFC+tsV2H5t3sdHwtYmzosPqR7e2VWlgdVdKl
         yZjoduSGoXmhpxfx2JFXafZur5gnsko25UpJSByXXX/boMXlWYu8Kva0O5TIdnv73Xra
         zFLDeZ9zsZwpasoq/X8x7qmo49OxbTi7m138q5bfl1OPL4STfr1plqiOK4FcvWsI+8++
         1Wbj5gXQY+qKkmoF2OKIW0rmUbxG2GtOTidWPVy+DDNZTAjwcrlLuZiiUBOMThvAZYWj
         Ke3iDjbrD/gsXknwADU76Der9tt/Lm/5OuaoIkgdwJKv6dJhDTisUNzZnXijHrLWWdbO
         d+KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752385527; x=1752990327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uM+zZYlNddeEubcCVOs0nPyEOIcZqMXJX1cDbhe1TyM=;
        b=DFzFLS2YlWZVTsqJu67dRYUjKhUygnEwD+lNfyR5s0oHOwfFHTojRnhDUS7GR/03El
         XW6r+Pr880uMNisV8407EFDgy706dHSJP7Wu53JrNMVOMEHIAejOWGLpBl9dOGqXpj44
         t29iZymq94PRPTxPxRtlaG1Wewb9x3QJHjRWdwTbbRMIBKifIcCDy5sQj50vfV3e56DW
         9fPj7tHAe/nga6F0kPcYu4s8SoMaXSbMpEVt/0qwMqaymE339VJo/aobRtC0lgddaspe
         Ie8Ij4dPvZqM3rKJuJF2pe/P6aCkXfu6rKc1hWwoa8KcMTl1OuRvwk2VDZ37GzjOcX0e
         FvPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUDcxgxygsClJ8U0HbSU9sI/1zrcPQGCliIPvSJ+QRne2s5GHHClHDt6C9dJ5mYAb2Pol8DJAcEmXDUVNFMYIKLw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzLDjT/FJVDsdUNpAmGaXhxN8l/uNI9iUIaAx8/T/sh5vEDoD+k
	dJJ8+ndTEIGMp5ZqKKXsKD9rNpNgMm3tcCOzBYkCET6DZT4IUXs1xjrW7YecNgRew17TZ3UjFFe
	BjheSN/V+NVnumpDlThEv6B6mVw/wfwc=
X-Gm-Gg: ASbGncv6rwyef6gERe0qaQiPLVVLehol/1AAlBj8uft+X7Xy/quVLhSpecXZkBw4wjM
	P5sAN+SdZLHczH0Usd+jcODI/iymIyasogMKtqYLCfawYmoE1mOgVcfX9mucIb0Ma7XuGxEn6xr
	Ga3TSbvj4ZNGt4Ylcd/mGfNf9z9ttBa21dYGq+p5mrhmbqqpvm/Wv7CP2hJNsN8XHp9MC3h4ics
	6zQUolaQBG251Qe
X-Google-Smtp-Source: AGHT+IH/anJnwiUOoyrtWFP8CaLOhKAIy4ecaBN9qWhyW0UZTTcDpluGND5RTnrdXQ8+Q/jmLLvwTPdStnvMntsiIXs=
X-Received: by 2002:a05:690c:311:b0:710:e4c4:a92f with SMTP id
 00721157ae682-717d5b7c675mr130977827b3.5.1752385527087; Sat, 12 Jul 2025
 22:45:27 -0700 (PDT)
MIME-Version: 1.0
References: <DB3PR09MB62022D923A65D95B35ADAF69EA4EA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <8340.1751980391085408362@lists.openembedded.org> <DB3PR09MB6202D15953E63F9683D3A14EEA48A@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <CAMKF1spsAzE8MKQeemmi2Gs5PTSB4-KfdkRNo8P7KAUhbF1Znw@mail.gmail.com>
 <CAGpma=4Kr8D_R7Sn3mQNc5Eg-06DwK2fAmuunXZyESemFx1+VQ@mail.gmail.com>
 <CAMKF1sqm+88C1s0M7p4YQAFzFfY_6SZPjh+CvpvD87JkHb4bGg@mail.gmail.com>
 <DB3PR09MB620227B14CC05C925B253B93EA4BA@DB3PR09MB6202.eurprd09.prod.outlook.com>
 <CAMKF1soMZMsFrKyW5TYNY1Eu+0XUHmRDyPQyTWjGEncpUxXs+g@mail.gmail.com>
In-Reply-To: <CAMKF1soMZMsFrKyW5TYNY1Eu+0XUHmRDyPQyTWjGEncpUxXs+g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 12 Jul 2025 22:45:00 -0700
X-Gm-Features: Ac12FXzxW1VYbnRlhnlrcEX4mr_9ZqbXrCZrG1Af9PHqUyWDx0JTBNM8CE1Xbxo
Message-ID: <CAMKF1soTRpUT5L=ocSpfwz91L+dhhTeH5WvzFeDUm1UGcaB4Bw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v5 0/7] cmake: Major version bump to 4.0.3
To: "Haase Moritz, JD-62" <Moritz.Haase@bmw.de>
Cc: Alper Ak <alperyasinak1@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	Alexander Kanavin <alex.kanavin@gmail.com>, "f_l_k@t-online.de" <f_l_k@t-online.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 13 Jul 2025 05:45:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220200

We are left with 16 recipes to fix, here are latest qemuarm world build res=
ults

https://errors.yoctoproject.org/Errors/Build/211210/


On Sat, Jul 12, 2025 at 9:22=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:
>
> Somehow errors.yp.org is not responsing so my latest build errors are
> not being reported, we are left with 28 failures
>
> Summary: 26 tasks failed:
>   meta-openembedded/meta-oe/recipes-dbs/leveldb/leveldb_1.23.bb:do_config=
ure
>   meta-openembedded/meta-oe/recipes-connectivity/obex/openobex_1.7.2.bb:d=
o_configure
>   meta-openembedded/meta-oe/recipes-navigation/proj/proj_9.3.1.bb:do_conf=
igure
>   meta-openembedded/meta-oe/recipes-graphics/libvncserver/libvncserver_0.=
9.14.bb:do_configure
>   meta-openembedded/meta-oe/recipes-extended/wxwidgets/wxwidgets_3.2.6.bb=
:do_configure
>   meta-openembedded/meta-oe/recipes-devtools/libubox/libubox_git.bb:do_co=
nfigure
>   meta-openembedded/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb:do_=
configure
>   meta-openembedded/meta-oe/recipes-dbs/soci/soci_4.0.3.bb:do_configure
>   meta-openembedded/meta-multimedia/recipes-dvb/oscam/oscam_1.20.bb:do_co=
nfigure
>   meta-openembedded/meta-xfce/recipes-panel-plugins/whiskermenu/xfce4-whi=
skermenu-plugin_2.7.1.bb:do_configure
>   meta-openembedded/meta-multimedia/recipes-multimedia/musicbrainz/libmus=
icbrainz_git.bb:do_compile
>   virtual:native:meta-openembedded/meta-oe/recipes-connectivity/obex/open=
obex_1.7.2.bb:do_configure
>   meta-openembedded/meta-xfce/recipes-apps/catfish/catfish_4.18.0.bb:do_c=
onfigure
>   virtual:native:meta-openembedded/meta-oe/recipes-navigation/proj/proj_9=
.3.1.bb:do_configure
>   meta-openembedded/meta-networking/recipes-connectivity/civetweb/civetwe=
b_1.16.bb:do_configure
>   meta-openembedded/meta-oe/recipes-connectivity/zeromq/czmq_4.2.1.bb:do_=
configure
>   virtual:native:meta-openembedded/meta-oe/recipes-extended/wxwidgets/wxw=
idgets_3.2.6.bb:do_configure
>   meta-openembedded/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.99.1=
.bb:do_configure
>   meta-openembedded/meta-oe/recipes-extended/openwsman/openwsman_2.7.2.bb=
:do_configure
>   meta-openembedded/meta-networking/recipes-connectivity/openthread/ot-br=
-posix_git.bb:do_configure
>   meta-openembedded/meta-networking/recipes-connectivity/openthread/ot-da=
emon_git.bb:do_configure
>   meta-openembedded/meta-oe/recipes-graphics/vk-gl-cts/opengl-es-cts_3.2.=
12.0.bb:do_configure
>   meta-openembedded/meta-networking/recipes-connectivity/nanomsg/nngpp_gi=
t.bb:do_configure
>   meta-openembedded/meta-oe/recipes-connectivity/gattlib/gattlib_git.bb:d=
o_configure
>   meta-openembedded/meta-oe/recipes-connectivity/transmission/transmissio=
n_4.0.6.bb:do_compile
>   meta-openembedded/meta-oe/recipes-support/opencv/opencv_4.11.0.bb:do_co=
mpile
>
> On Fri, Jul 11, 2025 at 3:25=E2=80=AFAM Haase Moritz, JD-62 <Moritz.Haase=
@bmw.de> wrote:
> >
> > Hi,
> >
> > awesome, we are closing the gap :) I just sent another 10 patches to th=
e mailing
> > list via [0]. Hope to get some more done today, will keep the shared sp=
readsheet
> > (very good idea BTW) updated.
> >
> > [0]: https://lists.openembedded.org/g/openembedded-devel/topic/meta_oe_=
patch_00_10/114097827
> >
> > Moritz

