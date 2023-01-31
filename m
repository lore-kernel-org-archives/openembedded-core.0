Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 772DBC38142
	for <webhook@archiver.kernel.org>; Tue, 31 Jan 2023 07:40:02 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.7120.1675150793726969656
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Jan 2023 23:39:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=a9RIpPkc;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id t18so13345282wro.1
        for <openembedded-core@lists.openembedded.org>; Mon, 30 Jan 2023 23:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FcUJ4Xu8MHt9IzpL5K98/oseklVcBdAroGpN1TTK0uA=;
        b=a9RIpPkc91JRiaRYsrib0ti5TVPjpym+55sXehm047o5BnEtUdG9jUsjY5jSywxCua
         AVGb9rm8XFwLOa69DuR3stC274OFip2x/Qi/XJaP8rxZpgo0E2ErYHlxS8m4Tdt59L/9
         wPQ54ukwrBHkJdT40ntSUyJou87wRTtBlrA85c+4CKrf3tCdPEc6au7mWiwm2yjPt3cF
         gnoeB+IQLGnjWZqLGMviFEX/CkrgPrJ+RQGe5nWa0nvLuKxPIDhPQ1azQE1Sd3I5Anno
         Q4Wj1c8nKLIpWNfHPeJD8InoXy3o2oK0B2RQ4Sh2iAoa2VAK+B5QZX+zz/Z7/kuIsCeC
         lr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FcUJ4Xu8MHt9IzpL5K98/oseklVcBdAroGpN1TTK0uA=;
        b=4DLUJoIpfaXzDP2QjVm/uUT5TQRRTfJ+bpW9WKJ8Ua8fyVk7pdxsQBzIeIl9YvSE0B
         ZtkHbXn3psVo+NXdqBrWSbqhiuWNmLR/PXq3YL9AEvEYxzOGBuc4iXur0RutiYh5oq56
         GzVbkmF0Qk92w8AKGTXv2YXdGZROlLZxICfhHiZPzUJHvchk8q9tuIDKP6K2qSKKGnba
         KP5OaDxN1YbYKyFZW5PySw5Sb+4JeQJJoRjo9wbZhlGsm1IBF5sT/39Wgi4ypQkMsnBw
         XydRFqWVhPqDzva5MdJs45UVy1MnTYDWx+FBhaMSOyvVlP4vU9mMhpE6P4RrwrNUJiLd
         sM8g==
X-Gm-Message-State: AO0yUKWaq4ZXTGeEHQmIje7hYDjtoDZJjHkrlzO9yttX5lAtrxiXo5X5
	uoSgw/hp6e0h10fR9olBtadImN7PwU7OGtW6laU=
X-Google-Smtp-Source: AK7set90H26F52AZDqgbhfRuP7rEkdiUB/fX2u3AhfrCyGKy2j3vi8+dceyE3u4b61/q9X+38wrLAGJKdwNZT7rNnKw=
X-Received: by 2002:adf:facb:0:b0:2bf:b746:6225 with SMTP id
 a11-20020adffacb000000b002bfb7466225mr504626wrs.204.1675150791879; Mon, 30
 Jan 2023 23:39:51 -0800 (PST)
MIME-Version: 1.0
References: <cover.1674657501.git.steve@sakoman.com> <7fdb46a83e117459780d5cd0997b0666b7b1a081.1674657501.git.steve@sakoman.com>
 <173F539A3738DDDD.25384@lists.openembedded.org>
In-Reply-To: <173F539A3738DDDD.25384@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 31 Jan 2023 08:39:40 +0100
Message-ID: <CA+chaQeh-fC6FGFcaR0nmoe7LEQeuRSCzm-sE9gn_ZeW_v+HJQ@mail.gmail.com>
Subject: Re: [OE-core][dunfell 07/16] QEMU: CVE-2022-4144 QXL: qxl_phys2virt
 unsafe address translation can lead to out-of-bounds read
To: Martin.Jansa@gmail.com, bhabu.bindu@kpit.com, 
	Hitendra Prajapati <hprajapati@mvista.com>
Cc: Steve Sakoman <steve@sakoman.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000e530b805f38a6f15"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 31 Jan 2023 07:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176508

--000000000000e530b805f38a6f15
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2023 at 8:18 AM Martin Jansa via lists.openembedded.org
<Martin.Jansa=3Dgmail.com@lists.openembedded.org> wrote:

> I haven't checked yet in dunfell, but in kirkstone this commit merged las=
t
> week breaks nativesdk-qemu builds.
>

I can confirm it fails the same with this commit from Hitendra in dunfell:

