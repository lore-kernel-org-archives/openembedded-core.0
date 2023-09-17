Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBBBCD37B4
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 11:13:49 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.27895.1694949224193241122
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Sep 2023 04:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=jlDKkvLE;
 spf=pass (domain: mvista.com, ip: 209.85.208.175, mailfrom: vanusuri@mvista.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2bfea381255so18690981fa.3
        for <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 04:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1694949222; x=1695554022; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0V1FXirHDeVtfMoRyWsR//cCzKSVlTtFvkLGJ5dHqVM=;
        b=jlDKkvLEjBj/YLF3D1ltkht9mH5kr8gF5ML1HyYhUCvuXFRT3VQ7FPCkPbRabfdlVo
         s0jI4FMHCy0/Jia1ByqA1jG6tkeed5RaDMfK0nM/W9MsjXJphyJ1EGaFUucW6PBAyXEd
         avw2Hz2IUQWA+BtteoIsKmRXiM0qZlkURckFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694949222; x=1695554022;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0V1FXirHDeVtfMoRyWsR//cCzKSVlTtFvkLGJ5dHqVM=;
        b=fDXgzz1iEaSTxDISv5wvvMTf4iU3r9nNccCEqKdHn37nP7B9hnsZGkyh8GtA0qRMFC
         9tKn9ZTRIOe/qqNG+Y+FVEdGYyA1utK4Y7Lf37Vn03KKOkj2NEoPWW5Jz9l+UggkVCyV
         6zcEMj1Idx/rX762J01ItDHI8fbQYZHngnFl+py/JRxSAfjd61Q0y4T2J5FFXZxzi9b2
         33qn0ShraKheKVFgweUyrSojdfwtt8Tpj2uXR4fPDGIGQBJJ2iUNi+KbUc9GQ5EpcDK0
         cxe3SB6YGBawAq3jG+nbExVwDg2XWOuajtpA7AcOFeagZ2pBcZaDc7hJ8vDhIKoUE7VF
         XYcA==
X-Gm-Message-State: AOJu0YzV7MJv7w8b3DZXzblupDvtUk+dJpirxTHxsFv967SPDNxRXfCx
	wEkQD/0CbpufRQcowXW8TALVA2SOfsRozrbsJMGuV1Hc9ndwhXWJ
X-Google-Smtp-Source: AGHT+IHjcSqjDFOB+6Hr4Or38igY7xVGItG9Gm7O5p20+bxAX5th9d+MdziRCI0uTSdSNkEg8veHSrUU/AwUzmj4kfw=
X-Received: by 2002:a2e:350e:0:b0:2b9:e623:c2d8 with SMTP id
 z14-20020a2e350e000000b002b9e623c2d8mr4872529ljz.44.1694949221998; Sun, 17
 Sep 2023 04:13:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230913080229.196711-1-yogita.urade@windriver.com>
 <20230913080229.196711-2-yogita.urade@windriver.com> <17847C8738CE261C.14053@lists.openembedded.org>
 <CAOSpxdabLMW-o5Og79e+LyB+7utmxwwNiypzY=imA3fuQZpXrg@mail.gmail.com>
In-Reply-To: <CAOSpxdabLMW-o5Og79e+LyB+7utmxwwNiypzY=imA3fuQZpXrg@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Sun, 17 Sep 2023 16:43:30 +0530
Message-ID: <CANQUz1-gJjjLzi4ndpMO-D9YiugihGwTDwVpEo9jZYAsZEzo=Q@mail.gmail.com>
Subject: Re: [OE-core][mickledore][PATCH 2/2] qemu: fix CVE-2023-0330
To: Steve Sakoman <steve@sakoman.com>
Cc: Yogita.Urade@windriver.com, openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: multipart/alternative; boundary="0000000000004a458206058c1e12"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Sep 2023 11:13:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187803

--0000000000004a458206058c1e12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Steve,

Same patch I've submitted for dunfell. Please revert it, if it is failing.

Thanks & Regards,
Vijay

On Fri, Sep 15, 2023 at 8:56=E2=80=AFPM Steve Sakoman <steve@sakoman.com> w=
rote:

> On Wed, Sep 13, 2023 at 4:44=E2=80=AFAM Steve Sakoman via
> lists.openembedded.org <steve=3Dsakoman.com@lists.openembedded.org>
> wrote:
> >
> > Unfortunately this change breaks the qemux86 and qemux86-64 tests on
> > the autobuilder:
>
> The versions of this patch for both mickledore and kirkstone break
> qemux86 and qemux86-64 in the same way, so I can't take the patch for
> either branch.
>
> Steve
>
> >
> > https://errors.yoctoproject.org/Errors/Details/736394/
> > https://errors.yoctoproject.org/Errors/Details/736395/
> >
> > In both cases:
> >
> > Failed: qemux86-64 does not shutdown within timeout(120)
> >
> > There was recently an issue fixed in the master branch where x86 was
> > broken after a version upgrade:
> >
> >
> https://git.openembedded.org/openembedded-core/commit/?id=3D3d3fa94ee6d7e=
a58e3ec64d28bd6414437806cfd
> >
> > Not sure if it is related, since the commit message indicates "won't
> > boot" as the symptom and this appears to be a shutdown issue. Perhaps
> > Richard can comment.
> >
> > Steve
> >
> > On Tue, Sep 12, 2023 at 10:02=E2=80=AFPM Urade, Yogita via
> > lists.openembedded.org
> > <Yogita.Urade=3Dwindriver.com@lists.openembedded.org> wrote:
> > >
> > > From: Yogita Urade <yogita.urade@windriver.com>
> > >
> > > A DMA-MMIO reentrancy problem may lead to memory corruption bugs
> > > like stack overflow or use-after-free.
> > >
> > > Summary of the problem from Peter Maydell:
> > >
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5K=
cknhPRD5fPBZA@mail.gmail.com
> > >
> > > Reference:
> > > https://gitlab.com/qemu-project/qemu/-/issues/556
> > >
> > > qemu.git$ git log --no-merges --oneline   --grep CVE-2023-0330
> > > b987718bbb hw/scsi/lsi53c895a: Fix reentrancy issues in the LSI
> controller (CVE-2023-0330)
> > > a2e1753b80 memory: prevent dma-reentracy issues
> > >
> > > Included second commit as well as commit log of a2e1753b80 says it
> > > resolves CVE-2023-0330
> > >
> > > Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> > > ---
> > >  meta/recipes-devtools/qemu/qemu.inc           |   3 +-
> > >  ...23-0330.patch =3D> CVE-2023-0330-0001.patch} |   0
> > >  .../qemu/qemu/CVE-2023-0330-0002.patch        | 136 ++++++++++++++++=
++
> > >  3 files changed, 138 insertions(+), 1 deletion(-)
> > >  rename meta/recipes-devtools/qemu/qemu/{CVE-2023-0330.patch =3D>
> CVE-2023-0330-0001.patch} (100%)
> > >  create mode 100644
> meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch
> > >
> > > diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> > > index 2efe63cdc0..1a50e4d524 100644
> > > --- a/meta/recipes-devtools/qemu/qemu.inc
> > > +++ b/meta/recipes-devtools/qemu/qemu.inc
> > > @@ -36,7 +36,8 @@ SRC_URI =3D "
> https://download.qemu.org/${BPN}-${PV}.tar.xz \
> > >             file://qemu-guest-agent.init \
> > >             file://qemu-guest-agent.udev \
> > >             file://ppc.patch \
> > > -          file://CVE-2023-0330.patch \
> > > +          file://CVE-2023-0330-0001.patch \
> > > +          file://CVE-2023-0330-0002.patch \
> > >            file://CVE-2023-3301.patch \
> > >            file://CVE-2023-3255.patch \
> > >            file://CVE-2023-2861.patch \
> > > diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
> b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0001.patch
> > > similarity index 100%
> > > rename from meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
> > > rename to meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0001.patch
> > > diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch
> b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch
> > > new file mode 100644
> > > index 0000000000..a21b01bd25
> > > --- /dev/null
> > > +++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch
> > > @@ -0,0 +1,136 @@
> > > +From a2e1753b8054344f32cf94f31c6399a58794a380 Mon Sep 17 00:00:00 20=
01
> > > +From: Alexander Bulekov <alxndr@bu.edu>
> > > +Date: Tue, 12 Sep 2023 10:49:46 +0000
> > > +Subject: [PATCH] memory: prevent dma-reentracy issues
> > > +
> > > +Add a flag to the DeviceState, when a device is engaged in
> PIO/MMIO/DMA.
> > > +This flag is set/checked prior to calling a device's MemoryRegion
> > > +handlers, and set when device code initiates DMA.  The purpose of th=
is
> > > +flag is to prevent two types of DMA-based reentrancy issues:
> > > +
> > > +1.) mmio -> dma -> mmio case
> > > +2.) bh -> dma write -> mmio case
> > > +
> > > +These issues have led to problems such as stack-exhaustion and
> > > +use-after-frees.
> > > +
> > > +Summary of the problem from Peter Maydell:
> > > +
> https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38LK4hJoWae5K=
cknhPRD5fPBZA@mail.gmail.com
> > > +
> > > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/62
> > > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/540
> > > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/541
> > > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/556
> > > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/557
> > > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/827
> > > +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1282
> > > +Resolves: CVE-2023-0330
> > > +
> > > +Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > > +Reviewed-by: Thomas Huth <thuth@redhat.com>
> > > +Message-Id: <20230427211013.2994127-2-alxndr@bu.edu>
> > > +[thuth: Replace warn_report() with warn_report_once()]
> > > +Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > +
> > > +CVE: CVE-2023-0330
> > > +
> > > +Upstream-Status: Backport [
> https://gitlab.com/qemu-project/qemu/-/commit/a2e1753b8054344f32cf94f31c6=
399a58794a380
> ]
> > > +
> > > +Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
> > > +---
> > > + include/exec/memory.h  |  5 +++++
> > > + include/hw/qdev-core.h |  7 +++++++
> > > + softmmu/memory.c       | 16 ++++++++++++++++
> > > + 3 files changed, 28 insertions(+)
> > > +
> > > +diff --git a/include/exec/memory.h b/include/exec/memory.h
> > > +index 91f8a2395..124628ada 100644
> > > +--- a/include/exec/memory.h
> > > ++++ b/include/exec/memory.h
> > > +@@ -741,6 +741,8 @@ struct MemoryRegion {
> > > +     bool is_iommu;
> > > +     RAMBlock *ram_block;
> > > +     Object *owner;
> > > ++    /* owner as TYPE_DEVICE. Used for re-entrancy checks in MR
> access hotpath */
> > > ++    DeviceState *dev;
> > > +
> > > +     const MemoryRegionOps *ops;
> > > +     void *opaque;
> > > +@@ -765,6 +767,9 @@ struct MemoryRegion {
> > > +     unsigned ioeventfd_nb;
> > > +     MemoryRegionIoeventfd *ioeventfds;
> > > +     RamDiscardManager *rdm; /* Only for RAM */
> > > ++
> > > ++    /* For devices designed to perform re-entrant IO into their own
> IO MRs */
> > > ++    bool disable_reentrancy_guard;
> > > + };
> > > +
> > > + struct IOMMUMemoryRegion {
> > > +diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> > > +index 785dd5a56..886f6bb79 100644
> > > +--- a/include/hw/qdev-core.h
> > > ++++ b/include/hw/qdev-core.h
> > > +@@ -162,6 +162,10 @@ struct NamedClockList {
> > > +     QLIST_ENTRY(NamedClockList) node;
> > > + };
> > > +
> > > ++typedef struct {
> > > ++    bool engaged_in_io;
> > > ++} MemReentrancyGuard;
> > > ++
> > > + /**
> > > +  * DeviceState:
> > > +  * @realized: Indicates whether the device has been fully
> constructed.
> > > +@@ -194,6 +198,9 @@ struct DeviceState {
> > > +     int alias_required_for_version;
> > > +     ResettableState reset;
> > > +     GSList *unplug_blockers;
> > > ++
> > > ++    /* Is the device currently in mmio/pio/dma? Used to prevent
> re-entrancy */
> > > ++    MemReentrancyGuard mem_reentrancy_guard;
> > > + };
> > > +
> > > + struct DeviceListener {
> > > +diff --git a/softmmu/memory.c b/softmmu/memory.c
> > > +index bc0be3f62..0ad556b5b 100644
> > > +--- a/softmmu/memory.c
> > > ++++ b/softmmu/memory.c
> > > +@@ -541,6 +541,18 @@ static MemTxResult
> access_with_adjusted_size(hwaddr addr,
> > > +     if (!access_size_max) {
> > > +         access_size_max =3D 4;
> > > +     }
> > > ++
> > > ++    /* Do not allow more than one simultaneous access to a device's
> IO Regions */
> > > ++    if (mr->dev && !mr->disable_reentrancy_guard &&
> > > ++        !mr->ram_device && !mr->ram && !mr->rom_device &&
> !mr->readonly) {
> > > ++        if (mr->dev->mem_reentrancy_guard.engaged_in_io) {
> > > ++            warn_report_once("Blocked re-entrant IO on MemoryRegion=
:
> "
> > > ++                             "%s at addr: 0x%" HWADDR_PRIX,
> > > ++                             memory_region_name(mr), addr);
> > > ++            return MEMTX_ACCESS_ERROR;
> > > ++        }
> > > ++        mr->dev->mem_reentrancy_guard.engaged_in_io =3D true;
> > > ++    }
> > > +
> > > +     /* FIXME: support unaligned access? */
> > > +     access_size =3D MAX(MIN(size, access_size_max), access_size_min=
);
> > > +@@ -556,6 +568,9 @@ static MemTxResult
> access_with_adjusted_size(hwaddr addr,
> > > +                         access_mask, attrs);
> > > +         }
> > > +     }
> > > ++    if (mr->dev) {
> > > ++        mr->dev->mem_reentrancy_guard.engaged_in_io =3D false;
> > > ++    }
> > > +     return r;
> > > + }
> > > +
> > > +@@ -1170,6 +1185,7 @@ static void memory_region_do_init(MemoryRegion
> *mr,
> > > +     }
> > > +     mr->name =3D g_strdup(name);
> > > +     mr->owner =3D owner;
> > > ++    mr->dev =3D (DeviceState *) object_dynamic_cast(mr->owner,
> TYPE_DEVICE);
> > > +     mr->ram_block =3D NULL;
> > > +
> > > +     if (name) {
> > > +--
> > > +2.35.5
> > > --
> > > 2.40.0
> > >
> > >
> > >
> > >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#187677):
> https://lists.openembedded.org/g/openembedded-core/message/187677
> Mute This Topic: https://lists.openembedded.org/mt/101332759/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004a458206058c1e12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Steve,</div><div><br></div><div>Same patch I&#39;v=
e submitted for dunfell. Please revert it, if it is failing.</div><div><br>=
</div><div>Thanks &amp; Regards,</div><div>Vijay<br></div></div><br><div cl=
ass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 15, 2=
023 at 8:56=E2=80=AFPM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.co=
m">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On Wed, Sep 13, 2023 at 4:44=E2=80=AFAM Steve Sakoman v=
ia<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sakoman.com@li=
sts.openembedded.org" target=3D"_blank">sakoman.com@lists.openembedded.org<=
/a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; Unfortunately this change breaks the qemux86 and qemux86-64 tests on<b=
r>
&gt; the autobuilder:<br>
<br>
The versions of this patch for both mickledore and kirkstone break<br>
qemux86 and qemux86-64 in the same way, so I can&#39;t take the patch for<b=
r>
either branch.<br>
<br>
Steve<br>
<br>
&gt;<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/736394/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/736394/</a><br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/736395/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/736395/</a><br>
&gt;<br>
&gt; In both cases:<br>
&gt;<br>
&gt; Failed: qemux86-64 does not shutdown within timeout(120)<br>
&gt;<br>
&gt; There was recently an issue fixed in the master branch where x86 was<b=
r>
&gt; broken after a version upgrade:<br>
&gt;<br>
&gt; <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=
=3D3d3fa94ee6d7ea58e3ec64d28bd6414437806cfd" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/openembedded-core/commit/?id=3D3d3fa94e=
e6d7ea58e3ec64d28bd6414437806cfd</a><br>
&gt;<br>
&gt; Not sure if it is related, since the commit message indicates &quot;wo=
n&#39;t<br>
&gt; boot&quot; as the symptom and this appears to be a shutdown issue. Per=
haps<br>
&gt; Richard can comment.<br>
&gt;<br>
&gt; Steve<br>
&gt;<br>
&gt; On Tue, Sep 12, 2023 at 10:02=E2=80=AFPM Urade, Yogita via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a><br>
&gt; &lt;Yogita.Urade=3D<a href=3D"mailto:windriver.com@lists.openembedded.=
org" target=3D"_blank">windriver.com@lists.openembedded.org</a>&gt; wrote:<=
br>
&gt; &gt;<br>
&gt; &gt; From: Yogita Urade &lt;<a href=3D"mailto:yogita.urade@windriver.c=
om" target=3D"_blank">yogita.urade@windriver.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; A DMA-MMIO reentrancy problem may lead to memory corruption bugs<=
br>
&gt; &gt; like stack overflow or use-after-free.<br>
&gt; &gt;<br>
&gt; &gt; Summary of the problem from Peter Maydell:<br>
&gt; &gt; <a href=3D"https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM=
-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com" rel=3D"noreferrer" target=
=3D"_blank">https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38L=
K4hJoWae5KcknhPRD5fPBZA@mail.gmail.com</a><br>
&gt; &gt;<br>
&gt; &gt; Reference:<br>
&gt; &gt; <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/556" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/is=
sues/556</a><br>
&gt; &gt;<br>
&gt; &gt; qemu.git$ git log --no-merges --oneline=C2=A0 =C2=A0--grep CVE-20=
23-0330<br>
&gt; &gt; b987718bbb hw/scsi/lsi53c895a: Fix reentrancy issues in the LSI c=
ontroller (CVE-2023-0330)<br>
&gt; &gt; a2e1753b80 memory: prevent dma-reentracy issues<br>
&gt; &gt;<br>
&gt; &gt; Included second commit as well as commit log of a2e1753b80 says i=
t<br>
&gt; &gt; resolves CVE-2023-0330<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Yogita Urade &lt;<a href=3D"mailto:yogita.urade@wi=
ndriver.com" target=3D"_blank">yogita.urade@windriver.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
&gt; &gt;=C2=A0 ...23-0330.patch =3D&gt; CVE-2023-0330-0001.patch} |=C2=A0 =
=C2=A00<br>
&gt; &gt;=C2=A0 .../qemu/qemu/CVE-2023-0330-0002.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 136 ++++++++++++++++++<br>
&gt; &gt;=C2=A0 3 files changed, 138 insertions(+), 1 deletion(-)<br>
&gt; &gt;=C2=A0 rename meta/recipes-devtools/qemu/qemu/{CVE-2023-0330.patch=
 =3D&gt; CVE-2023-0330-0001.patch} (100%)<br>
