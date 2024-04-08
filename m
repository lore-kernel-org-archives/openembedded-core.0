Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54112C67861
	for <webhook@archiver.kernel.org>; Mon,  8 Apr 2024 09:59:11 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.102509.1712570346112619839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Apr 2024 02:59:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=KGZS0h2X;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14293E000F;
	Mon,  8 Apr 2024 09:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712570344;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=axNy92ifBi/B+3FRTSO78r37BWhoy5oE7vQpfC5mQ/c=;
	b=KGZS0h2XtDTgpEWiFqky2Iv9579IWlh9Gjdw2hZUPeBwmg/HFTQDr3934A86Ewv912HCB1
	i+xKUauk3PQO6QkT2sKkpeyfCTWajGr7qWMyAccYItKsnzoC0yXLhMU9rQoaZUySotEfOe
	nSqukklK3eL4dO2jasOt0JiOVfnFv0eNTOcyj5xVaKPFMNSZ0G93oRMvjw9PtN0GCjk4Pu
	zqPtH55eRyNHGZS5cnLRWORQKLgUXtBC+C9FAuPLpEfN1TDlqi/wPPqjRjd8CO/hcEdl9W
	5FNa4NZQyjIKa512rWchtCiW3OO4sn7iEVlfdz/f8gSfltcseR7ZyhEkdMEwCA==
Date: Mon, 8 Apr 2024 11:59:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Qi.Chen@windriver.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH V2 1/2] ovmf: set CVE_PRODUCT and CVE_VERSION
Message-ID: <202404080959033d7e878b@mail.local>
References: <20240406044129.84784-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240406044129.84784-1-Qi.Chen@windriver.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Apr 2024 09:59:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198006

Since this merged, we have:

WARNING: ovmf-native-edk2-stable202308-r0 do_cve_check: edk2: Failed to compare 202308 < svn_16280 for CVE-2014-8271

On 06/04/2024 12:41:28+0800, Chen Qi via lists.openembedded.org wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
> 
> Set CVE_PRODUCT and CVE_VERSION for ovmf. NVD uses 'edk2' and the
> version should be the date only. Here's an example:
> https://nvd.nist.gov/vuln/detail/CVE-2023-45232
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/recipes-core/ovmf/ovmf_git.bb | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
> index 3dc031d3b6..5b1353b8e8 100644
> --- a/meta/recipes-core/ovmf/ovmf_git.bb
> +++ b/meta/recipes-core/ovmf/ovmf_git.bb
> @@ -30,6 +30,9 @@ PV = "edk2-stable202308"
>  SRCREV = "819cfc6b42a68790a23509e4fcc58ceb70e1965e"
>  UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>edk2-stable.*)"
>  
> +CVE_PRODUCT = "edk2"
> +CVE_VERSION = "${@d.getVar('PV').split('stable')[1]}"
> +
>  inherit deploy
>  
>  PARALLEL_MAKE = ""
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#197989): https://lists.openembedded.org/g/openembedded-core/message/197989
> Mute This Topic: https://lists.openembedded.org/mt/105362148/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

