Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A82ECAC582
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 06:11:13 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.9496.1757657466990921982
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 23:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YIjVf+9k;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1DD6E4E40C36;
	Fri, 12 Sep 2025 06:11:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E793C60638;
	Fri, 12 Sep 2025 06:11:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 275E0102F2883;
	Fri, 12 Sep 2025 08:10:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757657464; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5Ji/SdNu4r2bCy0J9I5OsI1GSTy4DeFf3ZVIwaOARlk=;
	b=YIjVf+9k2VgB1pGJ0RQEqNEDgYi9d0WzLyn0+4B7s6LXvJlx5BcAUEwiPdMPkEeTOWByYH
	nxih9pq5m7QwUdM2iA5jxpFFio1fybdcJh8LURggwdv2a8vItPzD1vCn+qxkmIO6F2Y5I1
	HDFrP6HjcELZRdkA7sJcM5KH/n+zsFkJ+eaIqqY3d9/fpDW4vC7kvFZbSLMtw+7vNbn30b
	tFHiCY2Ijzt0WgOE2K/vgbnNjrS53kv8dPH6HPq6jc6ZrgEkSIapFPKHDz4MK+ryE7sndz
	wSlv32HUOyoPG0qXp4q31L36jVB6BrA50mUYK0mO9tTbOkg2UDVwkNOgDRZVIA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Sep 2025 08:10:54 +0200
Message-Id: <DCQLKFDJKMYF.1R7OO62UHIKFX@bootlin.com>
To: <patchtest@automation.yoctoproject.org>, <rs@ti.com>
Subject: Re: Patchtest results for [oe-core][PATCHv7 2/6] go: fix sigaction
 usage on i386 platforms
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250910212855.2480561-3-rs@ti.com>
 <010101993599e96f-c5965afc-45bb-4c4c-b4d5-a9072245169d-000000@us-west-2.amazonses.com>
In-Reply-To: <010101993599e96f-c5965afc-45bb-4c4c-b4d5-a9072245169d-000000@us-west-2.amazonses.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 06:11:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223304

On Wed Sep 10, 2025 at 11:48 PM CEST, Patchtest via lists.openembedded.org =
wrote:
> Thank you for your submission. Patchtest identified one
> or more issues with the patch. Please see the log below for
> more information:
>
> ---
> Testing patch /home/patchtest/share/mboxes/PATCHv7-2-6-go-fix-sigaction-u=
sage-on-i386-platforms.patch
>
> FAIL: test Signed-off-by presence: A patch file has been added without a =
Signed-off-by tag: '0001-runtime-when-using-cgo-on-386-call-C-sigaction-fun=
ct.patch' (test_patch.TestPatch.test_signed_off_by_presence)
>

Hi Randolph,

Have you seen the above message? I believe this is indeed an issue with
this patch, so I haven't took your series so far. Any thought?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


