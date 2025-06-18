Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E92C7115B
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 07:44:54 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.1571.1750232692217779451
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 00:44:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ejsL3SJV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 130CF438EC;
	Wed, 18 Jun 2025 07:44:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1750232690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvic/0Brzy+O2ZlSobz9TwFIXgphqglIei/5MyUVkKs=;
	b=ejsL3SJVP2m0wz6hy328Gk2vpKQETsKCYWz1FfOrNGiKTtLIyzTGYfqNzMjmRSD9Y9cUh+
	hTnF1rw7SHA0zSjTKR8jfP9I2JmXLVRSu28wa/BMxWa7OE/pl4CMyQkjjvtEAelQm9Zq1R
	+J1Uwb2ki/O0/uMgQdvrUfC/2IxBRwWDZOR6/OG3ywdA87tG+v8dMaYoxpfEFbeeXpnhmY
	VSPtlzziyyCJgqUyICkYyWGARqeCJLFp+c7W1t+VJUKVXeQWg1m2L8fnlebBSGljtSZ39P
	1JmZ7W3G1KxspfqJHcKKW6J9to8o4DCQR/tiGDJnjwWNv/yikga0wnfUpLAdwA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Jun 2025 09:44:48 +0200
Message-Id: <DAPHPH52I484.2B0WX2IL9VY0O@bootlin.com>
Subject: Re: [OE-core][PATCH 3/5] python3: upgrade 3.13.4 -> 3.13.5
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250617155339.1305652-1-tgamblin@baylibre.com>
 <20250617155339.1305652-3-tgamblin@baylibre.com>
In-Reply-To: <20250617155339.1305652-3-tgamblin@baylibre.com>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvudehucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepledtgfegvefhjeefteektddvledvveetueeffeegvefhjeeliefhheegveevieejnecuffhomhgrihhnpehphihthhhonhdrohhrghdphihotghtohhprhhojhgvtghtrdhorhhgpdihohgtthhordhiohdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepthhgrghmsghlihhnsegsrgihl
 hhisghrvgdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 07:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218976

On Tue Jun 17, 2025 at 5:53 PM CEST, Trevor Gamblin wrote:
> Changelog: https://docs.python.org/3/whatsnew/changelog.html#python-3-13-=
5-final
>
> ptests look OK:
>
> |443 tests OK.
> |
> |Total duration: 2 min 43 sec
> |Total tests: run=3D44,050 skipped=3D2,309
> |Total test files: run=3D471/480 skipped=3D28 resource_denied=3D9
> |Result: SUCCESS
> |DURATION: 164
> |END: /usr/lib/python3/ptest
> |2025-06-17T14:05
> |STOP: ptest-runner
> |TOTAL: 1 FAIL: 0
>
> Reproducibility OK:
>
> |2025-06-17 10:34:28,071 - oe-selftest - INFO -  ... ok
> |2025-06-17 10:35:04,539 - oe-selftest - INFO - -------------------------=
---------------------------------------------
> |2025-06-17 10:35:04,539 - oe-selftest - INFO - Ran 1 test in 1429.952s
> |2025-06-17 10:35:04,539 - oe-selftest - INFO - OK
> |2025-06-17 10:35:08,924 - oe-selftest - INFO - RESULTS:
> |2025-06-17 10:35:08,924 - oe-selftest - INFO - RESULTS - reproducible.Re=
producibleTests.test_reproducible_builds: PASSED (1393.34s)
> |2025-06-17 10:35:08,925 - oe-selftest - INFO - SUMMARY:
> |2025-06-17 10:35:08,925 - oe-selftest - INFO - oe-selftest () - Ran 1 te=
st in 1429.952s
> |2025-06-17 10:35:08,925 - oe-selftest - INFO - oe-selftest - OK - All re=
quired tests passed (successes=3D1, skipped=3D0, failures=3D0, errors=3D0)
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---

Hi Trevor,

Thanks for your patch.

I believe we still have a ptest failure related to this upgrade:

Failed ptests:
{'python3-pytz': ['pytz/tests/test_docs.py:test_suite',
                  'pytz/tests/test_tzinfo.py:test_suite']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/1724
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/1724

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20250617-94/testresults/qemuarm64=
-ptest/core-image-ptest-python3-pytz/
https://valkyrie.yocto.io/pub/non-release/20250617-94/testresults/qemux86-6=
4-ptest/core-image-ptest-python3-pytz/

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


