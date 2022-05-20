Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13F8DC433F5
	for <webhook@archiver.kernel.org>; Fri, 20 May 2022 15:20:25 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web09.139.1653060015910034572
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 May 2022 08:20:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=V1E2eUGv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: (Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 92C214000F;
	Fri, 20 May 2022 15:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1653060014;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NG7adDKS7k6wu6dmlJAkXrtPqfdzFqdTPOcTP3+EM1Y=;
	b=V1E2eUGv5V7kbQccXCXpeiwYz48dtzUZPnu7r2+dKB9dLXlW+syNT5/aLwMSmhmJGDrsTQ
	mifHOHNE2DQhB7td3CNonGlKi/N+6z4Ey/pN9yIlpA3rgahY4dHU8W7OMEOBc4zfcNCuBi
	RElofsO1L3HSq+ETaB1vwLneNByu+v3qUVmALgltBvXXrhfWxzkdHWZgPEtr22UadlSL3S
	/fY4GCNHrCt8jvfycElL6CjTv7n5TiB5NFzgl3o0UAJo5SXoPveXbHHEOvb11KJ/ekoqD9
	gjLUwKb4xEhoNqZ3SR6vfGGCKW9ZfT903Vm4wfg5ruTlPdSH6HrTF1nM2qFtMg==
Date: Fri, 20 May 2022 17:20:11 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Markus Volk" <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [oe-core][RFC PATCHv3 1/3] allow to build more native packages
Message-ID: <20220520172011.1ec713c6@melee>
In-Reply-To: <20220520125419.4115417-1-f_l_k@t-online.de>
References: <20220520125419.4115417-1-f_l_k@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 May 2022 15:20:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165942

Hi Markus,

Il giorno Fri, 20 May 2022 14:54:17 +0200
"Markus Volk" <f_l_k@t-online.de> ha scritto:

> basically this would fix build for pipewire-native, libpam-native and
> openssh-native. Hopefully without breaking things ;)

Missing Signed-off-by :line.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

