Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E70D8C05027
	for <webhook@archiver.kernel.org>; Tue, 14 Feb 2023 14:31:04 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.8221.1676385063663792368
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Feb 2023 06:31:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HwBm3HjZ;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id g6-20020a05600c310600b003e1f6dff952so1168116wmo.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 06:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n/UloWBThneucvfcHr+4eFT70/XeTpDy7uv79DhTNkM=;
        b=HwBm3HjZFWA1dEpUrkuff+jvNqVHE6fsNC5Fta3lLdEC3veuPdtHef1ES8rYVVNPQ5
         /Tpm24Fxym1urX46gc3zBOu8yQsIi1u9cvc42I6cDluJtkY3kiwrspd5wVqeMtgeoi4c
         ruoRS8R2XNOtl1+qpq8EDPJN8TsV/e5cFeP9Ri0o+2/iMDxp8Wdz5wQqqPDUkAYzcUU3
         vM1W2mb0chHWxCiqsRMyg+gOhHLYQ9Hzgk0jym9n8VqjT/Ds4/10L6AYQGgixqmjA63B
         Pe29D3FL/0THG8oYJ5K6rXU+SCYy70VfgFQeLqppvQAaJhGqv9/0hqp5wW7bJeqpJY1p
         vi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n/UloWBThneucvfcHr+4eFT70/XeTpDy7uv79DhTNkM=;
        b=FHAMLGevBHxiJJAxqSbBarAUzwDWziLfrTthjwcQCTorVsRbzeFEJ/q6qdn+w2/aEr
         M5jtCs16LMRgf5ttfrr+cR1/XOHID8buRpeSmnBQvjvcdRFXa8qXw/pwsWqmuaxZ4enH
         v+7EXSm/pbXWR1tbBLkMzScZ/C2uR2TkD/LeLxIOiwGRCV2Xtj56t02Y3D/TNLCRWSPu
         zjJ5Xt2YnZi/ldOBo00v7hiwH7sWSmEJmAod6B1LFSDXjCtcn/eHnazoPIb3r5JIX6T2
         1+zLQix/Py5BIzzUQfxnpQmFTT3MFBtDhuRCNgU2QqcrrZHiMo7qJ7mXgPcb/gHTRVVl
         G3OQ==
X-Gm-Message-State: AO0yUKU3TIZRsPNigiqQyqEoMPDx+zXnNwqv+uWBjaL5DRXwgs4a2zZS
	DvcpuCDZkoj2tAUmfPyWxzeo8T995cd42fyIFuwECS1cgtA=
X-Google-Smtp-Source: AK7set+yDfGC4PXf/GKBinsDOem3XCTMYuyltclCr2Iv0SdArq1v9X3IPQfuwv8tC8SEJNOjz4q8I0CLC9px0e4eE7o=
X-Received: by 2002:a05:600c:3c8e:b0:3df:fc66:254 with SMTP id
 bg14-20020a05600c3c8e00b003dffc660254mr1689220wmb.2.1676385061128; Tue, 14
 Feb 2023 06:31:01 -0800 (PST)
MIME-Version: 1.0
References: <20230214142235.38975-1-kai.kang@windriver.com>
In-Reply-To: <20230214142235.38975-1-kai.kang@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 14 Feb 2023 15:30:49 +0100
Message-ID: <CA+chaQe7v3SCti7VASE80CcsPaObRk+FXckC5NcVYsrSh5cfCQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] qemu: fix compile error
To: Kai Kang <kai.kang@eng.windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000134e7705f4a9d0aa"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Feb 2023 14:31:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177150

--000000000000134e7705f4a9d0aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Kai,

this should fix what I've reported in:
https://lists.openembedded.org/g/openembedded-core/message/176508

once this is merged, can you please add both oe-core changes (3 qemu
patches) to dunfell as well, so that similar patch is included in both
branches? The broken version wasn't merged to dunfell after my report.

Regards,

On Tue, Feb 14, 2023 at 3:22 PM Kai Kang <kai.kang@eng.windriver.com> wrote=
:

