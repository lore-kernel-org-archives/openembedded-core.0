Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QlEWb-0000TZ-5Z
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 08:20:21 +0200
Received: by wyg30 with SMTP id 30so2825601wyg.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Jul 2011 23:16:09 -0700 (PDT)
Received: by 10.227.11.134 with SMTP id t6mr3550275wbt.21.1311574569413;
	Sun, 24 Jul 2011 23:16:09 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id em16sm4040275wbb.16.2011.07.24.23.16.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 24 Jul 2011 23:16:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201107242234.51777.schnitzeltony@gmx.de>
Date: Mon, 25 Jul 2011 08:16:03 +0200
Message-Id: <8ECC4D84-6F3F-4E53-81BC-1266D3E168DA@dominion.thruhere.net>
References: <201107242234.51777.schnitzeltony@gmx.de>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [meta-ti]Pandaboard issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 25 Jul 2011 06:20:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 24 jul. 2011, om 22:34 heeft Andreas Mueller het volgende geschreven:

> Hi,
>=20
> while working on xfce48 recipes for meta-oe I wanted to do some run =
tests. My=20
> only hardware currently supported in oe-core environment is =
pandaboard. Herewith=20
> I face the following issues:
>=20
> - Starting X stops / log attached

sed -i -e s:omapfb:fbdev:g /etc/X11/xorg.org=


