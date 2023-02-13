Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58475C636D7
	for <webhook@archiver.kernel.org>; Mon, 13 Feb 2023 10:44:17 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.11555.1676285048717942072
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Feb 2023 02:44:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p4qtpqF/;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id o20so18281926lfk.5
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 02:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uC4mRBAgGiRjLSDIrGrDpihiu858u5igJOb0O+22x+Y=;
        b=p4qtpqF/aA/KSdKNWXAXK7WwCCB0pbpbLT+aDG7+PaFc1V7iEvOQ8y2Nqh1OOllhOH
         zuB1MW7qmIy+zAY/BbpocD6XJAcT+Xni+WnzefYPhEaBP6pBE2K6Fbo53NiK375zkbh5
         oKIfgE2qqLrv0YocNR4pWywL0kyH16/5iYHNHo0DAG45Vaym0AEid9X04Mq7VqwK5jKN
         P+sVCIuKI0Dfv7gczcAGZM3bw9QS68w6rGFkqpTyhqwZrOofC2PjiA3zgUD6DsqjXxfn
         5uiGjylR50Rs6BakpU39Yt1X6n5+tt6F5X2WqG/Dk1UTT0ccBHVE0epp/0n7VJ8UFzcG
         r8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uC4mRBAgGiRjLSDIrGrDpihiu858u5igJOb0O+22x+Y=;
        b=jBLBUF934WZ1xI42vdZ6F+W25tLS02yhjS0dpXBBvyn2CysKCd34skDC7X60vDMVYx
         Y/zX5dqubjAM9X1mNXBE4Xpu8+039gbTd7hX5EF/zO6FTv2t5Am0WWAYuNOzfuaXIue2
         qZlfZGUlm9DZnXLZLZucyAetgP2h2etAgvljCENHolZ6R9M+MnOgFpwzTIGBmxhfFYDt
         10mYWex6ijSKEI1PizHVXOO9zFnkfHrotvZciTQeIOuoPk59rPnufkmrIeAV/8a0oKF7
         D6jyomP/9pNI25NMeedg8SA+JxyaxiSAwIwrd2gsmVfNNa2+rX7ov5Vl0+ZAXAZtmfgX
         Z0bQ==
X-Gm-Message-State: AO0yUKUMRYzPyRrCqK2MqTR0nl7bRSkGkiAAyLHbBdRZ/H73BXfTIptl
	e/QcVF/gVSn1Kwr/imaiqisyOhj3KEEgSEYnLsw=
X-Google-Smtp-Source: AK7set8otVKAYXdO780+h9qVUl2H+S/TBhrWe5jIWJr2YY3qupwUa+IMrxbXTUxDOUTj9k8B73Qo5tTbvx0chOX60R0=
X-Received: by 2002:a05:6512:40d:b0:4d8:5137:a89d with SMTP id
 u13-20020a056512040d00b004d85137a89dmr4054410lfk.176.1676285046919; Mon, 13
 Feb 2023 02:44:06 -0800 (PST)
MIME-Version: 1.0
References: <20230213103939.1066831-1-f_l_k@t-online.de> <TNL0QR.8TQGS2RNIWUZ@t-online.de>
In-Reply-To: <TNL0QR.8TQGS2RNIWUZ@t-online.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 13 Feb 2023 11:43:55 +0100
Message-ID: <CANNYZj-HgBA=Tn+Og9FQdrH6sDF9W9epw8NntJqdy9BZFgjKfg@mail.gmail.com>
Subject: Re: [oe-core][PATCHv2] graphene: add a PACKAGECONFIG for arm_neon
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Feb 2023 10:44:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177094

I think it's commented out?

Alex

On Mon, 13 Feb 2023 at 11:40, Markus Volk <f_l_k@t-online.de> wrote:
>
> v2 enables neon for aarch64 by default
>
> Am Mo, 13. Feb 2023 um 11:39:39 +0100 schrieb Markus Volk <f_l_k@t-online=
.de>:
>
> Not all arm platforms support neon and runtime detection for this feature=
 is currently not reliable. Add a PACKAGECONFIG that disables neon support =
for arm but can be manually enabled. Enable neon for aarch64 by default Sig=
ned-off-by: Markus Volk <f_l_k@t-online.de> --- meta/recipes-graphics/graph=
ene/graphene_1.10.8.bb | 2 ++ 1 file changed, 2 insertions(+) diff --git a/=
meta/recipes-graphics/graphene/graphene_1.10.8.bb b/meta/recipes-graphics/g=
raphene/graphene_1.10.8.bb index 813ff74adf..f32112118f 100644 --- a/meta/r=
ecipes-graphics/graphene/graphene_1.10.8.bb +++ b/meta/recipes-graphics/gra=
phene/graphene_1.10.8.bb @@ -11,7 +11,9 @@ SRC_URI[archive.sha256sum] =3D "=
a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c25ec859da3 # gtk4 & mutter 41.0 req=
uires graphene build with introspection PACKAGECONFIG ?=3D "introspection" =
+#PACKAGECONFIG:aarch64 +=3D "neon" PACKAGECONFIG[introspection] =3D "-Dint=
rospection=3Denabled,-Dintrospection=3Ddisabled," +PACKAGECONFIG[neon] =3D =
"-Darm_neon=3Dtrue,-Darm_neon=3Dfalse," GTKDOC_MESON_OPTION =3D "gtk_doc"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177092): https://lists.openembedded.org/g/openembedde=
d-core/message/177092
> Mute This Topic: https://lists.openembedded.org/mt/96933123/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

