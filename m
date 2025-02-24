Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 326F7C021A4
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 11:02:16 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.86291.1740394934437780298
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Feb 2025 03:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=IUMWLm36;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 202AD44416;
	Mon, 24 Feb 2025 11:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740394932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oAS5LBCiJnCTE8/WQnPTJYV0sJv5PJMfPMlwmeTTC3U=;
	b=IUMWLm363r7pKa5jVxbQQ7XcPwWlhnxpY5+sePp1VZTcCHypLTtJIn101z2O9KgY7L+Ni6
	f1PEL3rM9gjT0acoXAsWROGRr48Ax3M3tCWhkxHSScOTlm90F560x/5Itfa2hT8WltJHFv
	aSCgt+5XcmBveaZ6j0o+kuRPVoy7frRelcnMQkN8dtC2Ai3eU4pXXHPE8cVFl5gvbT/zAk
	BUZiPy4x2ZE3hwnOgGdSNdnPbZLRrCbUgGMuSnxcNKVuLTEu3IZ550P3jUT2HcOJ+E/2/E
	IGZPxUr9ELbqzUbjmHS810D/PkUnNwXYTxzf+aYiT44ND2C2+rIwvHsc+kNrFA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 24 Feb 2025 12:02:11 +0100
Message-Id: <D80MIHYVC9GD.3CYJ2JAWQ7WD9@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Changqing Li" <changqing.li@windriver.com>,
 <openembedded-core@lists.openembedded.org>, <joerg.sommer@navimatix.de>
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig
 only if distro-feature set"
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250220035724.1460062-1-changqing.li@windriver.com>
 <D7Y7576F5D4R.128DYAUZ74YXF@bootlin.com>
 <1826FD59DBA1FC0B.20721@lists.openembedded.org>
 <e11efa41-2e8c-40be-a551-f0670eda85c7@windriver.com>
In-Reply-To: <e11efa41-2e8c-40be-a551-f0670eda85c7@windriver.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejkeeitdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgeetueehteegkeetffdvueejhfejvdffgefhfeeufeegheegvdejfeelffdtleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhordhiohdpghhithhhuhgsrdgtohhmpdhtvghsthgpohhsrdhphidpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohept
 ghhrghnghhqihhnghdrlhhiseifihhnughrihhvvghrrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhgpdhrtghpthhtohepjhhovghrghdrshhomhhmvghrsehnrghvihhmrghtihigrdguvg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Feb 2025 11:02:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211843

On Mon Feb 24, 2025 at 9:20 AM CET, Changqing Li wrote:
>
> On 2/24/25 08:27, Changqing Li via lists.openembedded.org wrote:
> Hi, Mathieu
>
> I cannot reproduce this ptest failure on my host. No failure of=20
> test_timerfd_TFD_TIMER_ABSTIME in log.do_testimage. and the result is:
>
> RESULTS - parselogs.ParseLogsTest.test_get_context: PASSED (0.00s)=20
> RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (2.71s) RESULTS=
=20
> - ping.PingTest.test_ping: PASSED (0.02s) RESULTS -=20
> ssh.SSHTest.test_ssh: PASSED (0.56s) RESULTS -=20
> ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s)=20
> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail:=20
> EXPECTEDFAIL (4455.53s) SUMMARY: core-image-ptest-python3 () - Ran 6=20
> tests in 4458.839s core-image-ptest-python3 - OK - All required tests=20
> passed (successes=3D4, skipped=3D1, failures=3D0, errors=3D0) DEBUG: Pyth=
on=20
> function do_testimage finished
>
> And I checked=20
> https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux86=
-64-ptest/core-image-ptest-python3/,=20
>
>
> there is no AssertionError in log.do_testimage.2624139.20250221054435=20
> <https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux8=
6-64-ptest/core-image-ptest-python3/log.do_testimage.2624139.20250221054435=
>.
>
> So I checked test_timerfd_TFD_TIMER_ABSTIME, refer [1]. Seems like this=
=20
> is not related to my changes.
>
> My commit changes RDEPENDS for package pthon3-ctype, and this is=20
> actually no influence for poky, since poky enable distro_feature=20
> ldconfig by default.
>
> There are some similar timerfd issue in upstream python, I guess maybe=20
> this is an intermittent failure of python13
>
> [1] https://github.com/python/cpython/blob/main/Lib/test/test_os.py#L4402
>
> [2] https://github.com/python/cpython/issues/126112
>
> Regards
> Changqing

Hi Changqing,

Thanks for testing. This might be a intermittent failure, but I believe
we never saw this one before.

I will add back this patch in my branch and let's see how it goes!

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


