Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9DEC77B6E
	for <webhook@archiver.kernel.org>; Wed, 12 Apr 2023 20:38:54 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.1040.1681331928432694098
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Apr 2023 13:38:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Y+bUmu0N;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 3E9B21BF205;
	Wed, 12 Apr 2023 20:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1681331926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5xU6p5GMOkZDkHTdpTLHDnAK9rpnOisxl8vSNn3F3hg=;
	b=Y+bUmu0NMAryh8gvrS1gIPlnJsGmhAu9vL/37xKuWrcMuJkUp/n64qs01fl86nsNZrHQ1a
	iUDIdIK5+nBTskEC9lY9TcYaElDWZyFDMJEFaip2oQcaLyijNB9wg00B8AIBcdNAqfVghr
	L+xmZi0cx6M83ExLUvnBonNKOe5X6BohStbMsJi9PLFhAj6Bdwve6cmrUSm83H88i22fFN
	6WGsloYnIR+gfmlBoYHV8g9wLK2yk1vVlwgMOCJkpn7fsD62KxbRVNw/K8T/ih2B5awP2o
	xg/o+A/e+5kLx9vxlo6gnVtK/ryb8E3tuq7P6LEtaiHmRf0WQhlh14UnHzsqCg==
Date: Wed, 12 Apr 2023 22:38:43 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Joe Slater" <joe.slater@windriver.com>
Cc: <openembedded-core@lists.openembedded.org>,
 <randy.macleod@windriver.com>
Subject: Re: [oe-core][PATCH 1/1] go: fix CVE-2022-41724, 41725
Message-ID: <20230412223843.2f6fee5e@booty>
In-Reply-To: <20230412183206.993094-1-joe.slater@windriver.com>
References: <20230412183206.993094-1-joe.slater@windriver.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Apr 2023 20:38:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179951

Hello Joe,

On Wed, 12 Apr 2023 11:32:06 -0700
"Joe Slater" <joe.slater@windriver.com> wrote:

> Backport from go-1.19.  The godebug package is needed by
> the fix to CVE-2022-41725.
> 
> Mostly a cherry-pick but exceptions are noted in comments
> marked "backport".
> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  ...01-go-fix-CVE-2022-41723-41724-41725.patch | 3373 +++++++++++++++++
>  meta/recipes-devtools/go/go-1.17.13.inc       |    5 +-

I understand this patch is wrong, being mased on kirkstone, so you sent
a fixed versions with the '[kirkstone]' subject tag shortly after, and
this one should be ignored. Is this correct?

Best regards,
Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

