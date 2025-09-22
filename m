Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94C3CCAC592
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 08:06:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.46467.1758528384889249592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 01:06:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=X0ch1FyG;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F2C821A0F11;
	Mon, 22 Sep 2025 08:06:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6D7460634;
	Mon, 22 Sep 2025 08:06:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9153A102F16E4;
	Mon, 22 Sep 2025 10:06:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758528382; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=czO3VSgUQoXy00n0OQKR/FZYegEzFDxIdTHQEmrC18w=;
	b=X0ch1FyGFHmB0UjgbyYHPwhsWEywIUh3D7VmwpJ7gVDNXI2dwDEIlgY55Ad7sTqp3H+Y3o
	MiyW+neOr4WuDama9il3sKP73SP/b1h0zqqq980becNXO7FlSK06s6mX2RFzcRvfXYVw9t
	6A6OPN36Jxu7Fu9kyew5Du3/+cCK1mc0MzGRkFa6aL5AhGXenzfaDBkqCCLFfFV7jRRvR1
	LJ9UQ3UW8W4LqWz5nGiAYvsdbp5DEADtK4FKiwwXLA1YPYRzxrvXRxSU5DgpSJ5yYda/pp
	/riTKQtMG5M6mPySuyWN+r28PWtbw+mySywaYQ+gdYz6M2YM6+fAwELLvj+CpQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Sep 2025 10:06:14 +0200
Message-Id: <DCZ6A6KYMJDF.P20GW3KJHRF1@bootlin.com>
Subject: Re: [OE-core][PATCH 6/6] python3-setuptools-scm: upgrade 8.3.1 ->
 9.2.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250919164803.3174518-1-tgamblin@baylibre.com>
 <20250919164803.3174518-6-tgamblin@baylibre.com>
 <DCYB3P86O998.3GPS55UV93JDF@bootlin.com>
 <e639013c-4bc4-44f6-b1af-10ef025a3087@baylibre.com>
In-Reply-To: <e639013c-4bc4-44f6-b1af-10ef025a3087@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 08:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223812

On Sun Sep 21, 2025 at 4:09 PM CEST, Trevor Gamblin wrote:
>
> Seems to be fixed with an upgrade to python3-dbusmock - they recently=20
> changed the build configurations upstream. I've sent a patch to do that=
=20
> upgrade and CC'd you.
>
> - Trevor
>
>>
>> Thanks,
>> Mathieu
>>

Thanks! It's better, but now we have an issue with urllib:

ERROR: python3-urllib3-2.5.0-r0 do_compile: Execution of '/srv/pokybuild/yo=
cto-worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/p=
ython3-urllib3/2.5.0/temp/run.do_compile.1714719' failed with exit code 1
...
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/musl-qemux=
86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/python3-urllib3/2.5.0/=
temp/log.do_compile.1714719
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| ERROR Missing dependencies:
| 	setuptools-scm<9,>=3D8

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2486

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


