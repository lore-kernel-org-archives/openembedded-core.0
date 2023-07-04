Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABF8EB64D9
	for <webhook@archiver.kernel.org>; Tue,  4 Jul 2023 21:51:32 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.4669.1688507487661127913
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jul 2023 14:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oBUBsCSn;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: alexandre.belloni@bootlin.com)
X-GND-Sasl: alexandre.belloni@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1688507485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6DO5QSc2o+3ogkiBXyxmmsogp2C4K6KHxNr+gF8SlCg=;
	b=oBUBsCSnXFckNRQKuuxEwl03uTNV7SzAnWI8Sr4rE0GiSmvprLGEkSXkASq7/xr1dyEC2y
	yB5IToFG9CsFQZfwWlj35/NZmq+qmM2K1dYnfjK9EpBKCcA+o5izmAOJt63PoXSApBJoxW
	Kfd6yflvVl8kpcLBjIWOyZBWiXlRnziL8C+hgl3WrdlJVFSjtWo36LtRyAYTNdBqJMsVd4
	ID8GFebWyNUeFXN4mwDFzhYNcNkRUDKICgcDFOvTmMqUiHbX9X4L89qT6MsiaDn7duQwAb
	MSp03JfM+Woqum3awQwxFl0ZjUlc5jrsTe7qW9ZcOyeGeaJCjaec0p45ZdKbpA==
X-GND-Sasl: alexandre.belloni@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D9B640002;
	Tue,  4 Jul 2023 21:51:24 +0000 (UTC)
Date: Tue, 4 Jul 2023 23:51:24 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 2/2] sqlite3: upgrade 3.41.2 -> 3.42.0
Message-ID: <20230704215124c1e0c037@mail.local>
References: <20230703065909.45555-1-anuj.mittal@intel.com>
 <20230703065909.45555-2-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703065909.45555-2-anuj.mittal@intel.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jul 2023 21:51:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183873

Hello Anuj,

Previous testing shows that this breaks rpm, do you know if this was
fixed?

On 03/07/2023 14:59:09+0800, Anuj Mittal wrote:
> Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
> ---
>  .../sqlite/{sqlite3_3.41.2.bb => sqlite3_3.42.0.bb}             | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-support/sqlite/{sqlite3_3.41.2.bb => sqlite3_3.42.0.bb} (86%)
> 
> diff --git a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb b/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
> similarity index 86%
> rename from meta/recipes-support/sqlite/sqlite3_3.41.2.bb
> rename to meta/recipes-support/sqlite/sqlite3_3.42.0.bb
> index b09e8e7f55..f60aca63d2 100644
> --- a/meta/recipes-support/sqlite/sqlite3_3.41.2.bb
> +++ b/meta/recipes-support/sqlite/sqlite3_3.42.0.bb
> @@ -4,7 +4,7 @@ LICENSE = "PD"
>  LIC_FILES_CHKSUM = "file://sqlite3.h;endline=11;md5=786d3dc581eff03f4fd9e4a77ed00c66"
>  
>  SRC_URI = "http://www.sqlite.org/2023/sqlite-autoconf-${SQLITE_PV}.tar.gz"
> -SRC_URI[sha256sum] = "e98c100dd1da4e30fa460761dab7c0b91a50b785e167f8c57acc46514fae9499"
> +SRC_URI[sha256sum] = "7abcfd161c6e2742ca5c6c0895d1f853c940f203304a0b49da4e1eca5d088ca6"
>  
>  # -19242 is only an issue in specific development branch commits
>  CVE_CHECK_IGNORE += "CVE-2019-19242"
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#183796): https://lists.openembedded.org/g/openembedded-core/message/183796
> Mute This Topic: https://lists.openembedded.org/mt/99922416/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

