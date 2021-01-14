Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.875.1610653835170477495
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jan 2021 11:50:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jnEANEfF;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id md11so3707340pjb.0
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Jan 2021 11:50:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=0xetCljHSxwGCwezxTvY2mq5McZtDd2e1ntDugHwjqI=;
        b=jnEANEfFi9fzzSFaVTPMCcy/VNYBZSl1GM1a/S3izeaK2pNpGpmodhQw/lZ24lef7C
         ItNXfZLU3KBY3w7+1xBUpqAPJUElyaxhEhhGxaYvL3BDSg+YpZMfaCTlySazTB1BzPNw
         kWUz5D+BLFDIiRv9z1fo7zz63Gdippg79yB56ova+C/3JXkxLdUZE/7In4xaFEUDSIPq
         nja+dA5ALV2tLLR0x+Fe1OoH2wmBDJX+bP2vSy6EnoBC4Ag+ML8vHoPlMVrQMbSBHtnW
         83QSfqvdD6GtJzbRIOE77wCLbZcSGza5YSIJT7Gnkamssh9U5tLNfOZnXDsQW1vMx3Or
         Jmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=0xetCljHSxwGCwezxTvY2mq5McZtDd2e1ntDugHwjqI=;
        b=WZBLcfuLDxTGxY+8OMwVIpp+4NNcwIqiZGTa+ooU1CsIva1USCk3weFLNfr9aFVuY2
         AhhOdbM/tv4wwSsgGd3heJ/gETo1Mlw3C72N5Q9kHxbnT7sp4RoiGV9OEmmaxWT/1ovq
         d9hQJ8OM43U1IyP+Ua7tbznAdqHGZiiTAZZk0UJWEGqqj9/gYZnB7BEH21UJe7tNZB7N
         nyNSW3zgWq0gvdd8C1+c1wKIDu4DHzLE+Oa58Ypbc4qq8G2UboIsjma97FIa5x2D90T6
         THHLwzdYuk9vGjF3Fi68UCPgVY66VH31sdey7ezqy+TcCe8MSm5Za9t0yv5ml6UrLlG0
         eypw==
X-Gm-Message-State: AOAM530cHyw9J6JzINPYBFWC8hIbZMh3GT6d+zgLwDgtf2UfewLDKJIo
	93DZ2B/vb1w9RvKVfRt+ONg=
X-Google-Smtp-Source: ABdhPJy9njQAxI6B7sfjKLZ/Zxh76KCS4wH1CkBYyFZsSjhBdybsHE5Rn+hsoN4DBPb2C+AZPtFwOA==
X-Received: by 2002:a17:90b:1901:: with SMTP id mp1mr6599830pjb.233.1610653834591;
        Thu, 14 Jan 2021 11:50:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:db81:2f56:60e4:2c64? ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id j20sm5806857pfd.106.2021.01.14.11.50.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jan 2021 11:50:33 -0800 (PST)
Subject: Re: [meta-oe][master][PATCH] rapidjson: Upgrade SRCREV to latest
To: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>,
 openembedded-core@lists.openembedded.org
Cc: nisha.parrakat@kpit.com, aditya.tayade@kpit.com
References: <1610627611-12109-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
From: "Khem Raj" <raj.khem@gmail.com>
Message-ID: <b13448d0-fb2b-1974-5933-6dd8d5c65a28@gmail.com>
Date: Thu, 14 Jan 2021 11:50:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <1610627611-12109-1-git-send-email-Harpritkaur.Bhandari@kpit.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit


i have staged this patch for meta-openembedded master but note that this 
is sent to wrong mailing list it should have been sent to oe-devel ml.
So once its applied to master send a dunfell backport to appropriate ml

On 1/14/21 4:33 AM, Harpritkaur Bhandari wrote:
> Upgrade SRCREV to latest as it fixes the below issue:
> Running UndefinedBehaviorSanitizer on projects that use
> rapidjson triggers 'applying non-zero offset <NN> to null
> pointer' findings in 'internal/stack.h' which are hard
> to suppress by library users.
> Removed "0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
> as the changes are already incorporated in the latest
> codebase.
> As per abi-compliance-checker report the source compatibility
> and binary compatibility between previous SRCREV
> 6a905f9311f82d306da77bd963ec5aa5da07da9c and current
> SRCREV 0ccdbf364c577803e2a751f5aededce935314313
> is 100% and this patch is already tested on 64bit
> ARM (aarch64) in a product with on target CI tests.
> 
> Signed-off-by: Harpritkaur Bhandari <Harpritkaur.Bhandari@kpit.com>
> ---
>   meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> index e3ed9c6..5b5c8b2 100644
> --- a/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> +++ b/meta-oe/recipes-devtools/rapidjson/rapidjson_git.bb
> @@ -4,10 +4,9 @@ SECTION = "libs"
>   LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://license.txt;md5=ba04aa8f65de1396a7e59d1d746c2125"
> 
> -SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1 \
> -           file://0001-CMake-remove-hardcoded-CMAKECONFIG_INSTALL_DIR-path.patch"
> +SRC_URI = "git://github.com/miloyip/rapidjson.git;nobranch=1"
> 
> -SRCREV = "6a905f9311f82d306da77bd963ec5aa5da07da9c"
> +SRCREV = "0ccdbf364c577803e2a751f5aededce935314313"
> 
>   PV = "1.1.0+git${SRCPV}"
> 
> --
> 2.7.4
> 
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.
> 
