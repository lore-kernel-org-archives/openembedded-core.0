Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D38BAC5B56A
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 13:17:35 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7864.1786540646505017086
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 06:17:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MlxBhJGL;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 07F471A15BE;
	Wed, 12 Aug 2026 13:17:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8C2D6045E;
	Wed, 12 Aug 2026 13:17:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4B52A11C4CE8D;
	Wed, 12 Aug 2026 15:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786540639; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iBSq7ReNUejxkHH91FEtFxeqwKMvQ6VHVJSt7L07xE0=;
	b=MlxBhJGL36dUfNMwxgYPUDlbdZgsIRwFi1Fd4fZN9f/IlzA4B8KgdCvK99uyzQzp7a3a4X
	61WqZGVjQ2rdNJsYwzTVLcGEfy/33LLRMbaREnQNoJSUi9H/Lvj585gpAJ2/CMpK3dGFK+
	g98mM8I6ElD7PpkdVC9yUiYnLuyF2WPAvqCTvzc7ybFWeV78W+RpiubjTzf0b6PH2zXZq1
	Dyu8UT4bum+MyLPAs+sZdKVfoRb+9SJrEQKhC82lkczx6Su3A02TtD1muDmRg5Lcov3SFK
	KV8Zf7/C8aCVokPbHLj0uflXyCMrsM7VK0zRUoE6EAmCXxmHsycdNnS3F5JvYQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Aug 2026 15:17:17 +0200
Message-Id: <DKMZSUFG7KYF.2SS2HP4BGLL5D@bootlin.com>
Subject: Re: [OE-core][PATCH v2] glib-2.0: skip a timing sensitive
 monotonic-time ptest
Cc: <pratik.farkase@ericsson.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: "Pratik Farkase" <pratik.farkase@est.tech>,
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260805131657.35726-1-pratik.farkase@est.tech>
 <20260812072101.10905-1-pratik.farkase@est.tech>
In-Reply-To: <20260812072101.10905-1-pratik.farkase@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 13:17:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243288

On Wed Aug 12, 2026 at 9:21 AM CEST, Pratik Farkase wrote:
> The /monotonic-time-ns/similar test compares g_get_monotonic_time() and
> g_get_monotonic_time_ns() by spinning until the microsecond clock ticks
> and asserting the two clocks haven't diverged. This is inherently racy
> under QEMU emulation on loaded hosts, as the process can be preempted
> between the clock reads.
>
> [YOCTO #16230]
>
> Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
> ---

Hi Pratik,

Thanks for the v2, but it looks like the v1 was merged, despite the
pending comment from Alex.

Do you mind rebasing on master and sending a fix commit for the
Upstream-Status?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


