Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6699DC021B2
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 09:12:40 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web11.4234.1740474753352214305
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Feb 2025 01:12:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=fXMLY9aQ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 19D7D43289;
	Tue, 25 Feb 2025 09:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1740474751;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=krcCg7PAXDFq1SSAFzrvQffIW5GZOfwGRRN/RXKQMkc=;
	b=fXMLY9aQn1OioDpcqwsSm0lH/O288eitg8Oz1VzKWVm/2j0y7Cvv+i2LI9Hp8PioG7wcf1
	5NGDYjFB5q7UUlgxxyzdkdPf+fqUvzYvVQ23uELIQNrPrZRFZdqjYE6/DcNGMm2SXgWEMc
	HU3cL5NFdk6MZGLDbK+j/qLZSqYeH7en7PWjbmMwwJ9RNqBPorAfm4/yqHM96m9VC4imyN
	5KOBV171mM2YmIOcWl4gaa0gDVIojBSwWPc0kvCpK+J6gcg2mdLdPxIhMBdw7Ofh8FjoFg
	lkFZKdxc3We0FrNMnTC3vmI+GBxdMWy/Yeen7FPKBuen3RdDLwqGMOq+nJzJhA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 Feb 2025 10:12:29 +0100
Message-Id: <D81ET1Y1GAYL.3AI2RCOQLK8GS@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mathieu.dubois-briand@bootlin.com>, "Changqing Li"
 <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>,
 <joerg.sommer@navimatix.de>
Subject: Re: [OE-core] [PATCH] Revert "python3-ctypes: depend on ldconfig
 only if distro-feature set"
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250220035724.1460062-1-changqing.li@windriver.com>
 <D7Y7576F5D4R.128DYAUZ74YXF@bootlin.com>
 <1826FD59DBA1FC0B.20721@lists.openembedded.org>
 <e11efa41-2e8c-40be-a551-f0670eda85c7@windriver.com>
 <18271FF8E1B74516.20721@lists.openembedded.org>
In-Reply-To: <18271FF8E1B74516.20721@lists.openembedded.org>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudefudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffgeetueehteegkeetffdvueejhfejvdffgefhfeeufeegheegvdejfeelffdtleenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhordhiohdpghhithhhuhgsrdgtohhmpdhtvghsthgpohhsrdhphidpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepm
 hgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdprhgtphhtthhopegthhgrnhhgqhhinhhgrdhlihesfihinhgurhhivhgvrhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrghdprhgtphhtthhopehjohgvrhhgrdhsohhmmhgvrhesnhgrvhhimhgrthhigidruggv
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Feb 2025 09:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211867

On Mon Feb 24, 2025 at 12:02 PM CET, Mathieu Dubois-Briand via lists.openem=
bedded.org wrote:
> On Mon Feb 24, 2025 at 9:20 AM CET, Changqing Li wrote:
> >
> > On 2/24/25 08:27, Changqing Li via lists.openembedded.org wrote:
> > Hi, Mathieu
> >
> > I cannot reproduce this ptest failure on my host. No failure of=20
> > test_timerfd_TFD_TIMER_ABSTIME in log.do_testimage. and the result is:
> >
> > RESULTS - parselogs.ParseLogsTest.test_get_context: PASSED (0.00s)=20
> > RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (2.71s) RESULT=
S=20
> > - ping.PingTest.test_ping: PASSED (0.02s) RESULTS -=20
> > ssh.SSHTest.test_ssh: PASSED (0.56s) RESULTS -=20
> > ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED (0.00s)=
=20
> > RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail:=20
> > EXPECTEDFAIL (4455.53s) SUMMARY: core-image-ptest-python3 () - Ran 6=20
> > tests in 4458.839s core-image-ptest-python3 - OK - All required tests=
=20
> > passed (successes=3D4, skipped=3D1, failures=3D0, errors=3D0) DEBUG: Py=
thon=20
> > function do_testimage finished
> >
> > And I checked=20
> > https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemux=
86-64-ptest/core-image-ptest-python3/,=20
> >
> >
> > there is no AssertionError in log.do_testimage.2624139.20250221054435=
=20
> > <https://valkyrie.yocto.io/pub/non-release/20250221-33/testresults/qemu=
x86-64-ptest/core-image-ptest-python3/log.do_testimage.2624139.202502210544=
35>.
> >
> > So I checked test_timerfd_TFD_TIMER_ABSTIME, refer [1]. Seems like this=
=20
> > is not related to my changes.
> >
> > My commit changes RDEPENDS for package pthon3-ctype, and this is=20
> > actually no influence for poky, since poky enable distro_feature=20
> > ldconfig by default.
> >
> > There are some similar timerfd issue in upstream python, I guess maybe=
=20
> > this is an intermittent failure of python13
> >
> > [1] https://github.com/python/cpython/blob/main/Lib/test/test_os.py#L44=
02
> >
> > [2] https://github.com/python/cpython/issues/126112
> >
> > Regards
> > Changqing
>
> Hi Changqing,
>
> Thanks for testing. This might be a intermittent failure, but I believe
> we never saw this one before.
>
> I will add back this patch in my branch and let's see how it goes!

Hi Changqing,

I confirm I added this back and now it's working. So it might be some
new AB-INT issue, nothing is wrong with your patch from the autobuilder
perspective.

Thanks for your time.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


