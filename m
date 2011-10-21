Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RHAZW-0003i8-Kx
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 10:35:22 +0200
Received: by eyd9 with SMTP id 9so3791589eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2011 01:29:29 -0700 (PDT)
Received: by 10.14.9.146 with SMTP id 18mr1705716eet.91.1319185769333;
	Fri, 21 Oct 2011 01:29:29 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id v3sm19561220eej.7.2011.10.21.01.29.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 21 Oct 2011 01:29:28 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <9e9f9e73e7bfa4a5184196b874cfb1dfe179be24.1319184832.git.Martin.Jansa@gmail.com>
Date: Fri, 21 Oct 2011 10:29:26 +0200
Message-Id: <4C420436-8E73-4B8E-B12E-E7BAF72CCB76@dominion.thruhere.net>
References: <bfd27053f71157d3f3d3c0bf523015347714d3f8.1319184832.git.Martin.Jansa@gmail.com>
	<9e9f9e73e7bfa4a5184196b874cfb1dfe179be24.1319184832.git.Martin.Jansa@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [PATCH 3/8] pulseaudio-0.9.23: force ARM mode
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
X-List-Received-Date: Fri, 21 Oct 2011 08:35:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 21 okt. 2011, om 10:17 heeft Martin Jansa het volgende geschreven:

> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
> .../pulseaudio/pulseaudio_0.9.23.bb                |    1 +
> 1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb =
b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> index 4ac2418..2f872b8 100644
> --- a/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> +++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_0.9.23.bb
> @@ -23,3 +23,4 @@ do_compile_prepend() {
>     cp ${STAGING_LIBDIR}/libltdl* ${S}/libltdl
> }
>=20
> +ARM_INSTRUCTION_SET =3D "arm"

Missing PR bump=


