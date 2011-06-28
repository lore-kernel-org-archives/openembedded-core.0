Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QbTI6-0006V9-0H
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 10:05:02 +0200
Received: by wwi18 with SMTP id 18so328099wwi.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 01:01:17 -0700 (PDT)
Received: by 10.216.58.131 with SMTP id q3mr230625wec.25.1309248077318;
	Tue, 28 Jun 2011 01:01:17 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id h22sm3145851wes.8.2011.06.28.01.01.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 28 Jun 2011 01:01:16 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <7bf8a7025dddd0b251ff9c37a55f28b7e099fad7.1309246787.git.edwin.zhai@intel.com>
Date: Tue, 28 Jun 2011 10:01:10 +0200
Message-Id: <E91A85C8-4484-4C15-A75D-3A87EB475B4F@dominion.thruhere.net>
References: <cover.1309246787.git.edwin.zhai@intel.com>
	<7bf8a7025dddd0b251ff9c37a55f28b7e099fad7.1309246787.git.edwin.zhai@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1084)
Subject: Re: [PATCH 2/3] webkit-gtk: recommends glib-networking to access https web page
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
X-List-Received-Date: Tue, 28 Jun 2011 08:05:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 jun 2011, om 09:42 heeft edwin.zhai@intel.com het volgende =
geschreven:

> From: Zhai Edwin <edwin.zhai@intel.com>
>=20
> [YOCTO #1037] got fixed
>=20
> Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
> ---
> meta/recipes-sato/webkit/webkit-gtk_svn.bb |    3 +++
> 1 files changed, 3 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-sato/webkit/webkit-gtk_svn.bb =
b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> index 6d134ad..c9ded4e 100644
> --- a/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> +++ b/meta/recipes-sato/webkit/webkit-gtk_svn.bb
> @@ -10,6 +10,9 @@ LIC_FILES_CHKSUM =3D =
"file://WebCore/rendering/RenderApplet.h;endline=3D22;md5=3Dfb969
> DEPENDS =3D "enchant gnome-keyring libsoup-2.4 curl icu libxml2 cairo =
libxslt libxt libidn gnutls gtk+ gstreamer gst-plugins-base flex-native =
gperf-native perl-native-runtime sqlite3"
> DEPENDS_darwin8 =3D "curl icu libxml2 cairo libxslt libidn gnutls gtk+ =
gstreamer flex-native gperf-native perl-native-runtime sqlite3"
>=20
> +# To access ssl web pages
> +RRECOMMENDS_${PN} +=3D "glib-networking"

Since webkit uses soup and curl, wouldn't it be better to add the =
RRECOMMENDS to soup instead? Webkit knows nothing about GIO.

regards,

Koen=


