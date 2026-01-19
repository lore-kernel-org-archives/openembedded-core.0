Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B682ACCF2CF
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 09:05:59 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31923.1768813554085019860
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jan 2026 01:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=SGtERhy4;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 958861A2945
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 09:05:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A81A60731;
	Mon, 19 Jan 2026 09:05:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 88C9310B69837;
	Mon, 19 Jan 2026 10:05:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768813552; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8TdIo8oW+aqKA2XLwJzMS9D+BtbKdNcwIdRVIVOqqeE=;
	b=SGtERhy4e/QWdHr4aMQf5bls0GvurUiwvgtLSC7tB5DcTlIBAScGWujqvuwPPbln+1YFL4
	aS9zJBSrRl63A8EO/+3kowDbepk2E58pwxlxlFPW9oA4UREByGINsDHqcwzgkABcugioZf
	fxo96Ul/TXlk3oNt+l1RBr+6zOLeW9t+zWQZLtPT7moc1I98LYxfH+TX6TR/BVVioqHEL+
	Nl7wc7fEZE+uucSuhipsGPvcPjQuBzrlvEdS38t3QlIYMCjZ44q4HvABQcqdvxtBQarIfs
	Dy5umdqgo/gOmTmzwJ3MOYOT+6FwQ5oceaBzgp/9OHQ+NsmZo19MGDREVSS6Vw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 10:05:50 +0100
Message-Id: <DFSG2N779PI3.3DYP47ZXHVXAZ@bootlin.com>
Subject: Re: [OE-core] [PATCH] uki.bbclass: fix building of UKI images with
 multiple initramfs fstypes
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <dmitry.baryshkov@oss.qualcomm.com>,
 <openembedded-core@lists.openembedded.org>
References: <20260107042345.2264330-1-dmitry.baryshkov@oss.qualcomm.com>
 <qatgc5yvubfyokn5iav6ftmwwx25j7bbn422u64g5v5xdu7pjr@nisbj4cwtbxt>
In-Reply-To: <qatgc5yvubfyokn5iav6ftmwwx25j7bbn422u64g5v5xdu7pjr@nisbj4cwtbxt>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Jan 2026 09:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229601

Hi,

On Mon Jan 19, 2026 at 7:46 AM CET, Dmitry Baryshkov via lists.openembedded=
.org wrote:
> On Wed, Jan 07, 2026 at 06:23:45AM +0200, Dmitry Baryshkov wrote:
>> If INITRAMFS_FSTYPES contains more than one entry, ukify build command
>> will fail as INITRD_ARCHIVE will contain extra strings. Use only the
>> first initramfs type, letting the user to specify other fstypes.
>>=20
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> ---
>>  meta/classes-recipe/uki.bbclass | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>
> And gracious ping. This was sent almost two weeks ago with no feedback
> to it up to now.

This has passed testing, but due do intermittent issues on our test
infrastructure merging patches has slowed down. Reviews should be on their =
way
soon hopefully.

See https://wiki.yoctoproject.org/wiki/Weekly_Status.

Regards,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


