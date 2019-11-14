Return-Path: <alex.kanavin@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id D7AAD6B43D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 09:21:31 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 8so5034484wmo.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Nov 2019 01:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=I/obdUmr1yj7fd0tHSCYE58wcdGy8aBiVIGuBd2VzVQ=;
	b=qi/3V5rqCksmrPkV9W1+wOmeZQVW3mvcPK7btzpPgytQj6tUjLY4DQ/VAP8bIhqd3l
	xFRZvKv2XCjITHMVxbt0mq9p+egzEaW/5JmerLM3amb3ToJ4EH1NeZq60LBrXVvA+yXm
	tKx5++vXFvuICDFOtyDNFxkVT0qViPyEd5poXI9i/Q6ENrryYWL1hHO1c5hKeAAgdFDQ
	lpr27uf2sxc2l0xS/cLW29KTLjs/bzlNVzThTwUk+W5cR1coIucGzQ7C4Z1yNbtgvY9O
	+WgQaxbFzy0+nRdwWW44ZDqd4AcFjSNB7SjTVQne1GCRQ5q3D36mvRnje5zzy1ToQgbe
	9P1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=I/obdUmr1yj7fd0tHSCYE58wcdGy8aBiVIGuBd2VzVQ=;
	b=TACzBcsiFQZaelo6rCL2R29zYabocgjYEN+EK4P+EHCtHgejGLIr4f5FilCsLREvgS
	5UV0pUIvF6kRFPAoAZkHDBzbJcNcWIbcjKcfPF2rC7xdn6D62eJEnMq/u0BibuiWhm1u
	dVhHSaVNlvwJ/mxm93yFgE635I4qexGG8yrJNK3qRDV8aKuEm/BtPNq6fjPAdx2A1uHg
	ZwB9C01Exr+/KYNVd9CClrRgfNT28hcEyB7PYgUr9D+J7yjMbu+7G4GkJ3UlYlviAGsC
	7OuJIrhlPPnJCg4ATh82KBMcfHRM20Jn22wGZOCD3xCSRTeOHpkh5A7+zET1iGggfS0E
	Oruw==
X-Gm-Message-State: APjAAAXEglMqzA1mSd9MSQQ4JT4rirpBzgKJG94P4F2to4oZjEKjCxmD
	YdTKIqS4b4pja3NGHEUhWKg=
X-Google-Smtp-Source: APXvYqxmaDKInqk/4cB2nGESMezZqoLebdV2NHSNR7K7RETSrDaxnwTEM2RO5gv/tYTiTWH6ykzshQ==
X-Received: by 2002:a05:600c:214c:: with SMTP id
	v12mr6751610wml.124.1573723292395; 
	Thu, 14 Nov 2019 01:21:32 -0800 (PST)
Received: from [192.168.101.82] (p50991d97.dip0.t-ipconnect.de.
	[80.153.29.151])
	by smtp.gmail.com with ESMTPSA id 19sm7995355wrc.47.2019.11.14.01.21.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Nov 2019 01:21:31 -0800 (PST)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16G102)
In-Reply-To: <20191114055140.35965-1-naveen.kumar.saini@intel.com>
Date: Thu, 14 Nov 2019 10:21:30 +0100
Message-Id: <A609A7D8-71A4-44A0-9AFD-6F3A7BAFDC51@gmail.com>
References: <20191114055140.35965-1-naveen.kumar.saini@intel.com>
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] libva: upgrade 2.5.0 -> 2.6.0.pre1
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
X-List-Received-Date: Thu, 14 Nov 2019 09:21:32 -0000
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

These are prereleases, let=E2=80=99s wait for the actual release.

Alex

> On 14 Nov 2019, at 6.51, Naveen Saini <naveen.kumar.saini@intel.com> wrote=
:
>=20
> Details can be found here:
> https://github.com/intel/libva/releases/tag/2.6.0.pre1
>=20
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
> .../libva/{libva_2.5.0.bb =3D> libva_2.6.0.pre1.bb}          | 7 +++----
> 1 file changed, 3 insertions(+), 4 deletions(-)
> rename meta/recipes-graphics/libva/{libva_2.5.0.bb =3D> libva_2.6.0.pre1.b=
b} (88%)
>=20
> diff --git a/meta/recipes-graphics/libva/libva_2.5.0.bb b/meta/recipes-gra=
phics/libva/libva_2.6.0.pre1.bb
> similarity index 88%
> rename from meta/recipes-graphics/libva/libva_2.5.0.bb
> rename to meta/recipes-graphics/libva/libva_2.6.0.pre1.bb
> index e75648b2be..73ea280053 100644
> --- a/meta/recipes-graphics/libva/libva_2.5.0.bb
> +++ b/meta/recipes-graphics/libva/libva_2.6.0.pre1.bb
> @@ -17,10 +17,9 @@ SECTION =3D "x11"
> LICENSE =3D "MIT"
> LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2e48940f94acb0af582e5ef03537800=
f"
>=20
> -SRC_URI =3D "https://github.com/intel/${BPN}/releases/download/${PV}/${BP=
}.tar.bz2"
> -
> -SRC_URI[md5sum] =3D "3688212fb7a87947070f3729e91ff7cf"
> -SRC_URI[sha256sum] =3D "3aa89cd369a506ac4dbe5de7c0ef5da4f3d220bf986403f02=
fa1f6f702af6878"
> +SRC_URI =3D "git://github.com/intel/libva.git;protocol=3Dhttps"
> +SRCREV =3D "d49b99d5d88f66e2e1ca451cf19251c7950c870d"
> +S =3D "${WORKDIR}/git"
>=20
> UPSTREAM_CHECK_URI =3D "https://github.com/intel/libva/releases"
>=20
> --=20
> 2.17.1
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

