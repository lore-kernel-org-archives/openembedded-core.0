Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98783C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 07:14:34 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7230.1784186064613542596
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 00:14:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zmtg8ik+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 582291A0F30;
	Thu, 16 Jul 2026 07:14:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2401C602B8;
	Thu, 16 Jul 2026 07:14:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8140411BD1CD7;
	Thu, 16 Jul 2026 09:14:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784186061; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=CwIDDIFYkW/cFKk+QxZk0muWuCZmdukaVai9ka9awmU=;
	b=zmtg8ik+jX8voL25vdq+sZO86duv//F0gYt+yzp1Nj3Jt14eX3CvvH6HNEo0oww9h4yNfS
	GYbOczm1ELJ1aDMRccQZeFCEeRv2GITsW4zVaQA6n4qfInt+4N/YRfigtk+276Bn4A6tRv
	/R1cqykof4Ktn92kQibzJFFGhwgomaQ/PYm6CS6/CcYQ1DzB9cvf5Eelmdd5ghjYM8TfWV
	EAk7La4Ibu/c5Ty5HsUE0lIAcTiFsO/kAe08XlDuUK1qliP7ndr19MQ9hNJ4HFB0uRn7lL
	gvDy1F87cQzAM5a4H4vXkXg4D6Ttc1XVVVB+ofsremkIoGjB69IiPZ0Bcy0ahQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 09:14:17 +0200
Message-Id: <DJZT67DMVUOV.3CPQL3DTBS745@bootlin.com>
To: <deepesh.varatharajan@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 0/3 v6] Oe-selftest for Clang, LLVM, LLD
Cc: <Sundeep.Kokkonda@windriver.com>, <Deepesh.Varatharajan@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260715060021.579656-1-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20260715060021.579656-1-Deepesh.Varatharajan@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 07:14:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241063

On Wed Jul 15, 2026 at 8:00 AM CEST, Deepesh via lists.openembedded.org Var=
atharajan wrote:
> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>
> This patch series introduces a test framework to run selftests for
> target builds of Clang, LLVM, and LLD.
>

Hi Deepesh,

Thanks for your patch.

It looks like it does introduce reproducibility issues:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/rust-dbg_1.97.0-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/rust_1.97.0-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/rust-dbg_1.97.0-r0_x86-64-v3.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/rust_1.97.0-r0_x86-64-v3.ipk

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4386
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260715-161pbdip/=
packages/diff-html/

I did not really identified where the difference come from. Can you have
a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


