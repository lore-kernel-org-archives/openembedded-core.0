Received: from mailout12.rmx.de (mailout12.rmx.de [94.199.88.78])
 by mx.groups.io with SMTP id smtpd.web10.16501.1592830457524390994
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 05:54:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.78, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout12.rmx.de (Postfix) with ESMTPS id 49r8Vs1MzzzRlvD
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 14:54:13 +0200 (CEST)
Received: from ppmail.arri.de (unknown [217.111.95.7])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 49r8Vr37Lzz2TTNm
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 14:54:12 +0200 (CEST)
Received: from mta.arri.de ([192.168.100.141]) by ppmail.arri.de over TLS secured channel with Microsoft SMTPSVC(7.0.6002.18264);
	 Mon, 22 Jun 2020 14:54:11 +0200
Received: from N95HX1G2.wgnetz.xx (192.168.54.60) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Mon, 22 Jun
 2020 14:54:12 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [Patch v2 0/2] Extend dependencies of networkmanager for native/nativesdk
Date: Mon, 22 Jun 2020 14:53:57 +0200
Message-ID: <20200622125359.11587-1-ceggers@arri.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [192.168.54.60]
X-OriginalArrivalTime: 22 Jun 2020 12:54:11.0980 (UTC) FILETIME=[3A0564C0:01D64894]
X-RMX-ID: 20200622-145412-49r8Vr37Lzz2TTNm-0@kdin02
X-RMX-SOURCE: 217.111.95.7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

On Friday, 2020-06-19, Richard Pudie wrote:
> A native eudev is a really bad idea, a nativesdk one isn't much better.
> If there are libs we need from here, then the recipe should only be
> generating those but a "native eudev" makes no sense to be needed by a
> build system.
Ack. I already expected that there might be a (hidden?) rule, what type of
software is (NOT) allowed for -native/-nativesdk.

> A native or nativesdk consolekit does not make sense.

> If you need libs from networkmanager, you'll probably have to patch it
> just to generate the libs you need. We don't want builds polluted with
> confusing and potentially quite problematic binaries.
Networkmanager can be built fine without consolekit. Probably this will
not make any difference for libnm.


Changelog v2:
--------------
- eudev: Don't build main package for -native(sdk), only libudev is
  required
- dbus/dbus-glib: Patch removed
- consolekit: Patch removed




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
