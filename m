Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C11C61DE7
	for <webhook@archiver.kernel.org>; Sat, 21 Feb 2026 12:17:46 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18779.1771676265544389371
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Feb 2026 04:17:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MpwdaYFe;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 06D454E40AC8
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 12:17:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B536D5FB54;
	Sat, 21 Feb 2026 12:17:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7E20910368D4B;
	Sat, 21 Feb 2026 13:17:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771676263; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZXMsW/m1O1tgKoAn/580F0SIpGA96IJNgjxpyIX29jc=;
	b=MpwdaYFesG1unpfn+PqFh6+GNXihtslFYPV9vhUBq3geRFvjlhqqdG/AkfT+zpiWf60cRO
	7gaxEGePF+3xNsrpmJXv0BhwhVXe/CdwFhrMHC+wvK5QddgWzejJ8tuh9qXh/EKJvkQjRf
	fV10hmecGvoO9woAggDGpGwpqTr3GX7WKXRO2xDBQebcyz50cLm+NWWYTtyufdgxFZ9RGs
	MqfZgQq3V0A7lhlSCWYNGg5zMqxF4eTB8WmSvbOtXAPUBZkUyb3cJNV5D87UEJu2KSvc6o
	JANiYKebyyEJHFEosUkCDhGB6pXxSR3O4dTNKkr0uZJTldzDhSErHxLAikyvBw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Feb 2026 13:17:41 +0100
Message-Id: <DGKMTIQVT97I.10NPWRO24MLGR@bootlin.com>
Subject: Re: [OE-core][PATCH v3 2/2] mdadm: catch sed substitution failure
 during install
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ankur.tyagi85@gmail.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260218090606.3693584-1-ankur.tyagi85@gmail.com>
 <20260218090606.3693584-2-ankur.tyagi85@gmail.com>
In-Reply-To: <20260218090606.3693584-2-ankur.tyagi85@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Feb 2026 12:17:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231617

On Wed Feb 18, 2026 at 10:06 AM CET, Ankur Tyagi via lists.openembedded.org=
 wrote:
> From: Ankur Tyagi <ankur.tyagi85@gmail.com>
>
> This patch is to validate a possible race condition theory during install=
.
> Also fail the build if sed substitution still fails for further investiga=
tion.
>
> Details: https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16166
>
> [YOCTO #16166]
>
> Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> ---

Hi Ankur,

Just a quick update on this: I continue to run it on the autobuilder,
but I'm at about 15 runs without any issue.

I will keep you in touch if the reproducibility issue appears again.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


