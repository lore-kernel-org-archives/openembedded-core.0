Received: from mailout11.rmx.de (mailout11.rmx.de [94.199.88.76])
 by mx.groups.io with SMTP id smtpd.web11.6893.1594302271955480778
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 06:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.76, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout11.rmx.de (Postfix) with ESMTPS id 4B2cpz34Xnz423x;
	Thu,  9 Jul 2020 15:44:27 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4B2cpw4Cw5z2TTMN;
	Thu,  9 Jul 2020 15:44:24 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.15) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 9 Jul
 2020 15:44:24 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] libgcc: Set LICENSE for -lic package
Date: Thu, 9 Jul 2020 15:44:10 +0200
Message-ID: <2974074.WB9ANkTbeW@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20200709132500.prkhj3xqowdhcavu@qschulz>
References: <20200709131734.30235-1-ceggers@arri.de> <20200709132500.prkhj3xqowdhcavu@qschulz>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.15]
X-RMX-ID: 20200709-154424-4B2cpw4Cw5z2TTMN-0@kdin02
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Quentin,

Am Donnerstag, 9. Juli 2020, 15:25:00 CEST schrieb Quentin Schulz:
> Not really directing the question to you but... does this actually makes
> sense? Is the license licensed? Can't we just empty LICENSE_${PN}-lic or
> not check the license for this package? That might be something that can
> be done in the license.bbclass for example.

I already asked myself what license the -lic package should have. Is this a
license of it's own (or none)?

From the GPLv2:

"Copyright (C) 1989, 1991 Free Software Foundation, Inc.
51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA

Everyone is permitted to copy and distribute verbatim copies
of this license document, but changing it is not allowed."

Other licenses like MIT have no such restrictions, so that they
are often forked. But setting an individual license for each -lic paket may
also complicate things.

The patch I sent, "works for me". But I'll be also happy with another
solution...

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
