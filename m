Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F3F3C433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:25:37 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.843.1664990732262660943
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 10:25:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=jP+lkiHP;
 spf=pass (domain: bootlin.com, ip: 217.70.178.230,
 mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 2742E240005;
	Wed,  5 Oct 2022 17:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1664990730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ODYY3rmdb12qY5nSiRSR6P1T0ovMaKbEJaDPpymrfE8=;
	b=jP+lkiHP+hXv8u/Z/DpWPU0IolM2heqjj89a2Mf2D/Kfjg0j6OJjw2T8lMPLJ82t4rXGqH
	4VtWYWp/iTgTEKiHsLcC8nI2LeqbR2d3MraVpT5bKQp7MhUO9hgyCi8IXxehTZwEii2Wni
	Miexrs34PKIPdS/MTTgQtdAjiNCTlbjwc66WpL9cWCD+cXiTGsYFomkDRIq0ufTRzJhRQu
	rDOFBpKcrx4US6bqQoXoBRJauJFhh6AZm2E7au8LdgGjQJ+Dvj6k3EMQjcsn/h3UDqSCr6
	Ew8Wp77hfLJFyt4hf7TmNEIhGSG5+Y0ctq2GuP/Df6bI/XRYfab8hQm6O8sJdQ==
Message-ID: <6014d530-1a29-2734-35ff-91dc8d5e469f@bootlin.com>
Date: Wed, 5 Oct 2022 19:25:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] psplash: add psplash-default in rdepends
Content-Language: en-US
To: thomas.perrot@bootlin.com
References: <20221005171914.2889050-1-thomas.perrot@bootlin.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
In-Reply-To: <20221005171914.2889050-1-thomas.perrot@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 17:25:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171475


On 05.10.22 19:19, Thomas Perrot via lists.openembedded.org wrote:
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>
> Otherwise when the installation of recommended packages is prevented
> (NO_RECOMMENDATIONS = "1"), then splash screen will not be cast.
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>   meta/recipes-core/psplash/psplash_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
> index edc0ac1d8961..9532ed1534a6 100644
> --- a/meta/recipes-core/psplash/psplash_git.bb
> +++ b/meta/recipes-core/psplash/psplash_git.bb
> @@ -58,7 +58,7 @@ python __anonymous() {
>           d.setVarFlag("ALTERNATIVE_TARGET_%s" % ep, 'psplash', '${bindir}/%s' % p)
>           d.appendVar("RDEPENDS:%s" % ep, " %s" % pn)
>           if p == "psplash-default":
> -            d.appendVar("RRECOMMENDS:%s" % pn, " %s" % ep)
> +            d.appendVar("RDEPENDS:%s" % pn, " %s" % ep)
>   }
>   
>   S = "${WORKDIR}/git"


Thanks Thomas. I confirm that the patch applies well now. You have a 
correct identity as a git commit author.
Thanks again
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


