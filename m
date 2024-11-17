Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A14AD6DDC4
	for <webhook@archiver.kernel.org>; Sun, 17 Nov 2024 12:35:20 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web11.17310.1731846919236281373
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Nov 2024 04:35:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bKgIuJIj;
 spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CD43240004;
	Sun, 17 Nov 2024 12:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731846917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=XOiFicb/p5bPnboRaqprUPbmdwTCg0AlaGensYlXgnA=;
	b=bKgIuJIjd20/vUh9QF9PmkPJ0IrK43WnuSuWzdsIml0iV9bdcn4T8vFr1rkaKWn5MTOwHA
	vwLK8oFcuSS5P43waqNFVagxYXrSO+7E58BcqPXykTty226MYuvHU6uyf/lzyCTb+6Gxfq
	XhjasHJ8JZo+p5xzU7UCwgFaorVu4bzYiIMJtQSB5nNhEYWizxlaSV7wQ7N/P9rlcYlt9B
	/JOCKdEOb0t4U/Kw9nCN9LyAgjOe+me6D9+ne8JIBjhQIQmSqRW+7GYCs1AmpQCYgei7mo
	aIhfsR2l0HfZhoYTMT/rPQ47aD9UJckL1azeH7GbzmgzQaNWPLIdyzfUl6i40A==
Date: Sun, 17 Nov 2024 13:35:14 +0100
From: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
To: wangmy@fujitsu.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH 07/47] gawk: upgrade 5.3.0 -> 5.3.1
Message-ID: <ZznjAnJKfH8f_mxL@bootlin-mathieu>
Mail-Followup-To: wangmy@fujitsu.com,
	openembedded-core@lists.openembedded.org
References: <1731403483-21399-1-git-send-email-wangmy@fujitsu.com>
 <1731403483-21399-7-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1731403483-21399-7-git-send-email-wangmy@fujitsu.com>
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Nov 2024 12:35:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207197

On Tue, Nov 12, 2024 at 05:24:03PM +0800, wangmy via lists.openembedded.org wrote:
> From: Wang Mingyu <wangmy@fujitsu.com>
> 
> 0001-m4-readline-add-missing-includes.patch
> removed since it's included in 5.3.1
> 
> Changelog:
> ===========
> - More subtle issues related to uninitialized array elements have
>   been fixed.
> - A number of bugs in the debugger related to handling of arrays
>   have been fixed.
> - Some subtle bugs in the API have been fixed.
> - Use of MPFR is now possible again on 32-bit Power PC Mac systems.
> - Race conditions around broken pipes for system() and read and write
>   pipes should now be closed off.
> - Support for OSF/1 has been removed.
> - The never-documented --nostalgia option has been removed. It was
>   causing bug reports.
> - The implementation of printf/sprintf has been thoroughly reworked
>   in order to make the code more maintainable and to fix a goodly
>   number of corner cases.
> - As usual, there have been several minor code cleanups and bug fixes.
> 

It looks like this patch is breaking some ptests on the autobuilder:

Failed ptests:
{'gawk': ['printf-corners']}

https://valkyrie.yoctoproject.org/#/builders/61/builds/388/steps/12/logs/stdio
https://valkyrie.yoctoproject.org/#/builders/73/builds/390/steps/12/logs/stdio

Can you have a look at this please?

-- 
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

