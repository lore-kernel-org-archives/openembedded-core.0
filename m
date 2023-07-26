Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E4DC001DC
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 15:35:51 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.14237.1690385748327385261
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 08:35:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=Ht26IRe1;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.54, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-98df3dea907so1063152366b.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 08:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1690385746; x=1690990546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=szHgj3z3058bjDcbeHia+t+jLXV4HRzWi6zTURFJOtg=;
        b=Ht26IRe1SpDbIiDWRDUG7ZvAaQGMlu7lhW4N3h9LRCRoH7xuHEU0ClSt+gUan4e6bu
         oec8ZkW67eE5KIwbcqJ/8nW0+7a0RQ4kKdkV4M8gD31BlJPVCDkzcIkXoHNakIYLBrgT
         8g8HtRsWBl/e328qqpu3YWTXl50HSurxAyBupUfYlD4scwcFQczWYC2+NCbR0tEXPRgz
         61vWx2+S/V9oD/gwFlNPYSHpN3MUGN3l5TO9R+/Xf0Pof0+ZxzD0haqivycGY6Ylps/e
         92rHfsXI82ggGmDRUxO8AVC82GL2yylDIKbJY8JqySkI/CQq8sNBePpaolmAL/2RoxID
         bgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690385746; x=1690990546;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=szHgj3z3058bjDcbeHia+t+jLXV4HRzWi6zTURFJOtg=;
        b=l4Rj07Zu7qV33lEGQSIFo3Ybl8juikMfrTUqAjorvDWyph8awJxTEsiYew1Laoh20d
         7aeSXtq6MXQRTv6SXSRHVrKBCzU2+4GusDdNQtB5i+SNgYWNcaioTrkXZ1n8v2Vq5CW6
         dRtI4KzaCAakKNv+a5XgiiU94lmVKOyhCIPpSfaNOatyIcQ3/75Ilpnch/ulilOfQ5No
         PM0lb43xVSCNqiUZEFcguw6cYAcfmYzf1/9IvUzKfLM88rN2ZRW53woZy9DAEV5bt0CO
         QlZO+hUX31xeMoVXe65XIPuRyFr3rysz5krwNcyrKc9D+KY1HYyJgySLd8iSN/D4qUqN
         T49A==
X-Gm-Message-State: ABy/qLbjfZr4tsneBykc1gv8UM2DIYmY8MmXhHYrUNxQkJ3bN/8RiuwE
	AXNIwoS+OxY0dS+6tizHMnvMI9luRpL5j2px1zqdiIHp028UNmHV
X-Google-Smtp-Source: APBJJlHVcG42TQquzZToJcVcChjiD42KpAHUHEXlesFdHMveGRanoozNztxFNPmioDBrOpCzkO/ATbn6mNmysDg92bk=
X-Received: by 2002:a17:906:738b:b0:993:dcca:9607 with SMTP id
 f11-20020a170906738b00b00993dcca9607mr2137526ejl.2.1690385746141; Wed, 26 Jul
 2023 08:35:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230726060902.40037-1-hprajapati@mvista.com>
In-Reply-To: <20230726060902.40037-1-hprajapati@mvista.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 26 Jul 2023 05:35:35 -1000
Message-ID: <CAOSpxdZ=QgDhCpVL1HbmWraCqSYR_mqJTn42GAibn1FDhAHnng@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] tiff: fix multiple CVEs
To: Hitendra Prajapati <hprajapati@mvista.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000eebe7a0601659945"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 15:35:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184887

--000000000000eebe7a0601659945
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It would be quite helpful to me if in the future you would send multiple
patches to the same recipe as a patch series rather than individually.

That way I won't have to try to figure out which order you intended them to
be applied!

Steve

On Tue, Jul 25, 2023 at 8:09=E2=80=AFPM Hitendra Prajapati <hprajapati@mvis=
ta.com>
wrote:

