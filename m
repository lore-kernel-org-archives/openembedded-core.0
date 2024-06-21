Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33060C27C4F
	for <webhook@archiver.kernel.org>; Fri, 21 Jun 2024 17:22:12 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web11.79217.1718990531495011260
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Jun 2024 10:22:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F5qOsWjT;
 spf=pass (domain: gmail.com, ip: 209.85.167.49, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52cc671f170so2916340e87.1
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 10:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718990529; x=1719595329; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3A8/0KgHSfXYXmBXvGB9PPlbiOip9ZyCpCL+75d/sNs=;
        b=F5qOsWjTlsuubq6OxIGK3U5T4ixa2c+HC24sHj2Y7AK3D1rUaHEqiyR7jaJ6iZlReE
         0LJJzmOwy/6aYXiTBNuUq1ME+IW+gNkhV1MlKXODvQ05Ug57Lm4nGdAFDZbR4xdKjsVm
         Qr3zigjTejLzlsF/LDeZyaJcz52i4duh6wwSicV9A2QavkUpEk07DMIXrwoEriPCvbFO
         BzWOadIlZsOb+TVrjvX44eYYBWXIPZol808Xh0bPcFoRKTHIjGBWCGjn3YDKRYt0Hlfc
         HjO56Xtlip5W3VwVVbfTkPlMHeJYQoS/QVPYRUi3/atAXaly1Wnz3aE80K+MtqLmOKMQ
         rBxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718990529; x=1719595329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3A8/0KgHSfXYXmBXvGB9PPlbiOip9ZyCpCL+75d/sNs=;
        b=oLOdHa6W5TaqHG7i6rbKoTNX27oimOcoysJknBXThaailiJO8FLmtCjBuj6do4W+Tz
         9etbs5/oYtb6X/vZFkbGxCjxNsazbEE4oB6Vh2tP5ks8iwp4i0xj9qKtqsLD2qiXZjem
         2w6w527QFBaME3odtEsWwzkrcu/pRlfiTa5gmVlr30wvTb7dDDpT3amf1Z9/ggheu5qj
         0Tfm/X2WOBi5LAfVDC0lA9J9u52x1q5hFhVQs8I/00tBfU6tR4Yy513/8epgRqXKOk2V
         Hd2XYKsFyKH70CjiezCVEEDFjGLjQdJwDaKsQjW5cmCYp/rJEG34EDT470j4WvTHy28f
         fcKw==
X-Gm-Message-State: AOJu0Yw5YecSwrb66+7P9p1Pzrfw0VBXrK6gQVz+2EKsqdtOX6XAP/HI
	o5utr7KD27wkkfGFfUg/8bumzyfJt0/5sEnkUwj6yulOTCAMXyIqY8I0tb11vQVMeiOAlVZOtj3
	srGCJSmf9+IRRfTJLq07d0I8zslhdU7EE
X-Google-Smtp-Source: AGHT+IGq3Hm2mTuOI1qa9QskI0C1uelJ26ROo1bkbJOOvFzt/scROf/7xnthYtLMWAhkpEC3EyvteYE1bvOdBJj9NMM=
X-Received: by 2002:ac2:48a4:0:b0:52c:c4b3:7e95 with SMTP id
 2adb3069b0e04-52cdcdfa117mr119349e87.18.1718990528670; Fri, 21 Jun 2024
 10:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240610214456.2757397-1-JPEWhacker@gmail.com>
 <20240619221805.3038528-1-JPEWhacker@gmail.com> <2024062106243817fca166@mail.local>
In-Reply-To: <2024062106243817fca166@mail.local>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 21 Jun 2024 11:21:55 -0600
Message-ID: <CAJdd5GZJm2Kv8YtVt3mSjtAZ3117JfeJetmm8ZEsVJT7kWknVw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2 0/7] Add SPDX 3.0 support
To: OE-core <openembedded-core@lists.openembedded.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Jun 2024 17:22:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201032

This jogged my memory on why I added the patch to allow tasks to opt
out of running `extend_recipe_sysroot`. I'm sending this to get it
written down before I forget, we can talk about it in the tech meeting
on Tuesday if necessary. There are two build failure modes that having
do_create_spdx run extend_recipe_sysroot causes.

The first failure mode is when a recipe explicitly does
`do_populate_sysroot[noexec] =3D "1"` (an example here is
glib-y2038-tests). In this case, when do_create_spdx tries to run
extend_recipe_sysroot, it sees that the task depends on
do_populate_sysroot, and this looks for the
glibc-y2038-tests:populate_sysroot manifest file, which doesn't exist
because the task was not run which results in a failure. Example here:
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6733/step=
s/12/logs/stdio

