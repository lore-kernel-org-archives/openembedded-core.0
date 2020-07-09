Received: from mailout03.rmx.de (mailout03.rmx.de [94.199.88.101])
 by mx.groups.io with SMTP id smtpd.web10.4125.1594292292916059328
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2020 03:58:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.88.101, mailfrom: ceggers@arri.de)
Received: from kdin01.retarus.com (kdin01.dmz1.retloc [172.19.17.48])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout03.rmx.de (Postfix) with ESMTPS id 4B2Y753JXGzlddY
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Jul 2020 12:58:09 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin01.retarus.com (Postfix) with ESMTPS id 4B2Y745r8Lz2xc9
	for <openembedded-core@lists.openembedded.org>; Thu,  9 Jul 2020 12:58:08 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.146) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Thu, 9 Jul
 2020 12:58:08 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: <openembedded-core@lists.openembedded.org>
Subject: How to install individual -lic packages
Date: Thu, 9 Jul 2020 12:58:02 +0200
Message-ID: <2349716.bIJK7JYWuR@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
MIME-Version: 1.0
X-Originating-IP: [192.168.54.146]
X-RMX-ID: 20200709-125808-4B2Y745r8Lz2xc9-0@kdin01
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

I have set LICENSE_CREATE_PACKAGE to "1" in order to create additional -lic
packages per recipe. As NO_RECOMMENDATIONS is set to "1" in my image recipe=
,
the -lic packages are not installed automatically.

How can I install specific -lic packages "manually". My idea was to create =
a
new recipe which rdepends on all -lic packages which I would like to instal=
l.

# myrecipe.bb:
RDEPENDS_${PN} +=3D "curl-lic"

After that I get the following error message:
ERROR: Nothing RPROVIDES 'curl-lic' (but ... RDEPENDS on or otherwise requi=
res
it)

The same happened when I tried to add the -lic packages to IMAGE_INSTALL in=
 my
image recipe.

I also tried adding one line in image.bbclass, but this changed nothing:

def add_package_and_files(d):
...
        d.setVar('PACKAGES', "%s %s" % (pn_lic, packages))
        d.setVar('FILES_' + pn_lic, files)
+       d.setVar('RPROVIDES_' + pn_lic, pn_lic)


How can I install -lic packages in my rootfs without setting
NO_RECOMMENDATIONS to 0?

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
