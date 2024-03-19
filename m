Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A0F8C54E5D
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 10:21:59 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.11822.1710843716581779718
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 03:21:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OA+6c1Og;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9087FE0007;
	Tue, 19 Mar 2024 10:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1710843714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Eveig2f4u2nUzoq79Lbnuyqgl84N8si1+3Aixj/mDrg=;
	b=OA+6c1OgTcYF/c2vbUwxao+o7s+f34nFqD1KxY2MHhbmyYFOvJMqF/05b940a12tJqNBEA
	bwQJ0pFerBcz+2srLLhLJQCnH1wNTpmKh9d6TfjR7MB2WeejEpvJvByv28fCMY60AhAa0W
	EuOlsETFez34sXWpJ08UjCsPqeuXhDvyN6+PhkFb5nAIzmzYCGZKXHKk9lzqk3ZEs08Otn
	Z9aUEfzBLoYvi4YmkPyxpIPskbtymqWP2TPQnag6ZZ+CKMAICvHtjMRzdntRXNdlzAeDbc
	sV1fkzvF0druR/fAhS50iQp3v2UNlwvnFgjmN/bJpig3O66dSdLyeX9Y5OjvDA==
Date: Tue, 19 Mar 2024 11:21:54 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 23/36] python3-maturin: upgrade 1.4.0 -> 1.5.0
Message-ID: <20240319102154f0e2de40@mail.local>
References: <1710313714-12541-1-git-send-email-wangmy@fujitsu.com>
 <1710313714-12541-23-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1710313714-12541-23-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 10:21:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197317

On 13/03/2024 15:08:21+0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> Changelog:
>  Fix the format_name property and move it from the ArchiveEntry class to the ArchiveRead class
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  .../{python3-maturin_1.4.0.bb => python3-maturin_1.5.0.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/python/{python3-maturin_1.4.0.bb => python3-maturin_1.5.0.bb} (92%)
> 
> diff --git a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb b/meta/recipes-devtools/python/python3-maturin_1.5.0.bb
> similarity index 92%
> rename from meta/recipes-devtools/python/python3-maturin_1.4.0.bb
> rename to meta/recipes-devtools/python/python3-maturin_1.5.0.bb
> index ed19ee647a..e80a45f0bc 100644
> --- a/meta/recipes-devtools/python/python3-maturin_1.4.0.bb
> +++ b/meta/recipes-devtools/python/python3-maturin_1.5.0.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://license-apache;md5=1836efb2eb779966696f473ee8540542 \
>                      file://license-mit;md5=85fd3b67069cff784d98ebfc7d5c0797"
>  
>  SRC_URI += "file://0001-Add-32-bit-RISC-V-support.patch"

ERROR: python3-maturin-native-1.5.0-r0 do_patch: Applying patch '0001-Add-32-bit-RISC-V-support.patch' on target directory '/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/work/x86_64-linux/python3-maturin-native/1.5.0/maturin-1.5.0'
CmdError('quilt --quiltrc /home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleA/tmp/work/x86_64-linux/python3-maturin-native/1.5.0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Add-32-bit-RISC-V-support.patch


> -SRC_URI[sha256sum] = "ed12e1768094a7adeafc3a74ebdb8dc2201fa64c4e7e31f14cfc70378bf93790"
> +SRC_URI[sha256sum] = "e046ea2aed687991d58c42f6276dfcc0c037092934654f538b5877fd57dd3a9c"
>  
>  S = "${WORKDIR}/maturin-${PV}"
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197027): https://lists.openembedded.org/g/openembedded-core/message/197027
> Mute This Topic: https://lists.openembedded.org/mt/104900971/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

