Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SIDfI-000433-GX
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 08:37:56 +0200
Received: by wera1 with SMTP id a1so1046691wer.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2012 23:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=references:in-reply-to:mime-version:content-transfer-encoding
	:content-type:message-id:cc:x-mailer:from:subject:date:to
	:x-gm-message-state;
	bh=DlWerrac+SqE3hz1G2CZHFypKdPN5uXqgfd2LOhbvVg=;
	b=QM4lRSEEl+f99GZUZNJZrbkEeRprsjv/6WchhZOJwZsA0RTJZhhQuB3ZV6SMBgubG7
	V6TBqopJwF8hcknEKU8eLVk5kXC2IK8Ksi9Qyd0JxspHAXut10yCvCtDu1uXk4ez8/ji
	eA7dMVEZSR8dyuAG5kmRKcefH3FgnPB+jqDWUvPLcacSytip/k8QKtfuuyzzFt5rJLl+
	6THIZ3eQvkVhGULGrCAZyJy632nysEsZt9S9EUQQlf2jERhsVQD954aZh6YBLHxmPQF1
	tqhVV/rCUiq4j9SAaSEuFVu43ABjyz2OASsjgqOR5KsWgNj02QYSZJci4vvSJSZhnoPF
	kLHA==
Received: by 10.180.92.71 with SMTP id ck7mr2846595wib.21.1334212116593;
	Wed, 11 Apr 2012 23:28:36 -0700 (PDT)
Received: from [172.20.1.66] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm18137226wib.8.2012.04.11.23.28.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 Apr 2012 23:28:35 -0700 (PDT)
References: <1334160473-7046-1-git-send-email-florin.sarbu@windriver.com>
In-Reply-To: <1334160473-7046-1-git-send-email-florin.sarbu@windriver.com>
Mime-Version: 1.0 (1.0)
Message-Id: <109F6B28-8525-47CE-A367-B5279375B639@dominion.thruhere.net>
Cc: "<openembedded-core@lists.openembedded.org>"
	<openembedded-core@lists.openembedded.org>
X-Mailer: iPad Mail (9B176)
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 12 Apr 2012 08:28:46 +0200
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlaozQI5U9JxNCUuvZf8qmVihmqageQ2/8doXTyMgChXja5iGarjN5KRutdKtVjw9c4rgmV
Subject: Re: [PATCH] vala: Add vala package as a devtool (version 0.12.1)
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
X-List-Received-Date: Thu, 12 Apr 2012 06:37:56 -0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



Op 11 apr. 2012 om 18:07 heeft Florin Sarbu <florin.sarbu@windriver.com> het=
 volgende geschreven:

> Added the vala package from meta-oe to support future systemd integration.=


But systemd doesn't need vala......


>=20
> Signed-off-by: Florin Sarbu <florin.sarbu@windriver.com>
> ---
> meta/recipes-devtools/vala/vala.inc       |   25 +++++++++++++++++++++++++=

> meta/recipes-devtools/vala/vala_0.12.1.bb |    7 +++++++
> 2 files changed, 32 insertions(+), 0 deletions(-)
> create mode 100644 meta/recipes-devtools/vala/vala.inc
> create mode 100644 meta/recipes-devtools/vala/vala_0.12.1.bb
>=20
> diff --git a/meta/recipes-devtools/vala/vala.inc b/meta/recipes-devtools/v=
ala/vala.inc
> new file mode 100644
> index 0000000..0815c66
> --- /dev/null
> +++ b/meta/recipes-devtools/vala/vala.inc
> @@ -0,0 +1,25 @@
> +DESCRIPTION =3D "Vala is a C#-like language dedicated to ease GObject pro=
gramming. \
> +Vala compiles to plain C and has no runtime environment nor penalities wh=
atsoever."
> +SECTION =3D "devel"
> +DEPENDS =3D "glib-2.0 dbus"
> +BBCLASSEXTEND =3D "native"
> +DEPENDS_virtclass-native =3D "glib-2.0-native dbus-native"
> +HOMEPAGE =3D "http://vala-project.org"
> +LICENSE =3D "LGPLv2.1"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dfbc093901857fcd118f065f900982c=
24"
> +INC_PR =3D "r0"
> +
> +#
> +# WARNING: This source release has specifically been built for OpenEmbedd=
ed.
> +# Don't update to any upstream release without consulting the recipe main=
tainer.
> +#
> +
> +SRC_URI =3D "\
> +  http://downloads.freesmartphone.org/sources/vala-${PV}.tar.bz2;name=3Da=
rchive \
> +"
> +
> +inherit autotools
> +
> +EXTRA_OECONF =3D "--disable-vapigen"
> +
> +FILES_${PN}-doc +=3D "${datadir}/devhelp"
> diff --git a/meta/recipes-devtools/vala/vala_0.12.1.bb b/meta/recipes-devt=
ools/vala/vala_0.12.1.bb
> new file mode 100644
> index 0000000..1049ed6
> --- /dev/null
> +++ b/meta/recipes-devtools/vala/vala_0.12.1.bb
> @@ -0,0 +1,7 @@
> +require vala.inc
> +SRC_URI =3D "ftp://ftp.gnome.org/pub/GNOME/sources/vala/0.12/vala-${PV}.t=
ar.bz2"
> +
> +FILES_${PN} +=3D "${datadir}/vala-0.12/vapi"
> +
> +SRC_URI[md5sum] =3D "bf35262cc611de447147d01cbac33767"
> +SRC_URI[sha256sum] =3D "d9a2be21bb8ab88eab838e7f3a4d0aaa2a1fddf35615dca32=
bef6a0051f58ea8"
> --=20
> 1.7.9.1
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


