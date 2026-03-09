Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F206EF36E8
	for <webhook@archiver.kernel.org>; Mon,  9 Mar 2026 06:56:20 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8490.1773039373496853377
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Mar 2026 23:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=UzzGB4LX;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B5F3DC4286F
	for <openembedded-core@lists.openembedded.org>; Mon,  9 Mar 2026 06:56:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 43CAA5FFB8;
	Mon,  9 Mar 2026 06:56:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4DA1010369906;
	Mon,  9 Mar 2026 07:56:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773039370; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iBuGdV5gK23XcuL5KIOl15w9BZwH32/Lnwq2U73LDBM=;
	b=UzzGB4LXZgXcJlcMz1giKqwpnP8QkMrVYdtl8uZmuEdvqMM3ELjf9uIbDIgdonAVErACWd
	DD4nKLj+tu2CpbM4uX3+Ih3fC2yIYVubSYi8W+Rt8HnsBFsVa53b48PidFeQG8sspU2LXv
	EpLGGdopN/ehpf4CcTb7rHoK/hxc7IYkDyKBuIzeTlx8b+cPjnJ/rSiNAnoxz38FYS3/pf
	WynwORyj92j8RnfY3uYf1RShOG5puhRMb2Cmt4hEjEUzIkhgjSyANor2iBcreIHHzPtEjQ
	7KWRNWlnJJ2tfDtlq7XVKzputU2eitdQXiPZoPnEilMZXsf6SIKP7nfNHOzVQQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 07:56:07 +0100
Message-Id: <DGY200N2IVAT.31AXPCZZ9K6JG@bootlin.com>
Cc: <Sundeep.Kokkonda@windriver.com>, <Randy.MacLeod@windriver.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <Hemanth.KumarMD@windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH v2 2/7] gettext: Upgrade 0.26 -> 1.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20260308150834.2508331-1-Hemanth.KumarMD@windriver.com>
 <20260308150834.2508331-2-Hemanth.KumarMD@windriver.com>
In-Reply-To: <20260308150834.2508331-2-Hemanth.KumarMD@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Mar 2026 06:56:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232677

On Sun Mar 8, 2026 at 4:07 PM CET, Hemanth Kumar M D via lists.openembedded=
.org wrote:
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---

Hi Hemanth, Randy,

Thanks for the upgrade.

We have some ptest failures here:

Failed ptests:
{'gettext': ['autopoint-1', 'autopoint-2']}


https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/1202
https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/3207
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/3237

Ptest logs can be found here:

https://valkyrie.yocto.io/pub/non-release/20260308-104/testresults/qemurisc=
v64-ptest/core-image-ptest-gettext/
https://valkyrie.yocto.io/pub/non-release/20260308-104/testresults/qemuarm6=
4-ptest/core-image-ptest-gettext/
https://valkyrie.yocto.io/pub/non-release/20260308-104/testresults/qemux86-=
64-ptest/core-image-ptest-gettext/

Can you have a look at these?

In some of these logs, I can also see some failures related to glib-2.0.

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


