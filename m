Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CAA3D2ED0F
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 08:08:53 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2048.1768896530927049241
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 00:08:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wWGBykbT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F22E01A294B;
	Tue, 20 Jan 2026 08:08:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8AFD606AB;
	Tue, 20 Jan 2026 08:08:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5D2B510B6B267;
	Tue, 20 Jan 2026 09:08:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768896528; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=BW1INPJrqczK5mpVuaNEjljSdaGqTXyuZ7qAoK0yxC4=;
	b=wWGBykbTOVQ3IIv1RKSK6lH5xBvgprHnr+woF4gX5noPbfIZofZOtFDDaA/1O001EHIQma
	nDrUvd+iHw9BCjlrRESiFvCW6JoJDoudCSpBl+EcbOR4oUwTsbjLn28NInNncAfoSA6h45
	wRMsDHtvi2ZO4bLsATFfKR8MpvUKIsK6EL0HxrPMyS0RSQ69izeueJSRV84JQ01Dt5SHrK
	40Wrj2ypznM5GVyx3IepyJVQvgKNPPcx5lVywQ/PdAmn25/GenZfsddxyNra8wTt7EydOV
	WqKnuDInERZLwGOJg9wjMnEY0is8AdeldRE8RXnWypIrcf54qPz9hqFayM9R9Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Jan 2026 09:08:46 +0100
Message-Id: <DFT9HHZDO6T2.NPBC2K7V0JBC@bootlin.com>
Subject: Re: [OE-core] [PATCH 0/1] lighttpd: fix trailing '/' on files in
 dirlisting
Cc: "Fred Bacon" <bacon@aerodyne.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <fred.w.bacon@gmail.com>, <openembedded-core@lists.openembedded.org>
References: <20260119203509.3960946-1-fred.w.bacon@gmail.com>
In-Reply-To: <20260119203509.3960946-1-fred.w.bacon@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 08:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229650

Hi,

On Mon Jan 19, 2026 at 9:35 PM CET, Fred Bacon via lists.openembedded.org w=
rote:
> From: Fred Bacon <bacon@aerodyne.com>
>
> Backporting an upstream bug fix for lighttpd's mod_dirlisting.=20
>
> Fred Bacon (1):
>   lighttpd: Fix trailing slash on files in mod_dirlisting
>
>  .../lighttpd/0001-mod_dirlisting.patch        | 48 +++++++++++++++++++
>  .../lighttpd/lighttpd_1.4.74.bb               |  1 +
>  2 files changed, 49 insertions(+)
>  create mode 100644 meta/recipes-extended/lighttpd/lighttpd/0001-mod_dirl=
isting.patch

Current version of lighttpd on master is 1.4.82, so this does not apply. Di=
d you
send this for a specific branch of openembedded-core? If so, you need to in=
clude
the branch name in the patch subject, as explained here:
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#submitt=
ing-changes-to-stable-release-branches

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


