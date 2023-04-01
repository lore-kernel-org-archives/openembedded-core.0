Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A89EC6FD1D
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 18:57:10 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web11.28798.1680375424602166985
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 11:57:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hmtLe3wI;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id q27so18323380oiw.0
        for <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 11:57:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680375424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDT6g8HIg4sDl1JD90QMS8NeoXZerNlVQJ+aiZe3ENE=;
        b=hmtLe3wIFGqf/nG7W0y1YPl5bfFo8uscxRaYjDn01wNdGK3ZjEllDoqUQ8ezTK5TUi
         1vSDCkKIncFz/ZQngAb/GnwW8Kf1ivpOgy9sk4TBpr7+O5R8Wn3OwXW89UDzT9FJtPmM
         91We2MDxC5JWm97Ugj9p1hd5Dzc8gPAteIAf6LpAHTKGnpNkhLUiS5SjjaH5NO7Yctrw
         GhO+jK1egRksedVVSUup6pX3RSvOr03Oc0R81F/TZiYVpcJkvp77lEqqxCIUpXP/9Fbr
         tdCk2bZDfTa+CYE0niObvkzcoV0wlAabg8u72jXrJICthRx2QUJMKi+qXTIHrlb66O5i
         kPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680375424;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zDT6g8HIg4sDl1JD90QMS8NeoXZerNlVQJ+aiZe3ENE=;
        b=lzACn6wtKg6BuxH7aGFCw9ps4LuSH+4Q1ElUwP/ZepILxwuYOKKwDzkp/ZYFXUsljO
         S7keYsjmWDgsd8/8bl40gTWakniTpWYdl9lXydwIHb12sxzh4HSyEpijZEXadfFCOaYM
         1B/koRp72v/tqGrTU2AGrAZqzFAWiDvOL7q/mPesdBJBtBLCE7I/ma3gFXzwHlxxGR8r
         QHphbmHKss1pvehq/gi3UWjOui7kFx2IiKe2m7ORVebYkX1+ZxAUemycAHf9r7SbJZIs
         iC3hZImRzF5J1pXn87wS9957cfj5TU0j1+9OYwLdnt5V9XjyqVorJF9kHyGbQN/1Qwqn
         k51Q==
X-Gm-Message-State: AO0yUKWrFrlhJB8bEh5rJxkfVf9daXBWIhvt69qMxqRxqOCSmVtehO6/
	9bgyJxoLOq9nljdrL9tE8OxR2VZTa9ZqlfbhHno=
X-Google-Smtp-Source: AK7set+3GfnlEUQc4lzkrlVnhXNODkMnH/XKxfUhktW0g7+Vyv0AFPagpBbOTUslqbzBb3gN7IN0ChKpzLbVxivO2Xg=
X-Received: by 2002:aca:d7c1:0:b0:387:13ea:721a with SMTP id
 o184-20020acad7c1000000b0038713ea721amr9059406oig.4.1680375423587; Sat, 01
 Apr 2023 11:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230331052636.978578-1-alex@linutronix.de>
In-Reply-To: <20230331052636.978578-1-alex@linutronix.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 1 Apr 2023 11:56:37 -0700
Message-ID: <CAMKF1sonrntA3pKS3M=2U9VCNtM9acmGywy7DFnbHMKfokFVdw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/7] ffmpeg: update 5.1.2 -> 6.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 18:57:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179470

I think mpv is failing to this upgrade, this issue talks about it
https://github.com/mpv-player/mpv/issues/9803
https://errors.yoctoproject.org/Errors/Details/699341/
This is a arm64/musl build.

