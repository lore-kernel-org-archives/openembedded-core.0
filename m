Return-Path: <mathieu.dubois-briand@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECA9CCD18E
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 08:51:21 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web11.11137.1760518277625013477
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 01:51:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=v9rpicJm;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: mathieu.dubois-briand@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4AEF14E410CE;
	Wed, 15 Oct 2025 08:51:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 218ED606F9;
	Wed, 15 Oct 2025 08:51:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37AB6102F22C5;
	Wed, 15 Oct 2025 10:51:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760518275; h=from:subject:date:message-id:to:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=4pinyHcrhy1PjMjGfgvrB1kkefk8IAd5NwDMmN8WG9E=;
	b=v9rpicJmyHus0jV2E9ag99P2k2O4LjDtULzwRNtQhSSe3Ct5hvs0nAiUALZgBRMOoDX/Ho
	lTtbSy8lBhEtgt422TPi9Ag9zYsCoCnzNnxPIYMTeCGw1eABU86NdU5Bel8nwoTMqjONAm
	BZsfJkzoFN5Hqw59VUduGz86Dp3WUjjVSOiSzocYazzGmz2uIcqN6+xMadYrUYls7/rY3z
	i5gf7TdSwQdXZtXDh6dtIFa+I11hw9sg56MX6PtPYepRj0myHCReFKrNbyLnSoXf1FxCDA
	lkQCBVGpLKtaX9oAzo/fsPO1vRTqFOC5vHuDWazpk9RYUJOj5w+jlZJeOhIM5Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 15 Oct 2025 10:51:14 +0200
Message-Id: <DDIRN5Z2AH2A.3T8EAN0PXBBX2@bootlin.com>
From: "Mathieu Dubois-Briand" <mathieu.dubois-briand@bootlin.com>
To: <hongxu.jia@eng.windriver.com>,
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 3/3] libxml2: upgrade 2.14.6 -> 2.15.0
X-Mailer: aerc 0.19.0-0-gadd9e15e475d
References: <20251014065842.2919308-1-hongxu.jia@windriver.com>
 <20251014065842.2919308-3-hongxu.jia@windriver.com>
In-Reply-To: <20251014065842.2919308-3-hongxu.jia@windriver.com>
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 08:51:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224886

On Tue Oct 14, 2025 at 8:58 AM CEST, hongxu via lists.openembedded.org wrot=
e:
> Due to upstream [Remove LZMA support][1], drop option --without-lzma
>
> [1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/1763281cd65ded4067ddf=
123eb7358690c214b0b
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---

Hi Hongxu,

Thanks for the update.

It looks like this is breaking the build of itstool:

ERROR: itstool-native-2.0.7-r0 do_configure: Execution of '/srv/pokybuild/y=
octo-worker/musl-qemux86/build/build/tmp/work/x86_64-linux/itstool-native/2=
.0.7/temp/run.do_configure.2360372' failed with exit code 1
...
| configure: error: Python module libxml2 is needed to run this package

Can you have a look at this please?

Thanks,
Mathieu

--=20
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


