Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7562EC0218A
	for <webhook@archiver.kernel.org>; Sat,  1 Feb 2025 14:38:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web11.43935.1738420689130723498
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Feb 2025 06:38:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=AoipbGOm;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 76B1A443C6;
	Sat,  1 Feb 2025 14:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738420687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ex879uxRKr1/SgZMEGLUgHuZFwgQYDuIhqOzvE1UAQI=;
	b=AoipbGOmQRvrBRLMpHeblh6vMEkEJ5feIPYcVKVghqYlarHanjG4Y90QFZ56HKOMc/3Kyf
	KaE7bBgQkerbc1iFFWzh24USYcngbJxnEWsC567VLNOIUoqKvdo5Qfyp8rlAnc3TQ/PsXv
	cSM3EiWebxAgba6LtUrPtEDqdD1bDNTXwxRqDY8zMF6hByjdJFkokNJNCsCqScSCHXTRXo
	e3alVM4DSyORFQDduwyPrM3iNntZWV/1//As+whyLLYpre4GNe11Syec2yf2l6hIYysvMf
	9Sh4xUPbZe+vRaHxanrJb3uM/0WyXLTJe3sSl4y8bQtgLGDgHaEnEQ+IdwIu7Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 01 Feb 2025 15:37:59 +0100
Message-Id: <D7H6P74CVGDM.3LTRAMF91XPEH@bootlin.com>
Subject: Re: [OE-core][PATCH v4 2/2] oeqa/selftest/cases/signing.py:
 Re-enable self-test
Cc: "Alexander Kanavin" <alex.kanavin@gmail.com>, "Randy MacLeod"
 <randy.macleod@windriver.com>, "Khem Raj" <raj.khem@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: =?utf-8?q?Zolt=C3=A1n_B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <D7FH5IEPPGUA.CNZMYM7LM2F4@bootlin.com>
 <20250131064352.2613105-1-zboszor@gmail.com>
 <20250131064352.2613105-2-zboszor@gmail.com>
In-Reply-To: <20250131064352.2613105-2-zboszor@gmail.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffuvefhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepjeeghfektedtfeegjeffvdfhudetledvfeffhfetkeffleefjefgieffudetjeevnecuffhomhgrihhnpeihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvddttddumeeijegtmedukedutdemfhdthedumegstggrgeemuggvudehmeeftdguvgemughffhgtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvddttddumeeijegtmedukedutdemfhdthedumegstggrgeemuggvudehmeeftdguvgemughffhgtpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtohepiigsohhsiihorhesghhmrghilhdrtghomhdprhgtphhtthhopehophgvnhgvm
 hgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopegrlhgvgidrkhgrnhgrvhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehrrghnugihrdhmrggtlhgvohguseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhm
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Feb 2025 14:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210608

On Fri Jan 31, 2025 at 7:43 AM CET, Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi =
wrote:
> Enable building rpm with rpm-seqouia for the test.
>
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---

Sorry, I still get some errors while building:

2025-02-01 14:28:32,979 - oe-selftest - INFO - 9: 40/54 602/618 (56.20s) (0=
 failed) (signing.Signing.test_signing_packages)
2025-02-01 14:28:32,979 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
selftest/cases/signing.py", line 113, in test_signing_packages
    runCmd('%s/rpmkeys --define "_dbpath %s" --import %s' %
  File "/srv/pokybuild/yocto-worker/oe-selftest-debian/build/meta/lib/oeqa/=
utils/commands.py", line 214, in runCmd
    raise AssertionError("Command '%s' returned non-zero exit status %d:\n%=
s" % (command, result.status, exc_output))
AssertionError: Command '/srv/pokybuild/yocto-worker/oe-selftest-debian/bui=
ld/build-st-3250811/tmp/work/core2-64-poky-linux/ed/1.20.2/recipe-sysroot-n=
ative/usr/bin/rpmkeys --define "_dbpath /tmp/oeqa-rpmdbsj05eco3" --import /=
srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-3250811/meta-s=
elftest/files/signing/key.pub' returned non-zero exit status 1:
error: Certificate 7B31316B5D64AD52:
  Policy rejects 7B31316B5D64AD52: No binding signature at time 2025-02-01T=
14:28:26Z
error: /srv/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-325081=
1/meta-selftest/files/signing/key.pub: key 1 import failed.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/893/step=
s/14/logs/stdio

Do you mind having a look at this ?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


