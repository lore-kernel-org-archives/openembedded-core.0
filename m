Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B495C001DE
	for <webhook@archiver.kernel.org>; Mon,  7 Aug 2023 07:12:01 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web10.29112.1691392317541182106
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Aug 2023 00:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KVrSCBy+;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 785AE20004;
	Mon,  7 Aug 2023 07:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691392314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mq8kPlyh8x1PjJWTcVjfyhV4Wqcbul5WiTRzwrYLbp8=;
	b=KVrSCBy+A0MmdRLvQKWvaxHIOlhBB1tGQQ5FwSmIQMIaE+mUwBFJpIsdSnS6oXevbVN+aH
	g9mCCa07MDnU9EzJq6B1yQ+y6S4MJFytHMznQ8MWVqDPCw5Lcx5a4Iz2W4OxhO5IDW9BTa
	9gAdgbSqnh64MEqxPHE1ooDwptJ672YDqy5ZZkoY+z3X4Y5LPAL1VyAv0hmZ+gnavY3ZYm
	BtRIyNWqaMLrx/0NSSmBa0qZ9pquLkGIkQeeoYh3rMapPxWOcxL4pglWX+fV69CORTE1fA
	6TQKzfu+UqBMZRaJrPRKxJYjq693zdA5LHt62ROjYvKFuMfbMk/VnMc7FA7fgA==
Date: Mon, 7 Aug 2023 09:11:54 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kea: upgrade to v2.5.0
Message-ID: <2023080707115413390cf8@mail.local>
References: <20230804070613.8928-1-sudipm.mukherjee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230804070613.8928-1-sudipm.mukherjee@gmail.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Aug 2023 07:12:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/185584

Hello,

On 04/08/2023 08:06:13+0100, Sudip Mukherjee wrote:
> Changes:
> Update license checksum: change in copyright year.
> Update sha256sum for new version.
> 
> Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
> ---
>  meta/recipes-connectivity/kea/{kea_2.2.0.bb => kea_2.5.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta/recipes-connectivity/kea/{kea_2.2.0.bb => kea_2.5.0.bb} (94%)
> 

This causes reproducibility failures (and also probably doesn't work on
target):

https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230806-_h282f1z/packages/diff-html/


> diff --git a/meta/recipes-connectivity/kea/kea_2.2.0.bb b/meta/recipes-connectivity/kea/kea_2.5.0.bb
> similarity index 94%
> rename from meta/recipes-connectivity/kea/kea_2.2.0.bb
> rename to meta/recipes-connectivity/kea/kea_2.5.0.bb
> index 2c2e5a74dd..066e3ee301 100644
> --- a/meta/recipes-connectivity/kea/kea_2.2.0.bb
> +++ b/meta/recipes-connectivity/kea/kea_2.5.0.bb
> @@ -3,7 +3,7 @@ DESCRIPTION = "Kea is the next generation of DHCP software developed by ISC. It
>  HOMEPAGE = "http://kea.isc.org"
>  SECTION = "connectivity"
>  LICENSE = "MPL-2.0"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=97ce14bdd2733f5b84ab5e29380d057d"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=ea061fa0188838072c4248c1318ec131"
>  
>  DEPENDS = "boost log4cplus openssl"
>  
> @@ -18,7 +18,7 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
>             file://fix_pid_keactrl.patch \
>             file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
>             "
> -SRC_URI[sha256sum] = "da7d90ca62a772602dac6e77e507319038422895ad68eeb142f1487d67d531d2"
> +SRC_URI[sha256sum] = "5b1553cd50928976925b82e5f7f2792f8e9e9244cad66820bc640fb3d50428f8"
>  
>  inherit autotools systemd update-rc.d upstream-version-is-even
>  
> -- 
> 2.39.2
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#185510): https://lists.openembedded.org/g/openembedded-core/message/185510
> Mute This Topic: https://lists.openembedded.org/mt/100541947/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

