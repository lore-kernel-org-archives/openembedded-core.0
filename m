Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E330C5B559
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 10:54:29 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.30836.1749207268632388090
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 03:54:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=U6RemcoI;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DD16441CFD;
	Fri,  6 Jun 2025 10:54:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749207267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L/7YqEOTI2LOytSgJuGu+tlyH3pu5hhM3PrYaqHL1/M=;
	b=U6RemcoINuVIEKY1E97b/SaBmPvfaiB1bVb/0qiGOuUTaoSEWpNZnVIiEp8sAnRoJdc9Ru
	sPXUU25pgD8yOHxjg1Tk0ZO96N9lZDODY4gKN4OkQM1mcmHgyj0uZAsWhxOVvR/fSzh8mF
	sj6i8K4GcR13cSxx1hS5BnHfNZI3O3RdkjD7bAqcuZ93Mu/yqpXy5jMo22u4t3fFXbbiAY
	+XaWHHY407SqVKnDDuoR1X97T5P4vnavQZzQLbVVPMd/1DGxIvDiGp3bc3A7c4MFxcblZQ
	vRiUiLfBsFRUhpqxO2FIYC1JpGj7NuZd8yu5jJtaLl+/R/wbkGi5mxSnlt5FQg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 12:54:25 +0200
Message-Id: <DAFE84BBJ5UH.DKZR6CEY3A60@bootlin.com>
Subject: Re: [OE-core] [PATCH 09/16] squashfs-tools: update to 4.7
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250605153508.961682-1-ross.burton@arm.com>
 <20250605153508.961682-9-ross.burton@arm.com>
 <DAFE7LDAH0N0.IU2XT3BPBJ78@bootlin.com>
In-Reply-To: <DAFE7LDAH0N0.IU2XT3BPBJ78@bootlin.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffuhffvofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevvddvhfehgeetgfehteejuedvieevfeehhfeikeehfedvjeelleetjeeigfetieenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdihohgtthhophhrohhjvggtthdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdduvddruddthedrudehtddrvdehvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvuddvrddutdehrdduhedtrddvhedvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtoheprhhoshhsrdgsuhhrthhonhesrghrmhdrtghomhdprhgtphhtthhopehophgvnhgvmhgsvgguuggvugdqtghorhgvsehlihhsthhsrdhophgvnhgvmhgsvgguuggvugdrohhrgh
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 10:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218132

On Fri Jun 6, 2025 at 12:53 PM CEST, Mathieu Dubois-Briand wrote:
> On Thu Jun 5, 2025 at 5:35 PM CEST, Ross Burton via lists.openembedded.or=
g wrote:
>> The REPRODUCIBLE_DEFAULT option was removed in 4.7[1].
>>
>> Also clean up the tasks to be neater and more concise.
>>
>> [1] squash-tools ae9914d15293af7c596148aedd997b3058e35d9e
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>
> Hi Ross,
>
> It looks like this squashfs update breaks the build with musl:
>
> NOTE: recipe vim-tiny-9.1.1198-r0: task do_compile: Started
> ERROR: squashfs-tools-4.7-r0 do_compile: oe_runmake failed
> ...
> | In file included from compressor.c:29:
> | print_pager.h:33:25: error: unknown type name 'pid_t'
> |    33 | extern void wait_to_die(pid_t process);
> |       |                         ^~~~~
> | print_pager.h:34:25: error: unknown type name 'pid_t'
> |    34 | extern FILE *exec_pager(pid_t *process);
> |       |                         ^~~~~
> | make: *** [<builtin>: compressor.o] Error 1
> | make: *** Waiting for unfinished jobs....
> | In file included from mksquashfs_help.c:35:
> | thread.h:43:8: error: unknown type name 'pthread_mutex_t'
> |    43 | extern pthread_mutex_t thread_mutex;
> |       |        ^~~~~~~~~~~~~~~
> | thread.h:46:39: error: unknown type name 'pthread_mutex_t'
> |    46 | extern void wait_thread_idle(int tid, pthread_mutex_t *mutex);
> |       |                                       ^~~~~~~~~~~~~~~
> | make: *** [Makefile:551: mksquashfs_help.o] Error 1
> | ERROR: oe_runmake failed

Sorry, I was too quick and forgot links:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/1843
https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/1812
https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/531

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


