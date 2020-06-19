Received: from mailout05.rmx.de (mailout05.rmx.de [94.199.90.90])
 by mx.groups.io with SMTP id smtpd.web11.2696.1592595909603525811
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Jun 2020 12:45:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.90.90, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout05.rmx.de (Postfix) with ESMTPS id 49pTmK0SqPz9xq9
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 21:45:05 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 49pTmJ26blz2xCX
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Jun 2020 21:45:04 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Fri, 19 Jun 2020 21:44:38 +0200
Received: from N95HX1G2.wgnetz.xx (192.168.54.14) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Fri, 19 Jun
 2020 21:44:37 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [Patch 0/4] Extend dependencies of networkmanager for native/nativesdk
Date: Fri, 19 Jun 2020 21:43:48 +0200
Message-ID: <20200619194351.30053-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [192.168.54.14]
X-OriginalArrivalTime: 19 Jun 2020 19:44:38.0422 (UTC) FILETIME=[1148FB60:01D64672]
X-RMX-ID: 20200619-214504-49pTmJ26blz2xCX-0@kdin01
X-RMX-SOURCE: 217.111.95.7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

My project needs libnm for native/nativesdk. Patches for
meta-oe/meta-networking will follow after this has been applied.


________________________________
 [http://assets.arri.com/media/sign/2020-04-03-E-mail-signature-Stellar2_V1=
.jpg] <https://microsites.arri.com/stellar/>

Get all the latest information from www.arri.com<https://www.arri.com/>, Fa=
cebook<https://www.facebook.com/TeamARRI>, Twitter<https://twitter.com/ARRI=
Channel>, Instagram<https://instagram.com/arri> and YouTube<https://www.you=
tube.com/user/ARRIChannel>.

Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
Sitz: M=FCnchen - Registergericht: Amtsgericht M=FCnchen - Handelsregistern=
ummer: HRA 57918
Pers=F6nlich haftender Gesellschafter: Arnold & Richter Cine Technik GmbH
Sitz: M=FCnchen - Registergericht: Amtsgericht M=FCnchen - Handelsregistern=
ummer: HRB 54477
Gesch=E4ftsf=FChrer: Dr. Michael Neuh=E4user; Stephan Schenk; Walter Trauni=
nger; Markus Zeiler
