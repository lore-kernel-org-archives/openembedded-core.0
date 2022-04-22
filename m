Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA63C54EC5
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:01 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.7599.1650629492648678133
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Apr 2022 05:11:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=poCI4Ut6;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1650629493;
  x=1682165493;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eNpBLSI9J4773TyiESU4lQ20r+IQyPu+YLDph2VcH3c=;
  b=poCI4Ut6TEwLgHvM13BjNHCQb4a6bOYykXKghgLWDgzGH0lO2EJK/FBy
   EfnWKuDwt1YHb4yEbOJKjZauAyzV8v/2rYjZhHhTZLE5uIfYzO7/xFq37
   Hc1Rsqb2+D8pSMBEZl1a29WWN/sDSIsweYmXSt7uG7HKV/DZjjCoRcEoD
   8tyCL8f83LQwue3kae4tFjM/Z0r3mj2WYa6h8qgHujJ+MDnVflKs7REII
   SKqdA5rpj/ED/hkV78vp2vaF087NdzNF/JTKOoY+at1ast0HDLQQCFmqL
   sCXgKkFtl+FeJPUIXAaOXaw7bgXtXIfloFcR+9dWBgvNeMHYf1XpfHDJB
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Matthias Klein <matthias@extraklein.de>, "luca.ceresoli@bootlin.com"
	<luca.ceresoli@bootlin.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core][PATCH] gpsd: bugfix: add gps-utils-python to PACKAGES
Thread-Topic: [OE-core][PATCH] gpsd: bugfix: add gps-utils-python to PACKAGES
Thread-Index: AQHYViOv6OJWFBsWdkyl5N15805T36z7kYwAgAAThQCAADJBoA==
Date: Fri, 22 Apr 2022 12:11:30 +0000
Message-ID: <ec22ff42e6cb4aa6b42d64f307d214ad@axis.com>
References: <20220422083247.1322-1-matthias@extraklein.de>
 <20220422115938.776ffbd6@melee>
 <25c9ad816e7fbda2286eb0c8d5bed4cd@extraklein.de>
In-Reply-To: <25c9ad816e7fbda2286eb0c8d5bed4cd@extraklein.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Apr 2022 16:52:01 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164788

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Matthias Klein
> Sent: den 22 april 2022 13:10
> To: luca.ceresoli@bootlin.com
> Cc: openembedded-core@lists.openembedded.org
> Subject: Re: [OE-core][PATCH] gpsd: bugfix: add gps-utils-python to
> PACKAGES
>=20
> Hello Luca,
>=20
> > This file is not in oe-core. This patch should be sent to the meta-oe
> > mailing list.
>=20
> Done: https://lists.openembedded.org/g/openembedded-devel/message/96734
>=20
> Best regards,
> Matthias

Heh, now there are three variants of that fix on the openembedded-devel=20
list (mine being a little bit more complete as it also removes a comment=20
that is no longer needed). ;)

//Peter