> From: Kai Kang <kai.kang@windriver.com>
>
> Backport 2 patches and rebase
> 0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch to fix
> compile error:
>
> ../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
> ../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared (first
> use in this function); did you mean 'gsize'?
>  1477 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot, &offset,
> size)) {
>       |
>  ^~~~
>       |
>  gsize
> ../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared identifier
> is reported only once for each function it appears in
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  meta/recipes-devtools/qemu/qemu.inc           |   2 +
>  ...ave-qxl_log_command-Return-early-if-.patch |  57 +++++
>  ...ass-requested-buffer-size-to-qxl_phy.patch | 217 ++++++++++++++++++
>  3 files changed, 276 insertions(+)
>  create mode 100644
> meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_command-=
Return-early-if-.patch
>  create mode 100644
> meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buffer=
-size-to-qxl_phy.patch
>
> diff --git a/meta/recipes-devtools/qemu/qemu.inc
> b/meta/recipes-devtools/qemu/qemu.inc
> index b68be447f1..5430718f75 100644
> --- a/meta/recipes-devtools/qemu/qemu.inc
> +++ b/meta/recipes-devtools/qemu/qemu.inc
> @@ -93,6 +93,8 @@ SRC_URI =3D "https://download.qemu.org/${BPN}-${PV}.tar=
.xz
> \
>
> file://0021-target-ppc-implement-xs-n-maddqp-o-xs-n-msubqp-o.patch \
>             file://CVE-2022-3165.patch \
>             file://CVE-2022-4144.patch \
> +
>  file://0001-hw-display-qxl-Have-qxl_log_command-Return-early-if-.patch \
> +
>  file://0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch \
>             "
>  UPSTREAM_CHECK_REGEX =3D "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
>
> diff --git
> a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_comman=
d-Return-early-if-.patch
> b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_comman=
d-Return-early-if-.patch
> new file mode 100644
> index 0000000000..cd846222c9
> --- /dev/null
> +++
> b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_comman=
d-Return-early-if-.patch
> @@ -0,0 +1,57 @@
> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/61c34fc]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +From 61c34fc194b776ecadc39fb26b061331107e5599 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linaro=
.org>
> +Date: Mon, 28 Nov 2022 21:27:37 +0100
> +Subject: [PATCH] hw/display/qxl: Have qxl_log_command Return early if no
> + log_cmd handler
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Only 3 command types are logged: no need to call qxl_phys2virt()
> +for the other types. Using different cases will help to pass
> +different structure sizes to qxl_phys2virt() in a pair of commits.
> +
> +Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> +Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> +Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> +Message-Id: <20221128202741.4945-2-philmd@linaro.org>
> +---
> + hw/display/qxl-logger.c | 11 +++++++++++
> + 1 file changed, 11 insertions(+)
> +
> +diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
> +index 68bfa47568..1bcf803db6 100644
> +--- a/hw/display/qxl-logger.c
> ++++ b/hw/display/qxl-logger.c
> +@@ -247,6 +247,16 @@ int qxl_log_command(PCIQXLDevice *qxl, const char
> *ring, QXLCommandExt *ext)
> +             qxl_name(qxl_type, ext->cmd.type),
> +             compat ? "(compat)" : "");
> +
> ++    switch (ext->cmd.type) {
> ++    case QXL_CMD_DRAW:
> ++        break;
> ++    case QXL_CMD_SURFACE:
> ++        break;
> ++    case QXL_CMD_CURSOR:
> ++        break;
> ++    default:
> ++        goto out;
> ++    }
> +     data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
> +     if (!data) {
> +         return 1;
> +@@ -269,6 +279,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char
> *ring, QXLCommandExt *ext)
> +         qxl_log_cmd_cursor(qxl, data, ext->group_id);
> +         break;
> +     }
> ++out:
> +     fprintf(stderr, "\n");
> +     return 0;
> + }
> +--
> +2.34.1
> +
> diff --git
> a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buff=
er-size-to-qxl_phy.patch
> b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buff=
er-size-to-qxl_phy.patch
> new file mode 100644
> index 0000000000..ac51cf567a
> --- /dev/null
> +++
> b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-buff=
er-size-to-qxl_phy.patch
> @@ -0,0 +1,217 @@
> +Upstream-Status: Backport [https://github.com/qemu/qemu/commit/8efec0e]
> +
> +Backport and rebase patch to fix compile error which imported by
> CVE-2022-4144.patch:
> +
> +../qemu-6.2.0/hw/display/qxl.c: In function 'qxl_phys2virt':
> +../qemu-6.2.0/hw/display/qxl.c:1477:67: error: 'size' undeclared (first
> use in this function); did you mean 'gsize'?
> +       1477 |         if (!qxl_get_check_slot_offset(qxl, pqxl, &slot,
> &offset, size)) {
> +               |
>          ^~~~
> +               |
>          gsize
> +../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared identifier
> is reported only once for each function it appears in
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +
> +From 8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D <philmd@linaro=
.org>
> +Date: Mon, 28 Nov 2022 21:27:39 +0100
> +Subject: [PATCH] hw/display/qxl: Pass requested buffer size to
> qxl_phys2virt()
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=3DUTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Currently qxl_phys2virt() doesn't check for buffer overrun.
> +In order to do so in the next commit, pass the buffer size
> +as argument.
> +
> +For QXLCursor in qxl_render_cursor() -> qxl_cursor() we
> +verify the size of the chunked data ahead, checking we can
> +access 'sizeof(QXLCursor) + chunk->data_size' bytes.
> +Since in the SPICE_CURSOR_TYPE_MONO case the cursor is
> +assumed to fit in one chunk, no change are required.
> +In SPICE_CURSOR_TYPE_ALPHA the ahead read is handled in
> +qxl_unpack_chunks().
> +
> +Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> +Acked-by: Gerd Hoffmann <kraxel@redhat.com>
> +Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> +Message-Id: <20221128202741.4945-4-philmd@linaro.org>
> +---
> + hw/display/qxl-logger.c | 11 ++++++++---
> + hw/display/qxl-render.c | 20 ++++++++++++++++----
> + hw/display/qxl.c        | 14 +++++++++-----
> + hw/display/qxl.h        |  3 ++-
> + 4 files changed, 35 insertions(+), 13 deletions(-)
> +
> +diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
> +index 1bcf803..35c38f6 100644
> +--- a/hw/display/qxl-logger.c
> ++++ b/hw/display/qxl-logger.c
> +@@ -106,7 +106,7 @@ static int qxl_log_image(PCIQXLDevice *qxl,
> QXLPHYSICAL addr, int group_id)
> +     QXLImage *image;
> +     QXLImageDescriptor *desc;
> +
> +-    image =3D qxl_phys2virt(qxl, addr, group_id);
> ++    image =3D qxl_phys2virt(qxl, addr, group_id, sizeof(QXLImage));
> +     if (!image) {
> +         return 1;
> +     }
> +@@ -214,7 +214,8 @@ int qxl_log_cmd_cursor(PCIQXLDevice *qxl,
> QXLCursorCmd *cmd, int group_id)
> +                 cmd->u.set.position.y,
> +                 cmd->u.set.visible ? "yes" : "no",
> +                 cmd->u.set.shape);
> +-        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, group_id);
> ++        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, group_id,
> ++                               sizeof(QXLCursor));
> +         if (!cursor) {
> +             return 1;
> +         }
> +@@ -236,6 +237,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char
> *ring, QXLCommandExt *ext)
> + {
> +     bool compat =3D ext->flags & QXL_COMMAND_FLAG_COMPAT;
> +     void *data;
> ++    size_t datasz;
> +     int ret;
> +
> +     if (!qxl->cmdlog) {
> +@@ -249,15 +251,18 @@ int qxl_log_command(PCIQXLDevice *qxl, const char
> *ring, QXLCommandExt *ext)
> +
> +     switch (ext->cmd.type) {
> +     case QXL_CMD_DRAW:
> ++        datasz =3D compat ? sizeof(QXLCompatDrawable) :
> sizeof(QXLDrawable);
> +         break;
> +     case QXL_CMD_SURFACE:
> ++        datasz =3D sizeof(QXLSurfaceCmd);
> +         break;
> +     case QXL_CMD_CURSOR:
> ++        datasz =3D sizeof(QXLCursorCmd);
> +         break;
> +     default:
> +         goto out;
> +     }
> +-    data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id);
> ++    data =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_id, datasz);
> +     if (!data) {
> +         return 1;
> +     }
> +diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c
> +index ca21700..fcfd40c 100644
> +--- a/hw/display/qxl-render.c
> ++++ b/hw/display/qxl-render.c
> +@@ -107,7 +107,9 @@ static void
> qxl_render_update_area_unlocked(PCIQXLDevice *qxl)
> +         qxl->guest_primary.resized =3D 0;
> +         qxl->guest_primary.data =3D qxl_phys2virt(qxl,
> +
>  qxl->guest_primary.surface.mem,
> +-                                                MEMSLOT_GROUP_GUEST);
> ++                                                MEMSLOT_GROUP_GUEST,
> ++
> qxl->guest_primary.abs_stride
> ++                                                * height);
> +         if (!qxl->guest_primary.data) {
> +             goto end;
> +         }
> +@@ -228,7 +230,8 @@ static void qxl_unpack_chunks(void *dest, size_t
> size, PCIQXLDevice *qxl,
> +         if (offset =3D=3D size) {
> +             return;
> +         }
> +-        chunk =3D qxl_phys2virt(qxl, chunk->next_chunk, group_id);
> ++        chunk =3D qxl_phys2virt(qxl, chunk->next_chunk, group_id,
> ++                              sizeof(QXLDataChunk) + chunk->data_size);
> +         if (!chunk) {
> +             return;
> +         }
> +@@ -295,7 +298,8 @@ fail:
> + /* called from spice server thread context only */
> + int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)
> + {
> +-    QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_=
id);
> ++    QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data, ext->group_=
id,
> ++                                      sizeof(QXLCursorCmd));
> +     QXLCursor *cursor;
> +     QEMUCursor *c;
> +
> +@@ -314,7 +318,15 @@ int qxl_render_cursor(PCIQXLDevice *qxl,
> QXLCommandExt *ext)
> +     }
> +     switch (cmd->type) {
> +     case QXL_CURSOR_SET:
> +-        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id);
> ++        /* First read the QXLCursor to get QXLDataChunk::data_size ... =
*/
> ++        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
> ++                               sizeof(QXLCursor));
> ++        if (!cursor) {
> ++            return 1;
> ++        }
> ++        /* Then read including the chunked data following QXLCursor. */
> ++        cursor =3D qxl_phys2virt(qxl, cmd->u.set.shape, ext->group_id,
> ++                               sizeof(QXLCursor) +
> cursor->chunk.data_size);
> +         if (!cursor) {
> +             return 1;
> +         }
> +diff --git a/hw/display/qxl.c b/hw/display/qxl.c
> +index ae8aa07..2a4b2d4 100644
> +--- a/hw/display/qxl.c
> ++++ b/hw/display/qxl.c
> +@@ -274,7 +274,8 @@ static void
> qxl_spice_monitors_config_async(PCIQXLDevice *qxl, int replay)
> +                                           QXL_IO_MONITORS_CONFIG_ASYNC)=
);
> +     }
> +
> +-    cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_config,
> MEMSLOT_GROUP_GUEST);
> ++    cfg =3D qxl_phys2virt(qxl, qxl->guest_monitors_config,
> MEMSLOT_GROUP_GUEST,
> ++                        sizeof(QXLMonitorsConfig));
> +     if (cfg !=3D NULL && cfg->count =3D=3D 1) {
> +         qxl->guest_primary.resized =3D 1;
> +         qxl->guest_head0_width  =3D cfg->heads[0].width;
> +@@ -459,7 +460,8 @@ static int qxl_track_command(PCIQXLDevice *qxl,
> struct QXLCommandExt *ext)
> +     switch (le32_to_cpu(ext->cmd.type)) {
> +     case QXL_CMD_SURFACE:
> +     {
> +-        QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data,
> ext->group_id);
> ++        QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data,
> ext->group_id,
> ++                                           sizeof(QXLSurfaceCmd));
> +
> +         if (!cmd) {
> +             return 1;
> +@@ -494,7 +496,8 @@ static int qxl_track_command(PCIQXLDevice *qxl,
> struct QXLCommandExt *ext)
> +     }
> +     case QXL_CMD_CURSOR:
> +     {
> +-        QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data,
> ext->group_id);
> ++        QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext->cmd.data,
> ext->group_id,
> ++                                          sizeof(QXLCursorCmd));
> +
> +         if (!cmd) {
> +             return 1;
> +@@ -1463,7 +1466,8 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice
> *qxl, QXLPHYSICAL pqxl,
> + }
> +
> + /* can be also called from spice server thread context */
> +-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id)
> ++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,
> ++                    size_t size)
> + {
> +     uint64_t offset;
> +     uint32_t slot;
> +@@ -1971,7 +1975,7 @@ static void qxl_dirty_surfaces(PCIQXLDevice *qxl)
> +         }
> +
> +         cmd =3D qxl_phys2virt(qxl, qxl->guest_surfaces.cmds[i],
> +-                            MEMSLOT_GROUP_GUEST);
> ++                            MEMSLOT_GROUP_GUEST, sizeof(QXLSurfaceCmd))=
;
> +         assert(cmd);
> +         assert(cmd->type =3D=3D QXL_SURFACE_CMD_CREATE);
> +         qxl_dirty_one_surface(qxl, cmd->u.surface_create.data,
> +diff --git a/hw/display/qxl.h b/hw/display/qxl.h
> +index 30d21f4..4551c23 100644
> +--- a/hw/display/qxl.h
> ++++ b/hw/display/qxl.h
> +@@ -147,7 +147,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)
> + #define QXL_DEFAULT_REVISION (QXL_REVISION_STABLE_V12 + 1)
> +
> + /* qxl.c */
> +-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);
> ++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id,
> ++                    size_t size);
> + void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)
> +     GCC_FMT_ATTR(2, 3);
> +
> +--
> +2.34.1
> +
> --
> 2.17.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#177149):
> https://lists.openembedded.org/g/openembedded-core/message/177149
> Mute This Topic: https://lists.openembedded.org/mt/96960641/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000134e7705f4a9d0aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Kai,<div><br></div><div>this should fix what I&#39;=
ve reported in:</div><div><a href=3D"https://lists.openembedded.org/g/opene=
mbedded-core/message/176508">https://lists.openembedded.org/g/openembedded-=
core/message/176508</a><br></div><div><br></div><div>once this is merged, c=
an you please add both oe-core changes (3 qemu patches) to dunfell as well,=
 so that similar patch is included in both branches? The broken version was=
