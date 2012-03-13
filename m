Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S7MuA-0001Tx-1Y
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 09:16:26 +0100
Received: by wibhj13 with SMTP id hj13so295762wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 01:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=gY53u9OFXDRwBrC4Nz4QPg8kxX4jO/3bvATAqBmw1r8=;
	b=ZvuQ71+Ng8luQkotQtFI/jBxwEaYGkHmq1z5ZHZ4Ew7TMO14pT6eh9xgzv0bv9Cn80
	UzlBfSgEVNn+sI6FIy8p92d/3moSuxWZRDlPAcTrAh6W+fumTtW3GGUt7hcF/vKbMnFc
	0X7bdkjljw9BED+gNzcboMKNn7phCa87o309LmJizflb3D9qZeRuS7q8Ut4TZb8zR8Kt
	he+HzznzROEKoaoyjKrHIOlo00G4yG+um6Htfn6C36j1L9fnEyrXUbCkMPb/Znr41hZg
	DJYS/DNwoE4D32p1ZkjJOw/aG9m5VJpbEDvrFS/4QuB0kBB2sQTo8jtl0OTJW1WHlEC2
	ISow==
Received: by 10.216.85.81 with SMTP id t59mr9272112wee.28.1331626061946;
	Tue, 13 Mar 2012 01:07:41 -0700 (PDT)
Received: from [10.68.37.11] ([87.111.147.121])
	by mx.google.com with ESMTPS id be4sm70042673wib.8.2012.03.13.01.07.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Mar 2012 01:07:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
Date: Tue, 13 Mar 2012 09:07:44 +0100
Message-Id: <63F58257-6C34-409B-948C-B4C1D0CAF211@dominion.thruhere.net>
References: <cover.1331598077.git.richard.purdie@linuxfoundation.org>
	<df48742cfc0c46ae33f28900cfd5a7a2f94c326c.1331598077.git.richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQk06JMTU0kdKvE6nnl0w/p3jTUvBz8c9qONNu2liG3XJl7r/hKSVEa8ipupe8al6ZOYsf0R
Subject: Re: [PATCH 01/17] leafpad: Package currently unpackaged files.
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
X-List-Received-Date: Tue, 13 Mar 2012 08:16:26 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 mrt. 2012, om 01:22 heeft Richard Purdie het volgende geschreven:

> This resolves the QA warning:
>=20
> WARNING: For recipe leafpad, the following files/directories were =
installed but not shipped in any package:
> WARNING:   /usr/share/icons
> WARNING:   /usr/share/icons/hicolor
> WARNING:   /usr/share/icons/hicolor/16x16
> WARNING:   /usr/share/icons/hicolor/22x22
> WARNING:   /usr/share/icons/hicolor/scalable
> WARNING:   /usr/share/icons/hicolor/32x32
> WARNING:   /usr/share/icons/hicolor/24x24
> WARNING:   /usr/share/icons/hicolor/16x16/apps
> WARNING:   /usr/share/icons/hicolor/16x16/apps/leafpad.png
> WARNING:   /usr/share/icons/hicolor/22x22/apps
> WARNING:   /usr/share/icons/hicolor/22x22/apps/leafpad.png
> WARNING:   /usr/share/icons/hicolor/scalable/apps
> WARNING:   /usr/share/icons/hicolor/scalable/apps/leafpad.svg
> WARNING:   /usr/share/icons/hicolor/32x32/apps
> WARNING:   /usr/share/icons/hicolor/32x32/apps/leafpad.png
> WARNING:   /usr/share/icons/hicolor/24x24/apps
> WARNING:   /usr/share/icons/hicolor/24x24/apps/leafpad.png
>=20
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
> meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb |    6 ++++--
> 1 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb =
b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
> index 68402c5..3d1bc43 100644
> --- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
> +++ b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
> @@ -1,6 +1,5 @@
> DESCRIPTION =3D "Simple GTK+ Text Editor"
> HOMEPAGE =3D "http://tarot.freeshell.org/leafpad/"
> -BUGTRACKER =3D ""
>=20
> LICENSE =3D "GPLv2 & GPLv2+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f \
> @@ -14,7 +13,7 @@ SRC_URI =3D =
"http://savannah.nongnu.org/download/${BPN}/${BPN}-${PV}.tar.gz \
>=20
> SRC_URI[md5sum] =3D "254a72fc67505e3aa52884c729cd7b97"
> SRC_URI[sha256sum] =3D =
"959d22ae07f22803bc66ff40d373a854532a6e4732680bf8a96a3fbcb9f80a2c"
> -PR =3D "r1"
> +PR =3D "r2"
>=20
> SRC_URI_append_poky +=3D " file://owl-menu.patch;apply=3Dyes "
>=20
> @@ -29,3 +28,6 @@ do_install_append () {
> }
>=20
> FILES_${PN} +=3D "${datadir}/applications/leafpad.desktop"
> +
> +PACKAGES +=3D "leafpad-stock-icons"
> +FILES_leafpad-stock-icons =3D "${datadir}/icons/hicolor/"

I strongly suspect that that .desktop will reference leafpad.png as the =
icon, but I haven't actually verified that. This recipe should probably =
inherit gtk-icon-cache.

regards,

Koen=


