Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B61ADC5B559
	for <webhook@archiver.kernel.org>; Fri,  6 Jun 2025 10:53:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.30828.1749207228248780145
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Jun 2025 03:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ToH9xYBa;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1352432F4;
	Fri,  6 Jun 2025 10:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1749207226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ywAKgc4cjpqYPvqpt9YpHEsXbSUS1CLyRWOpmZGAc6A=;
	b=ToH9xYBa6gSKy9nZYZ0O5nM/yYRBVt8Gn+vL+sFDgt4ixY89TSKCqOvEAvdQYkHekUdSwL
	MFUKyRjcL/7GlkCWd97JtUhXDHnOIZyG5owSo2ZNOOaW97ekEmDgvtbM4OTzbj5HVe2YU5
	f4y/rvuWj5qoo/nDOL3XFOEcRmihghwjGWneDfYUrX8JlX5sVJwgu/gVFNeGtlvO0hSHts
	z2uNfCvvkFedDW2ol0HadtCokUUEnjEABIKoi6w18v1TxX7AO935YmUFCvhjHibWyhO10p
	Mt/cfHDWoVAghoKoPmWZF/sxFA+l85BtMs13xREK6uy2dkpBTaiREOmTCcM7ag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Jun 2025 12:53:44 +0200
Message-Id: <DAFE7LDAH0N0.IU2XT3BPBJ78@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <ross.burton@arm.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 09/16] squashfs-tools: update to 4.7
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250605153508.961682-1-ross.burton@arm.com>
 <20250605153508.961682-9-ross.burton@arm.com>
In-Reply-To: <20250605153508.961682-9-ross.burton@arm.com>
X-GND-State: clean
X-GND-Score: 0
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdegleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecunecujfgurhepggfgtgffkffhvffuofhfjgesthhqredtredtjeenucfhrhhomhepfdforghthhhivghuucffuhgsohhishdquehrihgrnhgufdcuoehmrghthhhivghurdguuhgsohhishdqsghrihgrnhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeeffedvjeelfeeikeefheeljeetheeuledutdehledttdegleeiffefvedvfeekvdenucffohhmrghinhepohhpvghnvghmsggvugguvggurdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvuddvrddutdehrdduhedtrddvhedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdduvddruddthedrudehtddrvdehvddphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhepmhgrthhhihgvuhdrughusghoihhsqdgsrhhirghnugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehrohhsshdrsghurhhtohhnsegrrhhmrdgtohhmpdhrtghpthhtohepohhpvghnvghmsggvugguvgguqdgtohhrvgeslhhishhtshdrohhpvghnvghmsggvugguvggurdhorhhg
X-GND-Sasl: mathieu.dubois-briand@bootlin.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Jun 2025 10:53:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218131

On Thu Jun 5, 2025 at 5:35 PM CEST, Ross Burton via lists.openembedded.org =
wrote:
> The REPRODUCIBLE_DEFAULT option was removed in 4.7[1].
>
> Also clean up the tasks to be neater and more concise.
>
> [1] squash-tools ae9914d15293af7c596148aedd997b3058e35d9e
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---

Hi Ross,

It looks like this squashfs update breaks the build with musl:

NOTE: recipe vim-tiny-9.1.1198-r0: task do_compile: Started
ERROR: squashfs-tools-4.7-r0 do_compile: oe_runmake failed
...
| In file included from compressor.c:29:
| print_pager.h:33:25: error: unknown type name 'pid_t'
|    33 | extern void wait_to_die(pid_t process);
|       |                         ^~~~~
| print_pager.h:34:25: error: unknown type name 'pid_t'
|    34 | extern FILE *exec_pager(pid_t *process);
|       |                         ^~~~~
| make: *** [<builtin>: compressor.o] Error 1
| make: *** Waiting for unfinished jobs....
| In file included from mksquashfs_help.c:35:
| thread.h:43:8: error: unknown type name 'pthread_mutex_t'
|    43 | extern pthread_mutex_t thread_mutex;
|       |        ^~~~~~~~~~~~~~~
| thread.h:46:39: error: unknown type name 'pthread_mutex_t'
|    46 | extern void wait_thread_idle(int tid, pthread_mutex_t *mutex);
|       |                                       ^~~~~~~~~~~~~~~
| make: *** [Makefile:551: mksquashfs_help.o] Error 1
| ERROR: oe_runmake failed

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