n&#39;t merged to dunfell after my report.</div><div><br></div><div>Regards=
,</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, Feb 14, 2023 at 3:22 PM Kai Kang &lt;<a href=3D"mailto:kai.k=
ang@eng.windriver.com">kai.kang@eng.windriver.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">From: Kai Kang &lt;<a href=
=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com=
</a>&gt;<br>
<br>
Backport 2 patches and rebase<br>
0001-hw-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch to fix<br>
compile error:<br>
<br>
../qemu-6.2.0/hw/display/qxl.c: In function &#39;qxl_phys2virt&#39;:<br>
../qemu-6.2.0/hw/display/qxl.c:1477:67: error: &#39;size&#39; undeclared (f=
irst use in this function); did you mean &#39;gsize&#39;?<br>
=C2=A01477 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!qxl_get_check_slot_offse=
t(qxl, pqxl, &amp;slot, &amp;offset, size)) {<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~<br>
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gsize<br>
../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared identifier is=
 reported only once for each function it appears in<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/qemu/qemu.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0|=C2=A0 =C2=A02 +<br>
=C2=A0...ave-qxl_log_command-Return-early-if-.patch |=C2=A0 57 +++++<br>
=C2=A0...ass-requested-buffer-size-to-qxl_phy.patch | 217 +++++++++++++++++=
+<br>
=C2=A03 files changed, 276 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-qx=
l-Have-qxl_log_command-Return-early-if-.patch<br>
=C2=A0create mode 100644 meta/recipes-devtools/qemu/qemu/0001-hw-display-qx=
l-Pass-requested-buffer-size-to-qxl_phy.patch<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qe=
mu/qemu.inc<br>
index b68be447f1..5430718f75 100644<br>
--- a/meta/recipes-devtools/qemu/qemu.inc<br>
+++ b/meta/recipes-devtools/qemu/qemu.inc<br>
@@ -93,6 +93,8 @@ SRC_URI =3D &quot;<a href=3D"https://download.qemu.org/$%=
7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">https://dow=
nload.qemu.org/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0021-target-ppc-implement-=
xs-n-maddqp-o-xs-n-msubqp-o.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2022-3165.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2022-4144.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-hw-display-qxl-Have-q=
xl_log_command-Return-early-if-.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-hw-display-qxl-Pass-r=
equested-buffer-size-to-qxl_phy.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
=C2=A0UPSTREAM_CHECK_REGEX =3D &quot;qemu-(?P&lt;pver&gt;\d+(\.\d+)+)\.tar&=
quot;<br>
<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_l=
og_command-Return-early-if-.patch b/meta/recipes-devtools/qemu/qemu/0001-hw=
-display-qxl-Have-qxl_log_command-Return-early-if-.patch<br>
new file mode 100644<br>
index 0000000000..cd846222c9<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Have-qxl_log_comm=
and-Return-early-if-.patch<br>
@@ -0,0 +1,57 @@<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/qemu/qemu/commit/=
61c34fc" rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu/qemu/=
commit/61c34fc</a>]<br>
+<br>
+Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targ=
et=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
+<br>
+From 61c34fc194b776ecadc39fb26b061331107e5599 Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D &lt;<a href=3D"m=
ailto:philmd@linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
+Date: Mon, 28 Nov 2022 21:27:37 +0100<br>
+Subject: [PATCH] hw/display/qxl: Have qxl_log_command Return early if no<b=
r>
+ log_cmd handler<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Only 3 command types are logged: no need to call qxl_phys2virt()<br>
+for the other types. Using different cases will help to pass<br>
+different structure sizes to qxl_phys2virt() in a pair of commits.<br>
+<br>
+Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau=
@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@li=
naro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
+Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" =
target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
+Message-Id: &lt;<a href=3D"mailto:20221128202741.4945-2-philmd@linaro.org"=
 target=3D"_blank">20221128202741.4945-2-philmd@linaro.org</a>&gt;<br>
