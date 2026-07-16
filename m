Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 869B5C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 09:22:00 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8873.1784193710254720222
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jul 2026 02:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=d2rll41v;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BCD71C2B9C8;
	Thu, 16 Jul 2026 09:22:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 73A30602B8;
	Thu, 16 Jul 2026 09:21:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 17EDB11BD3CBF;
	Thu, 16 Jul 2026 11:21:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784193707; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2bBZAlkn/KOk9cYcaxWXa66kjc0ASDMffDI9XinFhjc=;
	b=d2rll41v/7z/dRMG59Jj7PjllIZQ2UEsYZJPrMGYrcuKKOZ7i7ToeC3Sn4pPWElWepzDUV
	42CyKH1z7u4Z2WDjpzsTZppfVmfHj84fhN4FR9eE/xsjJUYsDEgcdvfm5W573BnSa+MRz8
	rMs7EU8yLoAGgPa78xGyaHCPm/aVjCQfB5e8bV5eIFpAq75Y5UkcEBZsg2YX3Hd+ohmTcE
	+Yxn+1cqu0DkCvDKyuKYCNoSheQVtSATJuUkeMGXdWKfEo8ts6sdb3SJZ0sxfMSU7snGmF
	m6DcXUZSsP2+7l2yF0z6NL/KwFm/CRp2td/awl5aD4o8ps3uvLGQfu4PlmtByA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Jul 2026 11:21:45 +0200
Message-Id: <DJZVVSXKA0WD.3IQ8L9ZBTAO5T@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: <joerg.sommer@navimatix.de>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Enable audit and other PACKAGECONFIG by
 DISTRO_FEATURES
References: <20260714144019.2771283-2-joerg.sommer@navimatix.de>
In-Reply-To: <20260714144019.2771283-2-joerg.sommer@navimatix.de>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 09:22:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241072

Hi,

On Tue Jul 14, 2026 at 4:41 PM CEST, J=C3=B6rg Sommer via lists.openembedde=
d.org wrote:
> systemd already enables its PACKAGECONFIG[audit] by filtering the
> DISTRO_FEATURES for `audit`. It's useful to extend this feature to more
> packages.

Side-question, if we officially support the audit distro feature, wouldn't =
it be
relevant to also maintain the audit recipe in OE-Core? It is currently
provided by meta-oe.

Antonin

