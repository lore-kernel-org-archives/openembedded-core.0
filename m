Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QwrRX-0001tC-SG
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Aug 2011 10:07:11 +0200
Received: by wwe32 with SMTP id 32so2548970wwe.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Aug 2011 01:02:23 -0700 (PDT)
Received: by 10.216.202.136 with SMTP id d8mr177104weo.52.1314345743637;
	Fri, 26 Aug 2011 01:02:23 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id p18sm1080926wbh.55.2011.08.26.01.02.22
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 26 Aug 2011 01:02:23 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1314318504-9524-6-git-send-email-joelagnel@ti.com>
Date: Fri, 26 Aug 2011 10:02:22 +0200
Message-Id: <256B0DBB-636D-469E-8FF9-9ACD58FAE300@dominion.thruhere.net>
References: <1314318504-9524-1-git-send-email-joelagnel@ti.com>
	<1314318504-9524-6-git-send-email-joelagnel@ti.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Subject: Re: [PATCH meta-oe 5/9] libdvdcss: Imported from OE classic, vlc depends on it
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
X-List-Received-Date: Fri, 26 Aug 2011 08:07:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 aug. 2011, om 02:28 heeft Joel A Fernandes het volgende =
geschreven:

> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
> ---
> meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb |   13 =
+++++++++++++
> 1 files changed, 13 insertions(+), 0 deletions(-)
> create mode 100644 meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb
>=20
> diff --git a/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb =
b/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb
> new file mode 100644
> index 0000000..1a0b7b8
> --- /dev/null
> +++ b/meta-oe/recipes-multimedia/vlc/libdvdcss_1.2.10.bb
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "libdvdcss is a simple library designed for accessing =
DVDs like a block device without having to bother about the decryption."
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
> +PR =3D "r1"

reset that

> +
> +SRC_URI =3D =
"http://download.videolan.org/pub/libdvdcss/${PV}/libdvdcss-${PV}.tar.bz2"=

> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D " --disable-doc "
> +
> +SRC_URI[md5sum] =3D "ebd5370b79ac5a83e5c61b24a214cf74"
> +SRC_URI[sha256sum] =3D =
"2394a75013ab66b592d8c91d53529ede392bc9faee37fe279bd29b455eff2220"
> --=20
> 1.7.0.4
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



