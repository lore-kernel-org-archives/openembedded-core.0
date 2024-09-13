Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7F6EEEC39
	for <webhook@archiver.kernel.org>; Fri, 13 Sep 2024 06:35:18 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.67744.1726209314076922719
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Sep 2024 23:35:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GiiOQekV;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-378c16a4d3eso590236f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Sep 2024 23:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1726209312; x=1726814112; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQMmwMol3q27RCRVBwEfRIArzLDuVjCdtnzTX5q9KDk=;
        b=GiiOQekV1I65/rOMcBuq59sCT2CveVv9fb8Aoi5nOXWVvRg17l/8eL7quTgCqjjZyN
         szAUeMr0NFCgglwlqBeqAvWu3Hi2ajBa6Z5p3uuEvewRiLR4jL16FhvbJD0vKejdhPju
         hYBqZM5wPoqjS3RYNlWc0NOso/l3hQXVvPawg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726209312; x=1726814112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQMmwMol3q27RCRVBwEfRIArzLDuVjCdtnzTX5q9KDk=;
        b=wmV6Bmzrf1g92S9phod9SAEhi0dOUMPW3vdUhcQCaahSqy8qoHgKfdh5LY4V6NBw2i
         YtJ4vVvCfe+HIJawYmedjqOA+xXCzIvGcb9WL5m0+V/XTmy9Ztw3mC/HIy5h/m912tIX
         jCyQejs3LAiNrbqvIq8PwUbufGbdx9Ds11Wk1YQap8yIiGxc6SUK17X7s1u4Jj2H8an9
         vaeyNHxk++81eoxwbFj/0ovewilB4y85f8wUj6E3NTqbcY/mdy6iztNx8y4C+hcUmFRm
         fDAE/dsu07wgtmVuXaGgk+4vKqFSscOwdNgVsHc/6sTWIExISeEDj6/LHkchdttCPIQf
         amTA==
X-Gm-Message-State: AOJu0YxBVsQejr89UAu6P/6fMIQFzp8aW6NKePiVqaGLxSOTMoMFpG3G
	RrFPqmQnkGq7RlqfadSu7VKbyyDEtxkoKwWFPqYARt/hPOuRWPagoKyFM6kB9T40bHR43yc77mm
	PLV1E5+0R41YWC0yKJbZNtfFXc3BqPWKLVFhIbgljO/1BWLcejXQ=
X-Google-Smtp-Source: AGHT+IHuStLs3s6XzTruRyOaBso0EUNTvwAb10YpqDTIn01qDzhAj/7KmgFNcmjzjaLmrmPkiRa8JUsbePPZGNk7VXY=
X-Received: by 2002:a5d:4589:0:b0:374:c9f0:7533 with SMTP id
 ffacd0b85a97d-378d6236beamr1298373f8f.41.1726209311453; Thu, 12 Sep 2024
 23:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240912225741.2147108-1-yoann.congal@smile.fr>
In-Reply-To: <20240912225741.2147108-1-yoann.congal@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 13 Sep 2024 08:34:45 +0200
Message-ID: <CAMSfU+6UFNDFb7LUULAryQn2cZE9y4dprmoWaMOLEwsyC4Sfow@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] cve-exclusion: Drop the version comparision/warning
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Sep 2024 06:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204471

Le ven. 13 sept. 2024 =C3=A0 00:59, Yoann Congal <yoann.congal@smile.fr> a =
=C3=A9crit :
>
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Since the CVE repository is no longer being updated, drop the warning
> comparision since it is no longer valid.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 9a232a9c3023dfec7e2d2c7e384d64006d1cf1af)
> Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> Backport: Applied the idea of the original patch to the corresponding
> files.
> ---

Maybe I should have added that this is to avoid the warning on every
kirkstone metrics AB run :
https://autobuilder.yoctoproject.org/typhoon/#/builders/138/builds/2234

>
>  meta/recipes-kernel/linux/cve-exclusion_5.10.inc | 14 +++++++-------
>  meta/recipes-kernel/linux/cve-exclusion_5.15.inc | 14 +++++++-------
>  2 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc b/meta/reci=
pes-kernel/linux/cve-exclusion_5.10.inc
> index 4d959c90b1..4ce0664c0d 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion_5.10.inc
> @@ -2,13 +2,13 @@
>  # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
>  # Generated at 2024-02-21 03:55:27.305577 for version 5.10.209
>
> -python check_kernel_cve_status_version() {
> -    this_version =3D "5.10.209"
> -    kernel_version =3D d.getVar("LINUX_VERSION")
> -    if kernel_version !=3D this_version:
> -        bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
> -}
> -do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
> +#python check_kernel_cve_status_version() {
> +#    this_version =3D "5.10.209"
> +#    kernel_version =3D d.getVar("LINUX_VERSION")
> +#    if kernel_version !=3D this_version:
> +#        bb.warn("Kernel CVE status needs updating: generated for %s but=
 kernel is %s" % (this_version, kernel_version))
> +#}
> +#do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
>
>  # fixed-version: Fixed after version 2.6.12rc2
>  CVE_CHECK_IGNORE +=3D "CVE-2003-1604"
> diff --git a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc b/meta/reci=
pes-kernel/linux/cve-exclusion_5.15.inc
> index f5ccf2bc22..1f5c783db4 100644
> --- a/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
> +++ b/meta/recipes-kernel/linux/cve-exclusion_5.15.inc
> @@ -2,13 +2,13 @@
>  # Auto-generated CVE metadata, DO NOT EDIT BY HAND.
>  # Generated at 2024-05-02 12:18:54.390781 for version 5.15.157
>
> -python check_kernel_cve_status_version() {
> -    this_version =3D "5.15.157"
> -    kernel_version =3D d.getVar("LINUX_VERSION")
> -    if kernel_version !=3D this_version:
> -        bb.warn("Kernel CVE status needs updating: generated for %s but =
kernel is %s" % (this_version, kernel_version))
> -}
> -do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
> +#python check_kernel_cve_status_version() {
> +#    this_version =3D "5.15.157"
> +#    kernel_version =3D d.getVar("LINUX_VERSION")
> +#    if kernel_version !=3D this_version:
> +#        bb.warn("Kernel CVE status needs updating: generated for %s but=
 kernel is %s" % (this_version, kernel_version))
> +#}
> +#do_cve_check[prefuncs] +=3D "check_kernel_cve_status_version"
>
>  # fixed-version: Fixed after version 2.6.12rc2
>  CVE_CHECK_IGNORE +=3D "CVE-2003-1604"



--=20
Yoann Congal
Smile ECS - Tech expert

