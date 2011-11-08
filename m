Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RNkEm-0001kg-NV
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 12:53:08 +0100
Received: by eyd9 with SMTP id 9so219945eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Nov 2011 03:46:54 -0800 (PST)
Received: by 10.181.13.166 with SMTP id ez6mr12308419wid.13.1320752812354;
	Tue, 08 Nov 2011 03:46:52 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id db1sm679413wib.19.2011.11.08.03.46.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 08 Nov 2011 03:46:51 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Tue, 8 Nov 2011 12:46:50 +0100
In-Reply-To: <cover.1320750179.git.xiaofeng.yan@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1320750179.git.xiaofeng.yan@windriver.com>
Message-Id: <4FB7876F-7675-458C-BECE-93F8C62F11F7@dominion.thruhere.net>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 0/7] gtk+ over directfb: Fix bug 1674
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
X-List-Received-Date: Tue, 08 Nov 2011 11:53:08 -0000
X-Groupsio-MsgNum: 12079
Content-Type: multipart/signed;
	boundary="Apple-Mail=_B4F9DF31-0FB1-46E1-8460-18AE5FC7BF1B";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_B4F9DF31-0FB1-46E1-8460-18AE5FC7BF1B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


Op 8 nov. 2011, om 12:15 heeft Xiaofeng Yan het volgende geschreven:

> From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
>=20
> Image "gtk+ over directfb" without x11 depends on gtk+ and directfb. =
Someone can develop software based on directfb or gtk+ without x11 in =
their project.=20
> So I added and modified some recipes for getting this image.
>=20
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>  Branch: xiaofeng/gtk+-directfb
>  Browse: =
http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dxiaofeng/gtk+-dire=
ctfb
>=20
> Thanks,
>    Xiaofeng Yan <xiaofeng.yan@windriver.com>
> ---
>=20
>=20
> Xiaofeng Yan (7):
>  qemu-config.bb: Fix bug 1674
>  gtk+: Fix bug 1674
>  cairo: Fix bug 1674
>  directfb-examples: Fix bug 1674
>  core-image-gtk-directfb-sdk: Fix bug 1674
>  core-image-gtk-directfb: Fix bug 1674
>  pango: Fix bug 1674

Please use a more descriptive summary for the commit message, people =
looking at 'git shortlog' would appreciate that very much.

regards,

Koen=

--Apple-Mail=_B4F9DF31-0FB1-46E1-8460-18AE5FC7BF1B
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk65FqoACgkQMkyGM64RGpE9twCeJ5V/tTW1Eci7WsH/wxiq8ibL
aB8AoIbWFkoikbZ9BQPxuDr+dyoqe9vK
=HpOq
-----END PGP SIGNATURE-----

--Apple-Mail=_B4F9DF31-0FB1-46E1-8460-18AE5FC7BF1B--
