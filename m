Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 922E8D6AB19
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 08:26:21 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7252.1775204780420151507
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Apr 2026 01:26:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=zP8qKe3A;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 87C2AC59F5E
	for <openembedded-core@lists.openembedded.org>; Fri,  3 Apr 2026 08:26:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A2947603C1;
	Fri,  3 Apr 2026 08:26:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6BC4210451125;
	Fri,  3 Apr 2026 10:26:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775204778; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nwCDnFO+QLPitlHSkslapC5PMir1OuZokQRSrJPpLCY=;
	b=zP8qKe3ABTXI0kuio+EACtXsDKuTTtqCAZSbt+12nmFcRRYgHTUoY8VmT0hj04EYKuhL3o
	oqVJ/j5mPDv4hTYPWsXKMQMzDBNR9uQVXIMak00Xu8RzEKu9aWWiBauctDnZqK6imQUMTD
	73yQ4YYz+yZII0haIDEiKItBImEMQ8EIJ1VaarDQazjvN1h4P2h06yuGl/576zoAzBEmCO
	mtUhOsZ+2XaUOWx85RoV27KeYyGfhizBaxhwDBPaZmwQsO662pSo9wujS5yFvxARYDdbYy
	N/CXMPl2vSMvL1kqcruV1NzqcNc47MGHVDlQf2/0iRUImOlwrO/j14T7j/m53Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 10:26:16 +0200
Message-Id: <DHJDKO2Y1ZO9.10477FJ3PZOPQ@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [RFC PATCH 1/3] sbom-cve-check: refactor
 do_sbom_cve_check
Cc: <benjamin.robin@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <20260402162510.1945892-1-ross.burton@arm.com>
In-Reply-To: <20260402162510.1945892-1-ross.burton@arm.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Apr 2026 08:26:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234565

Hi,

On Thu Apr 2, 2026 at 6:25 PM CEST, Ross Burton via lists.openembedded.org =
wrote:
[...]
> +
> +
> +python do_sbom_cve_check() {

I'd suggest renaming it to do_sbom_cve_check_image so you'll have
do_sbom_cve_check_image and do_sbom_cve_check_recipe in the third patch and
there's less confusion?

Antonin

