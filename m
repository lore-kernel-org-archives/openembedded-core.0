Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9A7CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 12:28:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.28523.1758457698694388664
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Sep 2025 05:28:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=XudDJ6xP;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 641884E40809;
	Sun, 21 Sep 2025 12:28:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2764D60634;
	Sun, 21 Sep 2025 12:28:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AAD38102F16EB;
	Sun, 21 Sep 2025 14:28:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758457696; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=quKDzUhqVyHE9NNhb4XQfKD5ata5ezu6IMxjR+rmaHI=;
	b=XudDJ6xPIvH2e1Pz4BE6S1ccua9tTfaeWR4pPQ54Ltb4SQKnDoWJSD6uZUaAunBnU+SiaJ
	gEDwfboMQcnnxUVFoPX9mIYFiyCrG18AhnfCqbhFJMSN54i8QyN2DIAz9uZKUgkewn8h2h
	MOOgE/79nNv9npHgmQGftyUXZwxbQJLGHZSAWLAnJltHgLkHYHRyyT7Y8bxrsaCeN1NJRN
	iFsp7ncC7t/5VDDeMnuVwcZeSWdzsCvOHnWn4hTVHOvRPWQlCoqiE63Hhbri2IPGQLwDYx
	Eg5FXFNGdLKxWUEpHakQs3QsFVONIYwt4GQWMiFj2tYY3tR0n0+ffhALF9B4xg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 21 Sep 2025 14:28:14 +0200
Message-Id: <DCYH88L0WFBM.21MZNVP7CEWW6@bootlin.com>
Subject: Re: [OE-core] [PATCH] libmd: add ptest for 'libmd'
Cc: <Virendra.Thakur@kpit.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <nmjain23@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250919120527.1517036-1-namanj1@kpit.com>
In-Reply-To: <20250919120527.1517036-1-namanj1@kpit.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 21 Sep 2025 12:28:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223795

On Fri Sep 19, 2025 at 2:05 PM CEST, Naman Jain via lists.openembedded.org =
wrote:
> Adapt the compile 'test' phony target from Makefile and deploy as
> ptest for libmd.
> It takes less than 30seconds for ptest completion
>
> Signed-off-by: Naman Jain <namanj1@kpit.com>
> ---

Hi Naman,

Thanks for your patch.

It looks like we have a QA issue with it:

ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File /usr/lib/libmd/pt=
est/test/sha1 in package lib32-libmd-ptest contains reference to TMPDIR [bu=
ildpaths]
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File /usr/lib/libmd/pt=
est/test/rmd160 in package lib32-libmd-ptest contains reference to TMPDIR [=
buildpaths]
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File /usr/lib/libmd/pt=
est/test/md5 in package lib32-libmd-ptest contains reference to TMPDIR [bui=
ldpaths]
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File /usr/lib/libmd/pt=
est/test/md4 in package lib32-libmd-ptest contains reference to TMPDIR [bui=
ldpaths]
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File /usr/lib/libmd/pt=
est/test/md2 in package lib32-libmd-ptest contains reference to TMPDIR [bui=
ldpaths]
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: File /usr/lib/libmd/pt=
est/test/sha2 in package lib32-libmd-ptest contains reference to TMPDIR [bu=
ildpaths]
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: QA Issue: /usr/lib/libmd/ptest/t=
est/sha2 contained in package lib32-libmd-ptest requires /bin/bash, but no =
providers found in RDEPENDS:lib32-libmd-ptest? [file-rdeps]
ERROR: lib32-libmd-1.1.0-r0 do_package_qa: Fatal QA errors were found, fail=
ing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/qemux86-wo=
rld/build/build/tmp/work/x86-pokymllib32-linux/lib32-libmd/1.1.0/temp/log.d=
o_package_qa.1674361
NOTE: recipe lib32-libmd-1.1.0-r0: task do_package_qa: Failed

https://autobuilder.yoctoproject.org/valkyrie/#/builders/59/builds/2419

Can you fix it, please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


