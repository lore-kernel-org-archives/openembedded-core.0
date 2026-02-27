Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAFCFEFB50
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 13:40:02 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.96025.1772199598054255697
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Feb 2026 05:39:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=C5sQHE47;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1E0E01A1AFD
	for <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 13:39:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E90195FE46;
	Fri, 27 Feb 2026 13:39:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 786CF10369412;
	Fri, 27 Feb 2026 14:39:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772199595; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZNCByGdfImr/JjZCTGJ1yd8eJqShG48UbpCixr8NR8Y=;
	b=C5sQHE47NGemGoXKoVeM5u7XKnR3nRlczywTBfSdprAyqA8w4uI5i7nRIL71dcvwaaz+nX
	8EpYaP2busxzcXGjr1tyQHaZV5Xw9TyysK31XBeL2gRR6l+wkFoiyV3U7eRkRhjGlYjNQE
	mPl10Vflqi1s+RepdjFBsUl8Zswyx6hmR5CwBZsnFQ9eVaSMnNgAT+xDBSZgv8+7HwRb4w
	shOp5QyfvM0UV2FjBtoknslAeg6CLwfC13Pxa4uuisXRuxVZ5rRktp4BQSxehqtDcBWzYX
	YAGNdQfQBw50sh2mH1Q8VgFVZTDMQ16WhUOlGJsX1EiLdxU+lVf37v1Yso5U6A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Feb 2026 14:39:53 +0100
Message-Id: <DGPSBPSI3YPW.2ZPUXHEVQ16P6@bootlin.com>
Subject: Re: [OE-core] [PATCH V2] ruby: upgrade from 3.4.7 to 4.0.1
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <changqing.li@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <DGOXT5NS9NUS.TSZ25ARI9R03@bootlin.com>
 <20260227100707.2369309-1-changqing.li@windriver.com>
In-Reply-To: <20260227100707.2369309-1-changqing.li@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Feb 2026 13:40:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232099

On Fri Feb 27, 2026 at 11:07 AM CET, Changqing Li via lists.openembedded.or=
g wrote:
> License-Update: Add license BSL-1.0 and Apache-2.0
>
> COPYING - Add Cross-links between Japanese and English pages
> LEGAL - Update LEGAL for JSON vendored sources
>
> * Patch 0001-Don-t-save-the-original-name-and-timestamp.patch is added
> for fixing possible reproducible issue. Package ruby-doc is not
> reproducible, sometimes, "last modified: xxx" is added to the file type.
> autobuilder reproduces this, but I can not reproduce this locally. Just
> pass '-n' option to workaround it.
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

Sorry, the v1 was merged in the mean time. Your v2 still looks good, and
I will take it into my branch for testing, but do you mind rebasing on
top of master and changing the commit subject accordingly?

Thanks,
Mathieu


--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


