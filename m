Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 820F6C4828F
	for <webhook@archiver.kernel.org>; Fri,  2 Feb 2024 23:13:07 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.6679.1706915579426913808
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Feb 2024 15:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=o73UjyhQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 598ECFF802;
	Fri,  2 Feb 2024 23:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1706915576;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zIkqiuMUpkj5Tk+aNsq7sgWAzhYT1akm+mWBY6ujiuQ=;
	b=o73UjyhQZW1zsTsiOCJwuxpi5E8wWZTITsRwhEyjOkVeB/aQOMsc4ERobXNY/v9MIN9W5i
	O1g/totAAds5X9zVCwDMUY24pI6ayr9Jzw0gFfsruVSmMb28F0TjoNU9E6cogN4e2JUSOq
	1DvXcIp1i6QZMHGjG7U+SihYIBRqBmniKemCL0ygvE4SpDQHnJWjzEm8gs/X6W65wKsQWD
	ERBWRVAyuetWjp1g8npEgJfB7R4HIZ7Ve97b9hA8X4JPc53BR3E8dRxXgbQfNuM2HwPnmN
	te5xM7RoDIBWkkU9Zo9pjd02+Ama9AHRBnFuHE/okCDAa55Pt5GpCNqpG/8BMw==
Date: Sat, 3 Feb 2024 00:12:56 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Tim Orling <tim.orling@konsulko.com>
Subject: Re: [OE-core] [PATCH] openssh: upgrade 9.5p1 -> 9.6p1
Message-ID: <2024020223125655b936ef@mail.local>
References: <20240105165554.1401517-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240105165554.1401517-1-tim.orling@konsulko.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Feb 2024 23:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194819

https://autobuilder.yoctoproject.org/typhoon/#/builders/102/builds/5751/steps/13/logs/stdio

On 05/01/2024 08:55:55-0800, Tim Orling wrote:
> * Relocate Upstream-Status in 0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
>   so it will not throw an error in AUH
> 
> https://www.openssh.com/txt/release-9.6
> https://github.com/openssh/openssh-portable/compare/V_9_5_P1...V_9_6_P1
> 
> https://nvd.nist.gov/vuln/detail/CVE-2023-48795
> https://nvd.nist.gov/vuln/detail/CVE-2023-51384
> https://nvd.nist.gov/vuln/detail/CVE-2023-51385
> 
> CVE: CVE-2023-48795
> CVE: CVE-2023-51384
> CVE: CVE-2023-51385
> 
> Signed-off-by: Tim Orling <tim.orling@konsulko.com>
> ---
> All ptests passed on core-image-ptest-openssh on qemux86-64
> 
>  ...regress-banner.sh-log-input-and-output-files-on-erro.patch | 4 ++--
>  .../openssh/{openssh_9.5p1.bb => openssh_9.6p1.bb}            | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta/recipes-connectivity/openssh/{openssh_9.5p1.bb => openssh_9.6p1.bb} (98%)
> 
> diff --git a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
> index 2c14014fed8..8763f30f4b3 100644
> --- a/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
> +++ b/meta/recipes-connectivity/openssh/openssh/0001-regress-banner.sh-log-input-and-output-files-on-erro.patch
> @@ -34,13 +34,13 @@ return value: 1
>  
>  See: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15178
>  
> +Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/437]
> +
>  Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
>  ---
>   regress/banner.sh | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
>  
> -Upstream-Status: Denied [https://github.com/openssh/openssh-portable/pull/437]
> -
>  diff --git a/regress/banner.sh b/regress/banner.sh
>  index a84feb5a..de84957a 100644
>  --- a/regress/banner.sh
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> similarity index 98%
> rename from meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> rename to meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> index bbb8fb091ad..fa44eb0bd4e 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.5p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.6p1.bb
> @@ -28,7 +28,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
>             file://0001-regress-banner.sh-log-input-and-output-files-on-erro.patch \
>             file://0001-systemd-Add-optional-support-for-systemd-sd_notify.patch \
>             "
> -SRC_URI[sha256sum] = "f026e7b79ba7fb540f75182af96dc8a8f1db395f922bbc9f6ca603672686086b"
> +SRC_URI[sha256sum] = "910211c07255a8c5ad654391b40ee59800710dd8119dd5362de09385aa7a777c"
>  
>  CVE_STATUS[CVE-2007-2768] = "not-applicable-config: This CVE is specific to OpenSSH with the pam opie which we don't build/use here."
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#193372): https://lists.openembedded.org/g/openembedded-core/message/193372
> Mute This Topic: https://lists.openembedded.org/mt/103546397/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

