Received: from mailout03.rmx.de (mailout03.rmx.de [94.199.88.101])
 by mx.groups.io with SMTP id smtpd.web11.7282.1594201564333435876
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2020 02:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.101, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout03.rmx.de (Postfix) with ESMTPS id 4B1vZH64yczldYS;
	Wed,  8 Jul 2020 11:45:59 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4B1vZ90QnGz2TSDd;
	Wed,  8 Jul 2020 11:45:53 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.174) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 8 Jul
 2020 11:40:31 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] Patches are stuck in master-next
Date: Wed, 8 Jul 2020 11:40:30 +0200
Message-ID: <12184874.L5pGue1uWE@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <ec870c18ff3d28d9e0f45f9b128b380dd8b5d668.camel@linuxfoundation.org>
References: <5614347.lOV4Wx5bFT@n95hx1g2> <ec870c18ff3d28d9e0f45f9b128b380dd8b5d668.camel@linuxfoundation.org>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.174]
X-RMX-ID: 20200708-114553-4B1vZ90QnGz2TSDd-0@kdin02
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Richard,

Am Mittwoch, 8. Juli 2020, 11:20:40 CEST schrieb Richard Purdie:
> The issue is I still don't really like the eudev one in particular. A
> native eudev really doesn't make sense and I'm reluctant to encourage
> people to build such a thing. I suspect you can't convince
> networkmanager-native to build without it (although I'm not convinced
> a native libnm is that useful either).

For NATIVESDK, I need the libs because I deploy a x86 version
of our embedded application for our internal integration test team. Sure, I
could built two cross SDKs (one for ARM, one for x86), but (mis?)using
NATIVESDK for getting the x86 version of our applications works
very fine for me.

For NATIVE, I need the libs for running automatic unit tests on the
build machine. One could probably ask whether unit tests should
depend on libraries like libudev or libnm.

Please let me know, which of the additions (NATIVE / NATIVESDK)
are welcome. I'm only offering to share my work, I'm also fine
keeping this in my private layer.

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
