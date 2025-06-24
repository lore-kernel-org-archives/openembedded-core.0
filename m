Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E57E3C7EE2A
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 08:36:06 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.3822.1750754164656984729
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 01:36:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SdYuj66Q;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E920E433F1;
	Tue, 24 Jun 2025 08:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750754163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YZbmkpfwM2jqKWqDHFsFa17ms7hlLDIf+CAO9BSrN7Y=;
	b=SdYuj66QR1GmcPJgOhQgO9yrbTMNItLYmx356mLPGZTcQ27SiHNfN1IJjpCx93ob6vFO/n
	vdUpWrvY6BgGqkDGQAKnoFlyJuFjA6XUE5MmiSK0TLTCiQM9V3lfGj9wIf3Im2Myt08CNX
	klSXrndguH7426mnoUbvOa+4FyA5dl46aO3HFRPzkcp3QacQ9DiiMEyRhxzEplNCpJJ5h/
	CTe0Q8VJb6q3wK8rBijQWOFodjWpg76uQuyHYuWaSR4ssfbt057pH5bvbJrF5l4qVF5Fx+
	o1KJbmD9lgVoc/Lq5jheeowyJ3QlBQIou1Vrkbs57fLszdhKPnYDI/HCnEdRdw==
Date: Tue, 24 Jun 2025 10:36:00 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: gavrosc@yahoo.com, openembedded-core@lists.openembedded.org,
	Yoann Congal <yoann.congal@smile.fr>,
	Randy MacLeod <randy.macleod@windriver.com>
Subject: Re: [OE-core] [PATCH v2] host_dmesg_logger: dmesg diff on
 BuildStarted and BuildCompleted
Message-ID: <202506240836003fe8020b@mail.local>
References: <20250623171552.28824-1-gavrosc.ref@yahoo.com>
 <20250623171552.28824-1-gavrosc@yahoo.com>
 <184BC8A6CD5551EF.5589@lists.openembedded.org>
 <fc236595167fbad1b128f73b64ec236f9e9d4164.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc236595167fbad1b128f73b64ec236f9e9d4164.camel@linuxfoundation.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleegvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekfedvvefgkeelfffhgffffeegkeehgeektdeugfeljeefudfhteffudfhveduhfenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemvdgumeeifeejtdemjeekvgdtmegttdgvkeemvdektdeimeekrggtiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomheprghlvgigrghnughrvgdrsggvlhhlohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopehrihgthhgrrhgurdhpuhhrughivgeslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehgrghvrhhoshgts
 eihrghhohhordgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohephihorghnnhdrtghonhhgrghlsehsmhhilhgvrdhfrhdprhgtphhtthhopehrrghnugihrdhmrggtlhgvohguseifihhnughrihhvvghrrdgtohhm
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 08:36:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219234

On 24/06/2025 08:59:18+0100, Richard Purdie wrote:
> However there is an issue here:
> 
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/1900
> 
> stdio: WARNING: +[Mon Jun 23 23:24:20 2025] rustc[2793145]: segfault at 7d85a57fef60 ip 00007d85ace75881 sp 00007d85a57fef60 error 6 in librustc_driver-2c391d96288416bb.so[7d85a72c0000+6246000] likely on CPU 23 (core 53, socket 0)
> stdio: WARNING: +[Mon Jun 23 23:24:20 2025] Code: b5 13 03 48 89 df e8 be af 44 fa 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 55 41 57 41 56 41 55 41 54 53 48 81 ec b8 00 00 00 <48> 89 34 24 49 89 ff 4c 8b 2f 49 83 fd 02 0f 84 dc 00 00 00 49 83
> stdio: WARNING: +[Mon Jun 23 23:24:20 2025] rustc[2793415]: segfault at 761e429fee20 ip 0000761e49d83872 sp 0000761e429fee10 error 6 in librustc_driver-2c391d96288416bb.so[761e444c0000+6246000] likely on CPU 65 (core 21, socket 0)
> stdio: WARNING: +[Mon Jun 23 23:24:20 2025] Code: 84 00 00 00 00 00 66 90 55 41 57 41 56 41 55 41 54 53 48 81 ec b8 06 00 00 48 8b 9e b8 00 00 00 80 4e 64 10 49 89 d4 49 89 fe <48> 89 74 24 10 0f b6 86 a8 00 00 00 83 f8 22 74 1e 83 f8 23 0f 85
> stdio: WARNING: +[Mon Jun 23 23:24:20 2025] rustc[2792864]: segfault at 7336b89fef50 ip 00007336bf403241 sp 00007336b89fef40 error 6 in librustc_driver-2c391d96288416bb.so[7336ba4c0000+6246000] likely on CPU 91 (core 41, socket 0)
> stdio: WARNING: +[Mon Jun 23 23:24:20 2025] Code: 48 8d 7c 24 40 e8 8f 9d ff ff 48 89 df e8 f7 d5 0b fb ff 15 49 98 d9 03 90 55 41 57 41 56 41 55 41 54 53 48 81 ec 18 02 00 00 <4c> 89 44 24 10 48 89 cb 89 94 24 b0 00 00 00 49 89 f7 48 89 7c 24
> stdio: WARNING: +[Mon Jun 23 23:24:21 2025] rustc[2792945]: segfault at 7b4c847fefe0 ip 00007b4c8b003241 sp 00007b4c847fefd0 error 6 in librustc_driver-2c391d96288416bb.so[7b4c860c0000+6246000] likely on CPU 46 (core 44, socket 0)
> stdio: WARNING: +[Mon Jun 23 23:24:21 2025] Code: 48 8d 7c 24 40 e8 8f 9d ff ff 48 89 df e8 f7 d5 0b fb ff 15 49 98 d9 03 90 55 41 57 41 56 41 55 41 54 53 48 81 ec 18 02 00 00 <4c> 89 44 24 10 48 89 cb 89 94 24 b0 00 00 00 49 89 f7 48 89 7c 24
> stdio: WARNING: +[Mon Jun 23 23:24:24 2025] rustc[2792678]: segfault at 7312ff7fff80 ip 000073130ad372c9 sp 00007312ff7fff80 error 6 in librustc_driver-2c391d96288416bb.so[7313058c0000+6246000] likely on CPU 64 (core 20, socket 0)
> stdio: WARNING: +[Mon Jun 23 23:24:24 2025] Code: 00 00 48 89 b4 24 c8 00 00 00 48 39 ca 0f 85 97 06 00 00 49 89 d6 49 89 f7 48 89 fb 0f b6 86 f5 00 00 00 0f b6 8e f7 00 00 00 <48> 89 14 24 88 4c 24 08 88 44 24 09 48 89 e6 4c 89 ff e8 e0 d1 fe
> 
> The question is therefore going to be how to filter this down to
> something useful, and/or how to save the data so we can work on
> reducing these issues over time?
> 
> The data is useful to have, and over time we should look for and fix
> these segfaults and so on but we can't have this level of warnings on
> the builds.

Seeing the actual output, I don't think having a human readable date is a good
idea as all the other dates we use are in UNIX timestamp format.

Maybe we could use -l to restrict the levels, something like dmesg --level=err+
or dmesg --level=warn+ I'm pretty sure this is going to filter the tap interface
message. The hrtimer message is a pr_warn_once so it would appear only after
reboot, I guess the build was juste after maintenance.

Or we could use --facility and filter out all the kernel builderssages as we are
probably more interested in what is happening in user space. maybe using -x
would be a good idea and we could then do this filtering and make it
configurable using a variable in the class.

Having a way to more precisely filter messages would be great but will also
require maintaining the list of filters.



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