> Backport fixes for:
> * CVE-2023-25433 - Upstream-Status: Backport from
> https://gitlab.com/libtiff/libtiff/-/commit/9c22495e5eeeae9e00a1596720c96=
9656bb8d678
> &&
> https://gitlab.com/libtiff/libtiff/-/commit/688012dca2c39033aa2dc7bcea979=
6787cfd1b44
> * CVE-2023-25434 & CVE-2023-25435 - Upstream-Status: Backport from
> https://gitlab.com/libtiff/libtiff/-/commit/69818e2f2d246e6631ac2a2da692c=
3706b849c38
>
> Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> ---
>  .../libtiff/tiff/CVE-2023-25433.patch         | 195 ++++++++++++++++++
>  .../tiff/CVE-2023-25434-CVE-2023-25435.patch  |  94 +++++++++
>  meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   2 +
>  3 files changed, 291 insertions(+)
>  create mode 100644
> meta/recipes-multimedia/libtiff/tiff/CVE-2023-25433.patch
>  create mode 100644
> meta/recipes-multimedia/libtiff/tiff/CVE-2023-25434-CVE-2023-25435.patch
>
> diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25433.patch
> b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25433.patch
> new file mode 100644
> index 0000000000..285aa3d1c4
> --- /dev/null
> +++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25433.patch
> @@ -0,0 +1,195 @@
> +From 9c22495e5eeeae9e00a1596720c969656bb8d678 Mon Sep 17 00:00:00 2001
> +From: Su_Laus <sulau@freenet.de>
> +Date: Fri, 3 Feb 2023 15:31:31 +0100
> +Subject: [PATCH] CVE-2023-25433
> +
> +tiffcrop correctly update buffersize after rotateImage()
> +fix#520 rotateImage() set up a new buffer and calculates its size
> +individually. Therefore, seg_buffs[] size needs to be updated accordingl=
y.
> +Before this fix, the seg_buffs buffer size was calculated with a differe=
nt
> +formula than within rotateImage().
> +
> +Closes #520.
> +
> +Upstream-Status: Backport [
> https://gitlab.com/libtiff/libtiff/-/commit/9c22495e5eeeae9e00a1596720c96=
9656bb8d678
> &&
> https://gitlab.com/libtiff/libtiff/-/commit/688012dca2c39033aa2dc7bcea979=
6787cfd1b44
> ]
> +CVE: CVE-2023-25433
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + tools/tiffcrop.c | 78 +++++++++++++++++++++++++++++++++++++-----------
> + 1 file changed, 60 insertions(+), 18 deletions(-)
> +
> +diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
> +index eee26bf..cbd24cc 100644
> +--- a/tools/tiffcrop.c
> ++++ b/tools/tiffcrop.c
> +@@ -523,7 +523,7 @@ static int rotateContigSamples24bits(uint16_t,
> uint16_t, uint16_t, uint32_t,
> + static int rotateContigSamples32bits(uint16_t, uint16_t, uint16_t,
> uint32_t,
> +                                      uint32_t, uint32_t, uint8_t *,
> uint8_t *);
> + static int rotateImage(uint16_t, struct image_data *, uint32_t *,
> uint32_t *,
> +-                       unsigned char **, int);
> ++                       unsigned char **, size_t *);
> + static int mirrorImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t=
,
> +                        unsigned char *);
> + static int invertImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t=
,
> +@@ -6515,7 +6515,7 @@ static int  correct_orientation(struct image_data
> *image, unsigned char **work_b
> +        * but switch xres, yres there. */
> +       uint32_t width =3D image->width;
> +       uint32_t length =3D image->length;
> +-      if (rotateImage(rotation, image, &width, &length, work_buff_ptr,
> TRUE))
> ++      if (rotateImage(rotation, image, &width, &length, work_buff_ptr,
> NULL))
> +       {
> +       TIFFError ("correct_orientation", "Unable to rotate image");
> +       return (-1);
> +@@ -7695,16 +7695,19 @@ processCropSelections(struct image_data *image,
> struct crop_mask *crop,
> +
> +     if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it
> can reallocate the buffer */
> +       {
> ++        /* rotateImage() set up a new buffer and calculates its size
> ++         * individually. Therefore, seg_buffs size  needs to be updated
> ++         * accordingly. */
> ++      size_t rot_buf_size =3D 0;
> +       if (rotateImage(crop->rotation, image, &crop->combined_width,
> +-                      &crop->combined_length, &crop_buff, FALSE))
> ++                      &crop->combined_length, &crop_buff, &rot_buf_size=
))
> +         {
> +         TIFFError("processCropSelections",
> +                   "Failed to rotate composite regions by %"PRIu32"
> degrees", crop->rotation);
> +         return (-1);
> +         }
> +       seg_buffs[0].buffer =3D crop_buff;
> +-      seg_buffs[0].size =3D (((crop->combined_width * image->bps + 7 ) =
/ 8)
> +-                            * image->spp) * crop->combined_length;
> ++      seg_buffs[0].size =3D rot_buf_size;
> +       }
> +     }
> +   else  /* Separated Images */
> +@@ -7804,9 +7807,13 @@ processCropSelections(struct image_data *image,
> struct crop_mask *crop,
> +         {
> +           /* rotateImage() changes image->width, ->length, ->xres and
> ->yres, what it schouldn't do here, when more than one section is
> processed.
> +            * ToDo: Therefore rotateImage() and its usage has to be
> reworked (e.g. like mirrorImage()) !!
> +-           */
> +-      if (rotateImage(crop->rotation, image, &crop->regionlist[i].width=
,
> +-                      &crop->regionlist[i].length, &crop_buff, FALSE))
> ++           * Furthermore, rotateImage() set up a new buffer and
> calculates
> ++           * its size individually. Therefore, seg_buffs size  needs to
> be
> ++           * updated accordingly. */
> ++         size_t rot_buf_size =3D 0;
> ++           if (rotateImage(
> ++                crop->rotation, image, &crop->regionlist[i].width,
> ++                &crop->regionlist[i].length, &crop_buff, &rot_buf_size)=
)
> +           {
> +           TIFFError("processCropSelections",
> +                     "Failed to rotate crop region by %"PRIu16" degrees"=
,
> crop->rotation);
> +@@ -7817,8 +7824,7 @@ processCropSelections(struct image_data *image,
> struct crop_mask *crop,
> +         crop->combined_width =3D total_width;
> +         crop->combined_length =3D total_length;
> +         seg_buffs[i].buffer =3D crop_buff;
> +-        seg_buffs[i].size =3D (((crop->regionlist[i].width * image->bps=
 +
> 7 ) / 8)
> +-                               * image->spp) *
> crop->regionlist[i].length;
> ++        seg_buffs[i].size =3D rot_buf_size;
> +         }
> +       }  /* for crop->selections loop */
> +     }  /* Separated Images (else case) */
> +@@ -7827,7 +7833,6 @@ processCropSelections(struct image_data *image,
> struct crop_mask *crop,
> +
> + /* Copy the crop section of the data from the current image into a buff=
er
> +  * and adjust the IFD values to reflect the new size. If no cropping is
> +- * required, use the original read buffer as the crop buffer.
> +  *
> +  * There is quite a bit of redundancy between this routine and the more
> +  * specialized processCropSelections, but this provides
> +@@ -7938,7 +7943,7 @@ createCroppedImage(struct image_data *image, struc=
t
> crop_mask *crop,
> +   if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can
> reallocate the buffer */
> +     {
> +     if (rotateImage(crop->rotation, image, &crop->combined_width,
> +-                    &crop->combined_length, crop_buff_ptr, TRUE))
> ++                    &crop->combined_length, crop_buff_ptr, NULL))
> +       {
> +       TIFFError("createCroppedImage",
> +                 "Failed to rotate image or cropped selection by
> %"PRIu16" degrees", crop->rotation);
> +@@ -8600,14 +8605,16 @@ rotateContigSamples32bits(uint16_t rotation,
> uint16_t spp, uint16_t bps, uint32_
> +
> + /* Rotate an image by a multiple of 90 degrees clockwise */
> + static int
> +-rotateImage(uint16_t rotation, struct image_data *image, uint32_t
> *img_width,
> +-            uint32_t *img_length, unsigned char **ibuff_ptr, int
> rot_image_params)
> ++rotateImage(uint16_t rotation, struct image_data *image,
> ++            uint32_t *img_width,uint32_t *img_length,
> ++            unsigned char **ibuff_ptr, size_t *rot_buf_size)
> +   {
> +   int      shift_width;
> +   uint32_t   bytes_per_pixel, bytes_per_sample;
> +   uint32_t   row, rowsize, src_offset, dst_offset;
> +   uint32_t   i, col, width, length;
> +-  uint32_t   colsize, buffsize, col_offset, pix_offset;
> ++  uint32_t colsize, col_offset, pix_offset;
> ++  tmsize_t buffsize;
> +   unsigned char *ibuff;
> +   unsigned char *src;
> +   unsigned char *dst;
> +@@ -8620,12 +8627,41 @@ rotateImage(uint16_t rotation, struct image_data
> *image, uint32_t *img_width,
> +   spp =3D image->spp;
> +   bps =3D image->bps;
> +
> ++  if ((spp !=3D 0 && bps !=3D 0 &&
> ++         width > (uint32_t)((UINT32_MAX - 7) / spp / bps)) ||
> ++        (spp !=3D 0 && bps !=3D 0 &&
> ++         length > (uint32_t)((UINT32_MAX - 7) / spp / bps)))
> ++    {
> ++        TIFFError("rotateImage", "Integer overflow detected.");
> ++        return (-1);
> ++    }
> ++
> +   rowsize =3D ((bps * spp * width) + 7) / 8;
> +   colsize =3D ((bps * spp * length) + 7) / 8;
> +   if ((colsize * width) > (rowsize * length))
> +-    buffsize =3D (colsize + 1) * width;
> ++{
> ++        if (((tmsize_t)colsize + 1) !=3D 0 &&
> ++            (tmsize_t)width > ((TIFF_TMSIZE_T_MAX -
> NUM_BUFF_OVERSIZE_BYTES) /
> ++                               ((tmsize_t)colsize + 1)))
> ++        {
> ++            TIFFError("rotateImage",
> ++                      "Integer overflow when calculating buffer size.")=
;
> ++            return (-1);
> ++        }
> ++        buffsize =3D ((tmsize_t)colsize + 1) * width;
> ++    }
> +   else
> +-    buffsize =3D (rowsize + 1) * length;
> ++    {
> ++        if (((tmsize_t)rowsize + 1) !=3D 0 &&
> ++            (tmsize_t)length > ((TIFF_TMSIZE_T_MAX -
> NUM_BUFF_OVERSIZE_BYTES) /
> ++                                ((tmsize_t)rowsize + 1)))
> ++        {
> ++            TIFFError("rotateImage",
> ++                      "Integer overflow when calculating buffer size.")=
;
> ++            return (-1);
> ++        }
> ++        buffsize =3D (rowsize + 1) * length;
> ++    }
> +
> +   bytes_per_sample =3D (bps + 7) / 8;
> +   bytes_per_pixel  =3D ((bps * spp) + 7) / 8;
> +@@ -8648,11 +8684,17 @@ rotateImage(uint16_t rotation, struct image_data
> *image, uint32_t *img_width,
> +   /* Add 3 padding bytes for extractContigSamplesShifted32bits */
> +   if (!(rbuff =3D (unsigned char *)limitMalloc(buffsize +
> NUM_BUFF_OVERSIZE_BYTES)))
> +     {
> +-    TIFFError("rotateImage", "Unable to allocate rotation buffer of %1u
> bytes", buffsize + NUM_BUFF_OVERSIZE_BYTES);
> ++    TIFFError("rotateImage",
> ++              "Unable to allocate rotation buffer of %" TIFF_SSIZE_FORM=
AT
> ++              " bytes ",
> ++              buffsize + NUM_BUFF_OVERSIZE_BYTES);
> +     return (-1);
> +     }
> +   _TIFFmemset(rbuff, '\0', buffsize + NUM_BUFF_OVERSIZE_BYTES);
> +
> ++  if (rot_buf_size !=3D NULL)
> ++      *rot_buf_size =3D buffsize;
> ++
> +   ibuff =3D *ibuff_ptr;
> +   switch (rotation)
> +     {
> +--
> +2.25.1
> +
> diff --git
> a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25434-CVE-2023-25435.patc=
h
> b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25434-CVE-2023-25435.patc=
h
> new file mode 100644
> index 0000000000..e214277504
> --- /dev/null
> +++
> b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25434-CVE-2023-25435.patc=
h
> @@ -0,0 +1,94 @@
> +From 69818e2f2d246e6631ac2a2da692c3706b849c38 Mon Sep 17 00:00:00 2001
> +From: Su_Laus <sulau@freenet.de>
> +Date: Sun, 29 Jan 2023 11:09:26 +0100
> +Subject: [PATCH] CVE-2023-25434 & CVE-2023-25435
> +
> +tiffcrop: Amend rotateImage() not to toggle the input (main)
> +image width and length parameters when only cropped image sections are
> +rotated. Remove buffptr from region structure because never used.
> +
> +Closes #492 #493 #494 #495 #499 #518 #519
> +
> +Upstream-Status: Backport [
> https://gitlab.com/libtiff/libtiff/-/commit/69818e2f2d246e6631ac2a2da692c=
3706b849c38
> ]
> +CVE: CVE-2023-25434 & CVE-2023-25435
> +Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
> +---
> + tools/tiffcrop.c | 27 ++++++++++++++++-----------
> + 1 file changed, 16 insertions(+), 11 deletions(-)
> +
> +diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c
> +index cbd24cc..b811fbb 100644
> +--- a/tools/tiffcrop.c
> ++++ b/tools/tiffcrop.c
> +@@ -523,7 +523,7 @@ static int rotateContigSamples24bits(uint16_t,
> uint16_t, uint16_t, uint32_t,
> + static int rotateContigSamples32bits(uint16_t, uint16_t, uint16_t,
> uint32_t,
> +                                      uint32_t, uint32_t, uint8_t *,
> uint8_t *);
> + static int rotateImage(uint16_t, struct image_data *, uint32_t *,
> uint32_t *,
> +-                       unsigned char **, size_t *);
> ++                       unsigned char **, size_t *, int);
> + static int mirrorImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t=
,
> +                        unsigned char *);
> + static int invertImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t=
,
> +@@ -6513,10 +6513,11 @@ static int  correct_orientation(struct image_dat=
a
> *image, unsigned char **work_b
> +       /* Dummy variable in order not to switch two times the
> +        * image->width,->length within rotateImage(),
> +        * but switch xres, yres there. */
> +-      uint32_t width =3D image->width;
> +-      uint32_t length =3D image->length;
> +-      if (rotateImage(rotation, image, &width, &length, work_buff_ptr,
> NULL))
> +-      {
> ++        uint32_t width =3D image->width;
> ++        uint32_t length =3D image->length;
> ++        if (rotateImage(rotation, image, &width, &length, work_buff_ptr=
,
> NULL,
> ++                        TRUE))
> ++        {
> +       TIFFError ("correct_orientation", "Unable to rotate image");
> +       return (-1);
> +       }
> +@@ -7700,7 +7701,8 @@ processCropSelections(struct image_data *image,
> struct crop_mask *crop,
> +          * accordingly. */
> +       size_t rot_buf_size =3D 0;
> +       if (rotateImage(crop->rotation, image, &crop->combined_width,
> +-                      &crop->combined_length, &crop_buff, &rot_buf_size=
))
> ++                      &crop->combined_length, &crop_buff, &rot_buf_size=
,
> ++                            FALSE))
> +         {
> +         TIFFError("processCropSelections",
> +                   "Failed to rotate composite regions by %"PRIu32"
> degrees", crop->rotation);
> +@@ -7811,9 +7813,10 @@ processCropSelections(struct image_data *image,
> struct crop_mask *crop,
> +            * its size individually. Therefore, seg_buffs size  needs to
> be
> +            * updated accordingly. */
> +          size_t rot_buf_size =3D 0;
> +-           if (rotateImage(
> +-                crop->rotation, image, &crop->regionlist[i].width,
> +-                &crop->regionlist[i].length, &crop_buff, &rot_buf_size)=
)
> ++           if (rotateImage(crop->rotation, image,
> ++                                &crop->regionlist[i].width,
> ++                                &crop->regionlist[i].length, &crop_buff=
,
> ++                                &rot_buf_size, FALSE))
> +           {
> +           TIFFError("processCropSelections",
> +                     "Failed to rotate crop region by %"PRIu16" degrees"=
,
> crop->rotation);
> +@@ -7943,7 +7946,7 @@ createCroppedImage(struct image_data *image, struc=
t
> crop_mask *crop,
> +   if (crop->crop_mode & CROP_ROTATE) /* rotate should be last as it can
> reallocate the buffer */
> +     {
> +     if (rotateImage(crop->rotation, image, &crop->combined_width,
> +-                    &crop->combined_length, crop_buff_ptr, NULL))
> ++                    &crop->combined_length, crop_buff_ptr, NULL, TRUE))
> +       {
> +       TIFFError("createCroppedImage",
> +                 "Failed to rotate image or cropped selection by
> %"PRIu16" degrees", crop->rotation);
> +@@ -8607,7 +8610,9 @@ rotateContigSamples32bits(uint16_t rotation,
> uint16_t spp, uint16_t bps, uint32_
> + static int
> + rotateImage(uint16_t rotation, struct image_data *image,
> +             uint32_t *img_width,uint32_t *img_length,
> +-            unsigned char **ibuff_ptr, size_t *rot_buf_size)
> ++            unsigned char **ibuff_ptr, size_t *rot_buf_size,
> ++            int rot_image_params)
> ++
> +   {
> +   int      shift_width;
> +   uint32_t   bytes_per_pixel, bytes_per_sample;
> +--
> +2.25.1
> +
> diff --git a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> index 2be25756bc..2ee10fca72 100644
> --- a/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> +++ b/meta/recipes-multimedia/libtiff/tiff_4.3.0.bb
> @@ -35,6 +35,8 @@ SRC_URI =3D "
> http://download.osgeo.org/libtiff/tiff-${PV}.tar.gz \
>             file://CVE-2022-48281.patch \
>             file://CVE-2023-0800_0801_0802_0803_0804.patch \
>             file://CVE-2023-0795_0796_0797_0798_0799.patch \
> +           file://CVE-2023-25433.patch \
> +           file://CVE-2023-25434-CVE-2023-25435.patch \
>             "
>
>  SRC_URI[sha256sum] =3D
> "0e46e5acb087ce7d1ac53cf4f56a09b221537fc86dfc5daaad1c2e89e1b37ac8"
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184859):
> https://lists.openembedded.org/g/openembedded-core/message/184859
> Mute This Topic: https://lists.openembedded.org/mt/100345399/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> steve@sakoman.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000eebe7a0601659945
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">It would be quite helpful to me if in the future you would=
 send multiple patches to the same recipe as a patch series rather than ind=
ividually.<div><br></div><div>That way I won&#39;t have to try to figure ou=
t which order you intended=C2=A0them to be applied!</div><div><br></div><di=
v>Steve</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Jul 25, 2023 at 8:09=E2=80=AFPM Hitendra Prajapati &lt=
;<a href=3D"mailto:hprajapati@mvista.com">hprajapati@mvista.com</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Backport fix=
es for:<br>
* CVE-2023-25433 - Upstream-Status: Backport from <a href=3D"https://gitlab=
.com/libtiff/libtiff/-/commit/9c22495e5eeeae9e00a1596720c969656bb8d678" rel=
=3D"noreferrer" target=3D"_blank">https://gitlab.com/libtiff/libtiff/-/comm=
it/9c22495e5eeeae9e00a1596720c969656bb8d678</a> &amp;&amp; <a href=3D"https=
://gitlab.com/libtiff/libtiff/-/commit/688012dca2c39033aa2dc7bcea9796787cfd=
1b44" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/libtiff/libti=
ff/-/commit/688012dca2c39033aa2dc7bcea9796787cfd1b44</a><br>
* CVE-2023-25434 &amp; CVE-2023-25435 - Upstream-Status: Backport from <a h=
ref=3D"https://gitlab.com/libtiff/libtiff/-/commit/69818e2f2d246e6631ac2a2d=
a692c3706b849c38" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/l=
ibtiff/libtiff/-/commit/69818e2f2d246e6631ac2a2da692c3706b849c38</a><br>
<br>
Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.c=
om" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
---<br>
=C2=A0.../libtiff/tiff/CVE-2023-25433.patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 195 ++++++++++++++++++<br>
=C2=A0.../tiff/CVE-2023-25434-CVE-2023-25435.patch=C2=A0 |=C2=A0 94 +++++++=
++<br>
=C2=A0meta/recipes-multimedia/libtiff/<a href=3D"http://tiff_4.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">tiff_4.3.0.bb</a> |=C2=A0 =C2=A02 +<br>
=C2=A03 files changed, 291 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-2543=
3.patch<br>
=C2=A0create mode 100644 meta/recipes-multimedia/libtiff/tiff/CVE-2023-2543=
4-CVE-2023-25435.patch<br>
<br>
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25433.patch b/me=
ta/recipes-multimedia/libtiff/tiff/CVE-2023-25433.patch<br>
new file mode 100644<br>
index 0000000000..285aa3d1c4<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25433.patch<br>
@@ -0,0 +1,195 @@<br>
+From 9c22495e5eeeae9e00a1596720c969656bb8d678 Mon Sep 17 00:00:00 2001<br>
+From: Su_Laus &lt;<a href=3D"mailto:sulau@freenet.de" target=3D"_blank">su=
lau@freenet.de</a>&gt;<br>
+Date: Fri, 3 Feb 2023 15:31:31 +0100<br>
+Subject: [PATCH] CVE-2023-25433<br>
+<br>
+tiffcrop correctly update buffersize after rotateImage()<br>
+fix#520 rotateImage() set up a new buffer and calculates its size<br>
+individually. Therefore, seg_buffs[] size needs to be updated accordingly.=
<br>
+Before this fix, the seg_buffs buffer size was calculated with a different=
<br>
+formula than within rotateImage().<br>
+<br>
+Closes #520.<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.com/libtiff/libtiff/-=
/commit/9c22495e5eeeae9e00a1596720c969656bb8d678" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.com/libtiff/libtiff/-/commit/9c22495e5eeeae9e00a=
1596720c969656bb8d678</a> &amp;&amp; <a href=3D"https://gitlab.com/libtiff/=
libtiff/-/commit/688012dca2c39033aa2dc7bcea9796787cfd1b44" rel=3D"noreferre=
r" target=3D"_blank">https://gitlab.com/libtiff/libtiff/-/commit/688012dca2=
c39033aa2dc7bcea9796787cfd1b44</a>]<br>
+CVE: CVE-2023-25433<br>
+Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.=
com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
+---<br>
+ tools/tiffcrop.c | 78 +++++++++++++++++++++++++++++++++++++-----------<br=
>
+ 1 file changed, 60 insertions(+), 18 deletions(-)<br>
+<br>
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c<br>
+index eee26bf..cbd24cc 100644<br>
+--- a/tools/tiffcrop.c<br>
++++ b/tools/tiffcrop.c<br>
+@@ -523,7 +523,7 @@ static int rotateContigSamples24bits(uint16_t, uint16_=
t, uint16_t, uint32_t,<br>
+ static int rotateContigSamples32bits(uint16_t, uint16_t, uint16_t, uint32=
_t,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t, uint3=
2_t, uint8_t *, uint8_t *);<br>
+ static int rotateImage(uint16_t, struct image_data *, uint32_t *, uint32_=
t *,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned char **, int);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned char **, size_t *);<br>
+ static int mirrorImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 unsigned char *);<br>
+ static int invertImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,<=
br>
+@@ -6515,7 +6515,7 @@ static int=C2=A0 correct_orientation(struct image_da=
ta *image, unsigned char **work_b<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * but switch xres, yres there. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t width =3D image-&gt;width;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t length =3D image-&gt;length;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (rotateImage(rotation, image, &amp;width, &amp;le=
ngth, work_buff_ptr, TRUE))<br>
++=C2=A0 =C2=A0 =C2=A0 if (rotateImage(rotation, image, &amp;width, &amp;le=
ngth, work_buff_ptr, NULL))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError (&quot;correct_orientation&quot;, &qu=
ot;Unable to rotate image&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return (-1);<br>
+@@ -7695,16 +7695,19 @@ processCropSelections(struct image_data *image, st=
ruct crop_mask *crop,<br>
+ <br>
+=C2=A0 =C2=A0 =C2=A0if (crop-&gt;crop_mode &amp; CROP_ROTATE) /* rotate sh=
ould be last as it can reallocate the buffer */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* rotateImage() set up a new buffer and calc=
ulates its size<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* individually. Therefore, seg_buffs si=
ze=C2=A0 needs to be updated<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* accordingly. */<br>
++=C2=A0 =C2=A0 =C2=A0 size_t rot_buf_size =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rotateImage(crop-&gt;rotation, image, &amp;=
crop-&gt;combined_width, <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;crop-&gt;combined_length, &amp;crop_buff, FALSE))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;crop-&gt;combined_length, &amp;crop_buff, &amp;rot_buf_size))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(&quot;processCropSelections&qu=
ot;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;Failed to rotate composite regions by %&quot;PRIu32&quot; degrees&quot;, c=
rop-&gt;rotation);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return (-1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0seg_buffs[0].buffer =3D crop_buff;<br>
+-=C2=A0 =C2=A0 =C2=A0 seg_buffs[0].size =3D (((crop-&gt;combined_width * i=
mage-&gt;bps + 7 ) / 8)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 * image-&gt;spp) * crop-&gt;combined_length; <br>
++=C2=A0 =C2=A0 =C2=A0 seg_buffs[0].size =3D rot_buf_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0else=C2=A0 /* Separated Images */<br>
+@@ -7804,9 +7807,13 @@ processCropSelections(struct image_data *image, str=
uct crop_mask *crop,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* rotateImage() changes image-&g=
t;width, -&gt;length, -&gt;xres and -&gt;yres, what it schouldn&#39;t do he=
re, when more than one section is processed. <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * ToDo: Therefore rotateImage() =
and its usage has to be reworked (e.g. like mirrorImage()) !!<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
+-=C2=A0 =C2=A0 =C2=A0 if (rotateImage(crop-&gt;rotation, image, &amp;crop-=
&gt;regionlist[i].width, <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;crop-&gt;regionlist[i].length, &amp;crop_buff, FALSE))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Furthermore, rotateImage() set=
 up a new buffer and calculates<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* its size individually. Therefo=
re, seg_buffs size=C2=A0 needs to be<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* updated accordingly. */<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t rot_buf_size =3D 0;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rotateImage(<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;rotation=
, image, &amp;crop-&gt;regionlist[i].width,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;crop-&gt;reg=
ionlist[i].length, &amp;crop_buff, &amp;rot_buf_size))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(&quot;processCropSelect=
ions&quot;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;Failed to rotate crop region by %&quot;PRIu16&quot; degrees&quot;,=
 crop-&gt;rotation);<br>
+@@ -7817,8 +7824,7 @@ processCropSelections(struct image_data *image, stru=
ct crop_mask *crop,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;combined_width =3D total_width;=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0crop-&gt;combined_length =3D total_lengt=
h;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0seg_buffs[i].buffer =3D crop_buff;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 seg_buffs[i].size =3D (((crop-&gt;regionlist[=
i].width * image-&gt;bps + 7 ) / 8)<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* image-&gt;spp) * crop-&gt;regionlis=
t[i].length; <br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 seg_buffs[i].size =3D rot_buf_size;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}=C2=A0 /* for crop-&gt;selections loop */<br>
+=C2=A0 =C2=A0 =C2=A0}=C2=A0 /* Separated Images (else case) */<br>
+@@ -7827,7 +7833,6 @@ processCropSelections(struct image_data *image, stru=
ct crop_mask *crop,<br>
+ <br>
+ /* Copy the crop section of the data from the current image into a buffer=
<br>
+=C2=A0 * and adjust the IFD values to reflect the new size. If no cropping=
 is<br>
+- * required, use the original read buffer as the crop buffer.<br>
+=C2=A0 *<br>
+=C2=A0 * There is quite a bit of redundancy between this routine and the m=
ore<br>
+=C2=A0 * specialized processCropSelections, but this provides<br>
+@@ -7938,7 +7943,7 @@ createCroppedImage(struct image_data *image, struct =
crop_mask *crop,<br>
+=C2=A0 =C2=A0if (crop-&gt;crop_mode &amp; CROP_ROTATE) /* rotate should be=
 last as it can reallocate the buffer */<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0if (rotateImage(crop-&gt;rotation, image, &amp;crop-&g=
t;combined_width, <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &am=
p;crop-&gt;combined_length, crop_buff_ptr, TRUE))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &am=
p;crop-&gt;combined_length, crop_buff_ptr, NULL))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(&quot;createCroppedImage&quot;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed=
 to rotate image or cropped selection by %&quot;PRIu16&quot; degrees&quot;,=
 crop-&gt;rotation);<br>
+@@ -8600,14 +8605,16 @@ rotateContigSamples32bits(uint16_t rotation, uint1=
6_t spp, uint16_t bps, uint32_<br>
+ <br>
+ /* Rotate an image by a multiple of 90 degrees clockwise */<br>
+ static int<br>
+-rotateImage(uint16_t rotation, struct image_data *image, uint32_t *img_wi=
dth,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *img_length, unsigned =
char **ibuff_ptr, int rot_image_params)<br>
++rotateImage(uint16_t rotation, struct image_data *image,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t *img_width,uint32_t *i=
mg_length,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char **ibuff_ptr, size=
_t *rot_buf_size)<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 shift_width;<br>
+=C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0bytes_per_pixel, bytes_per_sample;<br>
+=C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0row, rowsize, src_offset, dst_offset;<br=
>
+=C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0i, col, width, length;<br>
+-=C2=A0 uint32_t=C2=A0 =C2=A0colsize, buffsize, col_offset, pix_offset;<br=
>
++=C2=A0 uint32_t colsize, col_offset, pix_offset;<br>
++=C2=A0 tmsize_t buffsize;<br>
+=C2=A0 =C2=A0unsigned char *ibuff;<br>
+=C2=A0 =C2=A0unsigned char *src;<br>
+=C2=A0 =C2=A0unsigned char *dst;<br>
+@@ -8620,12 +8627,41 @@ rotateImage(uint16_t rotation, struct image_data *=
image, uint32_t *img_width,<br>
+=C2=A0 =C2=A0spp =3D image-&gt;spp;<br>
+=C2=A0 =C2=A0bps =3D image-&gt;bps;<br>
+ <br>
++=C2=A0 if ((spp !=3D 0 &amp;&amp; bps !=3D 0 &amp;&amp;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0width &gt; (uint32_t)((UINT32_MAX - 7) =
/ spp / bps)) ||<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 (spp !=3D 0 &amp;&amp; bps !=3D 0 &amp;&amp;<=
br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0length &gt; (uint32_t)((UINT32_MAX - 7)=
 / spp / bps)))<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;rotateImage&quot;, &quot;Inte=
ger overflow detected.&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 return (-1);<br>
++=C2=A0 =C2=A0 }<br>
++<br>
+=C2=A0 =C2=A0rowsize =3D ((bps * spp * width) + 7) / 8;<br>
+=C2=A0 =C2=A0colsize =3D ((bps * spp * length) + 7) / 8;<br>
+=C2=A0 =C2=A0if ((colsize * width) &gt; (rowsize * length))<br>
+-=C2=A0 =C2=A0 buffsize =3D (colsize + 1) * width;<br>
++{<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((tmsize_t)colsize + 1) !=3D 0 &amp;&amp;=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (tmsize_t)width &gt; ((TIFF_TMS=
IZE_T_MAX - NUM_BUFF_OVERSIZE_BYTES) /<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0((tmsize_t)colsize + 1)))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;rotateImage&quo=
t;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Integer overflow when calculating buffer size.&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (-1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffsize =3D ((tmsize_t)colsize + 1) * width;=
<br>
++=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0else<br>
+-=C2=A0 =C2=A0 buffsize =3D (rowsize + 1) * length;<br>
++=C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (((tmsize_t)rowsize + 1) !=3D 0 &amp;&amp;=
<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (tmsize_t)length &gt; ((TIFF_TM=
SIZE_T_MAX - NUM_BUFF_OVERSIZE_BYTES) /<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ((tmsize_t)rowsize + 1)))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 TIFFError(&quot;rotateImage&quo=
t;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &quot;Integer overflow when calculating buffer size.&quot;);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return (-1);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 buffsize =3D (rowsize + 1) * length;<br>
++=C2=A0 =C2=A0 }<br>
+ <br>
+=C2=A0 =C2=A0bytes_per_sample =3D (bps + 7) / 8;<br>
+=C2=A0 =C2=A0bytes_per_pixel=C2=A0 =3D ((bps * spp) + 7) / 8;<br>
+@@ -8648,11 +8684,17 @@ rotateImage(uint16_t rotation, struct image_data *=
image, uint32_t *img_width,<br>
+=C2=A0 =C2=A0/* Add 3 padding bytes for extractContigSamplesShifted32bits =
*/<br>
+=C2=A0 =C2=A0if (!(rbuff =3D (unsigned char *)limitMalloc(buffsize + NUM_B=
UFF_OVERSIZE_BYTES)))<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-=C2=A0 =C2=A0 TIFFError(&quot;rotateImage&quot;, &quot;Unable to allocate=
 rotation buffer of %1u bytes&quot;, buffsize + NUM_BUFF_OVERSIZE_BYTES);<b=
r>
++=C2=A0 =C2=A0 TIFFError(&quot;rotateImage&quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Unable to allocate=
 rotation buffer of %&quot; TIFF_SSIZE_FORMAT<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot; bytes &quot;,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buffsize + NUM_BUFF_OVER=
SIZE_BYTES);<br>
+=C2=A0 =C2=A0 =C2=A0return (-1);<br>
+=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0_TIFFmemset(rbuff, &#39;\0&#39;, buffsize + NUM_BUFF_OVERSIZE=
_BYTES);<br>
+ <br>
++=C2=A0 if (rot_buf_size !=3D NULL)<br>
++=C2=A0 =C2=A0 =C2=A0 *rot_buf_size =3D buffsize;<br>
++<br>
+=C2=A0 =C2=A0ibuff =3D *ibuff_ptr;<br>
+=C2=A0 =C2=A0switch (rotation)<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25434-CVE-2023-2=
5435.patch b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25434-CVE-2023-2=
5435.patch<br>
new file mode 100644<br>
index 0000000000..e214277504<br>
--- /dev/null<br>
+++ b/meta/recipes-multimedia/libtiff/tiff/CVE-2023-25434-CVE-2023-25435.pa=
tch<br>
@@ -0,0 +1,94 @@<br>
+From 69818e2f2d246e6631ac2a2da692c3706b849c38 Mon Sep 17 00:00:00 2001<br>
+From: Su_Laus &lt;<a href=3D"mailto:sulau@freenet.de" target=3D"_blank">su=
lau@freenet.de</a>&gt;<br>
+Date: Sun, 29 Jan 2023 11:09:26 +0100<br>
+Subject: [PATCH] CVE-2023-25434 &amp; CVE-2023-25435<br>
+<br>
+tiffcrop: Amend rotateImage() not to toggle the input (main)<br>
+image width and length parameters when only cropped image sections are<br>
+rotated. Remove buffptr from region structure because never used.<br>
+<br>
+Closes #492 #493 #494 #495 #499 #518 #519<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://gitlab.com/libtiff/libtiff/-=
/commit/69818e2f2d246e6631ac2a2da692c3706b849c38" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.com/libtiff/libtiff/-/commit/69818e2f2d246e6631a=
c2a2da692c3706b849c38</a>]<br>
+CVE: CVE-2023-25434 &amp; CVE-2023-25435<br>
+Signed-off-by: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.=
com" target=3D"_blank">hprajapati@mvista.com</a>&gt;<br>
+---<br>
+ tools/tiffcrop.c | 27 ++++++++++++++++-----------<br>
+ 1 file changed, 16 insertions(+), 11 deletions(-)<br>
+<br>
+diff --git a/tools/tiffcrop.c b/tools/tiffcrop.c<br>
+index cbd24cc..b811fbb 100644<br>
+--- a/tools/tiffcrop.c<br>
++++ b/tools/tiffcrop.c<br>
+@@ -523,7 +523,7 @@ static int rotateContigSamples24bits(uint16_t, uint16_=
t, uint16_t, uint32_t,<br>
+ static int rotateContigSamples32bits(uint16_t, uint16_t, uint16_t, uint32=
_t,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t, uint3=
2_t, uint8_t *, uint8_t *);<br>
+ static int rotateImage(uint16_t, struct image_data *, uint32_t *, uint32_=
t *,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned char **, size_t *);<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned char **, size_t *, int);<br>
+ static int mirrorImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 unsigned char *);<br>
+ static int invertImage(uint16_t, uint16_t, uint16_t, uint32_t, uint32_t,<=
br>
+@@ -6513,10 +6513,11 @@ static int=C2=A0 correct_orientation(struct image_=
data *image, unsigned char **work_b<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Dummy variable in order not to switch two ti=
mes the<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * image-&gt;width,-&gt;length within rotateIma=
ge(),<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 * but switch xres, yres there. */<br>
+-=C2=A0 =C2=A0 =C2=A0 uint32_t width =3D image-&gt;width;<br>
+-=C2=A0 =C2=A0 =C2=A0 uint32_t length =3D image-&gt;length;<br>
+-=C2=A0 =C2=A0 =C2=A0 if (rotateImage(rotation, image, &amp;width, &amp;le=
ngth, work_buff_ptr, NULL))<br>
+-=C2=A0 =C2=A0 =C2=A0 {<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t width =3D image-&gt;width;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 uint32_t length =3D image-&gt;length;<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (rotateImage(rotation, image, &amp;width, =
&amp;length, work_buff_ptr, NULL,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 TRUE))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError (&quot;correct_orientation&quot;, &qu=
ot;Unable to rotate image&quot;);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return (-1);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+@@ -7700,7 +7701,8 @@ processCropSelections(struct image_data *image, stru=
ct crop_mask *crop,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * accordingly. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0size_t rot_buf_size =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (rotateImage(crop-&gt;rotation, image, &amp;=
crop-&gt;combined_width, <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;crop-&gt;combined_length, &amp;crop_buff, &amp;rot_buf_size))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 &amp;crop-&gt;combined_length, &amp;crop_buff, &amp;rot_buf_size,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 FALSE))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(&quot;processCropSelections&qu=
ot;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot=
;Failed to rotate composite regions by %&quot;PRIu32&quot; degrees&quot;, c=
rop-&gt;rotation);<br>
+@@ -7811,9 +7813,10 @@ processCropSelections(struct image_data *image, str=
uct crop_mask *crop,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * its size individually. Therefo=
re, seg_buffs size=C2=A0 needs to be<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 * updated accordingly. */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_t rot_buf_size =3D 0;<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rotateImage(<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 crop-&gt;rotation=
, image, &amp;crop-&gt;regionlist[i].width,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;crop-&gt;reg=
ionlist[i].length, &amp;crop_buff, &amp;rot_buf_size))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (rotateImage(crop-&gt;rotatio=
n, image,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;crop-&gt;regionlist[i].width,<b=
r>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;crop-&gt;regionlist[i].length, =
&amp;crop_buff,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &amp;rot_buf_size, FALSE))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(&quot;processCropSelect=
ions&quot;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;Failed to rotate crop region by %&quot;PRIu16&quot; degrees&quot;,=
 crop-&gt;rotation);<br>
+@@ -7943,7 +7946,7 @@ createCroppedImage(struct image_data *image, struct =
crop_mask *crop,<br>
+=C2=A0 =C2=A0if (crop-&gt;crop_mode &amp; CROP_ROTATE) /* rotate should be=
 last as it can reallocate the buffer */<br>
+=C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0if (rotateImage(crop-&gt;rotation, image, &amp;crop-&g=
t;combined_width, <br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &am=
p;crop-&gt;combined_length, crop_buff_ptr, NULL))<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &am=
p;crop-&gt;combined_length, crop_buff_ptr, NULL, TRUE))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0TIFFError(&quot;createCroppedImage&quot;, <br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;Failed=
 to rotate image or cropped selection by %&quot;PRIu16&quot; degrees&quot;,=
 crop-&gt;rotation);<br>
+@@ -8607,7 +8610,9 @@ rotateContigSamples32bits(uint16_t rotation, uint16_=
t spp, uint16_t bps, uint32_<br>
+ static int<br>
+ rotateImage(uint16_t rotation, struct image_data *image,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t *img_width,uint32=
_t *img_length,<br>
+-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char **ibuff_ptr, size=
_t *rot_buf_size)<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned char **ibuff_ptr, size=
_t *rot_buf_size,<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int rot_image_params)<br>
++<br>
+=C2=A0 =C2=A0{<br>
+=C2=A0 =C2=A0int=C2=A0 =C2=A0 =C2=A0 shift_width;<br>
+=C2=A0 =C2=A0uint32_t=C2=A0 =C2=A0bytes_per_pixel, bytes_per_sample;<br>
+-- <br>
+2.25.1<br>
+<br>
diff --git a/meta/recipes-multimedia/libtiff/<a href=3D"http://tiff_4.3.0.b=
b" rel=3D"noreferrer" target=3D"_blank">tiff_4.3.0.bb</a> b/meta/recipes-mu=
ltimedia/libtiff/<a href=3D"http://tiff_4.3.0.bb" rel=3D"noreferrer" target=
=3D"_blank">tiff_4.3.0.bb</a><br>
index 2be25756bc..2ee10fca72 100644<br>
--- a/meta/recipes-multimedia/libtiff/<a href=3D"http://tiff_4.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">tiff_4.3.0.bb</a><br>
+++ b/meta/recipes-multimedia/libtiff/<a href=3D"http://tiff_4.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">tiff_4.3.0.bb</a><br>
@@ -35,6 +35,8 @@ SRC_URI =3D &quot;<a href=3D"http://download.osgeo.org/li=
btiff/tiff-$%7BPV%7D.tar.gz" rel=3D"noreferrer" target=3D"_blank">http://do=
wnload.osgeo.org/libtiff/tiff-${PV}.tar.gz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2022-48281.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-0800_0801_0802_08=
03_0804.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2023-0795_0796_0797_07=
98_0799.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-25433.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://CVE-2023-25434-CVE-2023-25=
435.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;0e46e5acb087ce7d1ac53cf4f56a09b221537fc8=
6dfc5daaad1c2e89e1b37ac8&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#184859): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/184859" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/184859</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100345399/362=
0601" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/100345399/3620601</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:steve@sakoman.com" target=
=3D"_blank">steve@sakoman.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000eebe7a0601659945--

