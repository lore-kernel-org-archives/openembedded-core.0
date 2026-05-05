Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24FEFCD342F
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 07:54:10 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.34213.1777967646843570162
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 00:54:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=1PrQV7h6;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A4FBA1A3517;
	Tue,  5 May 2026 07:54:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 791AE5FD9D;
	Tue,  5 May 2026 07:54:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7A0FE11AD3195;
	Tue,  5 May 2026 09:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777967643; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QRP2DDmADF/G2zBLwMiiTp6+mPTMC1dlr45MYQTVemg=;
	b=1PrQV7h65Gd2HMiazuBYM52yhgrnFkCIHGGqhhkEPHAeAtWMFCixiO2zt1QmMPoGficBdl
	VP2xkBXrnVVLtnpR5Ngxcraa0FVdsYznjUH/FbGmn6B78H02wt66g/S4UeKlFEzVXRdkHW
	wbGgrNjzNHcgNaY0u5wpE8z2dUVdezYBs7PpMrlXeFvg0rh6c55cQ1Urqdfa4GEjpS5+eO
	xHQU2qZlwuTBJ2v4xQJSG15So0gCrXne6slRNKTeRHKkxV9MJTHYdLboAWa34DXKERTzv9
	SMVLLeHJjvDLs2zRUAk2JrRDhn7MXNj//v6uPSEs4MxmJIFmeDMgN9DwfGX2EQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 May 2026 09:54:00 +0200
Message-Id: <DIAKXED37M90.4QX504G4C9DW@bootlin.com>
Subject: Re: [PATCH v4] rsync: add ptest support
Cc: "Yi Zhao" <yi.zhao@windriver.com>, "Ross Burton" <ross.burton@arm.com>,
 "Richard Purdie" <richard.purdie@linuxfoundation.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jhonata Poma-Hansen" <jhonata.poma@gmail.com>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260429-b4-yocto-16211-v4-v4-1-211f27c4daea@gmail.com>
In-Reply-To: <20260429-b4-yocto-16211-v4-v4-1-211f27c4daea@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 07:54:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236465

On Wed Apr 29, 2026 at 4:26 PM CEST, Jhonata Poma-Hansen wrote:
> Wire up upstream's runtests.sh testsuite as a ptest package. The
> testsuite runs rsync itself through 43 .test scenarios covering
> ACLs, xattrs, device nodes, hardlinks, symlinks, daemon mode,
> filters, backup, batch, etc., plus 3 CHECK_SYMLINKS variants
> (chown-fake, devices-fake, xattrs-hlink).

Hi Jhonata,

Thanks for the new version.

It works correctly with the current version of rsync, but we still have
a small issue, sorry.

It looks like with the version 3.4.2, the runtests.sh file was removed
and a runtests.py one was introduced. We already have a patch on the
mailing list upgrading the rsync recipe [1]. Can you rebase on it and
make sure to use the new test script?

[1]: https://lists.openembedded.org/g/openembedded-core/message/236364

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


