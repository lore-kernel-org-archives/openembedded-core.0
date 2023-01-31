Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41EE5C636CC
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 07:18:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.7148.1675149507580626975
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 23:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VEUWHThb;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id o18so3813809wrj.3
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 23:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=47G9cdP9cgE3DhBPXzhblZYu58PqMrW5H1yBbayfA9o=;
        b=VEUWHThbFwcYOYjYYNgGzD1u5RB0NAh3XKnzcVeSyYgky0TZhJOq9BWv5/D4HuxiYw
         aHtLb2MNIsMdAnCWFWZ92fRNKgB6IzFEC7No8zxIpfocckX9RIqgae5Ggau7xUgP8S/Z
         Jsgw5iwRvTft1Pk3DgvKmK7dhP+U9c52owq5Y6pDxojAmRZqRnGrax8aWuGPannbKagN
         PUUzmvWE9tpPG/dZgiJ6fVnoQ9G1NMwju4DSJ2BeJV+rrA7CsIhwId1fGLnRf+9ss6Ki
         YgbcLOYsucPTUG4i9/jHjZwG4tP1fOvNjRUbHDWRsRLIEy/EhQg4Tez1hX5Pvkla4ucG
         6ziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=47G9cdP9cgE3DhBPXzhblZYu58PqMrW5H1yBbayfA9o=;
        b=JkJ6Cb6UOKRrjdf79Hi9jQFkwkjggx8Br+/m9mccEqCQQ8EY3KgkLUGGEtp7Q+pTSM
         8zV4uggMpm37VYZizgIuoTNKfs1QO45z1LkJxB+OPCl/1yppN2yKcvM2BGY5gj54PmBK
         qAbz1xhL9TXMHtwMmkLx8UzaHKC52naU9AbY9CUjtacnkYUhw8hg2gkoZz9746SwwmtC
         4PhIpRdDfsemqYWn5gtnEkyg7G2dA/rycQzxVqTI0RildiT39mM26hiJuFtHHbynIzUe
         Sp3TSjiJhWY7jJbxvGQi5MtsFsXGHUk11bZ8loKx7/Ls/wc+MuvpuuyIkusTKWtqJFB/
         0Uqw==
X-Gm-Message-State: AO0yUKWQgVzZQCJUL165jx7Ha+shgEH17Owap1QeJLqV6K2dHWVI5X52
	unMLOPSV7X4nb6oUHvnMRZmLvk+ii6F8CktMaHE=
X-Google-Smtp-Source: AK7set+X+oli7BJt8uyPmnWH2z/DeHGKLEz6qPyrv+4tlBsZcTnFCXfBPczAbwMFgDQuU/bhMdjFSMCdNxA3ilnvpBE=
X-Received: by 2002:a5d:6409:0:b0:2bf:b1a5:ffd8 with SMTP id
 z9-20020a5d6409000000b002bfb1a5ffd8mr634601wru.129.1675149505501; Mon, 30 Jan
 2023 23:18:25 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674657501.git.steve@sakoman.com> <7fdb46a83e117459780d5cd0997b0666b7b1a081.1674657501.git.steve@sakoman.com>
In-Reply-To: <7fdb46a83e117459780d5cd0997b0666b7b1a081.1674657501.git.steve@sakoman.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 31 Jan 2023 08:18:14 +0100
Message-ID: <CA+chaQfZ4CZQunFQvEXAQLbJPGjKtangM1FcPq127RN9rdtZTA@mail.gmail.com>
Subject: Re: [OE-core][dunfell 07/16] QEMU: CVE-2022-4144 QXL: qxl_phys2virt
 unsafe address translation can lead to out-of-bounds read
To: Steve Sakoman <steve@sakoman.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000389eac05f38a2374"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 07:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176506

--000000000000389eac05f38a2374
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I haven't checked yet in dunfell, but in kirkstone this commit merged last
week breaks nativesdk-qemu builds.

This chunk:
+@@ -1486,7 +1505,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL
pqxl, int group_id)
+         offset =3D le64_to_cpu(pqxl) & 0xffffffffffff;
+         return (void *)(intptr_t)offset;
+     case MEMSLOT_GROUP_GUEST:
+-        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
++        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)) =
{
+             return NULL;
+         }
+         ptr =3D memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);

