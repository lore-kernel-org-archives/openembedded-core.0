Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AE8C83F26
	for <webhook@archiver.kernel.org>; Thu, 24 Jul 2025 15:57:59 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.232.1753372669912252040
 for <openembedded-core@lists.openembedded.org>;
 Thu, 24 Jul 2025 08:57:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YnaeAChU;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7183dae670dso10948917b3.2
        for <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 08:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753372669; x=1753977469; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MXwf9gwIAevVvGEBZxxrugz1wT+bzKsvwGX2n6dhE2U=;
        b=YnaeAChUki80AW6leNfa7cduB3DHXG9oXb9U589pWDtjc7t83zOYOolx7tMWAzlFkP
         LArha7yESZtLepVFZojvggRG+vOAW4U0exig0ejrbudanhMUV2JL4nRz6+yo6z1ZbK8u
         GjyHYFwO9EpjuJpqa5skxT9izc04a3/DpiqkFF3d8VtBhhkxZPy5fecY3g7PJNcdco+i
         0pOlAWltDWx2fgB4zjK0go5k7RYC0zmD8rYw7qeTJEh7CvsNlya9PxYZbJOymJo3iuVE
         iWPHW2WLJZvQevzE7eUV+8MhMnxcqfq3WyivNYjlWv1lU5Uw/jCT1xjwbC1fu7rEySUB
         dNVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753372669; x=1753977469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MXwf9gwIAevVvGEBZxxrugz1wT+bzKsvwGX2n6dhE2U=;
        b=DGcwiUdgsP/+gqm3p4VcG6quybcFcorRPRvYw7YZ8E2WQHUbdUXlWByuWTLhqIJ3mV
         LjNGBsluUZrZEhI/Waj3KTcrqlDiugv+h3v0BMMpDOfycjpUDNDqfil9hA4UBwpu9hB0
         p9SWMxPa9sWL+3LFzkJe/HhXrRsN2j2Hg/1i8SdLO+CSPd5ZXlwoQRIWuqr56+CyoXNz
         a2UTtCYTuihKWpUnVnBWyzpfdbF4n3c/C8RsZWPENg0HX/sDNGlUcH4nF8qcyr0nYHlX
         UTv4tSzQHRABOZvE1EivbqechLsCd8lKwC0piWX0bS0cIYsPjmZ36T+EMzCvf4lNlk/O
         63Kw==
X-Gm-Message-State: AOJu0YxCJ45y8HG3QX64m90FvKVO3hU7NvuFVPRGnQdOrTeM2CgtYOag
	J/RU+7qIzFP3AKXt3g0BamAa1sYSbYTS3hhwr5dpqxVbd/Uaxftdagd9dWpwkuixmatPnWpWYjd
	Jzl8ItdtA9ivj9HaLVsFXs8kT1qo+5cDPyV2+RO4=
X-Gm-Gg: ASbGncs3CuXBaEPZssNkd7EWC5qBq3WCNxXPN3avCasK3wKRaBPUZpKKimav6FSZkJo
	tgjJV8lzipr0tjbCcsa2RMRZKeMqnf9GrwJViVHJbIh2nThCraTXcYONIWnJKlLNBqXsdSS8krH
	o0snjajavnhZsphUGpt5EFBRaQcoO530X9+V3HiPulyaZ3BeCM+yIdW7hJ+wdYH7jZrBcbEdUdn
	t6YILrgavowT7BC8M3yvLz5A44kuaXHdZlpdow1
X-Google-Smtp-Source: AGHT+IHNNaRUskNuBdDJ2u7Rp4qY/BSj/Q7dhlh8QaTTD1kE8ejYhJVCKW+hV8jVhulSYiwdvsGEg5TakRKV/3HeIbY=
X-Received: by 2002:a05:690c:6608:b0:716:3f46:2cf5 with SMTP id
 00721157ae682-719b3f70375mr97696087b3.0.1753372668750; Thu, 24 Jul 2025
 08:57:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250724103153.532074-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20250724103153.532074-1-Deepesh.Varatharajan@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 24 Jul 2025 08:57:22 -0700
