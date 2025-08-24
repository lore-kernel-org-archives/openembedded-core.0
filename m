Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61B90CA0EEB
	for <webhook@archiver.kernel.org>; Sun, 24 Aug 2025 06:37:29 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web11.12167.1756017439478212918
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Aug 2025 23:37:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=V44+IxRm;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 139991A0666;
	Sun, 24 Aug 2025 06:37:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1E81605F1;
	Sun, 24 Aug 2025 06:37:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CD6021C22C992;
	Sun, 24 Aug 2025 08:37:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1756017437; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ObNbkqaxSELRpW5kc4vhNnmoE/S5KMNZCkDiYmOp+Mo=;
	b=V44+IxRmMn1YdL3fJQNJTPMZe78z5TQcu1vJWeMiRvjLFW4hMCPjxz1qrzqKRX6EVhEA5S
	5j9uJMHISs0/2go2olkvftiOk92txYf5lqKe3U3sshW6YXkiWqkY+suNuyXGmn1Fa/b0AL
	nRWdDfjTlBmI7wfBmDpZDdrm4/zzeS+/mKQGWZNYmwXP3hdLep/r10B+XL5o/fgv3ZZCt1
	HHhmUK4gscKMNpBzIkAXJKXyA3vCRusseggCfbEeX0vrMFd5fln8boEaJeGKAO232z3ouD
	K9jtWq4wVKLh1swo4pziYS1SYlmK34OYGGGdqFmMG52D0Z6Jhmly8PkiPzrcPQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 24 Aug 2025 08:37:15 +0200
Message-Id: <DCAG899Q8S22.1OYPXIT6S98BJ@bootlin.com>
To: <peter.kjellerstedt@axis.com>
Subject: Re: [OE-core] [PATCHv5 1/2] systemd-systemctl-native: Install
 systemd-sysv-install
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20250820134202.1412477-1-pkj@axis.com>
 <DC7WDGGBK31E.2TP4Q7QNVM9A1@bootlin.com>
 <DB5PR02MB10213ECD00D7E7E9E3F32E155EF32A@DB5PR02MB10213.eurprd02.prod.outlook.com> <DC8CK0MD1K25.3IXGO4UM4FRLI@bootlin.com> <AS8PR02MB10201B91F7032A65E7A8B98B5EF3DA@AS8PR02MB10201.eurprd02.prod.outlook.com>
In-Reply-To: <AS8PR02MB10201B91F7032A65E7A8B98B5EF3DA@AS8PR02MB10201.eurprd02.prod.outlook.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Aug 2025 06:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222361

On Fri Aug 22, 2025 at 8:29 PM CEST, Peter Kjellerstedt via lists.openembed=
ded.org wrote:
>
> I figured it out. It failed when building from sstate because even if=20
> I fixed so that the path to systemd-sysv-install wasn=E2=80=99t hardcoded=
 into=20
> systemctl, it was still hardcoded into the RPM scripts. :(
>
> I have sent updated versions of the patches that should not result in=20
> any hardcoded paths anywhere, and this time I have verified all=20
> combinations I could think of with and without sstate, and with and=20
> without sysvinit in DISTRO_FEATURES.
>
> //Peter

Hi Peter,

I confirm the build went well with the new version of your series.
Thanks!

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


