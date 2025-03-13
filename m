Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1E7FC282DE
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 17:59:42 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.21648.1741888773256004580
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Mar 2025 10:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=iH/GpJMW;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B0B10442C0;
	Thu, 13 Mar 2025 17:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1741888771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zoTnRm5PqZaMoUpS7KMxm4iiIA/lrkvArIUWB0zyCuE=;
	b=iH/GpJMWTgmgn5P9EpqRWtDDBKN1dvhvrFzroBnObLQE4zzD6am455mYwKijNoygMwnGMM
	H4yXfM3ee7S8fCSy9b0YnMmMDeWq82+LcCRW9VdJ/wEkRBgW8oY/o4zbB3K/nG/14M0TKI
	zIhlzLoxuKrHxsIDO0Pa/eIBBuKBAhEHK2o9y84GNbNjD58LtmNlCqHda1Ia6yk/atNraO
	hmgE3fIuVypPlplRrIudwOgeA5cgoUk9YsZqjYrDJArgKGhW8aakFif9X6r3Z2S8VeYHXv
	MczzylLT2L3aKFuzjgIMazc6R6WWk2hKKbWJbt3usqXJ1afe6AkYlC6VM9Zhiw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Mar 2025 18:59:31 +0100
Message-Id: <D8FC1AEI4MBQ.2COAWNC1NGIQE@bootlin.com>
To: <bin.lan.cn@windriver.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH v5 0/1] babeltrace2: upgrade 2.0.6 -> 2.1.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20250313021751.2313822-1-bin.lan.cn@windriver.com>
In-Reply-To: <20250313021751.2313822-1-bin.lan.cn@windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduvdekieduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffvuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgvdeluefhtddvveffudevuefhkeejgeejveejkeehtddufeehgfdvgeduffefveenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdphihotghtohdrihhopdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudegmeehheeimeejrgdttdemfehftghfmehfsgdtugemuddviedvmedvvgejiedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopegsihhnrdhlrghnrdgtnhesfihinhgurhhivhgvrhdrtghom
 hdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Mar 2025 17:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212799

On Thu Mar 13, 2025 at 3:17 AM CET, Bin Lan via lists.openembedded.org wrot=
e:
> From: Bin Lan <bin.lan.cn@windriver.com>
>
> v3:
> Some failed test cases are disabled.
> All test cases are passed when running in intel-x86-64 board.
>
> v4:
> The Upstream-Status of patches is set to Pending, I will discuss it with =
Babeltrace2 project.
> Add some notes in the commit log to explain the license change significan=
tly.
> Add more notes in the commit message to explain the change of babeltrace2=
_2.1.0.bb.
> Remove "INSANE_SKIP:${PN}-ptest +=3D "buildpaths" in this patch by settin=
g the correct environment variables in env.sh.
> All test cases are passed when running in intel-x86-64 board.
>
> v5:
> 0001-Make-manpages-multilib-identical.patch and 0001-tests-set-the-correc=
t-plugin-directory.patch
> are submitted to Babeltrace project.
> All test cases (no skipped test cases) are passed when running in intel-x=
86-64=20
> and qemux86-64 as the following shown:
>
> Testsuite summary for babeltrace2 2.1.0
> # TOTAL: 2022
> # PASS:  2022
> # SKIP:  0
> # XFAIL: 0
> # FAIL:  0
> # XPASS: 0
> # ERROR: 0
>
> Bin Lan (1):
>   babeltrace2: upgrade 2.0.6 -> 2.1.0
>
>  ...001-Make-manpages-multilib-identical.patch |  12 +-
>  ...not-run-test-applications-from-.libs.patch |  28 ----
>  ...-fix-test-applications-in-cpp-common.patch | 129 ++++++++++++++++++
>  ...sts-set-the-correct-plugin-directory.patch |  30 ++++
>  .../lttng/babeltrace2/run-ptest               |   4 +-
>  ...eltrace2_2.0.6.bb =3D> babeltrace2_2.1.0.bb} |  35 ++++-
>  6 files changed, 198 insertions(+), 40 deletions(-)
>  delete mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-do-n=
ot-run-test-applications-from-.libs.patch
>  create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-fix-=
test-applications-in-cpp-common.patch
>  create mode 100644 meta/recipes-kernel/lttng/babeltrace2/0001-tests-set-=
the-correct-plugin-directory.patch
>  rename meta/recipes-kernel/lttng/{babeltrace2_2.0.6.bb =3D> babeltrace2_=
2.1.0.bb} (69%)

Hi,

Thanks for the new version, but I believe we do have some failing
ptests:

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/1758114/raw_inlin=
e

Can you have a look at those please?

More details can be found in:
https://valkyrie.yocto.io/pub/non-release/20250313-87/testresults/qemux86-6=
4-ptest/core-image-ptest-babeltrace2/

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


