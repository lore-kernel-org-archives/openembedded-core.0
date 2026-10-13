Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F15BDCC6B12
	for <webhook@archiver.kernel.org>; Tue, 13 Oct 2026 19:01:18 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5451.1791918074124526530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Oct 2026 12:01:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tNBK7pHQ;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C2E8C1A1218
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 19:01:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3345560362;
	Tue, 13 Oct 2026 19:01:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6B80511D71919;
	Tue, 13 Oct 2026 21:01:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791918066; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DZCjygg0zuOG24rJlP/wtmJFY4VP5a1WoDDDOjIFQho=;
	b=tNBK7pHQeNrg10wz+Pneyfzr4pksisWuSppAyfmaYlfwHnbmdsLdnSZtXHzWWoyfj6ORop
	RMBcsg1DJ9odUeNPUw6xWl5ZZ6QRMNqb1c73/69KrMyk4cdTMiMjEDbFzjQgvqrfaH3nw9
	OqVcjKQhYjW69cmHhmhG0tF0xs+v6afloFQfV59hC/ozeHpjW0hbxWUIoDY0oV6dNc9/9/
	Ejnr7vYG1ADQCGnPbdKYMwSQN+cEuiVH68ln1XO7DKTym7I9iduCGD3GGb6mDTzEUmj8DU
	EK2//oTXEzxCWfm09VGzJuwLAqNO9Tp6lLB3u7BB6KRtXTKFBBt0X8udCKLpUQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 13 Oct 2026 21:01:04 +0200
Message-Id: <DM3XXUK2K2YS.1YF6BBJFAEVM4@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][PATCH] libsoup: add ptest support
Cc: <pratik.farkase@ericsson.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261013081611.10995-1-pratik.farkase@est.tech>
In-Reply-To: <20261013081611.10995-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Oct 2026 19:01:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247737

On Tue Oct 13, 2026 at 10:16 AM CEST, Pratik Farkase wrote:
> Build the installed-tests via the meson tests/installed_tests options
> (enabled through a new 'tests' PACKAGECONFIG when ptest is in
> DISTRO_FEATURES) and run them under ptest with
> gnome-desktop-testing-runner.
>
> Tested on qemux86-64 with ptest-runner: 36 tests, all pass.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the rebase.

So not it looks like one of the tests is failing:

Failed ptests:
{'libsoup': ['libsoup-3.0/http2-body-stream-test.test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4711
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4739
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1374
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1361

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


