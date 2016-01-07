Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com
	[209.85.220.44])
	by mail.openembedded.org (Postfix) with ESMTP id 5E7C360797
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 01:08:45 +0000 (UTC)
Received: by mail-pa0-f44.google.com with SMTP id uo6so225962168pac.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 17:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=fyUSTzu0ITgTQxvt+D+voKFOkBKbV57zZXRQovEJWQk=;
	b=vPMp+vgX3iFtPnQRwTttogzJnp5UyZsVmebPRrstPa/OnpmeYKFyMjvk3De1JIxxMy
	14+dmvv+1VOp237KLpE6Al326cQHVmPLvHzcBLejgY6q8EzQ7zhGjTCc//vBsMIBDzma
	lp7Bm1pDH5hOEBtbZWgXJMbl5I7mLKNgTFBGmgvoTIle9a4ZaKBiE9mx1L9JyLmBYpZH
	/WCxkVLCny9LioJUuyesM+Hyp0z8zcADWkSu0fl6JHjQW9YUS3SWIsPErKx1R2qzqc8S
	H9RJEn1faqWvv4MtKG6BOkWnGzsHVI2iCyeHiWkvcZmxQmkXp26JttIyC96+Y2+Uqz3x
	9klA==
X-Received: by 10.66.234.226 with SMTP id uh2mr142654452pac.6.1452128926236;
	Wed, 06 Jan 2016 17:08:46 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:91f8:e13b:8b12:2a64?
	([2601:646:8802:5d5c:91f8:e13b:8b12:2a64])
	by smtp.gmail.com with ESMTPSA id
	by2sm90591866pab.6.2016.01.06.17.08.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Jan 2016 17:08:45 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1452072169-1415-1-git-send-email-ross.burton@intel.com>
Date: Wed, 6 Jan 2016 17:08:41 -0800
Message-Id: <43647F23-7669-45EF-952E-973D73AE7CF3@gmail.com>
References: <1452072169-1415-1-git-send-email-ross.burton@intel.com>
To: Ross Burton <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: enable compatibility libraries by default
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
X-List-Received-Date: Thu, 07 Jan 2016 01:08:46 -0000
X-Groupsio-MsgNum: 75544
Content-Type: multipart/signed;
	boundary="Apple-Mail=_454C74F6-BC47-41DC-8360-F63440335FF5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_454C74F6-BC47-41DC-8360-F63440335FF5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Jan 6, 2016, at 1:22 AM, Ross Burton <ross.burton@intel.com> wrote:
>=20
> Too many packages haven't been updated to use the new systemd library =
names, so
> enable the compatibility libraries by default.

I think it would be good if we could get them to move. How many such =
packages do you see ?

>=20
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
> meta/recipes-core/systemd/systemd_228.bb | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-core/systemd/systemd_228.bb =
b/meta/recipes-core/systemd/systemd_228.bb
> index 6673042..19b7b42 100644
> --- a/meta/recipes-core/systemd/systemd_228.bb
> +++ b/meta/recipes-core/systemd/systemd_228.bb
> @@ -59,7 +59,7 @@ LDFLAGS_append_libc-uclibc =3D " -lrt =
-lssp_nonshared -lssp "
>=20
> GTKDOC_DOCDIR =3D "${S}/docs/"
>=20
> -PACKAGECONFIG ??=3D "xz ldconfig \
> +PACKAGECONFIG ??=3D "compat xz ldconfig \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'pam', =
'pam', '', d)} \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', =
'xkbcommon', '', d)} \
>                    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', =
'selinux', '', d)} \
> --
> 2.6.4
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_454C74F6-BC47-41DC-8360-F63440335FF5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaNupwACgkQuwUzVZGdMxST0QCdHXS9LhVF9gUUp2jF894tcsRx
194AnR2QLftCaND0WN/qAga+K6qA+tQQ
=K7TF
-----END PGP SIGNATURE-----

--Apple-Mail=_454C74F6-BC47-41DC-8360-F63440335FF5--
