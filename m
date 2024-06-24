Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 311A1C27C4F
	for <webhook@archiver.kernel.org>; Mon, 24 Jun 2024 01:51:18 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.131233.1719193870856986560
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Jun 2024 18:51:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nTCC+M/m;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 51DB31BF204;
	Mon, 24 Jun 2024 01:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719193868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qsixKJRxs0IFhzNZ3lcBFph7tuUsjhJN6WNQUmNG4Xw=;
	b=nTCC+M/mFFhTcI8Ah3LfmtC/UqeBNPTfNYiaJEbUVTH0KZnV+Ozk/MAElnQizkL2K9mPdN
	phrw88KeS1o4uaW5BYihFxLCOiCL3ouT1kMBsdeLhdUjxtZt2QNpSxs7IJ94vgOu4rR4uc
	4nZiwx9jDPu4BilWWWqIIa7GAxSxCUrlnhVAQSKOH8b270xe6egRc+MaPZ+fNFVLZAZd8V
	sQlLQuksGjGuUDpetxdf2kP4sCGkdIfT/mw3MpqKc95HagbN59TK7Npoqc/XxIf2Dw/odU
	obcvdfK0b6xCPdzhH6rNyWx4mrkbzLCRyD5L96gkqvg9p3OHO4ZtmXjC+t6cdw==
Date: Mon, 24 Jun 2024 03:51:07 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 14/22] kea: upgrade 2.4.1 -> 2.6.0
Message-ID: <202406240151079fe3c9db@mail.local>
References: <1718936206-8080-1-git-send-email-wangmy@fujitsu.com>
 <1718936206-8080-14-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1718936206-8080-14-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Jun 2024 01:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201062

This fails the reproducibility tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4982/steps/13/logs/stdio

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240623-__4telvd/packages/diff-html/

On 21/06/2024 10:16:38+0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> License-Update: Copyright year updated to 2024.
> 
> fix_pid_keactrl.patch
> refreshed for 2.6.0
> 
> Changelog:
>  https://gitlab.isc.org/isc-projects/kea/-/wikis/Release-Notes/release-notes-2.6.0
> 
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---
>  meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch  | 7 +++----
>  .../kea/{kea_2.4.1.bb => kea_2.6.0.bb}                     | 4 ++--
>  2 files changed, 5 insertions(+), 6 deletions(-)
>  rename meta/recipes-connectivity/kea/{kea_2.4.1.bb => kea_2.6.0.bb} (94%)
> 
> diff --git a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
> index 63a6a2805b..e206805688 100644
> --- a/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
> +++ b/meta/recipes-connectivity/kea/files/fix_pid_keactrl.patch
> @@ -1,4 +1,4 @@
> -From c878a356712606549f7f188b62f7d1cae08a176e Mon Sep 17 00:00:00 2001
> +From d297e8ae315e14ae4c5c5ad98183a57f9c43b2de Mon Sep 17 00:00:00 2001
>  From: Armin kuster <akuster808@gmail.com>
>  Date: Wed, 14 Oct 2020 22:48:31 -0700
>  Subject: [PATCH] Busybox does not support ps -p so use pgrep
> @@ -7,16 +7,15 @@ Upstream-Status: Inappropriate [embedded specific]
>  Based on changes from Diego Sueiro <Diego.Sueiro@arm.com>
>  
>  Signed-off-by: Armin kuster <akuster808@gmail.com>
> -
>  ---
>   src/bin/keactrl/keactrl.in | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>  
>  diff --git a/src/bin/keactrl/keactrl.in b/src/bin/keactrl/keactrl.in
> -index 450e997..c353ca9 100644
> +index cccfdac..20ae2e6 100644
>  --- a/src/bin/keactrl/keactrl.in
>  +++ b/src/bin/keactrl/keactrl.in
> -@@ -149,8 +149,8 @@ check_running() {
> +@@ -146,8 +146,8 @@ check_running() {
>       # Get the PID from the PID file (if it exists)
>       get_pid_from_file "${proc_name}"
>       if [ ${_pid} -gt 0 ]; then
> diff --git a/meta/recipes-connectivity/kea/kea_2.4.1.bb b/meta/recipes-connectivity/kea/kea_2.6.0.bb
> similarity index 94%
> rename from meta/recipes-connectivity/kea/kea_2.4.1.bb
> rename to meta/recipes-connectivity/kea/kea_2.6.0.bb
> index 19309ce314..0f9e7b6891 100644
> --- a/meta/recipes-connectivity/kea/kea_2.4.1.bb
> +++ b/meta/recipes-connectivity/kea/kea_2.6.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
>  HOMEPAGE = "http://kea.isc.org"
>  SECTION = "connectivity"
>  LICENSE = "MPL-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=618093ea9de92c70a115268c1d53421f"
>  
>  DEPENDS = "boost log4cplus openssl"
>  
> @@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
>             file://fix_pid_keactrl.patch \
>             file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
>             "
> -SRC_URI[sha256sum] = "815c61f5c271caa4a1db31dd656eb50a7f6ea973da3690f7c8581408e180131a"
> +SRC_URI[sha256sum] = "207ceae33eb3b81ec4e6ac5605249a85b93779333b62aadf39e489f11dbcdc8d"
>  
>  inherit autotools systemd update-rc.d upstream-version-is-even
>  
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200989): https://lists.openembedded.org/g/openembedded-core/message/200989
> Mute This Topic: https://lists.openembedded.org/mt/106792588/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

