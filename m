Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RnKja-0000in-40
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 02:54:42 +0100
Received: by werb12 with SMTP id b12so662286wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 17:47:01 -0800 (PST)
Received: by 10.216.131.29 with SMTP id l29mr8356025wei.5.1326851221026;
	Tue, 17 Jan 2012 17:47:01 -0800 (PST)
Received: from [172.20.1.20] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id q7sm19952078wix.5.2012.01.17.17.46.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Jan 2012 17:47:00 -0800 (PST)
References: <1326841411-6369-1-git-send-email-andrea.adami@gmail.com>
In-Reply-To: <1326841411-6369-1-git-send-email-andrea.adami@gmail.com>
Mime-Version: 1.0 (1.0)
Message-Id: <4E95A0DD-C978-4621-A624-8313A743CE56@dominion.thruhere.net>
Cc: "<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPhone Mail (9A405)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 18 Jan 2012 02:46:54 +0100
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xinput: add utility for configuring and testing XInput devices.
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
X-List-Received-Date: Wed, 18 Jan 2012 01:54:42 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 18 jan. 2012 om 00:03 heeft Andrea Adami <andrea.adami@gmail.com> het vol=
gende geschreven:

> * from meta-openembedded with minor editings
> * added PE

why?

> and reset PR

why?


>=20
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> ---
> meta/recipes-graphics/xorg-app/xinput_1.5.3.bb |   15 +++++++++++++++
> 1 files changed, 15 insertions(+), 0 deletions(-)
> create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
>=20
> diff --git a/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb b/meta/recipes=
-graphics/xorg-app/xinput_1.5.3.bb
> new file mode 100644
> index 0000000..c9925f1
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
> @@ -0,0 +1,15 @@
> +require xorg-app-common.inc
> +
> +SUMMARY =3D "Runtime configuration and test of XInput devices"
> +
> +DESCRIPTION =3D "Xinput is an utility for configuring and testing XInput d=
evices"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D22c34ea36136407a77702a8b784f9b=
d0"
> +
> +DEPENDS +=3D " libxi"
> +
> +PR =3D "r0"
> +PE =3D "1"
> +
> +SRC_URI[md5sum] =3D "1e2f0ad4f3fa833b65c568907f171d28"
> +SRC_URI[sha256sum] =3D "6aade131cecddaeefc39ddce1dd5e8473f6039c2e4efbfd9f=
bb5ee2a75885c76"
> --=20
> 1.7.3.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


