Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667B8C87FCB
	for <webhook@archiver.kernel.org>; Tue,  5 Aug 2025 08:14:34 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.17092.1754381665480067370
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Aug 2025 01:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ToYYb8w0;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 68BB4431FD;
	Tue,  5 Aug 2025 08:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1754381663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zaP/ZcEF+u4FBwVPKMRrR0ly8CbKGF7I2v/nBIb8UBU=;
	b=ToYYb8w0rkPnVcmGwQZWT7rQ5titaDKkjZEU3a65g8jn37IF+5fS9Zs+7mvvH2+oTg0bkJ
	2zCd8TClOWL6hhb5ajXhR6ukW8FRx5Dar44FYefcdYN23toD9uVRCUG9HZUoILvfFdEPNh
	NlN9RJO8neogIdfRh9/9W0AR/nJcHerYsl7rlWVMF2/NWnsTHcCdNrsin4pHtfWkAolN5y
	w/ZasNz3l24GUZbIWUrkUcLsdsSRx1tPirggbliiJkVBin/SSOZk//CGiuWtH57YLD9KpD
	HDtL+1G8WvR7XHmLywSdppeuURutH6KsXGyKFNPYoi3CcGgGxD2OYJftcoYkNw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 10:14:22 +0200
Message-Id: <DBUCE9OCATK0.3SAJACOFJ2I7Z@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <skandigraun@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/2] dpkg: add ptest support
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250802131227.677594-1-skandigraun@gmail.com>
 <20250802131227.677594-2-skandigraun@gmail.com>
In-Reply-To: <20250802131227.677594-2-skandigraun@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudegieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeelledtgfetudfhleefleehtdegveekgeegteejuedttedugfekuefhgeeuffeivdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdphihotghtohdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehskhgrnhguihhgrhgruhhnsehgmhgrihhlrdgtohhmpdhrt
 ghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Aug 2025 08:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221462

On Sat Aug 2, 2025 at 3:12 PM CEST, Gyorgy Sarvari via lists.openembedded.o=
rg wrote:
> Added it to slow tests, as it takes betwen 165 and 190 seconds on my
> machine to execute (qemux86-64 + kvm).
>
> The test folder's Makefile contains a list of passing, failing and manual
> tests. By default, only the expected-to-pass tests are executed by the
> Makefile (unless magic environment variable is set).
>
> The run-ptest script mimics the default behavior of executing the
> expected-to-pass tests, however they are executed one by one, instead of
> running them as one batch - that way it is easier to determine exactly
> which tests pass and which fail.
>
> One other thing that might worth a note, is that the tests folder that ne=
eds to be
> installed contains a number of subfolders called "DEBIAN". When packaging=
 them
> at least with rpm, these folders are omitted from the package.=20
> However these are essential for the tests, as they contain test data. As =
a=20
> workaround, these folders are renamed during installation to DEBIAN-ptest=
,=20
> and before execution the run-ptest script restores their names.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---

Hi Gyorgy,

Thanks for your patch.

It looks like some of these ptests are failing:

WARNING: core-image-ptest-dpkg-1.0-r0 do_testimage: There were failing ptes=
ts.
...
AssertionError:
ptests which had no test results:
['dpkg']

Cannot run ptests without @expectedFailure as ptests are expected to fail

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3164697/raw_inlin=
e
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3164752/raw_inlin=
e
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/3164788/raw_inlin=
e

Ptest results can be found here:

https://valkyrie.yocto.io/pub/non-release/20250805-32/testresults/qemuarm64=
-ptest/core-image-ptest-dpkg/
https://valkyrie.yocto.io/pub/non-release/20250805-32/testresults/qemuriscv=
64-ptest/core-image-ptest-dpkg/
https://valkyrie.yocto.io/pub/non-release/20250805-32/testresults/qemux86-6=
4-ptest/core-image-ptest-dpkg/

Best regards,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


