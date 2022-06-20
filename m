Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC616C43334
	for <webhook@archiver.kernel.org>; Mon, 20 Jun 2022 10:55:46 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web08.28897.1655722542992883043
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jun 2022 03:55:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=LXSnTKcX;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1655722543;
  x=1687258543;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=54ik3S1xy7apCIiJXgFxrqKha9UyplQxlgYMCjz1cOY=;
  b=LXSnTKcXToe8xzR+BCzicgnyJF76Y4pzw/GPLkLQeukMOv4r2aHUa7ev
   Pby27nR4+vPDhVTvy2sXBE/AB0XGU6gy+e+IZMPdlwEuVoWeXsLbVnX0F
   97Eu7Uf2ovvyfSQDXscUgN1nIgCzEcM2JCsA9Y/WzgUiKPhkCgwccSrXG
   K/OQaEjVs/nX1ST9etKRIQMZYs6oltRE6f9gBHfV6ghdyHBUukiLe9XK0
   aRnjMArF0cUKlTtL1PrO34UzqdCUIgqL93J16zyT+SegnxEqL5R7KRwWe
   LfnaJSpX7kV/DRBu3R+8RlJvXneNx0bGJUgrlLTsdf+ve0GWoqkV5XHtD
   A==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>, Qorin Qorinna
	<qorin.qorinna@nl.abb.com>
CC: Qorin Wu <qorin.wu@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: RE: [OE-core] [PATCH] add missing normalize-resolvconf file since it
 has been moved to a separate file since version 1.90
Thread-Topic: [OE-core] [PATCH] add missing normalize-resolvconf file since it
 has been moved to a separate file since version 1.90
Thread-Index: AQHYhHzvbYnr1cHzwkWpds5h5k7ghK1X43OAgAAp0d2AAA2PsA==
Date: Mon, 20 Jun 2022 10:55:40 +0000
Message-ID: <5a4ce3d633c64756aab5e3987b1668ea@axis.com>
References: <20220620080820.10211-1-qorin.wu@gmail.com>
	<20220620112027.4ed71759@booty>
	<AM0PR06MB4625172F0F099B35BB980A7BD9B09@AM0PR06MB4625.eurprd06.prod.outlook.com>
 <20220620114955.61d67615@booty>
In-Reply-To: <20220620114955.61d67615@booty>
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
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jun 2022 10:55:46 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167091

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Luca Ceresoli via
> lists.openembedded.org
> Sent: den 20 juni 2022 11:50
> To: Qorin Qorinna <qorin.qorinna@nl.abb.com>
> Cc: Qorin Wu <qorin.wu@gmail.com>; openembedded-
> core@lists.openembedded.org
> Subject: Re: [OE-core] [PATCH] add missing normalize-resolvconf file sinc=
e it has been moved to a separate file since version 1.90

It is expected that the subject line is prefixed with the recipe name.
It is also a very long subject line. Better would be to move half of=20
it to the commit message body, e.g.:

resolvconf: Install missing normalize-resolvconf file

It was moved to a separate file in version 1.90.

> Hi Qorin,
>=20
> On Mon, 20 Jun 2022 09:24:22 +0000
> Qorin Qorinna <qorin.qorinna@nl.abb.com> wrote:
>=20
> > Hi Luca,
> >
> > it's because the normalize-resolvconf requires sed.
> >
> > These are the error messages that I got when I built the package w/o se=
d
> > ERROR: resolvconf-1.91-r0 do_package_qa: QA Issue: /lib/resolvconf/norm=
alize-resolvconf contained in package resolvconf requires /bin/sed, but no =
providers found in RDEPENDS:resolvconf? [file-rdeps]
> > ERROR: resolvconf-1.91-r0 do_package_qa: Fatal QA errors were found, fa=
iling task.
>=20
> I see. In this case it would be nice to add either a line to the commit
> message or a comment in the .bb file, just to avoid others to wonder
> why sed is needed.

The problem here is that sed is provided by busybox and in almost all=20
cases you do not want an explicit dependency on sed as that instead will=20
install the sed program from the sed recipe.=20

In this case I would recommend to add something like this:

# The normalize-resolvconf sed script uses /bin/sed on the shebang line.
# Ignore the file-rdeps test to avoid having to add a runtime dependency on=
 sed.
INSANE_SKIP:${PN} +=3D "file-rdeps"

> I added a line to the commit message on my branch that I'm going to
> test. It would be great if you could do so for future patches. Thanks!
>=20
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

//Peter


