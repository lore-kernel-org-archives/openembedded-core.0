Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03249CCF2DA
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 09:33:20 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30610.1792402391191984921
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 02:33:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=gjr8KpPf;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DCCD24E41284
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 09:33:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A7C2460582;
	Mon, 19 Oct 2026 09:33:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8CD61032865C;
	Mon, 19 Oct 2026 11:33:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792402388; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=QC4SScVwnYra6LrzKHhj96F73nae24rro1jZABr0TbI=;
	b=gjr8KpPfP1tEBitkQ0ZSu5itDtX5c/Ba7LUJ4hpoEUutR4a9fEZQoNVlCQCdNBuJhcqFAh
	bYqsZ+HCZIc+LmpIqaA8rjhOt2IAbGVnlqWLKb9YejAZLkoNNUosRXV/HrzmIuaLvE4hoJ
	0thEmYzpWRKESyi2NjFu/a4p/fC2YneGJaIcG9SY7pEgmfZaidGdWrZE6KhyOQ57CWE+Um
	vDHNKnM41ficDZe8GI/fOOwIVeM2e4eBJAYC8WDS7T1h4p3rOqqZD9ZWZdE/ut0TbKw2yQ
	1UEv/4VJ0N4LfE+HwPeGFXFp+5z8lC4Ee3VbGMb1P+EDyXoQiQByo2wtlDyqpg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Oct 2026 11:33:06 +0200
Message-Id: <DM8PM8R9JB17.AIVWGLEQNLCE@bootlin.com>
Subject: Re: [OE-core][PATCH 4/5] libarchive: upgrade 3.8.9 -> 3.8.10
Cc: "Jaipaul Cheernam" <jaipaul.cheernam@est.tech>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20261018223644.291257-1-ankur.tyagi85@gmail.com>
 <20261018223644.291257-4-ankur.tyagi85@gmail.com>
In-Reply-To: <20261018223644.291257-4-ankur.tyagi85@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 09:33:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248153

On Mon Oct 19, 2026 at 12:36 AM CEST, Ankur Tyagi via lists.openembedded.or=
g wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> Dropped patches are merged in the upstream version.
>
> Changelog:
> https://github.com/libarchive/libarchive/releases/tag/v3.8.10
>
> PTEST pass:root@qemux86-64:~# ptest-runner libarchive
> START: ptest-runner
> 2026-10-18T22:03
> BEGIN: /usr/lib/libarchive/ptest
> ...
> ...
> END: /usr/lib/libarchive/ptest
> 2026-10-18T22:07
> STOP: ptest-runner
> TOTAL: 1 FAIL: 0
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---

Hi Ankur,

Thanks for the upgrade.

Jaipaul already sent an upgrade patch for it, and both your patches do
suffer from the same failed ptests:

Failed ptests:
{'python3-libarchive-c': ['tests/test_entry.py:test_check_archiveentry_usin=
g_python_testtar',
                          'tests/test_entry.py:test_check_archiveentry_with=
_unicode_and_binary_entries_zip2']}

Failed ptests:
{'libarchive': ['libarchive_test']}

https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/4771
https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1404
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1392

Maybe you want to coordinate so only one of you looks at these failures?

Jaipaul thread, for reference: https://lore.kernel.org/openembedded-core/20=
261016092025.19560-1-jaipaul.cheernam@est.tech/

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