nativesdk-qemu/4.2.0-r0/qemu-4.2.0/hw/display/qxl.c:1508:67: error: 'size'
undeclared (first use in this function); did you mean 'gsize'?
|  1508 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset,
size)) {
|       |
^~~~
|       |
gsize

as well as the same backport from Bhabu in kirkstone (already merged):
https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&id=3D4=
cb3874abf4fdeb04337a48a14c765ba9b2269d4

To reproduce this just enable "spice" PACKAGECONFIG in nativesdk-qemu.

Hitendra, Bhabu: please have a look.

Regards,


>
> This chunk:
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
>
> Uses size parameter which was added in previous commit (which wasn't
> backported):
>
> https://gitlab.com/qemu-project/qemu/-/commit/8efec0ef8bbc1e75a7ebf6e325a=
35806ece9b39f
>
> So either both commits need to be backported or this one reworked not to
> use undeclared size as it leads to:
>
> | ../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
> | ../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared (first
> use in this function); did you mean 'gsize'?
> |  1477 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot,
> &offset, size)) {
> |       |
>   ^~~~
> |       |
>   gsize
>
> I'm surprised this wasn't caught on autobuilder already, maybe it's
> triggered only with extra PACKAGECONFIG options we have enabled:
> PACKAGECONFIG:append:class-nativesdk =3D " virglrenderer epoxy spice libu=
sb
> usb-redir"
>
> Regards,
>
>
> On Wed, Jan 25, 2023 at 3:42 PM Steve Sakoman <steve@sakoman.com> wrote:
>
>> From: Hitendra Prajapati <hprajapati@mvista.com>
>>
>> Upstream-Status: Backport from
>> https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1b7d8a3251a6=
5bd6f3d1e1f622
>>
>> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>> ---
>>  meta/recipes-devtools/qemu/qemu.inc           |   1 +
>>  .../qemu/qemu/CVE-2022-4144.patch             | 103 ++++++++++++++++++
>>  2 files changed, 104 insertions(+)
>>  create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu.inc
>> b/meta/recipes-devtools/qemu/qemu.inc
>> index fff2c87780..898fa1a8d8 100644
>> --- a/meta/recipes-devtools/qemu/qemu.inc
>> +++ b/meta/recipes-devtools/qemu/qemu.inc
>> @@ -115,6 +115,7 @@ SRC_URI =3D "
>> https://download.qemu.org/${BPN}-${PV}.tar.xz \
>>            file://CVE-2021-3638.patch \
>>            file://CVE-2021-20196.patch \
>>            file://CVE-2021-3507.patch \
>> +          file://CVE-2022-4144.patch \
>>             "
>>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>>
>> diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
>> b/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
>> new file mode 100644
>> index 0000000000..3f0d5fbd5c
>> --- /dev/null
>> +++ b/meta/recipes-devtools/qemu/qemu/CVE-2022-4144.patch
>> @@ -0,0 +1,103 @@
>> +From 6dbbf055148c6f1b7d8a3251a65bd6f3d1e1f622 Mon Sep 17 00:00:00 2001
>> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linar=
o.org>
>> +Date: Mon, 28 Nov 2022 21:27:40 +0100
>> +Subject: [PATCH] hw/display/qxl: Avoid buffer overrun in qxl_phys2virt
>> + (CVE-2022-4144)
>> +MIME-Version: 1.0
>> +Content-Type: text/plain; charset=3DUTF-8
>> +Content-Transfer-Encoding: 8bit
>> +
>> +Have qxl_get_check_slot_offset() return false if the requested
>> +buffer size does not fit within the slot memory region.
>> +
>> +Similarly qxl_phys2virt() now returns NULL in such case, and
>> +qxl_dirty_one_surface() aborts.
>> +
>> +This avoids buffer overrun in the host pointer returned by
>> +memory_region_get_ram_ptr().
>> +
>> +Fixes: CVE-2022-4144 (out-of-bounds read)
>> +Reported-by: Wenxu Yin (@awxylitol)
>> +Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1336
>> +
>> +Signed-off-by: Philippe Mathieu-Daud=C3=83=C2=A9 <philmd@linaro.org>
>> +Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>> +Message-Id: <20221128202741.4945-5-philmd@linaro.org>
>> +
>> +Upstream-Status: Backport [
>> https://gitlab.com/qemu-project/qemu/-/commit/6dbbf055148c6f1b7d8a3251a6=
5bd6f3d1e1f622
>> ]
>> +CVE: CVE-2022-4144
>> +Comments: Deleted patch hunk in qxl.h,as it contains change
>> +in comments which is not present in current version of qemu.
>> +
>> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
>> +---
>> + hw/display/qxl.c | 27 +++++++++++++++++++++++----
>> + 1 file changed, 23 insertions(+), 4 deletions(-)
>> +
>> +diff --git a/hw/display/qxl.c b/hw/display/qxl.c
>> +index cd7eb39d..6bc8385b 100644
>> +--- a/hw/display/qxl.c
>> ++++ b/hw/display/qxl.c
>> +@@ -1440,11 +1440,13 @@ static void qxl_reset_surfaces(PCIQXLDevice *d)
>> +
>> + /* can be also called from spice server thread context */
>> + static bool qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL
>> pqxl,
>> +-                                      uint32_t *s, uint64_t *o)
>> ++                                      uint32_t *s, uint64_t *o,
>> ++                                      size_t size_requested)
>> + {
>> +     uint64_t phys   =3D le64_to_cpu(pqxl);
>> +     uint32_t slot   =3D (phys >> (64 -  8)) & 0xff;
>> +     uint64_t offset =3D phys & 0xffffffffffff;
>> ++    uint64_t size_available;
>> +
>> +     if (slot >=3D NUM_MEMSLOTS) {
>> +         qxl_set_guest_bug(qxl, "slot too large %d >=3D %d", slot,
>> +@@ -1468,6 +1470,23 @@ static bool
>> qxl_get_check_slot_offset(PCIQXLDevice *qxl, QXLPHYSICAL pqxl,
>> +                           slot, offset, qxl->guest_slots[slot].size);
>> +         return false;
>> +     }
>> ++    size_available =3D memory_region_size(qxl->guest_slots[slot].mr);
>> ++    if (qxl->guest_slots[slot].offset + offset >=3D size_available) {
>> ++        qxl_set_guest_bug(qxl,
>> ++                          "slot %d offset %"PRIu64" > region size
>> %"PRIu64"\n",
>> ++                          slot, qxl->guest_slots[slot].offset + offset=
,
>> ++                          size_available);
>> ++        return false;
>> ++    }
>> ++    size_available -=3D qxl->guest_slots[slot].offset + offset;
>> ++    if (size_requested > size_available) {
>> ++        qxl_set_guest_bug(qxl,
>> ++                          "slot %d offset %"PRIu64" size %zu: "
>> ++                          "overrun by %"PRIu64" bytes\n",
>> ++                          slot, offset, size_requested,
>> ++                          size_requested - size_available);
>> ++        return false;
>> ++    }
>> +
>> +     *s =3D slot;
>> +     *o =3D offset;
>> +@@ -1486,7 +1505,7 @@ void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICA=
L
>> pqxl, int group_id)
>> +         offset =3D le64_to_cpu(pqxl) & 0xffffffffffff;
>> +         return (void *)(intptr_t)offset;
>> +     case MEMSLOT_GROUP_GUEST:
>> +-        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset)) {
>> ++        if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset,
>> size)) {
>> +             return NULL;
>> +         }
>> +         ptr =3D memory_region_get_ram_ptr(qxl->guest_slots[slot].mr);
>> +@@ -1944,9 +1963,9 @@ static void qxl_dirty_one_surface(PCIQXLDevice
>> *qxl, QXLPHYSICAL pqxl,
>> +     uint32_t slot;
>> +     bool rc;
>> +
>> +-    rc =3D qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset);
>> +-    assert(rc =3D=3D true);
>> +     size =3D (uint64_t)height * abs(stride);
>> ++    rc =3D qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset, size);
>> ++    assert(rc =3D=3D true);
>> +     trace_qxl_surfaces_dirty(qxl->id, offset, size);
>> +     qxl_set_dirty(qxl->guest_slots[slot].mr,
>> +                   qxl->guest_slots[slot].offset + offset,
>> +--
>> +2.25.1
>> +
>> --
>> 2.25.1
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#176506):
> https://lists.openembedded.org/g/openembedded-core/message/176506
> Mute This Topic: https://lists.openembedded.org/mt/96521255/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000e530b805f38a6f15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, Jan 31, 2023 at 8:18 AM Martin Ja=
nsa via <a href=3D"http://lists.openembedded.org">lists.openembedded.org</a=
> &lt;Martin.Jansa=3D<a href=3D"mailto:gmail.com@lists.openembedded.org">gm=
ail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">I=
 haven&#39;t checked yet in dunfell, but in kirkstone this commit merged la=
st week breaks nativesdk-qemu builds.</div></blockquote><div><br></div><div=
>I can confirm it fails the same with this commit from Hitendra in dunfell:=
</div><div><br></div><div>nativesdk-qemu/4.2.0-r0/qemu-4.2.0/hw/display/qxl=
.c:1508:67: error: &#39;size&#39; undeclared (first use in this function); =
did you mean &#39;gsize&#39;?<br>| =C2=A01508 | =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 if (!qxl_get_check_slot_offset(qxl, pqxl, &amp;slot, &amp;offset, size)) {=
<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 gsize<br></div><div><br></div><div>as well as the same backport from=
=C2=A0<span style=3D"color:rgb(51,51,51);font-family:sans-serif;font-size:1=
3.3333px">Bhabu in kirkstone (already merged):</span></div><div><a href=3D"=
https://git.openembedded.org/openembedded-core/commit/?h=3Dkirkstone&amp;id=
=3D4cb3874abf4fdeb04337a48a14c765ba9b2269d4">https://git.openembedded.org/o=
penembedded-core/commit/?h=3Dkirkstone&amp;id=3D4cb3874abf4fdeb04337a48a14c=
765ba9b2269d4</a><span style=3D"color:rgb(51,51,51);font-family:sans-serif;=
font-size:13.3333px"><br></span></div><div><br></div><div>To reproduce this=
 just enable &quot;spice&quot; PACKAGECONFIG in nativesdk-qemu.</div><div><=
br></div><div>Hitendra,=C2=A0<span style=3D"color:rgb(51,51,51);font-family=
:sans-serif;font-size:13.3333px">Bhabu: please have a look.</span><br></div=
><div><span style=3D"color:rgb(51,51,51);font-family:sans-serif;font-size:1=
3.3333px"><br></span></div><div><span style=3D"color:rgb(51,51,51);font-fam=
ily:sans-serif;font-size:13.3333px">Regards,</span></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div><br>=
</div><div>This chunk:</div><div>+@@ -1486,7 +1505,7 @@ void *qxl_phys2virt=
(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id)<br>+=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0offset =3D le64_to_cpu(pqxl) &amp; 0xffffffffffff;<br>+=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (void *)(intptr_t)offset;<br>+=C2=A0 =
=C2=A0 =C2=A0case MEMSLOT_GROUP_GUEST:<br>+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 if =
(!qxl_get_check_slot_offset(qxl, pqxl, &amp;slot, &amp;offset)) {<br>++=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 if (!qxl_get_check_slot_offset(qxl, pqxl, &amp;slo=
t, &amp;offset, size)) {<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0return NULL;<br>+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>+=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ptr =3D memory_region_get_ram_ptr(qxl-&gt;guest_slots[s=
lot].mr);<br></div><div><br></div><div>Uses size parameter which was added =
in previous commit (which wasn&#39;t backported):</div><div><a href=3D"http=
s://gitlab.com/qemu-project/qemu/-/commit/8efec0ef8bbc1e75a7ebf6e325a35806e=
ce9b39f" target=3D"_blank">https://gitlab.com/qemu-project/qemu/-/commit/8e=
fec0ef8bbc1e75a7ebf6e325a35806ece9b39f</a><br></div><div><br></div><div>So =
either both commits need to be backported or this one reworked not to use u=
ndeclared size as it leads to:</div><div><br></div><div>| ../qemu-6.2.0/hw/=
display/qxl.c: In function &#39;qxl_phys2virt&#39;:<br>| ../qemu-6.2.0/hw/d=
isplay/qxl.c:1477:67: error: &#39;size&#39; undeclared (first use in this f=
unction); did you mean &#39;gsize&#39;?<br>| =C2=A01477 | =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (!qxl_get_check_slot_offset(qxl, pqxl, &amp;slot, &amp;offset=
, size)) {<br>| =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~<br>| =C2=A0 =C2=A0 =
=C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 gsize<br></div><div><br></div><div>I&#39;m surprised this=
 wasn&#39;t caught on autobuilder already, maybe it&#39;s triggered only wi=
th extra PACKAGECONFIG options we have enabled:</div><div>PACKAGECONFIG:app=
end:class-nativesdk =3D &quot; virglrenderer epoxy spice libusb usb-redir&q=
uot;<br></div><div><br></div><div>Regards,</div><div><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan =
25, 2023 at 3:42 PM Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" =
target=3D"_blank">steve@sakoman.com</a>&gt; wrote:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">From: Hitendra Prajapati &lt;<a href=3D"=
mailto:hprajapati@mvista.com" target=3D"_blank">hprajapati@mvista.com</a>&g=
t;<br>
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
<br>
<br>
</blockquote></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#176506): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/176506" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/176506</a><br>
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
</blockquote></div></div>

--000000000000e530b805f38a6f15--

