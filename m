Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C183FC369D3
	for <webhook@archiver.kernel.org>; Mon, 28 Apr 2025 11:24:58 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.45793.1745839493115703234
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Apr 2025 04:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=FNslLZww;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A9D142D46;
	Mon, 28 Apr 2025 11:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1745839490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFZAff0G+jptBLzHnAV2DtOPCtFQ5TSDU14BYXdrVDA=;
	b=FNslLZww3DnRrRJVlxuv8ZZvEoh+WNRGF9Mtt9bV69rUJs83Bc3YwKr9QYs3/Y5XXdREYn
	9tXDhtCTVDgGwKDQI+AEppwcPfM8lOOp0/KBFYCryujfW9I85jmam7z6kpxDdrewh9+MmG
	wmduOIusfBisxXcZO1NE+NyFHKDKA6MY7GW1aV+cvEgDPB/NXNmWqX8clfGYGZoMnvBCvp
	5Ubek7YNY0hNlCcQlzs3dEZ2nu+YjtBQFouGZj4Z1sbGAYhW933Qe9+TvpFsu8ZidiN7sz
	IX3pCscUQ6ZrhYyylMLfVdJadYih4FpeVHJV3mXgho4jRT1Nfts0Yg1o4D73lg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 28 Apr 2025 13:24:50 +0200
Message-Id: <D9I8G5PXS7RT.1NTX4ORQDKEJP@bootlin.com>
Subject: Re: [OE-core] [PATCH v2] selftest-ed: Upgrade to version 1.21
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250427141915.1868977-1-raj.khem@gmail.com>
In-Reply-To: <20250427141915.1868977-1-raj.khem@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddviedtkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghms
 ggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Apr 2025 11:24:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215596

On Sun Apr 27, 2025 at 4:19 PM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> Older versions do not compile with GCC 15
> 1.21 is licensed under GPL-2.0 which means we can remove 0.5 recipe as we=
ll
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

Thanks for your patch.

It looks like we still have some issues.

oe-selftest:

Exception: subprocess.CalledProcessError: Command 'tar --xattrs --xattrs-in=
clude=3D'*' -cf - -S -C /srv/pokybuild/yocto-worker/oe-selftest-fedora/buil=
d/build-st-1181225/tmp/work/x86_64-linux/selftest-ed-native/1.21.1/archiver=
-work//selftest-ed-1.21.1 -p . | tar --xattrs --xattrs-include=3D'*' -xf - =
-C /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1181225/tm=
p/work/x86_64-linux/selftest-ed-native/1.21.1/archiver-work//selftest-ed-1.=
21.1.orig' returned non-zero exit status 2.

Subprocess output:
tar: /srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-1181225/=
tmp/work/x86_64-linux/selftest-ed-native/1.21.1/archiver-work//selftest-ed-=
1.21.1: Cannot open: No such file or directory
tar: Error is not recoverable: exiting now
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/1387

Also an issue on reproducible. This one is a bit strange:

2025-04-28 09:32:48,671 - oe-selftest - INFO -       ERROR: selftest-ed-1.2=
1.1-r0 do_populate_lic: QA Issue: selftest-ed: LIC_FILES_CHKSUM points to a=
n invalid file: /srv/pokybuild/yocto-worker/reproducible/build/build-st/rep=
roducibleA/tmp/work/core2-64-poky-linux/selftest-ed/1.21.1/selftest-ed-1.21=
.1/COPYING [license-checksum]
2025-04-28 09:32:48,671 - oe-selftest - INFO -       ERROR: selftest-ed-1.2=
1.1-r0 do_populate_lic: QA Issue: selftest-ed: LIC_FILES_CHKSUM points to a=
n invalid file: /srv/pokybuild/yocto-worker/reproducible/build/build-st/rep=
roducibleA/tmp/work/core2-64-poky-linux/selftest-ed/1.21.1/selftest-ed-1.21=
.1/ed.h [license-checksum]
2025-04-28 09:32:48,671 - oe-selftest - INFO -       ERROR: selftest-ed-1.2=
1.1-r0 do_populate_lic: QA Issue: selftest-ed: LIC_FILES_CHKSUM points to a=
n invalid file: /srv/pokybuild/yocto-worker/reproducible/build/build-st/rep=
roducibleA/tmp/work/core2-64-poky-linux/selftest-ed/1.21.1/selftest-ed-1.21=
.1/main.c [license-checksum]
2025-04-28 09:32:48,671 - oe-selftest - INFO -       ERROR: selftest-ed-1.2=
1.1-r0 do_populate_lic: Fatal QA errors were found, failing task.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/1517

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