&gt; &gt;=C2=A0 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023=
-0330-0002.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-d=
evtools/qemu/qemu.inc<br>
&gt; &gt; index 2efe63cdc0..1a50e4d524 100644<br>
&gt; &gt; --- a/meta/recipes-devtools/qemu/qemu.inc<br>
&gt; &gt; +++ b/meta/recipes-devtools/qemu/qemu.inc<br>
&gt; &gt; @@ -36,7 +36,8 @@ SRC_URI =3D &quot;<a href=3D"https://download.q=
emu.org/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">h=
ttps://download.qemu.org/${BPN}-${PV}.tar.xz</a> \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://qemu-guest-=
agent.init \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://qemu-guest-=
agent.udev \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://ppc.patch \=
<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-0330.patch \<=
br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-0330-0001.pat=
ch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-0330-0002.pat=
ch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-3301.pat=
ch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-3255.pat=
ch \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-2861.pat=
ch \<br>
&gt; &gt; diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch =
b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0001.patch<br>
&gt; &gt; similarity index 100%<br>
&gt; &gt; rename from meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch<b=
r>
&gt; &gt; rename to meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0001.patc=
h<br>
&gt; &gt; diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.p=
atch b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..a21b01bd25<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330-0002.patch<br=
>
&gt; &gt; @@ -0,0 +1,136 @@<br>
&gt; &gt; +From a2e1753b8054344f32cf94f31c6399a58794a380 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Alexander Bulekov &lt;<a href=3D"mailto:alxndr@bu.edu" tar=
get=3D"_blank">alxndr@bu.edu</a>&gt;<br>
&gt; &gt; +Date: Tue, 12 Sep 2023 10:49:46 +0000<br>
&gt; &gt; +Subject: [PATCH] memory: prevent dma-reentracy issues<br>
&gt; &gt; +<br>
&gt; &gt; +Add a flag to the DeviceState, when a device is engaged in PIO/M=
MIO/DMA.<br>
&gt; &gt; +This flag is set/checked prior to calling a device&#39;s MemoryR=
egion<br>
&gt; &gt; +handlers, and set when device code initiates DMA.=C2=A0 The purp=
ose of this<br>
&gt; &gt; +flag is to prevent two types of DMA-based reentrancy issues:<br>
&gt; &gt; +<br>
&gt; &gt; +1.) mmio -&gt; dma -&gt; mmio case<br>
&gt; &gt; +2.) bh -&gt; dma write -&gt; mmio case<br>
&gt; &gt; +<br>
&gt; &gt; +These issues have led to problems such as stack-exhaustion and<b=
r>
&gt; &gt; +use-after-frees.<br>
&gt; &gt; +<br>
&gt; &gt; +Summary of the problem from Peter Maydell:<br>
&gt; &gt; +<a href=3D"https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3ia=
M-JVA6W38LK4hJoWae5KcknhPRD5fPBZA@mail.gmail.com" rel=3D"noreferrer" target=
=3D"_blank">https://lore.kernel.org/qemu-devel/CAFEAcA_23vc7hE3iaM-JVA6W38L=
K4hJoWae5KcknhPRD5fPBZA@mail.gmail.com</a><br>
&gt; &gt; +<br>
&gt; &gt; +Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issu=
es/62" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project=
/qemu/-/issues/62</a><br>
&gt; &gt; +Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issu=
es/540" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-projec=
t/qemu/-/issues/540</a><br>
&gt; &gt; +Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issu=
es/541" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-projec=
t/qemu/-/issues/541</a><br>
&gt; &gt; +Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issu=
es/556" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-projec=
t/qemu/-/issues/556</a><br>
&gt; &gt; +Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issu=
es/557" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-projec=
t/qemu/-/issues/557</a><br>
&gt; &gt; +Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issu=
es/827" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-projec=
t/qemu/-/issues/827</a><br>
&gt; &gt; +Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issu=
es/1282" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-proje=
ct/qemu/-/issues/1282</a><br>
&gt; &gt; +Resolves: CVE-2023-0330<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Alexander Bulekov &lt;<a href=3D"mailto:alxndr@bu=
.edu" target=3D"_blank">alxndr@bu.edu</a>&gt;<br>
&gt; &gt; +Reviewed-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com"=
 target=3D"_blank">thuth@redhat.com</a>&gt;<br>
