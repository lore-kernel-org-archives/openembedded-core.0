Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f65.google.com (mail-pa0-f65.google.com
	[209.85.220.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5BC4471BE5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 23:46:37 +0000 (UTC)
Received: by mail-pa0-f65.google.com with SMTP id qn10so9689458pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Oct 2016 16:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=XXbLADycMVuCY5/CWvD6D8w04G/WTzMVJ/UELKOehQI=;
	b=TSdcp7JXMlxVngHLtAxIyjBdCV+lOtfrLSR0P0ivssaEF8pV097yiNL2Jwy5jY2fd2
	AZzPZaMEQIKYh6z4svbqtRVCOgzD7uyu0baU5o+3D5biRHW7UaKJRfG10nmX2fmso2kj
	dy5a1n9N9XFg7LZyDq94NC7w9esaIAF/16fafu3LKuvowD99KROtL08Sp4UDj+fnVI3p
	4JWjrDpVSAhjtIdSku3ig8F4rwpSyJLwtTk8vhsehOM+BRGVmbOOwBvOCViiU35Zfnky
	P2b3BMN7KFmGUuBVt1IJRqQTiHYTw08dJPa1OJNf1f2lzpO9EnvU/PMJ7hFlpYI/q/Ns
	K/vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=XXbLADycMVuCY5/CWvD6D8w04G/WTzMVJ/UELKOehQI=;
	b=SPbOkBDzvghApqsfjkDSpfQX81oMBxuvLkrTEQsFVjU3R8MvzYD9vcdWitxPW6f0gu
	RGGRrZ6QTvgtYJBGSi+eSCSHJRiKQ/XyE8+5cRr8C5N0om9lMl9N5p8Ba/T9cqRPcmvH
	vfCB9of4V1j5jfNIpjgqLfTGGuwMV3GcQdWZvkCMCsmpLKjAx0BmJr8Pw9gbC83jy5Li
	zCb/OQdIRiYubXgfMtiL/hRyodcey82oYH12SQLzM8Ivy4dI1C24BJQosFCxNBTkYGtx
	hm6FWzF2UyaGq0ODHy3vQCoQK1A6dRu8XAAE+LwDUzv2jDEgwROV9S9v0yWsY4iwu3uj
	3H5w==
X-Gm-Message-State: AA6/9RnuAgIVyRZ3GJ1Sdyuzdt9xIeI2TyBETg+FW+1yCsvuAdEkFjqZTH55t0AtjWUSyg==
X-Received: by 10.66.49.197 with SMTP id w5mr71057pan.73.1476747999597;
	Mon, 17 Oct 2016 16:46:39 -0700 (PDT)
Received: from [192.168.0.130] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192]) by smtp.gmail.com with ESMTPSA id
	ij5sm36468321pab.2.2016.10.17.16.46.38
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 17 Oct 2016 16:46:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1476182905-15182-1-git-send-email-carol.zhu@nxp.com>
Date: Mon, 17 Oct 2016 16:46:37 -0700
Message-Id: <36B04FB7-A84E-47BA-912C-69C81F1547AE@gmail.com>
References: <1476182905-15182-1-git-send-email-carol.zhu@nxp.com>
To: Yuqing Zhu <carol.zhu@nxp.com>
X-Mailer: Apple Mail (2.3124)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [poky][PATCH] gstreamer1.0-plugins-good: Remove gst_meta_ximage_transform function
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
X-List-Received-Date: Mon, 17 Oct 2016 23:46:38 -0000
X-Groupsio-MsgNum: 88298
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A02A9AC2-749F-4524-ABC0-E231F5E81788";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A02A9AC2-749F-4524-ABC0-E231F5E81788
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

this is ok too

