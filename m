Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC97FC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 12:55:09 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.51547.1742216099918341438
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 05:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=dP5j+bzx;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 70EA844400;
	Mon, 17 Mar 2025 12:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1742216097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cDL7LQNAJ7tIRwxdC7OGXKpGidPa5W5gbWkasVYBppk=;
	b=dP5j+bzxkGWbm8fZzBD/s6PghbVw9IRDprqvY/NRKLB1maMRkt4m01OhxfidJoRqHdJQsS
	2m5tJHIu1PMR12ZxQgPWJJg+He9egKYoxU8SzalYnqWPINFZxXAie2Q9aMOjTzqOtnjDo0
	2hj7pefWOlwhXPd1DrhSo25/syS97NjEifv5IiXkQ4MjX4CXoVk98/iyEivGPnNSHKdZuB
	8/1z4Pb6bsX0pW91ELDgzBfURyhoyFLKPVfW5wDtpOSl5NmQ6NML7VH2NRbPdrhpSy2aeR
	nrkSy5uNhINqZQEkPHqupKqbdA95FjFn6YzdKixZ6EgsNvzjV8qa1s9jDuuz1A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 17 Mar 2025 13:54:57 +0100
Message-Id: <D8IK29UVAJDH.5RMIXD4TDCV7@bootlin.com>
Subject: Re: [oe-core][PATCH 1/2] gobject-introspection: update 1.82.0 ->
 1.84.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250316161604.2331834-1-f_l_k@t-online.de>
In-Reply-To: <20250316161604.2331834-1-f_l_k@t-online.de>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddufeelheejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgvdeuteefueeufffgveefveelheehjeffjeffudekfedviefgkedvleehtdevtdenucffohhmrghinhepghhnohhmvgdrohhrghdphihotghtohdrihhopdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepfhgplhgpkhesthdqohhnlhhinhgvrdguvgdprhgtphhtthhopehophgvnhgvm
 hgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 12:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213089

On Sun Mar 16, 2025 at 5:16 PM CET, Markus Volk wrote:
> 1.84.0 - 2025-03-15
> -------------------
>
> * No changes
>
> 1.83.4 - 2025-03-08
> -------------------
> * Revert support for "static" virtual functions [!526]
> 1.83.2 - 2025-03-01
> -------------------
> * Improve GType inspection helper [!494]
> * Parse C11's _Alignas [#520]
> * Respect custom Python binary [!503]
> * Fix build on the latest Windows SDK [!498]
> * Small performance improvement when looking up a signal information [!50=
4]
> * Use standard imports in the JavaScript templates for g-ir-doctool [!501=
]
> * Ensure that enumeration members can be marked as deprecated [!512]
> * Add more test coverage for structured union types [!348]
> * Add an option to skip tests when building [!507]
> * Fix various MSVC compatibility issues [!511]
> * Add support for "static" virtual functions [!361]
> * Allow specifying the format of the documentation inside doc blocks [!40=
1]
> * Handle C99's _Complex [!515]
> * Consider UCRT64 and CLANG64 as mingw32 compilers [!516]
> * Handle static NSString syntax [!518]
> * Add instance parameter checks to strict validation [!506, !521]
> * Documentation improvements [!481, !483, !485, !500]
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---

Hi Markus,

Thanks for your patch.

We do get some fetch errors on gobject-introspection, can you have a
look at these please?

ERROR: gobject-introspection-1.84.0-r0 do_fetch: Fetcher failure for URL: '=
https://download.gnome.org/sources//gobject-introspection/1.84/gobject-intr=
ospection-1.84.0.tar.xz'. Checksum mismatch!
File: '/srv/autobuilder/valkyrie.yocto.io/current_sources/gobject-introspec=
tion-1.84.0.tar.xz.tmp' has sha256 checksum '945b57da7ec262e5c266b89e091d14=
be800cc424277d82a02872b7d794a84779' when '86f02e689ff4df362b2d0f0a9acc262ac=
e5dc3e71c9078bdba69246748213855' was expected
If this change is expected (e.g. you have upgraded to a new version without=
 updating the checksums) then you can use these lines within the recipe:
SRC_URI[sha256sum] =3D "945b57da7ec262e5c266b89e091d14be800cc424277d82a0287=
2b7d794a84779"
Otherwise you should retry the download and/or check with upstream to deter=
mine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: gobject-introspection-1.84.0-r0 do_fetch: Bitbake Fetcher Error: Fet=
chError('Unable to fetch URL from any source.', 'https://download.gnome.org=
/sources//gobject-introspection/1.84/gobject-introspection-1.84.0.tar.xz')

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1787400/raw_inlin=
e

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


