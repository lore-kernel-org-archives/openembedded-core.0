Return-Path: <anuj.mittal@intel.com>
X-Greylist: delayed 427 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 05 Feb 2020 00:51:44 UTC
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8905B60674
	for <openembedded-core@openembedded.org>;
	Wed,  5 Feb 2020 00:51:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Feb 2020 16:44:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,403,1574150400"; d="scan'208";a="224485547"
Received: from kmsmsx153.gar.corp.intel.com ([172.21.73.88])
	by orsmga008.jf.intel.com with ESMTP; 04 Feb 2020 16:44:37 -0800
Received: from pgsmsx101.gar.corp.intel.com ([169.254.1.131]) by
	KMSMSX153.gar.corp.intel.com ([169.254.5.66]) with mapi id
	14.03.0439.000; Wed, 5 Feb 2020 08:44:36 +0800
From: "Mittal, Anuj" <anuj.mittal@intel.com>
To: Armin Kuster <akuster808@gmail.com>, "openembedded-core@openembedded.org"
	<openembedded-core@openembedded.org>
Thread-Topic: [OE-core] [zeus 5/8] bzip2: Fix CVE-2019-12900
Thread-Index: AQHV22za66PoEgViUUCSMCOExtU3m6gLwmSQ
Date: Wed, 5 Feb 2020 00:44:36 +0000
Message-ID: <C0207330DF60C5409302EC78C3FE68F3033F5C46@PGSMSX101.gar.corp.intel.com>
References: <cover.1580828664.git.akuster808@gmail.com>
	<c29059a8c2ecb18f32439b0880e9d6b2362b0036.1580828664.git.akuster808@gmail.com>
In-Reply-To: <c29059a8c2ecb18f32439b0880e9d6b2362b0036.1580828664.git.akuster808@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYTg3MTBmMmEtZDM1Ni00ZjdlLTkyNjMtNmIzMmQzNjZiM2UzIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiMWxSXC9ZUGo2N1RnSDB2NFwvTXRzc3Q5Z1wvT1hsMlZQeTNKM2o5bmMrR2QrOXF6UlBRUlZxZnFNNHk3QzBnc0lrSSJ9
x-originating-ip: [172.30.20.206]
MIME-Version: 1.0
Subject: Re: [zeus 5/8] bzip2: Fix CVE-2019-12900
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
X-List-Received-Date: Wed, 05 Feb 2020 00:51:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I think this should be reverted. Sorry, I had given comments at the time pa=
tch was sent but missed this in zeus review.

http://lists.openembedded.org/pipermail/openembedded-core/2020-January/2918=
26.html

This CVE is not applicable to 1.0.7. This is not failing because the CVE pa=
tch file is not included in SRC_URI in recipe.

Thanks,

Anuj=20

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org <openembedded-core=
-
> bounces@lists.openembedded.org> On Behalf Of Armin Kuster
> Sent: Tuesday, February 4, 2020 11:06 PM
> To: openembedded-core@openembedded.org
> Subject: [OE-core] [zeus 5/8] bzip2: Fix CVE-2019-12900
>=20
> From: Sana Kazi <Sana.Kazi@kpit.com>
>=20
> Added patch for CVE-2019-12900 as backport from upstream.
> Fixes out of bound access discovered while fuzzying karchive.
>=20
> Tested by: Sana.Kazi@kpit.com
>=20
> Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../bzip2/bzip2-1.0.6/CVE-2019-12900.patch    | 36 +++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-
> 12900.patch
>=20
> diff --git a/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> new file mode 100644
> index 0000000000..9859d9d1a2
> --- /dev/null
> +++ b/meta/recipes-extended/bzip2/bzip2-1.0.6/CVE-2019-12900.patch
> @@ -0,0 +1,36 @@
> +From 74de1e2e6ffc9d51ef9824db71a8ffee5962cdbc Mon Sep 17 00:00:00 2001
> +From: Albert Astals Cid <aacid@kde.org>
> +Date: Tue, 28 May 2019 19:35:18 +0200
> +Subject: [PATCH] Make sure nSelectors is not out of range
> +
> +nSelectors is used in a loop from 0 to nSelectors to access selectorMtf
> +which is
> +UChar    selectorMtf[BZ_MAX_SELECTORS];
> +so if nSelectors is bigger than BZ_MAX_SELECTORS it'll do an invalid
> +memory access Fixes out of bounds access discovered while fuzzying
> +karchive
> +
> +Link:
> +https://gitlab.com/federicomenaquintero/bzip2/commit/74de1e2e6ffc9d51ef
> +9824db71a8ffee5962cdbc.patch
> +
> +Upstream-Status: Backport
> +CVE: CVE-2019-12900.patch
> +Signed-off-by: Saloni Jain <Saloni.Jain@kpit.com>
> +---
> + decompress.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/decompress.c b/decompress.c index ab6a624..f3db91d 100644
> +--- a/decompress.c
> ++++ b/decompress.c
> +@@ -287,7 +287,7 @@ Int32 BZ2_decompress ( DState* s )
> +       GET_BITS(BZ_X_SELECTOR_1, nGroups, 3);
> +       if (nGroups < 2 || nGroups > 6) RETURN(BZ_DATA_ERROR);
> +       GET_BITS(BZ_X_SELECTOR_2, nSelectors, 15);
> +-      if (nSelectors < 1) RETURN(BZ_DATA_ERROR);
> ++      if (nSelectors < 1 || nSelectors > BZ_MAX_SELECTORS)
> ++ RETURN(BZ_DATA_ERROR);
> +       for (i =3D 0; i < nSelectors; i++) {
> +          j =3D 0;
> +          while (True) {
> +--
> +2.22.0
> --
> 2.17.1
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

