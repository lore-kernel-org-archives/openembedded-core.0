Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A40DC4321E
	for <webhook@archiver.kernel.org>; Wed, 30 Nov 2022 20:57:46 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.24562.1669841864926614706
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Nov 2022 12:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=aMwVtJrN;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id E3DF6240009;
	Wed, 30 Nov 2022 20:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1669841862;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWM3wPWBAEwpcHJnBA+4aE9J37akBf+JMZ0OGn6nWqA=;
	b=aMwVtJrNzVJ9AbbRWZ1BSBPic8YvVTfD5N/o0YF3C8bYB5wrWX4DCjL/lLb5Q+gU+P6MwF
	Iy70Ep3tNN3o+YLlGWgz+SNVjO+BOX86PDeu5fGRBuxG+oOOlDeeTKLimIjJ8FiwuP3t1+
	Z44USezwnKj2pIStX9crfvl/Kv03NCkCq/H/XHvcfc5+LLksOdI8qRT1xOiTmIiJByJuNo
	0ZO5DAAF+UFsjEPNwoSqjAqrZdEOeXCfZB+284+MTpGnq/0UwSJ0egGgyc+I0Gx6jjK2QB
	4YOzeD4HF3ynLmlNyTwhkEgWSuLfncI9Wkc7ZvuGOBswqrnDZi/6H+GMM3xjmw==
Date: Wed, 30 Nov 2022 21:57:40 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][PATCHv8 4/4] gcr: add recipe for gcr-4, needed to
 build with gtk4
Message-ID: <Y4fDxIl6wWuVUTnc@mail.local>
References: <20221130053450.95655-1-f_l_k@t-online.de>
 <20221130053450.95655-4-f_l_k@t-online.de>
 <Y4d8QoDyNaoV0rEY@mail.local>
 <MD46MR.7526AS010V5V3@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MD46MR.7526AS010V5V3@t-online.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Nov 2022 20:57:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174029

Last missing things:

The following recipes do not have a maintainer assigned to them. Please add an entry to meta/conf/distro/include/maintainers.inc file.
gcr3 (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-gnome/gcr/gcr3_3.40.0.bb)
gtk4 (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-gnome/gtk+/gtk4_4.6.7.bb)
graphene (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb)
libsass (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-support/sass/libsass_git.bb)
sassc (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-support/sass/sassc_git.bb)

The following recipes do not have a HOMEPAGE. Please add an entry for HOMEPAGE in the recipe.
sassc (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-support/sass/sassc_git.bb)

On 30/11/2022 16:58:34+0100, Markus Volk wrote:
> Am Mi, 30. Nov 2022 um 16:52:34 +0100 schrieb Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=bootlin.com@lists.openembedded.org>:
> > | Run-time dependency gcr-3 found: NO (tried pkgconfig)
> 
> Sent a patch for it
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174021): https://lists.openembedded.org/g/openembedded-core/message/174021
> Mute This Topic: https://lists.openembedded.org/mt/95352831/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

