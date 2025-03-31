Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2BEC3600B
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:37:01 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.47860.1743413815735812622
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:36:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OfRrRmO6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B68EE42F79;
	Mon, 31 Mar 2025 09:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1743413814;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xvSR/ylYkzt/SyBIh1YQm7N0tlMR5Jh5/VgYiVVkhmY=;
	b=OfRrRmO6mKp9PxPYCfBa/XsWmw/MKbn0gsds24UUBjCYHCSXuilNUJlOJBpa+LMNMpTzHm
	lt+vjVl8UnMDMvzYoMY7cXHFWIStC8A7z6YJgQuKZMjQfZq6JeCZYGfnQJkNYlCH77n81/
	nL48ypZMD/96M3um7Gak9fG6IE7ZLf9fMfe2/AIXUUHo10GbznYcEel3hm7Yi/9QsA56dr
	u7ELKodddSJohUV/0uljAr552G6xC5Jelbpk1bFPg4EkbjGHkIKywZysO7jrFTcomgV/Kn
	FKko7KnAhlARpMmZL9ypzPN3SWxFnLmgzMWNK+PFKLxHDhSAp9VNSs9AOI160w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 31 Mar 2025 11:36:53 +0200
Message-Id: <D8UCM95EEMA2.N4I5RG575VNY@bootlin.com>
Subject: Re: [OE-core] [v2] python3-sphinx: version bump 8.2.1 -> 8.2.3
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <jan.vermaete@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250329204049.1463241-1-jan.vermaete@gmail.com>
In-Reply-To: <20250329204049.1463241-1-jan.vermaete@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddujeelheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefhfefgveegvdffieelueefgfegheeutdfhgeehtdelleejhfetgfefiedttddtgfenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdhsphhhihhngidqughotgdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepjhgrnhdrvhgvrhhmrggvthgvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnv
 ghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 09:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213957

On Sat Mar 29, 2025 at 9:40 PM CET, Jan Vermaete via lists.openembedded.org=
 wrote:
> Release 8.2.3 (released Mar 02, 2025)
>   Bugs fixed
>
>       #13403: Define _StrPath.__radd__(). Patch by Adam Turner.
>       #13399: Fix _CurrentDocument membership testing with =E2=80=98{c,cp=
p}:parent_symbol=E2=80=99. Patch by Adam Turner.
>
>   Release 8.2.2 (released Mar 02, 2025)
>   Bugs fixed
>
>       #13392: Fix argument type for jieba.load_userdict().
>       Add workaround for nbsphinx implicit imports. Patch by Adam Turner.
>       #13402: Ensure inline <script/> tags are written exactly once. Patc=
h by Dmitry Shachnev and Adam Turner.
>       #13391: apidoc: Fix TOC file not having a title. Patch by Dave Hoes=
e and Adam Turner.
>
>   https://www.sphinx-doc.org/en/master/changes/
>
> Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> ---

Hi Jan,

Thanks for your patch.

It appears the build fails on the autobuilder:

ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/musl-qemux=
86/build/build/tmp/work/core2-32-poky-linux-musl/python3-sphinx/8.2.3/temp/=
log.do_compile.1693254
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| ERROR Missing dependencies:
| 	sphinxcontrib-serializinghtml>=3D1.1.9
| 	Jinja2>=3D3.1
| 	sphinxcontrib-devhelp>=3D1.0.6
| 	sphinxcontrib-qthelp>=3D1.0.6
| 	snowballstemmer>=3D2.2
| 	Pygments>=3D2.17
| 	alabaster>=3D0.7.14
| 	sphinxcontrib-htmlhelp>=3D2.0.6
| 	docutils<0.22,>=3D0.20
| 	roman-numerals-py>=3D1.0.0
| 	imagesize>=3D1.3
| 	sphinxcontrib-jsmath>=3D1.0.1
| 	sphinxcontrib-applehelp>=3D1.0.7
| 	babel>=3D2.13
| 	requests>=3D2.30.0
| WARNING: exit code 1 from a shell command.
NOTE: recipe python3-sphinx-8.2.3-r0: task do_compile: Failed
ERROR: Task (/srv/pokybuild/yocto-worker/musl-qemux86/build/meta/recipes-de=
vtools/python/python3-sphinx_8.2.3.bb:do_compile) failed with exit code '1'

Can you have a look at this error please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


