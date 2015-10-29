Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 18B9875A38
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 11:47:19 +0000 (UTC)
Received: by wmff134 with SMTP id f134so23338043wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Oct 2015 04:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=Nf56aMsXF2Uf9SK4xoQB+HJBkjxIGZoK9BcD2kg+KnA=;
	b=yWvEzlNqzWRGWfgMwddprhbYjrp0O5vMR24q0J72Y/h+6553gzvB3GsfpO2mzM3Fus
	QTgV+tD/jRCZWd2G+EqKcJZIyTpuHTz8yQiLXoKo9+b2AvrKI6N/3da4II9H9YlXy2qa
	Vc+Y+vWrUsdMt6d0hL3bQDpXkrxXEyui1/eRKDiPjZMAfLBwwi9pOIfbtvvPm8OKCC7W
	zGI6bIKucH8xlvcNqA6ZqyY2ScLf62OZEzFwIEfm7pjZDy4qQH6CkYHKg091g6tPEYAD
	A6tX0FguhzztnG7Iofn5OCdp+I2I5NXW+lDBlSUJHk3wPSCFrmY6UzKOLM3I0PPilziF
	9eiw==
X-Received: by 10.28.145.134 with SMTP id t128mr5967376wmd.64.1446119239619;
	Thu, 29 Oct 2015 04:47:19 -0700 (PDT)
Received: from ernie.muppets.liwing.de (p578b540c.dip0.t-ipconnect.de.
	[87.139.84.12]) by smtp.gmail.com with ESMTPSA id
	bh5sm1369397wjb.42.2015.10.29.04.47.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Oct 2015 04:47:18 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
From: Jens Rehsack <rehsack@gmail.com>
In-Reply-To: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
Date: Thu, 29 Oct 2015 12:47:18 +0100
Message-Id: <16FB52C0-E87A-40C9-A677-F1220982FB30@gmail.com>
References: <6A0E85DF-31B7-4955-B4A2-0F3E099FCF99@gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.2104)
Subject: Re: [PATCH 1/1] Update libusb1 from 1.0.19 to 1.0.20
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Oct 2015 11:47:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Am 08.10.2015 um 16:36 schrieb Jens Rehsack <rehsack@gmail.com>:
>=20
> This updates libusb1 from 1.0.19 to 1.0.20
>=20
> 2015-09-13: v1.0.20
> * Add Haiku support
> * Fix multiple memory and resource leaks (#16, #52, #76, #81)
> * Fix possible deadlock when executing transfer callback
> * New libusb_free_pollfds() API
> * Darwin: Fix devices not being detected on OS X 10.8 (#48)
> * Linux: Allow larger isochronous transfer submission (#23)
> * Windows: Fix broken builds Cygwin/MinGW builds and compiler warnings
> * Windows: Fix broken bus number lookup
> * Windows: Improve submission of control requests for composite =
devices
> * Examples: Add two-stage load support to fxload (#12)
> * Correctly report cancellations due to timeouts
> * Improve efficiency of event handling
> * Improve speed of transfer submission in multi-threaded environments
> * Various other bug fixes and improvements
> The (#xx) numbers are libusb issue numbers, see ie:
> https://github.com/libusb/libusb/issues/16
>=20
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
> meta/recipes-support/libusb/{libusb1_1.0.19.bb =3D> libusb1_1.0.20.bb} =
| 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
> rename meta/recipes-support/libusb/{libusb1_1.0.19.bb =3D> =
libusb1_1.0.20.bb} (85%)
>=20
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.19.bb =
b/meta/recipes-support/libusb/libusb1_1.0.20.bb
> similarity index 85%
> rename from meta/recipes-support/libusb/libusb1_1.0.19.bb
> rename to meta/recipes-support/libusb/libusb1_1.0.20.bb
> index a20e1fc..21b8b45 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.19.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.20.bb
> @@ -11,8 +11,8 @@ BBCLASSEXTEND =3D "native nativesdk"
> SRC_URI =3D "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
>           "
>=20
> -SRC_URI[md5sum] =3D "f9e2bb5879968467e5ca756cb4e1fa7e"
> -SRC_URI[sha256sum] =3D =
"6c502c816002f90d4f76050a6429c3a7e0d84204222cbff2dce95dd773ba6840"
> +SRC_URI[md5sum] =3D "1d4eb194eaaa2bcfbba28102768c7dbf"
> +SRC_URI[sha256sum] =3D =
"cb057190ba0a961768224e4dc6883104c6f945b2bf2ef90d7da39e7c1834f7ff"
>=20
> S =3D "${WORKDIR}/libusb-${PV}"
>=20
> --=20
> 2.4.3

Ping :)
--=20
Jens Rehsack - rehsack@gmail.com


