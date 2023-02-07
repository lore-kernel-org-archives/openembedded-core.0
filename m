Return-Path: <luca.ceresoli@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3809C636D3
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 17:44:02 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.90182.1675791835055663354
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Feb 2023 09:43:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=Njt9Wna6;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: luca.ceresoli@bootlin.com)
Received: from booty (unknown [77.244.183.192])
	(Authenticated sender: luca.ceresoli@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 434531BF203;
	Tue,  7 Feb 2023 17:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1675791833;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HFv5PK6R+YwqKSbitiIjBitQ7j/AsiqKpDiSLGl6Onc=;
	b=Njt9Wna6CfNsq6+vpjvZCjSyRucPuVn6KR3ETXLc/MHbHEpJL32E5wZ+d512J7/esGTraY
	XUvoXeFa+c0ROZbHNTlV2zRXXwUZZjkujTpmxB6Gm1mb1PRytQ8HlUgsoKJUHUoAD/5e2A
	zfsOahjCbEpY9me2zGFzaUGB+DfupWVLI31DmYM276Qw/0hbb1+Z/ZW4tPCmjPgPRQtuGX
	HThzDxwCKq2ZgApbFYwFd70Nqss4IN1ysji7MDz2HtTVQrm7qeT2BsRpyXJlVkKjVap7Vh
	4wRvPLRCmlQJYi+Km86gm0ZnBy0EgegKIpwuWRBIqz/2F5e/kYzlZ+I0nieb/g==
Date: Tue, 7 Feb 2023 18:43:50 +0100
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: "Luca Ceresoli via lists.openembedded.org"
 <luca.ceresoli=bootlin.com@lists.openembedded.org>
Cc: luca.ceresoli@bootlin.com, "Yan Xin Kuan" <yanxk.fnst@fujitsu.com>,
 <openembedded-core@lists.openembedded.org>, <fnstml-fujitsuten@fujitsu.com>
Subject: Re: [OE-core] [meta-oe][PATCH V1] cpio: add ptest
Message-ID: <20230207184350.2a116b4e@booty>
In-Reply-To: <17419AD8D8969177.20960@lists.openembedded.org>
References: <1667352933-9298-1-git-send-email-yanxk.fnst@fujitsu.com>
	<17419AD8D8969177.20960@lists.openembedded.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Feb 2023 17:44:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176827

Hello Yan,

On Tue, 7 Feb 2023 18:26:27 +0100
"Luca Ceresoli via lists.openembedded.org"
<luca.ceresoli=bootlin.com@lists.openembedded.org> wrote:

> Hello Yan,
> 
> On Wed, 2 Nov 2022 09:35:33 +0800
>         ^^^^^^^^^^
> 
> Not sure where this data comes from... :)
> 
> "Yan Xin Kuan" <yanxk.fnst@fujitsu.com> wrote:
> 
> > From: Yan <yanxk.fnst@fujitsu.com>
> > 
> > enable the ptest function for cpio.
> > 
> > cpio takes 1 second maybe less, so it is fast.
> > 
> > you will get ptest result like this:
> > 
> > PASS: symlink
> > SKIP: symlink-bad-length
> > ......
> > 
> > Signed-off-by: Yan <yanxk.fnst@fujitsu.com>  
> 
> Autobuilder testing with this patch generated lots of warnings:
> 
>   WARNING: cpio-2.13-r0 do_package_qa: QA Issue: File
>   /usr/lib/cpio/ptest/tests/atconfig in package cpio-ptest contains reference to TMPDIR
> 
> Here are a few logs:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/96/builds/4375/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/6685/steps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/104/builds/5526/steps/12/logs/stdio
> 
> More at:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4894

There are also reproducibility errors:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/2361/steps/13/logs/stdio

See the corresponding diffoscope results:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20230207-yei_47xv/packages/diff-html/

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