Uses size parameter which was added in previous commit (which wasn't
backported):
https://gitlab.com/qemu-project/qemu/-/commit/8efec0ef8bbc1e75a7ebf6e325a35=
806ece9b39f

So either both commits need to be backported or this one reworked not to
use undeclared size as it leads to:

| ../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
| ../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared (first
use in this function); did you mean 'gsize'?
|  1477 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset,
size)) {
|       |
^~~~
|       |
gsize

I'm surprised this wasn't caught on autobuilder already, maybe it's
triggered only with extra PACKAGECONFIG options we have enabled:
PACKAGECONFIG:append:class-nativesdk =3D " virglrenderer epoxy spice libusb
usb-redir"

Regards,


On Wed, Jan 25, 2023 at 3:42 PM Steve Sakoman <steve@sakoman.com> wrote:

> From: Hitendra Prajapati <hprajapati@mvista.com>
>
> Upstream-Status: Backport from
> https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1b7d8a3251a65=
bd6f3d1e1f622
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |   1 +
>  .../qemu/qemu/CVE-2022-4144.patch             | 103 ++++++++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> index fff2c87780..898fa1a8d8 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -115,6 +115,7 @@ SRC_URI =3D "
> https://download.qemu.org/${BPN}-${PV}.tar.xz \
>            file://CVE-2021-3638.patch \
>            file://CVE-2021-20196.patch \
>            file://CVE-2021-3507.patch \
> +          file://CVE-2022-4144.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
> b/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
> new file mode 100644
> index 0000000000..3f0d5fbd5c
> --- /dev/null
> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
> @@ -0,0 +1,103 @@
> +From 6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linaro=
.org>
> +Date: Mon, 28 Nov 2022 21:27:40 +0100
> +Subject: [PATCH] hw/display/qxl: Avoid buffer overrun in qxl_phys2virt
> + (CVE-2022-4144)
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Have qxl_get_check_slot_offset() return false if the requested
> +buffer size does not fit within the slot memory region.
> +
> +Similarly qxl_phys2virt() now returns NULL in such case, and
> +qxl_dirty_one_surface() aborts.
> +
> +This avoids buffer overrun in the host pointer returned by
> +memory_region_get_ram_ptr().
> +
> +Fixes: CVE-2022-4144 (out-of-bounds read)
> +Reported-by: Wenxu Yin (@awxylitol)
> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
> +
> +Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@linaro.org>
> +Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> +Message-Id: <20221128202741.4945-5-philmd@linaro.org>
> +
> +Upstream-Status: Backport [
> https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1b7d8a3251a65=
bd6f3d1e1f622
> ]
> +CVE: CVE-2022-4144
> +Comments: Deleted patch hunk in qxl.h,as it contains change
> +in comments which is not present in current version of qemu.
> +
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + hw/display/qxl.c | 27 +++++++++++++++++++++++----
> + 1 file changed, 23 insertions(+), 4 deletions(-)
> +
> +diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> +index cd7eb39d..6bc8385b 100644
> +--- a/hw/display/qxl.c
> ++++ b/hw/display/qxl.c
> +@@ -1440,11 +1440,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d)
> +
> + /* can be also called from spice server thread context */
> + static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL
> pqxl,
> +-                                      uint32_t *s, uint64_t *o)
> ++                                      uint32_t *s, uint64_t *o,
> ++                                      size_t size_requested)
> + {
> +     uint64_t phys   =3D le64_to_cpu(pqxl);
> +     uint32_t slot   =3D (phys >> (64 -  8)) & 0xff;
> +     uint64_t offset =3D phys & 0xffffffffffff;
> ++    uint64_t size_available;
> +
> +     if (slot >=3D NUM_MEMSLOTS) {
> +         qxl_set_guest_bug(qxl, "slot too large %d >=3D %d", slot,
> +@@ -1468,6 +1470,23 @@ static bool qxl_get_check_slot_offset(PCIQXLDevic=
e
> *qxl, QXLPHYSICAL pqxl,
> +                           slot, offset, qxl->guest_slots[slot].size);
> +         return false;
> +     }
> ++    size_available =3D memory_region_size(qxl->guest_slots[slot].mr);
> ++    if (qxl->guest_slots[slot].offset + offset >=3D size_available) {
> ++        qxl_set_guest_bug(qxl,
> ++                          "slot %d offset %"PRIu64" > region size
> %"PRIu64"\n",
> ++                          slot, qxl->guest_slots[slot].offset + offset,
> ++                          size_available);
> ++        return false;
> ++    }
> ++    size_available -=3D qxl->guest_slots[slot].offset + offset;
> ++    if (size_requested > size_available) {
> ++        qxl_set_guest_bug(qxl,
> ++                          "slot %d offset %"PRIu64" size %zu: "
> ++                          "overrun by %"PRIu64" bytes\n",
> ++                          slot, offset, size_requested,
> ++                          size_requested - size_available);
> ++        return false;
> ++    }
> +
> +     *s =3D slot;
> +     *o =3D offset;
> +@@ -1486,7 +1505,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL
> pqxl, int group_id)
> +         offset =3D le64_to_cpu(pqxl) & 0xffffffffffff;
> +         return (void *)(intptr_t)offset;
> +     case MEMSLOT_GROUP_GUEST:
> +-        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
> ++        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size)=
)
> {
> +             return NULL;
> +         }
> +         ptr =3D memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
> +@@ -1944,9 +1963,9 @@ static void qxl_dirty_one_surface(PCIQXLDevice
> *qxl, QXLPHYSICAL pqxl,
> +     uint32_t slot;
> +     bool rc;
> +
> +-    rc =3D qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset);
> +-    assert(rc =3D=3D true);
> +     size =3D (uint64_t)height * abs(stride);
> ++    rc =3D qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size);
> ++    assert(rc =3D=3D true);
> +     trace_qxl_surfaces_dirty(qxl->id, offset, size);
> +     qxl_set_dirty(qxl->guest_slots[slot].mr,
> +                   qxl->guest_slots[slot].offset + offset,
> +--
> +2.25.1
> +
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176358):
> https://lists.openembedded.org/g/openembedded-core/message/176358
> Mute This Topic: https://lists.openembedded.org/mt/96521255/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000389eac05f38a2374
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I haven&#39;t checked yet in dunfell, but in kirkstone thi=
s commit merged last week breaks nativesdk-qemu builds.<div><br></div><div>=
This chunk:</div><div>+@@ -1486,7 +1505,7 @@ void *qxl_phys2virt(PCIQXLDevi=
ce *qxl, QXLPHYSICAL pqxl, int group_id)<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0offset =3D le64_to_cpu(pqxl) &amp; 0xffffffffffff;<br>+=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0return (void *)(intptr_t)offset;<br>+=C2=A0 =C2=A0 =C2=
=A0case MEMSLOT_GROUP_GUEST:<br>+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qxl_get_=
check_slot_offset(qxl, pqxl, &amp;slot, &amp;offset)) {<br>++=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 if (!qxl_get_check_slot_offset(qxl, pqxl, &amp;slot, &amp;off=
set, size)) {<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NU=
LL;<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0ptr =3D memory_region_get_ram_ptr(qxl-&gt;guest_slots[slot].mr);<br>=
</div><div><br></div><div>Uses size parameter which was added in previous c=
ommit (which wasn&#39;t backported):</div><div><a href=3D"https://gitlab.co=
m/qemu-project/qemu/-/commit/8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f">http=
s://gitlab.com/qemu-project/qemu/-/commit/8efec0ef8bbc1e75a7ebf6e325a35806e=
ce9b39f</a><br></div><div><br></div><div>So either both commits need to be =
backported or this one reworked not to use undeclared size as it leads to:<=
/div><div><br></div><div>| ../qemu-6.2.0/hw/display/qxl.c: In function &#39=
;qxl_phys2virt&#39;:<br>| ../qemu-6.2.0/hw/display/qxl.c:1477:67: error: &#=
39;size&#39; undeclared (first use in this function); did you mean &#39;gsi=
ze&#39;?<br>| =C2=A01477 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qxl_get_check_s=
lot_offset(qxl, pqxl, &amp;slot, &amp;offset, size)) {<br>| =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ^~~~<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gsize<br></div>=
<div><br></div><div>I&#39;m surprised this wasn&#39;t caught on autobuilder=
 already, maybe it&#39;s triggered only with extra PACKAGECONFIG options we=
 have enabled:</div><div>PACKAGECONFIG:append:class-nativesdk =3D &quot; vi=
rglrenderer epoxy spice libusb usb-redir&quot;<br></div><div><br></div><div=
>Regards,</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Wed, Jan 25, 2023 at 3:42 PM Steve Sakoman=
 &lt;<a href=3D"mailto:steve@sakoman.com">steve@sakoman.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Hitendra P=
rajapati &lt;<a href=3D"mailto:hprajapati@mvista.com" target=3D"_blank">hpr=
ajapati@mvista.com</a>&gt;<br>
<br>
Upstream-Status: Backport from <a href=3D"https://gitlab.com/qemu-project/q=
emu/-/commit/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622" rel=3D"noreferrer" t=
arget=3D"_blank">https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c=
6f1b7d8a3251a65bd6f3d1e1f622</a><br>
<br>
Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.c=
om" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" targe=
t=3D"_blank">steve@sakoman.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A01 +<br>
=C2=A0.../qemu/qemu/CVE-2022-4144.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 103 ++++++++++++++++++<br>
=C2=A02 files changed, 104 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patc=
h<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc<br>
index fff2c87780..898fa1a8d8 100644<br>
--- a/meta/recipes-devtools/qemu/qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/qemu.inc<br>
@@ -115,6 +115,7 @@ SRC_URI =3D &quot;<a href=3D"https://download.qemu.org/=
$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://d=
ownload.qemu.org/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-3638.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-20196.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2021-3507.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2022-4144.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&=
quot;<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch b/meta/rec=
ipes-devtools/qemu/qemu/CVE-2022-4144.patch<br>
new file mode 100644<br>
index 0000000000..3f0d5fbd5c<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch<br>
@@ -0,0 +1,103 @@<br>
+From 6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D &lt;<a href=3D"m=
ailto:philmd@linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
+Date: Mon, 28 Nov 2022 21:27:40 +0100<br>
+Subject: [PATCH] hw/display/qxl: Avoid buffer overrun in qxl_phys2virt<br>
+ (CVE-2022-4144)<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Have qxl_get_check_slot_offset() return false if the requested<br>
+buffer size does not fit within the slot memory region.<br>
+<br>
+Similarly qxl_phys2virt() now returns NULL in such case, and<br>
+qxl_dirty_one_surface() aborts.<br>
+<br>
+This avoids buffer overrun in the host pointer returned by<br>
+memory_region_get_ram_ptr().<br>
+<br>
+Fixes: CVE-2022-4144 (out-of-bounds read)<br>
+Reported-by: Wenxu Yin (@awxylitol)<br>
+Resolves: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1336" r=
el=3D"noreferrer" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/=
issues/1336</a><br>
+<br>
+Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 &lt;<a href=3D"mailto:phi=
lmd@linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
+Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" =
target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
+Message-Id: &lt;<a href=3D"mailto:20221128202741.4945-5-philmd@linaro.org"=
 target=3D"_blank">20221128202741.4945-5-philmd@linaro.org</a>&gt;<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.com/qemu-project/qemu=
/-/commit/6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622" rel=3D"noreferrer" targ=
et=3D"_blank">https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1=
b7d8a3251a65bd6f3d1e1f622</a>]<br>
+CVE: CVE-2022-4144<br>
+Comments: Deleted patch hunk in qxl.h,as it contains change<br>
+in comments which is not present in current version of qemu.<br>
+<br>
+Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.=
com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
+---<br>
+ hw/display/qxl.c | 27 +++++++++++++++++++++++----<br>
+ 1 file changed, 23 insertions(+), 4 deletions(-)<br>
+<br>
+diff --git a/hw/display/qxl.c b/hw/display/qxl.c<br>
+index cd7eb39d..6bc8385b 100644<br>
+--- a/hw/display/qxl.c<br>
++++ b/hw/display/qxl.c<br>
+@@ -1440,11 +1440,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d)<br=
>
+ <br>
+ /* can be also called from spice server thread context */<br>
+ static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl=
,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *s, ui=
nt64_t *o)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *s, ui=
nt64_t *o,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t size_req=
uested)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0uint64_t phys=C2=A0 =C2=A0=3D le64_to_cpu(pqxl);<br>
+=C2=A0 =C2=A0 =C2=A0uint32_t slot=C2=A0 =C2=A0=3D (phys &gt;&gt; (64 -=C2=
=A0 8)) &amp; 0xff;<br>
+=C2=A0 =C2=A0 =C2=A0uint64_t offset =3D phys &amp; 0xffffffffffff;<br>
++=C2=A0 =C2=A0 uint64_t size_available;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (slot &gt;=3D NUM_MEMSLOTS) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl_set_guest_bug(qxl, &quot;slot too la=
rge %d &gt;=3D %d&quot;, slot,<br>
+@@ -1468,6 +1470,23 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice =
*qxl, QXLPHYSICAL pqxl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0slot, offset, qxl-&gt;guest_slots[slot].size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return false;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++=C2=A0 =C2=A0 size_available =3D memory_region_size(qxl-&gt;guest_slots[s=
lot].mr);<br>
++=C2=A0 =C2=A0 if (qxl-&gt;guest_slots[slot].offset + offset &gt;=3D size_=
available) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 qxl_set_guest_bug(qxl,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;slot %d offset %&quot;PRIu64&quot; &gt; region size=
 %&quot;PRIu64&quot;\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 slot, qxl-&gt;guest_slots[slot].offset + offset,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 size_available);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
++=C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 size_available -=3D qxl-&gt;guest_slots[slot].offset + offs=
et;<br>
++=C2=A0 =C2=A0 if (size_requested &gt; size_available) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 qxl_set_guest_bug(qxl,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;slot %d offset %&quot;PRIu64&quot; size %zu: &quot;=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 &quot;overrun by %&quot;PRIu64&quot; bytes\n&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 slot, offset, size_requested,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 size_requested - size_available);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return false;<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0*s =3D slot;<br>
+=C2=A0 =C2=A0 =C2=A0*o =3D offset;<br>
+@@ -1486,7 +1505,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL p=
qxl, int group_id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0offset =3D le64_to_cpu(pqxl) &amp; 0xfff=
fffffffff;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (void *)(intptr_t)offset;<br>
+=C2=A0 =C2=A0 =C2=A0case MEMSLOT_GROUP_GUEST:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qxl_get_check_slot_offset(qxl, pqxl, &am=
p;slot, &amp;offset)) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!qxl_get_check_slot_offset(qxl, pqxl, &am=
p;slot, &amp;offset, size)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ptr =3D memory_region_get_ram_ptr(qxl-&g=
t;guest_slots[slot].mr);<br>
+@@ -1944,9 +1963,9 @@ static void qxl_dirty_one_surface(PCIQXLDevice *qxl,=
 QXLPHYSICAL pqxl,<br>
+=C2=A0 =C2=A0 =C2=A0uint32_t slot;<br>
+=C2=A0 =C2=A0 =C2=A0bool rc;<br>
+ <br>
+-=C2=A0 =C2=A0 rc =3D qxl_get_check_slot_offset(qxl, pqxl, &amp;slot, &amp=
;offset);<br>
+-=C2=A0 =C2=A0 assert(rc =3D=3D true);<br>
+=C2=A0 =C2=A0 =C2=A0size =3D (uint64_t)height * abs(stride);<br>
++=C2=A0 =C2=A0 rc =3D qxl_get_check_slot_offset(qxl, pqxl, &amp;slot, &amp=
;offset, size);<br>
++=C2=A0 =C2=A0 assert(rc =3D=3D true);<br>
+=C2=A0 =C2=A0 =C2=A0trace_qxl_surfaces_dirty(qxl-&gt;id, offset, size);<br=
>
+=C2=A0 =C2=A0 =C2=A0qxl_set_dirty(qxl-&gt;guest_slots[slot].mr,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl-&=
gt;guest_slots[slot].offset + offset,<br>
+-- <br>
+2.25.1<br>
+<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176358): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176358" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176358</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96521255/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96521255/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000389eac05f38a2374--

