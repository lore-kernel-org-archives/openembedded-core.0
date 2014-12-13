Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f176.google.com (mail-pd0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 37C06601F5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 21:05:57 +0000 (UTC)
Received: by mail-pd0-f176.google.com with SMTP id r10so7227067pdi.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Dec 2014 13:05:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=eRNE4H/kuguebfxBOgQu+xWvuqzFTM8O0rXG3KVMXCA=;
	b=mNerPfLz79L389TujTxlxIR7lqGpBiniiYt9genm0UpZOf8gPJKuztemVYb/W4OFHN
	QQK3/wRL8RBS0VqGS4q6zumuy6gsd4XLmVOX+m3LsER8gcRh/CU1h7O9rWUi2PfD41f3
	2z7CGxhwgIXLR2ggGr45R9M1IN0Q/IsvYL+YTx7yyX8IHygrmhI4GK/T513GHx41bmzz
	0Hz6S+xFI1n3rrhWImizBZ1wpuXlo7dU3Tzp2Z9D60LowXE4qDAYuQQwq6+K30cAWYmM
	JkoHd4LjbIlN4ecJ86uZYoDz3hgpL82IgqkfHf8X1JuBG2uI2/CCkZs6O2JMrvxcujK8
	eXwQ==
X-Received: by 10.68.195.41 with SMTP id ib9mr18548238pbc.15.1418504758540;
	Sat, 13 Dec 2014 13:05:58 -0800 (PST)
Received: from [192.168.43.239] ([166.170.39.60])
	by mx.google.com with ESMTPSA id fe5sm4974932pdb.77.2014.12.13.13.05.56
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Dec 2014 13:05:57 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 8.1 \(1993\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1418487971-12276-1-git-send-email-akuster808@gmail.com>
Date: Sat, 13 Dec 2014 13:05:53 -0800
Message-Id: <6C37BD56-04DD-4203-BB8E-92075DAD6C8E@gmail.com>
References: <1418487971-12276-1-git-send-email-akuster808@gmail.com>
To: Armin Kuster <akuster808@gmail.com>
X-Mailer: Apple Mail (2.1993)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [[PATCH] gnutls: upgrade to 3.3.11
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
X-List-Received-Date: Sat, 13 Dec 2014 21:06:07 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Dec 13, 2014, at 8:26 AM, Armin Kuster <akuster808@gmail.com> =
wrote:
>=20
> this also includes a fix for CVE-2014-8564.
>=20
> see http://www.gnutls.org/security.html for CVE-2014-3566 "POODLE" =
statement.
>=20
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
> meta/recipes-support/gnutls/gnutls_3.3.11.bb | 6 ++++++
> meta/recipes-support/gnutls/gnutls_3.3.5.bb  | 7 -------
> 2 files changed, 6 insertions(+), 7 deletions(-)
> create mode 100644 meta/recipes-support/gnutls/gnutls_3.3.11.bb
> delete mode 100644 meta/recipes-support/gnutls/gnutls_3.3.5.bb
>=20
> diff --git a/meta/recipes-support/gnutls/gnutls_3.3.11.bb =
b/meta/recipes-support/gnutls/gnutls_3.3.11.bb
> new file mode 100644
> index 0000000..320c510
> --- /dev/null
> +++ b/meta/recipes-support/gnutls/gnutls_3.3.11.bb
> @@ -0,0 +1,6 @@
> +require gnutls.inc
> +
> +SRC_URI +=3D "file://correct_rpl_gettimeofday_signature.patch \
> +           "
> +SRC_URI[md5sum] =3D "b657e3010c10cae2244e7ce79ee3d446"
> +SRC_URI[sha256sum] =3D =
"aef28d629b6ba824bd435f9b23506525e657e3746d4aa021296b13cbaaa6ae71"
> diff --git a/meta/recipes-support/gnutls/gnutls_3.3.5.bb =
b/meta/recipes-support/gnutls/gnutls_3.3.5.bb
> deleted file mode 100644
> index b3daa49..0000000
> --- a/meta/recipes-support/gnutls/gnutls_3.3.5.bb
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -require gnutls.inc
> -
> -SRC_URI +=3D "file://correct_rpl_gettimeofday_signature.patch \
> -           "
> -
> -SRC_URI[md5sum] =3D "1f396dcf3c14ea67de7243821006d1a2"
> -SRC_URI[sha256sum] =3D =
"48f34ae032692c498e782e9f1369506572be40ecf7f3f3604b0b00bad1b10477"
> --=20
> 1.9.1


This is a simple patch but it will be good if you used -M option for git =
format-patch so git tries
a bit harder to detect renames.

>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


