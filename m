Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A03CC433F5
	for <webhook@archiver.kernel.org>; Thu,  4 Nov 2021 17:46:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web09.1106.1636047991603061651
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 10:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kGbCq9gd;
 spf=pass (domain: gmail.com, ip: 209.85.128.47,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id
 r9-20020a7bc089000000b00332f4abf43fso5607949wmh.0
        for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Nov 2021 10:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RgU5fEE+l4sUvn5fk86/Z/nLLDG8580BbRTqa/T3pfA=;
        b=kGbCq9gd6h/Iiu3SaQ+JfmNi+0QINFLu8z9Nv4z0y1CmSvHCMEbGjZHprtxxokSnaX
         Z8eTTDyebw3idPfxCd1py67KBrztwq3R66iE7uvOoasp8rCWEgaftNj1ohHcrcIkmbkH
         qpArXVxmcBFd6zepCwBsF3i+BIdGH+u5RgGWc9LJoYOdr2KUc+HNLPojR5Ndi9kGndBT
         ObJmLSaneLyy45PwkNWf0I9QyiJ8H+4LwThNrM/LsgT8ZCG+jpgvpBb8nGPzH+ezB0ev
         E6Y8arXiZrEycAqZBzl0vkmbtyGTy5o9PHp2H7k/oxWj7A+7BIdPXFr8toSxoQyoi5hN
         ZLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RgU5fEE+l4sUvn5fk86/Z/nLLDG8580BbRTqa/T3pfA=;
        b=bFRMBI2KCySRtN73vw1kvWqESbD7TYp7Tx/lv0vVpJSaminzz975FBWg3Yql2Yw1uC
         UoTXNhkH4qBkNreW7rO2vi8NLPIYxZeee6HQPIHzlgXi+0h4OVgmQQiW+yI+9VXY95YS
         fXGs4kpM5SI+QLBAUreFMph2u0y0iy65+sr96MzIxcKsifwkvvF3XqFaEFe/ZaEJqcaG
         kS65so3x1f5+NU8HmveIiazNZyZWGvE1FM4+qwAarA34uRZkBtNcbcMFGcOwbDF2tj6G
         hiGk4PKs7aElfNin26mfO0+SBJqprU78XzyB0VL9IZeT8KPoxEhLOtFAQAE1nPSnvyU1
         D/lg==
X-Gm-Message-State: AOAM5310pKomtORAKmizkb4J88K/Da1T1hrC0t9G/wfw3aGMPTdNSeLd
	G/J7Pi2OdIQlkEmDxQ9WYKEXpETcP96+NeISIrQ=
X-Google-Smtp-Source: 
 ABdhPJwwqQh+pBTRIL/Wy1u+JrOYdL0ytsFG1L7ABTc9/TL2s0ICwNTsghaWDE1CKHkEA8qMUfQwAOxzL/UnIrGrKfM=
X-Received: by 2002:a7b:cd03:: with SMTP id f3mr25170890wmj.89.1636047989810;
 Thu, 04 Nov 2021 10:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211104164856.2835-1-abeltran@linux.microsoft.com>
In-Reply-To: <20211104164856.2835-1-abeltran@linux.microsoft.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Thu, 4 Nov 2021 12:46:18 -0500
Message-ID: 
 <CAJdd5GYc8_osEj8q9kAQabQUrR+FKYZ=zn8W9ctx5g-tiFW=nQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] create-spdx: Set the Organization field via a
 variable
To: Andres Beltran <abeltran@linux.microsoft.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Nov 2021 17:46:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157856

On Thu, Nov 4, 2021 at 11:49 AM Andres Beltran
<abeltran@linux.microsoft.com> wrote:
>
> Currently, the "Organization" field for SBOMs is hard-coded in
> create-spdx. Create a new variable SPDX_ORG to make this field more
> generic.
>
> Signed-off-by: Andres Beltran <abeltran@linux.microsoft.com>

LGTM

Reviewed-By: Joshua Watt <JPEWhacker@gmail.com>

> ---
>  meta/classes/create-spdx.bbclass | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
> index c35dbe11849..eb1d446f3fb 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -28,6 +28,8 @@ SPDX_NAMESPACE_PREFIX ??= "http://spdx.org/spdxdoc"
>
>  SPDX_LICENSES ??= "${COREBASE}/meta/files/spdx-licenses.json"
>
> +SPDX_ORG ??= "OpenEmbedded ()"
> +
>  do_image_complete[depends] = "virtual/kernel:do_create_spdx"
>
>  def get_doc_namespace(d, doc):
> @@ -415,7 +417,7 @@ python do_create_spdx() {
>      doc.creationInfo.comment = "This document was created by analyzing recipe files during the build."
>      doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
>      doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
> -    doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
> +    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
>      doc.creationInfo.creators.append("Person: N/A ()")
>
>      recipe = oe.spdx.SPDXPackage()
> @@ -519,7 +521,7 @@ python do_create_spdx() {
>              package_doc.creationInfo.comment = "This document was created by analyzing packages created during the build."
>              package_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
>              package_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
> -            package_doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
> +            package_doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
>              package_doc.creationInfo.creators.append("Person: N/A ()")
>              package_doc.externalDocumentRefs.append(recipe_ref)
>
> @@ -653,7 +655,7 @@ python do_create_runtime_spdx() {
>              runtime_doc.creationInfo.comment = "This document was created by analyzing package runtime dependencies."
>              runtime_doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
>              runtime_doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
> -            runtime_doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
> +            runtime_doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
>              runtime_doc.creationInfo.creators.append("Person: N/A ()")
>
>              package_ref = oe.spdx.SPDXExternalDocumentRef()
> @@ -813,7 +815,7 @@ python image_combine_spdx() {
>      doc.creationInfo.comment = "This document was created by analyzing the source of the Yocto recipe during the build."
>      doc.creationInfo.licenseListVersion = d.getVar("SPDX_LICENSE_DATA")["licenseListVersion"]
>      doc.creationInfo.creators.append("Tool: OpenEmbedded Core create-spdx.bbclass")
> -    doc.creationInfo.creators.append("Organization: OpenEmbedded ()")
> +    doc.creationInfo.creators.append("Organization: %s" % d.getVar("SPDX_ORG"))
>      doc.creationInfo.creators.append("Person: N/A ()")
>
>      image = oe.spdx.SPDXPackage()
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157854): https://lists.openembedded.org/g/openembedded-core/message/157854
> Mute This Topic: https://lists.openembedded.org/mt/86820747/3616693
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [JPEWhacker@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

