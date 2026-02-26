Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF668FCE084
	for <webhook@archiver.kernel.org>; Thu, 26 Feb 2026 13:45:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.70044.1772113510009508782
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Feb 2026 05:45:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aKtIqLbH;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 76185C40693;
	Thu, 26 Feb 2026 13:45:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 084715FDEB;
	Thu, 26 Feb 2026 13:45:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D56911036938D;
	Thu, 26 Feb 2026 14:45:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772113507; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2VaX0keX7aIo6OWcWJRCeAM2fuuGz7sJA+xEcIB+4qQ=;
	b=aKtIqLbHPmkPid6Uc+BIB99ROMhzKcq2n3xcbHaQufC4Ho2hEE+oOaSaAeeAOKPKoRJg6r
	MnmK65/HYIXorczePoMr05rJ9p3kKhYLgVzRzi9g3dvMXboRxo8sBwlj3PSGyuJU1PbNX5
	gOyHLsvEmYLa/dGOEnBfNzkWt5NYmdVGJ8UYK3Nru39nHy+PtQ1+UHlmvh/780N9wDtCAz
	CyE6qT+IEp0sqAYI6XjHbstJjhfPfR32Ak6e+hCiyx9EAX6QAWPmbCNCpk08kjx+igS/CZ
	VKCFQ9iN4zDQQIiQx1ESjgR4Mq7EUvsiZNStgVWq2xCu+cIs7XDMiRv1Xchm0w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Feb 2026 14:45:05 +0100
Message-Id: <DGOXT5NS9NUS.TSZ25ARI9R03@bootlin.com>
Subject: Re: [OE-core] [PATCH] ruby: upgrade from 3.4.7 to 4.0.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260224015117.3338374-1-changqing.li@windriver.com>
In-Reply-To: <20260224015117.3338374-1-changqing.li@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Feb 2026 13:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232026

On Tue Feb 24, 2026 at 2:51 AM CET, Changqing Li via lists.openembedded.org=
 wrote:
> License-Update: Add license BSL-1.0 and Apache-2.0
>
> COPYING - Add Cross-links between Japanese and English pages
> LEGAL - Update LEGAL for JSON vendored sources
>
> Refer:
> [1] https://github.com/ruby/ruby/commit/e652af18816ffe0b85109b8de0827349b=
f03f16d
> [2] https://github.com/ruby/ruby/commit/d5fbff50c7ff880ae71b8a8ae9aad976c=
69bea73
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---

Hi Changqing,

Thanks for the upgrade.

It looks like we have some reproducibility issue after the upgrade:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/ruby-doc_4.0.1-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/ruby-doc_4.0.1-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/ruby-doc-4.0.1-r0.x86_64_v3.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3457

The diffoscope output can be found here:

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260226-ok6427ba/=
packages/diff-html/

Based on that, it seems the file output is not stable, as it sometimes
add "last=C2=B7modified: xxx" to the file type.

Can you have a look at the possibilities to make the build reproducible
again?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


