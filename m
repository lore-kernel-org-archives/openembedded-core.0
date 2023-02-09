Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D14C3C636D3
	for <webhook@archiver.kernel.org>; Thu,  9 Feb 2023 21:32:24 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.3980.1675978335763357646
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Feb 2023 13:32:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=UZlENKQV;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5BC211BF203;
	Thu,  9 Feb 2023 21:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675978333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UNTbsJMQuoRdgwBeDddm0UQUb5hxckSn/BjtTz1T3mo=;
	b=UZlENKQVSwjCeHdgX3u4JSE1QUVHCyoXRfe3MkBGZmJYiLPQr/bKyU2NKzoWyj1qUKashQ
	RmA1lTYksQjNsvrqavlwoH/Je9CueVoAckT1i5BjUwDsFaxUi2nvLptut1uHB/XZMrYW2W
	djliaHWBftDX3+9e5IObE0e4cVgPQwnH3u2mhsMkvZGXO34Cfgvq5z/rcTaPJth1dj8fae
	35oWB+ctisqWq01ends9atSs6Ll5uZAu857C+PTUTEcBBOUrSHuyl54Thp9pbOoNA/dF7a
	6xnB7cc/i90+WTz+LJnhGhOnf4TMzD8ABugfF+wE7NHTRGXHDYjQDpC/UR2msA==
Date: Thu, 9 Feb 2023 22:32:11 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Lee Chee Yang" <chee.yang.lee@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [patch][master][langdale] libgit2: upgrade to 1.5.1
Message-ID: <20230209223211.2ecf3ab6@booty>
In-Reply-To: <20230209130229.3224043-1-chee.yang.lee@intel.com>
References: <20230209130229.3224043-1-chee.yang.lee@intel.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Feb 2023 21:32:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176970

Hello Lee Chee,

On Thu,  9 Feb 2023 21:02:29 +0800
"Lee Chee Yang" <chee.yang.lee@intel.com> wrote:

> From: Chee Yang Lee <chee.yang.lee@intel.com>
> 
> This is a security release to address CVE-2023-22742: when compiled
> using the optional, included libssh2 backend, libgit2 fails to verify
> SSH keys by default.
> 
> When using an SSH remote with the optional, included libssh2 backend,
> libgit2 does not perform certificate checking by default. Prior versions
> of libgit2 require the caller to set the `certificate_check` field of
> libgit2's `git_remote_callbacks` structure - if a certificate check
> callback is not set, libgit2 does not perform any certificate checking.
> This means that by default - without configuring a certificate check
> callback, clients will not perform validation on the server SSH keys and
> may be subject to a man-in-the-middle attack.
> 
> Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>

A patch doing this same upgrade has been sent yesterday by Alex Kanavin
and is already in master.

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

