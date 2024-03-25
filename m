Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E6FC54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 10:18:21 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.48323.1711361895452083905
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Mar 2024 03:18:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Fy2T/koJ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A511F1BF205;
	Mon, 25 Mar 2024 10:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1711361893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vw/1p2kuo0pOdc/F9E8t3b/C8ts7IpEsTXKorN//Fmk=;
	b=Fy2T/koJ2xWg0wFm+TL8YVrWvqPeSM20AVyyIjjL0LT0VL5px++YSwbTcp5Txl654oZWUQ
	hdgrLUPKzytfdJtQ5jeH6bIgS2wmW7au2TQkjAxlpaOsNJBDOH82eN2p1PYKNemkSEExDU
	UyS9IojQRMpzufcIn7vJvSyhnFTJs5Yua8jzzNNkYwwa9JQC4gFDfeZtk7h0XfxYj98IcE
	JLmrYM34Jpq8HDAtxCSEDLH/42z5zqCloYaO+wbD1spJquRpAisxyZozV3ukMldZxKwtGP
	ey32tz/XlYFPla/53l9X0DcJRwBXeI/tnF9UvEUpewjMCOpa1HJpajXZ8pRbkQ==
Date: Mon, 25 Mar 2024 11:18:09 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Anibal Limon <anibal@limonsoftware.com>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, ross.burton@arm.com
Subject: Re: [OE-core] [PATCH 2/2] wic: plugins source bootimage/isoimage
 rename to allow be imported
Message-ID: <20240325101809ec807440@mail.local>
References: <20240323195304.2909926-1-anibal@limonsoftware.com>
 <20240323195304.2909926-2-anibal@limonsoftware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240323195304.2909926-2-anibal@limonsoftware.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Mar 2024 10:18:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197482

This breaks some selftests and meta-virtualization:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/6573/steps/14/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#/builders/128/builds/3005/steps/12/logs/stdio


On 23/03/2024 13:53:04-0600, Anibal Limon wrote:
> Python not support importing modules with - so change to _.
> 
> Signed-off-by: Anibal Limon <anibal@limonsoftware.com>
> ---
>  .../source/{bootimg-biosplusefi.py => bootimg_biosplusefi.py}     | 0
>  scripts/lib/wic/plugins/source/{bootimg-efi.py => bootimg_efi.py} | 0
>  .../plugins/source/{bootimg-partition.py => bootimg_partition.py} | 0
>  .../wic/plugins/source/{bootimg-pcbios.py => bootimg_pcbios.py}   | 0
>  .../source/{isoimage-isohybrid.py => isoimage_isohybrid.py}       | 0
>  5 files changed, 0 insertions(+), 0 deletions(-)
>  rename scripts/lib/wic/plugins/source/{bootimg-biosplusefi.py => bootimg_biosplusefi.py} (100%)
>  rename scripts/lib/wic/plugins/source/{bootimg-efi.py => bootimg_efi.py} (100%)
>  rename scripts/lib/wic/plugins/source/{bootimg-partition.py => bootimg_partition.py} (100%)
>  rename scripts/lib/wic/plugins/source/{bootimg-pcbios.py => bootimg_pcbios.py} (100%)
>  rename scripts/lib/wic/plugins/source/{isoimage-isohybrid.py => isoimage_isohybrid.py} (100%)
> 
> diff --git a/scripts/lib/wic/plugins/source/bootimg-biosplusefi.py b/scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
> similarity index 100%
> rename from scripts/lib/wic/plugins/source/bootimg-biosplusefi.py
> rename to scripts/lib/wic/plugins/source/bootimg_biosplusefi.py
> diff --git a/scripts/lib/wic/plugins/source/bootimg-efi.py b/scripts/lib/wic/plugins/source/bootimg_efi.py
> similarity index 100%
> rename from scripts/lib/wic/plugins/source/bootimg-efi.py
> rename to scripts/lib/wic/plugins/source/bootimg_efi.py
> diff --git a/scripts/lib/wic/plugins/source/bootimg-partition.py b/scripts/lib/wic/plugins/source/bootimg_partition.py
> similarity index 100%
> rename from scripts/lib/wic/plugins/source/bootimg-partition.py
> rename to scripts/lib/wic/plugins/source/bootimg_partition.py
> diff --git a/scripts/lib/wic/plugins/source/bootimg-pcbios.py b/scripts/lib/wic/plugins/source/bootimg_pcbios.py
> similarity index 100%
> rename from scripts/lib/wic/plugins/source/bootimg-pcbios.py
> rename to scripts/lib/wic/plugins/source/bootimg_pcbios.py
> diff --git a/scripts/lib/wic/plugins/source/isoimage-isohybrid.py b/scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> similarity index 100%
> rename from scripts/lib/wic/plugins/source/isoimage-isohybrid.py
> rename to scripts/lib/wic/plugins/source/isoimage_isohybrid.py
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197471): https://lists.openembedded.org/g/openembedded-core/message/197471
> Mute This Topic: https://lists.openembedded.org/mt/105108998/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

