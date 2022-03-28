Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54F7BC433FE
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 15:30:26 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.12525.1648481424833857282
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Mar 2022 08:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=e8S8xJvr;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id BA92924000D;
	Mon, 28 Mar 2022 15:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1648481423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UwlyaZ9LBVvFA3aS4qW/3dE6WcWC1zRhhuhfQsPWkl8=;
	b=e8S8xJvrqgdcnGszMkhEzAQ7IUY+5Cl3lKF8fP+N7D4nRMmnZTF02tjsKMLoQm9qdIEJdZ
	jk1ZrYArUqow0GS6CEhLj/G4mReKxPRJE4eIEzUjCG4yOuQHMiAekkYfEqsoN/VfrlqF7B
	9F9GRTUH2KakC92FSbAoA3UVq7iLASdg7Cx0o57iSFsXZskSiYPrA7fsirpe7DVvuI6fQP
	MywmHm431ZR3bsyhhh+m4JPI6Ae9m+L0W5QSUmluMOBRf68JIvPATSX0J1VFa9r4Mp9T0G
	68CW9dXU2pOVht86IxdQrEsu7Uzvr25UgKpQ4VVU+qlOdEER2uZHyAmYCMV2LQ==
Message-ID: <2c8e51a2-fd18-9781-7686-21d7a5376443@bootlin.com>
Date: Mon, 28 Mar 2022 17:30:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [OE-core] [PATCH 2/2] mount-copybind: add
 MOUNT_COPYBIND_AVOID_OVERLAYFS env var to skip OverlayFS
Content-Language: en-US
To: Luca Bocassi <luca.boccassi@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20220325184032.1880706-1-luca.boccassi@gmail.com>
 <20220325184032.1880706-2-luca.boccassi@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20220325184032.1880706-2-luca.boccassi@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Mar 2022 15:30:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163711

Hi Luca,

On 3/25/22 19:40, Luca Bocassi wrote:
> From: Luca Boccassi <luca.boccassi@microsoft.com>
>
> In some cases we don't want to even attempt to set up OverlayFS, for
> example because SELinux in enforcing mode would kill the process
> attempting to use the mount. See:
>
> https://lore.kernel.org/all/CA+FmFJBDwt52Z-dVGfuUcnRMiMtGPhK4cCQJ=J_fg0r3x-b6ng@mail.gmail.com/T/#mef98aa406324096d1889d3d467251f30456f403c
>
> If MOUNT_COPYBIND_AVOID_OVERLAYFS=1 is set, skip directly to copy and
> bind mount.
>
> Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>


Thanks for the patch!
Now that the patch is merged, would you mind proposing a patch to add a
description of it to the documentation? You'll probably do it better
than I would.

Thanks in advance
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


