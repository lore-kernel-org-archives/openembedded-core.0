Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RFpgL-0000oq-0C
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Oct 2011 18:04:53 +0200
Received: by eyd9 with SMTP id 9so3035649eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2011 08:59:04 -0700 (PDT)
Received: by 10.14.17.207 with SMTP id j55mr1382990eej.211.1318867143990;
	Mon, 17 Oct 2011 08:59:03 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 49sm9157111eec.1.2011.10.17.08.59.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 17 Oct 2011 08:59:02 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1318865134-4380-1-git-send-email-koen@dominion.thruhere.net>
Date: Mon, 17 Oct 2011 17:59:01 +0200
Message-Id: <9945D4F2-8DB8-420E-BF9C-B20D335221C7@dominion.thruhere.net>
References: <1318865134-4380-1-git-send-email-koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH] bind 9.8.1: fix build after recent update
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
X-List-Received-Date: Mon, 17 Oct 2011 16:04:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 okt. 2011, om 17:25 heeft Koen Kooi het volgende geschreven:

> | checking linking as -lgssapi -lkrb5 -ldes -lcrypt -lasn1 -lroken =
-lcom_err... no
> | checking linking as -lgssapi -lkrb5 -lcrypto -lcrypt -lasn1 -lroken =
-lcom_err... no
> | checking linking as -lgss -lkrb5... no
> | configure: error: could not determine proper GSSAPI linkage
> | + bbfatal 'oe_runconf failed'
> | + echo 'ERROR: oe_runconf failed'
>=20
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
> meta/recipes-connectivity/bind/bind_9.8.1.bb |    5 +++--
> 1 files changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-connectivity/bind/bind_9.8.1.bb =
b/meta/recipes-connectivity/bind/bind_9.8.1.bb
> index 330acdb..af473e9 100644
> --- a/meta/recipes-connectivity/bind/bind_9.8.1.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.8.1.bb
> @@ -6,10 +6,10 @@ LICENSE =3D "ISC & BSD"
> LIC_FILES_CHKSUM =3D =
"file://COPYRIGHT;md5=3D0fbe2a3ab3c68ac3fea3cad13093877c"
>=20
> DEPENDS =3D "openssl"
> -PR =3D "r0"
> +PR =3D "r1"
>=20
> SRC_URI =3D "ftp://ftp.isc.org/isc/bind9/${PV}/${BPN}-${PV}.tar.gz \
> -	   file://conf.patch \
> +           file://conf.patch \
>            file://cross-build-fix.patch \
> 	   "
>=20
> @@ -19,6 +19,7 @@ SRC_URI[sha256sum] =3D =
"02285dc429cb2a6687a1b2446e9ee22c1df27f2577225b05be5092395e
> # --enable-exportlib is necessary for building dhcp
> EXTRA_OECONF =3D " --enable-ipv6=3Dno --with-randomdev=3D/dev/random =
--disable-threads \
>                  --disable-devpoll --disable-epoll --with-gost=3Dno \

Not related to my patch: if someone can explain we we disable epoll I =
would appreciate it, since we generally want it enabled and I think =
we're using recent enough kernels (2.6.26+) where epoll finally got =
hooked up for arm




