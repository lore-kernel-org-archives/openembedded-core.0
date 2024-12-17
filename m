Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73311E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 10:11:07 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.78565.1734430262551847567
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 02:11:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iTVh+OvS;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9F41A1C0009;
	Tue, 17 Dec 2024 10:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734430260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8TW4BjPY/8GqsRjfgd9gAT+XXlqY6lmGucUoSnK6ElM=;
	b=iTVh+OvSliemWDJdc/PBanfuv4tGFhmFDKU6nhWq0jhB8WVFov2HWRhd+xljO/W33bUJUM
	biPBuRU0MFWvVcnK4xxAh+Qm7Gk9BPxtdLZc2BEo2bathgBTVuM1IZ986EyByOwJJnsrkS
	SupYFJJIxa3ZyRzLq0KftmeM0YZR4w6UVZ9Av3nmiJl3hJhXUi49/4ovK1E6b1GoDb8KYa
	QrmeboJ0J+b/kbYxINWY8INBHnpj9dKjvqLlN8dmctccXDJ8bG4RPzOhQ8zYcfCAKNbpui
	CQvycw50ub/1ruNXHXckdlTtWH6gQZQSBK0XbBP2w+ibAi/b491gviskMTfUOg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Dec 2024 11:11:00 +0100
Message-Id: <D6DW7PTN19KR.GBZIIVS8HE7K@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] python3-numpy: upgrade 2.1.3 -> 2.2.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241216154438.2864156-1-tgamblin@baylibre.com>
In-Reply-To: <20241216154438.2864156-1-tgamblin@baylibre.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 10:11:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208828

On Mon Dec 16, 2024 at 4:44 PM CET, Trevor Gamblin wrote:
> Patch '0001-numpy-core-Define-RISCV-32-support.patch' is included in
> v2.2.0, so remove it from the SRC_URI list:
>

Hi Trevor,

It looks like this patch is breaking the reproducible builder on the
autobuilder:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./core2-64/python3-numpy-dbg_2.2.0-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./core2-64/python3-numpy_2.2.0-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./core2-64/python3-numpy-dbg_2.2.0-r0_core2-64.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./core2-64/python3-numpy_2.2.0-r0_core2-64.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./core2_64/python3-numpy-2.2.0-r0.core2_64.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./core2_64/python3-numpy-dbg-2.2.0-r0.core2_64.rpm

https://valkyrie.yoctoproject.org/#/builders/37/builds/687/steps/12/logs/st=
dio

Can you have a look at this please ?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


