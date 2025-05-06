Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 076F9C3ABAC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 06:43:33 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.70742.1746513809057293243
 for <openembedded-core@lists.openembedded.org>;
 Mon, 05 May 2025 23:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jh/4iIuT;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0750E4422A;
	Tue,  6 May 2025 06:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746513807;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MeSj+FTjlbvt6Paj5y2Hpe4NrbrNivtd5htbNjks5V4=;
	b=Jh/4iIuT5PHhsSxtH/mt8JujdXuTNEjmpboCXvUPMXT/fWwhMznOJcrk4QMb7C2/ibfx2r
	oe0tncY88iT4YFjAD1uh4zWgyzWdHC4j9IG0HW5bNv3Y9m1ptvAai0S9wcIsmLzLD++I0r
	INSDQHAwJxc4YiJTurX1qNngDei/LHnPlEct0oWcTCa5VFASEcH4ykeKuZIeCp4fUJYAme
	fjp9DgJteP9+q+UvZW1x7OlwNyNY6hhW1WOn1if0ki5tEzx+mrAJF+Y9uY2JG6oka2oLrY
	zVxIIw1AbvfV6lykOkNvgEkfm/wYRvtp7ASWwk9xPmMkNh2WXiaNLZhESVMRGw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 May 2025 08:43:26 +0200
Message-Id: <D9OVH2DTYGL9.1DVFL0W5QGKWH@bootlin.com>
Subject: Re: [OE-core] [PATCH] rpm-sequoia: add ptest
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ines.kchelfi@smile.fr>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250505101642.9255-2-ines.kchelfi@smile.fr>
In-Reply-To: <20250505101642.9255-2-ines.kchelfi@smile.fr>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeefvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetkedvtdduteetteegjeeukefhgfejgffffeffueffjefhvdehjeefkeefuddvvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdphihotghtohdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehinhgvshdrkhgthhgvlhhfihesshhmihhlvgdrfhhrpdhrt
 ghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 May 2025 06:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216032

On Mon May 5, 2025 at 12:16 PM CEST, ines.kchelfi via lists.openembedded.or=
g wrote:
> From: Ines KCHELFI <ines.kchelfi@smile.fr>
>
> In rpm-sequoia, some default paths in test code (OUT_DIR,
> CARGO_MANIFEST_DIR) are invalid at runtime and cause test failures.
>
> To fix this, patch the test code (symbols.rs) to support overriding these
> paths via optional environment variables: FORCE_RUNTIME_PATH_LIB and
> FORCE_RUNTIME_PATH_SRC.
>
> Also patch the libray name to match what is installed.
>
> Tests take less than a second so this is added to PTEST_FAST.
>
> ptest result:
> |root@qemux86-64:~# ptest-runner rpm-sequoia
> |START: ptest-runner
> |2025-05-02T15:57
> |BEGIN: /usr/lib/rpm-sequoia/ptest
> |
> |running 1 test
> |test symbols ... ok
> |
> |test result: ok. 1 passed; 0 failed; 0 ignored; 0 measured; 0 filtered o=
ut; finished in 0.00s
> |
> |
> |running 2 tests
> |test tests::merge_certs_mismatch ... ok
> |test tests::merge_certs ... ok
> |
> |test result: ok. 2 passed; 0 failed; 0 ignored; 0 measured; 0 filtered o=
ut; finished in 0.01s
> |
> |DURATION: 0
> |END: /usr/lib/rpm-sequoia/ptest
> |2025-05-02T15:57
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
>
> Signed-off-by: Ines KCHELFI <ines.kchelfi@smile.fr>
> ---

Hi Ines,

Thanks for your patch.

It looks like some of these ptests are not running correctly on the autobui=
lder:

WARNING: core-image-ptest-rpm-sequoia-1.0-r0 do_testimage: There were faili=
ng ptests.
Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/cor=
e/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/cor=
e/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/cor=
e/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
  File "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/run=
time/cases/ptest.py", line 27, in test_ptestrunner_expectfail
    self.do_ptestrunner()
  File "/srv/pokybuild/yocto-worker/qemuarm64-ptest/build/meta/lib/oeqa/run=
time/cases/ptest.py", line 120, in do_ptestrunner
    self.fail(failmsg)
AssertionError:
ptests which had no test results:
['rpm-sequoia']

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1434
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1437

Details about the ptests can be found in:

https://valkyrie.yocto.io/pub/non-release/20250505-91/testresults/qemuarm64=
-ptest/core-image-ptest-rpm-sequoia/
https://valkyrie.yocto.io/pub/non-release/20250505-91/testresults/qemux86-6=
4-ptest/core-image-ptest-rpm-sequoia/

Can you have a look at the issue please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


