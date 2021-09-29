Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B710C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Sep 2021 23:00:01 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web10.4975.1632956399133325685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Sep 2021 16:00:00 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id 08EAA1C0002;
	Wed, 29 Sep 2021 22:59:55 +0000 (UTC)
Date: Thu, 30 Sep 2021 00:59:55 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Pgowda <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org, rwmacleod@gmail.com,
	alex.kanavin@gmail.com, umesh.kalappa0@gmail.com,
	vinay.m.engg@gmail.com
Subject: Re: [OE-core] [PATCH v2 3/3] Rust oe-selftest file
Message-ID: <YVTv6yOlPK6LmW5d@piout.net>
References: <20210929080448.16224-1-pgowda.cve@gmail.com>
 <20210929080448.16224-3-pgowda.cve@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210929080448.16224-3-pgowda.cve@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Sep 2021 23:00:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/156478

Hello,

On 29/09/2021 01:04:48-0700, Pgowda wrote:
> Add file for rust oe-selftest
> 
> Signed-off-by: Pgowda <pgowda.cve@gmail.com>
> ---
>  meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb | 3 +++
>  1 file changed, 3 insertions(+)
>  create mode 100644 meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
> 
> diff --git a/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb b/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
> new file mode 100644
> index 0000000000..ad758b71f4
> --- /dev/null
> +++ b/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb
> @@ -0,0 +1,3 @@
> +require rust-testsuite.inc
> +require rust-source-${PV}.inc
> +require rust-snapshot-${PV}.inc

Unless I missed something, this is missing a maintainer entry:

The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
rust-testsuite (/home/pokybuild/yocto-worker/oe-selftest-centos/build/meta/recipes-devtools/rust/rust-testsuite_1.54.0.bb)

> -- 
> 2.31.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#156450): https://lists.openembedded.org/g/openembedded-core/message/156450
> Mute This Topic: https://lists.openembedded.org/mt/85943726/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

