Received: from mail-dy0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDDMm-0007ko-7T
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Oct 2011 12:45:52 +0200
Received: by dyk17 with SMTP id 17so262879dyk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Oct 2011 03:40:11 -0700 (PDT)
Received: by 10.223.7.14 with SMTP id b14mr5733774fab.10.1318243211502;
	Mon, 10 Oct 2011 03:40:11 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id o22sm30866681fab.11.2011.10.10.03.40.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Oct 2011 03:40:10 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
Date: Mon, 10 Oct 2011 12:40:08 +0200
Message-Id: <A8FC601D-2A25-46D0-8AB0-3FE9E8561B01@dominion.thruhere.net>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCHv3 00/31] Xorg related changes
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
X-List-Received-Date: Mon, 10 Oct 2011 10:45:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 7 okt. 2011, om 19:05 heeft Martin Jansa het volgende geschreven:

> this patchset brings meta-oe and oe-core xorg stuff together and most =
of
> xorg recipes will be removed from meta-oe (sending another pull =
request now).
>=20
> This step is needed to be able to separate common x11 to meta-x11 or =
whatever later.
>=20
> The following changes since commit =
808b3123e359f1aebabb8af44694275e4075e031:
>=20
>  gnutls: Disable p11-kit dependency explicitly to resolve build =
failures (2011-10-07 15:40:42 +0100)
>=20
> are available in the git repository at:
>  git://git.openembedded.org/openembedded-core-contrib jansa/x11-v2
>  =
http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=3Dj=
ansa/x11-v2
>=20
> Martin Jansa (31):
>=20
>  xserver-xorg-common: move RDEPENDS_${PN} +=3D xorg-minimal-fonts to
>    shared .inc

I have been running X images without minimal fonts for some time now, so =
AFAICS it can be dropped completely.

regards,

Koen=


