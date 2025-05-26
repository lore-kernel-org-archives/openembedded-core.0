Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01B16C54FB3
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 12:27:42 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.27479.1748262456441194605
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 May 2025 05:27:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=I4Q3bugU;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 12E2344212;
	Mon, 26 May 2025 12:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1748262454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WMQ7zRqNz1/FYFG0az4eOmqq8+X/zTreBTLKQgJxK3Y=;
	b=I4Q3bugUkyt6cYpvP0jECcCe67lVetS59dg949Im2MNClBiXwXkks+8PvWenbplUReY2na
	VAXXAe2Y/3hWR3rc58eFHmx/F6WUvcW6nelQwNEIz4qwLTXVLKuZwlvfhKCzpme/Pd4d2J
	lX3Xu0tNfdmredAN44vKU0hE1x8IwfcaayydDdJnsfhFuxOV1S+rpoqSWxRi4csQjsnRKK
	IoZho6p2zCupsdmtRfsA6o/EZ6SWlLUJ3w6DXNfCfkIfxPTUW6jo0znFjBnfZV1eWUx2xN
	CGJBMH2CSIdzcy989RRt690veK3NcyhhHkyeUOY2KbjcQLPRuJ3GC86GywnMLg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 May 2025 14:27:33 +0200
Message-Id: <DA63BFOBJH3N.1RPV4KZ1VUCP2@bootlin.com>
Subject: Re: [OE-core][PATCH V2] util-linux/util-linux-libuuid: upgrade from
 2.40.4 to 2.41
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250526082320.1176072-1-Qi.Chen@windriver.com>
In-Reply-To: <20250526082320.1176072-1-Qi.Chen@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgddujeehvdculddtuddrgeefvddrtddtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptddvteejieffudeivdevgeetleejvdektdelteevkeeltdegfeelhfevudeihefhnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrdgtohhmpdihohgtthhophhrohhjvggtthdrohhrghdphihotghtohdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemvgdtrgemrgeiieemfedukedtmegttdgsvgemsgelrgekmegvheelvdemiegrfehfnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmegrieeimeefudektdemtgdtsggvmegslegrkeemvgehledvmeeirgeffhdphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopefsihdrv
 ehhvghnseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 12:27:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217268

On Mon May 26, 2025 at 10:23 AM CEST, Chen Qi via lists.openembedded.org wr=
ote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> License-Update: add EUPL-1.2.
> See https://github.com/util-linux/util-linux/commit/74f3265b9a079f9f60ad6=
e606d77deae0029a43a
>
> 0001-tests-ts-kill-decode-avoid-using-shell-built-in-kill.patch is
> a backported patch to fix kill/decode test case.
>
> 0001-lsfd-mkfds-foreign-sockets-skip-when-lacking-sock_di.patch is
> used to fix testcase failure of lsfd/mkfds-foreign-sockets.
>
> lsfd/option-inet is removed out of the excluded list because upstream
> has fixed the issue:
> https://github.com/util-linux/util-linux/commit/eaa3870880aaa8d3d6b1aa8ea=
6bb19a717708b8e
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---

Hi Chen,

Thanks for the v2.

It looks like util-linux ptests are failing after applying this patch:

Failed ptests:
{'util-linux': ['su:_environ']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1566
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1567

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20250526-63/testresults/qemuarm64=
-ptest/core-image-ptest-util-linux/
https://valkyrie.yocto.io/pub/non-release/20250526-63/testresults/qemux86-6=
4-ptest/core-image-ptest-util-linux/

Can you have a look at these failures please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


