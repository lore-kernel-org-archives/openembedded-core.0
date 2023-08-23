Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BEE9EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 07:24:55 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.6547.1692775486323357226
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 00:24:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iStwnBwF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: luca.ceresoli@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CB407240003;
	Wed, 23 Aug 2023 07:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1692775484;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v7xzEoK1+CH8gxCffNp6dTfbYMP1dmkJSAo/xmpjnUE=;
	b=iStwnBwFmD6Az9B3JXmvgQ8R93INyy6svQz7wPcdkdZdejStWcbwg5rQdyM2YBiczxFErM
	p+HvNXMyQbOmYpL0KBDewzhwXBrRuHO6l8xql/rOACS9r8fG9BZpT7fAs34h0GsCTvkwOT
	qHI77BprvAKWLFGY8iUr0Xdc2QcUNe3R+Eyt8AB96QjGMc1nvQrseNqS0JP/5bZzWIf5i5
	cgzzpOqxPWbhVjgew/dhifhgR74Fn8YsS+4GeV36BCoVzh0G4r/8mnlaHvgQDQuQmBk4ar
	p8r1qVu4CQEur5NgxvKQ3B3UJLVQ+FGr0vhZgg06YZ0u5G0cY9+p0jNNYcBLsQ==
Date: Wed, 23 Aug 2023 09:24:42 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>
Cc: openembedded-core@lists.openembedded.org, tim.orling@konsulko.com,
 raj.khem@gmail.com
Subject: Re: [OE-core][PATCH 0/2] Upgrading Cython to 3.0.0
Message-ID: <20230823092442.27e61ea3@booty>
In-Reply-To: <20230821173840.1337747-1-tgamblin@baylibre.com>
References: <20230821173840.1337747-1-tgamblin@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 07:24:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186559

Hello Trevor,

On Mon, 21 Aug 2023 13:38:38 -0400
"Trevor Gamblin" <tgamblin@baylibre.com> wrote:

> The Cython 3.0.0 release contains many changes. Since there are a large
> number of recipes that depend on it, there will potentially be build
> issues with recipes in meta-python and elsewhere. I performed a world
> build on poky alone with the python3-cython upgrade and the only recipe
> to fail was python3-pyyaml, so that has been tweaked to work (via two
> new patches for the recipe; thanks to Tim Orling for the heads-up).

This series makes python3-cython non-reproducible:

AssertionError: The following deb packages are different and not in exclusion list:
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/deb/./core2-64/python3-cython-src_3.0.0-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/ipk/./core2-64/python3-cython-src_3.0.0-r0_core2-64.ipk
The following rpm packages are different and not in exclusion list:
/home/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB/tmp/deploy/rpm/./core2_64/python3-cython-src-3.0.0-r0.core2_64.rpm


https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/3400/steps/12/logs/stdio

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

