Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 2055B60EF6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 16:31:03 +0000 (UTC)
Received: by mail-wi0-f169.google.com with SMTP id hn6so2486743wib.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Dec 2013 08:31:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=x9voOqD9ez/F99dQcntToHb3xlA49bh7FaYg7SQnuFo=;
	b=XYUeAxzIbdu+7XTs89kApvfkdfkXNC8e9PxNcV/XlMtrSkBBohL3DVxZ19uKbvrz/Q
	Bird6qntZfL5kxW3aKa1rbT1DyIC7L2Qnp8FSBkZbmp4W3Zy4qVVJaxM5SUdQ94+rnz4
	j7mXuGn7ZDGqO5iVHc6p5CiMcR0WGWRKLsqdD9qOkX8Hz03SlDtXU0MTra4rm11vAvcP
	uq7vqrjEkvHyoY3SrOQOu7lsNPu+ho7erD0oxRjcyL7VAD0z5GjNWdphGGvt0WRZwjhX
	vfTpnMB0YrUyIz5VDHWZ6VZW+ieQ89d+XlU3KLehf9IFC8fSAOdDBgdxjVkvuUa1hjxY
	XGXQ==
X-Gm-Message-State: ALoCoQlLxKxmmn2ArXEvAVpNSUED3M/YkHAysvmtiXLo8ERFMSjuC3/xJbbqHdu1El+sExN/ARen
X-Received: by 10.180.105.199 with SMTP id go7mr3195741wib.53.1386952263222;
	Fri, 13 Dec 2013 08:31:03 -0800 (PST)
Received: from ?IPv6:2001:610:612::880c:3974:d1d9:ea93?
	([2001:610:612:0:880c:3974:d1d9:ea93])
	by mx.google.com with ESMTPSA id fj8sm16190757wib.1.2013.12.13.08.31.01
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 13 Dec 2013 08:31:02 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.0 \(1822\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <6122710ad05d4a2c1fa2d42fba3025cae6dab5ed.1386946335.git.kergoth@gmail.com>
Date: Fri, 13 Dec 2013 17:31:13 +0100
Message-Id: <8A2A314B-911C-4380-BE01-370F7ECAAD95@dominion.thruhere.net>
References: <cover.1386946335.git.kergoth@gmail.com>
	<6122710ad05d4a2c1fa2d42fba3025cae6dab5ed.1386946335.git.kergoth@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
X-Mailer: Apple Mail (2.1822)
Cc: Christopher Larson <chris_larson@mentor.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC 1/2] os-release: add new operating system identification recipe
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
X-List-Received-Date: Fri, 13 Dec 2013 16:31:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 13 dec. 2013, om 15:56 heeft Christopher Larson <kergoth@gmail.com> =
het volgende geschreven:

> From: Christopher Larson <chris_larson@mentor.com>
>=20
> This is needed by systemd, among other useful applications. All fields =
are
> metadata driven, and initial values come from our DISTRO variables.
>=20
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
> meta/recipes-core/os-release/os-release.bb | 42 =
++++++++++++++++++++++++++++++
> 1 file changed, 42 insertions(+)
> create mode 100644 meta/recipes-core/os-release/os-release.bb
>=20
> diff --git a/meta/recipes-core/os-release/os-release.bb =
b/meta/recipes-core/os-release/os-release.bb
> new file mode 100644
> index 0000000..0f67597
> --- /dev/null
> +++ b/meta/recipes-core/os-release/os-release.bb
> @@ -0,0 +1,42 @@
> +inherit allarch
> +
> +SUMMARY =3D "Operating system identification"
> +DESCRIPTION =3D "The /etc/os-release file contains operating system =
identification data."
> +LICENSE =3D "MIT"
> +INHIBIT_DEFAULT_DEPS =3D "1"
> +
> +do_fetch[noexec] =3D "1"
> +do_unpack[noexec] =3D "1"
> +do_patch[noexec] =3D "1"
> +do_configure[noexec] =3D "1"
> +
> +# Other valid fields: BUILD_ID ANSI_COLOR CPE_NAME HOME_URL =
SUPPORT_URL BUG_REPORT_URL
> +OS_RELEASE_FIELDS =3D "ID ID_LIKE NAME VERSION VERSION_ID =
PRETTY_NAME"
> +
> +export ID =3D "${DISTRO}"
> +export NAME =3D "${DISTRO_NAME}"
> +export VERSION =3D "${DISTRO_VERSION}${@' (%s)' % DISTRO_CODENAME if =
'DISTRO_CODENAME' in d else ''}"
> +export VERSION_ID =3D "${DISTRO_VERSION}"
> +export PRETTY_NAME =3D "${DISTRO_NAME} ${VERSION}"

Is DISTRO_NAME allowed to have spaces and weird characters? In =
OE-classic is was used as part of the outputnames in various things, but =
it looks that's safe in OE-core (not in meta-angstrom, though).

regards,

Koen=

