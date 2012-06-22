Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Shwck-0003G2-3d
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jun 2012 07:41:38 +0200
Received: by eekd49 with SMTP id d49so441207eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 22:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=x3pstCRwj5UkJrxdX5URJ5342Y5Z0tY/DkieptmMsgw=;
	b=HxJoFDmGfsFn4rhGdPs8npgNzp3cSMYhrsuzYxvKJ/dywVDdvTiepNc4gKd5e0H2Cb
	1AA0wMjx4+/YDld1fSES9v177zkABbWpGB8CiRufkkhSURfRQOmC5oow3AsDFWixlo1N
	CGLdkWFw0z7LMUX1ohJ1fZesG6pmVkQmT1lFavXB/0kgWBk68ukj2nQJJj56v6K+vwTk
	hhXPK41X33u5Y19lVulk4FnPlqmyD8qXoujasLE62InHNf33P5imcX8gO31PtlQQdCDy
	bBY/DXm4LQtNgD99K4lgjd7AutM0dxd/MzGaufn6lyrjnAnsSoHqUjBSVXPusUD688oB
	ABzw==
Received: by 10.14.96.142 with SMTP id r14mr172204eef.46.1340343051468;
	Thu, 21 Jun 2012 22:30:51 -0700 (PDT)
Received: from ?IPv6:2001:610:612::d5f4:7031:a8fa:f4f0?
	([2001:610:612:0:d5f4:7031:a8fa:f4f0])
	by mx.google.com with ESMTPS id y12sm109159838eem.7.2012.06.21.22.30.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jun 2012 22:30:50 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1340310925-12937-1-git-send-email-paul.gortmaker@windriver.com>
Date: Fri, 22 Jun 2012 07:30:48 +0200
Message-Id: <298672C9-7064-437A-9D46-45259E697684@dominion.thruhere.net>
References: <1340310925-12937-1-git-send-email-paul.gortmaker@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQnlz1TAxkumELPPb2MS+VnfeV9TvNaJl4dP/aXx8Cub45EPnsevwBT+wyQUmGNzEg7ZoM67
Subject: Re: [PATCH] linux-firmware: update to main repo on kernel.org
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
X-List-Received-Date: Fri, 22 Jun 2012 05:41:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 jun. 2012, om 22:35 heeft Paul Gortmaker het volgende geschreven:

> This is now the authoratative repository, taking updates.
> The latest has a couple updated license files, vs. the previous
> srcrev that was used.
>=20
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>=20
> diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb =
b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> index 3675978..0127d55 100644
> --- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> +++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
> @@ -7,23 +7,23 @@ SECTION =3D "kernel"
>=20
> LICENSE =3D "Proprietary"
>=20
> -LIC_FILES_CHKSUM =3D =
"file://LICENSE.radeon_rlc;md5=3D4c243f7854d2884b483abda991adef43 \
> +LIC_FILES_CHKSUM =3D =
"file://LICENSE.radeon;md5=3De56b405656593a0c97e478513051ea0e \
>                     =
file://LICENSE.dib0700;md5=3Df7411825c8a555a1a3e5eab9ca773431 \
>                     =
file://LICENCE.xc5000;md5=3D1e170c13175323c32c7f4d0998d53f66 \
>                     =
file://LICENCE.ralink-firmware.txt;md5=3Dab2c269277c45476fb449673911a2dfd =
\
>                     =
file://LICENCE.qla2xxx;md5=3D4005328a134054f0fa077bdc37aa64f2 \
> -                    =
file://LICENCE.iwlwifi_firmware;md5=3D311cc823df5b1be4f00fbf0f17d96a6b \
> +                    =
file://LICENCE.iwlwifi_firmware;md5=3D11545778abf78c43d7644d4f171ea1c7 \
>                     =
file://LICENCE.i2400m;md5=3D14b901969e23c41881327c0d9e4b7d36 \
>                     =
file://LICENCE.atheros_firmware;md5=3D30a14c7823beedac9fa39c64fdd01a13 \
>                     =
file://LICENCE.agere;md5=3Daf0133de6b4a9b2522defd5f188afd31 \
>                     =
file://LICENCE.rtlwifi_firmware.txt;md5=3D00d06cfd3eddd5a2698948ead2ad54a5=
 \
>                    "
>=20
> -SRCREV =3D "15888a2eab052ac3d3f49334e4f6f05f347a516e"
> +SRCREV =3D "e98750f0d68d0037ce5a186f7f863a9c13bf773a"
> PV =3D "0.0+git${SRCPV}"
> PR =3D "r1"

missing PR bump=


