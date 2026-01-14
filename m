Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5979AD37E32
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 13:18:25 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9831.1768396699464915005
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Jan 2026 05:18:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=dalWOXOh;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 6812FC1F6D9;
	Wed, 14 Jan 2026 13:17:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0FE346074A;
	Wed, 14 Jan 2026 13:18:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C8EB510B681E2;
	Wed, 14 Jan 2026 14:18:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768396696; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ap0HSmZeOftlilF88oNTyuzWRRt9sk94E3Qel33WQNM=;
	b=dalWOXOhbKoAPEGYMb6zVWeIT+Y5GRO723D1ajijqdJ7Y8jcW/HK5+nT69lCO+cyuFZ9aM
	FhwblAskPR8bGr6GZNXShZnpGkZ+TWFZj5F6Ggqou/W0Ny4Zqa37UacpQGn2/rVY6WMtNS
	Fm2lwF83weQC+De2TToW9Qy2yyUV9bCRAcjMF2w/tUibOct8SKBEAKWeOB0RdKOEKe/QOd
	hsaNY/zT2KS6dXMy6bi9G2wALL0rRvlPcMcVAfxkAhUN9bC628j/t9QmUdH5rgnAtdxVQP
	doUaZR+uTdfcGt/ywf8qbGK6PNKQVhU9xzmZUbpGqx72v/xqT3FhU2bYOcEOOw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Jan 2026 14:18:15 +0100
Message-Id: <DFOCB6REM2EQ.2O1LSJOYV18PG@bootlin.com>
To: <liuyd.fnst@fujitsu.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] libcap-ng upgrade depends problem
From: "Antonin Godard" <antonin.godard@bootlin.com>
References: <TY3PR01MB10110411E2A03C12CAB153BCB9B8EA@TY3PR01MB10110.jpnprd01.prod.outlook.com> <DFOC9XA7U7FI.N5FIE3FOCY5E@bootlin.com>
In-Reply-To: <DFOC9XA7U7FI.N5FIE3FOCY5E@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Jan 2026 13:18:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229328

On Wed Jan 14, 2026 at 2:16 PM CET, Antonin Godard via lists.openembedded.o=
rg wrote:
> Hi,
>
> On Tue Jan 13, 2026 at 8:01 AM CET, Yiding Liu (Fujitsu) via lists.openem=
bedded.org wrote:
>> Hi All
>>
>> I tryed to upgrade libcap-ng from 0.8.5 to 0.9, but there is PKG_CHECK e=
rror during do_configure
>>
>> | checking for gawk... (cached) gawk
>> | ../sources/libcap-ng-0.9/configure: line 14862: syntax error near unex=
pected token `LIBBPF,libbpf,'
>> | ../sources/libcap-ng-0.9/configure: line 14862: `PKG_CHECK_MODULES(LIB=
BPF,libbpf,'
>> | NOTE: The following config.log files may provide further information.
>> | NOTE: /mnt/contribution/build_image/tmp/work/x86_64-linux/libcap-ng-na=
tive/0.9/build/config.log
>> | ERROR: configure failed
>> | WARNING: exit code 1 from a shell command.
>>
>> It seems like libbpf is needed as dependence.
>> But libbpf is in meta-oe not in oe-core.
>> Does any one has experience about this problem?
>
> This probably means that the libbpf recipe needs to be moved from meta-oe
> to openembedded-core. Can you send a series that adds this recipe first, =
and
> then updates libcap-ng?

Apologies, I just realized you sent a follow-up patch on this, so you can i=
gnore
my email.

Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