+---<br>
+ hw/display/qxl-logger.c | 11 +++++++++++<br>
+ 1 file changed, 11 insertions(+)<br>
+<br>
+diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c<br>
+index 68bfa47568..1bcf803db6 100644<br>
+--- a/hw/display/qxl-logger.c<br>
++++ b/hw/display/qxl-logger.c<br>
+@@ -247,6 +247,16 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *ri=
ng, QXLCommandExt *ext)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl_name(qxl_type, ext-&gt=
;cmd.type),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compat ? &quot;(compat)&qu=
ot; : &quot;&quot;);<br>
+ <br>
++=C2=A0 =C2=A0 switch (ext-&gt;cmd.type) {<br>
++=C2=A0 =C2=A0 case QXL_CMD_DRAW:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case QXL_CMD_SURFACE:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 case QXL_CMD_CURSOR:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
++=C2=A0 =C2=A0 default:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0data =3D qxl_phys2virt(qxl, ext-&gt;cmd.data, ext-&gt;=
group_id);<br>
+=C2=A0 =C2=A0 =C2=A0if (!data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+@@ -269,6 +279,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *rin=
g, QXLCommandExt *ext)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl_log_cmd_cursor(qxl, data, ext-&gt;gr=
oup_id);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
++out:<br>
+=C2=A0 =C2=A0 =C2=A0fprintf(stderr, &quot;\n&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0return 0;<br>
+ }<br>
+-- <br>
+2.34.1<br>
+<br>
diff --git a/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-reque=
sted-buffer-size-to-qxl_phy.patch b/meta/recipes-devtools/qemu/qemu/0001-hw=
-display-qxl-Pass-requested-buffer-size-to-qxl_phy.patch<br>
new file mode 100644<br>
index 0000000000..ac51cf567a<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/qemu/qemu/0001-hw-display-qxl-Pass-requested-bu=
ffer-size-to-qxl_phy.patch<br>
@@ -0,0 +1,217 @@<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/qemu/qemu/commit/=
8efec0e" rel=3D"noreferrer" target=3D"_blank">https://github.com/qemu/qemu/=
commit/8efec0e</a>]<br>
+<br>
+Backport and rebase patch to fix compile error which imported by CVE-2022-=
4144.patch:<br>
+<br>
+../qemu-6.2.0/hw/display/qxl.c: In function &#39;qxl_phys2virt&#39;:<br>
+../qemu-6.2.0/hw/display/qxl.c:1477:67: error: &#39;size&#39; undeclared (=
first use in this function); did you mean &#39;gsize&#39;?<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A01477 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!qx=
l_get_check_slot_offset(qxl, pqxl, &amp;slot, &amp;offset, size)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~=
~~<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gs=
ize<br>
+../qemu-6.2.0/hw/display/qxl.c:1477:67: note: each undeclared identifier i=
s reported only once for each function it appears in<br>
+<br>
+Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targ=
et=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
+<br>
+From 8efec0ef8bbc1e75a7ebf6e325a35806ece9b39f Mon Sep 17 00:00:00 2001<br>
+From: =3D?UTF-8?q?Philippe=3D20Mathieu-Daud=3DC3=3DA9?=3D &lt;<a href=3D"m=
ailto:philmd@linaro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
+Date: Mon, 28 Nov 2022 21:27:39 +0100<br>
+Subject: [PATCH] hw/display/qxl: Pass requested buffer size to qxl_phys2vi=
rt()<br>
+MIME-Version: 1.0<br>
+Content-Type: text/plain; charset=3DUTF-8<br>
+Content-Transfer-Encoding: 8bit<br>
+<br>
+Currently qxl_phys2virt() doesn&#39;t check for buffer overrun.<br>
+In order to do so in the next commit, pass the buffer size<br>
+as argument.<br>
+<br>
+For QXLCursor in qxl_render_cursor() -&gt; qxl_cursor() we<br>
+verify the size of the chunked data ahead, checking we can<br>
+access &#39;sizeof(QXLCursor) + chunk-&gt;data_size&#39; bytes.<br>
+Since in the SPICE_CURSOR_TYPE_MONO case the cursor is<br>
+assumed to fit in one chunk, no change are required.<br>
+In SPICE_CURSOR_TYPE_ALPHA the ahead read is handled in<br>
+qxl_unpack_chunks().<br>
+<br>
+Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@li=
naro.org" target=3D"_blank">philmd@linaro.org</a>&gt;<br>
+Acked-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" target=3D=
"_blank">kraxel@redhat.com</a>&gt;<br>
+Signed-off-by: Stefan Hajnoczi &lt;<a href=3D"mailto:stefanha@redhat.com" =
target=3D"_blank">stefanha@redhat.com</a>&gt;<br>
+Message-Id: &lt;<a href=3D"mailto:20221128202741.4945-4-philmd@linaro.org"=
 target=3D"_blank">20221128202741.4945-4-philmd@linaro.org</a>&gt;<br>
