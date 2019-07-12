Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id C38FC7F0F6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2019 11:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 21085182CB;
	Fri, 12 Jul 2019 13:21:20 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id GofZGUgawyHj; Fri, 12 Jul 2019 13:21:19 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3C0A3182A0;
	Fri, 12 Jul 2019 13:21:19 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1D6B11A064;
	Fri, 12 Jul 2019 13:21:19 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 11E901A060;
	Fri, 12 Jul 2019 13:21:19 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 12 Jul 2019 13:21:19 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id 05C982D24;
	Fri, 12 Jul 2019 13:21:19 +0200 (CEST)
Received: from xbox06.axis.com (10.0.15.176) by XBOX03.axis.com (10.0.5.17)
	with Microsoft SMTP Server (TLS) id 15.0.1365.1;
	Fri, 12 Jul 2019 13:21:10 +0200
Received: from xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35]) by
	xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35%12]) with mapi id
	15.00.1395.000; Fri, 12 Jul 2019 13:21:10 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Chen Qi <Qi.Chen@windriver.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: sysstat no longer builds (was: [PATCH 0/1] sysstat: use service
	file from source codes)
Thread-Index: AdU4o+TvBmxNSKItT06ZeMQ0KKNLzg==
Date: Fri, 12 Jul 2019 11:21:10 +0000
Message-ID: <c71ee3805fdb4335ba78791a42ad4257@xbox06.axis.com>
Accept-Language: en-US, sv-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Subject: sysstat no longer builds (was: [PATCH 0/1] sysstat: use service file from source codes)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 12 Jul 2019 11:21:22 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

[ I cannot find the actual patch in my mailbox, which is why I am=20
  replying to the cover letter. ]

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-bounces@lists.openembedded.org> On Behalf Of Chen Qi
> Sent: den 9 juli 2019 07:53
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH 0/1] sysstat: use service file from source code=
s
>=20
> *** BLURB HERE ***
> The following changes since commit 4a68a44f56c725914cfa721993a2ea8a3dc6eb=
d5:
>=20
>   cve-update-db: Catch request.urlopen errors. (2019-07-05 12:00:20 +0100=
)
>=20
> are available in the git repository at:
>=20
>   git://git.pokylinux.org/poky-contrib ChenQi/sysstat-systemd
>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3DChenQi/sysstat-=
systemd
>=20
> Chen Qi (1):
>   sysstat: use service file from source codes
>=20
>  meta/recipes-extended/sysstat/sysstat.inc             |  8 ++------
>  meta/recipes-extended/sysstat/sysstat/sysstat.service | 12 ------------
>  2 files changed, 2 insertions(+), 18 deletions(-)
>  delete mode 100644 meta/recipes-extended/sysstat/sysstat/sysstat.service
>=20
> --
> 1.9.1

I do not know how this was tested, but it is no longer possible to build=20
sysstat after this change was integrated. I now get the following when I=20
build it:

  ERROR: sysstat-12.1.3-r0 do_package: SYSTEMD_SERVICE_sysstat value syssta=
t.service does not exist
  ERROR: sysstat-12.1.3-r0 do_package:
  ERROR: sysstat-12.1.3-r0 do_package: Function failed: systemd_populate_pa=
ckages

This is due to that the upstream package only installs the sysstat.service=
=20
file if cron support is enabled, which it isn't by default.

There was another patch by Haiqing Bai sent on July 2 that seemed to handle=
=20
this properly.

//Peter


