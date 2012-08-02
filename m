Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Swvyo-0001JK-Ks
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:02:22 +0200
Received: by eekb57 with SMTP id b57so1924212eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 06:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=uj/Y6WDub0KOZcaEATI4P9kTRD4fOIGV1npj5KwhFl0=;
	b=Wk34++0ovkUuBc4hNR9o21tZMuEEsXveU/Ai+Up6J8Yg0tuVsI/QNQcCNuBJRypnOu
	5aStqmciw5Iqf7H+xUiJygg2oaz71LSLjqvyxlbCvQNR6CU9/eiGC00tqvFm+p9mGJWI
	hqOI2H1uv2d4M4Bg8l5V0Ywb5QJ6ND5nE4/MfOJGMFZoiNXYZrTUjK75hnam0/qund9z
	7c2rgruG6NJvvVaQgYogGK1eW4z0Wxl+yPHzUp+LkcEilq8JbTmHVcmAYdlPVDz+xMSz
	pF+ZsJlem6TBTZSD78KNHs+nV1GTIW6Qc8MSSobrHoihhlf4Op3KeucGzhMJmmE4Bp5T
	zLDg==
Received: by 10.14.214.197 with SMTP id c45mr27002263eep.37.1343915443065;
	Thu, 02 Aug 2012 06:50:43 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id c7sm17642656eem.9.2012.08.02.06.50.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 06:50:41 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1343909173-2161-1-git-send-email-radu.moisan@intel.com>
Date: Thu, 2 Aug 2012 15:50:39 +0200
Message-Id: <CD1E2BF4-09A1-4800-8191-553B40E4CF6B@dominion.thruhere.net>
References: <1343909173-2161-1-git-send-email-radu.moisan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQlP63Z6HtootevDXqQTUaZuE9lzTVOvUEYVDva9hfNfjG8zC99frPoi8kDxNXAYC49E2z/z
Subject: Re: [PATCH v2] usbutils: Upgrade usbutils to upstream v006
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
X-List-Received-Date: Thu, 02 Aug 2012 14:02:22 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 2 aug. 2012, om 14:06 heeft Radu Moisan <radu.moisan@intel.com> het =
volgende geschreven:

> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
> ---
> .../usbutils/{usbutils_0.91.bb =3D> usbutils_006.bb} |    7 +++----
> 1 file changed, 3 insertions(+), 4 deletions(-)
> rename meta/recipes-bsp/usbutils/{usbutils_0.91.bb =3D> =
usbutils_006.bb} (80%)
>=20
> diff --git a/meta/recipes-bsp/usbutils/usbutils_0.91.bb =
b/meta/recipes-bsp/usbutils/usbutils_006.bb
> similarity index 80%
> rename from meta/recipes-bsp/usbutils/usbutils_0.91.bb
> rename to meta/recipes-bsp/usbutils/usbutils_006.bb
> index abe807c..c1c9fc0 100644
> --- a/meta/recipes-bsp/usbutils/usbutils_0.91.bb
> +++ b/meta/recipes-bsp/usbutils/usbutils_006.bb
> @@ -7,19 +7,18 @@ LICENSE =3D "GPLv2+"
> LIC_FILES_CHKSUM =3D =
"file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae19f"
>=20
> DEPENDS =3D "libusb zlib"
> -PR =3D "r5"
> +PR =3D "r0"

That's the default value, so you can drop this hunk

>=20
> SRC_URI =3D =
"${KERNELORG_MIRROR}/linux/utils/usb/usbutils/usbutils-${PV}.tar.gz \
>            file://usb-devices-avoid-dependency-on-bash.patch \
>            file://Fix-NULL-pointer-crash.patch"
>=20
> -SRC_URI[md5sum] =3D "49de2403b40bf3a9863faaa8d3858deb"
> -SRC_URI[sha256sum] =3D =
"c122346b0225121bcf159abf804116f826a4a3462c94ce7b8871f7559e6b3a46"
> +SRC_URI[md5sum] =3D "850790442f5eb487cdc7e35f8ee03e11"
> +SRC_URI[sha256sum] =3D =
"553270b4030f0844cb70aed57e61c7f10a7ed6641c3bed20249201cec9bcf122"
>=20
> inherit autotools
>=20
> do_install_append() {
> -	ln -s ../sbin/lsusb ${D}${bindir}/lsusb
> 	# We only need the compressed copy, remove the uncompressed =
version
> 	rm -f ${D}${datadir}/usb.ids
> }
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



