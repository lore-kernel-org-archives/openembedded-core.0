Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6F6C433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Jan 2022 11:59:45 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web08.30521.1641815984983860040
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 03:59:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=SxTGwlZA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id v6so26220625wra.8
        for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Jan 2022 03:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=+TgIVjnRdtXdy8LovQvOLVsDMMzepVQbssaSfxPsdmM=;
        b=SxTGwlZApC3McRW9vQMDrC0eIsnejiujGiO+4d8NSqhZ11s/UwakM9gy3+QeT1ACjt
         s7DQqYoQaMKyCW8GMYqwN2gmRrbPMjAzusifQWhBIj9h4qZNyd7KL57dMIAlsM/CogSf
         +pkKVFXLkQhF5Vmu6uFTRdEvOmVnQRJOlVB6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+TgIVjnRdtXdy8LovQvOLVsDMMzepVQbssaSfxPsdmM=;
        b=VOCgAZs4rPcNhG7Y9WvaNpndz1tVLAax8pF178moLy0ApniPrlbGIJDdPgPuI/VnPv
         4a/LlbQiRVC4PeXoNHzWb/yokRLFG4bKC/9ZumXLwBB0Z5yuKPOcsktwCz6KbmsZmMKM
         apRU7LtJqP0jq3yNT823dHzts4bV7G9gI3WKx80fHYuE0+Y+riElzrpg39iXU/DxVqrG
         XcXSurqbQng7KLEtNGGq3Ly+Wl900UALXbP6fcCQD2Rjv1L7IKMVRWEBCdkS7JrP4OsK
         0ZeClQ/Cu6OA6IhOnjTkvtoq0EfGLZaX8E/+Rg1L1R67Nrx/lIiRq6kMM/x/4Gb99soi
         nfwA==
X-Gm-Message-State: AOAM531mV1hZOM50LH3t0S1643YbtgwjCNd7atzxKzsrCYyHQlKOMqJh
	KrIeranFvNt4WoEzjAzT+Q/kfw==
X-Google-Smtp-Source: 
 ABdhPJwuV3kzJutnsKaqP/L72DxLxm+yX4rOmHZvoxI5I1RzyVWiFFkZWD5/ebTU8L3kfdF3t5ri/A==
X-Received: by 2002:a5d:64a2:: with SMTP id m2mr64630249wrp.102.1641815983349;
        Mon, 10 Jan 2022 03:59:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:988f:80f:f286:3191?
 ([2001:8b0:aba:5f3c:988f:80f:f286:3191])
        by smtp.gmail.com with ESMTPSA id
 m35sm11630547wms.1.2022.01.10.03.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 03:59:43 -0800 (PST)
Message-ID: 
 <31e42a0753fbb1355ddad0f87fef1effff493de2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] xserver-xorg: update CVE_PRODUCT
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anuj Mittal <anuj.mittal@intel.com>,
	openembedded-core@lists.openembedded.org
Date: Mon, 10 Jan 2022 11:59:40 +0000
In-Reply-To: <20211229013456.474188-1-anuj.mittal@intel.com>
References: <20211229013456.474188-1-anuj.mittal@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Jan 2022 11:59:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160344

On Wed, 2021-12-29 at 09:34 +0800, Anuj Mittal wrote:
> Some of the CVEs have x_server as the product name.
> 
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  meta/recipes-graphics/xorg-xserver/xserver-xorg.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> index 7d1f17e7777..4e88cf26f72 100644
> --- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> +++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
> @@ -19,7 +19,7 @@ SRC_URI = "${XORG_MIRROR}/individual/xserver/${XORG_PN}-${PV}.tar.xz"
>  
>  UPSTREAM_CHECK_REGEX = "xorg-server-(?P<pver>\d+(\.(?!99)\d+)+)\.tar"
>  
> -CVE_PRODUCT = "xorg-server"
> +CVE_PRODUCT = "xorg-server x_server"
>  
>  S = "${WORKDIR}/${XORG_PN}-${PV}"
>  

This does add a number of CVEs for master. Do you have updates for those? They
mostly look like things we probably would add to the ignore list at a quick
glance?

Cheers,

Richard


