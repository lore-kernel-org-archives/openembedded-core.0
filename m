Received: from mailout07.rmx.de (mailout07.rmx.de [94.199.90.95])
 by mx.groups.io with SMTP id smtpd.web10.3578.1596020173058444539
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2020 03:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arri.de, ip: 94.199.90.95, mailfrom: ceggers@arri.de)
Received: from kdin02.retarus.com (kdin02.dmz1.retloc [172.19.17.49])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout07.rmx.de (Postfix) with ESMTPS id 4BGr7Y0cfCzByTk;
	Wed, 29 Jul 2020 12:56:09 +0200 (CEST)
Received: from mta.arri.de (unknown [217.111.95.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by kdin02.retarus.com (Postfix) with ESMTPS id 4BGr7V33kKz2TTM9;
	Wed, 29 Jul 2020 12:56:06 +0200 (CEST)
Received: from n95hx1g2.localnet (192.168.54.99) by mta.arri.de
 (192.168.100.104) with Microsoft SMTP Server (TLS) id 14.3.408.0; Wed, 29 Jul
 2020 12:56:06 +0200
From: "Christian Eggers" <ceggers@arri.de>
To: Paul Barker <pbarker@konsulko.com>
CC: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] archiver.bbclass and GIT repositories
Date: Wed, 29 Jul 2020 12:56:05 +0200
Message-ID: <1752480.GfuDWe9eGd@n95hx1g2>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: <CAM9ZRVsDE8Lxd5OsrxoP3htDjc2CuEFu4Hrkh=MOkC0BNt8ngA@mail.gmail.com>
References: <3040885.oeqThZ24Ku@n95hx1g2> <CAM9ZRVsDE8Lxd5OsrxoP3htDjc2CuEFu4Hrkh=MOkC0BNt8ngA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [192.168.54.99]
X-RMX-ID: 20200729-125606-4BGr7V33kKz2TTM9-0@kdin02
X-RMX-SOURCE: 217.111.95.66
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

On Wednesday, 29 July 2020, 11:42:25 CEST, Paul Barker wrote:
> On Tue, 28 Jul 2020 at 13:56, Christian Eggers <ceggers@arri.de> wrote:
> > ...
> > So I have three questions:
> > 1. Is it possible to archive the git project in a way, that the GIT
> > history
> > can be examined later?
> > 2. If this is not possible, I would have to put my changes in an
> > "external" patch file alongside the bitbake recipe, right?
> > 3. Is there any value archiving the .git directory at all?
>
> What configuration are you using to enable the archiver? There may be
> ways to fix this by changing the configuration.
I use the archive as described here:
https://www.yoctoproject.org/docs/3.1.1/dev-manual/dev-manual.html#providin=
g-the-source-code

From my local.conf:
...
INHERIT +=3D "archiver"
ARCHIVER_MODE[src] =3D "original"
...


>
> Also, which Yocto Project version/branch are you using?
I use Yocto 3.1.1.

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
