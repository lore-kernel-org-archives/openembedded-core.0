Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22D93C433F5
	for <webhook@archiver.kernel.org>; Wed, 16 Mar 2022 10:30:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.23027.1647426651641274908
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 03:30:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ODDZfvyJ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 129so68445wmc.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Mar 2022 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=KOqxL+K92c8XCWg7CHYSr721KelX4IQdperlIhlXl6Q=;
        b=ODDZfvyJwyChWF+DlswVxY6R59Z4t0bvjnzkQxkPmBpNyi972tlgf/SYssQn9Fk3tF
         L/S53mnZ6G208LkjqVi1ROuUpeiF/SEuapsFombATfCBi8rWdzXa/5caRRmNPaf7DKaK
         9QHcCxKCBjfldaLpvw/c197NJJ3uYHEhuWsO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=KOqxL+K92c8XCWg7CHYSr721KelX4IQdperlIhlXl6Q=;
        b=kZHdTxlhdcb+JCl58giy2E96NjExg4ekfjn05B8j3wEvGBWpUJGGQHHF3Dn3djGBj5
         8u+y9owbX2DWckXCh0t/YgyC8hXExARij9stWWTxd/1XP6QFWq2Snj1WpbW6MOaspNEn
         eimtKU6tyXdTySRdslXlzSqwy3xD6Ljuotp9CwEvXCP4rMwBN9eLckvgFRpavPPJGfPY
         K6LiX/BWy4aLim1a3WhCljvstqVWWKP6oNhbXEZWcIDOLO6fhfwF1wV7ooUl6N5QDRSK
         giLZ26pa5Wbj1vcZ3BALOsIpaR4MCGGPjCv8DOebuYU+1pMjxwU/gikfww10Y/Z5Dy1l
         JSRA==
X-Gm-Message-State: AOAM532Ul0HX0gjftSaV5DFue14uw77WNSh/Cu/mDGr/FnubJEI9E/De
	jQ8obMsWkClZW/pFLYJz+e6sdw==
X-Google-Smtp-Source: 
 ABdhPJwjQmiT8wGcpEpmXzibaeGD/f4hA8sq+u5mU3dRwyuYsDfd66kOJklNX2P+UhsIcJw5Pr6hIA==
X-Received: by 2002:a05:600c:4fcf:b0:389:ec8c:b427 with SMTP id
 o15-20020a05600c4fcf00b00389ec8cb427mr6695553wmq.152.1647426650032;
        Wed, 16 Mar 2022 03:30:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:bc44:1420:18a9:e343?
 ([2001:8b0:aba:5f3c:bc44:1420:18a9:e343])
        by smtp.gmail.com with ESMTPSA id
 l9-20020a5d6d89000000b00203d62072c4sm1399365wrs.43.2022.03.16.03.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Mar 2022 03:30:49 -0700 (PDT)
Message-ID: 
 <8096196d8428377e5c277ffab8be51dfb138d1b0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/3] lttng-modules: remove redundant
 devupstream assignments
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 16 Mar 2022 10:30:46 +0000
In-Reply-To: <20220315162345.613041-2-ross.burton@arm.com>
References: <20220315162345.613041-1-ross.burton@arm.com>
	 <20220315162345.613041-2-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Mar 2022 10:30:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163328

On Tue, 2022-03-15 at 16:23 +0000, Ross Burton wrote:
> These are set by devupstream, so they don't need to be set in the recipe.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb b/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
> index a8e4cc5afa..80877bcf5e 100644
> --- a/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
> +++ b/meta/recipes-kernel/lttng/lttng-modules_2.13.1.bb
> @@ -42,11 +42,6 @@ python do_package:prepend() {
>  }
>  
>  BBCLASSEXTEND = "devupstream:target"
> -LIC_FILES_CHKSUM:class-devupstream = "file://LICENSE;md5=0464cff101a009c403cd2ed65d01d4c4"
> -DEFAULT_PREFERENCE:class-devupstream = "-1"
>  SRC_URI:class-devupstream = "git://git.lttng.org/lttng-modules;branch=stable-2.13"
> -
>  SRCREV:class-devupstream = "7584cfc04914cb0842a986e9808686858b9c8630"
> -PV:class-devupstream = "2.13.1+git${SRCPV}"
> -S:class-devupstream = "${WORKDIR}/git"
>  SRCREV_FORMAT ?= "lttng_git"

I think you need to leave PV?

Cheers,

Richard


