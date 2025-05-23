Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91301C54ED0
	for <webhook@archiver.kernel.org>; Fri, 23 May 2025 13:16:00 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.48080.1748006154334394589
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 May 2025 06:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IqbLmHF6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 000D843AFE;
	Fri, 23 May 2025 13:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748006152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P54M2BZeu+WD/oaQAp/htM/OgqFj1DURsW+Vn/dNUXE=;
	b=IqbLmHF6Pxrafp3nFltMlU+3S0r/jYzC731OzuuStqoMeQNlYe5LMmLZ9ezj/8Dak/OX5Z
	3tSxzuN1aO4vax9G6W7VaRFv+3oIJdcOrYRAc40NhulDCcB8EUqn0X1938EDAP3w3SYctH
	dZZy7ladQ0uc1yJ2OLNG4UByvYZm99KUSHYmKdw5+lKoW8TPYcvjN4+ETmeg1soZyWncRf
	vGbFanm+d2vlw5vx6k/QGlnPRFp944ordp47aRLn8O9QbUXwEgGwkQv8CD53oCf7CVfdu7
	I31SF/vhmuqweCW36NzO7jHEbAFbVI2gxErOuSbiFyUIbuRKxch+6/uqCR6I6w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 23 May 2025 15:15:51 +0200
Message-Id: <DA3KGS7N34KS.2QGDJ16MHESOG@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mikko.rapeli@linaro.org>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] oeqa selftest uboot.py: add qemu KVM test
 case
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250522134116.254270-1-mikko.rapeli@linaro.org>
 <20250522134116.254270-3-mikko.rapeli@linaro.org>
In-Reply-To: <20250522134116.254270-3-mikko.rapeli@linaro.org>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdekleehucdltddurdegfedvrddttddmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtgfeuvdfghfegtdehvdegvefhkeegheeikeelfeefffetheeitdduudeludduleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhhikhhkohdrrhgrphgvlhhisehlihhnrghrohdrohhrg
 hdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 May 2025 13:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217209

On Thu May 22, 2025 at 3:41 PM CEST, Mikko Rapeli via lists.openembedded.or=
g wrote:
> Add a test case to boot target system via u-boot
> using qemu with KVM. This was broken recently
> and workaround proposed to u-boot. Test case
> works with genericarm64 and qemuarm64 target machines
> compiled and tested on aarch64 build host with KVM
> support.
>
> Test execution time with full sstate cache is
> around 170 seconds. qemu boot itself takes just
> a few seconds to full userspace.
>
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---

Hi Mikko,

I saw your other mail saying you will make an update, but as I had
already picked these patches, here is the build result: the selftest is
failing on armhost:

---
2025-05-23 08:50:18,542 - oe-selftest - INFO - uboot.UBootTest.test_boot_ub=
oot_kvm_to_full_target (subunit.RemotedTestCase)
2025-05-23 08:50:18,543 - oe-selftest - INFO -  ... ERROR
...
QEMU 10.0.0 monitor - type 'help' for more information
(qemu)
Waiting at most 1000 seconds for login banner (05/23/25 08:33:29)
Connection from 127.0.0.1:43786
Target didn't reach login banner in 1000 seconds (05/23/25 08:50:12)
Last 25 lines of login console (1721):
Scanning bootdev 'virtio-blk#36.bootdev':
Scanning bootdev 'virtio-net#32.bootdev':
BOOTP broadcast 1
...
BOOTP broadcast 17

Retry time exceeded; starting again
No more bootdevs
---  -----------  ------  --------  ----  ------------------------  -------=
---------
(1 bootflow, 1 valid)
=3D>
...
RuntimeError: core-image-minimal - FAILED to start qemu - check the task lo=
g and the boot log
---

https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/1749

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


