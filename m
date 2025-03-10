Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BADF4C282DE
	for <webhook@archiver.kernel.org>; Mon, 10 Mar 2025 11:18:56 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web10.35222.1741605534335957412
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Mar 2025 04:18:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NQcsNYww;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 411124424E;
	Mon, 10 Mar 2025 11:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741605532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AOaZxpnZCSvRSuYoV8FBvGBrASrMgtALfJvwVgMNcy0=;
	b=NQcsNYwwxePZyjOHLCLYD7SCPIR2GPCbxTZ5PlgeMMIa971sPJNZ9yfG8UAVngwQWGixBJ
	yq4QT4ahujDK/z/IjJeQrLMPupbc2XkYDgZAcPcUK4XPcBYADmLrwgTcS/w+1a9yJQaSQI
	sujQASvdcqmgK3yQuAvmDMNfAzDT26Al0F/LmYobVjEqP7LqGhjL11B4sE+6D/xnSwfff5
	kMuZeCOZNq7D/f7Z0QXiJNNADgnk6B7/Y3ySX8D7Hp0BhbS5fk8MpQX3suoFCx4xCRxGDz
	VdmFqVUHZFPq1QnOPFkVNRzSfITYqjj5AxhipiCKywiLv1yXGdARvOa8xyDxeA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 10 Mar 2025 12:18:51 +0100
Message-Id: <D8CJMW1CPLC1.3CM5UHDV9794@bootlin.com>
Subject: Re: [OE-core][PATCH] lib: Fix dependencies on SPDX code
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <JPEWhacker@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250307154313.1143215-1-JPEWhacker@gmail.com>
In-Reply-To: <20250307154313.1143215-1-JPEWhacker@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduudelvddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheplffrgfghhhgrtghkvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnv
 ghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Mar 2025 11:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212510

On Fri Mar 7, 2025 at 4:43 PM CET, Joshua Watt via lists.openembedded.org w=
rote:
> The SPDX library code was being ignored from taskhash calculations due
> to accidentally being omitted from BBIMPORTS. This meant that changes in
> the code or dependent variables would not cause the task to rebuild
> correctly.
>
> In order to add spdx_common, convert the `Dep` object from a named tuple
> to a frozen dataclass. These function more or less equivalently, but the
> bitbake code parser cannot handle named tuples.
>
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---

Hi Joshua,

I believe this is triggering some issue on the autobuilder:

2025-03-10 09:45:19,401 - oe-selftest - INFO - testtools.testresult.real._S=
tringException: Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/=
selftest/cases/sstatetests.py", line 482, in test_sstate_allarch_samesigs
    self.sstate_common_samesigs(configA, configB, allarch=3DTrue)
  File "/srv/pokybuild/yocto-worker/oe-selftest-ubuntu/build/meta/lib/oeqa/=
selftest/cases/sstatetests.py", line 213, in sstate_common_samesigs
    self.assertEqual(files1, files2)
  File "/usr/lib/python3.12/unittest/case.py", line 885, in assertEqual
    assertion_func(first, second, msg=3Dmsg)
  File "/usr/lib/python3.12/unittest/case.py", line 1184, in assertDictEqua=
l
    self.fail(self._formatMessage(msg, standardMsg))
  File "/usr/lib/python3.12/unittest/case.py", line 715, in fail
    raise self.failureException(msg)
AssertionError: {'nat[215727 chars]x': 'd8ed538990588f9d37804e867be98c9b480=
9de8f2[88942 chars]d1a'} !=3D {'nat[215727 chars]x': '481bab8ce0c89a635d3ec=
3f3c4a28c0b5a67b2c23[88942 chars]d1a'}

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1715394/raw_inlin=
e

Can you have a look at this error please?


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


