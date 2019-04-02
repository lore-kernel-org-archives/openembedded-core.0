Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 78E157D167
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Apr 2019 08:40:02 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id h4so15442810wre.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Apr 2019 01:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=LLw7dz2wwrBwG2TUB9BKK2yyeuQHMj6eSC4Qn1zFo6E=;
	b=YtCbCgGP3m9ZUliQhVkLLZ5YriYEq2afWOMNExvXmRJF74RizzslndjZiQEJ0cVzSc
	yJ76koamHKq3t9whFULq04UyT5uqzsbGPRfa4ddS9WJ3K5e8mQ58oCuKHQoyl1D8szKF
	5ygHqhBIifzTNG9TKv5rLtCuTiZ8wCphfWpnpDV7evxdCQuF6jVqRdSgY9z6Aw+BP6rB
	7X1b40dr+WQdKD+ZiYyOPg4U09+LgtKtmjCLShCtaGf1lQbjCvjs5IhyOEMj07Z1F3g9
	R9IxAx4nYf8GwMJtOFvzWMt3cyZIGnVXHzRr2lDx+ganJnhrda8xNPCQzUdsB+N1HYrn
	CnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=LLw7dz2wwrBwG2TUB9BKK2yyeuQHMj6eSC4Qn1zFo6E=;
	b=mRG+QVayV8f7QwmMdx8QIJFqjfcpaoEICh2Dkzkat6eF1Y7CH5+17Rie0ni7/vIuSa
	5FrgXbRsRLjcbmY2WR6HN3wnOqzCIKuHHNqnyXwFd66h8tLyyX2pxeiOmmAjm4Bb0wdL
	ni1pu9SELJNELmm8u0ECI8uD58VyAM4NUZYGvQ2kqJO+zcV7AKqu/KBEKAaN9C6RjToV
	TUb8MYSKHYfjFFKawxyvghiCaXfUdwgsb3hplR7h2hHoOT+HauvB+OVoXbAE8OyoSW4f
	5JGA3aFafXBv1jGPcXZmrhBV0PQnKVWQAEO+7xAzwcIXkD1rj2qvG8sXltrt+czP0vCf
	FIWQ==
X-Gm-Message-State: APjAAAWxy8+nW6kFarmyLn6U/9TaiczHRz88OH1Pk+SVT9huDJF/9UIf
	0Qj0VUsSwsDuXPFsCPSDe8FAJwzV+8o=
X-Google-Smtp-Source: APXvYqx16bZ48OY741M472qX0DXUkBYmxO3QryINE4WVNQiQLGrOhsrl7Tnveq+V13xFKVcLvTwcvw==
X-Received: by 2002:a05:6000:12c8:: with SMTP id
	l8mr42155974wrx.80.1554194403057; 
	Tue, 02 Apr 2019 01:40:03 -0700 (PDT)
Received: from [10.128.45.74] ([141.113.67.87])
	by smtp.gmail.com with ESMTPSA id
	q8sm15569567wmq.35.2019.04.02.01.40.02
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 02 Apr 2019 01:40:02 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <20190402082301.3817-1-nathan@nathanrossi.com>
Date: Tue, 2 Apr 2019 10:40:01 +0200
Message-Id: <B772C969-0B56-49AA-A7DE-29B223EF411C@gmail.com>
References: <20190402082301.3817-1-nathan@nathanrossi.com>
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] fatresize_1.0.2.bb: Add recipe for fatresize command line tool
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
X-List-Received-Date: Tue, 02 Apr 2019 08:40:02 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Should this go to meta-oe though? It doesn=E2=80=99t seem like an essential t=
ool.

Alex

> On 2 Apr 2019, at 10.23, Nathan Rossi <nathan@nathanrossi.com> wrote:
>=20
> The fatresize command line tool provides command line access to the
> libparted-fs-resize library implementation of the FAT partition
> resizing.
>=20
> This tool is useful for safely resizing FAT partitions which are
> commonly found as the boot partition on a variety of SoC targets (e.g.
> RaspberryPi).
>=20
> The Debian version of the source is used as the original upstream on
> SourceForge is no longer actively maintained.
>=20
> Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
> ---
> The reason for locating the recipe in the parted directory is that the
> program itself does not implement the FAT partition resizing it is
> merely exposing the functionality from libparted-fs-resize as a command
> line tool.
> ---
> meta/recipes-extended/parted/fatresize_1.0.2.bb | 15 +++++++++++++++
> 1 file changed, 15 insertions(+)
> create mode 100644 meta/recipes-extended/parted/fatresize_1.0.2.bb
>=20
> diff --git a/meta/recipes-extended/parted/fatresize_1.0.2.bb b/meta/recipe=
s-extended/parted/fatresize_1.0.2.bb
> new file mode 100644
> index 0000000000..a2f6b6d131
> --- /dev/null
> +++ b/meta/recipes-extended/parted/fatresize_1.0.2.bb
> @@ -0,0 +1,15 @@
> +SUMMARY =3D "Resize FAT partitions using libparted"
> +SECTION =3D "console/tools"
> +LICENSE =3D "GPLv2"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D94d55d512a9ba36caa9b7df079bae1=
9f"
> +
> +SRC_URI =3D "git://salsa.debian.org/parted-team/fatresize.git;protocol=3D=
https"
> +SRCREV =3D "3f80afc76ad82d4a1b852a6c8dea24cd9f5e7a24"
> +
> +PV =3D "1.0.2-11-git+${SRCPV}"
> +
> +S =3D "${WORKDIR}/git"
> +
> +DEPENDS =3D "parted"
> +
> +inherit autotools pkgconfig
> ---
> 2.20.1
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

