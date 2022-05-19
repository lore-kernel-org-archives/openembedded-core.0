Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61EC8C433EF
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 13:34:09 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web08.7562.1652967245766915129
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 May 2022 06:34:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=D6oijoZ3;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id D0EF31C0013;
	Thu, 19 May 2022 13:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1652967243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tx+IPxWYQ5OnL0q/8RhIvQL6nVBvq1e5p6g6+drRMrg=;
	b=D6oijoZ3HD+DB7YAENqHdmVZMFY37ml2HzZVgTQe+/uU0lig9AKhclfW8zkF9cHlTqYYNB
	bUETiq8YAtrkvMnO7NselN4KdUBtZlpGoQUoQMITDUMOdX4HoVtm1/PMm2G4LzyKjMPPLd
	Occ5BUD6ULMBpFI8MYISH0AwxO4mdNG9NMs93d5gkc5pV0C1sb4wiiY3YC8MtJBOIgtNEd
	ULRm7f5UAL+ggqw0V3cKVz6HJ10FVtA+Q08UBvwXmruqjERagSELWSQ+EinONf6cB+H2s7
	sVAlRXBlqij8is9T4Qge14e7T+285nqLY49xLj+w5GLcjrtep6QDuxlNpzoeuw==
Date: Thu, 19 May 2022 15:34:01 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Tobias Schmidl" <tobiasschmidl@siemens.com>
Cc: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 1/1] wic/plugins/images/direct: Allow changes
 in fstab on rootfs
Message-ID: <20220519153401.0d3d92b3@melee>
In-Reply-To: <20220517184816.1348026-2-tobiasschmidl@siemens.com>
References: <20220517184816.1348026-1-tobiasschmidl@siemens.com>
	<20220517184816.1348026-2-tobiasschmidl@siemens.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 May 2022 13:34:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165887

Hello Tobias,

Il giorno Tue, 17 May 2022 20:48:16 +0200
"Tobias Schmidl" <tobiasschmidl@siemens.com> ha scritto:

> Allow wic to also manipulate the rootfs entry in fstab, which it
> currently refuses to write. Reasons one might want to do that include
> using systemd-growfs via --fsoptions on /
> With this change / is now handled exactly the same as other
> mountpoints, the former exception seemingly was not even documented.
> 
> Signed-off-by: Tobias Schmidl <tobiasschmidl@siemens.com>

The autobuilders found some errors while building with this patch on my
testing branch:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3600/steps/15/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/3544/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/3566/steps/14/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3606/steps/14/logs/stdio

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

