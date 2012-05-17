Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SUvGR-0006cE-S2
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 09:37:58 +0200
Received: by wibhm14 with SMTP id hm14so5586881wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 00:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=7ScKSoLOwwmNe+tGApRAg1mdfZW/aOxWUUHqFKf2cP8=;
	b=N5bMW9liavcJtV3pjlTawYgD9Gi1oT19/kxVEvZiChIsYM3o1rZAQjkNj0P8bsL9Y/
	pjlYlX+Vra3LXNkY1gcQSxHo/eGqmGJxRwp2Ilvlsj0q3RaiVEw44YkBEyYnWBwXnpTw
	5gw+1Z/SfQ460hWm4bv9wruRWPi7hCs8Cev+YAhFxP4wLZ+rKeFqNj7cOPdL7Qo3SIhM
	4EFZ0Po5AgSjTURpHUZi7ptpCaKCw9+hsiQwg1X0fe26sFrLKXbtIqhoJo4CpVZy8PE/
	3BIIsJq7gaV5iYJm4k9PI5vlke8eciu83stdYf/q89IIuDpWJ9RvAP4j9r7SD9pgslMk
	kjPQ==
Received: by 10.180.97.3 with SMTP id dw3mr47865675wib.19.1337239605798;
	Thu, 17 May 2012 00:26:45 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id b3sm55187555wib.4.2012.05.17.00.26.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 May 2012 00:26:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1337238883-7920-1-git-send-email-radu.moisan@intel.com>
Date: Thu, 17 May 2012 09:26:39 +0200
Message-Id: <3FCFDD30-9798-4912-8BAD-17E38533655F@dominion.thruhere.net>
References: <1337238883-7920-1-git-send-email-radu.moisan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQleUDlsVWg1k/XF7ETiAGT/KDsmNH/As5Z2BX5eI1fC0th1qg5Lbjz2qDMkjX5iVfJquXnz
Subject: Re: [PATCH] man-pages: Update to 3.41
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
X-List-Received-Date: Thu, 17 May 2012 07:39:32 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 mei 2012, om 09:14 heeft Radu Moisan het volgende geschreven:

> ---
> .../{man-pages_3.36.bb =3D> man-pages_3.41.bb}       |    4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> rename meta/recipes-extended/man-pages/{man-pages_3.36.bb =3D> =
man-pages_3.41.bb} (80%)
>=20
> diff --git a/meta/recipes-extended/man-pages/man-pages_3.36.bb =
b/meta/recipes-extended/man-pages/man-pages_3.41.bb
> similarity index 80%
> rename from meta/recipes-extended/man-pages/man-pages_3.36.bb
> rename to meta/recipes-extended/man-pages/man-pages_3.41.bb
> index 6025a87..cc1c224 100644
> --- a/meta/recipes-extended/man-pages/man-pages_3.36.bb
> +++ b/meta/recipes-extended/man-pages/man-pages_3.41.bb
> @@ -8,8 +8,8 @@ PR =3D "r1"

You forgot to reset PR

> LIC_FILES_CHKSUM =3D =
"file://README;md5=3D0422377a748010b2b738342e24f141c1"
> SRC_URI =3D =
"${KERNELORG_MIRROR}/linux/docs/man-pages/Archive/${BPN}-${PV}.tar.gz"
>=20
> -SRC_URI[md5sum] =3D "cfe991b1ce9e0ea5355f29ff9fcac125"
> -SRC_URI[sha256sum] =3D =
"c0575e31f73cd9dc2761c274217e06e7130fdfee510170957a9d72d012a5437c"
> +SRC_URI[md5sum] =3D "ee8412e72dc79f3c62573add29954b26"
> +SRC_URI[sha256sum] =3D =
"13f08bf1bb7429cd7208acd41250f36fb6b2e12ab9f86f7e8fa8c67af142d81d"
>=20
> RDEPENDS_${PN} =3D "man"
>=20
> --=20
> 1.7.9.5
>=20
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



