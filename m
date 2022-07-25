Return-Path: <rpurdie@rpsys.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14469CCA473
	for <webhook@archiver.kernel.org>; Mon, 25 Jul 2022 10:52:17 +0000 (UTC)
Received: from dan.rpsys.net (dan.rpsys.net [217.169.23.60])
 by mx.groups.io with SMTP id smtpd.web12.26552.1658746333993498820
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Jul 2022 03:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@rpsys.net header.s=default header.b=YZbMxsU4;
 spf=pass (domain: rpsys.net, ip: 217.169.23.60, mailfrom: rpurdie@rpsys.net)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=rpsys.net; s=default;
	t=1658746329; bh=yZSiDcxdo6/O2aHA5lTBL3+rV17lcNLEaSe/BQIPD9c=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YZbMxsU4jcGodEpEi3pWbbbHb2Vihqpt+Yy9UzEbmKtV8pd5YLiJ7lnpyNxvOzU0u
	 QAZVKF/1UaSiGtSXASa/4ePsfazx2M6c7a+K/RuFQx056YlSJ1pjiiTdj0DRlibhRE
	 aASaUc3WWrrOwGsJ1KXTggxcnSZc3oU80saPV+44pAS+4Hn5Me1agZSJq0xhCelD9e
	 ecS0puxjnwW3G7a5CR0hYnQjTYguwUJE2LCfW/E1qYt3bNFii12gbGXCPlsqGvdklQ
	 vuMeBaUFANufwwXjRODcMxwlDON6VNFntlYzMZj24Ba22V965BqPdNebS++H7VVCP9
	 AJ1tUsmOmLP0Q==
Received: from [192.168.1.7] ([192.168.1.7])
	(authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-22ubuntu3) with ESMTPSA id
 26PAq8i03918162
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 11:52:09 +0100
Message-ID: <5d5f1e7215a9f62e142e2f6da1dc61993f4d524c.camel@rpsys.net>
Subject: Re: [OE-core] [PATCH] zlib: remove historical movement of libz.so
 to /lib
From: Richard Purdie <rpurdie@rpsys.net>
To: luca.ceresoli@bootlin.com, Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org, nd@arm.com
Date: Mon, 25 Jul 2022 11:52:08 +0100
In-Reply-To: <20220725124742.0e221c53@booty>
References: <20220722111301.2143531-1-ross.burton@arm.com>
	 <20220725124742.0e221c53@booty>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.6 at dan
X-Virus-Status: Clean
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Jul 2022 10:52:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168480

On Mon, 2022-07-25 at 12:47 +0200, Luca Ceresoli via
lists.openembedded.org wrote:
> Hi Ross,
>=20
> On Fri, 22 Jul 2022 12:13:01 +0100
> "Ross Burton" <ross.burton@arm.com> wrote:
>=20
> > Historically there's been a split between /lib for early boot and
> > /usr/lib for everything else, but with modern systems this split is
> > meaningless and incomplete. If a minimal system for early boot is
> > needed, it should be a full minimal system in a initramfs.
> >=20
> > Signed-off-by: Ross Burton <ross.burton@arm.com>
>=20
> This patch is breaking oe-selftest:
>=20
>   ERROR: Unable to find any package producing path /lib/libz.so.1
>   ...
>   AssertionError: False is not true : Could not find zlib library file
>  /lib/libz.so.1.* in libz1 package file list: ['/usr/lib/libz.so.1', '/us=
r/lib/libz.so.1.2.12']
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3880/st=
eps/15/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/3872/st=
eps/14/logs/stdio

There is a fixup for that in master-next.

Cheers,

Richard

