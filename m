Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id DE0327757F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 07:22:29 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id c24so2007581pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 00:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to;
	bh=Th9PITASQF7B5cu1/ujDJYxzoHa5jhpmsO+I0NCRAtw=;
	b=iqGIYEvP8aFf0XwrJctSghKVfBCvh2Y43i36IK6bK5neLj+K+FYLOxTRqMuu4Ivybb
	yB15rgSO59YiCBUJDbGvUJIK77ZFTf+gpk/JQNbXXUN+LopjmC7mzvb0W6gm+yRibsgj
	jredlfGFcX4jNTnNO6FQrzFkQb4dCkQmCf5VSBWsZDeqCBFJo/hZ76rh4Qn/Aj995oJz
	7SpkBYVymS2ydpaFDZ8pnxQzvRksqoA6uPGo+GlIXjf1HMeOieuLdsu6F5CTjS2irdjx
	qiDXa7RPi5l9ejEeWhIba2GOh1IJoTfcMhjThhBpXWBAcDIBkfLaDUTUSIozfoclZQDz
	WrPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to;
	bh=Th9PITASQF7B5cu1/ujDJYxzoHa5jhpmsO+I0NCRAtw=;
	b=r5/qdA5xvlfw4Q4nlYJ8IGo2fz7LaLUMqzVLuo0DekE+WwE/AQfW209n9uTfw9beGv
	IUXb8E9+QejyYvoe03LyvQTDiVqNVAXzjLUqakICNpW4g4ubBj6fpzwdIyyvHYOga66t
	Q553IzwKme3/+CGzOl/7URBxv/MTK8DVYGcOb5vqtVglB8b0P/4l8abOyBOut4vxZabl
	Al9IR+VZptRQ7aIm3qXWE5Acl31SPdBljnmrn4saYu4tgNu9OjtznJw8XEFF1/0xDnct
	fke8LK6H5mnNlkoLl5iUaYtF6rqOP+LYWbokaL3QKPE8rj3zabf3Wm29IpalYdNVKrok
	ia2w==
X-Gm-Message-State: AIVw112lOERPL/jn9CNh5YTiWoFo8wXxxrOVPhrpUbCH4IPVgTtbDs1S
	RGahImcVYRjuMbxGNl0=
X-Received: by 10.84.197.69 with SMTP id m63mr26736349pld.50.1499325750351;
	Thu, 06 Jul 2017 00:22:30 -0700 (PDT)
Received: from Khems-MacBook-Pro.local
	([2601:646:8882:b8c:18ea:9bca:fd8c:c77c])
	by smtp.gmail.com with ESMTPSA id
	s80sm2622396pfj.33.2017.07.06.00.22.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 00:22:29 -0700 (PDT)
To: swee.aun.khor@intel.com, openembedded-core@lists.openembedded.org
References: <cover.1499127835.git.swee.aun.khor@intel.com>
	<722571d3f7603fc4dbe132ba50c11057244a8161.1499127835.git.swee.aun.khor@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <e67110b8-07b3-768b-e80b-2a06c4fb55e4@gmail.com>
Date: Thu, 6 Jul 2017 00:22:25 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:54.0)
	Gecko/20100101 Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <722571d3f7603fc4dbe132ba50c11057244a8161.1499127835.git.swee.aun.khor@intel.com>
Subject: Re: [PATCH 7/7] libffi: Support musl-x32 build
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
X-List-Received-Date: Thu, 06 Jul 2017 07:22:30 -0000
X-Groupsio-MsgNum: 99751
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="oAkADOvxLV4uX7oc4jiDRt3uF2rhFfA1X"

--oAkADOvxLV4uX7oc4jiDRt3uF2rhFfA1X
Content-Type: multipart/mixed; boundary="imqoES6TlSIvS7u2H2ecXJkuomkSuqBC9";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: swee.aun.khor@intel.com, openembedded-core@lists.openembedded.org
Message-ID: <e67110b8-07b3-768b-e80b-2a06c4fb55e4@gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] libffi: Support musl-x32 build
References: <cover.1499127835.git.swee.aun.khor@intel.com>
 <722571d3f7603fc4dbe132ba50c11057244a8161.1499127835.git.swee.aun.khor@intel.com>
