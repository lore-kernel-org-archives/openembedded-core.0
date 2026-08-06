Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D316C55ABF
	for <webhook@archiver.kernel.org>; Thu,  6 Aug 2026 08:46:08 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14875.1786005959934563461
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Aug 2026 01:46:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=K/DVYEqA;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9DF8C1A1461;
	Thu,  6 Aug 2026 08:45:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 64FB1602B8;
	Thu,  6 Aug 2026 08:45:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA1B711C35C8D;
	Thu,  6 Aug 2026 10:45:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786005953; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Kqwo4MS3e2y//CWJLnOaLjoiQ5ZpQFxhRMdgYKPgzCo=;
	b=K/DVYEqAGc1M7svs58S+Lg7Suo5qcKXg1rD7fvc2HowEHIrtbx6XEjbBBX2aAbWrjPJQ3z
	jtwy5Yrbep2nkaH1VUmpiu9ecH4Co6nIMRvqBP3Bc1epis4Yte0YaAKRTL0V6K8KA2LuPX
	1EsFhZiaYs8ENAZ3Mf0P7fM15nuU8LgiKlj1D6chq5bOLq2vZCo0G3NnPqlth21Gk9yCzL
	Xts7BcTWncZgNHL173qSs1+F1Wec4R574cLAWkatpEj1evE1oCYRsa1IV0ycf+5u6WSdSB
	wj1Xj8dn6+pzDvyG8ddQ/ffIsZtRC4PTtdV9UCz/PL6uk4g1qUhM3+AFnlh4Fw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 06 Aug 2026 10:45:50 +0200
Message-Id: <DKHQ9QS4ARKV.2IP7MUBX0ANXA@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/3 v7] Oe-selftest for Clang, LLVM, LLD
Cc: <Sundeep.Kokkonda@windriver.com>, <Deepesh.Varatharajan@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260803041741.790019-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260803041741.790019-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Aug 2026 08:46:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242920

On Mon Aug 3, 2026 at 6:17 AM CEST, Deepesh via lists.openembedded.org Vara=
tharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> This patch series introduces a test framework to run selftests for
> target builds of Clang, LLVM, and LLD.
>

Hi Deepesh,

Thanks for the new series.

Can you have a run at these runs? We do have some intermittent failures:

XFAIL: LLVM :: Analysis/DDG/basic-loopnest.ll (343 of 27205)
XFAIL: LLVM :: Analysis/DependenceAnalysis/Invariant.ll (394 of 27205)
XFAIL: LLVM :: Analysis/ScalarEvolution/2008-12-14-StrideAndSigned.ll (756 =
of 27205)
...
198 fails on both builds, I didn't check if they are exactly the same.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/4264
https://autobuilder.yoctoproject.org/valkyrie/#/builders/5/builds/4275

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


