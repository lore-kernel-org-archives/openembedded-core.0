Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QtKmU-0003EJ-QR
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 16:38:14 +0200
Received: by wwj26 with SMTP id 26so2230573wwj.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 07:33:36 -0700 (PDT)
Received: by 10.216.195.212 with SMTP id p62mr4924041wen.30.1313505216826;
	Tue, 16 Aug 2011 07:33:36 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id g48sm71263wee.13.2011.08.16.07.33.35
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 16 Aug 2011 07:33:35 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <bb23dd3cd4f1325370b9566e2a8359b6b5d1e842.1313503017.git.anders@chargestorm.se>
Date: Tue, 16 Aug 2011 16:33:31 +0200
Message-Id: <5AA93A51-0AF1-4B3E-8B9A-7E1A1A8C2C18@dominion.thruhere.net>
References: <cover.1313503017.git.anders@chargestorm.se>
	<bb23dd3cd4f1325370b9566e2a8359b6b5d1e842.1313503017.git.anders@chargestorm.se>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH 4/5] ofono: conditionally enable bluetooth
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
X-List-Received-Date: Tue, 16 Aug 2011 14:38:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 aug. 2011, om 15:57 heeft Anders Darander het volgende geschreven:

> Use DISTRO_FEATURE to conditionally depend on bluez4, as well as =
enabling bluetooth.
>=20
> Signed-off-by: Anders Darander <anders@chargestorm.se>
> ---
> meta/recipes-connectivity/ofono/ofono.inc     |    3 ++-
> meta/recipes-connectivity/ofono/ofono_0.50.bb |    1 +
> meta/recipes-connectivity/ofono/ofono_git.bb  |    4 ++++
> 3 files changed, 7 insertions(+), 1 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/ofono/ofono.inc =
b/meta/recipes-connectivity/ofono/ofono.inc
> index a14b35a..ab233dc 100644
> --- a/meta/recipes-connectivity/ofono/ofono.inc
> +++ b/meta/recipes-connectivity/ofono/ofono.inc
> @@ -7,7 +7,8 @@ LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3Deb723b61539feef013de476e68b5c50a \
>=20
> inherit autotools pkgconfig update-rc.d
>=20
> -DEPENDS  =3D "dbus glib-2.0 udev bluez4"
> +BLUEZDEPENDS =3D "bluez4"
> +DEPENDS  =3D "dbus glib-2.0 udev ${@base_contains('DISTRO_FEATURES', =
'bluetooth','${BLUEZDEPENDS}', '', d)}"

is that BLUEZDEPENDS helper var really needed?=


