Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC66C433EF
	for <webhook@archiver.kernel.org>; Mon,  2 May 2022 20:31:08 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.2503.1651523458154413035
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 May 2022 13:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KivgSLne;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id ED061E0007;
	Mon,  2 May 2022 20:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1651523456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ubiXMGzdrF/HXJX5Awb8p0woZI+whMqhbn6GNj99kJ0=;
	b=KivgSLneDQxa8mCzEHi0A2YJxpClLV2Jef2hSOPicyNE4MlJRuFDnQNH210s6tGQjCFNzh
	jsHCAHC2TNDiBXuLklLkmkJ9DgOXIDKpMKJ/1sKGbOvmUyWJDgJ0nS6jPoJ0sVR7DU42gC
	FszTF3C4wNf5nMKLo5so2JYyJ0ewkUiWASiRxuUiBauGtDIgZEmmqH1G4EpwiMRyhE6xcg
	OTR787RdzS0p8O9hbzxOFDY4C94sZUOtfePAg2U2giwdcm19KqeQoykfmn8SPaiuxoWJDi
	La3OFm/tk6g3DHtcmDatr3C7CIgQqj2eMYw3Ysdqjr8pWHBPJ6Gd2Ing+qNw6Q==
Date: Mon, 2 May 2022 22:30:54 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Pgowda" <pgowda.cve@gmail.com>
Cc: openembedded-core@lists.openembedded.org, rwmacleod@gmail.com
Subject: Re: [OE-core] [PATCH] glibc: ptest: Add lib32-glibc-tests PROVIDES
Message-ID: <20220502223054.3aa3ecd5@melee>
In-Reply-To: <20220502080851.40753-1-pgowda.cve@gmail.com>
References: <20220502080851.40753-1-pgowda.cve@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 May 2022 20:31:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165174

Hi Pgowda,

Il giorno Mon,  2 May 2022 01:08:51 -0700
"Pgowda" <pgowda.cve@gmail.com> ha scritto:

> While running lib32-glibc-tests, it fails with the following error
> as the recipe is not PROVIDED. BBCLASSEXTEND is cleaned in glibc-tests
> and is not able to recognize the multilibs.
> 
> ERROR: Nothing PROVIDES 'lib32-glibc-tests'
> 
> Signed-off-by: pgowda <pgowda.cve@gmail.com>

It seems like this patch is triggering some build error:

https://autobuilder.yoctoproject.org/typhoon/#/builders/73/builds/5100/steps/19/logs/stdio



-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

