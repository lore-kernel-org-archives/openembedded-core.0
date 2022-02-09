Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 219D3C433EF
	for <webhook@archiver.kernel.org>; Wed,  9 Feb 2022 13:27:53 +0000 (UTC)
Received: from esa1.hc324-48.eu.iphmx.com (esa1.hc324-48.eu.iphmx.com
 [207.54.68.119])
 by mx.groups.io with SMTP id smtpd.web12.26341.1644413270295409068
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Feb 2022 05:27:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@bmw.de header.s=mailing1
 header.b=M+zxuZfx;
 spf=pass (domain: bmw.de, ip: 207.54.68.119,
 mailfrom: prvs=03290f32f=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1644413271; x=1675949271;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=1X5bHf+F08SLzrFB/XcJRF5nRRAcqOSzFb2G214TjfI=;
  b=M+zxuZfxiBpw9diu8KtUNMafzQdAen3Qr/7sd7UV3sTsy2jPaWZmTexo
   Or64eirYP2GGQm92A/QXLLTdNcQknSMsOMRHRKcgIJ2jx3WjfJquzFEQh
   cHjM/itgLOe34lDXh1PGedVm3+jUiHG70lCci/i/jBefXygN1eJ8HzFCx
   I=;
IronPort-SDR: 
 44JMKRERI8jisgDd0+hpWROCz5TlhbJwqj2JDf05V+jR0FTcJ4qfBIY3tg2yTtO1MIWg0RZIUD
 8vMVkEjUFdu6RzncJl4ZiD59+pGyjBX4PG0XwGciPRm9tLmT1VMjm51wZ8umkn+HsTqcS1YPSI
 u9gYCQENit05dbJl16OXhRevD0z5ldCRaPxJgDzO/6Gn/DyeWJXoGwZsrVti2hIq4FEQkRLQuC
 SUVOEdlVP91OxOBJYga0KxfPUSAqZ316AlcR+K4D1HrOklX6DBcnHuvCXMNBcM/v4Kv39S9WXf
 l+b1zxqsj9FvA94W1dFqr5bx
Received: from esagw4.bmwgroup.com (HELO esagw4.muc) ([160.46.252.39]) by
 esa1.hc324-48.eu.iphmx.com with ESMTP/TLS; 09 Feb 2022 14:27:46 +0100
Received: from esabb6.muc ([160.50.100.50])  by esagw4.muc with ESMTP/TLS;
 09 Feb 2022 14:27:46 +0100
Received: from smucm33l.bmwgroup.net (HELO smucm33l.europe.bmw.corp)
 ([160.46.167.68])
 by esabb6.muc with ESMTP/TLS; 09 Feb 2022 14:27:47 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33l.europe.bmw.corp
 (160.46.167.68) with Microsoft SMTP Server (TLS;
 Wed, 9 Feb 2022 14:27:46 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.026; Wed,
 9 Feb 2022 14:27:46 +0100
From: <Mikko.Rapeli@bmw.de>
To: <richard.purdie@linuxfoundation.org>
CC: <sanakazisk19@gmail.com>, <openembedded-core@lists.openembedded.org>,
	<ranjitsinh.rathod@kpit.com>
Subject: Re: [OE-core] [poky][master][PATCHv2] buildhistory.bbclass: Enable
 exporting more recipe and package data
Thread-Topic: [OE-core] [poky][master][PATCHv2] buildhistory.bbclass: Enable
 exporting more recipe and package data
Thread-Index: AQHYHZe441HnQYeLLEqDuYqPBGkeZayLE8mAgAAR5wA=
Date: Wed, 9 Feb 2022 13:27:46 +0000
Message-ID: <YgPBUKU8qutnuI8I@korppu>
References: <20220209092947.25677-1-sanakazisk19@gmail.com>
 <c2d76693b74d961e97ef38470dad1f60c425f889.camel@linuxfoundation.org>
In-Reply-To: 
 <c2d76693b74d961e97ef38470dad1f60c425f889.camel@linuxfoundation.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <8A306134BF103646AC68DC5945A4D5A1@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Feb 2022 13:27:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161557

Hi,

On Wed, Feb 09, 2022 at 12:23:39PM +0000, Richard Purdie wrote:
> People have requested changes like this before and I rejected it as I'm w=
orried
> that allowing people to customise this code will just fork the project in=
to many
> different directions.=A0

It's the other way round. There are a lot of needs to extract metadata from
build system into something where reports can be generated. I'd prefer this=
 to
be buildhistory as it also tracks progress across releases and versions and=
 custom
builds if the setup has been done correctly. If this change isn't going to =
be accepted,
projects need to continue with their custom patches on top of current build=
history
bbclass in poky.

> The elif block above illustrates part of my concern since it still isn't =
scaling
> well and just potentially makes every buildhistory output difference (eve=
n with
> different ordering). There are reasons the data is taken from pkginfo rat=
her
> than getVar too and I think this could introduce subtle bugs in the futur=
e.

The elif block is just for backwards compatibility. Changing the order of f=
ields would
be annoying in buildhistory. The new ones will be in alphabetical order so =
I don't
think this is so bad. It is possibly to completely rewrite and simplify bui=
ldhistory
but this would be annoying for users who actually track the changes.

> Which variables are you actually interested in when changing this?

LICENSE, CVE_PRODUCT, SRC_URI, MAINTAINER and some project specific variabl=
es too.
It is very useful to have these tracked in buildhistory git repo where diff=
erences
between releases can easily be seen.

Cheers,

-Mikko=

