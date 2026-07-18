Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E075C4450A
	for <webhook@archiver.kernel.org>; Sat, 18 Jul 2026 04:58:33 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.731.1784350704256222714
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Jul 2026 21:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=tQ8xWYLD;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DD7EC1A1086;
	Sat, 18 Jul 2026 04:58:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2D1D60362;
	Sat, 18 Jul 2026 04:58:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AF68511BD0673;
	Sat, 18 Jul 2026 06:58:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784350700; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=IpLAXyt5mviC4A9MzKZyxMJ7SXTN5+cpszFKAhhKBw8=;
	b=tQ8xWYLDV0x9VE7zbTC8HvSRcxND53yIEIR8R+nVkZhfaa9N8UdY9tj+7NfzdBOnKyxLIm
	XvdASBnPYUjd9920AFgy9P576WpElAVLeO3h/7HgLF8CUfcBTj2Mh0gLJuafLppcwsawNv
	foJJ7uN4NF6xolZoMSV90iMDYlbHWXCOde5jY8OHA6pGwzxaRpEjdhF51z+KBYrIlIHewY
	ZolEFWntOo2XV2NRZ/mUCRZ96gTtxGg9qF1MIiiZyFkOK2lOp4F8qM8/sS8MZ9bK/eHRP7
	XfXulH9Oaj6NCWBG6UtFpAi0xn6B0d3rcwbu7WkYqsq1MPqfqbLnazxKJAQHVA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Jul 2026 06:58:17 +0200
Message-Id: <DK1FJ604RQLX.1IRYGTCQNJZOK@bootlin.com>
Subject: Re: [OE-core] [PATCH] rust: Upgrade 1.96.0 -> 1.96.1
Cc: <Randy.MacLeod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <sundeep.kokkonda@windriver.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260705152012.3160479-1-sundeep.kokkonda@windriver.com>
In-Reply-To: <20260705152012.3160479-1-sundeep.kokkonda@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 18 Jul 2026 04:58:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241228

On Sun Jul 5, 2026 at 5:20 PM CEST, Sundeep KOKKONDA via lists.openembedded=
.org wrote:
> From: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
>
> https://blog.rust-lang.org/2026/06/30/Rust-1.96.1/
>
> Rust 1.96.1 fixes:
> - Missing retries / timeouts in Cargo's HTTP client
> - Miscompilation in a MIR optimization
> - Cargo CVEs:: CVE-2025-15661, CVE-2026-55199, CVE-2026-55200
>
> Test results:
> No changes
>
> Assisted-by: Kiro
> Signed-off-by: Sundeep KOKKONDA <sundeep.kokkonda@windriver.com>
> ---

Hi Sundeep,

This was a bit expected, we still have the reproducibility issue:

AssertionError: The following deb packages are different and not in exclusi=
on list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/rust-dbg_1.97.1-r0_amd64.deb
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/deb/./x86-64-v3/rust_1.97.1-r0_amd64.deb
The following ipk packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/rust-dbg_1.97.1-r0_x86-64-v3.ipk
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/ipk/./x86-64-v3/rust_1.97.1-r0_x86-64-v3.ipk
The following rpm packages are different and not in exclusion list:
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/rust-1.97.1-r0.x86_64_v3.rpm
/srv/pokybuild/yocto-worker/reproducible/build/build-st/reproducibleB-exten=
ded/tmp/deploy/rpm/./x86_64_v3/rust-dbg-1.97.1-r0.x86_64_v3.rpm

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/4417
https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260717-4vji97l6/=
packages/diff-html/

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


