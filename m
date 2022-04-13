Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4250FC48BE8
	for <webhook@archiver.kernel.org>; Wed, 13 Apr 2022 15:48:08 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web08.7608.1649863170656452223
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Apr 2022 08:19:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=c1ITPNbs;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id B9B3A240002;
	Wed, 13 Apr 2022 15:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1649863168;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=88sZZj9bTe7CgofV7jx1ualyKA+NjJeywggfrpnljVM=;
	b=c1ITPNbsy9LkyfEtoYa7vs86wMEfnVpyGVXAfn5zuzHhY5kDazFRQJaIf9VVVGSnDJD9lu
	Do9hkBS67cGOpkvX+Oi49nkDH2Vp4smVezn5A5NC9q8hhSCPVG4uuPVtioe+BMD0QLRMGN
	2KuHp1plQ+ua6YRiVtF9zkpzBoK5HWSiKJaIZNC0wlofTSRAq0CPEhBNp6P0HuWy81PA3y
	zWYgjWdbVEGo0KCg3mLP1AUI1YLxoohVqRkXFixabqweev0iVASEb/vAHu7bGgpUJNkXOs
	35P/LSAQzU6nLHhuckt2KE+0ZkX3uwF67R2bsqUzlz5ylWOJnExFC+6i8YzJEQ==
Date: Wed, 13 Apr 2022 17:19:26 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
 openembedded-core@lists.openembedded.org, Alexandre Belloni
 <alexandre.belloni@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/8] kernel: consolidated pull request
Message-ID: <20220413171926.771b4b06@melee>
In-Reply-To: <cover.1649799823.git.bruce.ashfield@gmail.com>
References: <cover.1649799823.git.bruce.ashfield@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Apr 2022 15:48:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164328

Hello Bruce,

Il giorno Tue, 12 Apr 2022 17:45:55 -0400
"Bruce Ashfield" <bruce.ashfield@gmail.com> ha scritto:

> From: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Richard,
> 
> Here's the collection of -stable, fixes and tweaks that I was talking
> about during the engineering sync on Tuesday.
> 
> Feel free to take what you want, or just wait on them all until the
> release is over.
> 
> It is worth taking the 5.18 -dev and lttng fixes IMHO, since they do
> make the release a bit more future proof. Likewise with Jon's -tiny
> changes.
> 
> Cheers,
> 
> Bruce
> 
> The following changes since commit
> 632c83ab787211ef927a999f4ecde1d3ce40621d:
> 
>   license_image.bbclass: close package.manifest file (2022-04-10
> 08:31:17 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.yoctoproject.org/poky-contrib zedd/kernel
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel
> 
> Bruce Ashfield (8):
>   linux-yocto/5.15: arm: poky-tiny cleanup and fixes
>   linux-yocto/5.15: update to v5.15.33
>   linux-yocto/5.10: update to v5.10.110
>   linux-yocto/5.10: base: enable kernel crypto userspace API
>   linux-yocto/5.15: base: enable kernel crypto userspace API
>   linux-yocto/5.15: kasan: fix BUG: sleeping function called from
>     invalid context
>   lttng-modules: support kernel 5.18+
>   linux-yocto-dev: update to v5.18+

Sending this series to the autobuilders triggered some errors and
warnings (see below). Can you check that?

1. kernel not booting on qemuppc

  >> OpenBIOS 1.1 [Nov 1 2021 20:36]
  >> Configuration device id QEMU version 1 machine id 1
  >> CPUs: 1
  >> Memory: 256M
  >> UUID: 00000000-0000-0000-0000-000000000000
  >> CPU type PowerPC,G4
  milliseconds isn't unique.
  >> [ppc] Kernel already loaded (0x01000000 + 0x01394760) (initrd
  >> 0x00000000 + 0x00000000) [ppc] Kernel command line: root=/dev/vda rw mem=256M 
  >> ip=192.168.7.4::192.168.7.3:255.255.255.0::eth0:off:8.8.8.8 console=ttyS0 console=ttyS1 console=tty console=ttyS0 printk.time=1 
  >> switching to new context:

  ===== end: snippet =====

https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5012/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/63/builds/5013/steps/12/logs/stdio

2. X.org not starting on qemuarm

[    14.037] (EE) No devices detected.
[    14.039] (EE) Fatal server error:
[    14.040] (EE) no screens found(EE) 
[    14.041] (EE) 
Please consult the The X.Org Foundation support 
	 at http://wiki.x.org
 for help. 
[    14.042] (EE) Please also check the log file at
"/var/log/Xorg.0.log" for additional information. 
[    14.046] (EE) Server terminated with error (1). Closing log file.

https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5053/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/53/builds/5054/steps/12/logs/stdio

3. ptest warning 

AssertionError: Failed ptests:
{'strace': ['landlock_create_ruleset-y.gen.test',
            'landlock_create_ruleset-y.gen']}

This is landlock-related, thus perhaps caused by patch 2/8.

https://autobuilder.yoctoproject.org/typhoon/#/builders/82/builds/3117/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/3369/steps/12/logs/stdio

Best regards.
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