> On Oct 11, 2016, at 3:48 AM, Yuqing Zhu <carol.zhu@nxp.com> wrote:
>=20
> Remove the transform function as it is not supported.
>=20
> Or gst_buffer_copy_into() will print ERROR log.
>=20
> Signed-off-by: Yuqing Zhu <carol.zhu@nxp.com>
> ---
> ...shouldn-t-implement-transform-if-don-t-su.patch | 48 =
++++++++++++++++++++++
> .../gstreamer/gstreamer1.0-plugins-good_1.8.3.bb   |  1 +
> 2 files changed, 49 insertions(+)
> create mode 100755 =
meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-ximageuti=
l-shouldn-t-implement-transform-if-don-t-su.patch
>=20
> diff --git =
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-ximageu=
til-shouldn-t-implement-transform-if-don-t-su.patch =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-ximageu=
til-shouldn-t-implement-transform-if-don-t-su.patch
> new file mode 100755
> index 0000000..a73f16e
> --- /dev/null
> +++ =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0002-ximageu=
til-shouldn-t-implement-transform-if-don-t-su.patch
> @@ -0,0 +1,48 @@
> +=46rom 17b1abd8491d87fab389654f313b72bded24afc2 Mon Sep 17 00:00:00 =
2001
> +From: Song Bing <bing.song@nxp.com>
> +Date: Tue, 26 Apr 2016 16:49:33 +0800
> +Subject: [PATCH] ximageutil: shouldn't implement transform if don't =
support
> + it.
> +
> +shouldn't implement transform if don't support it. Or
> +gst_buffer_copy_into() will print ERROR log.
> +
> +Upstream-Status: Backport [1.9.1]
> +
> +https://bugzilla.gnome.org/show_bug.cgi?id=3D765583
> +---
> + sys/ximage/ximageutil.c |   11 +----------
> + 1 file changed, 1 insertion(+), 10 deletions(-)
> +
> +diff --git a/sys/ximage/ximageutil.c b/sys/ximage/ximageutil.c
> +index ac2fd49..add0422 100644
> +--- a/sys/ximage/ximageutil.c
> ++++ b/sys/ximage/ximageutil.c
> +@@ -36,15 +36,6 @@ gst_meta_ximage_api_get_type (void)
> +   return type;
> + }
> +
> +-static gboolean
> +-gst_meta_ximage_transform (GstBuffer * dest, GstMeta * meta,
> +-    GstBuffer * buffer, GQuark type, gpointer data)
> +-{
> +-  /* ximage metadata can't be transformed or copied */
> +-
> +-  return FALSE;
> +-}
> +-
> + const GstMetaInfo *
> + gst_meta_ximage_get_info (void)
> + {
> +@@ -54,7 +45,7 @@ gst_meta_ximage_get_info (void)
> +     const GstMetaInfo *meta =3D
> +         gst_meta_register (gst_meta_ximage_api_get_type (), =
"GstMetaXImageSrc",
> +         sizeof (GstMetaXImage), (GstMetaInitFunction) NULL,
> +-        (GstMetaFreeFunction) NULL, gst_meta_ximage_transform);
> ++        (GstMetaFreeFunction) NULL, (GstMetaTransformFunction) =
NULL);
> +     g_once_init_leave (&meta_ximage_info, meta);
> +   }
> +   return meta_ximage_info;
> +--
> +1.7.9.5
> +
> diff --git =
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
> index 5cc6578..34b6008 100644
> --- =
a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
> +++ =
b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bb
> @@ -9,6 +9,7 @@ SRC_URI =3D " \
>     =
file://0001-gstrtpmp4gpay-set-dafault-value-for-MPEG4-without-co.patch \
>     file://avoid-including-sys-poll.h-directly.patch \
>     file://ensure-valid-sentinel-for-gst_structure_get.patch \
> +    =
file://0002-ximageutil-shouldn-t-implement-transform-if-don-t-su.patch \
> "
>=20
> SRC_URI[md5sum] =3D "473ebb1f15c67de99ddb6e4d027c0876"
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_A02A9AC2-749F-4524-ABC0-E231F5E81788
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgFYt0ACgkQuwUzVZGdMxTnCACfXyRvylpSsedr5ByKepiZEwx4
yIEAnAjAqEy5UO0g5J67zqOVRRShKsCa
=uyTq
-----END PGP SIGNATURE-----

--Apple-Mail=_A02A9AC2-749F-4524-ABC0-E231F5E81788--
