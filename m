Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CEA9C00140
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 19:34:33 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.3005.1659987262605505308
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Aug 2022 12:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=lm3gEVsx;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231,
 mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 42E39100003;
	Mon,  8 Aug 2022 19:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659987260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2ytQEJzQAMwF9Phn9w3ts+ZMH4x23DS1mi6+FtEB050=;
	b=lm3gEVsxW6UWHB9f27yEqdFwkra0r4eoVlCdD9ixDQf8sMMisszjIeo73bZWPYYoi86HK2
	F7JCpLCjffmbRn2/ARBJzlYmds1a1AyiQVnyF7xP7tFxMXk0hxG846AiCeNXK4KPpgzNjq
	WBjGQobhWd/GoiL7unXJeSAPzvojH0MU30Vk0GWe/s1FxYt4IjwvX+n7gbTFeeGPrc1zf3
	U7AKJeVR/XFtaILXHC+AGvg+7zwgZ3zXgDCRDOHxv0tIyZUAmQJSzgWrLRO5ho3eR48tYC
	yI1u1Jeemd6AuptTAtoaQ76XgQvxTxixEmTN/i1xNNI4CNY1G6kzNJt2nCWWkQ==
Date: Mon, 8 Aug 2022 21:34:19 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Joshua Watt <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org, luca.ceresoli@bootlin.com
Subject: Re: [OE-core][PATCH] classes/sanity: De-golf regex
Message-ID: <YvFlO0a8mT23eEqF@mail.local>
References: <20220808131951.2029559-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220808131951.2029559-1-JPEWhacker@gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 19:34:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169115

Hi,

On 08/08/2022 08:19:51-0500, Joshua Watt wrote:
> The regex to match github or gitlab was unnecessarily shortened, which
> prevented them from showing up when grepping.
> 

This doesn't apply since we have "classes/sanity: Add comment about
github & gitlab archives" in master. I guess this was one or the other.

> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/insane.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 37e10ad850..b66926f540 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1335,7 +1335,7 @@ def unpack_check_src_uri(pn, d):
>          oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
>  
>      for url in d.getVar("SRC_URI").split():
> -        if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):
> +        if re.search(r"(github|gitlab)\.com/.+/.+/archive/.+", url):
>              oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses unstable GitHub/GitLab archives, convert recipe to use git protocol" % pn, d)
>  
>  python do_qa_unpack() {
> -- 
> 2.33.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169085): https://lists.openembedded.org/g/openembedded-core/message/169085
> Mute This Topic: https://lists.openembedded.org/mt/92891575/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

