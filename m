Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33EFCA5FCF
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 17:31:23 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16931.1790875878016949975
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 10:31:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=OIx8pIXl;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A409C4E41E0A;
	Thu,  1 Oct 2026 17:31:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 723376035C;
	Thu,  1 Oct 2026 17:31:15 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7801510328358;
	Thu,  1 Oct 2026 19:31:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790875870; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m4s4HtHC9hLlhJtb2sH0Om3lG+VOdxvijAJ1MF2QgxI=;
	b=OIx8pIXl0IugyaWeSaITQjf3FSGxd3br+7xSemKAaq5kfoqU03c1xNFaviVz+BL7FvKjxo
	mt2dRfgvcZnSEjXVy9pKeeaAcoGPLbSo4bVfiNTIRBLHsxVVFgv659YJytOCKXrp85bbHR
	HnaqXNosiwiP7VXG+1kkHrKiJu35H5env/9r+2dkgCNfOG/qQJsz5dkc3a/HbOjipzh0LW
	o/rA+3l5fXoLGu0/IjCC3t4o+OwXjtHLfNVO+JTSJqasQb1v0a6nXWRJDWR5Z1l/H1YXgH
	561hcznduYSHpJARWZVk4z9yV48HjEoWnsyHl/Jk9xpK7798k5JDFp8d3tlCjA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 Oct 2026 19:31:08 +0200
Message-Id: <DLTOIG3SFIS9.38K7K9E7WCA4H@bootlin.com>
Subject: Re: [OE-core] [AUH] python3: upgrading to 3.14.8 SUCCEEDED
Cc: <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <auh@yoctoproject.org>, "Trevor Gamblin" <tgamblin@baylibre.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <010101a0f6296539-d5cd290b-b68d-4632-a774-5263fa10249e-000000@us-west-2.amazonses.com>
In-Reply-To: <010101a0f6296539-d5cd290b-b68d-4632-a774-5263fa10249e-000000@us-west-2.amazonses.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 17:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247047

On Thu Oct 1, 2026 at 8:31 AM CEST, Auto Upgrade Helper via lists.openembed=
ded.org wrote:
> Hello,
>
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *python3* to *3.14.8*=
 has Succeeded.
>
> Next steps:
>     - apply the patch: git am 0001-python3-upgrade-3.14.7-3.14.8.patch
>     - check the changes to upstream patches and summarize them in the com=
mit message,
>     - compile an image that contains the package
>     - perform some basic sanity tests
>     - amend the patch and sign it off: git commit -s --reset-author --ame=
nd
>     - send it to the appropriate mailing list
>
> Alternatively, if you believe the recipe should not be upgraded at this t=
ime,
> you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> automatic upgrades would no longer be attempted.
>
> Please review the attached files for further information and build/update=
 failures.
> Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_=
bug.cgi?product=3DAutomated%20Update%20Handler
>
> Regards,
> The Upgrade Helper
>

Ptests are failing on this one, when built with musl.

Failed ptests:
{'python3': ['test_append_limited_history', 'python3']}


https://autobuilder.yoctoproject.org/valkyrie/#/builders/109/builds/1308
https://autobuilder.yoctoproject.org/valkyrie/#/builders/110/builds/1297

If anybody wants to have a look. Otherwise I will try to find a bit of
time.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