+---<br>
+ hw/display/qxl-logger.c | 11 ++++++++---<br>
+ hw/display/qxl-render.c | 20 ++++++++++++++++----<br>
+ hw/display/qxl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 14 +++++++++-----<br>
+ hw/display/qxl.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 ++-<br>
+ 4 files changed, 35 insertions(+), 13 deletions(-)<br>
+<br>
+diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c<br>
+index 1bcf803..35c38f6 100644<br>
+--- a/hw/display/qxl-logger.c<br>
++++ b/hw/display/qxl-logger.c<br>
+@@ -106,7 +106,7 @@ static int qxl_log_image(PCIQXLDevice *qxl, QXLPHYSICA=
L addr, int group_id)<br>
+=C2=A0 =C2=A0 =C2=A0QXLImage *image;<br>
+=C2=A0 =C2=A0 =C2=A0QXLImageDescriptor *desc;<br>
+ <br>
+-=C2=A0 =C2=A0 image =3D qxl_phys2virt(qxl, addr, group_id);<br>
++=C2=A0 =C2=A0 image =3D qxl_phys2virt(qxl, addr, group_id, sizeof(QXLImag=
e));<br>
+=C2=A0 =C2=A0 =C2=A0if (!image) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+@@ -214,7 +214,8 @@ int qxl_log_cmd_cursor(PCIQXLDevice *qxl, QXLCursorCmd=
 *cmd, int group_id)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;u.se=
