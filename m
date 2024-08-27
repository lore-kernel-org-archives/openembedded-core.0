Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B4CC54736
	for <webhook@archiver.kernel.org>; Tue, 27 Aug 2024 20:34:20 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.603.1724790853751673919
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Aug 2024 13:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jM2LEQvr;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A94C8FF805;
	Tue, 27 Aug 2024 20:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1724790851;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v5aTDTUHfTuoLRhjbIhLNMVI6eCf+cJriEASqMzHvR4=;
	b=jM2LEQvr9avwSWMal7lSKkrfHJoURc2EcYhoOomm3lRV3aIPhJYm1ip1I0EkldQ512mPKg
	kVSCyA6UZN9FDkKMWY1b7aHbv+PZz+b13eyiCvptXH5H8jr3UL3R6oIKNvmrzBUFO5nSOO
	J5UmvghyJnUVCKq87Ke9T3cSx7GxK7rJOV91fsVHbYICGga9HVrrPVYQrcIt/CLnyBOSs/
	VSaCBCtByXoFbWdfyWlaQyFfViNPkmprEyJKfW//iiZ4MkNJwQbkZqmIoIIltNdvuXKCky
	sDHLZZnMKlQAawdnlLkBoKHEb0H56DF36AkPXzJL29ms+Kp7oHy5IRCerfErYw==
Date: Tue, 27 Aug 2024 22:34:11 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: joaomarcos.costa@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH 1/2] util-linux/util-linux-libuuid: upgrade from
 2.40.1 to 2.40.2
Message-ID: <20240827203411eb3d165a@mail.local>
References: <20240822092642.893250-1-Qi.Chen@windriver.com>
 <3b516fea-bfac-4c9e-baaa-9a80d699b0d9@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b516fea-bfac-4c9e-baaa-9a80d699b0d9@bootlin.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Aug 2024 20:34:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203860

On 27/08/2024 11:02:47+0200, Joao Marcos Costa via lists.openembedded.org wrote:
> Hello, Chen
> 
> On 8/22/24 11:26, Chen Qi via lists.openembedded.org wrote:
> > From: Chen Qi<Qi.Chen@windriver.com>
> > 
> > Upgrade util-linux from 2.40.1 to 2.40.2.
> > 
> > 0001-Revert-autotools-make-pam-install-path-configurable.patch
> > is added to solve a problem of lastlog2 pam module not installed
> > in the expected location.
> > 
> > Signed-off-by: Chen Qi<Qi.Chen@windriver.com>
> 
> This update might be causing the ptest failure below, in the autobuilder:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/6937/steps/12/logs/stdio
> 
> Could you please take a look?

This is a know, rare AB-INT:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=15188

Can you triage it as such?

> 
> -- 
> Best regards,
> Jo�o Marcos Costa

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203819): https://lists.openembedded.org/g/openembedded-core/message/203819
> Mute This Topic: https://lists.openembedded.org/mt/108035181/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

