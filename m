Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D439C3ABB6
	for <webhook@archiver.kernel.org>; Wed,  7 May 2025 07:46:01 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web10.3202.1746603950397011302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 May 2025 00:45:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nmVoBr1u;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CFBE1FCED;
	Wed,  7 May 2025 07:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746603948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fLrGE5klYEvsMfcG1ud+yu90wU3a2FjyMYSq5JYzeaY=;
	b=nmVoBr1uG7bfK/KZARCJAVFDkMZHirUEjtqEfzQ8dK1P+ezPxmxkWxKfKRPRk0DC068WCd
	+o/p7JU2yBd1wKWMNo/a5BEPjKoeD+yp6rcs15rh+ACCKNzOcAwxmCXV9zvBV17811JZ0P
	3CCLTA75849uDfWjkJYmHn6wtxgLM7NH9hRnvSb55fXOwSQhwOkrkrf3wicYDug0Ti8zrP
	PPp2bKVvSthERsWZgGXigghinj1iEhbBw8ZR4wHCu+yRj+6wl/8acNgXlwhyxr6SiZFkqr
	VM1wjXXelDgvZCBuS/8O2h5Ad+cbzWJxWaRYoyIDXD7Kf8wtV5O9tHQUl20DDg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 May 2025 09:45:48 +0200
Message-Id: <D9PRFCSKFCLI.1VXXE2QET4AOG@bootlin.com>
Subject: Re: [OE-core] [PATCH] sqlite3: upgrade 3.48.0 -> 3.49.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250506163705.4099385-1-peter.marko@siemens.com>
In-Reply-To: <20250506163705.4099385-1-peter.marko@siemens.com>
X-GND-State: clean
X-GND-Score: 49
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeivdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecuogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveduudefgfeigfduheffffelfedthefhvefhheefiedvteegvdduhfevjedufeefnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrdhiohdphihotghtohhprhhojhgvtghtrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegttdgsvgemsgelrgekmegvheelvdemiegrfehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemtgdtsggvmegslegrkeemvgehledvmeeirgeffhdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehpvghtvghrr
 dhmrghrkhhosehsihgvmhgvnhhsrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 May 2025 07:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216096

On Tue May 6, 2025 at 6:37 PM CEST, Peter Marko via lists.openembedded.org =
wrote:
> From: Peter Marko <peter.marko@siemens.com>
>
> Handle CVE-2025-3277, CVE-2025-29087 and CVE-2025-29088.
>
> This update includes major change in how it is built.
> Instead of autotools, autosetup is used.
>
> Autosetup (https://msteveb.github.io/autosetup/) claims to be
> * Replacement for autoconf in many situations
> However it also claims NOT to
> * Intended to replace all possible uses of autoconf
> This means that some autoconf features are not available.
>
> Recipe changes:
> * stop inheriting autotools and define B, do_configure and do_install
> * depend on zlib unconditionally, autoconf cannot be preconfigured in
>   similar way as autotools
> * update packageconfig options to match new syntax
> * libedit is detected with ncurses linking options (as seen in
>   do_configure log)
> * backport rpaths fix
> * define soname to avoid file-rdeps QA error due to wrong library name
> * clean B for do_configure as the new Makefiles do not seem to properly
>   retrigger build if configuration changes
> * use unstripped binaries for native (non-cross-compile) case
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---

Hi Peter,

Thanks for your patch.

It looks like we can see some build errors on the autobuilder:

ERROR: sqlite3-3_3.49.1-r0 do_install: oe_runmake failed
ERROR: sqlite3-3_3.49.1-r0 do_install: Execution of '/srv/pokybuild/yocto-w=
orker/genericarm64-alt/build/build/tmp/work/armv8a-poky-linux/sqlite3/3.49.=
1/temp/run.do_install.2425589' failed with exit code 1
...
| strip: Unable to recognise the format of the input file `/srv/pokybuild/y=
octo-worker/genericarm64-alt/build/build/tmp/work/armv8a-poky-linux/sqlite3=
/3.49.1/image/usr/bin/sqlite3'
| /srv/pokybuild/yocto-worker/genericarm64-alt/build/build/tmp/hosttools/in=
stall: strip process terminated abnormally

https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/1553

Can you have a look at this failure please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


