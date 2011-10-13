Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1REHNe-00079G-Qz
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 11:15:10 +0200
Received: by eyd9 with SMTP id 9so1604187eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 02:09:27 -0700 (PDT)
Received: by 10.223.77.71 with SMTP id f7mr4789648fak.33.1318496967006;
	Thu, 13 Oct 2011 02:09:27 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id l8sm8813153fai.16.2011.10.13.02.09.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 02:09:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <2020cc16e581438254e80e4f6400e2b3c8b85c23.1318496401.git.kai.kang@windriver.com>
Date: Thu, 13 Oct 2011 11:09:20 +0200
Message-Id: <A51B777A-B357-4A17-BDE8-66DDC7782AFB@dominion.thruhere.net>
References: <cover.1318496401.git.kai.kang@windriver.com>
	<2020cc16e581438254e80e4f6400e2b3c8b85c23.1318496401.git.kai.kang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 3/4] xinput: add xinput from oe
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
X-List-Received-Date: Thu, 13 Oct 2011 09:15:10 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 okt. 2011, om 11:05 heeft Kang Kai het volgende geschreven:

> xinput is requred by xinput-calibrator, so pull it from oe.
> Reset PR and add LIC_FILES_CHKSUM.
>=20
> Signed-off-by: Kang Kai <kai.kang@windriver.com>
> ---
> meta/recipes-graphics/xorg-app/xinput_1.5.3.bb |   10 ++++++++++
> 1 files changed, 10 insertions(+), 0 deletions(-)
> create mode 100644 meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
>=20
> diff --git a/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb =
b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
> new file mode 100644
> index 0000000..5f0d351
> --- /dev/null
> +++ b/meta/recipes-graphics/xorg-app/xinput_1.5.3.bb
> @@ -0,0 +1,10 @@
> +require xorg-app-common.inc
> +DESCRIPTION =3D "a utility to configure and test XInput devices"
> +
> =
+LIC_FILES_CHKSUM=3D"file://COPYING;md5=3D22c34ea36136407a77702a8b784f9bd0=
"
> +
> +DEPENDS +=3D " libxi"
> +PR =3D "r0"

That will make PR go backwards compared to the meta-oe version=