The second failure mode is (I think) a bug in
binutils-cross-testsuite. This recipe is odd because it doesn't
actually inherit cross.bbclass, and thus isn't _actually_ a cross
recipe, despite the name. This confuses find_sstate_manifest(), which
assumes that if the recipe has "-cross-" in the name, the package arch
must be ${BUILD_ARCH}, which is not the case here because it doesn't
inherit cross.bbclass. When do_create_spdx tries to run
extend_recipe_sysroot, it is looking for the
binutils-cross-testsuite:populate_sysroot manifest file using the
wrong architecture, and thus errors out. I _think_ this might be fixed
by renaming the recipe so that it no longer contains the string
"-cross-". Example here:
https://errors.yoctoproject.org/Errors/Details/787278/

do_create_spdx doesn't actually need the sysroot extended; it only
actually depends on do_populate_sysroot do that it can inspect the
sysroot produced by the current recipe to add the files to the SPDX
output. IIUC, the automatic call to extend_recipe_sysroot when a task
depends on do_populate_ssyroot is mostly a heuristic designed to
ensure that tasks get the full recipe sysroot correctly without having
to manually invoke the call everywhere. However, in the case of
do_create_spdx() it is actually not necessary, thus I added the flag
to disable that behavior on a per-task basis, since I thought that
might be better than hard coding an exception for do_create_spdx.

The other solution would be to identify each individual recipe that is
doing something weird and disable SPDX generation in that specific
recipe (I've made a new class called nospdx.bbclass that makes this
easy). I'm not sure how many recipes this would be, probably only a
few, but it might be confusing to other layers why failures occur and
what to do about it.... and again since the heuristic for when to call
extend_recipe_sysroot is incorrect for do_create_spdx, I'd prefer to
explore that route.

On Fri, Jun 21, 2024 at 12:24=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> Unfortunately, this still causes failures:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/7060/st=
eps/23/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/23/builds/9481/st=
eps/14/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/20/builds/9574/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/89/builds/9149/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/6555/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4969/s=
teps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/9220/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/166/builds/518/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/165/builds/514/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/9186/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/9166/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/8044/s=
teps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/103/builds/8038/s=
teps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/100/builds/6112/s=
teps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/9159/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/40/builds/9145/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6733/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8994/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6122/s=
teps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/108/builds/6122/s=
teps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/58/builds/8923/st=
eps/15/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/6837/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/6881/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/6906/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6892/st=
eps/14/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/127/builds/3501/s=
teps/15/logs/stdio
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/76/builds/9099/st=
eps/23/logs/stdio
>
>
> On 19/06/2024 16:13:22-0600, Joshua Watt wrote:
> > This patch series add support for SPDX 3.0 and sets it as the default.
> > Currently it is not possible to have SPDX 2.2 and SPDX 3.0 enabled at
> > the same time; users may choose to specifically use SPDX 3.0 instead of
> > 2.2 by doing INHERIT +=3D "create-spdx-3.0"
> >
> > v2: Added tests and addressed feedback
> >
> >
> > Joshua Watt (7):
> >   classes-recipe/image: Add image file manifest
> >   classes/create-spdx-3.0: Add class
> >   classes-recipe/image_types: Add SPDX_IMAGE_PURPOSE to images
> >   selftest: spdx: Add SPDX 3.0 test cases
> >   classes-recipe: nospdx: Add class
> >   classes/spdx-common: Move SPDX_SUPPLIER
> >   Switch default spdx version to 3.0
> >
> >  meta/classes-recipe/image.bbclass            |   58 +
> >  meta/classes-recipe/image_types.bbclass      |    2 +
> >  meta/classes-recipe/image_types_wic.bbclass  |    1 +
> >  meta/classes-recipe/nospdx.bbclass           |   13 +
> >  meta/classes-recipe/packagegroup.bbclass     |    2 +
> >  meta/classes/create-spdx-2.2.bbclass         |    8 +
> >  meta/classes/create-spdx-3.0.bbclass         | 1116 ++++
> >  meta/classes/create-spdx-image-3.0.bbclass   |  203 +
> >  meta/classes/create-spdx.bbclass             |    2 +-
> >  meta/classes/spdx-common.bbclass             |   32 +-
> >  meta/lib/oe/sbom30.py                        | 1118 ++++
> >  meta/lib/oe/spdx30.py                        | 5996 ++++++++++++++++++
> >  meta/lib/oeqa/selftest/cases/spdx.py         |  119 +-
> >  meta/recipes-core/meta/build-sysroots.bb     |    5 +-
> >  meta/recipes-core/meta/meta-world-pkgdata.bb |    3 +-
> >  15 files changed, 8654 insertions(+), 24 deletions(-)
> >  create mode 100644 meta/classes-recipe/nospdx.bbclass
> >  create mode 100644 meta/classes/create-spdx-3.0.bbclass
> >  create mode 100644 m: failures:eta/classes/create-spdx-image-3.0.bbcla=
ss
> >  create mode 100644 meta/lib/oe/sbom30.py
> >  create mode 100644 meta/lib/oe/spdx30.py
> >
> > --
> > 2.43.2
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#200929): https://lists.openembedded.org/g/openembed=
ded-core/message/200929
> > Mute This Topic: https://lists.openembedded.org/mt/106770352/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