On Thu, Mar 30, 2023 at 10:26=E2=80=AFPM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> Add a patch to gstreamer1.0-libav to address an API compatibility fail.
>
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  ...c-stop-accessing-out-of-bounds-frame.patch |  89 ---------------
>  ...c-stop-accessing-out-of-bounds-frame.patch | 108 ------------------
>  .../ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch     |  34 ------
>  .../ffmpeg/{ffmpeg_5.1.2.bb =3D> ffmpeg_6.0.bb} |   8 +-
>  .../gstreamer1.0-libav/ffmpeg-6.0.patch       |  49 ++++++++
>  .../gstreamer/gstreamer1.0-libav_1.22.0.bb    |   4 +-
>  6 files changed, 54 insertions(+), 238 deletions(-)
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rp=
zaenc-stop-accessing-out-of-bounds-frame.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-sm=
cenc-stop-accessing-out-of-bounds-frame.patch
>  delete mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulk=
an.patch
>  rename meta/recipes-multimedia/ffmpeg/{ffmpeg_5.1.2.bb =3D> ffmpeg_6.0.b=
b} (95%)
>  create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/=
ffmpeg-6.0.patch
>
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-s=
top-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ff=
mpeg/0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-frame.patch
> deleted file mode 100644
> index 2775a81cc86..00000000000
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-rpzaenc-stop-acc=
essing-out-of-bounds-frame.patch
> +++ /dev/null
> @@ -1,89 +0,0 @@
> -From 92f9b28ed84a77138105475beba16c146bdaf984 Mon Sep 17 00:00:00 2001
> -From: Paul B Mahol <onemda@gmail.com>
> -Date: Sat, 12 Nov 2022 16:12:00 +0100
> -Subject: [PATCH] avcodec/rpzaenc: stop accessing out of bounds frame
> -
> -Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/92f9b=
28ed84a77138105475beba16c146bdaf984]
> -
> -Signed-off-by: <narpat.mali@windriver.com>
> -
> ----
> - libavcodec/rpzaenc.c | 22 +++++++++++++++-------
> - 1 file changed, 15 insertions(+), 7 deletions(-)
> -
> -diff --git a/libavcodec/rpzaenc.c b/libavcodec/rpzaenc.c
> -index d710eb4f82..4ced9523e2 100644
> ---- a/libavcodec/rpzaenc.c
> -+++ b/libavcodec/rpzaenc.c
> -@@ -205,7 +205,7 @@ static void get_max_component_diff(const BlockInfo *=
bi, const uint16_t *block_pt
> -
> -     // loop thru and compare pixels
> -     for (y =3D 0; y < bi->block_height; y++) {
> --        for (x =3D 0; x < bi->block_width; x++){
> -+        for (x =3D 0; x < bi->block_width; x++) {
> -             // TODO:  optimize
> -             min_r =3D FFMIN(R(block_ptr[x]), min_r);
> -             min_g =3D FFMIN(G(block_ptr[x]), min_g);
> -@@ -278,7 +278,7 @@ static int leastsquares(const uint16_t *block_ptr, c=
onst BlockInfo *bi,
> -         return -1;
> -
> -     for (i =3D 0; i < bi->block_height; i++) {
> --        for (j =3D 0; j < bi->block_width; j++){
> -+        for (j =3D 0; j < bi->block_width; j++) {
> -             x =3D GET_CHAN(block_ptr[j], xchannel);
> -             y =3D GET_CHAN(block_ptr[j], ychannel);
> -             sumx +=3D x;
> -@@ -325,7 +325,7 @@ static int calc_lsq_max_fit_error(const uint16_t *bl=
ock_ptr, const BlockInfo *bi
> -     int max_err =3D 0;
> -
> -     for (i =3D 0; i < bi->block_height; i++) {
> --        for (j =3D 0; j < bi->block_width; j++){
> -+        for (j =3D 0; j < bi->block_width; j++) {
> -             int x_inc, lin_y, lin_x;
> -             x =3D GET_CHAN(block_ptr[j], xchannel);
> -             y =3D GET_CHAN(block_ptr[j], ychannel);
> -@@ -420,7 +420,9 @@ static void update_block_in_prev_frame(const uint16_=
t *src_pixels,
> -                                        uint16_t *dest_pixels,
> -                                        const BlockInfo *bi, int block_c=
ounter)
> - {
> --    for (int y =3D 0; y < 4; y++) {
> -+    const int y_size =3D FFMIN(4, bi->image_height - bi->row * 4);
> -+
> -+    for (int y =3D 0; y < y_size; y++) {
> -         memcpy(dest_pixels, src_pixels, 8);
> -         dest_pixels +=3D bi->rowstride;
> -         src_pixels +=3D bi->rowstride;
> -@@ -730,14 +732,15 @@ post_skip :
> -
> -             if (err > s->sixteen_color_thresh) { // DO SIXTEEN COLOR BL=
OCK
> -                 uint16_t *row_ptr;
> --                int rgb555;
> -+                int y_size, rgb555;
> -
> -                 block_offset =3D get_block_info(&bi, block_counter);
> -
> -                 row_ptr =3D &src_pixels[block_offset];
> -+                y_size =3D FFMIN(4, bi.image_height - bi.row * 4);
> -
> --                for (int y =3D 0; y < 4; y++) {
> --                    for (int x =3D 0; x < 4; x++){
> -+                for (int y =3D 0; y < y_size; y++) {
> -+                    for (int x =3D 0; x < 4; x++) {
> -                         rgb555 =3D row_ptr[x] & ~0x8000;
> -
> -                         put_bits(&s->pb, 16, rgb555);
> -@@ -745,6 +748,11 @@ post_skip :
> -                     row_ptr +=3D bi.rowstride;
> -                 }
> -
> -+                for (int y =3D y_size; y < 4; y++) {
> -+                    for (int x =3D 0; x < 4; x++)
> -+                        put_bits(&s->pb, 16, 0);
> -+                }
> -+
> -                 block_counter++;
> -             } else { // FOUR COLOR BLOCK
> -                 block_counter +=3D encode_four_color_block(min_color, m=
ax_color,
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-st=
op-accessing-out-of-bounds-frame.patch b/meta/recipes-multimedia/ffmpeg/ffm=
peg/0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame.patch
> deleted file mode 100644
> index 923fc6a9c1b..00000000000
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avcodec-smcenc-stop-acce=
ssing-out-of-bounds-frame.patch
> +++ /dev/null
> @@ -1,108 +0,0 @@
> -From 13c13109759090b7f7182480d075e13b36ed8edd Mon Sep 17 00:00:00 2001
> -From: Paul B Mahol <onemda@gmail.com>
> -Date: Sat, 12 Nov 2022 15:19:21 +0100
> -Subject: [PATCH] avcodec/smcenc: stop accessing out of bounds frame
> -
> -Upstream-Status: Backport [https://github.com/FFmpeg/FFmpeg/commit/13c13=
109759090b7f7182480d075e13b36ed8edd]
> -
> -Signed-off-by: <narpat.mali@windriver.com>
> -
> ----
> - libavcodec/smcenc.c | 18 ++++++++++++++----
> - 1 file changed, 14 insertions(+), 4 deletions(-)
> -
> -diff --git a/libavcodec/smcenc.c b/libavcodec/smcenc.c
> -index f3d26a4e8d..33549b8ab4 100644
> ---- a/libavcodec/smcenc.c
> -+++ b/libavcodec/smcenc.c
> -@@ -61,6 +61,7 @@ typedef struct SMCContext {
> -         { \
> -             row_ptr +=3D stride * 4; \
> -             pixel_ptr =3D row_ptr; \
> -+            cur_y +=3D 4; \
> -         } \
> -     } \
> - }
> -@@ -117,6 +118,7 @@ static void smc_encode_stream(SMCContext *s, const A=
VFrame *frame,
> -     const uint8_t *prev_pixels =3D (const uint8_t *)s->prev_frame->data=
[0];
> -     uint8_t *distinct_values =3D s->distinct_values;
> -     const uint8_t *pixel_ptr, *row_ptr;
> -+    const int height =3D frame->height;
> -     const int width =3D frame->width;
> -     uint8_t block_values[16];
> -     int block_counter =3D 0;
> -@@ -125,13 +127,14 @@ static void smc_encode_stream(SMCContext *s, const=
 AVFrame *frame,
> -     int color_octet_index =3D 0;
> -     int color_table_index;  /* indexes to color pair, quad, or octet ta=
bles */
> -     int total_blocks;
> -+    int cur_y =3D 0;
> -
> -     memset(s->color_pairs, 0, sizeof(s->color_pairs));
> -     memset(s->color_quads, 0, sizeof(s->color_quads));
> -     memset(s->color_octets, 0, sizeof(s->color_octets));
> -
> -     /* Number of 4x4 blocks in frame. */
> --    total_blocks =3D ((frame->width + 3) / 4) * ((frame->height + 3) / =
4);
> -+    total_blocks =3D ((width + 3) / 4) * ((height + 3) / 4);
> -
> -     pixel_ptr =3D row_ptr =3D src_pixels;
> -
> -@@ -145,11 +148,13 @@ static void smc_encode_stream(SMCContext *s, const=
 AVFrame *frame,
> -         int cache_index;
> -         int distinct =3D 0;
> -         int blocks =3D 0;
> -+        int frame_y =3D cur_y;
> -
> -         while (prev_pixels && s->key_frame =3D=3D 0 && block_counter + =
inter_skip_blocks < total_blocks) {
> -+            const int y_size =3D FFMIN(4, height - cur_y);
> -             int compare =3D 0;
> -
> --            for (int y =3D 0; y < 4; y++) {
> -+            for (int y =3D 0; y < y_size; y++) {
> -                 const ptrdiff_t offset =3D pixel_ptr - src_pixels;
> -                 const uint8_t *prev_pixel_ptr =3D prev_pixels + offset;
> -
> -@@ -170,8 +175,10 @@ static void smc_encode_stream(SMCContext *s, const =
AVFrame *frame,
> -
> -         pixel_ptr =3D xpixel_ptr;
> -         row_ptr =3D xrow_ptr;
> -+        cur_y =3D frame_y;
> -
> -         while (block_counter > 0 && block_counter + intra_skip_blocks <=
 total_blocks) {
> -+            const int y_size =3D FFMIN(4, height - cur_y);
> -             const ptrdiff_t offset =3D pixel_ptr - src_pixels;
> -             const int sy =3D offset / stride;
> -             const int sx =3D offset % stride;
> -@@ -180,7 +187,7 @@ static void smc_encode_stream(SMCContext *s, const A=
VFrame *frame,
> -             const uint8_t *old_pixel_ptr =3D src_pixels + nx + ny * str=
ide;
> -             int compare =3D 0;
> -
> --            for (int y =3D 0; y < 4; y++) {
> -+            for (int y =3D 0; y < y_size; y++) {
> -                 compare |=3D memcmp(old_pixel_ptr + y * stride, pixel_p=
tr + y * stride, 4);
> -                 if (compare)
> -                     break;
> -@@ -197,9 +204,11 @@ static void smc_encode_stream(SMCContext *s, const =
AVFrame *frame,
> -
> -         pixel_ptr =3D xpixel_ptr;
> -         row_ptr =3D xrow_ptr;
> -+        cur_y =3D frame_y;
> -
> -         while (block_counter + coded_blocks < total_blocks && coded_blo=
cks < 256) {
> --            for (int y =3D 0; y < 4; y++)
> -+            const int y_size =3D FFMIN(4, height - cur_y);
> -+            for (int y =3D 0; y < y_size; y++)
> -                 memcpy(block_values + y * 4, pixel_ptr + y * stride, 4)=
;
> -
> -             qsort(block_values, 16, sizeof(block_values[0]), smc_cmp_va=
lues);
> -@@ -224,6 +233,7 @@ static void smc_encode_stream(SMCContext *s, const A=
VFrame *frame,
> -
> -         pixel_ptr =3D xpixel_ptr;
> -         row_ptr =3D xrow_ptr;
> -+        cur_y =3D frame_y;
> -
> -         blocks =3D coded_blocks;
> -         distinct =3D coded_distinct;
> ---
> -2.34.1
> -
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patc=
h b/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
> deleted file mode 100644
> index 95bd608a277..00000000000
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg/ffmpeg-fix-vulkan.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -From: Lynne <dev@lynne.ee>
> -Date: Sun, 25 Dec 2022 00:03:30 +0000 (+0100)
> -Subject: hwcontext_vulkan: remove optional encode/decode extensions from=
 the list
> -X-Git-Url: http://git.ffmpeg.org/gitweb/ffmpeg.git/commitdiff_plain/eb04=
55d64690
> -
> -hwcontext_vulkan: remove optional encode/decode extensions from the list
> -
> -They're not currently used, so they don't need to be there.
> -Vulkan stabilized the decode extensions less than a week ago, and their
> -name prefixes were changed from EXT to KHR. It's a bit too soon to be
> -depending on it, so rather than bumping, just remove these for now.
> -
> -Upstream-Status: Backport [https://git.ffmpeg.org/gitweb/ffmpeg.git/comm=
itdiff_plain/eb0455d64690]
> ----
> -
> -diff --git a/libavutil/hwcontext_vulkan.c b/libavutil/hwcontext_vulkan.c
> -index f1db1c7291..2a9b5f4aac 100644
> ---- a/libavutil/hwcontext_vulkan.c
> -+++ b/libavutil/hwcontext_vulkan.c
> -@@ -358,14 +358,6 @@ static const VulkanOptExtension optional_device_ext=
s[] =3D {
> -     { VK_KHR_EXTERNAL_MEMORY_WIN32_EXTENSION_NAME,            FF_VK_EXT=
_EXTERNAL_WIN32_MEMORY  },
> -     { VK_KHR_EXTERNAL_SEMAPHORE_WIN32_EXTENSION_NAME,         FF_VK_EXT=
_EXTERNAL_WIN32_SEM     },
> - #endif
> --
> --    /* Video encoding/decoding */
> --    { VK_KHR_VIDEO_QUEUE_EXTENSION_NAME,                      FF_VK_EXT=
_NO_FLAG                },
> --    { VK_KHR_VIDEO_DECODE_QUEUE_EXTENSION_NAME,               FF_VK_EXT=
_NO_FLAG                },
> --    { VK_KHR_VIDEO_ENCODE_QUEUE_EXTENSION_NAME,               FF_VK_EXT=
_NO_FLAG                },
> --    { VK_EXT_VIDEO_ENCODE_H264_EXTENSION_NAME,                FF_VK_EXT=
_NO_FLAG                },
> --    { VK_EXT_VIDEO_DECODE_H264_EXTENSION_NAME,                FF_VK_EXT=
_NO_FLAG                },
> --    { VK_EXT_VIDEO_DECODE_H265_EXTENSION_NAME,                FF_VK_EXT=
_NO_FLAG                },
> - };
> -
> - /* Converts return values to strings */
> diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb b/meta/recipe=
s-multimedia/ffmpeg/ffmpeg_6.0.bb
> similarity index 95%
> rename from meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
> rename to meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
> index cccd9f65abf..e4a4a0effa1 100644
> --- a/meta/recipes-multimedia/ffmpeg/ffmpeg_5.1.2.bb
> +++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_6.0.bb
> @@ -22,13 +22,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING.GPLv2;md5=3Db234e=
e4d69f5fce4486a80fdaf4a4263 \
>                      file://COPYING.LGPLv2.1;md5=3Dbd7a443320af8c812e4c18=
d1b79df004 \
>                      file://COPYING.LGPLv3;md5=3De6a600fd5e1d9cbde2d98368=
0233ad02"
>
> -SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz \
> -           file://0001-avcodec-rpzaenc-stop-accessing-out-of-bounds-fram=
e.patch \
> -           file://0001-avcodec-smcenc-stop-accessing-out-of-bounds-frame=
.patch \
> -           file://ffmpeg-fix-vulkan.patch \
> -           "
> +SRC_URI =3D "https://www.ffmpeg.org/releases/${BP}.tar.xz"
>
> -SRC_URI[sha256sum] =3D "619e706d662c8420859832ddc259cd4d4096a48a2ce1eefd=
052db9e440eef3dc"
> +SRC_URI[sha256sum] =3D "57be87c22d9b49c112b6d24bc67d42508660e6b718b3db89=
c44e47e289137082"
>
>  # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/s=
how_bug.cgi?id=3D7717
>  ARM_INSTRUCTION_SET:armv4 =3D "arm"
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpeg-=
6.0.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpeg-6.0=
.patch
> new file mode 100644
> index 00000000000..0a06540fb47
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav/ffmpeg-6.0.pat=
ch
> @@ -0,0 +1,49 @@
> +From cde31d23c071ee93fae96331805f696856084254 Mon Sep 17 00:00:00 2001
> +From: "U. Artie Eoff" <ullysses.a.eoff@intel.com>
> +Date: Mon, 13 Feb 2023 17:02:01 -0500
> +Subject: [PATCH] avviddec: change
> + AV_CODEC_CAP_AUTO_THREADS->AV_CODEC_CAP_OTHER_THREADS
> +
> +This fixes a compile error with recent upstream FFmpeg.
> +
> +The AV_CODEC_CAP_AUTO_THREADS was deprecated and renamed to
> +AV_CODEC_CAP_OTHER_THREADS in FFmpeg upstream commit
> +7d09579190de (lavc 58.132.100).
> +
> +The AV_CODEC_CAP_AUTO_THREADS was finally removed in FFmpeg upstream
> +commit 10c9a0874cb3 (lavc 59.63.100).
> +
> +Part-of: <https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_req=
uests/3964>
> +
> +Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstr=
eamer/-/commit/cde31d23c071ee93fae96331805f696856084254?merge_request_iid=
=3D3964]
> +Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> +---
> + ext/libav/gstavviddec.c | 6 +++++-
> + 1 file changed, 5 insertions(+), 1 deletion(-)
> +
> +diff --git a/ext/libav/gstavviddec.c b/ext/libav/gstavviddec.c
> +index 43cea456ae8..6d7c4cd0de8 100644
> +--- a/ext/libav/gstavviddec.c
> ++++ b/ext/libav/gstavviddec.c
> +@@ -35,6 +35,10 @@
> +
> + GST_DEBUG_CATEGORY_STATIC (GST_CAT_PERFORMANCE);
> +
> ++#if LIBAVCODEC_VERSION_INT < AV_VERSION_INT(58,132,100)
> ++#define AV_CODEC_CAP_OTHER_THREADS AV_CODEC_CAP_AUTO_THREADS
> ++#endif
> ++
> + #define GST_FFMPEG_VIDEO_CODEC_FRAME_FLAG_ALLOCATED (1<<15)
> +
> + #define MAX_TS_MASK 0xff
> +@@ -615,7 +619,7 @@ gst_ffmpegviddec_set_format (GstVideoDecoder * decod=
er,
> +   if (ffmpegdec->max_threads =3D=3D 0) {
> +     /* When thread type is FF_THREAD_FRAME, extra latency is introduced=
 equal
> +      * to one frame per thread. We thus need to calculate the thread co=
unt ourselves */
> +-    if ((!(oclass->in_plugin->capabilities & AV_CODEC_CAP_AUTO_THREADS)=
) ||
> ++    if ((!(oclass->in_plugin->capabilities & AV_CODEC_CAP_OTHER_THREADS=
)) ||
> +         (ffmpegdec->context->thread_type & FF_THREAD_FRAME))
> +       ffmpegdec->context->thread_count =3D
> +           MIN (gst_ffmpeg_auto_max_threads (), 16);
> +--
> +GitLab
> diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.=
bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
> index 625a52ea555..d1dce6739dd 100644
> --- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
> +++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.22.0.bb
> @@ -11,7 +11,9 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D69333daa044c=
b77e486cc36129f7a770 \
>                      file://ext/libav/gstav.h;beginline=3D1;endline=3D18;=
md5=3Da752c35267d8276fd9ca3db6994fca9c \
>                      "
>
> -SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-$=
{PV}.tar.xz"
> +SRC_URI =3D "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-$=
{PV}.tar.xz \
> +           file://ffmpeg-6.0.patch \
> +          "
>  SRC_URI[sha256sum] =3D "0e48407b4905227a260213dbda84cba3812f0530fc7a75b4=
3829102ef82810f1"
>
>  S =3D "${WORKDIR}/gst-libav-${PV}"
> --
> 2.30.2
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179384): https://lists.openembedded.org/g/openembedde=
d-core/message/179384
> Mute This Topic: https://lists.openembedded.org/mt/97967685/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

