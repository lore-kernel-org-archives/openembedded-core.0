Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9348ECFD658
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 15:39:26 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8732.1767800362726304060
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 07:39:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=I8Fnaa+p;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8F05C4E41FDC;
	Wed,  7 Jan 2026 15:39:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6524E606F8;
	Wed,  7 Jan 2026 15:39:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0B69D103C873D;
	Wed,  7 Jan 2026 16:39:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767800360; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=qurYxAIhcp5+vXFeQgw3Wjs/pp46EslfoDML0nDvHng=;
	b=I8Fnaa+pDGHWY764BvStH0bHvqpnJu7f5vsvL9WUp23e1iwKem0SrXVNgGmUpD3JY2nf5D
	qjhaCa5PpD37FM9OjWs2Wh1kJ9i7z4v5R0yKxKn1IKbtoBeO/bo+ul/rOxY9DJZIKk5PbX
	vws/59IYPG/l4tCRGTXsP9x23gaHmVXt9xOTaITTwGEAF3KkWSY2V+KXW409lAVrNL1hcT
	qKxZG+RJP5diSaSvCop+NtbB902U4dEkDSf4/wvS93w3lqrSo8bPDAQz87P0LMn9dBmKgf
	OE37X0XjcmeX0QcgTMzEOZbiK3Gr+qSJayizhF0ecrPkhiQtxVYOw68ikqhBHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Jan 2026 16:39:18 +0100
Message-Id: <DFIGXD39C6LT.I7I5Q38VIX6H@bootlin.com>
Subject: Re: [OE-core][PATCH v2] libcheck: add ptest support
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251114014145.23826-1-pratik.farkase@est.tech>
 <20260107091537.18096-1-pratik.farkase@est.tech>
In-Reply-To: <20260107091537.18096-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 15:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229012

On Wed Jan 7, 2026 at 10:15 AM CET, Pratik Farkase wrote:
> Add package test (ptest) support to libcheck recipe to enable
> running the test suite on target devices.
>
> The implementation installs:
> - Test binaries (check_check, check_check_export)
> - Test helper binaries and scripts
> - Shell script tests that validate various output formats
> - Test configuration files
>
> All 9 upstream tests pass successfully:
> START: ptest-runner
> BEGIN: /usr/lib/libcheck/ptest
> PASS: check_check_export
> PASS: check_check
> PASS: test_output.sh
> PASS: test_check_nofork.sh
> PASS: test_check_nofork_teardown.sh
> PASS: test_xml_output.sh
> PASS: test_log_output.sh
> PASS: test_set_max_msg_size.sh
> PASS: test_tap_output.sh
> END: /usr/lib/libcheck/ptest
> STOP: ptest-runner
>
> Note: The test_vars SRCDIR path is set to /usr/src/debug/libcheck/0.15.2/=
tests
> to match the debug source paths embedded in compiled binaries.
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
>
> ---

Hi Pratik,

Is that a new version? How does it differ from the version already
merged?

https://git.openembedded.org/openembedded-core/commit/?id=3D1bb06e23c1c8782=
9e5c4211e34229305c7d5f851

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


