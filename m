Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB9FEC47422
	for <webhook@archiver.kernel.org>; Fri, 26 Jan 2024 21:02:37 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web11.980.1706302952543778865
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jan 2024 13:02:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.com header.s=2017 header.b=KjyjXw0N;
 spf=pass (domain: posteo.com, ip: 185.67.36.65, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 7C03A240027
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 22:02:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1706302950; bh=0R1A3RO2mgmDcYstrSmfqa14VcM/snPFrNUY7TXEOYY=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=KjyjXw0NbmGG41AWyrbrzAtVLaOlVYy+jEOCWHvZRqwwwOs4gLWFEVuF8HVj6MHzi
	 rX0jB90R5Dsow8MfYBjWgQUWdp3bHsXjQSGa2Q7JXnp79bQ3Oh4v9XJp7qeA+wrMZx
	 fFNlKR0vOzehQL4KBnZGzBMdKp5ZrgNZHGpkH7j2Zo1l2gLRjEjKfNm2drdG8U76MB
	 7Pj9dQUM7pnemdL3NFF7FN2QY8rrUWS1oMX1WN9gTPBuzLDzu8CECmHqCghqYND5kb
	 schnCqQ4qXbO9XDTWb2d/WN+pSge8+H8BGb/3lxzVOpN8Pag8vDTSmSvyL7iXBbSYy
	 McsjTe4T1y0zQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4TM9BD5yBvz9rxG;
	Fri, 26 Jan 2024 22:02:28 +0100 (CET)
Message-ID: <f39900bb1adcc29705d883fa35073734a54a290f.camel@posteo.net>
Subject: Re: [OE-core] Future package versions
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>
To: Ross Burton <ross.burton@arm.com>, OE Core mailing list
	 <openembedded-core@lists.openembedded.org>, Yocto-mailing-list
	 <yocto@lists.yoctoproject.org>
Date: Fri, 26 Jan 2024 21:02:28 +0000
In-Reply-To: <618B0BCA-2E2C-422A-B554-421D533FB0BA@arm.com>
References: <618B0BCA-2E2C-422A-B554-421D533FB0BA@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jan 2024 21:02:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194405

On Fri, 2024-01-26 at 20:41 +0000, Ross Burton wrote:
> Hi,
>=20
> A somewhat recurring theme about this time in the release cycle is
> people asking what version of a recipe will be in the next release,
> especially more now because the next release is a LTS.
>=20
> So to avoid the relevant people repeating themselves, I=E2=80=99ve create=
d a
> wiki page:
>=20
> https://wiki.yoctoproject.org/wiki/Recipe_Versions
>=20
> There may well be a more suitable/discoverable place for this page,
> but this is better than nothing.

Hi,

how about adding a link to the page on
https://wiki.yoctoproject.org/wiki/Main_Page under Project planning.
I marked some pages as outdated there just now as well...

Simone
>=20
> Ross
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194404):
> https://lists.openembedded.org/g/openembedded-core/message/194404
> Mute This Topic: https://lists.openembedded.org/mt/103984803/8052774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> simone.p.weiss@posteo.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


