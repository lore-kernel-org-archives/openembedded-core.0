Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC46DCAC58F
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 09:44:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.6378.1757843070350716135
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 02:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=c2ElNBEE;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2BB02C6B393;
	Sun, 14 Sep 2025 09:44:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3A1A36063F;
	Sun, 14 Sep 2025 09:44:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D4DEA102F29B0;
	Sun, 14 Sep 2025 11:44:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757843067; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ahknY/XP+bEex/SsImOFDMq44UyeKqW9IZcvqFyn5lw=;
	b=c2ElNBEEz31YVYMW81w9s9FNn7FerXwsZDz44FZyyZxKgfqzsdNAUtvLH3lqH+fejAIfpX
	NLMQ5eGh0/+G3s6zn5wcLaWC2JcDjbfiOd7OXZj2JnPAC9Zeikk+6qa0KahOMLsZBan9ot
	gFNTM269Cl/ZhdX1aqiEWJ/MRz+gP1Xv24ZcXxYKtpxTgeC74b9IQZpC4iUBXSMt6IikAZ
	1cO51CxaXp6PeMoq1ISOvt6mCEQFk0UeXSE7OjVuXW1SCQPLZC2bdRV/yHfgAwlMD9F7KD
	y1o1t93lkbGGmXKIkJHOK+EvKZAdxBHT30Io/Zh/BgmUEm/kwhZqs7hdJduWcw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 14 Sep 2025 11:44:25 +0200
Message-Id: <DCSFD04X28ZX.G5LWHQA6861E@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] go: extend runtime test
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <osama.abdelkader@gmail.com>,
 <openembedded-core@lists.openembedded.org>, <alex.kanavin@gmail.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250912232110.1794088-1-osama.abdelkader@gmail.com>
In-Reply-To: <20250912232110.1794088-1-osama.abdelkader@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 Sep 2025 09:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223345

On Sat Sep 13, 2025 at 1:21 AM CEST, Osama Abdelkader via lists.openembedde=
d.org wrote:
> extend go runtime test with a simple test file, and simple
> go module test to validate go compilation and execution on
> target.
>
> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> ---

Hi Osama,

Thanks for your patches.

It looks like one of these is triggering this error:

oeqa.utils.subprocesstweak.OETestCalledProcessError: Command '. /srv/pokybu=
ild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linu=
x-gnueabi/core-image-sato/1.0/testimage-sdk/environment-setup-cortexa8hf-ne=
on-poky-linux-gnueabi > /dev/null; cd /srv/pokybuild/yocto-worker/beaglebon=
e/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato/=
1.0/testimage-sdk/; go build -o test test.go;' returned non-zero exit statu=
s 127.
Standard Output: /bin/bash: line 1: go: command not found

https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/2360
https://autobuilder.yoctoproject.org/valkyrie/#/builders/16/builds/2408
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/2396

Can you have a look at this, please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


