Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f170.google.com (mail-pf0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id D875260116
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 20:58:13 +0000 (UTC)
Received: by mail-pf0-f170.google.com with SMTP id n128so18567178pfn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Dec 2015 12:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=NTf6ky1lAuEwRvEXhE4mg94ZZIshMj7YSP0ij+Ajahc=;
	b=cYP5/HS2UuQWMQLo8xMgR7WZ1cQlqHLkNAPT8orGuk/E0jH8qBITJNN3k7SeIRvJiQ
	v2C3HEiodC5YwSA10cyu1gyYQZXC9s+5rUQNdj3MlrgTVW+hrwbZnpGKAL/bInNZT+vr
	yQILQmKDafMvSB3ZQgYXWbj4/svfJmn3f4S47MyVA/5WUYRETk8w9ECQ+xRlDWrs2WeF
	BSb+ik8stJSAPDaVNW6Go06I4CK7n7ogaBFgEpdZHYJzuXPAiYQxVkcyH75jxoGIxFRx
	drY0+yYD+hidlUbQSNg+Kl1K4VV63S2t1waYU9Ps4Po8+7NbK4c/aeWJ4ybClcDW6dfZ
	dscw==
X-Received: by 10.98.67.130 with SMTP id l2mr17334072pfi.93.1450385894245;
	Thu, 17 Dec 2015 12:58:14 -0800 (PST)
Received: from 10.177.192.236-ra01.everett.wa.seattle.comcast.net
	(fw01.everett.wa.seattle.comcast.net. [69.241.105.242])
	by smtp.gmail.com with ESMTPSA id
	t73sm13243858pfi.26.2015.12.17.12.58.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Dec 2015 12:58:13 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1450385828-5510-1-git-send-email-ross.burton@intel.com>
Date: Thu, 17 Dec 2015 12:58:12 -0800
Message-Id: <22709A94-E679-468F-82C7-DE41155706E6@gmail.com>
References: <1450385828-5510-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: remove merge conflicts accidently left in
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
X-List-Received-Date: Thu, 17 Dec 2015 20:58:14 -0000
X-Groupsio-MsgNum: 74940
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DB64AD4F-18FB-4A7E-A9B8-4FC9DAB5CE9F";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_DB64AD4F-18FB-4A7E-A9B8-4FC9DAB5CE9F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Dec 17, 2015, at 12:57 PM, Ross Burton <ross.burton@intel.com> =
wrote:
>=20

thanks for fixing it. I was about to send a patch

> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> .../0016-Revert-udev-remove-userspace-firmware-loading-suppor.patch  | =
5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git =
a/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firm=
ware-loading-suppor.patch =
b/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firm=
ware-loading-suppor.patch
> index 03ab0d4..6e5a8fb 100644
> --- =
a/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firm=
ware-loading-suppor.patch
> +++ =
b/meta/recipes-core/systemd/systemd/0016-Revert-udev-remove-userspace-firm=
ware-loading-suppor.patch
> @@ -110,16 +110,13 @@ index a3e639d..00736f5 100644
>  have_manpages=3Dno
>  AC_ARG_ENABLE(manpages, AS_HELP_STRING([--disable-manpages], [disable =
manpages]))
>  AS_IF([test "x$enable_manpages" !=3D xno], [
> -@@ -1616,6 +1635,12 @@ AC_MSG_RESULT([
> +@@ -1616,6 +1635,9 @@ AC_MSG_RESULT([
>          SysV init scripts:       ${SYSTEM_SYSVINIT_PATH}
>          SysV rc?.d directories:  ${SYSTEM_SYSVRCND_PATH}
>          Build Python:            ${PYTHON}
> -+<<<<<<< HEAD
> -+=3D=3D=3D=3D=3D=3D=3D
> +        Installation Python:     ${PYTHON_BINARY}
> +        sphinx binary:           ${SPHINX_BUILD}
> +        firmware path:           ${FIRMWARE_PATH}
> -+>>>>>>> parent of be2ea72... udev: remove userspace firmware loading =
support
>          PAM modules dir:         ${with_pamlibdir}
>          PAM configuration dir:   ${with_pamconfdir}
>          D-Bus policy dir:        ${with_dbuspolicydir}
> --
> 2.6.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_DB64AD4F-18FB-4A7E-A9B8-4FC9DAB5CE9F
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlZzIeQACgkQuwUzVZGdMxQfzgCfRG6RCgPMrk56YdtBl5olsK4p
fEkAnjGeVIuNVGkKXBug5ee2mYV6F9Oz
=IK+d
-----END PGP SIGNATURE-----

--Apple-Mail=_DB64AD4F-18FB-4A7E-A9B8-4FC9DAB5CE9F--
