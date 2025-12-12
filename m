Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 718E2D59D78
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 16:23:26 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16419.1765556598999121313
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 08:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=oQkQYyvo;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id BDD404E41BB5;
	Fri, 12 Dec 2025 16:23:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F479606DF;
	Fri, 12 Dec 2025 16:23:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F00F4103C8D8E;
	Fri, 12 Dec 2025 17:23:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765556595; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=dDqU5NXvNuUIeVubyVBirur+Tu7CwORZk+XRR8zPY2k=;
	b=oQkQYyvoP9QzTu0Hjf1MigV8NFT3dA/Me3wRCEmFVhkND+++L41RihYDfjGQEfye+P6q5P
	RbbTkNiDnMQh/M29YEFW1mtNtWSwJ2C/LS110GH0vNRWS0pWGMp//yIbCYn/H2FX3iB4MD
	B1fNtVB4jD38b2sZ7SXPLbeHsQFOhGRRSMYtwbhpQ9XuIIvrRLQKXxaniNpRQCHHaI/HIS
	kmBkXqMreTij0HXWNMPAqiozVps2HTCx2b6Vof5xCusVLxTeVn4/T3Y3EEsfW6tCDJiHJI
	Zrw39WM4r2cijB9mhsitc2QAwJ/24r0Quh81Q1GF5MaheJxn2IQ//BfcqksTnA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 12 Dec 2025 17:23:13 +0100
Message-Id: <DEWDKTRBACPB.1RC1N53BUBNER@bootlin.com>
Subject: Re: [review][OE-core][PATCH] procps: fixed large pid issue with top
Cc: <david.nystrom@est.tech>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <amaury.couderc@est.tech>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251212133647.55499-1-amaury.couderc@est.tech>
In-Reply-To: <20251212133647.55499-1-amaury.couderc@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 16:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227608

On Fri Dec 12, 2025 at 2:35 PM CET, amaury.couderc wrote:
> From: Amaury Couderc <amaury.couderc@est.tech>
>
> procps: fixed large pid issue with top
>
> top -b -n1 -H -p 92233720368547758071
> =E2=80=83=E2=80=83signal 11 (SEGV) was caught by top, please
>
> This patch should be backported to the scarthgap branch once it is merged=
.
>
> Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
> ---
>  .../procps/procps/top_large_pid_fix.patch     | 52 +++++++++++++++++++
>  meta/recipes-extended/procps/procps_4.0.4.bb  |  1 +

Hi Amaury,

Thanks for your patch.

It looks like it is not based on master, as procps was updated to 4.0.5
almost a year ago. I will still take your patch for testing, fixing some
minor merge conflict in the process.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


