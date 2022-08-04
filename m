Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFEFDC25B08
	for <webhook@archiver.kernel.org>; Thu,  4 Aug 2022 20:58:25 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.159.1659646699027768781
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Aug 2022 13:58:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=RHXanJ8h;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194,
 mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7544B4000A;
	Thu,  4 Aug 2022 20:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1659646696;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aRubbJRdyCnNtBaZhE1fvBqloUi3YOgBFI2jVyG5wvU=;
	b=RHXanJ8hIqQWFY6CXqyLD8FbSZKi5yYG0RXOx6ZM8dtLvWVrtn4eyzjTbjiGud5PpiZfhB
	ikqDgi3zL+1PXtUA00D4+/YOFWeiMMz/SzDMK6y0aZ0cIkMT+Ye8/TYYJSnU1/sohRk6rz
	v9u4a+9PtHSOIrxSU5ZgdfYDcRQgfe9laAhxMnboJwTcnr6f01ln367galjPXlWnZ+2Ai6
	BOt/ku3UxdMYwXP+tyHWJEq3cU1uR6rCJYAkUsPXxDSh2RCWCYRWco/bkgSbp0fOMoOpI6
	GethzJYTbuwxwSyR0CLrMvd3HiFRZL75iMRVPHeE5h4+1Am/sPcOJFYjd5aUrA==
Date: Thu, 4 Aug 2022 22:58:14 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Joshua Watt" <JPEWhacker@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core][PATCH] classes/sanity: Add comment about github &
 gitlab archives
Message-ID: <20220804225814.61baffe2@booty>
In-Reply-To: <20220804145831.1545698-1-JPEWhacker@gmail.com>
References: <20220804145831.1545698-1-JPEWhacker@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Aug 2022 20:58:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168862

Hi Joshua,

On Thu,  4 Aug 2022 09:58:31 -0500
"Joshua Watt" <JPEWhacker@gmail.com> wrote:

> Add a comment so that users grepping for "github" or "gitlab" will find
> this code (since the regex wont).
> 
> Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> ---
>  meta/classes/insane.bbclass | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 37e10ad850..c8b434bb54 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -1335,6 +1335,7 @@ def unpack_check_src_uri(pn, d):
>          oe.qa.handle_error("src-uri-bad", "%s: SRC_URI uses PN not BPN" % pn, d)
>  
>      for url in d.getVar("SRC_URI").split():
> +        # Search for github and gitlab URLs that pull unstable archives (comment for future greppers)
>          if re.search(r"git(hu|la)b\.com/.+/.+/archive/.+", url):

I think the regexp is unnecessarily baroque and it could become just a
more readable (github|gitlab). And that would add only 4 chars! :-)

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