&gt; &gt; +Message-Id: &lt;<a href=3D"mailto:20230427211013.2994127-2-alxnd=
r@bu.edu" target=3D"_blank">20230427211013.2994127-2-alxndr@bu.edu</a>&gt;<=
br>
&gt; &gt; +[thuth: Replace warn_report() with warn_report_once()]<br>
&gt; &gt; +Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.co=
m" target=3D"_blank">thuth@redhat.com</a>&gt;<br>
&gt; &gt; +<br>
&gt; &gt; +CVE: CVE-2023-0330<br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://gitlab.com/qemu-pr=
oject/qemu/-/commit/a2e1753b8054344f32cf94f31c6399a58794a380" rel=3D"norefe=
rrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/commit/a2e17=
53b8054344f32cf94f31c6399a58794a380</a>]<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Yogita Urade &lt;<a href=3D"mailto:yogita.urade@w=
indriver.com" target=3D"_blank">yogita.urade@windriver.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + include/exec/memory.h=C2=A0 |=C2=A0 5 +++++<br>
&gt; &gt; + include/hw/qdev-core.h |=C2=A0 7 +++++++<br>
&gt; &gt; + softmmu/memory.c=C2=A0 =C2=A0 =C2=A0 =C2=A0| 16 +++++++++++++++=
+<br>
&gt; &gt; + 3 files changed, 28 insertions(+)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/include/exec/memory.h b/include/exec/memory.h<br>
&gt; &gt; +index 91f8a2395..124628ada 100644<br>
&gt; &gt; +--- a/include/exec/memory.h<br>
&gt; &gt; ++++ b/include/exec/memory.h<br>
&gt; &gt; +@@ -741,6 +741,8 @@ struct MemoryRegion {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0bool is_iommu;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0RAMBlock *ram_block;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0Object *owner;<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* owner as TYPE_DEVICE. Used for re-entrancy che=
cks in MR access hotpath */<br>
&gt; &gt; ++=C2=A0 =C2=A0 DeviceState *dev;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0const MemoryRegionOps *ops;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0void *opaque;<br>
&gt; &gt; +@@ -765,6 +767,9 @@ struct MemoryRegion {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0unsigned ioeventfd_nb;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0MemoryRegionIoeventfd *ioeventfds;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0RamDiscardManager *rdm; /* Only for RAM */<b=
r>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* For devices designed to perform re-entrant IO =
into their own IO MRs */<br>
&gt; &gt; ++=C2=A0 =C2=A0 bool disable_reentrancy_guard;<br>
&gt; &gt; + };<br>
&gt; &gt; +<br>
&gt; &gt; + struct IOMMUMemoryRegion {<br>
&gt; &gt; +diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h<br>
&gt; &gt; +index 785dd5a56..886f6bb79 100644<br>
&gt; &gt; +--- a/include/hw/qdev-core.h<br>
&gt; &gt; ++++ b/include/hw/qdev-core.h<br>
&gt; &gt; +@@ -162,6 +162,10 @@ struct NamedClockList {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0QLIST_ENTRY(NamedClockList) node;<br>
&gt; &gt; + };<br>
&gt; &gt; +<br>
&gt; &gt; ++typedef struct {<br>
&gt; &gt; ++=C2=A0 =C2=A0 bool engaged_in_io;<br>
&gt; &gt; ++} MemReentrancyGuard;<br>
&gt; &gt; ++<br>
&gt; &gt; + /**<br>
&gt; &gt; +=C2=A0 * DeviceState:<br>
&gt; &gt; +=C2=A0 * @realized: Indicates whether the device has been fully =
constructed.<br>
&gt; &gt; +@@ -194,6 +198,9 @@ struct DeviceState {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0int alias_required_for_version;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0ResettableState reset;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0GSList *unplug_blockers;<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Is the device currently in mmio/pio/dma? Used =
to prevent re-entrancy */<br>
&gt; &gt; ++=C2=A0 =C2=A0 MemReentrancyGuard mem_reentrancy_guard;<br>
&gt; &gt; + };<br>
&gt; &gt; +<br>
&gt; &gt; + struct DeviceListener {<br>
&gt; &gt; +diff --git a/softmmu/memory.c b/softmmu/memory.c<br>
&gt; &gt; +index bc0be3f62..0ad556b5b 100644<br>
&gt; &gt; +--- a/softmmu/memory.c<br>
&gt; &gt; ++++ b/softmmu/memory.c<br>
&gt; &gt; +@@ -541,6 +541,18 @@ static MemTxResult access_with_adjusted_siz=
e(hwaddr addr,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (!access_size_max) {<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0access_size_max =3D 4;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; ++<br>
&gt; &gt; ++=C2=A0 =C2=A0 /* Do not allow more than one simultaneous access=
 to a device&#39;s IO Regions */<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (mr-&gt;dev &amp;&amp; !mr-&gt;disable_reentra=
ncy_guard &amp;&amp;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 !mr-&gt;ram_device &amp;&amp; !mr-&=
gt;ram &amp;&amp; !mr-&gt;rom_device &amp;&amp; !mr-&gt;readonly) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (mr-&gt;dev-&gt;mem_reentrancy_g=
uard.engaged_in_io) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 warn_report_once(&quo=
t;Blocked re-entrant IO on MemoryRegion: &quot;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;%s at addr: 0x%&quot; HWADDR=
_PRIX,<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0memory_region_name(mr), addr);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return MEMTX_ACCESS_E=
RROR;<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 mr-&gt;dev-&gt;mem_reentrancy_guard=
.engaged_in_io =3D true;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0/* FIXME: support unaligned access? */<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0access_size =3D MAX(MIN(size, access_size_ma=
x), access_size_min);<br>
&gt; &gt; +@@ -556,6 +568,9 @@ static MemTxResult access_with_adjusted_size=
(hwaddr addr,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0access_mask, attrs);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; ++=C2=A0 =C2=A0 if (mr-&gt;dev) {<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 mr-&gt;dev-&gt;mem_reentrancy_guard=
.engaged_in_io =3D false;<br>
&gt; &gt; ++=C2=A0 =C2=A0 }<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0return r;<br>
&gt; &gt; + }<br>
&gt; &gt; +<br>
&gt; &gt; +@@ -1170,6 +1185,7 @@ static void memory_region_do_init(MemoryRe=
gion *mr,<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0}<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0mr-&gt;name =3D g_strdup(name);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0mr-&gt;owner =3D owner;<br>
&gt; &gt; ++=C2=A0 =C2=A0 mr-&gt;dev =3D (DeviceState *) object_dynamic_cas=
t(mr-&gt;owner, TYPE_DEVICE);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0mr-&gt;ram_block =3D NULL;<br>
&gt; &gt; +<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0if (name) {<br>
&gt; &gt; +--<br>
&gt; &gt; +2.35.5<br>
&gt; &gt; --<br>
&gt; &gt; 2.40.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#187677): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/187677" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/187677</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101332759/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/101332759/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000004a458206058c1e12--

