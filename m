Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EA13C19F28
	for <webhook@archiver.kernel.org>; Wed,  3 Aug 2022 15:31:54 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.10256.1659540703710740561
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Aug 2022 08:31:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oP5yeKPB;
 spf=pass (domain: bootlin.com, ip: 217.70.183.200,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5471520007;
	Wed,  3 Aug 2022 15:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659540701;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HDGGfjq7x00KfHByW1IohVBUAvpa1BJR6o1Vq1/DG2Y=;
	b=oP5yeKPBHiX3uWnx7HzFtLfj3WhLoslKnLX8vzzByCx+Qsn9ieW1CIvm8/WstomubPPkPP
	Dgd7wjRO9UKJAC/+fCo99bMXvG9ldP5Sg7bnW7JPww/F3AxphPCKvfRQ8R4zvm+fHCmyOn
	XVUNLfp9jihwUGaSkDIZsM8bic9k6vZ5Jzx6Clm7ApBTdqvRCUE+K3rtXO0R9mzX/Dihql
	WMg46CqQ6bWmlLbhUH/BgMT8fs4eCYAOBALG6+/q5sIYBNgtsmarV0EfIvWUbAm+R3lXKi
	XjvY1ACNGHsNpFSHQG2Hc5mtLEDhVNQZShOo7ljntCob5CPbcs8uTx5aohiobQ==
Date: Wed, 3 Aug 2022 17:31:38 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: pgowda cve <pgowda.cve@gmail.com>
Cc: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>,
 openembedded-core@lists.openembedded.org,
 richard.purdie@linuxfoundation.org, rwmacleod@gmail.com, Vinay Kumar
 <vinay.m.engg@gmail.com>
Subject: Re: [OE-core] [PATCH v7] Rust Oe-Selftest implementation
Message-ID: <20220803173138.4d638b3f@booty>
In-Reply-To: 
 <CALY4984fqAjM=_D-N9VtPmgknvYNAjY-0NqNjxK3Ahuv9k8g_A@mail.gmail.com>
References: <20220802122005.31100-1-pgowda.cve@gmail.com>
	<1707D9665C148D1A.1831@lists.openembedded.org>
	<20220803154310.2cf9862c@booty>
	<CALY4984fqAjM=_D-N9VtPmgknvYNAjY-0NqNjxK3Ahuv9k8g_A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Aug 2022 15:31:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168824

Hi Pgowda,

On Wed, 3 Aug 2022 19:58:30 +0530
pgowda cve <pgowda.cve@gmail.com> wrote:

> Hi Luca,
> 
> Updated the maintainers list and submitted the patch as:-
> https://lists.openembedded.org/g/openembedded-core/message/168819

Does this also fix the strictly-build failure, or only the lack of
maintainer?

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

