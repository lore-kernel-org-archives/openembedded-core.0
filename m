Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id 87A51770C5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 02:31:50 +0000 (UTC)
Received: by padhy16 with SMTP id hy16so92718784pad.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Oct 2015 19:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=J+iwljSNWw4e39bqNnk+9pIHj76KIsEoE1T6N+hFTJE=;
	b=NCpflKrTSKj6sQLM1XDYMJy8dmTQqUL8ngrSWeZTZfexW8AsgvQkOJoONm2vs2wVVK
	6G2BVV0FreW6RKs4QOFneIhg2ed64e9y/Vi+eY1L7XE3b2tPPyq7knyg53S+63+oRQHs
	xuKZ5HoBczFBHVJ5TEC7QtgSSIfYiKYt1c+MHnmhN63zD0JZM2u0CPtPjt4iMGD8bEvV
	YbI5iYH3K7MuDow9dyupE6IxgRl0ehIOgDkXJmLjt1Mubg0Nvvav/Hg7g0dACf28nMdQ
	bUhlv/ccLqXilc2s60NwmiZKQ3Xav4mtEv+of66aaHfVjtRrS8RQXJshgnnLBWxLaVC3
	xnxA==
X-Received: by 10.67.12.196 with SMTP id es4mr16720093pad.83.1443753109958;
	Thu, 01 Oct 2015 19:31:49 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:dcfa:d09a:1239:f613?
	([2601:646:8601:4580:dcfa:d09a:1239:f613])
	by smtp.gmail.com with ESMTPSA id hh3sm9312631pbc.8.2015.10.01.19.31.49
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 01 Oct 2015 19:31:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1443717514-31684-1-git-send-email-akuster808@gmail.com>
Date: Thu, 1 Oct 2015 19:31:44 -0700
Message-Id: <CDD7FBD2-177B-43C0-9243-AA9C71EC72BC@gmail.com>
References: <1443717514-31684-1-git-send-email-akuster808@gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Mailer: Apple Mail (2.3094)
Cc: Armin Kuster <akuster@mvista.com>, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] ThunderX: Add initial tune file
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
X-List-Received-Date: Fri, 02 Oct 2015 02:31:50 -0000
X-Groupsio-MsgNum: 71875
Content-Type: multipart/signed;
	boundary="Apple-Mail=_CA9BA713-F8B9-4622-91EB-6832712B62A5";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_CA9BA713-F8B9-4622-91EB-6832712B62A5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

Armin

can we get rid of uppercase X

> On Oct 1, 2015, at 9:38 AM, Armin Kuster <akuster808@gmail.com> wrote:
>=20
> From: Armin Kuster <akuster@mvista.com>
>=20
> Signed-off-by: Armin Kuster <akuster@mvista.com>
> ---
> meta/conf/machine/include/tune-thunderX.inc | 19 +++++++++++++++++++
> 1 file changed, 19 insertions(+)
> create mode 100644 meta/conf/machine/include/tune-thunderX.inc
>=20
> diff --git a/meta/conf/machine/include/tune-thunderX.inc =
b/meta/conf/machine/include/tune-thunderX.inc
> new file mode 100644
> index 0000000..89fcaf7
> --- /dev/null
> +++ b/meta/conf/machine/include/tune-thunderX.inc
> @@ -0,0 +1,19 @@
> +require conf/machine/include/arm/arch-armv8.inc
> +
> +DEFAULTTUNE ?=3D "thunderX"
> +AVAILTUNES +=3D "thunderX thunderX_be"
> +
> +TUNEVALID[thunderX] =3D "Enable instructions for Cavium ThunderX"
> +
> +TUNE_CCARGS .=3D "${@bb.utils.contains("TUNE_FEATURES", "thunderX", " =
-mcpu=3Dthunderx ", "",d)}"
> +
> +ARMPKGARCH_tune-thunderX ?=3D "thunderX"
> +ARMPKGARCH_tune-thunderX_be ?=3D "thunderX_be"
> +
> +TUNE_FEATURES_tune-thunderX ?=3D "${TUNE_FEATURES_tune-aarch64} =
thunderX"
> +TUNE_FEATURES_tune-thunderX_be ?=3D "${TUNE_FEATURES_tune-thunderX} =
bigendian"
> +BASE_LIB_tune-thunderX =3D "lib64"
> +BASE_LIB_tune-thunderX_be =3D "lib64"
> +
> +PACKAGE_EXTRA_ARCHS_tune-thunderX =3D "aarch64 thunderX"
> +PACKAGE_EXTRA_ARCHS_tune-thunderX_be =3D "aarch64_be thunderX_be"
> --
> 2.3.5
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_CA9BA713-F8B9-4622-91EB-6832712B62A5
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYN7JQACgkQuwUzVZGdMxQlbgCdHHjxrnhJTLlPgImtRatr35kQ
NDcAn06KJTHoOW7LcUr5Be3FwrEx6ns/
=YNRN
-----END PGP SIGNATURE-----

--Apple-Mail=_CA9BA713-F8B9-4622-91EB-6832712B62A5--
