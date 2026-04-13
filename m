Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6873FE9381F
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 05:59:39 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.265173.1776059977610298529
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Apr 2026 22:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MI9js9ak;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 73C0A4E429EF
	for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 05:59:35 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 305835FFB9;
	Mon, 13 Apr 2026 05:59:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64A6110451B9D;
	Mon, 13 Apr 2026 07:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776059974; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Zz53J+aZ3Hd140hmYOhH6KEjRwHSoUkUTmY4dK5/ryI=;
	b=MI9js9akTm6WsBFUvI3WJUM3dAuIt+K0+DxNC3E85oIkzDQsGwcqX0E90k3sT43G2ynJe2
	xw9J6GqYJ1EdHNL96ZpkKwgFH+XYKGwMwqZcucxwju1LrbSrA8CoP9YjI9WKh3GXF9UgqA
	JVu6OBDIBkRB6x5wcSq7/o4saje4apTlwDiBy90V02tYDKMc6zbbltPOGu/td5jeFfERSD
	YERx98xCawWr1kDe+qh0qMiKHXaHBH7HITpEyIuas1b4UUMCy8mCFn3f7/BhInqh0FBckX
	DW6E6VK6fx0jGyHjlglX/ZB0shNjlGZLVq7YmMFjN2wA9i7pZIpk7zp7iK9gbw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 07:59:33 +0200
Message-Id: <DHRSPRU9F26Y.3K7JE37GXI6UR@bootlin.com>
Subject: Re: [OE-core][PATCH] gtk-doc: upgrade 1.35.1 -> 1.36.0
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <liuyd.fnst@fujitsu.com>, "Ross Burton" <Ross.Burton@arm.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260317093125.10898-1-liuyd.fnst@fujitsu.com>
 <03973F2A-A04B-45F1-832B-150E7CFE813B@arm.com>
 <18A0035F8B72A95E.57592@lists.openembedded.org>
 <TY3PR01MB10028AA9384F9E02304AD9BA29B242@TY3PR01MB10028.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB10028AA9384F9E02304AD9BA29B242@TY3PR01MB10028.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 05:59:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235080

On Mon Apr 13, 2026 at 3:41 AM CEST, Yiding Liu (Fujitsu) via lists.openemb=
edded.org wrote:
> ping

Hi Liu,

Your patch is still under review, but we have a pretty long backlog. It
should be merged or you should have some feedback soon.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


