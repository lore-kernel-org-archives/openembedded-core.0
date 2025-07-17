Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86B0C83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 09:42:53 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.44904.1752745364852861930
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 02:42:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=XUbaJNV5;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C6ACA432FA;
	Thu, 17 Jul 2025 09:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1752745362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gybS4+9rJbMTnkcO78hx2LFa/+Pf2ajLPtfV/ilBX0Y=;
	b=XUbaJNV5aalDqp8/mZ69SF9P4CDo4IEobK4scIG+00fLJyh0LE7VhjacgGxt9ellB1PDbP
	U104qLgIFIAXDak9R7xdEPVYZCPwLETcqMk04BrKfuSfSSC/ki5moYtQEIlR77AnkmI7RV
	UsffHthnEBSzI5eFhTuKg/7MRM3i67APon5kATFBk5PZTbK+oAeCytpc5GY+oAH9F7VDBT
	dkQX7JA/lMr9xBqACaDlQpH3CZ1tTubOZGbo0bm8fheh0g/wXWMoSdHb63jUKmH4t+3ruo
	9SXrFa0C4qj5Z/NikIQSXV/9FJSCQonuNSS7FgUPFfjkIgmf2Mk1qmewXC+6/w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Jul 2025 11:42:38 +0200
Message-Id: <DBE8DHTVEB13.27BZ3GL6DGZ1Z@bootlin.com>
Subject: Re: [OE-core] [PATCH 2/2] lttng-tools: Upgrade 2.13.15 -> 2.14.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <mingli.yu@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250717082216.459161-1-mingli.yu@eng.windriver.com>
 <20250717082216.459161-2-mingli.yu@eng.windriver.com>
In-Reply-To: <20250717082216.459161-2-mingli.yu@eng.windriver.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdeitddvhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucenucfjughrpegggfgtfffkuffhvffofhgjsehtqhertdertdejnecuhfhrohhmpedfofgrthhhihgvuhcuffhusghoihhsqdeurhhirghnugdfuceomhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepueffkeffhedtfeejfeduffeftdeuleetudffkeevuedtjeeukeffieetffetfeetnecuffhomhgrihhnpehophgvnhgvmhgsvgguuggvugdrohhrghdpghhithhhuhgsrdgtohhmpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeeffhgtfhemfhgstdgumeduvdeivdemvdgvjeeipdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepmhhinhhglhhirdihuhesvghnghdrfihinhgurhhivhgvr
 hdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:42:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220525

On Thu Jul 17, 2025 at 10:22 AM CEST, Mingli via lists.openembedded.org Yu =
wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Remove 3 backported patch.
> 0001-Fix-rotation-destroy-flush-fix-session-daemon-abort-.patch
> 0001-compat-Define-off64_t-as-off_t-on-linux.patch
> 0001-tests-add-check_skip_kernel_test-to-check-root-user-.patch
>
> Remove 0001-fix-lttng-tools-fails-to-compile-with-libxml2-2.14.0.patch
> as the the issue has been fixed in another way as [1]
>
> Rebase 0001-tests-do-not-strip-a-helper-library.patch and disable-tests.p=
atch
> to fuzz issue.
>
> Add babeltrace2 to DEPENDS to fix below configure error.
>  | configure: error: libbabeltrace2 is required to build tests
>
> src/common/config/session.xsd is restructured to src/common/session.xsd [=
2]
>
> Add 0001-gen-ust-events-constructor-change-rpath-to-libdir-li.patch to fi=
x
> the below buildpath QA issue.
> ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: File /usr/lib/lttng=
-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-events-=
c-constructor-so in package lttng-tools-ptest contains reference to TMPDIR =
[buildpaths]
> ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: lttng-tools-ptest: =
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/g=
en-ust-events-c-constructor-so contains bad RPATH /buildarea3/myu2/yocto/bu=
ilds/ptest-2025-07-09/tmp/work/core2-64-poky-linux/lttng-tools/2.14.0/build=
/tests/utils/testapp/gen-ust-events-constructor [rpaths]
> ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: File /usr/lib/lttng=
-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/gen-ust-events-=
constructor-so in package lttng-tools-ptest contains reference to TMPDIR [b=
uildpaths]
> ERROR: lttng-tools-2.14.0-r0 do_package_qa: QA Issue: lttng-tools-ptest: =
/usr/lib/lttng-tools/ptest/tests/utils/testapp/gen-ust-events-constructor/g=
en-ust-events-constructor-so contains bad RPATH /buildarea3/myu2/yocto/buil=
ds/ptest-2025-07-09/tmp/work/core2-64-poky-linux/lttng-tools/2.14.0/build/t=
ests/utils/testapp/gen-ust-events-constructor [rpaths]
>
> [1] https://github.com/lttng/lttng-tools/commit/2d2e77ddc9e3e63c3c658e824=
fb754f5a534a6ab
> [2] https://github.com/lttng/lttng-tools/commit/4ae042345b4094e98611744d9=
ba6c92265058fdb
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---

Hi Mingli,

Thanks for your patch.

It looks like this is breaking when using musl:

ERROR: lttng-tools-2.14.0-r0 do_compile: oe_runmake failed
...
| ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp: In lambda fun=
ction:
| ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:18:31: error: =
expected id-expression before numeric constant
|    18 |                 int flags =3D ::EFD_CLOEXEC;
|       |                               ^~~~~~~~~~~
| ../../../sources/lttng-tools-2.14.0/src/common/eventfd.cpp:21:36: error: =
expected id-expression before numeric constant
|    21 |                         flags |=3D ::EFD_SEMAPHORE;
|       |                                    ^~~~~~~~~~~~~

https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/790
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2072
https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2102

Can you have a look at these fails please?

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