In-Reply-To: <722571d3f7603fc4dbe132ba50c11057244a8161.1499127835.git.swee.aun.khor@intel.com>

--imqoES6TlSIvS7u2H2ecXJkuomkSuqBC9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/5/17 4:56 PM, swee.aun.khor@intel.com wrote:
> From: sweeaun <swee.aun.khor@intel.com>
>=20
> Upstream-Status: Pending.
> Added target musl-x32 in configure.ac to support musl-x32 build in libf=
fi.
>=20
> Signed-off-by: sweeaun <swee.aun.khor@intel.com>
> ---
>  .../0001-libffi-Support-musl-x32-build.patch       | 29 ++++++++++++++=
++++++++
>  meta/recipes-support/libffi/libffi_3.2.1.bb        |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 meta/recipes-support/libffi/libffi/0001-libffi-Supp=
ort-musl-x32-build.patch
>=20
> diff --git a/meta/recipes-support/libffi/libffi/0001-libffi-Support-mus=
l-x32-build.patch b/meta/recipes-support/libffi/libffi/0001-libffi-Suppor=
t-musl-x32-build.patch
> new file mode 100644
> index 0000000..971a543
> --- /dev/null
> +++ b/meta/recipes-support/libffi/libffi/0001-libffi-Support-musl-x32-b=
uild.patch
> @@ -0,0 +1,29 @@
> +From 62ac8214b3e8b368bd9365a6920b081aa0125671 Mon Sep 17 00:00:00 2001=

> +From: sweeaun <swee.aun.khor@intel.com>
> +Date: Mon, 3 Jul 2017 13:23:31 -0700
> +Subject: [PATCH] libffi: Support musl x32 build
> +
> +Support libffi build with target musl-x32.
> +
> +Signed-off-by: sweeaun <swee.aun.khor@intel.com>
> +---
> + configure.ac | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/configure.ac b/configure.ac
> +index a7bf5ee..f4e101d 100644
> +--- a/configure.ac
> ++++ b/configure.ac
> +@@ -180,6 +180,9 @@ case "$host" in
> + 	    *-gnux32)
> + 	      TARGET=3DX86_64
> + 	      ;;
> ++            *-muslx32)
> ++              TARGET=3DX86_64
> ++              ;;

just OR it with case just above it.
*-gnux32 | *-muslx32

> + 	    *)
> + 	      TARGET=3DX86
> + 	      ;;
> +--=20
> +2.7.4
> +
> diff --git a/meta/recipes-support/libffi/libffi_3.2.1.bb b/meta/recipes=
-support/libffi/libffi_3.2.1.bb
> index 43eee8e..2a3f4b7 100644
> --- a/meta/recipes-support/libffi/libffi_3.2.1.bb
> +++ b/meta/recipes-support/libffi/libffi_3.2.1.bb
> @@ -13,6 +13,7 @@ SRC_URI =3D "ftp://sourceware.org/pub/libffi/${BP}.ta=
r.gz \
>             file://not-win32.patch \
>  	   file://0001-mips-Use-compiler-internal-define-for-linux.patch \
>             file://0001-mips-fix-MIPS-softfloat-build-issue.patch \
> +           file://0001-libffi-Support-musl-x32-build.patch \
>  	   "
> =20
>  SRC_URI[md5sum] =3D "83b89587607e3eb65c70d361f13bab43"
>=20


--imqoES6TlSIvS7u2H2ecXJkuomkSuqBC9--

--oAkADOvxLV4uX7oc4jiDRt3uF2rhFfA1X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAlld5TEACgkQuwUzVZGdMxRtgQCfUi+XW8z+fB5nG6VYmJCvz6IT
ChsAn0lJhvnrpKD8QfGbk3VawNcKl63j
=GkCt
-----END PGP SIGNATURE-----

--oAkADOvxLV4uX7oc4jiDRt3uF2rhFfA1X--
