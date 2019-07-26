Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD5C71BEE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2019 15:25:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id AD2701864B;
	Fri, 26 Jul 2019 17:25:14 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 9iR85z8wG1LB; Fri, 26 Jul 2019 17:25:12 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id 7877F18644;
	Fri, 26 Jul 2019 17:25:12 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66DEA1E080;
	Fri, 26 Jul 2019 17:25:12 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B38E1E07D;
	Fri, 26 Jul 2019 17:25:12 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Fri, 26 Jul 2019 17:25:12 +0200 (CEST)
Received: from xbox06.axis.com (xbox06.axis.com [10.0.15.176])
	by seth.se.axis.com (Postfix) with ESMTP id 4F2671F88;
	Fri, 26 Jul 2019 17:25:12 +0200 (CEST)
Received: from xbox06.axis.com (10.0.15.176) by xbox06.axis.com (10.0.15.176)
	with Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Fri, 26 Jul 2019 17:25:12 +0200
Received: from xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35]) by
	xbox06.axis.com ([fe80::59d2:4cb0:3900:3c35%12]) with mapi id
	15.00.1395.000; Fri, 26 Jul 2019 17:25:12 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Frederic Ouellet <fredericouellet@eaton.com>
Thread-Topic: [OE-core] [PATCH v2] systemd: Add partial support of drop-in
	configuration files to systemd-systemctl-native
Thread-Index: AQHVQyOEzEI9Og7H9USInseATxMJX6bdBStA
Date: Fri, 26 Jul 2019 15:25:12 +0000
Message-ID: <e7a608a3670d49ab8c2d78b2de295e5f@xbox06.axis.com>
References: <1564084730-6835-1-git-send-email-fredericouellet@eaton.com>
In-Reply-To: <1564084730-6835-1-git-send-email-fredericouellet@eaton.com>
Accept-Language: en-US, sv-FI
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] systemd: Add partial support of drop-in	configuration files to systemd-systemctl-native
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
X-List-Received-Date: Fri, 26 Jul 2019 15:25:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
> core-bounces@lists.openembedded.org> On Behalf Of Frederic Ouellet
> Sent: den 25 juli 2019 21:59
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH v2] systemd: Add partial support of drop-in
> configuration files to systemd-systemctl-native
>=20
> Support for serive-name.service.d/ folders containing .conf files

Change "serive-name.service.d/" to "<service name>.service.d/".

> It don't support all the partial folder names

Change "don't" to "doesn't".

> See https://www.freedesktop.org/software/systemd/man/systemd.unit.html
>=20
> Signed-off-by: Frederic Ouellet <fredericouellet@eaton.com>
> ---
>  meta/recipes-core/systemd/systemd-systemctl/systemctl | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> index 8d7b3ba..8837f54 100755
> --- a/meta/recipes-core/systemd/systemd-systemctl/systemctl
> +++ b/meta/recipes-core/systemd/systemd-systemctl/systemctl
> @@ -28,6 +28,10 @@ class SystemdFile():
>      def __init__(self, root, path):
>          self.sections =3D dict()
>          self._parse(root, path)
> +        dirname =3D os.path.basename(path.name) + ".d"
> +        for location in locations:
> +            for path2 in sorted((root / location / "system" / dirname).g=
lob("*.conf")):
> +                self._parse(root, path2)
>=20
>      def _parse(self, root, path):
>          """Parse a systemd syntax configuration file
> @@ -56,8 +60,11 @@ class SystemdFile():
>                  line =3D line.rstrip("\n")
>                  m =3D section_re.match(line)
>                  if m:
> -                    section =3D dict()
> -                    self.sections[m.group('section')] =3D section
> +                    if m.group('section') not in self.sections:
> +                        section =3D dict()
> +                        self.sections[m.group('section')] =3D section
> +                    else:
> +                        section =3D self.sections[m.group('section')]
>                      continue
>=20
>                  while line.endswith("\\"):
> --
> 2.7.4

//Peter


