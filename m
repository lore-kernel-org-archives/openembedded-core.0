Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 113FECDB483
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 19:58:25 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web10.11114.1697659094778411081
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Oct 2023 12:58:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=PL8mXkvZ;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: alexandre.belloni@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7F5F0E0004;
	Wed, 18 Oct 2023 19:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697659093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fp1N6oTkbSuhKF+5WMECctxLpWcESX7fMwn2HJ24zgQ=;
	b=PL8mXkvZrToMvk9zZ+a9NGnjdiid4ZGzHXkS3NRgTnAtO3ku3hS0upkou1VKR37F3eJN1L
	2cVlpB8ehXU/Zdus9KOwIVUuKvQh8leK64P4jzhXNBvg6b+WH5c4cRyueMzgc911J83wKJ
	lHTlIynnnlGmHlBRa2nZ1NecQYKAzMRWJkCQJsygcA39H65+HOwHjthnrjvMKtoUwq9IYv
	hOJ1cn3S+1gaD3AZByYe2+cNdfWiaXL21RXs5NEFNCihHM4r633IS8HqHWTmRjZWn0KDK0
	7zNEEe8lNUd7SyV/jtNTneYQAWqZ5371Wtb6kxKIC0CdchSXYb123lWndyMJFA==
Date: Wed, 18 Oct 2023 21:58:12 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 1/4] scripts:recipetool:create_buildsys_python:
 fix license note
Message-ID: <2023101819581237082c3d@mail.local>
References: <20231018120114.1222475-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231018120114.1222475-1-jstephan@baylibre.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Oct 2023 19:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189422

Hello,

On 18/10/2023 14:01:11+0200, Julien Stephan wrote:
> License field of setup is not always standardized, so we usually use the
> classifier to determine the correct license format to use in the recipe.
> 
> A warning note is added above the LICENSE field of the create recipe
> in case a license is provided in setup. But when the plugin is called,
> "LICENSE =" is not yet present so we can never display this note.
> Replace the "LICENSE =" condition with "##LICENSE_PLACEHOLDER##"
> to actually be able to display the note message
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  scripts/lib/recipetool/create_buildsys_python.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
> index 92468b22546..d2c7e251bf7 100644
> --- a/scripts/lib/recipetool/create_buildsys_python.py
> +++ b/scripts/lib/recipetool/create_buildsys_python.py
> @@ -254,7 +254,7 @@ class PythonRecipeHandler(RecipeHandler):
>  
>          if license_str:
>              for i, line in enumerate(lines_before):
> -                if line.startswith('LICENSE = '):
> +                if ine.startswith('##LICENSE_PLACEHOLDER##'):

I doubt this parses at all, ine is not declared ;)

>                      lines_before.insert(i, '# NOTE: License in setup.py/PKGINFO is: %s' % license_str)
>                      break
>  
> -- 
> 2.41.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#189385): https://lists.openembedded.org/g/openembedded-core/message/189385
> Mute This Topic: https://lists.openembedded.org/mt/102037342/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

