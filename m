Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id F2CBB6FF56
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 19:05:18 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id yy13so363191509pab.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jan 2016 11:05:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=U6YCOK/3zf1Lh1zDU4kJhDwhNpkmcEZMuez6t1OjDic=;
	b=nUqZCaOygpynH686qt7dmUszg6wOUX5MX63avZ/mh5jPVQyy/O6WhLOpPWNMB5FKMd
	+kVtUlii6S7IPNBUptH4msiXWFcDTCLkY7pUdbVdUbWk3VimqjVeclzk8KSNopIFji8V
	+/z2ZJzpQoONmwvx2iGiqfp5Tl3HcX66qPNl9c+nMOXFHY7wExoDX+hTLuhd6CSDtY0S
	8LkoGJm6OXhrm+vtWZuHs9a2v31gguzRezqdJF0r3BjOG+9pzY61uxGHQq2iqOXONTDs
	bOTjJHdhgoYAObEBFPa/fUbVhqVAvKVj132D8dWqKxWIJmiv/Za3L8L6womFmDUJ1Pq4
	qN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:content-type:from
	:in-reply-to:date:cc:message-id:references:to;
	bh=U6YCOK/3zf1Lh1zDU4kJhDwhNpkmcEZMuez6t1OjDic=;
	b=ggQJtBN0+V+wiXFiLBCmE1xz1czCTJkLSRmEanwwQhrOXYFgxxX5MZ3j3T/UFdZpVl
	ByrKSELbt7ESgWjKvaZngXacDTAay+Ly9PB3lYvFXP3A76HqvhMRFqoBdDjJMKP2agwB
	cwlP9seIc9l1ZsQ3BU0QxwMaG5vCTKe+0KMynfHowp393h5xIZ8o0fAOak3jZnOIxqnA
	vEFJs1AnXmR7QZf6kQzfCAiwSePenWSYZYMwxCDjiF7rsvDv/BkgB/vgTLyd3ARgOroK
	ly+/m6qnIcU4za1fXOrPELZVrHL2pwu0Mfz42whlpCIGT1dTbUvtilNmjq8LznnOwsNX
	0zwQ==
X-Gm-Message-State: AG10YOR4R8P6byxXRzQIDUcnO08HJBlIyakub490XvyAO+9EJukr8PeltKC4GqwKz6tgiQ==
X-Received: by 10.67.7.3 with SMTP id cy3mr36286378pad.100.1453230319047;
	Tue, 19 Jan 2016 11:05:19 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:2cdb:35b7:1df4:399a?
	([2601:646:8802:5d5c:2cdb:35b7:1df4:399a])
	by smtp.gmail.com with ESMTPSA id
	c86sm43148278pfd.75.2016.01.19.11.05.18
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Jan 2016 11:05:18 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <5f464411a18a53b395e749b2b3a1fbfaab4ffd74.1453217744.git.alexander.kanavin@linux.intel.com>
Date: Tue, 19 Jan 2016 11:05:17 -0800
Message-Id: <D70F5507-7ED6-4281-8FC9-4BFE9EAD0B72@gmail.com>
References: <cover.1453217744.git.alexander.kanavin@linux.intel.com>
	<cover.1453217744.git.alexander.kanavin@linux.intel.com>
	<5f464411a18a53b395e749b2b3a1fbfaab4ffd74.1453217744.git.alexander.kanavin@linux.intel.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 01/12] nss: update to 3.21
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
X-List-Received-Date: Tue, 19 Jan 2016 19:05:21 -0000
X-Groupsio-MsgNum: 76438
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CDDF0D43-68C8-40E8-B11A-9F8E69583B37";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CDDF0D43-68C8-40E8-B11A-9F8E69583B37
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 19, 2016, at 7:37 AM, Alexander Kanavin =
<alexander.kanavin@linux.intel.com> wrote:
>=20
> Explicitly disable tests (they were previously implicitly disabled =
upstream),
> as they cause various architecture-specific build failures.
>=20
> Add 0001-Fix-build-failure-on-opensuse-13.1.patch that fixes =
compilation using gcc 4.8.
>=20
> Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> ---
> .../0001-Fix-build-failure-on-opensuse-13.1.patch  | 27 =
++++++++++++++++++++++
> .../nss/{nss_3.19.2.bb =3D> nss_3.21.bb}             | 11 ++++++---
> 2 files changed, 35 insertions(+), 3 deletions(-)
> create mode 100644 =
meta/recipes-support/nss/nss/0001-Fix-build-failure-on-opensuse-13.1.patch=

