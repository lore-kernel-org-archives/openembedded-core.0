Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43ABBC433FE
	for <webhook@archiver.kernel.org>; Tue, 18 Oct 2022 22:25:18 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web12.1321.1666131908248667210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Oct 2022 15:25:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bUOFfNji;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id a16-20020a056830101000b006619dba7fd4so8453809otp.12
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 15:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QCMNE4IbDMs42OFEh1WjSnwMpcN3jGPgoTpqwlIrQzo=;
        b=bUOFfNjiqr6tDajVgzpTpebCryPyX+5Ih0KjIUzZ2+T3JLtqL/711sUeR5OFytfyQp
         jeCdkvsKyZcZYBukGVNNwWuM9LMkTMGvovqR80fh1qmxEgu21MgDIfWka+RZTWN9Ffk9
         9A9aKkD4ZjZHtV6YwNd8cW7kik4zOURTnPyTZMfvod25exZhGrqUiah2TNDKX1pfWFmC
         HJRp/Lim0Tr3g/g+fAS2HJ9uxY7Y/eiUwkVJIyqkUn6ELBknZH6737bYMhkozdHZe9Hq
         C4GlH0ZeDpW3Np3tsbQiidEMJypSHXuXS9fiZeBsD4KV2CS4p8ZK16MMygUofTBk2Y57
         qsUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QCMNE4IbDMs42OFEh1WjSnwMpcN3jGPgoTpqwlIrQzo=;
        b=iC2ynsNZL2P244izHbbcVBiamgkBdUY5n45S0iuarIsNLBaKk4I5rtKKsDlQsr+juK
         VCW1kMfSkEf6scr/RO86ehThs6mLJav72FcuvZt8KXUzGaIDYLXU41vXrJhVtRx5zMJB
         T1iRxAhrb/+TSIvtYBKaJ+ufdMfJWaGenKHKhlckifLrNVsigCV8pB0pBF9fDL5Esker
         oAa6OTu+ct7PMPqp9xQprk43VFa1r259uNuPr2xlb0MFilKB2x0uC+T4zGsnPxrBanJO
         W52O9y85zZ0FqXqCUy8QIEp5CNyuSGzkCmssO+16LJLO+lwHWn6Z1khDvnfNidAWrM6u
         kCMA==
X-Gm-Message-State: ACrzQf243R2NWZZ080gxYohRpAke3rAFBYJgUseX86MdiyR5mkHaySmC
	NlBnpGFaL0LIb+1HycxwENNkkMxI6n3Qs28VkQ3Lh4hs
X-Google-Smtp-Source: AMsMyM6AzjoOHRxeDHnutWnKY4cK9sISNchUwkwbsdMeyuAyNq/+9JY/fkot28XIRKLjYJ5XSq9hgn06u5eOEBU8pGQ=
X-Received: by 2002:a9d:61d6:0:b0:661:c1ad:848f with SMTP id
 h22-20020a9d61d6000000b00661c1ad848fmr2403932otk.111.1666131907260; Tue, 18
 Oct 2022 15:25:07 -0700 (PDT)
MIME-Version: 1.0
References: <171996618BFD121B.23184@lists.openembedded.org> <756d646f-6b68-804d-edcd-7933d2a66356@windriver.com>
In-Reply-To: <756d646f-6b68-804d-edcd-7933d2a66356@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Oct 2022 15:24:41 -0700
Message-ID: <CAMKF1sq3SSSFv0Law8n09V7dQ6TxSRgE-vESXU1RyyE1=zj+Sw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v3] mesa: only apply patch to fix ALWAYS_INLINE
 for native
To: kai <kai.kang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Oct 2022 22:25:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171946

On Wed, Oct 12, 2022 at 12:10 AM kai <kai.kang@windriver.com> wrote:
>
> On 9/30/22 16:34, kai wrote:
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > 0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch is not
> > needed by target mesa any more. But it still fails to compile
> > mesa-native without this patch when DEBUG_BUILD is enabled on Ubuntu
> > 18.04 with gcc 7.5.0:
> >
> > | ../mesa-22.1.6/src/compiler/nir/nir_inline_helpers.h: In function =E2=
=80=98nir_opt_move_block=E2=80=99:
> > | ../mesa-22.1.6/src/compiler/nir/nir_opt_move.c:55:1: error: inlining =
failed in call to
> >      always_inline =E2=80=98src_is_ssa=E2=80=99: indirect function call=
 with a yet undetermined callee
> > |  src_is_ssa(nir_src *src, void *state)
> > |  ^~~~~~~~~~
> >
> > So only apply it for mesa-native.
> >
> > Signed-off-by: Kai Kang <kai.kang@windriver.com>
> > ---
> > v3:
> > * rebase
>
> Ping.

This patch will break mesa recipes from other layers which override
mesa from core. They
won't be able to find this patch since now it will be inserted
previously where overriding SRC_URI
was enough, not anymore

>
> Kai
>
> >
> >   meta/recipes-graphics/mesa/mesa.inc | 4 +++-
> >   1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphic=
s/mesa/mesa.inc
> > index 8a74e0a80a..c94e439363 100644
> > --- a/meta/recipes-graphics/mesa/mesa.inc
> > +++ b/meta/recipes-graphics/mesa/mesa.inc
> > @@ -19,9 +19,11 @@ SRC_URI =3D "https://mesa.freedesktop.org/archive/me=
sa-${PV}.tar.xz \
> >              file://0001-meson-misdetects-64bit-atomics-on-mips-clang.p=
atch \
> >              file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist=
.patch \
> >              file://0001-util-format-Check-for-NEON-before-using-it.pat=
ch \
> > -           file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-err=
or.patch \
> >              "
> >
> > +# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUIL=
D enabled
> > +SRC_URI:append:class-native =3D " file://0001-nir-nir_opt_move-fix-ALW=
AYS_INLINE-compiler-error.patch"
> > +
> >   SRC_URI[sha256sum] =3D "b1f9c8fd08f2cae3adf83355bef4d2398e8025f449473=
32880f2d0066bdafa8c"
> >
> >   UPSTREAM_CHECK_GITTAGREGEX =3D "mesa-(?P<pver>\d+(\.\d+)+)"
> >
> >
> >
>
> --
> Kai Kang
> Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171646): https://lists.openembedded.org/g/openembedde=
d-core/message/171646
> Mute This Topic: https://lists.openembedded.org/mt/94012441/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

