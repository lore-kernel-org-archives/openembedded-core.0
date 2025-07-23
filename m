Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13F2C83F1A
	for <webhook@archiver.kernel.org>; Wed, 23 Jul 2025 09:37:35 +0000 (UTC)
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by mx.groups.io with SMTP id smtpd.web11.9792.1753263446332950072
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Jul 2025 02:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=kUU+kQLd;
 spf=pass (domain: bootlin.com, ip: 217.70.178.235, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3278644271;
	Wed, 23 Jul 2025 09:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753263444;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jZ6VtBXnFo/+WiFCzwsgWJwPRQZJO3arkJRJ00jYAUE=;
	b=kUU+kQLdRtiv3xBiVMBOY0KOYdwLvfV4NtxAi/ybuWd9g7ah2z5pTJm0nB93f70imqTm+Z
	TCLpvqo8D7mwQHztNa05y7mnSYhkRzcRRpz+s3LFLLcTHsx7asSbszpezbZ+cFlnLVwM5P
	0Go5ghO7ZRQyWofvqYW1cr3Vk5cXn2KB8lieVllOtkjRT8xkrJ1sdJsTBhNJ+tqii1g3I3
	zulC2H5MIDNiHxZzu3ZJenscEiB2syf+MdVCFrHfbNbOPz+ZNRlknx0nasDOWXAtyOsW/L
	cBeRfFPCRz8tSB4BN7emiuuF1Ca+QYoSAhiMaTrTrB6LL5v1PScOrcler3lQgA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 23 Jul 2025 11:37:23 +0200
Message-Id: <DBJC0QX4FJ0A.EVEZKMCNWFYQ@bootlin.com>
Subject: Re: [OE-core] [PATCH 07/12] ltp: upgrade 20250130 -> 20250530
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liuyd.fnst@fujitsu.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250723010614.926-1-liuyd.fnst@fujitsu.com>
 <20250723010614.926-7-liuyd.fnst@fujitsu.com>
In-Reply-To: <20250723010614.926-7-liuyd.fnst@fujitsu.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejjeeggecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueffkeffhedtfeejfeduffeftdeuleetudffkeevuedtjeeukeffieetffetfeetnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrdgtohhmpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheplhhiuhihugdrfhhnshhtsehfuhhjihhtshhurdgtohhmp
 dhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Jul 2025 09:37:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220797

On Wed Jul 23, 2025 at 3:06 AM CEST, Yiding Liu (Fujitsu) via lists.openemb=
edded.org wrote:
> Changelog: https://github.com/linux-test-project/ltp/releases/tag/2025053=
0
>
> Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
> ---

Hi,

Thanks for the update.

It looks like this is failing on the autobuilder:

WARNING: core-image-sato-1.0-r0 do_testimage: Copy returned non-zero exit s=
tatus 1:
scp: /opt/ltp/results/ipc: No such file or directory
WARNING: core-image-sato-1.0-r0 do_testimage: File could not be copied. Out=
put: scp: /opt/ltp/results/ipc: No such file or directory
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarm64-ltp/build/meta/lib/oeqa/core/=
decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuarm64-ltp/build/meta/lib/oeqa/runti=
me/cases/ltp.py", line 125, in test_ltp_groups
    self.runltp(ltp_group)
  File "/srv/pokybuild/yocto-worker/qemuarm64-ltp/build/meta/lib/oeqa/runti=
me/cases/ltp.py", line 98, in runltp
    results, sections  =3D parser.parse(dst)
                         ^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/qemuarm64-ltp/build/meta/lib/oeqa/utils=
/logparser.py", line 129, in parse
    with open(logfile, errors=3D"replace") as f:
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
FileNotFoundError: [Errno 2] No such file or directory: '/srv/pokybuild/yoc=
to-worker/qemuarm64-ltp/build/build/tmp/work/qemuarm64-poky-linux/core-imag=
e-sato/1.0/testimage/ltp_log.20250723071044/ipc'
...
RESULTS - ltp.LtpTest.test_ltp_groups: ERROR (1999.60s)

https://autobuilder.yoctoproject.org/valkyrie/#/builders/98/builds/1946
https://autobuilder.yoctoproject.org/valkyrie/#/builders/63/builds/1915

Can you have a look at these failures please?


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


