Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF4DFCCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 08:05:48 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16691.1792137939959437064
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 01:05:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=fa2+JlhD;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 13530C6220B;
	Fri, 16 Oct 2026 08:06:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 589136075D;
	Fri, 16 Oct 2026 08:05:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D206310328BE6;
	Fri, 16 Oct 2026 10:05:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792137936; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eogeNgMN7/Im0A5gwO15T2EO046HEwHTHz43qHwMxsI=;
	b=fa2+JlhDooEdSSGoJiF9tJ8nMBEYsS09nxKZgvPFpVWGiHQkt6l1F3PKqXtf4Xfiqo9TNd
	Zwqu5RaRnIJkA+xRfK97rlQ4zNmSM9Lfm6P3iOqoWbvaYml0/W4/LXp2NTmo7DBnyn9BwO
	GSUQYaI3phcrm6cvGgYl43UjbTEHvGG8JrhXn/yB8n7t0LzOGda5H/6LvpUQuxT53MAP2g
	3NmTPIwi27Cch9kMY0rNaPB4yXQiAem/HMevsqVZ3r51g+1gVFK1tAdpuT1vskL1XPb2h+
	5yUMK5Q5SVGe9L1drCp7dEPxjlhw762T2FL9WH7Ar6TOAE1duFekZtVXbL2nhg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 10:05:35 +0200
Message-Id: <DM63VLOX4BUM.15QP91UQU5UL6@bootlin.com>
Subject: Re: [OE-core][PATCH v3] libsoup: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261014085044.14497-1-pratik.farkase@est.tech>
 <20261014120737.24575-1-pratik.farkase@est.tech>
In-Reply-To: <20261014120737.24575-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 08:05:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248002

On Wed Oct 14, 2026 at 2:07 PM CEST, Pratik Farkase wrote:
> Build the installed-tests via the meson tests/installed_tests options
> (enabled through a new 'tests' PACKAGECONFIG when ptest is in
> DISTRO_FEATURES) and run them under ptest with
> gnome-desktop-testing-runner.
>
> Tested on qemux86-64 with ptest-runner.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks, it's much better now. Still, I do note some intermittent
failures.

Failed ptests:
{'libsoup': ['libsoup-3.0/multithread-test.test']}
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/4725

Failed ptests:
{'libsoup': ['libsoup-3.0/http2-test.test']}
https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/26031

I believe we can keep it in testing for a bit of time and see which test
fails and how often, then decide if it gets merged or not. But we will
probably need a bit more work in there.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