> rename meta/recipes-support/nss/{nss_3.19.2.bb =3D> nss_3.21.bb} (95%)
>=20
> diff --git =
a/meta/recipes-support/nss/nss/0001-Fix-build-failure-on-opensuse-13.1.pat=
ch =
b/meta/recipes-support/nss/nss/0001-Fix-build-failure-on-opensuse-13.1.pat=
ch
> new file mode 100644
> index 0000000..cb3ad00
> --- /dev/null
> +++ =
b/meta/recipes-support/nss/nss/0001-Fix-build-failure-on-opensuse-13.1.pat=
ch
> @@ -0,0 +1,27 @@
> +=46rom 8758c6a4508a5ca01505a8d69a269c912ce10bee Mon Sep 17 00:00:00 =
2001
> +From: Alexander Kanavin <alex.kanavin@gmail.com>
> +Date: Mon, 18 Jan 2016 18:26:16 +0000
> +Subject: [PATCH] Fix build failure on opensuse 13.1
> +
> +Upstream-Status: Inappropriate [gcc 4.8 specific issue]
> +Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
> +---
> + nss/cmd/modutil/install-ds.h | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/nss/cmd/modutil/install-ds.h =
b/nss/cmd/modutil/install-ds.h
> +index 3a3afb3..433efe0 100644
> +--- a/nss/cmd/modutil/install-ds.h
> ++++ b/nss/cmd/modutil/install-ds.h
> +@@ -243,7 +243,7 @@ struct Pk11Install_Info_str {
> + Pk11Install_Info*
> + Pk11Install_Info_new();
> + void
> +-Pk11Install_Info_init();
> ++Pk11Install_Info_init(Pk11Install_Info* _this);
> + void
> + Pk11Install_Info_delete(Pk11Install_Info* _this);
> + /*// Returns NULL for success, error message if parse error.*/
> +--
> +1.8.4.5
> +
> diff --git a/meta/recipes-support/nss/nss_3.19.2.bb =
b/meta/recipes-support/nss/nss_3.21.bb
> similarity index 95%
> rename from meta/recipes-support/nss/nss_3.19.2.bb
> rename to meta/recipes-support/nss/nss_3.21.bb
> index c51b056..24892b4 100644
> --- a/meta/recipes-support/nss/nss_3.19.2.bb
> +++ b/meta/recipes-support/nss/nss_3.21.bb
> @@ -15,17 +15,18 @@ LIC_FILES_CHKSUM =3D =
"file://nss/COPYING;md5=3D3b1e88e1b9c0b5a4b2881d46cce06a18 \
>                     =
file://nss/lib/freebl/mpi/doc/LICENSE-MPL;md5=3D5d425c8f3157dbf212db2ec53d=
9e5132"
>=20
> SRC_URI =3D "\
> -    =
http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_19_2_RT=
M/src/${BP}.tar.gz \
> +    =
http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_3_21_RTM/=
src/${BP}.tar.gz \
>     file://nss-fix-support-cross-compiling.patch \
>     file://nss-no-rpath-for-cross-compiling.patch \
>     file://nss-fix-incorrect-shebang-of-perl.patch \
>     file://nss-fix-nsinstall-build.patch \
> +    file://0001-Fix-build-failure-on-opensuse-13.1.patch \
>     file://nss.pc.in \
>     file://signlibs.sh \
> "
>=20
> -SRC_URI[md5sum] =3D "b02ffd1e8e8ef5f8512fa02d8ca9db3d"
> -SRC_URI[sha256sum] =3D =
"1306663e8f61d8449ad8cbcffab743a604dcd9f6f34232c210847c51dce2c9ae"
> +SRC_URI[md5sum] =3D "3c8b2ed880dd3a8d86c9e0151afe6eba"
> +SRC_URI[sha256sum] =3D =
"3f7a5b027d7cdd5c0e4ff7544da33fdc6f56c2f8c27fff02938fd4a6fbe87239"
>=20
> UPSTREAM_CHECK_URI =3D =
"https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Release=
s"
> UPSTREAM_CHECK_REGEX =3D "NSS_(?P<pver>.+)_release_notes"
> @@ -84,6 +85,8 @@ do_compile() {
>         export USE_X32=3D1
>     fi
>=20
> +    export NSS_DISABLE_GTESTS=3D1
> +
>     # We can modify CC in the environment, but if we set it via an
>     # argument to make, nsinstall, a host program, will also build =
with it!
>     #
> @@ -129,6 +132,8 @@ do_install() {
>         export USE_X32=3D1
>     fi
>=20
> +    export NSS_DISABLE_GTESTS=3D1
> +

this export is appearing twice
can it be optimized ?

>     make -C ./nss \
>         CCC=3D"${CXX}" \
>         OS_TEST=3D${OS_TEST} \
> --
> 2.6.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_CDDF0D43-68C8-40E8-B11A-9F8E69583B37
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaeiO0ACgkQuwUzVZGdMxQKwQCeOkgw9BUoVQ9BzQYbtqhhEQg2
r/4An1znXOQ9Ar18QkwbLPSwqJrYVhrT
=3T5m
-----END PGP SIGNATURE-----

--Apple-Mail=_CDDF0D43-68C8-40E8-B11A-9F8E69583B37--
