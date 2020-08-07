Received: from mailout01.rmx.de (mailout01.rmx.de [94.199.90.91])
 by mx.groups.io with SMTP id smtpd.web11.1684.1596785912425626005
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 Aug 2020 00:38:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.90.91, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout01.rmx.de (Postfix) with ESMTPS id 4BNHKJ1fLdz2SVFR
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Aug 2020 09:38:28 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4BNHKH4Xd5z2TRlg
	for <openembedded-core@lists.openembedded.org>; Fri,  7 Aug 2020 09:38:27 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.44) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 7 Aug
 2020 09:38:27 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
Subject: gcc-runtime: Debug sources not packaged
Date: Fri, 7 Aug 2020 09:38:26 +0200
Message-ID: <3368258.DxmaQSIRuq@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
MIME-Version: 1.0
X-Originating-IP: [192.168.54.44]
X-RMX-ID: 20200807-093827-4BNHKH4Xd5z2TRlg-0@kdin02
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

It seems that there are no debug sources available for libstdc++. When
debugging with GDB, I get the following message:

> Can't find a source file at "/opt/orbiter-tiny/3.1.1/sysroots/cortexa7t2h=
f-
> neon-vfpv4-poky-linux-musleabi/usr/src/debug/gcc-runtime/9.3.0-r0/arm-pok=
y-
> linux-musleabi/libstdc++-v3/libsupc++/../../../../../../../../../work-sha=
red/
> gcc-9.3.0-r0/gcc-9.3.0/libstdc++-v3/libsupc++/eh_alloc.cc"
> Locate the file or edit the source lookup path to include its location.

Debug sources for all other libraries are available.

The directory work/.../gcc-runtime/.../packages-split/gcc-runtime-src
is empty and so there is no gcc-runtime-src ipk generated. It looks like
packaging debug sources does not work as the gcc sources are extracted
to the work-shared/ directory instead of work/

The gcc-runtime recipe creates special -fdebug-prefix-map options. It
looks like these settings make it impossible copy the debug sources
during packaging.

Any ideas how to generate a gcc-runtime-src package?

Best regards
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
