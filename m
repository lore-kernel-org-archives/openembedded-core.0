Received: from mailout02.rmx.de (mailout02.rmx.de [62.245.148.41])
 by mx.groups.io with SMTP id smtpd.web12.507.1594415813484754951
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 14:16:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 62.245.148.41, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout02.rmx.de (Postfix) with ESMTPS id 4B3QpS5cBszNlZY;
	Fri, 10 Jul 2020 23:16:48 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4B3QpQ1032z2xjY;
	Fri, 10 Jul 2020 23:16:46 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.14) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 10 Jul
 2020 23:16:45 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: Christopher Larson <kergoth@gmail.com>
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] How to install individual -lic packages
Date: Fri, 10 Jul 2020 23:16:39 +0200
Message-ID: <2493198.1EAckAzmSB@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <CABcZANmiNUMz1W8UKpsFKmjJ9DvCCepH2u3XjSeKaZUaaXHkcw@mail.gmail.com>
References: <2349716.bIJK7JYWuR@n95hx1g2> <CABcZANmiNUMz1W8UKpsFKmjJ9DvCCepH2u3XjSeKaZUaaXHkcw@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.14]
X-RMX-ID: 20200710-231646-4B3QpQ1032z2xjY-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Christopher,

Am Donnerstag, 9. Juli 2020, 18:04:00 CEST schrieb Christopher Larson:
> COMPLEMENTARY_GLOB[lic-pkgs] =3D '*-lic'
> IMAGE_FEATURES +=3D "lic-pkgs"
>
> This is how the dbg-pkgs, dev-pkgs, doc-pkgs, src-pkgs, ptest-pkgs,
> staticdev-pkgs are done.

I think this is not what I require. How can I install -lic packages directl=
y?

I would like to have all necessary -lic packages in my rootfs, so that I
can publish the licenses via a webserver. I need some extra -lic packages
which are not installed automatically because the main package is not
part of the rootfs.

Example 1: My initramfs used dash from klibc. This code is licensed under
BSD-3-Clause, so I need the copyright disclaimer of this package. How
can I add the license of this package to my rootfs?

Example 2: My application depends on libuuid from util-linux. It looks
like the -lic package is not added to RRECOMMENDS_libuuid because
package splitting is done dynamically for util-linux. So I need a way to
install util-linux-lic manually.

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
