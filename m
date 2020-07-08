Received: from mailout09.rmx.de (mailout09.rmx.de [94.199.88.74])
 by mx.groups.io with SMTP id smtpd.web12.12722.1594220934573806976
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 08:08:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.74, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout09.rmx.de (Postfix) with ESMTPS id 4B22kn5j0zzbl2K;
	Wed,  8 Jul 2020 17:08:49 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4B22kS70bJz2xF4;
	Wed,  8 Jul 2020 17:08:32 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.17) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 8 Jul
 2020 17:07:29 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: Adrian Bunk <bunk@stusta.de>
CC: Richard Purdie <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Patches are stuck in master-next
Date: Wed, 8 Jul 2020 17:07:28 +0200
Message-ID: <18770938.c9i5bXPaRE@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <20200708142003.GD5419@localhost>
References: <5614347.lOV4Wx5bFT@n95hx1g2> <12184874.L5pGue1uWE@n95hx1g2> <20200708142003.GD5419@localhost>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.17]
X-RMX-ID: 20200708-170838-4B22kS70bJz2xF4-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Mittwoch, 8. Juli 2020, 16:20:03 CEST schrieb Adrian Bunk:
> I would rather ask why you aren't running automatic unit tests
> built for the target inside qemu.
>
> cu
> Adrian

This may be an option. Currently the platform (x86 or arm)
decides whether real peripheral routines or mock objects
will be used. Of course this can easily be changed. But
running the tests within a (slow) emulator brings not much
benefit compared to building and running the tests directly
on x86.

Instead of using NATIVE, also the NATIVESDK build could
be executed within qemu on the build machine... (without
qemu, nativesdk executables cannot be executed on the
build machine due to non existing loader in .interp section).

From Richard I got no response to the question whether
potentially every package may be extended for nativesdk/native,
or these platforms a reserved for packages required for "building".

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
