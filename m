Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 0C61661EB2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 02:27:57 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id z10so4503584pdj.17
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 19:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=ht6JF7CDzF1QNw8eBodppovhyCWMfNy4t+UjMJRjf64=;
	b=bHJJsOaHzls97IJDz6btOm6VNYSecGANWK/sOZcRof+mUNogRbC65e1ZpquW2nMcYy
	gNBgkVk5OLVprvYbU+/5/HdkWUEoIwLEGbrZJF/TKs4AQ3K6no1dk6xt1c6sON1Zsi2r
	rHyX4hhJfdkRsC0ankNT0sw+ZXLYL04d2r76op0d3PWdUShEOYHOC5XeOvjg4zs1e8mA
	a731geWf5wQn9j0zr87sA2ZLCUK3UsaUAzugGOeQEGTNJDx50Hzx3OmEw+KsztLTFWWK
	9wA/fjwJTkqELY2eZNRt8x+O+6u/w+oHfl1qZ8ognu5KsMZt/vH1PekVVtaEVYTCzdrH
	sxtA==
X-Received: by 10.66.193.199 with SMTP id hq7mr16732033pac.183.1370917678241; 
	Mon, 10 Jun 2013 19:27:58 -0700 (PDT)
Received: from [10.32.109.148] ([12.250.97.26])
	by mx.google.com with ESMTPSA id
	i16sm17716170pag.18.2013.06.10.19.27.57 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Jun 2013 19:27:57 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1103bc7c76faba1db73f4c4f4b8439aa03258c3d.1370906102.git.chris_larson@mentor.com>
Date: Mon, 10 Jun 2013 19:27:56 -0700
Message-Id: <CDA933DF-D293-44E1-958E-55F51953C35F@gmail.com>
References: <cover.1370906102.git.chris_larson@mentor.com>
	<1103bc7c76faba1db73f4c4f4b8439aa03258c3d.1370906102.git.chris_larson@mentor.com>
To: Christopher Larson <kergoth@gmail.com>
X-Mailer: Apple Mail (2.1508)
Cc: Christopher Larson <chris_larson@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 1/4] packagegroup-core-tools-profile: don't exclude mips
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
X-List-Received-Date: Tue, 11 Jun 2013 02:27:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Jun 10, 2013, at 4:15 PM, Christopher Larson <kergoth@gmail.com> =
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>=20
> Now that liburcu supports mips, this packagegroup can pull in lttng =
recipes
> (lttng-ust, lttng-tools, lttng-modules, babeltrace) on that =
architecture as it
> does for the others.

it still does not work on mips64 though. but thats another patch =
probably.=20

>=20
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> ---
> .../packagegroups/packagegroup-core-tools-profile.bb          | 11 =
-----------
> 1 file changed, 11 deletions(-)
>=20
> diff --git =
a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb =
b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> index 8f40c4e..bb1b78b 100644
> --- =
a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> +++ =
b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
> @@ -48,22 +48,15 @@ SYSTEMTAP_aarch64 =3D ""
>=20
> LTTNGUST =3D "lttng-ust"
> LTTNGUST_libc-uclibc =3D ""
> -LTTNGUST_mips =3D ""
> LTTNGUST_aarch64 =3D ""
>=20
> -# lttng-tools, lttng-modules and babeltrace all depend on liburcu
> -# which currentl doesn't build on mips
> -
> LTTNGTOOLS =3D "lttng-tools"
> -LTTNGTOOLS_mips =3D ""
> LTTNGTOOLS_aarch64 =3D ""
>=20
> LTTNGMODULES =3D "lttng-modules"
> -LTTNGMODULES_mips =3D ""
> LTTNGMODULES_aarch64 =3D ""
>=20
> BABELTRACE =3D "babeltrace"
> -BABELTRACE_mips =3D ""
> BABELTRACE_aarch64 =3D ""
>=20
> # valgrind does not work on mips
> @@ -77,10 +70,6 @@ VALGRIND_aarch64 =3D ""
> #    exmap-console
> #    exmap-server
>=20
> -# At present we only build lttng-ust on
> -# qemux86/qemux86-64/qemuppc/qemuarm/emenlow/atom-pc since upstream =
liburcu
> -# (which is required by lttng-ust) may not build on other platforms, =
like
> -# MIPS.
> RDEPENDS_${PN} =3D "\
>     ${PROFILETOOLS} \
>     ${LTTNGUST} \
> --=20
> 1.8.3
>=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


