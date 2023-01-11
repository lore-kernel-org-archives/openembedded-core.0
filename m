Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24A1FC54EBC
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 15:17:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.26267.1673450259931053194
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jan 2023 07:17:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c5/i96cr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3AB69E0004;
	Wed, 11 Jan 2023 15:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1673450257;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3KtGfGDRJ/qLSpgpIUtZuIF/ukKf9t9aYlV+qJM58l4=;
	b=c5/i96crhRTwD2RJ402Kjh07O6A1alFQC/lUbPjje0mnFSSRUV2GNhqpCX/AVoFmjvd96m
	ON7Vo+8tsp7kMDoZ8A0yYhfgMqC0GSFVFXrrkFqTyA9a9hdjWbgbNWQc/wxNib3tvd+H/j
	+MQLVEeYul2HTAgvg1jg6Mz6OZHHGcWEOUMFoTFnvwjA7/oiXelTN/rt2nbGMoCKoy3vAf
	uu1kFzUSe1aYzgwkAj5HE7BQIs7BRFZogZmBo88OgOGWQfPJKZvghkD/F3MzBVyHJPRp7b
	p1f0cI2hnWDOReUpLFPA8ZGbJzk4TI8nQoz2yplKVk8+kcpkOqxdjCrTbK6JDQ==
Date: Wed, 11 Jan 2023 16:17:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/3] baremetal-helloworld: Move from skeleton
 to recipes-extended matching what rust-hello-world is doing
Message-ID: <Y77TEGpCjI2TGdgI@mail.local>
References: <20230108191525.1312582-1-alejandro@enedino.org>
 <20230108191525.1312582-2-alejandro@enedino.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230108191525.1312582-2-alejandro@enedino.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jan 2023 15:17:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175751

Hello,

This fails with:

The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
baremetal-helloworld (/home/pokybuild/yocto-worker/oe-selftest-fedora/build/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb)

please run oe-selftest before submitting


On 08/01/2023 12:15:24-0700, Alejandro Hernandez Samaniego wrote:
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
> ---
>  .../baremetal-example}/baremetal-helloworld_git.bb                | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename {meta-skeleton/recipes-baremetal/baremetal-examples => meta/recipes-extended/baremetal-example}/baremetal-helloworld_git.bb (100%)
> 
> diff --git a/meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb b/meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> similarity index 100%
> rename from meta-skeleton/recipes-baremetal/baremetal-examples/baremetal-helloworld_git.bb
> rename to meta/recipes-extended/baremetal-example/baremetal-helloworld_git.bb
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#175637): https://lists.openembedded.org/g/openembedded-core/message/175637
> Mute This Topic: https://lists.openembedded.org/mt/96137379/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

