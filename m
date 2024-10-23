Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FE8ED2E031
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 09:27:39 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web10.4755.1729675658651308437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 02:27:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Jwj6bj2B;
 spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A220FF802;
	Wed, 23 Oct 2024 09:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1729675656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fXYt52wfGIJB6XQ1WUDwKMSEB1yHfaqxEdNupFbo850=;
	b=Jwj6bj2B432ydcKJ1iE2QoClY2ya5VAVjxKncwyOlEj7AIVp9TJHiXunLmbnKqQQc+Rjpm
	10XThCekVc4W1d0wlzM4ddyucVbMjgex08kbJXh8mbyonM/9hrWyXtBZuJE1hv9ZFmr64s
	R5gDrbkYkI5PlVujL4wdjwiA2xxSLQdNKxwTy4PTWeNOBhY+guFiNej3VoUT4QLkqVAOG1
	TV2j4F2HGYHFk65QrakkTSWHzH83bz22Aqa8phx2tOYEL7iPD2k+saQaPNhdRsU8oDudlV
	e/oq0X4l1pJHsX3St3JFimIaBmxT08xceMYYw7okkRGoqLS79y/1/oUX0VmWLQ==
Date: Wed, 23 Oct 2024 11:27:35 +0200
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: peter.marko@siemens.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] cve-check: add support for cvss v4.0
Message-ID: <ZxjBh6d36lQ38iTI@bootlin-mathieu>
Mail-Followup-To: peter.marko@siemens.com,
	openembedded-core@lists.openembedded.org
References: <20241022212750.25402-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241022212750.25402-1-peter.marko@siemens.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 09:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206189

On Tue, Oct 22, 2024 at 11:27:50PM +0200, Peter Marko via lists.openembedded.org wrote:
> From: Peter Marko <peter.marko@siemens.com>
> 
> https://nvd.nist.gov/general/news/cvss-v4-0-official-support
> 
> CVSS v4.0 was released in November 2023
> NVD announced support for it in June 2024
> 
> Current stats are:
> * cvss v4 provided, but also v3, so cve-check showed a value
> sqlite> select count(*) from nvd where scorev4 != 0.0 and scorev3 != 0.0;
> 2069
> * only cvss v4 provided, so cve-check did not show any
> sqlite> select count(*) from nvd where scorev4 != 0.0 and scorev3 = 0.0;
> 260
> 
> Signed-off-by: Peter Marko <peter.marko@siemens.com>

Hi Peter,

Thanks for your patch, but it seems it does not apply cleanly on master.
I got the following error:

error: patch failed: meta/classes/cve-check.bbclass:534

Could you rebase your patch on master please ?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

