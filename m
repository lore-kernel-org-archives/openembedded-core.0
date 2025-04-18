Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D515C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 10:24:56 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.8527.1744971890711929107
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 03:24:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=OJyPwJie;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BCA3433C9;
	Fri, 18 Apr 2025 10:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1744971888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eHG2ixmQWLV19g2cuDT7u2SSZHWtoBLMnxT378Aozmo=;
	b=OJyPwJieaKG19xv3fNllzqGecSFxFFb430sPdzrh9YFJuaernEpTLv9NU3TAFpcwCvjX8e
	HWzSDFo1Ie5WrjNi356AkQp9hSCw3VIrbeG+hR5DuQq9CT3cF9ywt/s562uxcEaF2nZFmb
	iXOKksqZieeC9KVdpICmseix18ZemWJcJ4nVMmLAR0GqVa7BVZLQdZNMEtMYjFE3uekWWl
	WtDhEWhWPGH6+2Otd7GM4dbzPqKdPh0nzKZ9HO6asFSmMZnjLxmzohZ6dZBirYNigoCNBI
	gGFNEKyoNdBByAvsnleRfKP7YqYfnHIcCBc2jFxYzDcJHgLP4fWlUm0uNazskw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 18 Apr 2025 12:24:47 +0200
Message-Id: <D99OWQOPZ9JM.B2KF6VS4BV01@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/2] glibc: Forward -ffile-prefix-map option
 to assembler flags
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250417173332.554656-1-raj.khem@gmail.com>
In-Reply-To: <20250417173332.554656-1-raj.khem@gmail.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeduledtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffvuffhofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeettdejvdefudegueejjeehkeejueetudejvddvgeelgeegkeeigeduvdejtdfggeenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhgrjhdrkhhhvghmsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhpvghnvghms
 ggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 10:24:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215126

On Thu Apr 17, 2025 at 7:33 PM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

Thanks for your series.

I believe it is breaking go on the autobuilder:

ERROR: go-runtime-1.24.2-r0 do_package_qa: QA Issue: File /usr/lib/go/pkg/l=
inux_arm64_dynlink/plugin.a in package go-runtime-dev contains reference to=
 TMPDIR [buildpaths]
ERROR: go-runtime-1.24.2-r0 do_package_qa: QA Issue: File /usr/lib/go/pkg/l=
inux_arm64_dynlink/net.a in package go-runtime-dev contains reference to TM=
PDIR [buildpaths]
ERROR: go-runtime-1.24.2-r0 do_package_qa: QA Issue: File /usr/lib/go/pkg/l=
inux_arm64_dynlink/internal/testpty.a in package go-runtime-dev contains re=
ference to TMPDIR [buildpaths]
NOTE: Setscene tasks completed
NOTE: Running task 10301 of 11005 (/srv/pokybuild/yocto-worker/genericarm64=
-alt/build/meta/recipes-extended/at/at_3.2.5.bb:do_package_write_ipk)
ERROR: go-runtime-1.24.2-r0 do_package_qa: QA Issue: File /usr/lib/go/pkg/l=
inux_arm64_dynlink/os/user.a in package go-runtime-dev contains reference t=
o TMPDIR [buildpaths]
NOTE: Running task 10303 of 11005 (/srv/pokybuild/yocto-worker/genericarm64=
-alt/build/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_wri=
te_ipk)
NOTE: recipe sysklogd-2.7.2-r0: task do_package_write_ipk: Succeeded
NOTE: Running task 10307 of 11005 (/srv/pokybuild/yocto-worker/genericarm64=
-alt/build/meta/recipes-devtools/python/python3-pluggy_1.5.0.bb:do_create_p=
ackage_spdx)
ERROR: go-runtime-1.24.2-r0 do_package_qa: QA Issue: File /usr/lib/go/pkg/l=
inux_arm64_dynlink/runtime/cgo.a in package go-runtime-dev contains referen=
ce to TMPDIR [buildpaths]
NOTE: Task /srv/pokybuild/yocto-worker/genericarm64-alt/build/meta/recipes-=
extended/sysklogd/sysklogd_2.7.2.bb:do_package_write_ipk unihash changed to=
 69e6baca1186c873e5da11893803e9919551e88bbb951cc484649b725d81e7bd
NOTE: recipe python3-pluggy-1.5.0-r0: task do_create_package_spdx: Started
NOTE: recipe at-3.2.5-r0: task do_package_write_ipk: Started
ERROR: go-runtime-1.24.2-r0 do_package_qa: QA Issue: File /usr/lib/go/pkg/l=
inux_arm64_dynlink/crypto/internal/sysrand/internal/seccomp.a in package go=
-runtime-dev contains reference to TMPDIR [buildpaths]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/22/builds/1406

Can you have a look at this please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


