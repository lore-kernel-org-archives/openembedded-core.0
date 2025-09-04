Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0BD7CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 08:41:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.34337.1756975308899626048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 01:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=P+I8bvap;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E40E74E40C5F;
	Thu,  4 Sep 2025 08:41:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BD07B606BB;
	Thu,  4 Sep 2025 08:41:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A16A1C22CDFF;
	Thu,  4 Sep 2025 10:41:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756975306; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z2dPi4TfKau4zPjEActBG8bO7AA9eG22VU+NNNbpYp0=;
	b=P+I8bvapI7n/kp0VjjvC0cgYZYpDs/TTwMaqx7PYnRSR/5Wbg/j1BrFi+9wwMbNV08tbXW
	FU07GILzF3VoeUWE2TmEH2MmEC2ifV7w2OTStgm9OlKAY14XfTQOJEoiiY8jbCF0tXwxnY
	GtJW53Rs7ufjli3cJ7h6ha3UBattXkldOdwMP8rPRRo1YMTAedUPOdb6IgQaWJv1xb1dEQ
	NLi+HUuw+Zz2ksB+d0iMKnlKF9gg7vuP9OLZOuxUykkowy6o9JSacpI12H8WEYL/9JUo7c
	WHuxufBZpGgHw5n88l5RUyzvHw9FRR7nXYYDc0KpcW1u13KBhOILHnMcG2ysoQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Sep 2025 10:41:39 +0200
Message-Id: <DCJVRHOG6FV4.10QCP2VS4QG4Q@bootlin.com>
Subject: Re: [master][PATCH v2] libsdl2: Add tests package and ptest support
Cc: <alex@linutronix.de>, <alex.kanavin@gmail.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <a-christidis@ti.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250904000724.1575300-1-a-christidis@ti.com>
In-Reply-To: <20250904000724.1575300-1-a-christidis@ti.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 08:41:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222909

On Thu Sep 4, 2025 at 2:07 AM CEST, a-christidis wrote:
> From: Antonios Christidis <a-christidis@ti.com>
>
> The SDL2 software comes with its own set of tests. Following that
> introduce support for ptest.
>
> Signed-off-by: Antonios Christidis <a-christidis@ti.com>
> ---

Hi Antonios,

Thanks for the new version.

It looks like we still have a QA issue:

ERROR: nativesdk-libsdl2-2.32.8-r0 do_package: QA Issue: nativesdk-libsdl2:=
 Files/directories were installed but not shipped in any package:
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testsurround.test
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testerror.test
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testtimer.test
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testatomic.test
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testfilesystem.test
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testthread.test
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testaudioinfo.test
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testlocale.test
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testevdev.test
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testpower.test
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testqsort.test
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testplatform.test
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testautomation.test
  /usr/local/oe-sdk-hardcoded-buildpath/sysroots/x86_64-pokysdk-linux/usr/s=
hare/installed-tests/SDL2/testver.test
Please set FILES such that these items are packaged. Alternatively if they =
are unneeded, avoid installing them or delete them within do_install.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/19/builds/2327

Can you fix it please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


