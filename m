Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1ACC4708D
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 14:09:20 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.14185.1673014153042581834
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jan 2023 06:09:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=c7SBZaIf;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.45, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f45.google.com with SMTP id vm8so3721949ejc.2
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 06:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q24D3IslPVvUG8s2QZ5/K2puwyqr8mUMKl4TTz9AexU=;
        b=c7SBZaIfV1PVm1WQtRg6GeuV7mYe8oIMmUvUfENfqN7uIfSjHU4454sJF6Je5XJ9xU
         jQS6bPMmTcf52HS8tKMjNU/AfpZj1T/vzQfIt/Vl8f/+NatQx9+chL1EgkOW8lpawODh
         SDAKnt3vohY+yMI8SoDy3IVNssGid9GqH5Teb1zIq8QW+6/0bArQOAptnMS0riMhggJD
         eTzpB9zn/lKyMqzM+CV68kHSeTdNHpMyjdmFj/cR6A5HmCAXm/QVm0iokwq4Pro7ue3T
         y3Sfkp1KAT1o4Ik5x0UZ+iM0f8BDNyod13QiBBsexRxs/Rt0sGVd2VBeChXVyn1smCyR
         pm0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q24D3IslPVvUG8s2QZ5/K2puwyqr8mUMKl4TTz9AexU=;
        b=idgWVT/4ZpX0SUm3y3I6t0unYdOT6/6JB2SjqevpOD7ShxA9AY75tnGd975O6KYZ9p
         AhmiL2uCQ5F3hgfgNLWehXql8ryZl9pFdCiaGWyGfDAQtWrKEks/FGotDxgvDr1i0QHI
         1EL/mFkCbXGSTukiQXXPyp5EBfak+VbNhYVulAW3v9+P0PoDLsDJePH/19Po9bHoE07R
         VRDCd/gWQS7i7wYg9o3z032FEn2cKb8LmW6HcSbTRigyxwgReOCt0twjrvRNkb6vWsbz
         baTBMz8rzIjI3JILl/unjUHK5KOvoKZnso9zfGD+T42LDGa9TQRNunzuehXoBCUd5H8O
         ISFQ==
X-Gm-Message-State: AFqh2ko9jZwU5Nml2bH8+B1FBgJLsLh4R/8iYGpTirsT5xpdDzNA+5O+
	0tKj7BQ8Lpi/lNpqeDjBn9alo2PXdAQlq8ptzP2fNg==
X-Google-Smtp-Source: AMrXdXsOcIdX0l1kQV+y2anIxrPJYDMBgG/60n7cxa7HPxDtNqyY/RZlXkAgfP8F13fQFVI7yTwYkURLmeUJ2QbWHE4=
X-Received: by 2002:a17:906:99c9:b0:845:bee7:e361 with SMTP id
 s9-20020a17090699c900b00845bee7e361mr2838047ejn.435.1673014151299; Fri, 06
 Jan 2023 06:09:11 -0800 (PST)
MIME-Version: 1.0
References: <20230106132858.3497824-1-karn.jye.lau@intel.com>
In-Reply-To: <20230106132858.3497824-1-karn.jye.lau@intel.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Fri, 6 Jan 2023 04:09:00 -1000
Message-ID: <CAOSpxda_x0JW=DKDY7YcEwVAtwu+y0XOFSfhTV6MBfeJKNrEag@mail.gmail.com>
Subject: Re: [OE-core] [OE][kirkstone][PATCH] freetype:update mirror site.
To: karn.jye.lau@intel.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jan 2023 14:09:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175591

On Fri, Jan 6, 2023 at 3:30 AM <karn.jye.lau@intel.com> wrote:
>
> From: KARN JYE LAU <karn.jye.lau@intel.com>
>
> update SAVANNAH_NONGNU_MIRROR to SAVANNAH_GNU_MIRROR
> to resolve package fetching issues.

Is this also an issue in the master branch, which also uses
SAVANNAH_NONGNU_MIRROR?

If so, please submit for master first, and I will cherry-pick for kirkstone.

Steve

> Signed-off-by: KARN JYE LAU <karn.jye.lau@intel.com>
> ---
>  meta/recipes-graphics/freetype/freetype_2.11.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-graphics/freetype/freetype_2.11.1.bb b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
> index 5b464d3d70..d425e162bc 100644
> --- a/meta/recipes-graphics/freetype/freetype_2.11.1.bb
> +++ b/meta/recipes-graphics/freetype/freetype_2.11.1.bb
> @@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.TXT;md5=a5927784d823d443c6cae55701d01553 \
>                      file://docs/FTL.TXT;md5=9f37b4e6afa3fef9dba8932b16bd3f97 \
>                      file://docs/GPLv2.TXT;md5=8ef380476f642c20ebf40fecb0add2ec"
>
> -SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BP}.tar.xz \
> +SRC_URI = "${SAVANNAH_GNU_MIRROR}/${BPN}/${BP}.tar.xz \
>             file://CVE-2022-27404.patch \
>             file://CVE-2022-27405.patch \
>             file://CVE-2022-27406.patch \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175588): https://lists.openembedded.org/g/openembedded-core/message/175588
> Mute This Topic: https://lists.openembedded.org/mt/96092985/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

