Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7ECCAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 11:15:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.51121.1759144505027820803
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Sep 2025 04:15:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ndvJ5tsx;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 058024E40E02;
	Mon, 29 Sep 2025 11:15:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B8FF6606AE;
	Mon, 29 Sep 2025 11:15:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42156102F1864;
	Mon, 29 Sep 2025 13:15:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1759144502; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=F4qCzOxCIkBtID850N7P4881JrLAMxlG345SAFaYKOI=;
	b=ndvJ5tsxbbic3KzJpAo1hyL12ubYC/2JQgZiTxha5Db4IuySSiw7/stEb2JHX0ONEc4996
	xPbaRipa4+bCCf+y/XCpmc42jwt0huy66SGNjbr4MPuvgJVekZjL0/t/Q4+hUZ2DIQ6dAb
	p1fm61+szP79zwMkaLMF2oLZLCaNlb3H+wa8zq+avuIVccKhYEk+CPWNDGLXWpxn78DNPb
	/97DVkw26JPRe5p/C+wSmhEEnHd1HMYclHMM5VRJVyVIfiTCElJC6IUdZeKV+O4/BujA6v
	xz78ar4pqEF8JEBzVaxL3Fv78cN/NAsVOzeTuh0S6dObq+a4LlWtmH29A/h+Sg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 Sep 2025 13:14:58 +0200
Message-Id: <DD58OIBLT47Z.3P8U5S8JBWJGF@bootlin.com>
Subject: Re: [OE-core] [PATCH] gn: Add recipe
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <raj.khem@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250927054916.363249-1-raj.khem@gmail.com>
In-Reply-To: <20250927054916.363249-1-raj.khem@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Sep 2025 11:15:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224138

On Sat Sep 27, 2025 at 7:49 AM CEST, Khem Raj via lists.openembedded.org wr=
ote:
> gn is a commonly used build tool to generate ninja files, used
> in a lot of recipes e.g. chromium, qtwebengine, perfetto, hafnium etc.
> these recipes come from different layers e.g. meta-qt6/meta-arm/meta-oe
>
> since not all layers depend on meta-oe ( meta-arm does not ), its not
> a possible option.
>
> Given the usecases, putting it in core will benefit the ecosystem
> and reduce some duplication. This recipe is taken from meta-arm
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

Hi Khem,

It looks like the build is failing on some x86 builds:

ERROR: gn-0+git-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/mu=
sl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/gn/0+git/temp/=
run.do_compile.3308486' failed with exit code 1
...
| cc1plus: error: '-Wformat-security' ignored without '-Wformat' [-Werror=
=3Dformat-security]

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2524
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2489
https://autobuilder.yoctoproject.org/valkyrie/#/builders/17/builds/2307
https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2467

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


