Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C9D6107526C
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 07:07:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5464.1773904031134250259
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Mar 2026 00:07:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=D4vntdmR;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 70FB24E42713
	for <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 07:07:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 337225FDEB;
	Thu, 19 Mar 2026 07:07:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6591E104505E6;
	Thu, 19 Mar 2026 08:07:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773904028; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=DcyppjhfhLYQVooj0+t0AU5Q5coHXYtDte7NT3HBLX8=;
	b=D4vntdmRIe0fwFGE8yxmg8fD8+Bda56EzyjsHCLHxXY28VR8Qa3OWgq8RTvzh+eChfJIGd
	wESpwQ0lyea7YY5zxRhzrGT2pynmkW0ADWYjQm+OSM2OGxHzy+3bIWEMNpwxwa5qidVilk
	SHjnk1yg/2mL08dFAF59iR/okhauWvBuz/ttD+95PRuCxBZ09S+QvCxXnWYXFJOoCGjF/Q
	vYaNTa2a3d6vl4YtYLdX71YT2++3bfwdHDSXDO2uZe6jtVZ/MKgpJAgVgZcGHZ1pugkd85
	3JmjRy+dxv30Gcp44ZjrIQaU5aUIIw1/oX0GfhyllDkZEM9xOVrXhNIuejaKog==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Mar 2026 08:07:06 +0100
Message-Id: <DH6KHVSGCDH0.DZ1GQQ228GWT@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Joshua Watt" <jpewhacker@gmail.com>,
 <openembedded-core@lists.openembedded.org>, "Stefano Tondo"
 <stondo@gmail.com>
Subject: Re: [OE-core][PATCH v7 00/12] Add SPDX 3 Recipe Information
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260310184058.533343-1-JPEWhacker@gmail.com>
 <20260318134655.953233-1-JPEWhacker@gmail.com>
 <CAJdd5GZUvWKb37Ys-dNjOShHYb0Gis9wU3Q2WkdA2_m6xoLdhQ@mail.gmail.com>
In-Reply-To: <CAJdd5GZUvWKb37Ys-dNjOShHYb0Gis9wU3Q2WkdA2_m6xoLdhQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Mar 2026 07:07:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233463

On Wed Mar 18, 2026 at 2:49 PM CET, Joshua Watt wrote:
> Mathieu,
>
> Here is my latest SPDX patch set (finally!). I'm sorry for the delay
> and the mix up with Stefano's patches. I believe that you can now
> stack Stefanos patches on top of mine and everything should be OK
>
> Thank you,
> Joshua
>

Thanks!

I did apply this series, but got some conflicts. I did try to solve
them, but I might have solved them wrong.

For reference, the result is here:

https://git.yoctoproject.org/poky-ci-archive/log/?h=3Doecore/autobuilder.yo=
ctoproject.org/valkyrie/a-full-3456

So with this, I've got a few issues. First an error appearing in various
builds:

ERROR: buildtools-tarball-1.0-r0 do_create_spdx: Could not find a static SP=
DX document named static-buildtools-tarball

https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3422
https://autobuilder.yoctoproject.org/valkyrie/#/builders/36/builds/3405
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3422
https://autobuilder.yoctoproject.org/valkyrie/#/builders/2/builds/3422

And still some selftest failures:

2026-03-18 21:56:34,082 - oe-selftest - INFO - runtime_test.TestExport.test=
_testexport_sdk (subunit.RemotedTestCase)
2026-03-18 21:56:34,083 - oe-selftest - INFO -  ... FAIL
...
2026-03-18 22:25:15,422 - oe-selftest - INFO - spdx.SPDX30Check.test_downlo=
ad_location_defensive_handling (subunit.RemotedTestCase)
2026-03-18 22:25:15,422 - oe-selftest - INFO -  ... FAIL
...
2026-03-18 23:06:54,297 - oe-selftest - INFO - spdx.SPDX30Check.test_versio=
n_extraction_patterns (subunit.RemotedTestCase)
2026-03-18 23:06:54,297 - oe-selftest - INFO -  ... FAIL

https://autobuilder.yoctoproject.org/valkyrie/#/builders/35/builds/3462
https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/3568

I will probably launch a build with this series alone a bit later today,
to distinguish what comes from this series and what comes from the
combination.

Thank,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