t.position.y,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;u.se=
t.visible ? &quot;yes&quot; : &quot;no&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd-&gt;u.se=
t.shape);<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd-&gt;u.set.s=
hape, group_id);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd-&gt;u.set.s=
hape, group_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(QXLCursor));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cursor) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -236,6 +237,7 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *rin=
g, QXLCommandExt *ext)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0bool compat =3D ext-&gt;flags &amp; QXL_COMMAND_FLAG_C=
OMPAT;<br>
+=C2=A0 =C2=A0 =C2=A0void *data;<br>
++=C2=A0 =C2=A0 size_t datasz;<br>
+=C2=A0 =C2=A0 =C2=A0int ret;<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (!qxl-&gt;cmdlog) {<br>
+@@ -249,15 +251,18 @@ int qxl_log_command(PCIQXLDevice *qxl, const char *r=
ing, QXLCommandExt *ext)<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0switch (ext-&gt;cmd.type) {<br>
+=C2=A0 =C2=A0 =C2=A0case QXL_CMD_DRAW:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 datasz =3D compat ? sizeof(QXLCompatDrawable)=
 : sizeof(QXLDrawable);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0case QXL_CMD_SURFACE:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 datasz =3D sizeof(QXLSurfaceCmd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0case QXL_CMD_CURSOR:<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 datasz =3D sizeof(QXLCursorCmd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 data =3D qxl_phys2virt(qxl, ext-&gt;cmd.data, ext-&gt;group=
_id);<br>
++=C2=A0 =C2=A0 data =3D qxl_phys2virt(qxl, ext-&gt;cmd.data, ext-&gt;group=
_id, datasz);<br>
+=C2=A0 =C2=A0 =C2=A0if (!data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/hw/display/qxl-render.c b/hw/display/qxl-render.c<br>
+index ca21700..fcfd40c 100644<br>
+--- a/hw/display/qxl-render.c<br>
++++ b/hw/display/qxl-render.c<br>
+@@ -107,7 +107,9 @@ static void qxl_render_update_area_unlocked(PCIQXLDevi=
ce *qxl)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl-&gt;guest_primary.resized =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl-&gt;guest_primary.data =3D qxl_phys2=
virt(qxl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0qxl-&gt;guest_primary.surface.mem,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 MEMSLOT_GROUP_GUEST);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 MEMSLOT_GROUP_GUEST,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 qxl-&gt;guest_primary.abs_stride<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 * height);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!qxl-&gt;guest_primary.data) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto end;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -228,7 +230,8 @@ static void qxl_unpack_chunks(void *dest, size_t size,=
 PCIQXLDevice *qxl,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (offset =3D=3D size) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk =3D qxl_phys2virt(qxl, chunk-&gt;next_c=
hunk, group_id);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 chunk =3D qxl_phys2virt(qxl, chunk-&gt;next_c=
hunk, group_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(QXLDataChunk) + chunk-&gt;data_size)=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!chunk) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -295,7 +298,8 @@ fail:<br>
+ /* called from spice server thread context only */<br>
+ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandExt *ext)<br>
+ {<br>
+-=C2=A0 =C2=A0 QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext-&gt;cmd.data, =
ext-&gt;group_id);<br>
++=C2=A0 =C2=A0 QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext-&gt;cmd.data, =
ext-&gt;group_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sizeof(QXLCurso=
rCmd));<br>
+=C2=A0 =C2=A0 =C2=A0QXLCursor *cursor;<br>
+=C2=A0 =C2=A0 =C2=A0QEMUCursor *c;<br>
+ <br>
+@@ -314,7 +318,15 @@ int qxl_render_cursor(PCIQXLDevice *qxl, QXLCommandEx=
t *ext)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0switch (cmd-&gt;type) {<br>
+=C2=A0 =C2=A0 =C2=A0case QXL_CURSOR_SET:<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd-&gt;u.set.s=
hape, ext-&gt;group_id);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* First read the QXLCursor to get QXLDataChu=
nk::data_size ... */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd-&gt;u.set.s=
hape, ext-&gt;group_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(QXLCursor));<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!cursor) {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 1;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Then read including the chunked data follo=
wing QXLCursor. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 cursor =3D qxl_phys2virt(qxl, cmd-&gt;u.set.s=
hape, ext-&gt;group_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sizeof(QXLCursor) + cursor-&gt;chunk.=
data_size);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cursor) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+diff --git a/hw/display/qxl.c b/hw/display/qxl.c<br>
+index ae8aa07..2a4b2d4 100644<br>
+--- a/hw/display/qxl.c<br>
++++ b/hw/display/qxl.c<br>
+@@ -274,7 +274,8 @@ static void qxl_spice_monitors_config_async(PCIQXLDevi=
ce *qxl, int replay)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0QXL_IO_MONITORS_CONFIG_ASYNC));<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+-=C2=A0 =C2=A0 cfg =3D qxl_phys2virt(qxl, qxl-&gt;guest_monitors_config, M=
EMSLOT_GROUP_GUEST);<br>
++=C2=A0 =C2=A0 cfg =3D qxl_phys2virt(qxl, qxl-&gt;guest_monitors_config, M=
EMSLOT_GROUP_GUEST,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 sizeof(QXLMonitorsConfig));<br>
+=C2=A0 =C2=A0 =C2=A0if (cfg !=3D NULL &amp;&amp; cfg-&gt;count =3D=3D 1) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl-&gt;guest_primary.resized =3D 1;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl-&gt;guest_head0_width=C2=A0 =3D cfg-=
&gt;heads[0].width;<br>
+@@ -459,7 +460,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, struct=
 QXLCommandExt *ext)<br>
