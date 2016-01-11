Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f178.google.com (mail-pf0-f178.google.com
	[209.85.192.178])
	by mail.openembedded.org (Postfix) with ESMTP id 74984731FC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 20:51:58 +0000 (UTC)
Received: by mail-pf0-f178.google.com with SMTP id e65so50327793pfe.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jan 2016 12:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=VBGi6EZ+ZkcOGwgWuAw2iJGKHTjUJE+5yMJNfYCegJQ=;
	b=lpcFGSQGO30lxS/j+wS2J55oBdebo9pknMqXuiZChwYb1kWQ8X2W7P+FuLWL+Yl7ce
	rj0pwV06DyljPxy+RoYwXY4zOZm9zcjH0xDQgII3nrM3CYL3+2C9aoa3gCRc+2p9YOUF
	oBIj6hOqQCHy2kzNqBMGS8kywmTvt/z4KeMwKRNvp1U9p5ET/vopWmpP1pBQpdj5pKWv
	7cDAiFBaVeRKQmn3IZ+3Iq8EqRIcxym6Q45lC5an3pjYFAClXVLMiNlLeZhLT9uGo0d4
	zWPbxPQwCls2dmYSHzbopp2IawSXo7rcusZubvLOVgAxcUGx1WmWxBFWZXEmYnWRBxna
	dkSg==
X-Received: by 10.98.40.2 with SMTP id o2mr8420508pfo.92.1452545518823;
	Mon, 11 Jan 2016 12:51:58 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:409b:83af:918e:bae1?
	([2601:646:8802:5d5c:409b:83af:918e:bae1])
	by smtp.gmail.com with ESMTPSA id
	l75sm25246532pfj.7.2016.01.11.12.51.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 11 Jan 2016 12:51:58 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1451986361-10021-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
Date: Mon, 11 Jan 2016 12:51:53 -0800
Message-Id: <3263F3BC-4801-4145-9210-12F9ADE54B5D@gmail.com>
References: <1450352712-31476-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1451986361-10021-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
X-Mailer: Apple Mail (2.3112)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/2] boost: ensure boost to remain an empty metapackage
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
X-List-Received-Date: Mon, 11 Jan 2016 20:52:02 -0000
X-Groupsio-MsgNum: 75873
Content-Type: multipart/signed;
	boundary="Apple-Mail=_09ADD895-AFDB-4C0B-ADBB-A5E304C8FAA6";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_09ADD895-AFDB-4C0B-ADBB-A5E304C8FAA6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Jan 5, 2016, at 1:32 AM, Lukas Bulwahn =
<lukas.bulwahn@oss.bmw-carit.de> wrote:
>=20
> To ensure that boost remains an empty metapackage after version
> updates, we explicitly require boost files to be empty. If new
> libraries exist after a version update of the boost recipe,
> bitbake will emit a warning at the do_package task. For example,
> at the version update from 1.58.0 to 1.59.0, the new timer
> library is indicated with:
>=20
> WARNING: QA Issue: boost: Files/directories were installed but not =
shipped in any package:
>  /usr/lib/libboost_timer.so.1.59.0
> Please set FILES such that these items are packaged. Alternatively if =
they are unneeded, avoid installing them or delete them within =
do_install.
> boost: 1 installed and not shipped files. [installed-vs-shipped]
>=20
> Ross Burton suggested this improvement on the openembedded-core
> mailing list during review of the boost recipe version update [1].
>=20
> [1] =
http://lists.openembedded.org/pipermail/openembedded-core/2015-December/11=
4314.html
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
> ---
> meta/recipes-support/boost/boost.inc | 1 +
> 1 file changed, 1 insertion(+)
>=20
> diff --git a/meta/recipes-support/boost/boost.inc =
b/meta/recipes-support/boost/boost.inc
> index 9d7fb89..7167ac3 100644
> --- a/meta/recipes-support/boost/boost.inc
> +++ b/meta/recipes-support/boost/boost.inc
> @@ -59,6 +59,7 @@ FILES_boost-test =3D =
"${libdir}/libboost_prg_exec_monitor*.so.* \
>=20
> # -dev last to pick up the remaining stuff
> PACKAGES +=3D "${PN}-dev ${PN}-staticdev"
> +FILES_${PN} =3D =E2=80=9C"

alternatively use PACKAGES_remove =3D =E2=80=9C${PN}"

> FILES_${PN}-dev =3D "${includedir} ${libdir}/libboost_*.so"
> FILES_${PN}-staticdev =3D "${libdir}/libboost_*.a"
>=20
> --
> 1.9.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_09ADD895-AFDB-4C0B-ADBB-A5E304C8FAA6
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlaUFe0ACgkQuwUzVZGdMxQVAACfYv0od2Onxq8u3vjcXEqxG/9G
YQUAn3PexuO1+jMdu1/QymU6zJDMFJSD
=0lH6
-----END PGP SIGNATURE-----

--Apple-Mail=_09ADD895-AFDB-4C0B-ADBB-A5E304C8FAA6--
