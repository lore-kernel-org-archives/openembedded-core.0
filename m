Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166CAD6AAF6
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 17:39:31 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2173.1775151560600380714
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 10:39:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=qSSZ+IyL;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 65B9C4E428BE;
	Thu,  2 Apr 2026 17:39:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 21E6B602CD;
	Thu,  2 Apr 2026 17:39:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 73D5410450136;
	Thu,  2 Apr 2026 19:39:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775151557; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=xcOwnTqTl0OYXr79By+TdjqCHGE0jUG7z0NgRRRppKw=;
	b=qSSZ+IyLAeUtn0ZBK+8hW4r2Hj+MUKZDaDQQF300R6s7WMHuM8bNMSyRxQeT1/lkzz1ZlF
	BKsTb9FvU5TGZv9X4s7ZtV3MrnO9InneDbn4ZI3r/WCX4gkGMlDK16EG2nJUvQkjBgE41h
	cOcW2Ta13tv0MCwj0rGdIHWBYouGm/7sU8mEAz1W8Z7J+/zrHVFcqVvLgqGEjgTlHTLC9p
	mXuS/faGn0/7b16W8S3bE9jfBVWd+KwGeXIBHF4ho3G0+uu2950uROssBbj3XPsjr3PGvt
	k2tWl6TswdxbNnZ3dAl1p9yrK837wW/SBS/JsOTK+kPTmcpkTgyEAyDB6aUQYA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 02 Apr 2026 19:39:14 +0200
Message-Id: <DHIUPHZ23X2B.3QKIWJ5KM2Y92@bootlin.com>
Subject: Re: [oe-core][PATCH] iptables: Use update alternatives for
 "ebtables"
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <xiao.zhang@windriver.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260402134959.2559444-1-xiao.zhang@windriver.com>
In-Reply-To: <20260402134959.2559444-1-xiao.zhang@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 17:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234550

On Thu Apr 2, 2026 at 3:49 PM CEST, ZhangXiao via lists.openembedded.org wr=
ote:
> The ebtables utility can be provided by both ebtables and iptables
> packages. Set higher priority for the version provided by iptables
> to prefer it.
>
> Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
> ---

Hi Zhang,

Thanks for your patch.

We can see this warning on the autobuilder:

WARNING: iptables-1.8.13-r0 do_package: iptables: alternative target (/usr/=
sbin/ebtables or /usr/sbin/ebtables.iptables) does not exist, skipping...
...
WARNING: iptables-1.8.13-r0 do_package: iptables: NOT adding alternative pr=
ovide /usr/sbin/ebtables: /usr/sbin/ebtables.iptables does not exist
WARNING: iptables-1.8.13-r0 do_package: iptables: alt_link =3D=3D alt_targe=
t: /usr/sbin/ebtables =3D=3D /usr/sbin/ebtables

https://autobuilder.yoctoproject.org/valkyrie/#/builders/11/builds/3484
https://autobuilder.yoctoproject.org/valkyrie/#/builders/50/builds/3548

Can you have a look at the issue?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


