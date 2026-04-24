Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067DEFE51F7
	for <webhook@archiver.kernel.org>; Fri, 24 Apr 2026 09:42:14 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17696.1777023725353684735
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Apr 2026 02:42:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=F0APId8w;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4BFAB1A33DD;
	Fri, 24 Apr 2026 09:42:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21D16604EB;
	Fri, 24 Apr 2026 09:42:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E7CE310720769;
	Fri, 24 Apr 2026 11:42:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777023722; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FBtAyi8N7XYrLCZ8saJfQenviVBEG30c9BKcECcck7w=;
	b=F0APId8wAQEPgW0AwsJDTORAH8iFMxCl/CwpYJrkbpIBTh7k1iE0A0dwWd4d7N6ypOmFvU
	3mWC6MHAzVBjC8taoB6Z7XOsTzvBReXYJqLoxEkjyCJJUdxjwzLnBLsD/IEC12Rp+usy0B
	c0uy3fhyNd62G/Hs+1HhWc8szgJQQ8f8NJj9ZXNPMcxt0dg9Bl5ZIWFCvBl/2npsr1QcLq
	1t2cucRyFGkEnI7zpa9wi3HLjXe38/3f4exIDhiuVINChHuhTf6QvmCJ0QMTgyHC/6fYwi
	nYu6RJLhWZtFtapX3DgWwjiek/U+bPXJ0oCRDAkG9T4r5Nb73uRU5z6PQFPt8A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Apr 2026 11:42:01 +0200
Message-Id: <DI1AC3MF2AQ0.LWPBTTD8RAKG@bootlin.com>
Subject: Re: [OE-core][PATCH 2/4] python3-setuptools-scm: upgrade 9.2.2 ->
 10.0.5
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Trevor Gamblin" <tgamblin@baylibre.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260423171246.309711-1-tgamblin@baylibre.com>
 <20260423171246.309711-2-tgamblin@baylibre.com>
In-Reply-To: <20260423171246.309711-2-tgamblin@baylibre.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Apr 2026 09:42:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235852

On Thu Apr 23, 2026 at 7:12 PM CEST, Trevor Gamblin wrote:
> Changelog: https://github.com/pypa/setuptools-scm/releases
>
> Note that the releases page also includes notes for the vcs-versioning
> module, which is published separately (and which setuptools-scm depends
> on). The new python3-vcs-versioning recipe is added to dependency lists.
> Also rework the DEPENDS list to match the same formatting as RDEPENDS.
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---

Hi Trevor,

Thanks for your patch.

It looks like urllib is not happy about this upgrade:

ERROR: nativesdk-python3-urllib3-2.6.3-r0 do_compile: Execution of '/srv/po=
kybuild/yocto-worker/buildtools/build/build/tmp/work/x86_64-nativesdk-pokys=
dk-linux/nativesdk-python3-urllib3/2.6.3/temp/run.do_compile.3697461' faile=
d with exit code 1
...
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/buildtools=
/build/build/tmp/work/x86_64-nativesdk-pokysdk-linux/nativesdk-python3-urll=
ib3/2.6.3/temp/log.do_compile.3697461
Log data follows:
| DEBUG: Executing shell function do_compile
| * Getting build dependencies for wheel...
|
| ERROR Missing dependencies:
| 	setuptools-scm<10,>=3D8
| WARNING: exit code 1 from a shell command.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/43/builds/3697
https://autobuilder.yoctoproject.org/valkyrie/#/builders/25/builds/3671

This seems to be fixed on the master branch, so either an upgrade of
urllib or a backport should fix it.
https://github.com/urllib3/urllib3/blob/main/pyproject.toml#L4

Can you have a look at it?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


