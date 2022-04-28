Return-Path: <richard@nod.at>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6B0FC433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 20:01:10 +0000 (UTC)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by mx.groups.io with SMTP id smtpd.web08.1718.1651176061882772944
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 13:01:02 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror, err=syntax error for token:  (domain: nod.at,
 ip: 195.201.40.130, mailfrom: richard@nod.at)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id B53666081112;
	Thu, 28 Apr 2022 22:00:58 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id t5_uiEDGVPlO; Thu, 28 Apr 2022 22:00:58 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 20076605DEA8;
	Thu, 28 Apr 2022 22:00:58 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5wHGuNWqMPDw; Thu, 28 Apr 2022 22:00:58 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C7D536081112;
	Thu, 28 Apr 2022 22:00:57 +0200 (CEST)
Date: Thu, 28 Apr 2022 22:00:57 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Sean Anderson <sean.anderson@seco.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	richard purdie <richard.purdie@linuxfoundation.org>,
	Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <502187443.5267.1651176057193.JavaMail.zimbra@nod.at>
In-Reply-To: <20220426185422.3225421-1-sean.anderson@seco.com>
References: <20220426185422.3225421-1-sean.anderson@seco.com>
Subject: Re: [PATCH] wic: Add dependencies for erofs-utils
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF97
 (Linux)/8.8.12_GA_3809)
Thread-Topic: Add dependencies for erofs-utils
Thread-Index: 0lVXwE0R9kqQbejc641XkUvVmUj4PA==
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 20:01:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164974

----- Urspr=C3=BCngliche Mail -----
> Von: "Sean Anderson" <sean.anderson@seco.com>
> In order to build erofs filesystems, wic must have the erofs-utils
> package installed into its sysroot.
>=20
> Fixes: 30375ce97 ("Add support for erofs filesystems")
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>

Reviewed-by: Richard Weinberger <richard@nod.at>

Thanks,
//richard

