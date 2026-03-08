Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7034EA8531
	for <webhook@archiver.kernel.org>; Sun,  8 Mar 2026 15:55:34 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41521.1772985331916168503
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 08:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DgEWZ9tt;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2FF904E425D4
	for <openembedded-core@lists.openembedded.org>; Sun,  8 Mar 2026 15:55:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E31DD5FF9D;
	Sun,  8 Mar 2026 15:55:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BBBA910369874;
	Sun,  8 Mar 2026 16:55:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772985329; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zOlFOrg1x+KXsjwCoAqL/Ih43P8G87lE7GAOwiqLmI0=;
	b=DgEWZ9tt2lvOwIyO4uoDdwOi8rmgSJD8SX0GKAw6UseHv3qxO7g0+eCSqK1wcQdw0hhwEu
	0HLablZz6S+cNSBISoF5E79g0Usp0DZAGGBkm+j8Yck9pVdSfnNFqRy4+2OzXQdRc6hGc8
	E+cXXz1e1CPJdo2BE2hWP1RzzNpgYmg6FZtxDv+mnfTfCq/R/m/DIViMLXXAyKaQ8yUCG7
	bMZd63+tz0HE1dtbAoXmWcHbcE9cb7qW/gc558SflU1qjAM9xFe9WyWxzSMwNrlgE7KYsC
	3Cl9IJWJGEi9YX08UWnI+bXZsJ3dlN6WOb0PQAkhzaHntxUnL00hTR5IBCnL5g==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Mar 2026 16:55:27 +0100
Message-Id: <DGXIUF7BJW61.19RP6EZ3O8H60@bootlin.com>
Subject: Re: [OE-core][master][PATCH] groff: upgrade 1.23.0 -> 1.24.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <peng.zhang1.cn@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260306092939.1907718-1-peng.zhang1.cn@windriver.com>
In-Reply-To: <20260306092939.1907718-1-peng.zhang1.cn@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 08 Mar 2026 15:55:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232662

On Fri Mar 6, 2026 at 10:29 AM CET, Peng (Paul) (CN) via lists.openembedded=
.org Zhang wrote:
> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>
> Upgrade to latest revision of 1.24.0.
> - Drop patches included in this release.
> - Add patch to fix test-groff not found in cross-compilation.
> - COPYING, LICENSES: Refresh GPLv3 text.
>
> Release Note:[https://lists.gnu.org/r/groff/2026-02/msg00149.html]
>
> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
> ---

Hi,

Thanks for the upgrade.

It looks like the reproducibility is failing on groff:

  File "/srv/pokybuild/yocto-worker/reproducible/build/layers/openembedded-=
core/meta/lib/oeqa/selftest/cases/reproducible.py", line 407, in test_repro=
ducible_builds
    self.fail('\n'.join(fails))
AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/groff-doc_1.24.0-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/groff-doc_1.24.0-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/groff-doc-1.24.0-r0.x86_64_v3.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3541

Diffoscope output can be found here:
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260308-55s2cjsh/=
packages/diff-html/

At first glance, it seems the issue is the doc pdf which is not stable.

Can you have a look at it?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


