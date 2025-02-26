Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE18C021BF
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 12:33:30 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.4715.1740573206363227180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Feb 2025 04:33:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U71jAQ9d;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C5C21433E9;
	Wed, 26 Feb 2025 12:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740573204;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jcCKmn7NSO2fZuqRMG/3BZh5YkM6oATAA5dci4wqLHw=;
	b=U71jAQ9d3UqPyQ/uxL6cNOpa9hSi8RRMWO48vjA8Mro5hO5DyIzCp6ZkM0xIPVrrpUo8nh
	9Cn3Ud56dXdFCdbMhZSis/P3x2IoWN/QILu8wYkVus9Fu1Ux6LSBaJ8LJR/DaWaVTQYcw7
	nHu4Me6KYd0tMc9dTchc5B2uJQbwNWcqFT7tWI5sIYfwKEnOXAVaIJQb7eguVfQxJEI9Kh
	ggr/JNZaI22Oad5mGndlDhayZ/Rod3FRVUglwsIEsWuoQLI+deYIM39TIrZDwY6Uv0ElUc
	RYCCyZobjWTb5L5qSlQFIhNXGl2uYsL7nNkvkUYxHe4BS+mdcLveus9NMoAP9g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 26 Feb 2025 13:33:23 +0100
Message-Id: <D82DPEY34BQ7.8TGSI464L8YO@bootlin.com>
Subject: Re: [OE-core][PATCH 2/3] python3-sphinx: upgrade 8.1.3 -> 8.2.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250226025437.2042320-1-tgamblin@baylibre.com>
 <20250226025437.2042320-2-tgamblin@baylibre.com>
In-Reply-To: <20250226025437.2042320-2-tgamblin@baylibre.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekgeehlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefghfelueelhfevtdelfeegvefgjeelteejtedvffdvhfevudeiffelheekgfffieenucffohhmrghinhepshhphhhinhigqdguohgtrdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhgrghmsghlihhnsegsrgihlhhisghrv
 gdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Feb 2025 12:33:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211956

On Wed Feb 26, 2025 at 3:54 AM CET, Trevor Gamblin wrote:
> Changelog: https://www.sphinx-doc.org/en/master/changes/8.2.html
>
> License-Update: Update copyright year
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---

Hi Trevor,

Thanks for your patch.

I believe this is breaking the btrfs build, we get the following error
on the autobuilder:

ERROR: btrfs-tools-6.12-r0 do_compile: oe_runmake failed
ERROR: btrfs-tools-6.12-r0 do_compile: Execution of '/srv/pokybuild/yocto-w=
orker/oe-selftest-fedora/build/build-st-83385/tmp/work/core2-64-poky-linux/=
btrfs-tools/6.12/temp/run.do_compile.1523080' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/oe-selftes=
t-fedora/build/build-st-83385/tmp/work/core2-64-poky-linux/btrfs-tools/6.12=
/temp/log.do_compile.1523080
Log data follows:
| DEBUG: Executing shell function do_compile
...
| Traceback
| =3D=3D=3D=3D=3D=3D=3D=3D=3D
|
|       File "/srv/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st=
-83385/tmp/work/core2-64-poky-linux/btrfs-tools/6.12/recipe-sysroot-native/=
usr/lib/python3.13/site-packages/sphinx/registry.py", line 544, in load_ext=
ension
|         raise ExtensionError(
|             __('Could not import extension %s') % extname, err
|         ) from err
|     sphinx.errors.ExtensionError: Could not import extension sphinx.build=
ers.latex (exception: No module named 'roman_numerals')
|

https://autobuilder.yoctoproject.org/valkyrie/#/builders/48/builds/997

Can you have a look at this issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


