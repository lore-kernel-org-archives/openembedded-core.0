Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27E1EC54E60
	for <webhook@archiver.kernel.org>; Sun, 17 Mar 2024 17:20:48 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.23461.1710696040457854967
 for <openembedded-core@lists.openembedded.org>;
 Sun, 17 Mar 2024 10:20:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=ViqSSWpk;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id B0D1C240103
	for <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 18:20:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1710696038; bh=DRlP1MdXbEVT2Zeeim2E5fOTwTq8DKG4PR78MH8ItHw=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=ViqSSWpkkacgHMeYQ5PwGeS2NcaW99LcnRjorM7XBhU0ou0UHw26KOKYaMmHqXf80
	 6ZO6wo6tqLdBkaIiH85O0r8JMnvnagHPGRPlxzRTLchb+tln/DoovHk51QH48k4tQx
	 AIRqqzA20dWtBKMjPCyqQVyLFfdY0fb9kRhqz0uSiyYNKNUReg6PIa2eA/jn75ao1j
	 6zuaiycs5Sx9p3G7fuc48xntXgTwihddolQujdJqk4VDrl+46XAGRvpP9eY1P4St0M
	 ohc7v5TZOy1ChbRNF6iQJT11y4RGZmHc/Qxdm9q3OHoQt3UyX2DSf7VUx85RIAm8q6
	 OD4fWUnWinvFQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TyPrj1wQbz6twC;
	Sun, 17 Mar 2024 18:20:37 +0100 (CET)
Message-ID: <84ddd278be0355b531aa82bba4e0ee796bc90bb3.camel@posteo.net>
Subject: Re: [yocto-security] OE-core CVE metrics for master on Sun 17 Mar
 2024 01:00:01 AM HST
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: Steve Sakoman <steve@sakoman.com>, 
	openembedded-core@lists.openembedded.org, 
	yocto-security@lists.yoctoproject.org
Date: Sun, 17 Mar 2024 17:20:36 +0000
In-Reply-To: <20240317111744.82243106914@builder.sakoman.com>
References: <20240317111744.82243106914@builder.sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 17 Mar 2024 17:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197267

On Sun, 2024-03-17 at 01:17 -1000, Steve Sakoman wrote:
> Branch: master
>=20
> New this week: 0 CVEs
>=20
> Removed this week: 0 CVEs
>=20
> Full list:=C2=A0 Found 37 unpatched CVEs
....
>  CVE-2023-7216 (CVSS3: 5.3 MEDIUM): cpio=20
Hi, checked all the upstream developments, no news at all this week,
besides that this is now definitely rejected as expected behavior by the
maintainer. I have pinged NIST about that.

Simone


