Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1B93A60620
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 11:29:15 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id u12-v6so11985307wrr.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 04:29:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=X1eQ2/ZREk8agqEPcr5inIckwEDoIpVPFO3LX+YtKDI=;
	b=JTTij4l/8+uQgUn9Z2DVuRnF/dHj/mp7Be+DmK8JxzOOMLvS4m0gN2BKFWGgP6rTL3
	KBwHMWd1xWZiq/W1l1s9iQgsdnMa8WObnkd8SeG0p6Zs50gK/egIgHF4Y3ZUHjYGbNQB
	7rpxmNg+5+T8b5rtHsXJgL2YlwW1wHxf2XG6xg/UgGWtAS/iTP2LEOxfKXHls7T3AGsK
	Oi6bvgGYlLK0IQOofGlXoNIutAC1JqWU0oVu8FCSEIa4hXC1kkwJ5XPcIpxwkMH6LIFH
	fMLc2b9/uxD96EnpoKvCZVrzezFZuWPBp506GsDVJ5cw5VNXphsCUrIdL88Mc+yhCrY8
	vWbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=X1eQ2/ZREk8agqEPcr5inIckwEDoIpVPFO3LX+YtKDI=;
	b=qzuEWpz2snOWB3CjhKj7Mw/VaWdEpHwQhH07xhz3o85At4LeZPShk/Stuyh1i/f6Wa
	RIH06Cn9s5pNEBj8cttrSNL2zNuD8oktslgYet8yCmp4cRb+DdVLaV7tv0q9N0qkDHB4
	bcZSQ5Gx3RCwFR6+YKoBTZGrf+ijYxketN/06e72B76enOrPr6K+ZBmpsq9FMbvyeB1k
	1eIqOMLjb+QMMbxgq0wqN4mIAHvgdTDzCCpCAxQLMlq4aDqB6H4Mre6YIgpFm7ipbIj8
	ZeWJa9lxd5Td980O3CoersNDwVe9HAKaakEGeGg/XLXQ3zAYeAGN/R2NhmHJGR1xwqA6
	/6HA==
X-Gm-Message-State: APzg51CVReyiYD5w/mjFvdfi7BEYTWdzHHTUIVcCt5NC1NE7KXgsgpXI
	OsNLo9cxlBo5pJwy1M/bddc=
X-Google-Smtp-Source: ANB0VdbaGgMiYvMVzMZLMnyYkIg7GN4zwkdeeS9xQ6QMSftNMuVQFTi2zzM4Iez7Ti8HbsI24Uk/eQ==
X-Received: by 2002:adf:9b9b:: with SMTP id
	d27-v6mr8534803wrc.240.1535369356780; 
	Mon, 27 Aug 2018 04:29:16 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	200-v6sm12714074wmv.6.2018.08.27.04.29.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 27 Aug 2018 04:29:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 27 Aug 2018 13:29:16 +0200
To: vincent.prince.fr@gmail.com
Message-ID: <20180827112916.GA5442@jama>
References: <1535359120-26088-1-git-send-email-vincent.prince.fr@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1535359120-26088-1-git-send-email-vincent.prince.fr@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Junil Kim <jjunil79.kim@lge.com>, openembedded-core@lists.openembedded.org
Subject: Re: [meta-oe][for-sumo][PATCH] ltrace_git: Update SRC_URI due to inaccessible problem
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
X-List-Received-Date: Mon, 27 Aug 2018 11:29:16 -0000
X-Groupsio-MsgNum: 115465
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cWoXeonUoKmBZSoM"
Content-Disposition: inline

--cWoXeonUoKmBZSoM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 27, 2018 at 10:38:40AM +0200, vincent.prince.fr@gmail.com wrote:
> From: Junil Kim <logyourself@gmail.com>
>=20
> Existing URI service was closed and fetch error occurred.
> Change existing repository to another mirrored SRC URI.
>=20
> Signed-off-by: Junil Kim <jjunil79.kim@lge.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

changes fro meta-oe need to go through openembedded-devel ML as
explained in README file.

> ---
>  meta-oe/recipes-devtools/ltrace/ltrace_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb b/meta-oe/reci=
pes-devtools/ltrace/ltrace_git.bb
> index abe015d..f4033f7 100644
> --- a/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> +++ b/meta-oe/recipes-devtools/ltrace/ltrace_git.bb
> @@ -15,7 +15,7 @@ SRCREV =3D "c22d359433b333937ee3d803450dc41998115685"
> =20
>  DEPENDS =3D "elfutils"
>  RDEPENDS_${PN} =3D "elfutils"
> -SRC_URI =3D "git://anonscm.debian.org/collab-maint/ltrace.git;branch=3Dm=
aster \
> +SRC_URI =3D "git://github.com/sparkleholic/ltrace.git;branch=3Dmaster;pr=
otocol=3Dhttp \
>             file://configure-allow-to-disable-selinux-support.patch \
>             file://0001-replace-readdir_r-with-readdir.patch \
>             file://0001-Use-correct-enum-type.patch \
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cWoXeonUoKmBZSoM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW4PgigAKCRA3VSO3ZXaA
HGTBAKC7nbHXy/QhQ+/FPgy0XAoCWSxbsgCeKXHWIU3KVhxztmhLVwUaRhTLGsQ=
=auuO
-----END PGP SIGNATURE-----

--cWoXeonUoKmBZSoM--
