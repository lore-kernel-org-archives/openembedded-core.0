Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0B14C04A68
	for <webhook@archiver.kernel.org>; Thu, 28 Jul 2022 13:21:27 +0000 (UTC)
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com
 [209.85.210.53])
 by mx.groups.io with SMTP id smtpd.web08.32469.1659014484850733438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 06:21:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=cySkxy7B;
 spf=pass (domain: gmail.com, ip: 209.85.210.53,
 mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f53.google.com with SMTP id
 k25-20020a056830169900b0061c6f68f451so1142741otr.9
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Jul 2022 06:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=qtyhF7hqYafTnxsBXcc3M83h40UVLRjZAKCIw6+bzWE=;
        b=cySkxy7BRfs9GfH7vUHy3hUlNpGN8M02BGVlA4LKNAMKUIkBdSE70r6RXQsnjvwwXW
         GkqZgkHWWaR1n15ubI80wo13cTsdH5lZO52JE+L6cKwY0OglYzur+sIjy05Mkyosc0Vs
         CEVe4HAOsZyWYoeNKyu4O6GlHDL3IuPkY3ecBi0pF7zIlGRPnYE7juIug0LGl02KUvAD
         ce0Z7bkDGASQ4rAg4N5PbKXSBv8hTOJ/sJZoj7mt0dikCHggfOlTpIiIPPcMkhT+Nb4h
         17eFn+IYfE9xgyj122fXkCwEkARPFra2/GHmqijT0WARidJXAH4z7ukIZ4aV8iudVGtb
         5bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:message-id:date:mime-version:user-agent
         :subject:content-language:to:references:in-reply-to
         :content-transfer-encoding;
        bh=qtyhF7hqYafTnxsBXcc3M83h40UVLRjZAKCIw6+bzWE=;
        b=TZVE9gwXKdI2DVwba2LGgBhXCDrUyne794UGrPGrLBio9eJbdDLOX0B7aK7FCpWLws
         h2m8aELL64jVDBRaX6cVmGNWGr98atvKsZYSfHTT5jT3Q5tHfItI1CeTIfr9yt/JMO5f
         linW5ouQPlzBetDHhGFXadWVuvEXv9lrjbdH4G4aQpFWRTN1AgsnMbyobXv9g7Bo0JLU
         sr4cNKOnkln33da4U5tr9sX0QFDBzeP2xB4tDfv7UBdfMSynyfKLXbMyKY+FgdnVCXNA
         w2ssfmApIpVIGxmsruVm679ReGx/67GcSiD47GYZOasMqayC+VFNkICpGDGWiOJtOfXz
         DW+Q==
X-Gm-Message-State: AJIora+WL3jpQfVuB3q5znfPoz9eKGWnENZFkggGxSDvfpKkzJvmrcxa
	CzYQPQR2Vm2U4o/C0e4VIPI=
X-Google-Smtp-Source: 
 AGRyM1sy0UPCACzxg6kEa1454JLHHl5X+vpVebCLC+QO0VdBv861gbo14ZKOrahTKFOMPYk//wfMgQ==
X-Received: by 2002:a9d:6f01:0:b0:61c:b224:e7c9 with SMTP id
 n1-20020a9d6f01000000b0061cb224e7c9mr10453503otq.245.1659014484174;
        Thu, 28 Jul 2022 06:21:24 -0700 (PDT)
Received: from ?IPV6:2605:a601:ac3d:c100:e3e8:d9:3a56:e27d?
 ([2605:a601:ac3d:c100:e3e8:d9:3a56:e27d])
        by smtp.gmail.com with ESMTPSA id
 j10-20020a54480a000000b0033a9f4c13cesm257834oij.13.2022.07.28.06.21.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jul 2022 06:21:23 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
Message-ID: <c8cec197-ace4-698e-5c41-112dd2d97207@gmail.com>
Date: Thu, 28 Jul 2022 08:21:22 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] create-spdx: Fix supplier field
Content-Language: en-US
To: Mihai Lindner <mihai.lindner@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20220727170918.6960-1-mihai.lindner@gmail.com>
In-Reply-To: <20220727170918.6960-1-mihai.lindner@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Jul 2022 13:21:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168604


On 7/27/22 12:09, Mihai Lindner wrote:
> The correct field name is "supplier" according to SPDX schema.
> The "supplier" field translates to "PackageSupplier", but that's for
> tag-value format.

LGTM, Thanks.


Reviewed-by: Joshua Watt <JPEWhacker@gmail.com>

>
> Signed-off-by: Mihai Lindner <mihai.lindner@gmail.com>
> ---
>   meta/classes/create-spdx.bbclass | 6 +++---
>   meta/lib/oe/spdx.py              | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/create-spdx.bbclass b/meta/classes/create-spdx.bbclass
> index 15cccac84b..21cd5be3cb 100644
> --- a/meta/classes/create-spdx.bbclass
> +++ b/meta/classes/create-spdx.bbclass
> @@ -451,7 +451,7 @@ python do_create_spdx() {
>       recipe.name = d.getVar("PN")
>       recipe.versionInfo = d.getVar("PV")
>       recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
> -    recipe.packageSupplier = d.getVar("SPDX_SUPPLIER")
> +    recipe.supplier = d.getVar("SPDX_SUPPLIER")
>       if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
>           recipe.annotations.append(create_annotation(d, "isNative"))
>   
> @@ -561,7 +561,7 @@ python do_create_spdx() {
>               spdx_package.name = pkg_name
>               spdx_package.versionInfo = d.getVar("PV")
>               spdx_package.licenseDeclared = convert_license_to_spdx(package_license, package_doc, d, found_licenses)
> -            spdx_package.packageSupplier = d.getVar("SPDX_SUPPLIER")
> +            spdx_package.supplier = d.getVar("SPDX_SUPPLIER")
>   
>               package_doc.packages.append(spdx_package)
>   
> @@ -901,7 +901,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages):
>       image.name = d.getVar("PN")
>       image.versionInfo = d.getVar("PV")
>       image.SPDXID = rootfs_spdxid
> -    image.packageSupplier = d.getVar("SPDX_SUPPLIER")
> +    image.supplier = d.getVar("SPDX_SUPPLIER")
>   
>       doc.packages.append(image)
>   
> diff --git a/meta/lib/oe/spdx.py b/meta/lib/oe/spdx.py
> index 14ca706895..6d56ed90df 100644
> --- a/meta/lib/oe/spdx.py
> +++ b/meta/lib/oe/spdx.py
> @@ -218,7 +218,7 @@ class SPDXPackage(SPDXObject):
>       SPDXID = _String()
>       versionInfo = _String()
>       downloadLocation = _String(default="NOASSERTION")
> -    packageSupplier = _String(default="NOASSERTION")
> +    supplier = _String(default="NOASSERTION")
>       homepage = _String()
>       licenseConcluded = _String(default="NOASSERTION")
>       licenseDeclared = _String(default="NOASSERTION")

