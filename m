Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42E78CF9C6F
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 16:22:25 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.18585.1727194940926550968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Sep 2024 09:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=Jo1jLBWp;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 00134240101
	for <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 18:22:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1727194938; bh=qK24hAs6Y2RBK0lThWfYBzq/HjOkZKf77fH69ye7Ayc=;
	h=Message-ID:Subject:From:To:Cc:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=Jo1jLBWpvtgw8YOu8kvMhHwTYjNrZ04t/JGhDxdCgxMvp4uX4ieikjy9/tA06B5WT
	 NVlwKkjXfkuIzGrG/rYOwscrYCQiS+6WdFBSUdzgJnsFrfD/Xt1kgMvNiuRM6zQUGC
	 I/jPvscK9S2sLZ9Lvl60AP0X4/5IODqoPzYrxdQFwNfemEGY4d6CN/vg/XBqVLprQX
	 VKi8Agu94QDwGSzKJIUJQtHzfGgP9jm/5yI1+SGqw1egGRCAIPz0Z2JnnbaKLbpDCN
	 nOrXF0octJrZ5oPJyn3eLS3M1qnWYVnP0ViNoFbuAKyzvnhJa/FAhseq6CfPW6QzRb
	 sRVFJTWBkHrnw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4XClWF4mNQz9rxL;
	Tue, 24 Sep 2024 18:22:17 +0200 (CEST)
Message-ID: <8e16c978721bd5b62ccd385e918e3675e6e4418e.camel@posteo.net>
Subject: Re: [OE-core] [AUH] gnutls: upgrading to 3.8.7.1 FAILED
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>, Auto
	Upgrade Helper <auh@yoctoproject.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2024 16:22:17 +0000
In-Reply-To: <17F5D6D545773F97.13829@lists.openembedded.org>
References: 
	<01010191f61ade2d-97c5199c-2106-43da-9e43-90c50a8a408f-000000@us-west-2.amazonses.com>
	 <17F5D6D545773F97.13829@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Sep 2024 16:22:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204877

On Mon, 2024-09-16 at 21:30 +0000, Simone Wei=C3=9F wrote:
> On Sun, 2024-09-15 at 14:34 +0000, Auto Upgrade Helper wrote:
> > Hello,
> >=20
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe(s) *gnutls* to
> > *3.8.7.1* has Failed(do_compile).
> >=20
> > Detailed error information:
> >=20
> > do_compile failed
>=20
> Issue is caused by this
> commit:
> https://gitlab.com/gnutls/gnutls/-/commit/3e5be1315a15ac6e1e33e08f28030b
> 8215b6d234
>=20
> Will look for a solution
>=20
I was able to build gnutls again by adding a recipe for dlwrap. But that
in turn depended on a adding clang. See also here
https://github.com/ueno/dlwrap/blob/main/.github/workflows/rust.yml#L30C15-=
L30C84

Any suggestions or usual approaches in such a case?

Thanks,
Simone