X-Gm-Features: Ac12FXy46Vc3PVssLP2X3bEwPaKi_UiBDPpGDwdDh52BL3ey2mjg5hRtvinRgMA
Message-ID: <CAMKF1sqd-r53HWziaq9oYhUVM4MLrvvGJa0dLocxAxt4MJVjTQ@mail.gmail.com>
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: Fix CVE-2025-7545
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 24 Jul 2025 15:57:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220839

On Thu, Jul 24, 2025 at 3:32=E2=80=AFAM Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> objcopy: Don't extend the output section size
> Since the output section contents are copied from the input, don't
> extend the output section size beyond the input section size.
>
> Backport a patch from upstream to fix CVE-2025-7545
> Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.g=
it;a=3Dpatch;h=3D08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]
>

Looks good.

> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> ---
>  .../binutils/binutils-2.42.inc                |  1 +
>  .../binutils/0023-CVE-2025-7545.patch         | 39 +++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 meta/recipes-devtools/binutils/binutils/0023-CVE-2025=
-7545.patch
>
> diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/reci=
pes-devtools/binutils/binutils-2.42.inc
> index 9471e6accd..c2685948f7 100644
> --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
> +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
> @@ -53,5 +53,6 @@ SRC_URI =3D "\
>       file://CVE-2025-1179.patch \
>       file://0022-CVE-2025-5245.patch \
>       file://0022-CVE-2025-5244.patch \
> +     file://0023-CVE-2025-7545.patch \
>  "
>  S  =3D "${WORKDIR}/git"
> diff --git a/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.p=
atch b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch
> new file mode 100644
> index 0000000000..de132f74fc
> --- /dev/null
> +++ b/meta/recipes-devtools/binutils/binutils/0023-CVE-2025-7545.patch
> @@ -0,0 +1,39 @@
> +From: "H.J. Lu" <hjl.tools@gmail.com>
> +Date: Sat, 21 Jun 2025 06:36:56 +0800
> +
> +Upstream-Status: Backport [https://sourceware.org/git/?p=3Dbinutils-gdb.=
git;a=3Dpatch;h08c3cbe5926e4d355b5cb70bbec2b1eeb40c2944]
> +CVE: CVE-2025-7545
> +
> +Since the output section contents are copied from the input, don't
> +extend the output section size beyond the input section size.
> +
> +       PR binutils/33049
> +       * objcopy.c (copy_section): Don't extend the output section
> +       size beyond the input section size.
> +
> +Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
> +
> +diff --git a/binutils/objcopy.c b/binutils/objcopy.c
> +index a85d2620..18cd1bfd 100644
> +--- a/binutils/objcopy.c
> ++++ b/binutils/objcopy.c
> +@@ -4547,6 +4547,7 @@ copy_section (bfd *ibfd, sec_ptr isection, void *o=
bfdarg)
> +         char *to =3D (char *) memhunk;
> +         char *end =3D (char *) memhunk + size;
> +         int i;
> ++        bfd_size_type memhunk_size =3D size;
> +
> +         /* If the section address is not exactly divisible by the inter=
leave,
> +            then we must bias the from address.  If the copy_byte is les=
s than
> +@@ -4566,6 +4567,11 @@ copy_section (bfd *ibfd, sec_ptr isection, void *=
obfdarg)
> +             }
> +
> +         size =3D (size + interleave - 1 - copy_byte) / interleave * cop=
y_width;
> ++
> ++         /* Don't extend the output section size.  */
> ++         if (size > memhunk_size)
> ++           size =3D memhunk_size;
> ++
> +         osection->lma /=3D interleave;
> +         if (copy_byte < extra)
> +           osection->lma++;
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#220833): https://lists.openembedded.org/g/openembedde=
d-core/message/220833
> Mute This Topic: https://lists.openembedded.org/mt/114318691/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

