Return-Path: <alexandre.belloni@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D58DC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Oct 2021 18:04:19 +0000 (UTC)
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.1085.1634925857765310072
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Oct 2021 11:04:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 77DA9100008;
	Fri, 22 Oct 2021 18:04:14 +0000 (UTC)
Date: Fri, 22 Oct 2021 20:04:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Alexander Kanavin <alex@linutronix.de>
Subject: Re: [OE-core] [PATCH 2/2] stress-ng: convert to git, website is down
Message-ID: <YXL9Hhw9H4hLs9jX@piout.net>
References: <20211021084059.977697-1-alex@linutronix.de>
 <20211021084059.977697-2-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021084059.977697-2-alex@linutronix.de>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Oct 2021 18:04:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157296

Hello Alex,

This makes the reproducible builds fail:

https://autobuilder.yoctoproject.org/typhoon/#/builders/119/builds/870/steps/12/logs/stdio
https://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20211022-8ziugi_1/packages/diff-html/


On 21/10/2021 10:40:59+0200, Alexander Kanavin wrote:
> Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> ---
>  meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
> index 198f7e87c7..f9dcdda0af 100644
> --- a/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
> +++ b/meta/recipes-extended/stress-ng/stress-ng_0.13.00.bb
> @@ -1,14 +1,15 @@
>  SUMMARY = "System load testing utility"
>  DESCRIPTION = "Deliberately simple workload generator for POSIX systems. It \
>  imposes a configurable amount of CPU, memory, I/O, and disk stress on the system."
> -HOMEPAGE = "https://kernel.ubuntu.com/~cking/stress-ng/"
> +HOMEPAGE = "https://github.com/ColinIanKing/stress-ng#readme"
>  LICENSE = "GPLv2"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>  
> -SRC_URI = "https://kernel.ubuntu.com/~cking/tarballs/${BPN}/${BP}.tar.xz \
> +SRC_URI = "git://github.com/ColinIanKing/stress-ng.git \
>             file://0001-Do-not-preserve-ownership-when-installing-example-jo.patch \
>             "
> -SRC_URI[sha256sum] = "1cefe4a3057c1522b146e62f61b80ce6e2e99da2d85ebe25bc03fc45228e58cd"
> +SRCREV = "61b454b4a3a9d052e63c78a9574ccf8a650575dc"
> +S = "${WORKDIR}/git"
>  
>  DEPENDS = "coreutils-native"
>  
> -- 
> 2.20.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#157277): https://lists.openembedded.org/g/openembedded-core/message/157277
> Mute This Topic: https://lists.openembedded.org/mt/86484339/3617179
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alexandre.belloni@bootlin.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

