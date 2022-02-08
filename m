Return-Path: <mikko.rapeli@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C98C433EF
	for <webhook@archiver.kernel.org>; Tue,  8 Feb 2022 09:07:47 +0000 (UTC)
Received: from esa3.hc324-48.eu.iphmx.com (esa3.hc324-48.eu.iphmx.com
 [207.54.68.121])
 by mx.groups.io with SMTP id smtpd.web08.8992.1644311265069956456
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Feb 2022 01:07:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=K5El7Kp3;
 spf=pass (domain: bmw.de, ip: 207.54.68.121,
 mailfrom: prvs=031a76740=mikko.rapeli@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1644311265; x=1675847265;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=pUjLKHhM90bzGAUWU+Qff/bdqYaBHXAzQk2BITZ/8F8=;
  b=K5El7Kp3QrNIaiMIAQ4PWit0pakJuZJouRW8+OhDHfBXxi+HL+P+GyVw
   IU7tWTBJVt17/aj9hWSkWhAm9Gol1zgyGaxPbGHe+vxYG00NNn1ccj694
   6LgQFQz3Sit52Z9PGE8vCjILNxmR9itUwx4xGVnAzq/WlVTgYstEDOCLC
   k=;
IronPort-SDR: 
 FkIxJE5llpEt0EwinxQiQRer+4My+vkUyvhXOkA+GIQj8Y6ZlSGk5JTAdWrqpWyuRE8+1afdwV
 +VyBT3AazWuAAdFAlnZjK5PZDK7qaT+7NsDAOKBh7mlQ4+RMHleUWWOQTUFncgvqxiKCUFddcM
 OnI6Dh7MB0tsr2CIvdUp5g0IQw46IVoM5Kb+hxpFkpvoYUbG5HMYRiROb/kB+0ZBmRROnqRAhR
 9yJt+n6dDjgMbZYszZygduxC/krjRIvkqFjinljz0d1VkKheToTdQdG3L2WmcSRnZpPmXE27Ri
 kD+L+P1d6xuUZ+Zfye1X+FX9
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa3.hc324-48.eu.iphmx.com with ESMTP/TLS; 08 Feb 2022 10:07:41 +0100
Received: from esabb3.muc ([160.50.100.30])  by esagw1.muc with ESMTP/TLS;
 08 Feb 2022 10:07:42 +0100
Received: from smucm33m.bmwgroup.net (HELO smucm33m.europe.bmw.corp)
 ([160.46.167.69])
 by esabb3.muc with ESMTP/TLS; 08 Feb 2022 10:07:42 +0100
Received: from smucm33l.europe.bmw.corp (160.46.167.68) by
 smucm33m.europe.bmw.corp
 (160.46.167.69) with Microsoft SMTP Server (TLS;
 Tue, 8 Feb 2022 10:07:41 +0100
Received: from smucm33l.europe.bmw.corp ([160.46.167.68]) by
 smucm33l.europe.bmw.corp ([160.46.167.68]) with mapi id 15.00.1497.026; Tue,
 8 Feb 2022 10:07:41 +0100
From: <Mikko.Rapeli@bmw.de>
To: <jeanbouch418@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Package revision
Thread-Topic: [OE-core] Package revision
Thread-Index: AQHYHHkIyFqaRhlPnEaa9Vu99E4c0ayJTO6A
Date: Tue, 8 Feb 2022 09:07:41 +0000
Message-ID: <YgIy25oxLbkTU7eZ@korppu>
References: <HSvl.1644275900393526587.WGPn@lists.openembedded.org>
In-Reply-To: <HSvl.1644275900393526587.WGPn@lists.openembedded.org>
Accept-Language: en-US, de-DE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
Content-Type: text/plain; charset="us-ascii"
Content-ID: <4FD524CB9DF220459D25051CDEF0DCF9@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Feb 2022 09:07:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161486

Hi,

On Mon, Feb 07, 2022 at 03:18:20PM -0800, jbouchard wrote:
> I was wondering why the package revision are not increasing when a patch =
is apply to other project source, like this commit https://git.openembedded=
.org/openembedded-core/commit/?h=3Dhonister&id=3D2d3c5b078feb34cb729902292d=
2805c9288ebc4c. Most distribution tend to increase the package revision whe=
n such changes occur. This help to track vulnerability and bugs. I know CVE=
_CHECK can deal with CVE, but it is hard to track with external software.

Yocto is different from other Linux distributions. There is no binary compa=
tibility
between binary packages. Every single yocto build can break everything in c=
ompatibility.
Thus recipe version numbers don't matter that much, and it's not important =
to update
them as long as the major version number is matching to the SW component wh=
ich is used.

As user of yocto, you can configure yocto build system to produce unique an=
d monotonically
increasing binary package version numbers using prserv. This will update PR=
 when ever recipes
are recompiled.

https://www.yoctoproject.org/docs/current/mega-manual/mega-manual.html#work=
ing-with-a-pr-service

For CVE checks, the metadata in CVE patches marks the issues as patched whe=
n yocto internal
CVE checker is used. External CVE security issue detection tooling must tak=
e into account
the patches which have already been applied. Any tooling will be useless if=
 they don't take
this into account. For security analysis work, it is best to follow what yo=
cto upstream
maintainers do and use the same tooling as the basis, then maybe add your c=
ustom stuff
on top, or in best case contribute things back to the project. It's quite a=
 bit of work
to maintain a large yocto based Linux distro well so you are better off if =
you work
with the community and maintainers there.

Cheers,

-Mikko=