+=C2=A0 =C2=A0 =C2=A0switch (le32_to_cpu(ext-&gt;cmd.type)) {<br>
+=C2=A0 =C2=A0 =C2=A0case QXL_CMD_SURFACE:<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext=
-&gt;cmd.data, ext-&gt;group_id);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 QXLSurfaceCmd *cmd =3D qxl_phys2virt(qxl, ext=
-&gt;cmd.data, ext-&gt;group_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0sizeof(QXLSurfaceCmd));<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+@@ -494,7 +496,8 @@ static int qxl_track_command(PCIQXLDevice *qxl, struct=
 QXLCommandExt *ext)<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0case QXL_CMD_CURSOR:<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext-=
&gt;cmd.data, ext-&gt;group_id);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 QXLCursorCmd *cmd =3D qxl_phys2virt(qxl, ext-=
&gt;cmd.data, ext-&gt;group_id,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s=
izeof(QXLCursorCmd));<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!cmd) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 1;<br>
+@@ -1463,7 +1466,8 @@ static bool qxl_get_check_slot_offset(PCIQXLDevice *=
qxl, QXLPHYSICAL pqxl,<br>
+ }<br>
+ <br>
+ /* can be also called from spice server thread context */<br>
+-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id)<br=
>
++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL pqxl, int group_id,<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 siz=
e_t size)<br>
+ {<br>
+=C2=A0 =C2=A0 =C2=A0uint64_t offset;<br>
+=C2=A0 =C2=A0 =C2=A0uint32_t slot;<br>
+@@ -1971,7 +1975,7 @@ static void qxl_dirty_surfaces(PCIQXLDevice *qxl)<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cmd =3D qxl_phys2virt(qxl, qxl-&gt;guest=
_surfaces.cmds[i],<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 MEMSLOT_GROUP_GUEST);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 MEMSLOT_GROUP_GUEST, sizeof(QXLSurfaceCmd));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(cmd);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0assert(cmd-&gt;type =3D=3D QXL_SURFACE_C=
MD_CREATE);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qxl_dirty_one_surface(qxl, cmd-&gt;u.sur=
face_create.data,<br>
+diff --git a/hw/display/qxl.h b/hw/display/qxl.h<br>
+index 30d21f4..4551c23 100644<br>
+--- a/hw/display/qxl.h<br>
++++ b/hw/display/qxl.h<br>
+@@ -147,7 +147,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(PCIQXLDevice, PCI_QXL)<br>
+ #define QXL_DEFAULT_REVISION (QXL_REVISION_STABLE_V12 + 1)<br>
+ <br>
+ /* qxl.c */<br>
+-void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id);<b=
r>
++void *qxl_phys2virt(PCIQXLDevice *qxl, QXLPHYSICAL phys, int group_id,<br=
>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 siz=
e_t size);<br>
+ void qxl_set_guest_bug(PCIQXLDevice *qxl, const char *msg, ...)<br>
+=C2=A0 =C2=A0 =C2=A0GCC_FMT_ATTR(2, 3);<br>
+ <br>
+-- <br>
+2.34.1<br>
+<br>
-- <br>
2.17.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#177149): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/177149" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/177149</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/96960641/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/96960641/3617156</a><br>
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

--000000000000134e7705f4a9d0aa--

