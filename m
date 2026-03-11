Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAFE0FD2D9D
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 08:56:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16198.1773219382682134079
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Mar 2026 01:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=bZviZ8ci;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 88B191A2CF8;
	Wed, 11 Mar 2026 08:56:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 52AF960004;
	Wed, 11 Mar 2026 08:56:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DD931036809E;
	Wed, 11 Mar 2026 09:56:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773219379; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oL+CXm244A88CoFJWhpvcSvapEA8WtkgmUnF/eVKCwo=;
	b=bZviZ8ciZTFxvKl7x/bI38YeT+IDL3qaNNd2iXusoWc/BU+vP/x/+yLIi3bSot8ZYPuWjB
	gKwusRKTsQaoifRgAQA5On1tv6NZvLtK7zj/sO6dDQh68JM8BKOQGxmqlfAkNzCxCQVesV
	kmVBR9ueDxDDT/SfzU2+0N2eoIs9vcIsaitDehC0eL5j8Mxn1O+Py7T1QTJ+uda+36pq56
	14Kli198ZHPipro0PDCCq4+EWl4A1mVIHf+TIGpd+Adr6Wa2A3BrFjXbNz/Nt40Ee08gBA
	oR8j2Qnfw1jbj5zy86CP/1pyzQ4woTo6yVs3jFj+HcD+BSkstRdj99XSyEvLCA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 09:56:13 +0100
Message-Id: <DGZTT2I2XKO7.2K87Q94HN348J@bootlin.com>
To: "Jan-Simon Moeller" <jsmoeller@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] systemd: upgrade from 258.1 to 259.1
Cc: <Qi.Chen@windriver.com>, <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260209080214.1738300-1-Qi.Chen@windriver.com>
 <DGC433PUWA1C.2BFX9T2ECNBRH@bootlin.com>
 <CADja47M4gJNqpvD3sr+6C0gBNVj7jpF7hDchnPker2Joeo3rZQ@mail.gmail.com>
In-Reply-To: <CADja47M4gJNqpvD3sr+6C0gBNVj7jpF7hDchnPker2Joeo3rZQ@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Mar 2026 08:56:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232843

On Wed Feb 11, 2026 at 1:15 PM CET, Jan-Simon Moeller wrote:
> No blocker. We can/will adapt.
>

Hi Jan-Simon,

This patch is now merged, so you can see build failures with meta-agl on
master.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


