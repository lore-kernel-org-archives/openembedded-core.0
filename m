Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QNfeH-0001Rz-4l
	for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 08:26:53 +0200
Received: by wwb17 with SMTP id 17so3826507wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 23:23:55 -0700 (PDT)
Received: by 10.216.177.4 with SMTP id c4mr442989wem.3.1305959033484;
	Fri, 20 May 2011 23:23:53 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id k2sm2707390wby.34.2011.05.20.23.23.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 May 2011 23:23:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <63425ea09b30c9cca10c25bc559ed6f22022c4b6.1305933509.git.raj.khem@gmail.com>
Date: Sat, 21 May 2011 08:23:46 +0200
Message-Id: <AC0647D5-E982-45DC-8D8B-D2E7591D904C@dominion.thruhere.net>
References: <43cfb965113150ea56c55c3880b67ba272b3c719.1305933509.git.raj.khem@gmail.com>
	<63425ea09b30c9cca10c25bc559ed6f22022c4b6.1305933509.git.raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/2] distcc_2.18.3.bb: Fix compilation on uclibc
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
X-List-Received-Date: Sat, 21 May 2011 06:26:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 mei 2011, om 01:19 heeft Khem Raj het volgende geschreven:
>=20
> do_install_append() {
>     install -d ${D}${sysconfdir}/init.d/
>     install -d ${D}${sysconfdir}/default
>     install -m 0755 ${WORKDIR}/distcc ${D}${sysconfdir}/init.d/
>     install -m 0755 ${WORKDIR}/default =
${D}${sysconfdir}/default/distcc
> +    ${DESKTOPINSTALL}
> +}
> +DESKTOPINSTALL =3D ""
> +DESKTOPINSTALL_libc-glibc () {
> +    install -d ${D}${datadir}/distcc/
>     install -m 0644 ${WORKDIR}/distccmon-gnome.desktop =
${D}${datadir}/distcc/
> }
> -
> -PACKAGES +=3D "distcc-distmon-gnome"
> +PACKAGES_append_libc-glibc =3D " distcc-distmon-gnome"

Are these parts really needed?=


