Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SKOn0-0005Px-1j
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Apr 2012 08:54:54 +0200
Received: by wera1 with SMTP id a1so4548376wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Apr 2012 23:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=V2PONiKnw8oU/J0Jb77gkqb1380z5xFZNpCNxn8q0+E=;
	b=jH5Q2PoOyUKwZZtDj8uIap8Clfccp0dXB5B4FKky7kR8pj6dwEZUaIQNd6j/xKfeAl
	2E9XkEavAv3v+7Ln0+uybwv+H+nOtxF6HMxGsKLBXqoOmTUrmjTw8D1NkDaFsSzQbkR4
	dmJ82/6YPf1atyaYW6u67IO2YFECdRgpSoX4prA7C62YGt2SXp0+9B6QuwPX3UYUCSI/
	MHW5UYtfl9arAglW7Xw7pPpLwZwokrhkT23eZtERhE/ANt1EUyBL2ugiD1HRJFAy85FL
	mJaUWfrXRzL3T491Q/YuISl4gYnHBiHWJimcprzEKsaEWuvJ3odV6vNUlxLXUOHLAYb7
	MeUw==
Received: by 10.216.136.157 with SMTP id w29mr726015wei.23.1334731527028;
	Tue, 17 Apr 2012 23:45:27 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id 17sm33024037wis.0.2012.04.17.23.45.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 17 Apr 2012 23:45:25 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cad24a8ebe31104e0521b419a32b06b4cec3f93f.1334699033.git.sgw@linux.intel.com>
Date: Wed, 18 Apr 2012 08:45:23 +0200
Message-Id: <C5C354B5-E296-435A-AF64-2E23D3BBCF15@dominion.thruhere.net>
References: <cover.1334699033.git.sgw@linux.intel.com>
	<cad24a8ebe31104e0521b419a32b06b4cec3f93f.1334699033.git.sgw@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQnYSa9dgxCus2UfC/B1izxqp4Mt/Ija95oIsZjcbK1FzVufwQ/KtvO1b5PNIT7wTYueawbt
Subject: Re: [PATCH 1/3] lsb: Add DISTRO Info to the lsb-release
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Apr 2012 06:54:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 17 apr. 2012, om 23:46 heeft Saul Wold het volgende geschreven:

> This is needed for distro checking code in the self-hosted-image
>=20
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
> meta/recipes-extended/lsb/lsb_1.4.bb |    5 +++++
> 1 files changed, 5 insertions(+), 0 deletions(-)
>=20
> diff --git a/meta/recipes-extended/lsb/lsb_1.4.bb =
b/meta/recipes-extended/lsb/lsb_1.4.bb
> index f2f25ba..e414d93 100644
> --- a/meta/recipes-extended/lsb/lsb_1.4.bb
> +++ b/meta/recipes-extended/lsb/lsb_1.4.bb
> @@ -4,6 +4,8 @@ HOMEPAGE =3D "http://prdownloads.sourceforge.net/lsb"
> LICENSE =3D "GPLv2+"
> PR =3D "r2"
>=20
> +DEPENDS=3D"util-linux"
> +
> LIC_FILES_CHKSUM =3D =
"file://README;md5=3D12da544b1a3a5a1795a21160b49471cf"
>=20
> SRC_URI =3D =
"${SOURCEFORGE_MIRROR}/project/lsb/lsb_release/${PV}/lsb-release-${PV}.tar=
.gz \
> @@ -31,6 +33,9 @@ do_install(){
> 		echo -n "core-4.1-${TARGET_ARCH}" >>  =
${D}/etc/lsb-release
> 	fi
> 	echo "\"" >> ${D}/etc/lsb-release
> +	echo "DISTRIB_ID=3D${DISTRO}" >> ${D}/etc/lsb-release
> +	echo "DISTRIB_RELEASE=3D${DISTRO_VERSION}" >> =
${D}/etc/lsb-release
> +	echo "DISTRIB_DESCRIPTION=3D\"${DISTRO_NAME} =
${DISTRO_VERSION}\"" >> ${D}/etc/lsb-release

MIssing PR bump=


