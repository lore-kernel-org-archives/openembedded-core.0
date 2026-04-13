Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3522F34C51
	for <webhook@archiver.kernel.org>; Mon, 13 Apr 2026 12:48:20 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.271540.1776084496869357319
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 05:48:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zgAswZHM;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C7B911A31E4;
	Mon, 13 Apr 2026 12:48:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9DB7F5FFB9;
	Mon, 13 Apr 2026 12:48:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3540310450269;
	Mon, 13 Apr 2026 14:48:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776084494; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=6h7buvsqLjEJi5iLSctXU4gBpIGROr/JdNu4F7aF2rY=;
	b=zgAswZHM7fOG07AoEksOSdFHHmQabCXLKIqHsCI58Q9aBZA6oysCKakKJHSAWKp72XEc0m
	2pBXbThVuNdGra4YRB/iFn/4GUb96/Cx9BwLFDZgw1kov5aahyxQCRy1IQNhUdcXE0iqqJ
	wk0TTRRhIBoHPrnpeWZlpelJkMSczg2FrevKJUyfHvNNxrFxZ3K5WZIaIKWCd/zDQddWfF
	JIzj+vVgYKGN5JZaO6MiZB2ZWe3+bhabZqpGCQ2zjZnww+UD0aFwVf9vDnQSGgsVhU46sS
	FshZHtjvfW3yiSPDovf0m7FjlFEiStdVRJvFt3aeuVuBwlbzRQAUPuli4In1yw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Apr 2026 14:48:12 +0200
Message-Id: <DHS1ENYNBP32.2GGMMZOU89SU@bootlin.com>
Subject: Re: [PATCH] [OE-core] [PATCH v2] lttng-tools: upgrade 2.14.1 ->
 2.15.0
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <wangmy@fujitsu.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260409014036.1519-1-wangmy@fujitsu.com>
 <DHOMP5U25UXL.ZH8NFSNZYYVM@bootlin.com>
 <TYYPR01MB1341978CA068B1BAC26E48065DC592@TYYPR01MB13419.jpnprd01.prod.outlook.com> <DHRA8X87GXTM.1KH04ZIZ4R6N1@bootlin.com> <TYYPR01MB134193382D763659A25739F43DC242@TYYPR01MB13419.jpnprd01.prod.outlook.com> <DHRVKB1I9SSR.H8CA4RX6216U@bootlin.com> <TYYPR01MB13419E63BE9F9622B267F7040DC242@TYYPR01MB13419.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB13419E63BE9F9622B267F7040DC242@TYYPR01MB13419.jpnprd01.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 12:48:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235112

On Mon Apr 13, 2026 at 12:24 PM CEST, wangmy via lists.openembedded.org wro=
te:
> Understood. Can I add PR =3D "r1" to the bb file? I will remove this line=
 during the next version upgrade.
>

This looks OK for me.

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


