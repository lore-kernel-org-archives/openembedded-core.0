Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904A0C02198
	for <webhook@archiver.kernel.org>; Tue, 18 Feb 2025 10:59:40 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.16849.1739876378898508979
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 02:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Lm1bDbsH;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 66E6D204D0;
	Tue, 18 Feb 2025 10:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739876377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nl7yOVBD9Yqqc39bpLjmPsXWkYfdS5lJSRNckYwnDY4=;
	b=Lm1bDbsHSRjl16zkSiqSGVZwA6pKvKefXL9I6U6ZK8EgF+Ce8Mlu4wuErrqDizHo9JuQG9
	3Qx0sEgkl+LOxl8ZVRP92S+IxqHWdNHgzqm082NONzbIvllqCqF14JaBJ8+jcnM7pOe1Gb
	XXfr/gaJLvfFTm/4G2T7F5X8zBhpC+o7EXOn6F1vd79QIC5/4js5x2xfLBuhqP45+Gjcv/
	Dck4qEcDg/DjmSzJ6jgjHbp6YN5kyw/IfmFFv/yzZa/YpzfoYgj7zger2TYiU7+QEtBc9N
	0X8Tng00ImVxaVnpFDrDz+veJVASyllAicb//j8EKmTH9nd04TC+lXgvRreXeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Feb 2025 11:59:37 +0100
Message-Id: <D7VIP9BYFRTC.3QTG9FSHLYLFL@bootlin.com>
To: <wangmy@fujitsu.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 01/32] btrfs-tools: upgrade 6.12 -> 6.13
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1739864375-21394-1-git-send-email-wangmy@fujitsu.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiuddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkvffuhffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepiefgjefftdejfeffgeeludehvddvleegkeevudfhheeiieeggeejledtheektdeunecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdprhgvrgguthhhvgguohgtshdrihhopdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfigrnhhgmhihsehfuhhjihhtshhurdgtohhmp
 dhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Feb 2025 10:59:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211606

On Tue Feb 18, 2025 at 8:39 AM CET, wangmy via lists.openembedded.org wrote=
:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> * mkfs:
>   * new option to enable compression
>   * updated summary (subvolumes, compression)
>   * completely remove option --leafsize, deprecated long ago
> * btrfstune: add option to remove squota
> * scrub:
>   * start: new option --limit to set the bandwidth limit for the duration=
 of the run
>   * status: fix printing of Rate unit suffix (SI/IEC)
> * qgroup clean-stale: check if quotas are enabled before starting filesys=
tem sync()
> * print builtin features and options in --version output (mkfs, convert, =
image, btrfstune)
> * build:
>   * Botan minimum version is now 3.x
>   * target to build compile_commands.json (for LSP)
> * other:
>   * a bit more optimized crc32c code
>   * sync some headers from kernel code
>   * command help updates and fixes
>   * build warning fixes
>   * error message updates
>   * cleanups and refactoring
>   * updated tests
>   * lots of documentation updates
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> ---

Hi Wang,

Thanks for your patch. I get the following error on the autobuilder:

ERROR: core-image-minimal-1.0-r0 do_image_btrfs: Execution of '/srv/pokybui=
ld/yocto-worker/oe-selftest-fedora/build/build-st-742722/tmp/work/qemux86_6=
4-poky-linux/core-image-minimal/1.0/temp/run.do_image_btrfs.3377719' failed=
 with exit code 1
...
| ERROR: lzo support not compiled in
| ERROR: error while filling filesystem: Invalid argument
| btrfs-progs v6.13
| See https://btrfs.readthedocs.io for more information.

https://autobuilder.yoctoproject.org/valkyrie/?#/builders/35/builds/998/ste=
ps/14/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/48/builds/946/ste=
ps/14/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/54/builds/990/ste=
ps/14/logs/stdio

Can you have a look at this failure please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


