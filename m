Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD8B2C77B7A
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 16:40:27 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.web10.39992.1686501625788031980
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 09:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=qkLap7I+;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6b16c53a85aso1992513a34.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 09:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686501625; x=1689093625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TT+8AdNfcXZ8BaX4+Nwz5hL9ZCP24LKH9LV7jwd6Eg=;
        b=qkLap7I+Rzla4VxU5VLUtzIE29PVtOLFHdbhs5d9fL/r1iW9vaf5XNLEma/aVA+XOU
         fRAACLlr3IhXwYwTldZkeokYjLFRJocvbwsyC8Q2sKN+aXUoxA39cXFaar8n42ZF+vFd
         PlNejELpgCbryS/oqvR0g7RXRD6MhwQANuwxwQAWJIrTgc108FgDNiiPh3GaEhzjGb5C
         +Ob4IW2iizrc03QqblKUNYFY0SuRlrZUpZTHRMhxdMGaQNqNid0lVgIkA/fUVhEdTSrX
         Bd5vp1JGpHpKDjgcz2adtx2ei5jzxUc+4J3krr4GLYJmsUHO7K7VIovOgi3PFEdopVLj
         7XHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686501625; x=1689093625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TT+8AdNfcXZ8BaX4+Nwz5hL9ZCP24LKH9LV7jwd6Eg=;
        b=QcghXNGrQZ/JlnM78c/KCPWrVE/ha5rnY+37YQro9D1Pdz1CRW7Q/bjGPFZiaAtrX7
         K0ClbKRe083+I/IkyZRPvUekp9DElOvnvVALj2/VjewVQgq5Pt+szhsUaGd7cDtJsXrw
         /BXTDBJ5/V2Ks7heO3iRH4eYlI7B4bbwxYTC59BXmDMiUn6CWdwTnX2nSW7fj0i65qXZ
         /ucAvVHsgRxKDEjlQ1DgMF10mFHcn0WyRtxTEvDFaa1l3olB6i8UIuCkQK4tPmGzI3qp
         Qfbz+FQWYiIrPD9MicUWJ/8p6U2Xq9J+T1KAOqjlFcaKc3Mm/n/DZKUHFxcXlEwXCH7O
         ebnw==
X-Gm-Message-State: AC+VfDxlwnrcwUDHiEtmFcObcC00PKV1iFJQqHRXpf5TlMTe6/ClUn+Q
	gYgYosweh+o2EvN0lr1uvc6YoSO1CmFm46KdLyhOPpSNTBw=
X-Google-Smtp-Source: ACHHUZ55xBX5gSTBbdGnADg2cGESiF+AaoIYriSrak+yCIaY/eoxSGlMvz3qWkoM3zqxNHY1EZWtn9wome8rF/x8sdc=
X-Received: by 2002:a05:6808:19a0:b0:394:2868:d51f with SMTP id
 bj32-20020a05680819a000b003942868d51fmr2902611oib.4.1686501624906; Sun, 11
 Jun 2023 09:40:24 -0700 (PDT)
MIME-Version: 1.0
References: <14338.1686336106059476225@lists.openembedded.org>
 <2689.1686344267035888315@lists.openembedded.org> <CAMKF1soQ6wcnD8o79GDz1TxPtQqZHKX7LyDSyNNr5RsYaO5=vQ@mail.gmail.com>
In-Reply-To: <CAMKF1soQ6wcnD8o79GDz1TxPtQqZHKX7LyDSyNNr5RsYaO5=vQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 11 Jun 2023 09:39:59 -0700
Message-ID: <CAMKF1spFJsRHEWp8PxANdNveD9eu=-4xRFJVhmxjajEPt2_bKA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3 2/2] vulkan-validation-layers: add new recipe v1.3.243.0
To: Vincent Davis Jr <vince@underview.tech>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 16:40:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182634

its failing on all qemu arches for me, so I looked a bit more into it,
Some differences are  that
my distro uses usrmerge feature and clang compiler. Secondly the error
is because a spurious target
is added to generated makefiles which then fails.

| NOTE: cmake --build
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/vulkan-validation-layer=
s/1.3.243.0-r0/build
--target all --
| ninja: error:
'/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/vulkan-validation-laye=
rs/1.3.243.0-r0/recipe-sysroot/usr/usr/lib',
needed by 'layers/libVkLayer_khronos_validation.so', missing and no
known rule to make it

seems to arise from autodetection of cmake modules, so somehow when
SPIRV-Tools target is added
then it ends up adding the bad target
LINK_LIBRARIES =3D layers/libVkLayer_utils.a
/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/vulkan-validation-layer=
s/1.3.243.0-r0/recipe-sysroot/usr/lib/libSPIRV-Tools.so
 /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/vulkan-validation-laye=
rs/1.3.243.0-r0/recipe-sysroot/usr/usr/lib

I narrowed it further down to

diff --git a/layers/CMakeLists.txt b/layers/CMakeLists.txt
index 1a67fac2e..ffd031c62 100644
--- a/layers/CMakeLists.txt
+++ b/layers/CMakeLists.txt
@@ -96,7 +96,7 @@ find_package(SPIRV-Headers REQUIRED CONFIG QUIET)
 target_link_libraries(VVL-SPIRV-LIBS INTERFACE SPIRV-Headers::SPIRV-Header=
s)

 find_package(SPIRV-Tools-opt REQUIRED CONFIG QUIET)
-target_link_libraries(VVL-SPIRV-LIBS INTERFACE SPIRV-Tools-opt)
+#target_link_libraries(VVL-SPIRV-LIBS INTERFACE SPIRV-Tools-opt)

 find_package(SPIRV-Tools REQUIRED CONFIG QUIET)

@@ -104,7 +104,7 @@ find_package(SPIRV-Tools REQUIRED CONFIG QUIET)
 # The targets available from SPIRV-Tools change depending on how
SPIRV_TOOLS_BUILD_STATIC is set.
 # Try to handle all possible combinations so that we work with
externally built packages.
 if (TARGET SPIRV-Tools)
-    target_link_libraries(VVL-SPIRV-LIBS INTERFACE SPIRV-Tools)
+#    target_link_libraries(VVL-SPIRV-LIBS INTERFACE SPIRV-Tools)
 elseif(TARGET SPIRV-Tools-static)
     target_link_libraries(VVL-SPIRV-LIBS INTERFACE SPIRV-Tools-static)
 elseif(TARGET SPIRV-Tools-shared)

so it seems SPIRV-tools package might have this issue or something more to =
it.

you can reproduce this easily with yoe distro for any qemu target project.



On Sat, Jun 10, 2023 at 11:55=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> seen more failures on qemux86 and qemumips
>
> https://errors.yoctoproject.org/Errors/Details/708137/
>
> On Fri, Jun 9, 2023 at 1:57=E2=80=AFPM Vincent Davis Jr <vince@underview.=
tech> wrote:
> >
> > Created patch series should be fine to build now
> >
> > 1. https://lists.yoctoproject.org/g/meta-freescale/message/24918
> > 2. https://lists.yoctoproject.org/g/meta-freescale/message/24919
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#182598): https://lists.openembedded.org/g/openembed=
ded-core/message/182598
> > Mute This Topic: https://lists.openembedded.org/mt/99365321/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

