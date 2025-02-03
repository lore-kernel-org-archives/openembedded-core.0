Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14CD2C02192
	for <webhook@archiver.kernel.org>; Mon,  3 Feb 2025 20:05:53 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web10.98263.1738613151758492985
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Feb 2025 12:05:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=H6sF+hFy;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id C7AC8240101
	for <openembedded-core@lists.openembedded.org>; Mon,  3 Feb 2025 21:05:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1738613148; bh=P9T7g+v+R5q/WW/KDQ1lviaWJPaFkYRAQABlO1pN8dM=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=H6sF+hFy05BAMTOEIMh0VmLuOv5PtRJl3+SxY0W0OvvmwWipZvFQa5tnstApi/Unn
	 BW7dzcYhkzxJn9EuGU29w1vBTQRQg+8ucMUMCGVNTGE7vbQcNZ8RhZjpBAM5LLm+K+
	 5QajIxafag6N0XDUOA9CzEPLPxnzcM2pjxZEgwpFPXpbJDnLzJdHaJZ6b/sTII7CHL
	 SoYprn65wpzYap5xN0NWPFAR38ioZ0g+8cj4HW4lC2LqCi5AiGhhr2+rgdioALRaay
	 phr0RFWyrKEiJ3BB+w3L7gJ6azQT4p/EV129kz0sNaC5uzUWbM84Ojo3WiU+yXniiW
	 ecH+HmJfGwbjQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YmyDC64Dmz6ty1;
	Mon,  3 Feb 2025 21:05:47 +0100 (CET)
Message-ID: <cfabe20bdd59186d8e4987ad4446493322dadb1c.camel@posteo.net>
Subject: Re: [OE-core] [AUH] libadwaita: upgrading to 1.6.4 FAILED
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: auh@yoctoproject.org, openembedded-core@lists.openembedded.org
Date: Mon, 03 Feb 2025 20:02:47 +0000
In-Reply-To: <01010194c1abfff4-e55a6603-ee24-4bd2-b9ab-6d041246d254-000000@us-west-2.amazonses.com>
References: 
	<01010194c1abfff4-e55a6603-ee24-4bd2-b9ab-6d041246d254-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Feb 2025 20:05:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210733

On Sat, 2025-02-01 at 13:21 +0000, Auto Upgrade Helper via
lists.openembedded.org wrote:
> Hello,
>=20
> this email is a notification from the Auto Upgrade Helper
> that the automatic attempt to upgrade the recipe(s) *libadwaita* to
> *1.6.4* has Failed(do_compile).
>=20
> Detailed error information:
>=20
> do_compile failed
>=20
>=20
Hi, looked into the compile issue, it is coming down to this issue

| Program sassc found: NO

Which now occurs because in [1] the handling wrt to pre build artifacts
changes. One could fix this issue by depending on sassc, which is in
meta-oe only though. I want to ask to move it if ok.

Simone

[1]
https://gitlab.gnome.org/GNOME/libadwaita/-/merge_requests/1345/diffs?commi=
t_id=3Dcfed18f13b1801493532ea415cb1d6ed3a351c0d


