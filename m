Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E8EC77B7A
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 15:26:07 +0000 (UTC)
Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
 by mx.groups.io with SMTP id smtpd.web11.115.1685114757854799071
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 08:25:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=iIVx1J1+;
 spf=pass (domain: gmail.com, ip: 209.85.161.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-554f951e658so450155eaf.0
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 08:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685114757; x=1687706757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3L7aGScxSA5NLFKhdolL+hc39pqJaiL77zBnXaASStA=;
        b=iIVx1J1+t8U5M0Y8Wkfz8eIhjstLxH7eJQRIRKcUqhQ1c+WmF6DkYSUrhumt34VEDP
         wtPEQtt7pZSVxH8oC9L8sbw4OJQiOiruW125OZJ/LgCWVaLAtnxQPNsYJcQgcSiNQQwg
         v5nSeQFiN0trw36Mq00aykgLMFiaNWTuVvk6gmhhCOj23HHUIIEmZlejCLw7VuAOxTtv
         ZHTEErXRlJgeC2Y2E60S6vH/O0ikZJDabke7sZqdEhqPZiIYZ/EmBEAQN5nQDZoi3fKl
         TN8VTaIlIEYD9jSsaf3rtd5BsQuD+JbiXMklXpooGH9plV3ZngBWlSllslZRa3W5qnkN
         Y/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685114757; x=1687706757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3L7aGScxSA5NLFKhdolL+hc39pqJaiL77zBnXaASStA=;
        b=VULzpbCx2tjWObomiSzVw2bRxQQ4LOeYPYgpdngQ/9+NXL3MFIz+FIVnduUCfnIMZa
         8ojPp9jfXZdt2VByMtGO022WGh05cLDYW/D5NAEh4oajAja5Tzu32FtGPCY9xietqd6J
         D8qdQW28NBtmmSl8iWiqaeI5b2DeVjA0ay+8RINzlWbxkxkQB3kv7rtmonHxeb9B1XYV
         DAQ9STO0Jf7byh/h3lJZGxdjdWMK7oBLmVp08fx4fhHZuNEIbwevJFq2n474uavamsQ4
         kmzljZ1d9xYiTZYsIu2r0FUIvBBr6iuL/PFwXyQA5zmb8bAThmiY/jlfKR0EY+QcHsqK
         vJ+A==
X-Gm-Message-State: AC+VfDyRfARQYx883OUZ9PUxVGAAr/BNgBoZQApeOp3YuNbcubt0lIQD
	GeLGNTY2+3YJPBC0SsiHrcdzcMwMxY+r2KuwFuk=
X-Google-Smtp-Source: ACHHUZ7CIiQFxzjs/2omBKcvTxnI3g/A/dM5cg9iA0kQk9CYIolSmMWZ4lNJwOoQ5lhejjo/zx99VsJ5CA1gzmRH8xM=
X-Received: by 2002:a54:450a:0:b0:398:5172:ef31 with SMTP id
 l10-20020a54450a000000b003985172ef31mr1105100oil.32.1685114756850; Fri, 26
 May 2023 08:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230525084328.77920-1-andrej.valek@siemens.com> <20230525161322adee6d2f@mail.local>
In-Reply-To: <20230525161322adee6d2f@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 May 2023 08:25:30 -0700
Message-ID: <CAMKF1sodLnNaBZ2BiuPGhTtOK3vvE47a6F6ZrGx09wgETweFUw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] busybox: 1.36.0 -> 1.36.1
To: alexandre.belloni@bootlin.com
Cc: andrej.valek@siemens.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 15:26:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181775

clang also results in same error

ERROR: QA Issue: busybox: ELF binary /usr/bin/busybox.nosuid has
relocations in .text [textrel]

see https://errors.yoctoproject.org/Errors/Details/705055/

On Thu, May 25, 2023 at 9:13=E2=80=AFAM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> On the autobuilders, this causes:
>
> WARNING: busybox-1.36.1-r0 do_package_qa: QA Issue: busybox: ELF binary /=
bin/busybox.nosuid has relocations in .text [textrel]
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/15/builds/7460/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/6057/s=
teps/11/logs/stdio
>
>
> On 25/05/2023 10:43:28+0200, Andrej Valek via lists.openembedded.org wrot=
e:
> > - regresion has been fixed, re-enable SHA*HWACCEL on x86
> >   - 8d198665a0d09c3f22f3a12234809f46b1c2b04a
> >
> > Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> > ---
> >  .../{busybox-inittab_1.36.0.bb =3D> busybox-inittab_1.36.1.bb}  | 0
> >  meta/recipes-core/busybox/busybox/sha_accel.cfg               | 2 --
> >  .../busybox/{busybox_1.36.0.bb =3D> busybox_1.36.1.bb}          | 4 +-=
--
> >  3 files changed, 1 insertion(+), 5 deletions(-)
> >  rename meta/recipes-core/busybox/{busybox-inittab_1.36.0.bb =3D> busyb=
ox-inittab_1.36.1.bb} (100%)
> >  delete mode 100644 meta/recipes-core/busybox/busybox/sha_accel.cfg
> >  rename meta/recipes-core/busybox/{busybox_1.36.0.bb =3D> busybox_1.36.=
1.bb} (91%)
> >
> > diff --git a/meta/recipes-core/busybox/busybox-inittab_1.36.0.bb b/meta=
/recipes-core/busybox/busybox-inittab_1.36.1.bb
> > similarity index 100%
> > rename from meta/recipes-core/busybox/busybox-inittab_1.36.0.bb
> > rename to meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
> > diff --git a/meta/recipes-core/busybox/busybox/sha_accel.cfg b/meta/rec=
ipes-core/busybox/busybox/sha_accel.cfg
> > deleted file mode 100644
> > index 8900305a11..0000000000
> > --- a/meta/recipes-core/busybox/busybox/sha_accel.cfg
> > +++ /dev/null
> > @@ -1,2 +0,0 @@
> > -# CONFIG_SHA256_HWACCEL is not set
> > -# CONFIG_SHA1_HWACCEL is not set
> > diff --git a/meta/recipes-core/busybox/busybox_1.36.0.bb b/meta/recipes=
-core/busybox/busybox_1.36.1.bb
> > similarity index 91%
> > rename from meta/recipes-core/busybox/busybox_1.36.0.bb
> > rename to meta/recipes-core/busybox/busybox_1.36.1.bb
> > index 8014a5c7bf..b34d60cded 100644
> > --- a/meta/recipes-core/busybox/busybox_1.36.0.bb
> > +++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
> > @@ -51,6 +51,4 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${=
PV}.tar.bz2;name=3Dtarball \
> >             file://0002-nslookup-sanitize-all-printed-strings-with-prin=
table.patch \
> >             "
> >  SRC_URI:append:libc-musl =3D " file://musl.cfg "
> > -# TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.=
html
> > -SRC_URI:append:x86 =3D " file://sha_accel.cfg"
> > -SRC_URI[tarball.sha256sum] =3D "542750c8af7cb2630e201780b4f99f3dcceeb0=
6f505b479ec68241c1e6af61a5"
> > +SRC_URI[tarball.sha256sum] =3D "b8cc24c9574d809e7279c3be349795c5d5ceb6=
fdf19ca709f80cde50e47de314"
> > --
> > 2.40.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#181720): https://lists.openembedded.org/g/openembedde=
d-core/message/181720
> Mute This Topic: https://lists.openembedded.org/mt/99126049/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

