Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8A9D68B0B
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 13:20:59 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.36630.1731590451834513484
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 05:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jsI2GHx8;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC824E0007;
	Thu, 14 Nov 2024 13:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731590450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9pkhoCHk1vC2c75IG23p61i/eg/StRzEu2ak+oItbKo=;
	b=jsI2GHx8/rhvPI2je1bBq1rO7v2IqgKA594NFWx0uXSUnM+lf1ONzeJHF7R0m9/12e4oFm
	v96a8vj/siGMWFG07ufvyp56REVqCBF2MwxFJy3n4FtZu9f6xTuXdBR5XgaM+n9ffRqd+0
	m+vMrcrz7oeKNGFYfNsquU5V44DXF7H3f1xrxxEa2NNn02WrF49u23bowVWHVWXb1qGIuv
	JLoW3oCV0IYNi/HWe4N5xbIwGQrss444xWhKF5U5z4nfKHDTg1earybfKTNETb0HHoBCBf
	dmkokFHrbB2P8R3ubz0QuRQs1WC9K1hGa1jxQPFpddxG4QHWgmcSGqqNZoZfZg==
Date: Thu, 14 Nov 2024 14:20:48 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: alex.kanavin@gmail.com
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 2/2] bitbake-config-build: add a plugin for
 config fragments
Message-ID: <ZzX5MAt-zQy46oM-@bootlin-mathieu>
Mail-Followup-To: alex.kanavin@gmail.com,
	openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
References: <20241114111100.2624737-1-alex.kanavin@gmail.com>
 <20241114111100.2624737-2-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114111100.2624737-2-alex.kanavin@gmail.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 13:20:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207162

On Thu, Nov 14, 2024 at 12:11:00PM +0100, Alexander Kanavin via lists.openembedded.org wrote:
> From: Alexander Kanavin <alex@linutronix.de>
> 
> This allows fine-tuning local configurations with pre-frabricated
> configuration snippets in a structured, controlled way. It's also
> an important building block for bitbake-setup.
> 
> There are three (and a half) operations (list/enable/disable/disable all), and here's the 'list' output:
> 
> alex@Zen2:/srv/storage/alex/yocto/build-64$ bitbake-config-build list-fragments
> NOTE: Starting bitbake server...
> Available fragments in selftest layer located in /srv/work/alex/poky/meta-selftest:
> 
> selftest/test-another-fragment	This is a second configuration fragment intended for testing in oe-selftest context
> selftest/test-fragment	This is a configuration fragment intended for testing in oe-selftest context
> 
> The tool requires that each fragment contains a one-line summary, and one or more
> lines of description, as BB_CONF_FRAGMENT_SUMMARY[fragmentname] style metadata.
> 
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>

Hi,

I did not manage to apply this patch on master as I get conflicts on
meta/lib/oeqa/selftest/cases/bblayers.py.

I might be missing something, but can do you confirm this patch is to be
applied on master without any dependency on another patch ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

