Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D636600EA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 17:28:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v2GHS3fp014112
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Mar 2017 10:28:03 -0700
Received: from ALA-MBC.corp.ad.wrs.com ([fe80::fcbe:9b7:1141:89a1]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0294.000;
	Thu, 16 Mar 2017 10:28:02 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [oe-core][v2][PATCH 1/1] build-compare: add date to PV
Thread-Index: AQHSnnlwphqOQZtzeE2b2xuJZk1V8qGXtgsA
Date: Thu, 16 Mar 2017 17:28:02 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84CF2971C7@ALA-MBC.corp.ad.wrs.com>
References: <1489684755-27165-1-git-send-email-jslater@windriver.com>
In-Reply-To: <1489684755-27165-1-git-send-email-jslater@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.160]
MIME-Version: 1.0
Subject: Re: [v2][PATCH 1/1] build-compare: add date to PV
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
X-List-Received-Date: Thu, 16 Mar 2017 17:28:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Given that PV for *_git recipes should now be specified and
start with a version, it would be nice to shorten (or eliminate)
SRCPV.  At least get rid of the AUTOINC.  Perhaps shorten the
amount of SRCREV included.  The point is that as currently
computed, PV will be far longer than the useful information
it provides.

Also, should PE be defined given that the form of PV has changed?
I know it hasn't been for any of the recipes modified so far.

Joe


> -----Original Message-----
> From: Joe Slater [mailto:jslater@windriver.com]
> Sent: Thursday, March 16, 2017 10:19 AM
> To: openembedded-core@lists.openembedded.org
> Cc: Slater, Joseph
> Subject: [oe-core][v2][PATCH 1/1] build-compare: add date to PV
>=20
> We want PV values to be easily ordered, so
> use the latest entry in build-compare.changes which
> will also match the date of SRCREV.
>=20
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../build-compare/build-compare_git.bb             |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/recipes-devtools/build-compare/build-compare_git.bb b/m=
eta/recipes-
> devtools/build-compare/build-compare_git.bb
> index eb12e40..bdbad03 100644
> --- a/meta/recipes-devtools/build-compare/build-compare_git.bb
> +++ b/meta/recipes-devtools/build-compare/build-compare_git.bb
> @@ -17,8 +17,10 @@ SRC_URI =3D "git://github.com/openSUSE/build-compare.g=
it \
>             file://functions.sh-improve-deb-and-ipk-checking.patch \
>             "
>=20
> +# Date matches entry in build-compare.changes and date of SRCREV.
> +#
>  SRCREV =3D "c5352c054c6ef15735da31b76d6d88620f4aff0a"
> -PV =3D "git+${SRCPV}"
> +PV =3D "2015.02.10+git${SRCPV}"
>=20
>  S =3D "${WORKDIR}/git"
>=20
> --
> 1.7.9.5


