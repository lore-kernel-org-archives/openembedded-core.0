Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76369CCF2C7
	for <webhook@archiver.kernel.org>; Sat, 17 Oct 2026 10:21:41 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3793.1792232498320719231
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2026 03:21:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NTFjXrsb;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EA3391A125F
	for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 10:21:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA3B06038B;
	Sat, 17 Oct 2026 10:21:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37026103281F4;
	Sat, 17 Oct 2026 12:21:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792232495; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ko5Mi31wT0TSoK/d+KTxQKzfy0+q4pI9evu0cf8GWjU=;
	b=NTFjXrsb7c/mSB5xVjY+GDdcKJ2vrrJBtXPvAtSn0Y7PIQA22xHF/yCc8FSJF3080OwsZV
	FUOFgoQKtHpukp/LkWHyLWOvkqogREPTCl87XXyiMXD4stD3M/+LfiG5JvrMFTz92ejQhd
	Z6bZlC+/4NbsBmEHHhJ/gUNroUHu4gYFD/Yw9q1is7BXOfDc6dRUhA6WP0DnThy3keYLlJ
	alKr8BgiNIHWqeRyTzM6hfFvVeRtMrlzPBgerrLvce4yI5imInE3Z+NvEWjol7Z+eEEAxq
	wt0/auQ3ohZYfgBN+SswXup5iGgVSWA6f6d/2Gg0Ir13hKpVQV/NBLWHqnbVLA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Oct 2026 12:21:33 +0200
Message-Id: <DM71E96XACV3.1G7FKNQ1ALZ7O@bootlin.com>
Subject: Re: [OE-core] [PATCH 1/2] libarchive: upgrade 3.8.9 -> 3.8.10
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261016092025.19560-1-jaipaul.cheernam@est.tech>
In-Reply-To: <20261016092025.19560-1-jaipaul.cheernam@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2026 10:21:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248076

On Fri Oct 16, 2026 at 11:20 AM CEST, Jaipaul Cheernam wrote:
> Release: https://github.com/libarchive/libarchive/releases/tag/v3.8.10
> ChangeLog: https://github.com/libarchive/libarchive/compare/v3.8.9...v3.8=
.10
>
> - Drop patches which are part of release now
>   - 0001-append_filter-Use-last-bidder-for-filter.patch
>   - 0001-append_filter-Verify-that-bidder-and-filter-match.patch
>   - 0001-test-skip-ppmd8-aes256-streaming-test-when-no-crypto.patch
>   - 0003-Remove-bidder-name.patch
> - Refresh existing patches
>
> Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
> ---

Hi Jaipaul,

Thanks for the upgrade, but we have some failed ptests:

Failed ptests:
{'libarchive': ['libarchive_test']}

But also:

Failed ptests:
{'python3-libarchive-c': ['tests/test_entry.py:test_check_archiveentry_usin=
g_python_testtar',
                          'tests/test_entry.py:test_check_archiveentry_with=
_unicode_and_binary_entries_zip2']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4763
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1396
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1385

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


