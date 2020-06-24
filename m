Received: from mailout10.rmx.de (mailout10.rmx.de [94.199.88.75])
 by mx.groups.io with SMTP id smtpd.web10.9293.1592987897964593117
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2020 01:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.75, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout10.rmx.de (Postfix) with ESMTPS id 49sGkY1KZVz31Kn
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 10:38:13 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 49sGkX2pgJz2TTPy
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2020 10:38:12 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Wed, 24 Jun 2020 10:36:43 +0200
Received: from n95hx1g2.localnet (192.168.54.60) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 24 Jun
 2020 10:36:43 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH 2/4] eudev: Extend for native/nativesdk
Date: Wed, 24 Jun 2020 10:36:41 +0200
Message-ID: <113805642.bAF7KyEKsx@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <f8cae5c1a6395d260bd8e5aaa29d5b49d8051d17.camel@linuxfoundation.org>
References: <20200619194351.30053-1-ceggers@arri.de> <20200619194351.30053-3-ceggers@arri.de> <f8cae5c1a6395d260bd8e5aaa29d5b49d8051d17.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.60]
X-OriginalArrivalTime: 24 Jun 2020 08:36:43.0147 (UTC) FILETIME=[96A00DB0:01D64A02]
X-RMX-ID: 20200624-103812-49sGkX2pgJz2TTPy-0@kdin02
X-RMX-SOURCE: 217.111.95.7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dear Richard,

Am Freitag, 19. Juni 2020, 23:27:38 CEST schrieb Richard Purdie:
> A native eudev is a really bad idea, a nativesdk one isn't much better.
> If there are libs we need from here, then the recipe should only be
> generating those but a "native eudev" makes no sense to be needed by a
> build system.
Does v2 of my patch meet your requirements? In order to keep the recipe
simple, the full eudev is built, but only libudev is packaged at the end.

> In case I'm not being clear enough, is bitbake going to
> replace the udev/systemd from your host system at run time?
- libraries (libudev, libnm): yes
- tools (e.g. udevadm or nmcli): maybe
- daemons (udevd, networkmanager): no

"Replace" due to PATH / PKG_CONFIG_PATH variables, not really overwriting
them.

regards
Christian



________________________________
 [http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1=
.jpg] <https://microsites.arri.com/stellar/>

Get all the latest information from www.arri.com<https://www.arri.com/>, Fa=
cebook<https://www.facebook.com/TeamARRI>, Twitter<https://twitter.com/ARRI=
Channel>, Instagram<https://instagram.com/arri> and YouTube<https://www.you=
tube.com/user/ARRIChannel>.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRA 57918
Pers=C3=B6nlich haftender Gesellschafter: Arnold & Richter Cine Technik Gmb=
H
Sitz: M=C3=BCnchen - Registergericht: Amtsgericht M=C3=BCnchen - Handelsreg=
isternummer: HRB 54477
Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Neuh=C3=A4user; Stephan Schenk; Walt=
er Trauninger; Markus Zeiler
